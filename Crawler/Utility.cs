using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Configuration;
using HtmlAgilityPack;

namespace CrawlBonBanh
{
    public class Utility
    {
        public static string ugent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36";
        private const string socketAddress = "127.0.0.1";
        private const int socketPort = 9150;

        private static int SecondOfSleepTimeFrom = 2; //System.Convert.ToInt32(ConfigurationSettings.AppSettings["SecondOfSleepTimeFrom"].ToString());
        private static int SecondOfSleepTimeTo = 2;  //System.Convert.ToInt32(ConfigurationSettings.AppSettings["SecondOfSleepTimeTo"].ToString());

        private static void Sleep()
        {
            
            int random = new Random().Next(SecondOfSleepTimeFrom, SecondOfSleepTimeTo);
            Thread.Sleep(random);
            //Thread.Sleep(1000);
        }
        
        public static string CrawlHTML(string urlAddress)
        {
            try
            {
                var cookieCollection = GetCookieCollection(urlAddress);
                Sleep();
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlAddress);
                if (cookieCollection != null && cookieCollection.Count > 0)
                {
                    request.CookieContainer = new CookieContainer();
                    request.CookieContainer.Add(cookieCollection);
                }
                request.Host = "s.qplay.vn";
                request.UserAgent = ugent;
                request.Timeout = 30000;

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    Stream receiveStream = response.GetResponseStream();
                    StreamReader readStream = null;

                    if (response.CharacterSet == null)
                    {
                        readStream = new StreamReader(receiveStream);
                    }
                    else
                    {
                        readStream = new StreamReader(receiveStream, Encoding.GetEncoding(response.CharacterSet));
                    }

                    string data = readStream.ReadToEnd();

                    response.Close();
                    readStream.Close();
                    return data;
                }
                response.Close();
                return string.Empty;
            }
            catch (Exception ex)
            {
                return string.Empty;
            }

        }
        public static string CrawlHTMLNotCookie(string urlAddress)
        {
            Sleep();
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlAddress);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            if (response.StatusCode == HttpStatusCode.OK)
            {
                Stream receiveStream = response.GetResponseStream();
                StreamReader readStream = null;

                if (response.CharacterSet == null)
                {
                    readStream = new StreamReader(receiveStream);
                }
                else
                {
                    readStream = new StreamReader(receiveStream, Encoding.GetEncoding(response.CharacterSet));
                }

                string data = readStream.ReadToEnd();

                response.Close();
                readStream.Close();
                return data;
            }
            return string.Empty;
        }

        private static CookieCollection GetCookieCollection(string linkAddress)
        {
            if (string.IsNullOrEmpty(linkAddress))
            {
                return null;
            }

            Sleep();
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(linkAddress);
                request.KeepAlive = false;
                request.Timeout = 15000;
                request.Host = "s.qplay.vn";
                request.UserAgent = ugent;
                request.CookieContainer = new CookieContainer();
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                response.Close();
                return response.Cookies;
            }
            catch (Exception)
            {
                return null;
            }

        }
        private static CookieCollection GetCookieCollection(string linkAddress, WebProxy proxy)
        {
            if (string.IsNullOrEmpty(linkAddress))
            {
                return null;
            }

            Sleep();
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(linkAddress);
                request.KeepAlive = true;
                request.ProtocolVersion = HttpVersion.Version10;
                request.Proxy = proxy;
                //request.Host = "s.qplay.vn";
                request.UserAgent = ugent;
                request.CookieContainer = new CookieContainer();
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                response.Close();
                return response.Cookies;
            }
            catch (Exception)
            {
                return null;
            }
        }

        #region Check Change IP
        private static bool IsBlackList()
        {
            int page = new Random().Next(1001, 1010);
            string urlCrawl = "http://s.qplay.vn/?page=" + page;

            var html = CrawlHTML(urlCrawl);
            var autoIDs = GetAutoIDs(html);

            html = CrawlHTML(urlCrawl);
            var autoIDs2 = GetAutoIDs(html);

            if (string.IsNullOrEmpty(autoIDs) || string.IsNullOrEmpty(autoIDs2))
            {
                return true;
            }

            bool isSame = Comparer(autoIDs2, autoIDs); //thêm tin mới
            if (!isSame)
            {
                isSame = Comparer(autoIDs, autoIDs2); //so sánh đảo lại, có thể là xóa tin
                if (!isSame)
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// so sánh 2 chuỗi ID trả về, nếu chuỗi newAutoIDs kế thừa chuỗi oldAutoIDs thì là true
        /// oldAutoIDs: 3 4 5 6 7 và newAutoIDs: 1 2 3 4 5 (với giả thiết là 1 2 là 2 tin mới thêm vào list) ==>  true
        /// oldAutoIDs: 3 4 5 6 7 và newAutoIDs: 7 8 12 4 5 (với giả thiết newAutoIDs bị random) ==>  false
        /// </summary>
        private static bool Comparer(string newAutoIDs, string oldAutoIDs)
        {
            bool isNormal = false;
            string[] autoID = newAutoIDs.Split(',');
            string[] oldID = oldAutoIDs.Split(',');
            for (var i = 0; i < autoID.Length; i++)
            {
                var currentAutoID = autoID[i];
                var currentOldID = oldID[0];
                if (currentAutoID == currentOldID)
                {
                    isNormal = true;
                    //nếu bắt đầu có id của xe cũ thì set tiếp từ đó về sau có lần lượt giống nhau không, nếu không thì là false
                    for (var k = 0; k < oldID.Length - i; k++)
                    {
                        if (autoID[i + k] != oldID[k])
                        {
                            //Console.Write("|" + autoID[i + k] + " VS " + oldID[k] + "|");
                            return false;
                        }
                        //else Console.Write("{" + autoID[i + k] + "}");
                    }
                    break;
                }
                //else Console.Write("[" + currentAutoID + "]");
            }
            //Console.WriteLine();
            return isNormal;
        }



        private static string GetAutoIDs(string html)
        {
            //Mã: 445871
            MatchCollection matches = Regex.Matches(html, @"Mã: \d+");
            string returnString = string.Empty;
            foreach (Match match in matches)
            {
                returnString += match.ToString().Replace("Mã: ", string.Empty).Trim() + ",";
            }
            return returnString.TrimEnd(',');
        }

        #endregion

        public static IList<string> ExtractAllValueUsingXPath(string text, string xPath)
        {
            IList<string> list = new List<string>();
            IList<string> result;
            try
            {
                HtmlDocument htmlDocument = new HtmlDocument();
                htmlDocument.LoadHtml(text);
                HtmlNodeCollection htmlNodeCollection = htmlDocument.DocumentNode.SelectNodes(xPath);
                foreach (HtmlNode current in (IEnumerable<HtmlNode>)htmlNodeCollection)
                {
                    list.Add(current.OuterHtml);
                }
                result = list;
            }
            catch
            {
                result = list;
            }
            return result;
        }

        public static string ExtractValueUsingXPath(string text, string xPath)
        {
            string result;
            try
            {
                HtmlDocument htmlDocument = new HtmlDocument();
                htmlDocument.LoadHtml(text);
                HtmlNode htmlNode = htmlDocument.DocumentNode.SelectSingleNode(xPath);
                if (htmlNode != null)
                {
                    result = htmlNode.OuterHtml;
                }
                else
                {
                    result = string.Empty;
                }
            }
            catch
            {
                result = string.Empty;
            }
            return result;
        }
        public static string GetValueFromNodeByAttribute(string text, string attributeName)
        {
            string result;
            try
            {
                HtmlDocument htmlDocument = new HtmlDocument();
                htmlDocument.LoadHtml(text);
                result = htmlDocument.DocumentNode.FirstChild.GetAttributeValue(attributeName, string.Empty);
            }
            catch
            {
                result = string.Empty;
            }
            return result;
        }
        public static string RemoveHTMLTag(string htmlString)
        {
            if (string.IsNullOrEmpty(htmlString)) return string.Empty;
            string pattern = @"(<[^>]+>)";
            string text = System.Text.RegularExpressions.Regex.Replace(htmlString, pattern, string.Empty);
            return text;
        }
    }
}
