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
        public DateTime? DateSynced { get; set; }
        public int CountSynced { get; set; }
        public int LinkType { get; set; }
        public string LinkDownload { get; set; }
        public int GameType { get; set; }
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
        public DateTime? DateSynced { get; set; }
        public DateTime? DateModify { get; set; }
        public string Link { get; set; }
        public int LinkId { get; set; }
    }

	public class Apps : ModalsBase
	{
		public Apps()
		{
			IsLocal = false;
			AppPartner = "Sunnet";
			AppPublish = DateTime.Now;
			AppCatID = 96;
			AppActive = true;
		}
		public int AppIDOld { get; set; }
		public string AppName { get; set; }
		public string AppDes { get; set; }
		public string AppContent { get; set; }
		public string AppImage { get; set; }
		public string AppIcon { get; set; }
		public string AppLinkDownload { get; set; }
		public string AppPartner { get; set; }
		public string AppSize { get; set; }
		public int AppDownloadCount { get; set; }
		public bool IsLocal { get; set; }
		public int AppCatID { get; set; }
		public DateTime AppPublish { get; set; }
		public bool AppActive { get; set; }
		public string AppCategory { get; set; }
	}


}
