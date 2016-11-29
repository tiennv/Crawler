using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CrawlBonBanh;

namespace Crawler
{
    class Program
    {
        static void Main(string[] args)
        {
            var data = Utility.CrawlHTML("http://s.qplay.vn");

            var items = new List<string>();

            var div = Utility.ExtractAllValueUsingXPath(data, @"//div[@class='scroll row2 clearfix row2_1']");
            foreach(var item in div)
            {
                var itemA = Utility.ExtractValueUsingXPath(item, @"//div/a");
                var href = Utility.GetValueFromNodeByAttribute(itemA, @"href");
                var img = Utility.ExtractValueUsingXPath(itemA, @"//img");
                var src = Utility.GetValueFromNodeByAttribute(img, @"src");
                var devDes = Utility.ExtractValueUsingXPath(item, @"//div[@id='info']/span[@class='mid_info']");
                var des = Utility.GetValueFromSpan(devDes, @"//span[@class='mid_info']");
                var itemDownload = Utility.ExtractValueUsingXPath(item, @"//a[@class='download_1']");
                var linkDownload = Utility.GetValueFromNodeByAttribute(itemDownload, @"href");
                var objLink = new Links
                {
                    Avatar = src,
                    Link = href,
                    Description = des,
                    LinkType = 2,
                    LinkDownload = linkDownload
                };
                Console.WriteLine(linkDownload);
            }
            //foreach(var item in resp)
            //{
            //    var href = Utility.GetValueFromNodeByAttribute(item, @"href");
            //    Console.WriteLine(href);
            //}
            
            Console.Read();
        }

        static readonly RepositoryLinks _repoLinks = new RepositoryLinks();
        static void GetLinkDetail()
        {
            int pageIndex = 20;
            string urlFormat = "http://s.qplay.vn/?page={0}";
            for(int i = 1; i<= pageIndex; i++)
            {
                var url = String.Format(urlFormat, i);
                var data = Utility.CrawlHTML(url);
                var items = new List<string>();
                var resp = Utility.ExtractAllValueUsingXPath(data, @"//div[@id='info']/a");
                foreach (var item in resp)
                {
                    var href = Utility.GetValueFromNodeByAttribute(item, @"href");
                    Console.WriteLine(i + ": http://s.qplay.vn/" + href);
                }
            }
            Console.WriteLine("OK");
            Console.Read();
        }
    }
}
