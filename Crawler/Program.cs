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
        static string domain = "http://s.qplay.vn";
        static void Main(string[] args)
        {
            try
            {
                
                //GetLinkDetailiOs();
                var objLinks = _repoLinks.GetByGameType(200, 1);
                foreach (var item in objLinks)
                {
                    GetDetailiOS(item);
                }
                Console.WriteLine("OK");
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.Read();
            //GetLinkDetail();
            //var data = Utility.CrawlHTML(domain);
            //var items = new List<string>();
            //var div = Utility.ExtractAllValueUsingXPath(data, @"//div[@class='scroll row2 clearfix row2_1']");
            //foreach(var item in div)
            //{
            //    var itemA = Utility.ExtractValueUsingXPath(item, @"//div/a");
            //    var href = Utility.GetValueFromNodeByAttribute(itemA, @"href");
            //    var img = Utility.ExtractValueUsingXPath(itemA, @"//img");
            //    var src = Utility.GetValueFromNodeByAttribute(img, @"src");
            //    var devDes = Utility.ExtractValueUsingXPath(item, @"//div[@id='info']/span[@class='mid_info']");
            //    var des = Utility.GetValueFromSpan(devDes, @"//span[@class='mid_info']");
            //    var itemDownload = Utility.ExtractValueUsingXPath(item, @"//a[@class='download_1']");
            //    var linkDownload = Utility.GetValueFromNodeByAttribute(itemDownload, @"href");
            //    var divTitle = Utility.ExtractValueUsingXPath(item, @"//div[@id='info']/a/b/span");
            //    var title = Utility.GetValueFromSpan(divTitle, @"//span");
            //    var objLink = new Links
            //    {
            //        Avatar = src,
            //        Link = href,
            //        Description = des,
            //        LinkType = 2,
            //        LinkDownload = linkDownload,
            //        Title = title
            //    };                
            //}           
            //Console.Read();
        }

        static readonly RepositoryLinks _repoLinks = new RepositoryLinks();
        static readonly RepositoryContents _repoContents = new RepositoryContents();

        static void GetLinkDetail()
        {
            int pageIndex = 20;
            string urlFormat = "http://s.qplay.vn/?page={0}";
            for(int i = 1; i<= pageIndex; i++)
            {
                var url = String.Format(urlFormat, i);
                var data = Utility.CrawlHTML(url);
                var items = new List<string>();
                var div = Utility.ExtractAllValueUsingXPath(data, @"//div[@class='scroll row2 clearfix row2_1']");
                foreach (var item in div)
                {
                    var itemA = Utility.ExtractValueUsingXPath(item, @"//div/a");
                    var href = Utility.GetValueFromNodeByAttribute(itemA, @"href");
                    var img = Utility.ExtractValueUsingXPath(itemA, @"//img");
                    var src = Utility.GetValueFromNodeByAttribute(img, @"src");
                    var devDes = Utility.ExtractValueUsingXPath(item, @"//div[@id='info']/span[@class='mid_info']");
                    var des = Utility.GetValueFromSpan(devDes, @"//span[@class='mid_info']");
                    var itemDownload = Utility.ExtractValueUsingXPath(item, @"//a[@class='download_1']");
                    var linkDownload = Utility.GetValueFromNodeByAttribute(itemDownload, @"href");
                    var divTitle = Utility.ExtractValueUsingXPath(item, @"//div[@id='info']/a/b/span");
                    var title = Utility.GetValueFromSpan(divTitle, @"//span");
                    var objLink = new Links
                    {
                        Avatar = domain + src,
                        Link = domain + href,
                        Description = des,
                        LinkType = 2,
                        LinkDownload = domain + linkDownload,
                        Title = title,
                        DateCrawler = DateTime.Now,
                        GameType = 0
                    };

                    _repoLinks.Add(objLink);
                }
                //var url = String.Format(urlFormat, i);
                //var data = Utility.CrawlHTML(url);
                //var items = new List<string>();
                //var resp = Utility.ExtractAllValueUsingXPath(data, @"//div[@id='info']/a");
                //foreach (var item in resp)
                //{
                //    var href = Utility.GetValueFromNodeByAttribute(item, @"href");
                //    Console.WriteLine(i + ": http://s.qplay.vn/" + href);
                //}
            }
            Console.WriteLine("OK");
            Console.Read();
        }

        static void GetLinkDetailiOs()
        {
            var url = "https://itunes.apple.com/vn/developer/sunnet-information-technology/id484411306";
            var data = Utility.CrawlHTML(url, "itunes.apple.com");
            var items = new List<string>();
            var div = Utility.ExtractAllValueUsingXPath(data, @"//div[@class='swoosh lockup-container large album']/div[@class='content']/div");
            foreach(var item in div)
            {
                var divList = Utility.ExtractAllValueUsingXPath(item, @"//div[@class='lockup small application']");
                foreach (var divItem in divList)
                {
                    var a = Utility.ExtractValueUsingXPath(divItem, @"//div/a");
                    var link = Utility.GetValueFromNodeByAttribute(a, @"href");
                    var img = Utility.ExtractValueUsingXPath(a, @"//img");
                    var src = Utility.GetValueFromNodeByAttribute(img, @"src-swap-high-dpi");
                    var title = Utility.GetValueFromNodeByAttribute(img, @"alt");
                    var objLink = new Links
                    {
                        Avatar = src,
                        DateCrawler = DateTime.Now,
                        GameType = 1,
                        Link = link,
                        Title = title,
                        LinkType = 2                        
                    };

                    int inserted = _repoLinks.Add(objLink);
                    Console.WriteLine(inserted);
                }
            }
            
            Console.Read();
        }

        static void GetDetailiOS(Links objLink)
        {
            var url = objLink.Link;
            var data = Utility.CrawlHTML(url, "itunes.apple.com");
            var divContent = Utility.ExtractValueUsingXPath(data, @"//div[@class='product-review']");
            var content = Utility.GetValueFromSpan(Utility.ExtractValueUsingXPath(divContent, "//div/p"),"p");
            var divImage = Utility.ExtractValueUsingXPath(data, @"//div[@class='swoosh lockup-container application large screenshots']");            
            var listImg = Utility.GetAllImageInHtml(divImage);

            var objDetail = new Contents
            {
                AvatarBig = objLink.Avatar,
                Title = objLink.Title,
                Content = content,
                Link = objLink.Link,
                ImageContent = listImg == null || listImg.Count == 0 ? "" : String.Join(",", listImg),                
                DateSynced = DateTime.Now,
                Avatar = objLink.Avatar,
                Description = objLink.Description,
                LinkDownload = url,
                LinkId = objLink.Id
            };

            var inserted = _repoContents.Add(objDetail);
            if (inserted > 0)
            {
                objLink.DateSynced = DateTime.Now;
                _repoLinks.Update(objLink);
            }

            //Console.WriteLine(divContent);
            //Console.Read();
        }

        static void GetDetail(Links objLink)
        {

            // Kiem tra Id da synced chua?


            //objLink.Link = "http://s.qplay.vn/1842-0-0-0--1/game/Ba-gia-toc-do.html";
            var data = Utility.CrawlHTML(objLink.Link);
            var divContent = Utility.ExtractValueUsingXPath(data, @"//div[@id='main']");

            var title = Utility.GetValueFromSpan(divContent, @"//div/a/b");
            var divImg = Utility.ExtractValueUsingXPath(divContent, @"//div[@class='poster']/img");
            var imgBig = domain + Utility.GetValueFromNodeByAttribute(divImg, "src");
            var content = Utility.GetValueFromSpan(Utility.ExtractValueUsingXPath(divContent, @"//div/div/div/span[@class='about']"), "span");
            var imgList = Utility.ExtractAllValueUsingXPath(divContent, @"//ul[@id='slider-one']/li");
            var sizeContent = Utility.GetValueFromSpan(Utility.ExtractAllValueUsingXPath(divContent, @"//div/div/div/span")[1], "span");
            var downloadCount = Utility.GetValueFromSpan(sizeContent, @"span");
            var imgContents = new List<string>();
            foreach(var itemImg in imgList)
            {
                var img = domain + Utility.GetValueFromNodeByAttribute(Utility.ExtractValueUsingXPath(itemImg, @"//img"), "src");
                imgContents.Add(img);
            }

            var objDetail = new Contents
            {
                AvatarBig = imgBig,
                Title = title,
                Content = content,
                Link = objLink.Link,
                ImageContent = imgContents==null || imgContents.Count==0? "" : String.Join(",", imgList),
                Size = sizeContent,
                DateSynced = DateTime.Now,
                Avatar = objLink.Avatar,
                Description = objLink.Description,
                LinkDownload = objLink.LinkDownload,
                LinkId = objLink.Id
            };

            var inserted = _repoContents.Add(objDetail);
            if (inserted > 0)
            {
                objLink.DateSynced = DateTime.Now;
                _repoLinks.Update(objLink);
            }
            
        }

    }
}
