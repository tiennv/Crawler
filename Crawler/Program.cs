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

            var resp = Utility.ExtractAllValueUsingXPath(data, @"//div[@id='info']/a");
            foreach(var item in resp)
            {
                var href = Utility.GetValueFromNodeByAttribute(item, @"href");
                Console.WriteLine(href);
            }
            
            Console.Read();
        }
    }
}
