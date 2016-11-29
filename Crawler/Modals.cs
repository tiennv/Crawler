using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crawler
{
    public class ModalsBase
    {
        public int Id { get; set; }
    }

    public class Sites : ModalsBase
    {
        public string SiteUrl { get; set; }
    }

    public class Links : ModalsBase
    {        
        public string Link { get; set; }
        public int SiteId { get; set; }
        public string Avatar { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime DateCrawler { get; set; }
        public DateTime DateSynced { get; set; }
        public int CountSynced { get; set; }
        public int LinkType { get; set; }
    }

    public class Contents : ModalsBase
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string Avatar { get; set; }
        public string Size { get; set; }
        public string Download { get; set; }
        public string LinkDownload { get; set; }
        public string AvatarBig { get; set; }
        public string ImageContent { get; set; }
        public DateTime DateSynced { get; set; }
        public DateTime DateModify { get; set; }
    }


}
