USE [master]
GO
/****** Object:  Database [Crawler]    Script Date: 11/29/2016 3:54:03 PM ******/
CREATE DATABASE [Crawler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Crawler', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Crawler.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Crawler_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Crawler_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Crawler] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Crawler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Crawler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Crawler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Crawler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Crawler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Crawler] SET ARITHABORT OFF 
GO
ALTER DATABASE [Crawler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Crawler] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Crawler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Crawler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Crawler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Crawler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Crawler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Crawler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Crawler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Crawler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Crawler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Crawler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Crawler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Crawler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Crawler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Crawler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Crawler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Crawler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Crawler] SET RECOVERY FULL 
GO
ALTER DATABASE [Crawler] SET  MULTI_USER 
GO
ALTER DATABASE [Crawler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Crawler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Crawler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Crawler] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Crawler', N'ON'
GO
USE [Crawler]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 11/29/2016 3:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](2000) NULL,
	[Content] [nvarchar](max) NULL,
	[Avatar] [varchar](2000) NULL,
	[Size] [nvarchar](2000) NULL,
	[Download] [nvarchar](2000) NULL,
	[LinkDownload] [varchar](2000) NULL,
	[AvatarBig] [varchar](2000) NULL,
	[ImageContent] [varchar](max) NULL,
	[DateSynced] [datetime] NULL,
	[DateModify] [datetime] NULL,
	[Link] [varchar](2000) NOT NULL,
	[LinkId] [int] NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Links]    Script Date: 11/29/2016 3:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Link] [varchar](1000) NOT NULL,
	[SiteId] [int] NOT NULL,
	[Avatar] [varchar](2000) NULL,
	[Title] [nvarchar](2000) NULL,
	[Description] [nvarchar](2000) NULL,
	[DateCrawler] [datetime] NULL,
	[DateSynced] [datetime] NULL,
	[CountSynced] [int] NULL,
	[LinkType] [int] NULL,
	[LinkDownload] [varchar](2000) NULL,
	[GameType] [int] NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 11/29/2016 3:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiteUrl] [varchar](200) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contents] ON 

INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (2, N'Super Spy Cat', N'Rambo Combat - Biệt đội thú cưng

Nếu như bạn đã tham gia các cuộc chơi, đấu súng trên giả lập thì bạn chắc chắn không nên bỏ qua cuộc đại chiến Rambo Combat.
Lấy hình tượng nhân vật cực chuẩn là Mèo - Chuột (những con vật chiến đấu không có hồi kết) để tạo nên một trò chơi cực sáng tạo và ngộ nghĩnh.
Không giống như những thể loại trò chơi bắn súng thông thường. Lối chơi ở Rambo Combat cũng khiến cho người chơi cuốn hút hơn bởi những nhân vật có khả năng tự nhận dạng địch và di chuyển khéo léo, những hiệu ứng âm thanh góp phần tạo nên một sự thành công cuốn hút cho người tham gia chơi.
Hơn 60 bàn chơi được sắp xếp xen kẽ 10 bối cảnh và kho vũ phí được nâng cấp tối ưu tương thích với từng nhiệm vụ được đặt ra trong trò chơi.
Các thành tựu, những giải thưởng hấp dẫn khuyến khích cho người chơi cần đạt được khi tham gia. 
Công nghệ hình ảnh Unity 3D chân thực, với độ sắc nét cao. Giảm thiểu tối đa dung lượng để tích hợp với các dòng máy cơ bản. 
Với những góc hành động khác nhau, xây dựng nhiều bối cảnh  người chơi sẽ có nhiều trải nghiệm và cảm xúc mới mẻ khi tham gia một trò chơi bắn súng. 
Phiên bản chơi hoàn toàn miễn phí, nhưng để có thêm những vũ khí mạnh mẽ hay nâng cấp nhân vật bạn có thể bỏ các khoản chi phí cực nhỏ để nâng cấp hoặc đơn giản hơn là bạn phải "cày" để có được những vũ khí tối ưu nhất cho các cuộc chiến tiếp theo.

Rambo Combat đã có mặt trên đa nền tảng và chờ bạn tham gia', N'
	Rambo Combat - Biệt đội thú cưng
	
	Nếu như bạn đã tham gia các cuộc chơi, đấu súng trên giả lập thì bạn chắc chắn không nên bỏ qua cuộc đại chiến Rambo Combat.
	Lấy hình tượng nhân vật cực chuẩn là Mèo - Chuột (những con vật chiến đấu không có hồi kết) để tạo nên một trò chơi cực sáng tạo và ngộ nghĩnh.
	Không giống như những thể loại trò chơi bắn súng thông thường. Lối chơi ở Rambo Combat cũng khiến cho người chơi cuốn hút hơn bởi những nhân vật có khả năng tự nhận dạng địch và di chuyển khéo léo, những hiệu ứng âm thanh góp phần tạo nên một sự thành công cuốn hút cho người tham gia chơi.
	Hơn 60 bàn chơi được sắp xếp xen kẽ 10 bối cảnh và kho vũ phí được nâng cấp tối ưu tương thích với từng nhiệm vụ được đặt ra trong trò chơi.
	Các thành tựu, những giải thưởng hấp dẫn khuyến khích cho người chơi cần đạt được khi tham gia.
	Công nghệ hình ảnh Unity 3D chân thực, với độ sắc nét cao. Giảm thiểu tối đa dung lượng để tích hợp với các dòng máy cơ bản.
	Với những góc hành động khác nhau, xây dựng nhiều bối cảnh&nbsp; người chơi sẽ có nhiều trải nghiệm và cảm xúc mới mẻ khi tham gia một trò chơi bắn súng.
	Phiên bản chơi hoàn toàn miễn phí, nhưng để có thêm những vũ khí mạnh mẽ hay nâng cấp nhân vật bạn có thể bỏ các khoản chi phí cực nhỏ để nâng cấp hoặc đơn giản hơn là bạn phải "cày" để có được những vũ khí tối ưu nhất cho các cuộc chiến tiếp theo.
	
	Rambo Combat đã có mặt trên đa nền tảng và chờ bạn tham gia
', N'http://s.qplay.vn/images/product/icon/512151214-105450.png', N'
                        	Dung lượng: &#32;
            	36.1Mb
				Lượt tải: &#32;12,755
									', NULL, N'http://s.qplay.vn/3222-0-0-0--1/download/Super-Spy-Cat.html', N'http://s.qplay.vn/images/product/poster/1024-500151214-105524.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/screenshot1151214-105515.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot2151214-105516.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot3151214-105516.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot4151214-105516.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot5151214-105517.png">
		                </li>', CAST(0x0000A6CD0103BACF AS DateTime), NULL, N'http://s.qplay.vn/3222-0-0-0--1/game/Super-Spy-Cat.html', 193)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (3, N'Ai là triệu phú (80000 câu hỏi)', N'Bạn rất yêu thích game show Ai là triệu phú trên VTV3 nhưng lại chưa có cơ hội được tham gia?', N'
	Bạn rất yêu thích game show Ai là triệu phú trên VTV3 nhưng lại chưa có cơ hội được tham gia? Hãy trải nghiệm game Ai là triệu phú Qplay ngay trên dế yêu của mình với phiên bản mới có hỗ trợ âm thanh sẽ tạo cho bạn cảm giác hồi hộp và thú vị như đang ngồi trên ghế nóng thực sự.&nbsp;

	Về cách chơi:&nbsp;

	- Đa phần không khác gì với GameShow thật sự, bạn sẽ phải trả lời 15 câu hỏi trắc nghiệm khách quan với 4 phương án lựa chọn và mức độ khó tăng dần trong thời gian 10 phút.&nbsp;

	- Game ai là triệu phú Qplay tăng bạn 4 quyền trợ giúp: 50/50, gọi điện thoại cho người thân, hỏi ý kiến khán giả trong trường quay và quyền đổi câu hỏi.&nbsp; 

	Bạn hãy sử dụng hình thức chơi trực tuyến để trở thành 1 trong 10 người chơi xuất sắc nhất trong tuần nhận các giải thưởng hấp dẫn từ Sunnet Qplay nhé.
', N'http://s.qplay.vn/images/product/icon/2446805789ai-la-trieu-phu-offline.png', N'
                        	Dung lượng: &#32;
            	8.2Mb
				Lượt tải: &#32;202,926
									', NULL, N'http://s.qplay.vn/36-0-0-0--1/download/Ai-la-trieu-phu-(80000-cau-hoi).html', N'http://s.qplay.vn/images/product/poster/97dbf00ec9ALTP_2000-cau-hoi.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/2ec213cb2eALTP-online1.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3c13071562ALTP-online2.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/114af8330eALTP-online3.jpg">
		                </li>', CAST(0x0000A6CD0103C564 AS DateTime), NULL, N'http://s.qplay.vn/36-0-0-0--1/game/Ai-la-trieu-phu-(80000-cau-hoi).html', 194)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (4, N'Đào vàng (Bản mùa thu)', N'Game đào vàng kinh điển nay đã có mặt trên Android. Bạn sẽ vào vai một "ông già gân" ôm mộng làm giàu giữa vùng Alaska hoang dã. Tuy nhiên chặng đường thành đại gia còn rất dài với nhiều hiểm nguy.', N'
	Game đào vàng phiên bản mùa thu, đầy sắc màu và tràn ngập không khí lãng mạn, nhẹ nhàng, bay bổng.

	- Vượt qua những thử thách khó khăn để đạt mục tiêu

	- Tính toán, cân nhắc khi mua vật phẩm để qua bàn.

	- Khéo léo để tránh những hòm thuốc nổ giăng khắp nơi.

	Hãy cảm nhận không khí mới với phiên bản Đào vàng mùa thu.
', N'http://s.qplay.vn/images/product/icon/c3723ab4f3DV mua thu.png', N'
                        	Dung lượng: &#32;
            	5.3Mb
				Lượt tải: &#32;88,488
									', NULL, N'http://s.qplay.vn/42-0-0-0--1/download/Dao-vang-(Ban-mua-thu).html', N'http://s.qplay.vn/images/product/poster/876f2115d4DV-mua-thu.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/26c674fd80DV-mua-thu-1.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/803b6e0389DV-mua-thu-2.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/a8835b00f0DV-mua-thu3.jpg">
		                </li>', CAST(0x0000A6CD0103C774 AS DateTime), NULL, N'http://s.qplay.vn/42-0-0-0--1/game/Dao-vang-(Ban-mua-thu).html', 195)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (5, N'Đào kim cương', N'Một lão thợ mỏ già cứng cựa với mơ ước làm giàu.
Những mỏ vàng kếch xù dưới lòng đất cùng với lớp đá cứng đầu. Thuốc nổ , dây thừng, xe đẩy … Tất cả đều tạo nên một tựa game đào vàng kinh điển…
Tuy nhiên khi đã cảm thấy công việc đào vàng đã quá nhàm chán. Bạn có thể thử trải nghiệm tựa game mới được phát triển dựa trên dòng game đào vàng vốn đã là huyền thoại.
Vào vai một lão thợ mỏ già yêu vàng, nhưng ở phiên bản này, vàng đã không còn là thứ gì quý giá nữa. Một mỏ kim cương mới được khai thác làm cho lão sáng mắt hơn cả. Tuy nhiên cái gì cũng có giá của nó, những chướng ngại vật ở phiên bản này còn kinh khủng và nguy hiểm hơn rất nhiều. Không phải ai cũng có thể dễ dàng vượt qua được.
Và điều này đành phải nhờ cậy vào chiến thuật chơi game tinh tế và sự khéo léo từ bạn. Hãy giúp lão thợ mỏ già một tay nhé !', N'
	Một lão thợ mỏ già cứng cựa với mơ ước làm giàu.

	Những mỏ vàng kếch xù dưới lòng đất cùng với lớp đá cứng đầu. Thuốc nổ , dây thừng, xe đẩy … Tất cả đều tạo nên một tựa game đào vàng kinh điển…

	Tuy nhiên khi đã cảm thấy công việc đào vàng đã quá nhàm chán. Bạn có thể thử trải nghiệm tựa game mới được phát triển dựa trên dòng game đào vàng vốn đã là huyền thoại.

	Vào vai một lão thợ mỏ già yêu vàng, nhưng ở phiên bản này, vàng đã không còn là thứ gì quý giá nữa. Một mỏ kim cương mới được khai thác làm cho lão sáng mắt hơn cả. Tuy nhiên cái gì cũng có giá của nó, những chướng ngại vật ở phiên bản này còn kinh khủng và nguy hiểm hơn rất nhiều. Không phải ai cũng có thể dễ dàng vượt qua được.

	Và điều này đành phải nhờ cậy vào chiến thuật chơi game tinh tế và sự khéo léo từ bạn. Hãy giúp lão thợ mỏ già một tay nhé !
', N'http://s.qplay.vn/images/product/icon/Icon_dao_kim_cuong_72200713-044844.png', N'
                        	Dung lượng: &#32;
            	5Mb
				Lượt tải: &#32;18,084
									', NULL, N'http://s.qplay.vn/534-0-0-0--1/download/Dao-kim-cuong.html', N'http://s.qplay.vn/images/product/poster/banner200713-044944.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/2013-07-20-15.58.47200713-044935.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2013-07-20-15.59200713-044935.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2013-07-20-16.00200713-044936.jpg">
		                </li>', CAST(0x0000A6CD0103C830 AS DateTime), NULL, N'http://s.qplay.vn/534-0-0-0--1/game/Dao-kim-cuong.html', 196)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (6, N'Đào vàng phiêu lưu', N'Game đào vàng cái tên đã quá quen thuộc với mọi người.Với Đào vàng phiêu lưu phiên bản mới sẽ đem lại sự quấn hút vô cùng đối với mọi người.Game là 1 cuộc phiêu lưu của ông lão từ khi nghèo đói đến lúc giàu sang.
- Cách chơi quen thuộc đơn giản
- Hệ thống nhiệm vụ mới lạ + kì thú
- Các mức độ chơi khác nhau đem lại vô vàn khó khăn cho người chơi
- Hãy chơi và khám phá điều thú vị của Đào vàng phiêu lưu nhé', N'
	Game đào vàng cái tên đã quá quen thuộc với mọi người.Với Đào vàng phiêu lưu phiên bản mới sẽ đem lại sự quấn hút vô cùng đối với mọi người.Game là 1 cuộc phiêu lưu của ông lão từ khi nghèo đói đến lúc giàu sang.

	- Cách chơi quen thuộc đơn giản

	- Hệ thống nhiệm vụ mới lạ + kì thú

	- Các mức độ chơi khác nhau đem lại vô vàn khó khăn cho người chơi

	- Hãy chơi và khám phá điều thú vị của Đào vàng phiêu lưu nhé
', N'http://s.qplay.vn/images/product/icon/72 (1)211212-011016.png', N'
                        	Dung lượng: &#32;
            	12.1Mb
				Lượt tải: &#32;36,505
									', NULL, N'http://s.qplay.vn/147-0-0-0--1/download/Dao-vang-phieu-luu.html', N'http://s.qplay.vn/images/product/poster/dv4800190912-090920.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1211212-011038.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2211212-011039.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3211212-011039.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4211212-011039.jpg">
		                </li>', CAST(0x0000A6CD0103C8ED AS DateTime), NULL, N'http://s.qplay.vn/147-0-0-0--1/game/Dao-vang-phieu-luu.html', 197)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (7, N'Đào vàng (Bản Mùa Xuân)', N'Phiên bản game đào vàng mùa xuân, đầy sắc màu và tràn ngập không khí đón tết. Hãy cùng đào thật nhiều vàng để đón một năm mới may mắn.', N'
	Phiên bản game đào vàng mùa xuân, đầy sắc màu và tràn ngập không khí đón tết.

	Cách chơi :

	- Vượt qua những thử thách khó khăn để đạt mục tiêu

	- Tính toán, cân nhắc khi mua vật phẩm để qua bàn.

	- Khéo léo để tránh những hòm thuốc nổ gIăng khắp nơi.
', N'http://s.qplay.vn/images/product/icon/b271322e93DV mua xuan010213-113910.png', N'
                        	Dung lượng: &#32;
            	5.3Mb
				Lượt tải: &#32;34,297
									', NULL, N'http://s.qplay.vn/365-0-0-0--1/download/Dao-vang-(Ban-Mua-Xuan).html', N'http://s.qplay.vn/images/product/poster/76b6aa36f2DV-mua-xuan-1010213-114008.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/164d55df95DV-mua-xuan-2010213-113847.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/b0be354819DV-mua-xuan-3010213-113847.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/e053f0f16cDV-mua-xuan-1010213-114006.jpg">
		                </li>', CAST(0x0000A6CD0103CAE3 AS DateTime), NULL, N'http://s.qplay.vn/365-0-0-0--1/game/Dao-vang-(Ban-Mua-Xuan).html', 198)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (8, N'Bắn cung siêu đẳng', N'Bắn cung môn thể thao dân tộc lại 1 lần nữa được nhắc đến và tái hiện lại trong trò chơi cùng tên. Bạn có phải là 1 xạ thủ xuất sắc không. Nếu phải thì cùng thử sức nhé.
Cách chơi:
- Ngắm bắn thật chuẩn
- Với nhiều mức độ chơi từ dễ đến khó
- Bảng xếp hạng được update liên tục
Hãy cùng so tài nhé các bạn.', N'
	Bắn cung môn thể thao dân tộc lại 1 lần nữa được nhắc đến và tái hiện lại trong trò chơi cùng tên. Bạn có phải là 1 xạ thủ xuất sắc không. Nếu phải thì cùng thử sức nhé.

	Cách chơi:

	- Ngắm bắn thật chuẩn

	- Với nhiều mức độ chơi từ dễ đến khó

	- Bảng xếp hạng được update liên tục

	Hãy cùng so tài nhé các bạn.
', N'http://s.qplay.vn/images/product/icon/72 (1)081212-092706.png', N'
                        	Dung lượng: &#32;
            	9.2Mb
				Lượt tải: &#32;25,563
									', NULL, N'http://s.qplay.vn/269-0-0-0--1/download/Ban-cung-sieu-dang.html', N'http://s.qplay.vn/images/product/poster/banner480081212-021717.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1081212-021711.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2081212-021711.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3081212-021712.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4081212-021712.jpg">
		                </li>', CAST(0x0000A6CD0103CBC4 AS DateTime), NULL, N'http://s.qplay.vn/269-0-0-0--1/game/Ban-cung-sieu-dang.html', 199)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (9, N'Ếch Săn Mồi', N'Game vui nhộn nhất trên Android đã xuất hiện!
Hãy vào vai chàng Hoàng tử Ếch béo mập và trải nghiệm cuộc sống vui vẻ trên đầm lầy xanh.', N'
	Hãy hóa thân thành chàng Hoàng tử Ếch béo mập và trải nghiệm cuộc sống vui vẻ trên đầm lầy xanh.

	Bạn sẽ &nbsp;giúp chàng Hoàng tử Ếch đói bụng của chúng ta bắt các loại côn trùng và nhớ đừng bắt nhầm lão nhện “đấm bốc” hay lão nhện “trộm vàng” tham lam.

	Chàng Ếch của chúng ta cũng phải hết sức cẩn thận với lão rắn gian ác hay những con chim ưng luôn rình rập.

	Hãy thật vui với game “Hoàng Tử Ếch” nhé!

	&nbsp;
', N'http://s.qplay.vn/images/product/icon/3e0b0683c564.png', N'
                        	Dung lượng: &#32;
            	11.2Mb
				Lượt tải: &#32;18,030
									', NULL, N'http://s.qplay.vn/62-0-0-0--1/download/Ech-San-Moi.html', N'http://s.qplay.vn/images/product/poster/80266c9e1cech-banner.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/device3230812-102145.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device4230812-102221.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen_ech1230812-102221.jpg">
		                </li>', CAST(0x0000A6CD0103CD84 AS DateTime), NULL, N'http://s.qplay.vn/62-0-0-0--1/game/Ech-San-Moi.html', 200)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (10, N'Thánh Gióng về trời', N'Giặc Ân đang xâm phạm bờ cõi nước ta, chúng mặc sức lộng hành và gieo bao tội ác đến những người dân vô tội. Trước cận cảnh nước mất nhà tan đó, Thánh Gióng lớn nhanh như thổi để trở thành 1 tráng sĩ khỏe mạnh, dũng mãnh vô song, cưỡi ngựa sắt, cầm roi sắt xông pha nơi chiến trận, phá tan cường địch. 
Hãy nhập vai vào nhân vật Thánh gióng và tiêu diệt chúng, bảo vệ sự ấm no, tự do và hạnh phúc của Đất nước
* Cách chơi: 
- Nhảy vượt các chướng ngại vật
- Tiêu diệt tất địch trên đường chạy
- Dùng tiền kiếm được để nâng cấp Thánh gióng khỏe hơn
- Có 2 kiểu chơi: 1 kiểu chơi đi bài và 1 kiểu chơi không giới hạn
* Mẹo: 
- Bạn có thể nhảy 2 lần liên tục và tấn công 2 lần liên tục mỗi lần ngựa Thánh gióng tiếp đất
- BẤM và GIỮ nút nhảy và nút tấn công càng lâu thì sẽ nhảy và tấn công càng xa
- Ăn vật phẩm và tấn công liên tiếp địch để ghi được nhiều điểm hơn', N'
	
		Giặc Ân đang xâm phạm bờ cõi nước ta, chúng mặc sức lộng hành và gieo bao tội ác đến những người dân vô tội. Trước cận cảnh nước mất nhà tan đó, Thánh Gióng lớn nhanh như thổi để trở thành 1 tráng sĩ khỏe mạnh, dũng mãnh vô song, cưỡi ngựa sắt, cầm roi sắt xông pha nơi chiến trận, phá tan cường địch.&nbsp;
	
		Hãy nhập vai vào nhân vật Thánh gióng và tiêu diệt chúng, bảo vệ sự ấm no, tự do và hạnh phúc của Đất nước
	
		* Cách chơi:&nbsp;
	
		- Nhảy vượt các chướng ngại vật
	
		- Tiêu diệt tất địch trên đường chạy
	
		- Dùng tiền kiếm được để nâng cấp Thánh gióng khỏe hơn
	
		- Có 2 kiểu chơi: 1 kiểu chơi đi bài và 1 kiểu chơi không giới hạn
	
		* Mẹo:&nbsp;
	
		- Bạn có thể nhảy 2 lần liên tục và tấn công 2 lần liên tục mỗi lần ngựa Thánh gióng tiếp đất
	
		- BẤM và GIỮ nút nhảy và nút tấn công càng lâu thì sẽ nhảy và tấn công càng xa
	
		- Ăn vật phẩm và tấn công liên tiếp địch để ghi được nhiều điểm hơn

', N'http://s.qplay.vn/images/product/icon/icon72x72180413-020637.png', N'
                        	Dung lượng: &#32;
            	16Mb
				Lượt tải: &#32;21,744
									', NULL, N'http://s.qplay.vn/454-0-0-0--1/download/Thanh-Giong-ve-troi.html', N'http://s.qplay.vn/images/product/poster/banner480180413-020716.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/a180413-020709.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/b180413-020709.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/c180413-020709.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/d180413-020709.jpg">
		                </li>', CAST(0x0000A6CD0103CF46 AS DateTime), NULL, N'http://s.qplay.vn/454-0-0-0--1/game/Thanh-Giong-ve-troi.html', 201)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (11, N'Câu cá', N'Bạn đã bao giờ câu cá chưa ? Hãy đến với Câu cá trên Android phiên bản đặc biệt này.Cùng thỏa sức đánh bắt những chú cá từ nhỏ đến to , từ hiền lành đến hung dữ và cùng ngắm các nàng tiên cá bơi lòng trong đại dương xanh ngắt.', N'
	Bạn đã bao giờ câu cá chưa ? Hãy đến với Câu cá trên Android phiên bản đặc biệt này.Cùng thỏa sức đánh bắt những chú cá từ nhỏ đến to , từ hiền lành đến hung dữ và cùng ngắm các nàng tiên cá bơi lòng trong đại dương xanh ngắt.

	- Cách chơi đơn giản nhưng vô cùng thú vị

	- Đồ họa + với âm thanh đẹp mắt sống động

	- Còn đợi gì nữa hãy vác cần và đi câu thôi.
', N'http://s.qplay.vn/images/product/icon/icon72150912-034649.png', N'
                        	Dung lượng: &#32;
            	8.9Mb
				Lượt tải: &#32;38,425
									', NULL, N'http://s.qplay.vn/140-0-0-0--1/download/Cau-ca.html', N'http://s.qplay.vn/images/product/poster/banner480x235150912-034733.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/sc3220912-111844.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sceenshot1220912-111844.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sceenshot3220912-111844.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/SCS2220912-111844.jpg">
		                </li>', CAST(0x0000A6CD0103D213 AS DateTime), NULL, N'http://s.qplay.vn/140-0-0-0--1/game/Cau-ca.html', 202)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (12, N'Bắn gà', N'Bầy Gà Xâm Lăng - Tựa game bắn gà hết sức vui nhộn với hình ảnh đáng yêu - thân thuộc và rất dễ thương. Trải qua nhiều phiên bản từng có mặt trên các store phần mềm - game trên toàn thế giới, game được cải tiến khá nhiều. Từ hệ thống đạn dược, hệ thống boss, hệ thống hành tinh, hệ thống gà. 
Điểm đáng nói nhất là cách điều khiển trong game dễ dàng và game hỗ trợ tất cả các dòng máy Android có trên thị trường từ trước tới nay.
Gameplay phong phú với nhiều màn chơi mang lại cảm giác bất ngờ và thư giản vui vẻ cho mọi người trong mùa hè này.
Hãy cùng chúng thôi tham gia vào cuộc chiến chống lại "Bầy Gà Xâm Lăng" nhé !', N'
	Bầy Gà Xâm Lăng - Tựa game bắn gà hết sức vui nhộn với hình ảnh đáng yêu - thân thuộc và rất dễ thương. Trải qua nhiều phiên bản từng có mặt trên các store phần mềm - game trên toàn thế giới, game được cải tiến khá nhiều. Từ hệ thống đạn dược, hệ thống boss, hệ thống hành tinh, hệ thống gà.&nbsp;

	Điểm đáng nói nhất là cách điều khiển trong game dễ dàng và game hỗ trợ tất cả các dòng máy Android có trên thị trường từ trước tới nay.

	Gameplay phong phú với nhiều màn chơi mang lại cảm giác bất ngờ và thư giản vui vẻ cho mọi người trong mùa hè này.

	Hãy cùng chúng thôi tham gia vào cuộc chiến chống lại "Bầy Gà Xâm Lăng" nhé !
', N'http://s.qplay.vn/images/product/icon/icon72010613-112649.png', N'
                        	Dung lượng: &#32;
            	6.4Mb
				Lượt tải: &#32;55,244
									', NULL, N'http://s.qplay.vn/493-0-0-0--1/download/Ban-ga.html', N'http://s.qplay.vn/images/product/poster/banner qplay010613-112753.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1010613-112735.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2010613-112735.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3010613-112736.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4010613-112736.jpg">
		                </li>', CAST(0x0000A6CD010408DD AS DateTime), NULL, N'http://s.qplay.vn/493-0-0-0--1/game/Ban-ga.html', 203)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (13, N'Đảo hải tặc', N'Đảo hải tặc là câu chuyện kể về cuộc chiến giải quyết mối thù đẫm máu,của ba gia tộc đối thủ.Thế giới sau khải huyền này đã bị chìm gần như hoàn toàn và vài điểm còn lại của đất trở thành một phần thưởng quý giá cho người chiến thắng của cuộc giao tranh chết người giữa Thuyền trưởng Luffy với phần còn lại của thế giới.Tham gia chọn tàu để tấn công quân địch.Trò chơi ly kỳ và hấp dẫn với hỉnh ảnh 3D.Tất cả các hành động diễn ra trong khu nước khổng lồ, nơi bạn sẽ phải hoàn thành nhiệm vụ khác nhau và đánh bại kẻ thù từ gia tộc thù địch.Số tiền bạn kiếm được từ nhiệm vụ có thể được chi cho vũ khí mới và nâng cấp cho thuyền của bạn.Đảo hải tặc - lựa chọn vận mệnh của bạn trong thế giới này sau khi ngày tận thế!', N'
	Đảo hải tặc là câu chuyện kể về cuộc chiến giải quyết mối thù đẫm máu,của ba gia tộc đối thủ.Thế giới sau khải huyền này đã bị chìm gần như hoàn toàn và vài điểm còn lại của đất trở thành một phần thưởng quý giá cho người chiến thắng của cuộc giao tranh chết người giữa Thuyền trưởng Luffy với phần còn lại của thế giới.Tham gia chọn tàu để tấn công quân địch.Trò chơi ly kỳ và hấp dẫn với hỉnh ảnh 3D.Tất cả các hành động diễn ra trong khu nước khổng lồ, nơi bạn sẽ phải hoàn thành nhiệm vụ khác nhau và đánh bại kẻ thù từ gia tộc thù địch.Số tiền bạn kiếm được từ nhiệm vụ có thể được chi cho vũ khí mới và nâng cấp cho thuyền của bạn.Đảo hải tặc - lựa chọn vận mệnh của bạn trong thế giới này sau khi ngày tận thế!
', N'http://s.qplay.vn/images/product/icon/ic270914-092810.png', N'
                        	Dung lượng: &#32;
            	0.4Mb
				Lượt tải: &#32;10,600
									', NULL, N'http://s.qplay.vn/2952-0-0-0--1/download/Dao-hai-tac.html', N'http://s.qplay.vn/images/product/poster/banner270914-093454.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1270914-093009.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2270914-093009.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3270914-093009.png">
		                </li>', CAST(0x0000A6CD01040A29 AS DateTime), NULL, N'http://s.qplay.vn/2952-0-0-0--1/game/Dao-hai-tac.html', 204)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (14, N'Robin Hood Adventure', N'Robin vốn là một nhà quý tộc xứ Locksley. Khi hoàng tử Johny em của vua Richard âm mưu chiếm đoạt ngai vàng nhân lúc nhà vua vắng mặt, Robin tìm mọi cách ngăn chặn. Chàng bị truy đuổi, trở thành kẻ sống ngoài vòng pháp luật và đến lánh nạn ở khu rừng Sherwood. Tại đây chàng tập hợp quanh mình những kẻ cùng cảnh ngộ và trở thành thủ lĩnh Robin Hood của họ. Chàng chỉ huy đánh cướp bọn nhà giàu và chia cho dân nghèo, đồng thời cũng không quên nghĩa vụ phải trung thành với vua Richard, cũng như mối tình từ thuở còn thơ ấu với nàng Marian xinh đẹp', N'
	Robin vốn là một nhà quý tộc xứ Locksley. Khi hoàng tử Johny em của vua Richard âm mưu chiếm đoạt ngai vàng nhân lúc nhà vua vắng mặt, Robin tìm mọi cách ngăn chặn. Chàng bị truy đuổi, trở thành kẻ sống ngoài vòng pháp luật và đến lánh nạn ở khu rừng Sherwood. Tại đây chàng tập hợp quanh mình những kẻ cùng cảnh ngộ và trở thành thủ lĩnh Robin Hood của họ. Chàng chỉ huy đánh cướp bọn nhà giàu và chia cho dân nghèo, đồng thời cũng không quên nghĩa vụ phải trung thành với vua Richard, cũng như mối tình từ thuở còn thơ ấu với nàng Marian xinh đẹp
', N'http://s.qplay.vn/images/product/icon/ic130914-113355.png', N'
                        	Dung lượng: &#32;
            	10Mb
				Lượt tải: &#32;7,143
									', NULL, N'http://s.qplay.vn/2762-0-0-0--1/download/Robin-Hood-Adventure.html', N'http://s.qplay.vn/images/product/poster/unnamed130914-115453.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/1130914-113412.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2130914-113412.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3130914-113412.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4130914-113412.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/5130914-113412.png">
		                </li>', CAST(0x0000A6CD01040B31 AS DateTime), NULL, N'http://s.qplay.vn/2762-0-0-0--1/game/Robin-Hood-Adventure.html', 205)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (15, N'Khúc cua tử thần 3D', N'Khúc cua tửa thần 3D,tựa game đua xe đáng chú ý nhất hiện nay,với tốc độ cuộc đua chóng mặt,những góc quay kinh điển chỉ có trong đường đua 3D.Không thua kém bất cứ tựa game đua xe nào hiện nay.hãy tham gia vào cuộc đua của những kẻ nổi loạn này.Chắc hẳn các bạn đã quá quen với bộ phim nổi tiếng hành động mỹ,những pha đuổi bắt trên đường cao tốc,những cảnh bắn nhau tóe lửa.
Game là sự mô phỏng của bộ phim Death race.Khi các tử tù vào đây sẽ phải tham gia vào cuộc đua khốc liệt,mà người đứng đầu 5 vòng đua sẽ được thoát khỏi địa ngục đó.
Tay đua đế vương là sự tập hợp của những tên tội phạm hàng đầu thế giới,nhưng pha bứt tốc,gài bom và bắn tên lửa sẽ giúp bạn giữ được vị trí hoặc đảo ngược vị trí.
Hãy thật cẩn thận nếu không xe của bạn sẽ bị đối phương phá hỏng,chỉ cần chậm 1 bước là bạn đã có thể bị bỏ rất xa.Hãy tham gia vào cuộc đua nào.........', N'
	Khúc cua tửa thần 3D,tựa game đua xe đáng chú ý nhất hiện nay,với tốc độ cuộc đua chóng mặt,những góc quay kinh điển chỉ có trong đường đua 3D.Không thua kém bất cứ tựa game đua xe nào hiện nay.hãy tham gia vào cuộc đua của những kẻ nổi loạn này.Chắc hẳn các bạn đã quá quen với bộ phim nổi tiếng hành động mỹ,những pha đuổi bắt trên đường cao tốc,những cảnh bắn nhau tóe lửa.
	Game là sự mô phỏng của bộ phim Death race.Khi các tử tù vào đây sẽ phải tham gia vào cuộc đua khốc liệt,mà người đứng đầu 5 vòng đua sẽ được thoát khỏi địa ngục đó.
	Tay đua đế vương là sự tập hợp của những tên tội phạm hàng đầu thế giới,nhưng pha bứt tốc,gài bom và bắn tên lửa sẽ giúp bạn giữ được vị trí hoặc đảo ngược vị trí.
	Hãy thật cẩn thận nếu không xe của bạn sẽ bị đối phương phá hỏng,chỉ cần chậm 1 bước là bạn đã có thể bị bỏ rất xa.Hãy tham gia vào cuộc đua nào.........
', N'http://s.qplay.vn/images/product/icon/unnamed120914-032941.png', N'
                        	Dung lượng: &#32;
            	0.5Mb
				Lượt tải: &#32;8,360
									', NULL, N'http://s.qplay.vn/2692-0-0-0--1/download/Khuc-cua-tu-than-3D.html', N'http://s.qplay.vn/images/product/poster/racingstars02120914-033000.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1120914-032956.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2120914-032957.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/881992523013_1120914-032957.jpg">
		                </li>', CAST(0x0000A6CD01040BF5 AS DateTime), NULL, N'http://s.qplay.vn/2692-0-0-0--1/game/Khuc-cua-tu-than-3D.html', 206)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (16, N'Ô ăn quan', N'Ô ăn quan một game dân gian vô cùng quen thuộc với người Việt Nam đã có mặt trên Android, chỉ với một bãi đất nhỏ, với những viên đá viên sỏi, ô ăn quan trở thành một trò chơi chiến thuật lý thú.', N'
	Ô ăn quan một game dân gian vô cùng quen thuộc với người Việt Nam đã có mặt trên Android, chỉ với một bãi đất nhỏ, với những viên đá viên sỏi, ô ăn quan trở thành một trò chơi chiến thuật lý thú.&nbsp;

	- Game mang đầy tính chiến thuật dành cho hai người chơi.

	- Bạn phải nghĩ ra cách đi thông minh nhất để giành được nhiều quân hơn đối phương.&nbsp;

	Hãy cùng quay lại tuổi thơ của mình với game ô ăn quan trí tuệ.

	&nbsp;
', N'http://s.qplay.vn/images/product/icon/icon_oanquan 72x72030812-072933.png', N'
                        	Dung lượng: &#32;
            	4Mb
				Lượt tải: &#32;44,135
									', NULL, N'http://s.qplay.vn/102-0-0-0--1/download/O-an-quan.html', N'http://s.qplay.vn/images/product/poster/480x235090812-105100.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/oanquan4220912-111412.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/oanquan1220912-111412.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/oanquan2220912-111412.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/oanquan3220912-111412.jpg">
		                </li>', CAST(0x0000A6CD01040DB7 AS DateTime), NULL, N'http://s.qplay.vn/102-0-0-0--1/game/O-an-quan.html', 207)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (17, N'Natra tam thái tử', N'Na Tra hình tượng một vị thiên tướng khôi ngô, tuấn tú, mặt đẹp như ngọc, mắt sáng như sao, môi đỏ như môi thiếu nữ. Song bản tính của Na Tra nóng nảy, thẳng thắn và thích xen vào chuyện bất bình.Với sức mạnh vô địch,natra đã chu du khắp nơi để giải cứu người dân khỏi cảnh sống khốn cùng.', N'
	Na Tra hình tượng một vị thiên tướng khôi ngô, tuấn tú, mặt đẹp như ngọc, mắt sáng như sao, môi đỏ như môi thiếu nữ. Song bản tính của Na Tra nóng nảy, thẳng thắn và thích xen vào chuyện bất bình.Với sức mạnh vô địch,natra đã chu du khắp nơi để giải cứu người dân khỏi cảnh sống khốn cùng.
', N'http://s.qplay.vn/images/product/icon/ic050914-011813.png', N'
                        	Dung lượng: &#32;
            	5.9Mb
				Lượt tải: &#32;5,689
									', NULL, N'http://s.qplay.vn/2532-0-0-0--1/download/Natra-tam-thai-tu.html', N'http://s.qplay.vn/images/product/poster/title_background050914-011821.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1050914-011818.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2050914-011818.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3050914-011819.png">
		                </li>', CAST(0x0000A6CD01040E89 AS DateTime), NULL, N'http://s.qplay.vn/2532-0-0-0--1/game/Natra-tam-thai-tu.html', 208)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (18, N'Ninja loạn thị', N'Ninja loạn thị Truyện từng được xuất bản ở Việt Nam lần đầu vào 1998 với tên gọi “Ninja loạn thị”,và giờ chuyển thể thanh game với tựa đề Ninja loạn thị.  
Thời đại trong game là vào những năm cuối của triều đại Muromachi dựa vào chi tiết cảnh trí và con người trong game.Câu truyện bắt đầu vào thời Sengoku. Khi Rantaro được cha khuyến khích vào trường Ninjutsu Gakuen để học tập nhằm trở thành một ninja trứ danh làm rạng rỡ tổ tông. Sau khi vào trường, Rantoro đã quen được 2 người bạn mới là Kirimaru và Shinbee. Nhưng mọi chuyện lại không suôn sẻ khi cả 3 đều là những ninja hậu đậu.', N'
	Ninja loạn thị Truyện từng được xuất bản ở Việt Nam lần đầu vào 1998 với tên gọi “Ninja loạn thị”,và giờ chuyển thể thanh game với tựa đề Ninja loạn thị. &nbsp;
	Thời đại trong game là vào những năm cuối của triều đại Muromachi dựa vào chi tiết cảnh trí và con người trong game.Câu truyện bắt đầu vào thời Sengoku. Khi Rantaro được cha khuyến khích vào trường Ninjutsu Gakuen để học tập nhằm trở thành một ninja trứ danh làm rạng rỡ tổ tông. Sau khi vào trường, Rantoro đã quen được 2 người bạn mới là Kirimaru và Shinbee. Nhưng mọi chuyện lại không suôn sẻ khi cả 3 đều là những ninja hậu đậu.
', N'http://s.qplay.vn/images/product/icon/10858_com.falsehoodmask.NinjaWar_ninjas-stolen-scrolls280814-090415.png', N'
                        	Dung lượng: &#32;
            	37.4Mb
				Lượt tải: &#32;4,487
									', NULL, N'http://s.qplay.vn/2382-0-0-0--1/download/Ninja-loan-thi.html', N'http://s.qplay.vn/images/product/poster/banner280814-090422.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/1280814-090419.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2280814-090419.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3280814-090419.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4280814-090419.png">
		                </li>', CAST(0x0000A6CD01040F50 AS DateTime), NULL, N'http://s.qplay.vn/2382-0-0-0--1/game/Ninja-loan-thi.html', 209)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (19, N'Subway Surfers', N'Subway Surfers cho Android được thiết kế khá đơn giản, nhẹ nhàng vui tươi với màu sắc, hình ảnh đẹp sống động và cách chơi thú vị sẽ cho bạn những giây phút thư giãn vô cùng thoải mái.
Tham gia trò chơi bạn sẽ vào vai những chú nhóc tinh nghịch Jake, Tricky và Fresh chạy trốn cảnh sát khi đã vẽ bậy lên những toa xe lửa.
Trên đường chạy, trên những tấm ván, người chơi sẽ phải nhảy tránh các chướng ngại vật, lách qua những toa tàu, tránh các đoàn tàu đang chạy và tìm mọi cách để chạy thoát khỏi vòng vây của cảnh sát.
Trên đường tẩu thoát, game thủ cần cố gắng nhặt càng nhiều càng tốt các đồng xu và thu thập các đạo cụ để tăng sức mạnh và tốc độ cho mình.', N'
	Subway Surfers cho Android được thiết kế khá đơn giản, nhẹ nhàng vui tươi với màu sắc, hình ảnh đẹp sống động và cách chơi thú vị sẽ cho bạn những giây phút thư giãn vô cùng thoải mái.
	Tham gia trò chơi bạn sẽ vào vai những chú nhóc tinh nghịch Jake, Tricky và Fresh chạy trốn cảnh sát khi đã vẽ bậy lên những toa xe lửa.
	Trên đường chạy, trên những tấm ván, người chơi sẽ phải nhảy tránh các chướng ngại vật, lách qua những toa tàu, tránh các đoàn tàu đang chạy và tìm mọi cách để chạy thoát khỏi vòng vây của cảnh sát.
	Trên đường tẩu thoát, game thủ cần cố gắng nhặt càng nhiều càng tốt các đồng xu và thu thập các đạo cụ để tăng sức mạnh và tốc độ cho mình.
', N'http://s.qplay.vn/images/product/icon/icon130814-020510.png', N'
                        	Dung lượng: &#32;
            	16.9Mb
				Lượt tải: &#32;11,348
									', NULL, N'http://s.qplay.vn/2152-0-0-0--1/download/Subway-Surfers.html', N'http://s.qplay.vn/images/product/poster/Subway-Surfers-for-Android-Adds-New-York-City-World-Tour130814-020521.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1130814-020517.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2130814-020517.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3130814-020517.png">
		                </li>', CAST(0x0000A6CD0104100F AS DateTime), NULL, N'http://s.qplay.vn/2152-0-0-0--1/game/Subway-Surfers.html', 210)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (20, N'Kungfu panda', N'Kung Fu Panda, được biết là Gấu trúc kung fu là một bộ phim hoạt hình 3D của hãng DreamWorks.Bộ phim nói về một chú gấu trúc thích học môn võ thuật kungfu nhưng không được cha đồng ý vì bị bắt buộc phải nối nghiệp bán mì của cha mình. Rồi trong một dịp, cậu được học với 1 sư phụ bậc thầy môn võ kungfu cùng với những đồng môn có tiếng khác. Rồi những chuyện thú vị lại xảy đến với gấu trúc Po tham ăn nhưng đầy hy vọng.
Po là một chú gấu trúc với hình dáng to béo và tham ăn, cậu phải giúp đỡ cha mình chạy bàn trong tiệm mì gia truyền của gia đình. Cha cậu vốn là một đầu bếp lành nghề và mong muốn Po nối nghiệp nghề bán mì truyền thống này. Nhưng chú gấu Po lại có ước mơ khác hẳn là được học môn võ kungfu yêu thích và trở thành bậc thầy tài giỏi của môn võ này. Trong 1 ngày hội, lời tiên tri từ xưa đã giúp Po có thể thực hiện ước mơ của mình. Chú gấu được học với sư phụ Shifu và nhóm Ngũ Hùng (The Furious Five) gồm đại sư tỷ Hổ Nương, sư huynh Khỉ, sư huynh Sếu, sư huynh Bọ ngựa và sư tỷ Rắn.Một ngày nọ, tên hắc đạo báo tuyết Thái Long (người đã phản bội lại sư phụ và muốn trả thù bằng cách quậy phá) trốn thoát khỏi tù, gây nhiều hiểm họa cho mọi người. Trong sự hoảng loạn đó, nhiều sinh vật đều cầu cứu "kẻ được chọn" - võ sĩ Long Thần, đó là gấu trúc Po. Điều đó cũng đồng nghĩa với việc Po phải chiến đấu với tên hắc đạo nguy hiểm này. Với kích thước to béo, cùng tật tham ăn đã gây nhiều khó khăn trong con đường học võ thuật và để có thể chiến thắng được kẻ thù. Và rồi cậu đã biết tận dụng từ chính những điều đó để tạo nên một loại võ kungfu mang đặc trưng rất riêng của mình - Kung Fu Panda.', N'
	Kung Fu Panda, được biết là Gấu trúc kung fu là một bộ phim hoạt hình 3D của hãng DreamWorks.Bộ phim nói về một chú gấu trúc thích học môn võ thuật kungfu nhưng không được cha đồng ý vì bị bắt buộc phải nối nghiệp bán mì của cha mình. Rồi trong một dịp, cậu được học với 1 sư phụ bậc thầy môn võ kungfu cùng với những đồng môn có tiếng khác. Rồi những chuyện thú vị lại xảy đến với gấu trúc Po tham ăn nhưng đầy hy vọng.
	Po là một chú gấu trúc với hình dáng to béo và tham ăn, cậu phải giúp đỡ cha mình chạy bàn trong tiệm mì gia truyền của gia đình. Cha cậu vốn là một đầu bếp lành nghề và mong muốn Po nối nghiệp nghề bán mì truyền thống này. Nhưng chú gấu Po lại có ước mơ khác hẳn là được học môn võ kungfu yêu thích và trở thành bậc thầy tài giỏi của môn võ này. Trong 1 ngày hội, lời tiên tri từ xưa đã giúp Po có thể thực hiện ước mơ của mình. Chú gấu được học với sư phụ Shifu và nhóm Ngũ Hùng (The Furious Five) gồm đại sư tỷ Hổ Nương, sư huynh Khỉ, sư huynh Sếu, sư huynh Bọ ngựa và sư tỷ Rắn.Một ngày nọ, tên hắc đạo báo tuyết Thái Long (người đã phản bội lại sư phụ và muốn trả thù bằng cách quậy phá) trốn thoát khỏi tù, gây nhiều hiểm họa cho mọi người. Trong sự hoảng loạn đó, nhiều sinh vật đều cầu cứu "kẻ được chọn" - võ sĩ Long Thần, đó là gấu trúc Po. Điều đó cũng đồng nghĩa với việc Po phải chiến đấu với tên hắc đạo nguy hiểm này. Với kích thước to béo, cùng tật tham ăn đã gây nhiều khó khăn trong con đường học võ thuật và để có thể chiến thắng được kẻ thù. Và rồi cậu đã biết tận dụng từ chính những điều đó để tạo nên một loại võ kungfu mang đặc trưng rất riêng của mình - Kung Fu Panda.
', N'http://s.qplay.vn/images/product/icon/icon_256110814-045156.png', N'
                        	Dung lượng: &#32;
            	25.1Mb
				Lượt tải: &#32;6,335
									', NULL, N'http://s.qplay.vn/2102-0-0-0--1/download/Kungfu-panda.html', N'http://s.qplay.vn/images/product/poster/kung-fu-panda-2-banner110814-045518.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1110814-045509.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2110814-045509.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3110814-045510.png">
		                </li>', CAST(0x0000A6CD010411F9 AS DateTime), NULL, N'http://s.qplay.vn/2102-0-0-0--1/game/Kungfu-panda.html', 211)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (21, N'Cỗ máy hủy diệt', N'Commando Jack là game bảo vệ chiến thành, cho phép người chơi ngồi bên trong một tháp canh nhỏ và đối mặt với kẻ thù. Bạn là Commando Jack, một anh lính khó tính, ích kỷ và tồi nhất trên hành tinh này. Giờ đây, mọi việc lại tùy thuộc vào bạn khi giải cứu thế giới khỏi sự xâm lăng của người ngoài hành tinh. Xây dựng một mê cung các tòa tháp để đối mặt với sự tàn phá của chúng. Nếu những điều này là chưa đủ, hãy nhảy vào tháp canh và tự mình kết liễu những tên ngoan cố ngoài hành tinh này.', N'
	Commando Jack là game bảo vệ chiến thành, cho phép người chơi ngồi bên trong một tháp canh nhỏ và đối mặt với kẻ thù. Bạn là Commando Jack, một anh lính khó tính, ích kỷ và tồi nhất trên hành tinh này. Giờ đây, mọi việc lại tùy thuộc vào bạn khi giải cứu thế giới khỏi sự xâm lăng của người ngoài hành tinh. Xây dựng một mê cung các tòa tháp để đối mặt với sự tàn phá của chúng. Nếu những điều này là chưa đủ, hãy nhảy vào tháp canh và tự mình kết liễu những tên ngoan cố ngoài hành tinh này.
', N'http://s.qplay.vn/images/product/icon/icon080814-101921.png', N'
                        	Dung lượng: &#32;
            	45.3Mb
				Lượt tải: &#32;4,392
									', NULL, N'http://s.qplay.vn/2032-0-0-0--1/download/Co-may-huy-diet.html', N'http://s.qplay.vn/images/product/poster/3080814-102432.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1080814-102429.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2080814-102429.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4080814-102429.jpg">
		                </li>', CAST(0x0000A6CD010412E8 AS DateTime), NULL, N'http://s.qplay.vn/2032-0-0-0--1/game/Co-may-huy-diet.html', 212)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (22, N'Gunny - Đấu trường gà', N'Cuộc chiến tranh lâu dài của nhân loại và gà kết nối bởi Chicken Revolution kết thúc với sự ra đời của những con gà zombie.
Zombie gà xuất hiện bất ngờ tấn công và lây nhiễm tất cả các sinh vật sống trong đó có con người và gà. Người và gà quản lý để hợp tác với nhau để tồn tại …
Đặc điểm
-400 Giai đoạn: dễ dàng, bình thường, khó,đặc biệt.
-Các kỹ năng với cách đánh mạnh mẽ
-Các kỹ năng phụ và toàn bộ các kỹ năng', N'Cuộc chiến tranh lâu dài của nhân loại và gà kết nối bởi Chicken Revolution kết thúc với sự ra đời của những con gà zombie.Zombie gà xuất hiện bất ngờ tấn công và lây nhiễm tất cả các sinh vật sống trong đó có con người và gà. Người và gà quản lý để hợp tác với nhau để tồn tại …Đặc điểm-400 Giai đoạn: dễ dàng, bình thường, khó,đặc biệt.-Các kỹ năng với cách đánh mạnh mẽ-Các kỹ năng phụ và toàn bộ các kỹ năng
', N'http://s.qplay.vn/images/product/icon/icon050814-031214.png', N'
                        	Dung lượng: &#32;
            	37.1Mb
				Lượt tải: &#32;5,143
									', NULL, N'http://s.qplay.vn/1982-0-0-0--1/download/Gunny---Dau-truong-ga.html', N'http://s.qplay.vn/images/product/poster/maxresdefault050814-031338.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1050814-031330.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2050814-031330.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3050814-031331.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4050814-031331.png">
		                </li>', CAST(0x0000A6CD01051109 AS DateTime), NULL, N'http://s.qplay.vn/1982-0-0-0--1/game/Gunny---Dau-truong-ga.html', 213)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (23, N'Hiệp sỹ trung cổ', N'Một kỷ nguyên chiến tranh đã đến với thế giới bởi sự trừng phạt của các vị thần .
Lịch sử sẽ ghi danh người chiến thắng và tạo ra trật tự thế giới mới.
Hãy cùng theo hành trình lịch sử tìm hiểu sự thật đằng sau công lý giả dối này nhé!
Tính năng của trò chơi:
- Một cảm giác chiến đấu tuyệt vời
- Hàng loạt các nhân vật trong game
- Đồ họa dễ thương cùng các hiệu ứng tuyệt vời
- Thưởng thức các kiểu chiến đấu khác nhau qua 5 nhân vật anh hùng với những kỹ năng riêng của họ.
- Tạo các chiến lược chiến đấu khác nhau bằng cách kết hợp những anh hùng và các loại quân lính khác nhau .
- Hệ thống chiến đấu đa dạng
- 6 chế độ chiến đấu khác nhau
- Các loại kỹ năng đa dạng và hệ thống nâng cấp kỹ năng', N'
	Một kỷ nguyên chiến tranh đã đến với thế giới bởi sự trừng phạt của các vị thần .

	Lịch sử sẽ ghi danh người chiến thắng và tạo ra trật tự thế giới mới.

	Hãy cùng theo hành trình lịch sử tìm hiểu sự thật đằng sau công lý giả dối này nhé!

	Tính năng của trò chơi:

	- Một cảm giác chiến đấu tuyệt vời

	- Hàng loạt các nhân vật trong game

	- Đồ họa dễ thương cùng các hiệu ứng tuyệt vời

	- Thưởng thức các kiểu chiến đấu khác nhau qua 5 nhân vật anh hùng với những kỹ năng riêng của họ.

	- Tạo các chiến lược chiến đấu khác nhau bằng cách kết hợp những anh hùng và các loại quân lính khác nhau .

	- Hệ thống chiến đấu đa dạng

	- 6 chế độ chiến đấu khác nhau

	- Các loại kỹ năng đa dạng và hệ thống nâng cấp kỹ năng
', N'http://s.qplay.vn/images/product/icon/icon020814-115221.png', N'
                        	Dung lượng: &#32;
            	32.9Mb
				Lượt tải: &#32;4,915
									', NULL, N'http://s.qplay.vn/1942-0-0-0--1/download/Hiep-sy-trung-co.html', N'http://s.qplay.vn/images/product/poster/LHSplash800020814-115243.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/sc1020814-115240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc2020814-115240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc3020814-115240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc5020814-115240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc6020814-115240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc7020814-115240.jpg">
		                </li>', CAST(0x0000A6CD010511D9 AS DateTime), NULL, N'http://s.qplay.vn/1942-0-0-0--1/game/Hiep-sy-trung-co.html', 214)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (24, N'Chiến thần Gà', N'Câu chuyện của game bắt đầu khi lũ Zombies từ một công ty y tế bất ngờ bị “xổng chuồng” và tràn ngập thành phố. Do vậy, những chú gà dũng cảm được tập hợp để tiêu diệt lũ Zombies này. Nếu bạn chưa từng tưởng tượng mình sẽ ra sao nếu nhập vai vào một loài vật thì bạn nên thử Chicken Warrior: Zombie Hunter. Bởi đơn giản, người chơi sẽ hóa thành các chiến binh gà. Nếu bạn không muốn thử một lần thì cũng không sao. Nhưng như vậy, bạn đã bỏ lỡ một trải nghiệm game hiếm có đấy. Hơn vậy, bạn đang tiếp tay cho lũ Zombies xấu xa kia tiếp tục đập phá, tiêu hủy mọi thứ trong thành phố và bắt người vô tội nữa.
Lũ Zombies này có số lượng rất lớn do vậy, bạn sẽ có sự hỗ trợ của hơn 200 loại vũ khí cùng công cụ khác nhau để tiêu diệt chúng. Với con số này, bạn có thể tìm thấy đủ loại vũ khí từ bom, mìn, súng cho tới mũ tránh đạn… Hãy cố gắng đánh phủ đầu đối phương ngay từ đầu, bởi bạn càng tiêu diệt được nhiều Zombies thì bạn càng có thêm nhiều điểm thưởng để mở khóa các bàn tiếp theo và có cơ hội sở hữu nhiều vũ khí hạng nặng cần thiết cho các nhiệm vụ khó khăn về sau.', N'
	Câu chuyện của game bắt đầu khi lũ Zombies từ một công ty y tế bất ngờ bị “xổng chuồng” và tràn ngập thành phố. Do vậy, những chú gà dũng cảm được tập hợp để tiêu diệt lũ Zombies này. Nếu bạn chưa từng tưởng tượng mình sẽ ra sao nếu nhập vai vào một loài vật thì bạn nên thử Chicken Warrior: Zombie Hunter. Bởi đơn giản, người chơi sẽ hóa thành các chiến binh gà. Nếu bạn không muốn thử một lần thì cũng không sao. Nhưng như vậy, bạn đã bỏ lỡ một trải nghiệm game hiếm có đấy. Hơn vậy, bạn đang tiếp tay cho lũ Zombies xấu xa kia tiếp tục đập phá, tiêu hủy mọi thứ trong thành phố và bắt người vô tội nữa.
	Lũ Zombies này có số lượng rất lớn do vậy, bạn sẽ có sự hỗ trợ của hơn 200 loại vũ khí cùng công cụ khác nhau để tiêu diệt chúng. Với con số này, bạn có thể tìm thấy đủ loại vũ khí từ bom, mìn, súng cho tới mũ tránh đạn… Hãy cố gắng đánh phủ đầu đối phương ngay từ đầu, bởi bạn càng tiêu diệt được nhiều Zombies thì bạn càng có thêm nhiều điểm thưởng để mở khóa các bàn tiếp theo và có cơ hội sở hữu nhiều vũ khí hạng nặng cần thiết cho các nhiệm vụ khó khăn về sau.
', N'http://s.qplay.vn/images/product/icon/icon2010814-100157.png', N'
                        	Dung lượng: &#32;
            	16.2Mb
				Lượt tải: &#32;3,974
									', NULL, N'http://s.qplay.vn/1902-0-0-0--1/download/Chien-than-Ga.html', N'http://s.qplay.vn/images/product/poster/banner1010814-100219.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/sc11010814-100216.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc12010814-100216.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc13010814-100216.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc14010814-100216.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc15010814-100216.png">
		                </li>', CAST(0x0000A6CD010512A7 AS DateTime), NULL, N'http://s.qplay.vn/1902-0-0-0--1/game/Chien-than-Ga.html', 215)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (25, N'Đua ô tô bắn súng', N'Twisted Metal 2 được coi là game đua xe mới nhất trong năm 2014 vừa được ra mắt. Điều đặc biệt là nó sẽ hội tự những tinh hoa nhất từ các game đua xe khác. Đây quả thực sẽ là phiên bản đua xe hay nhất từ trước đến nay.
Twisted Metal 2 được coi là một game đua xe phù hợp với mọi lứa tuổi, đơn giản chỉ việc ngang trái, nghiêng phải để điều khiển xe đi đúng hướng.
Trong game bạn sẽ được trải nghiệm rất nhiều loại xe đua danh tiếng với sức công phá mạnh mẽ,trải nghiệm đưa bạn từ bất ngờ này đến bất ngờ khác.', N'
	Twisted Metal 2 được coi là game đua xe mới nhất trong năm 2014 vừa được ra mắt. Điều đặc biệt là nó sẽ hội tự những tinh hoa nhất từ các game đua xe khác. Đây quả thực sẽ là phiên bản đua xe hay nhất từ trước đến nay.
	Twisted Metal 2 được coi là một game đua xe phù hợp với mọi lứa tuổi, đơn giản chỉ việc ngang trái, nghiêng phải để điều khiển xe đi đúng hướng.
	Trong game bạn sẽ được trải nghiệm rất nhiều loại xe đua danh tiếng với sức công phá mạnh mẽ,trải nghiệm đưa bạn từ bất ngờ này đến bất ngờ khác.
', N'http://s.qplay.vn/images/product/icon/twisted_metal_2_icono_by_nacho94-d7dbtwb310714-015851.png', N'
                        	Dung lượng: &#32;
            	46Mb
				Lượt tải: &#32;6,065
									', NULL, N'http://s.qplay.vn/1852-0-0-0--1/download/Dua-o-to-ban-sung.html', N'http://s.qplay.vn/images/product/poster/TwistedMetal2--article_image310714-020841.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/scrr1310714-015906.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrr2310714-015906.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrr3310714-015906.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrr4310714-015906.png">
		                </li>', CAST(0x0000A6CD0105135A AS DateTime), NULL, N'http://s.qplay.vn/1852-0-0-0--1/game/Dua-o-to-ban-sung.html', 216)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (26, N'Cuộc chiến thời tiền sử', N'Cuộc chiến thời tiền sử đã được tái hiện lại!
Thời gian dài trước đây trong thời kỳ đồ đá,cách duy nhất để tồn tại là để chiến đấu với các bộ tộc khác cho đất và nguồn lực hạn chế. Bạn có để làm chủ vũ khí của bạn và giành chiến thắng trong trận chiến sử thi để đảm bảo sự lãnh đạo của một trong những bộ lạc!
Cuộc chiến thời tiền sử là một trò chơi chiến lược chuyển thể.Người chơi sẽ sử dụng các vũ khí để tấn công đối phương,nó có kiểu chơi giống như Gunny.Hãy căn lực và góc thật tốt để có thể trúng được mục tiêu nhé!', N'
	Cuộc chiến thời tiền sử đã được tái hiện lại!
	Thời gian dài trước đây trong thời kỳ đồ đá,cách duy nhất để tồn tại là để chiến đấu với các bộ tộc khác cho đất và nguồn lực hạn chế. Bạn có để làm chủ vũ khí của bạn và giành chiến thắng trong trận chiến sử thi để đảm bảo sự lãnh đạo của một trong những bộ lạc!
	Cuộc chiến thời tiền sử là một trò chơi chiến lược chuyển thể.Người chơi sẽ sử dụng các vũ khí để tấn công đối phương,nó có kiểu chơi giống như Gunny.Hãy căn lực và góc thật tốt để có thể trúng được mục tiêu nhé!
', N'http://s.qplay.vn/images/product/icon/icon300714-111917.png', N'
                        	Dung lượng: &#32;
            	27.8Mb
				Lượt tải: &#32;3,403
									', NULL, N'http://s.qplay.vn/1812-0-0-0--1/download/Cuoc-chien-thoi-tien-su.html', N'http://s.qplay.vn/images/product/poster/banner.png300714-112315.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/sc1300714-112311.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc2300714-112312.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc3300714-112312.jpg">
		                </li>', CAST(0x0000A6CD01051414 AS DateTime), NULL, N'http://s.qplay.vn/1812-0-0-0--1/game/Cuoc-chien-thoi-tien-su.html', 217)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (27, N'Mãnh Long phục hận', N'Võ học thật là vô biên, bạn có bao giờ mong muốn một lần trở thành đại tông sư võ học, một lần trở thành minh chủ võ lâm?
Tinh thông các tuyệt kỹ bí truyền, các chiêu thức bá đạo, một người địch lại trăm người!
Mãnh long phục hận sẽ đem lại cho bạn cảm nhận như thế,bạn sẽ lạc vào một thế giới kiếm hiệp của những anh hùng trong truyền thuyết.Hành trình trở thành huyền thoại võ thuật của chàng trai Lý Tiểu Long.Câu chuyện về cuộc đời của huyền thoại võ thuật Lý tiểu long và môn phái Vịnh Xuân Quyền.Game hành động đối kháng với những chiêu thức võ thuật đẹp mắt...
Rất nhiều đối thủ mạnh sẽ xuất hiện trong từng bài chơi.', N'
	Võ học thật là vô biên, bạn có bao giờ mong muốn một lần trở thành đại tông sư võ học, một lần trở thành minh chủ võ lâm?
	Tinh thông các tuyệt kỹ bí truyền, các chiêu thức bá đạo, một người địch lại trăm người!
	Mãnh long phục hận sẽ đem lại cho bạn cảm nhận như thế,bạn sẽ lạc vào một thế giới kiếm hiệp của những anh hùng trong truyền thuyết.Hành trình trở thành huyền thoại võ thuật của chàng trai Lý Tiểu Long.Câu chuyện về cuộc đời của huyền thoại võ thuật Lý tiểu long và môn phái Vịnh Xuân Quyền.Game hành động đối kháng với những chiêu thức võ thuật đẹp mắt...
	Rất nhiều đối thủ mạnh sẽ xuất hiện trong từng bài chơi.
	 
', N'http://s.qplay.vn/images/product/icon/icon290714-125640.png', N'
                        	Dung lượng: &#32;
            	43.6Mb
				Lượt tải: &#32;4,121
									', NULL, N'http://s.qplay.vn/1772-0-0-0--1/download/Manh-Long-phuc-han.html', N'http://s.qplay.vn/images/product/poster/fighting-tiger-liberal-34-b-512x250290714-125812.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/sc1290714-125810.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc2290714-125810.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc3290714-125810.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc4290714-125810.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc5290714-125810.jpg">
		                </li>', CAST(0x0000A6CD010514D3 AS DateTime), NULL, N'http://s.qplay.vn/1772-0-0-0--1/game/Manh-Long-phuc-han.html', 218)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (28, N'Ai là thánh soi', N'Bạn đã bao giờ nghe đến biệt danh Thánh Soi chưa?
Nếu bạn là một fan của Haivl thì bạn hẳn đã biết đến biệt danh này rồi, trong các loại thánh có: Thánh Troll, Thánh Nhọ, Thánh Phồng, Thánh Tán Gái, Thánh Soi vân vân và vân vân. Thánh Soi là thể hiện sức mạnh của đôi mắt và trí tưởng tưởng vô cùng phong phú, để tìm ra những điểm đặc biệt của những bức ảnh.
Hòa cùng vào trào lưu "Đuổi hình bắt chữ", "Ai là thánh troll" đang làm mưa làm gió trên thị trường game Việt, Game Ai Là Thánh Soi đem đến cho bạn một trải nghiệm hoàn toàn mới của thể loại game Đuổi hình bắt chữ và rất nhiều thánh thức mà bạn có khó có thể vượt qua được.
Bạn có muốn thử khả năng săm soi của mình không? Chắc chắn bạn sẽ không bỏ lỡ cơ hội thể hiện khả năng vượt bậc của mình rồi. Hãy tải game và cùng so tài với các thánh.
Nhiệm vụ của bạn là phải tìm ra các đối tượng đang ẩn mình trong các hình ảnh, không chỉ đuổi hình băt chữ mà bạn còn phải đuổi hình bắt chó, đuổi hình bắt hổ, đuổi hình bắt dê, ôi còn nhiều lắm tha hồ mà đuổi.
Nếu bạn thấy thích game này thì hãy rate cho game nhé.', N'
	Bạn đã bao giờ nghe đến biệt danh Thánh Soi chưa?

	Nếu bạn là một fan của Haivl thì bạn hẳn đã biết đến biệt danh này rồi, trong các loại thánh có: Thánh Troll, Thánh Nhọ, Thánh Phồng, Thánh Tán Gái, Thánh Soi vân vân và vân vân. Thánh Soi là thể hiện sức mạnh của đôi mắt và trí tưởng tưởng vô cùng phong phú, để tìm ra những điểm đặc biệt của những bức ảnh.

	Hòa cùng vào trào lưu "Đuổi hình bắt chữ", "Ai là thánh troll" đang làm mưa làm gió trên thị trường game Việt, Game Ai Là Thánh Soi đem đến cho bạn một trải nghiệm hoàn toàn mới của thể loại game Đuổi hình bắt chữ và rất nhiều thánh thức mà bạn có khó có thể vượt qua được.

	Bạn có muốn thử khả năng săm soi của mình không? Chắc chắn bạn sẽ không bỏ lỡ cơ hội thể hiện khả năng vượt bậc của mình rồi. Hãy tải game và cùng so tài với các thánh.

	Nhiệm vụ của bạn là phải tìm ra các đối tượng đang ẩn mình trong các hình ảnh, không chỉ đuổi hình băt chữ mà bạn còn phải đuổi hình bắt chó, đuổi hình bắt hổ, đuổi hình bắt dê, ôi còn nhiều lắm tha hồ mà đuổi.

	Nếu bạn thấy thích game này thì hãy rate cho game nhé.
', N'http://s.qplay.vn/images/product/icon/unnamed240714-051712.png', N'
                        	Dung lượng: &#32;
            	6.6Mb
				Lượt tải: &#32;3,729
									', NULL, N'http://s.qplay.vn/1672-0-0-0--1/download/Ai-la-thanh-soi.html', N'http://s.qplay.vn/images/product/poster/banner1_480240714-052446.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/111240714-051742.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc1240714-051742.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc2240714-051742.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc3240714-051742.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/unnamed240714-051743.jpg">
		                </li>', CAST(0x0000A6CD01051605 AS DateTime), NULL, N'http://s.qplay.vn/1672-0-0-0--1/game/Ai-la-thanh-soi.html', 219)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (29, N'Ván trượt huyền thoại', N'Ván trượt là một trong những phần không thể thiếu trong "bộ sưu tập" trò chơi mạo hiểm ở mỗi khu vực giải trí. Các pha lộn nhào cùng tốc độ lao "như tên lửa" trên đường ray ngoằn ngoèo khiến không ít bạn cảm thấy "choáng váng".
Nếu như các bạn có tinh thần thép,thì hãy thử ngay,tuy trên game chúng ta được giảm nhẹ những pha hành động mạo hiểm,nhưng nó vẫn thật đáng để tải về.Tham gia cùng chú thỏ sành điệu này nhé', N'
	Ván trượt là một trong những phần không thể thiếu trong "bộ sưu tập" trò chơi mạo hiểm ở mỗi khu vực giải trí. Các pha lộn nhào cùng tốc độ lao "như tên lửa" trên đường ray ngoằn ngoèo khiến không ít bạn cảm thấy "choáng váng".

	Nếu như các bạn có tinh thần thép,thì hãy thử ngay,tuy trên game chúng ta được giảm nhẹ những pha hành động mạo hiểm,nhưng nó vẫn thật đáng để tải về.Tham gia cùng chú thỏ sành điệu này nhé
', N'http://s.qplay.vn/images/product/icon/ic160714-041239.png', N'
                        	Dung lượng: &#32;
            	4.8Mb
				Lượt tải: &#32;4,192
									', NULL, N'http://s.qplay.vn/1472-0-0-0--1/download/Van-truot-huyen-thoai.html', N'http://s.qplay.vn/images/product/poster/unnamed8Q49Z5EP160714-041752.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/unnamed2OGOVNYT160714-041745.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/unnamed7I1F7T58160714-041745.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/unnamedJIXP8TFT160714-041750.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/unnamedOQ7Q0TUQ160714-041750.jpg">
		                </li>', CAST(0x0000A6CD010516C2 AS DateTime), NULL, N'http://s.qplay.vn/1472-0-0-0--1/game/Van-truot-huyen-thoai.html', 220)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (30, N'Skies of war 2014', N'Tái xuất giang hồ lần này của Splay chắc chắn là một phiên bản cực kỳ đáng được mong đợi mang tên Skies Of War - một thể loại bắn máy bay pha trộn theo phong cách Arcade và ý tưởng Nhập vai RPG.Hơn 50 chiếc máy bay được vẽ mới, 10 khung cảnh khác nhay được xây dựng tích hợp cho mỗi màn chơi, tuy chỉ là hình 2D nhưng sắc nét và cách phối mày thông minh dựa trên những mày sắc chủ đạo như xám, xanh, và sử dụng hiệu ứng triệt để của khói lửa tái hiện một không khí khốc liệt - một trận chiến của Bảo vệ chủ quyền
Game bao gồm 3 màn chơi chính
+ Protect Mode
+ Dead Mode
+ Target Mode
Nào hãy cùng SKies Of War không chỉ bay lượn không trung mà còn tham gia hơn 100 màn chơi khác nhau vô cùng sống động.', N'
	Tái xuất giang hồ lần này của Splay chắc chắn là một phiên bản cực kỳ đáng được mong đợi mang tên Skies Of War - một thể loại bắn máy bay pha trộn theo phong cách Arcade và ý tưởng Nhập vai RPG.Hơn 50 chiếc máy bay được vẽ mới, 10 khung cảnh khác nhay được xây dựng tích hợp cho mỗi màn chơi, tuy chỉ là hình 2D nhưng sắc nét và cách phối mày thông minh dựa trên những mày sắc chủ đạo như xám, xanh, và sử dụng hiệu ứng triệt để của khói lửa tái hiện một không khí khốc liệt - một trận chiến của Bảo vệ chủ quyền

	Game bao gồm 3 màn chơi chính

	+ Protect Mode

	+ Dead Mode

	+ Target Mode

	Nào hãy cùng SKies Of War không chỉ bay lượn không trung mà còn tham gia hơn 100 màn chơi khác nhau vô cùng sống động.
', N'http://s.qplay.vn/images/product/icon/1250614-013215120714-090512120714-104238.png', N'
                        	Dung lượng: &#32;
            	24.8Mb
				Lượt tải: &#32;3,974
									', NULL, N'http://s.qplay.vn/1342-0-0-0--1/download/Skies-of-war-2014.html', N'http://s.qplay.vn/images/product/poster/1250614-013509120714-090540120714-104246.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/3250614-013244120714-090534120714-104244.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4250614-013244120714-090534120714-104244.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/5250614-013244120714-090534120714-104244.jpg">
		                </li>', CAST(0x0000A6CD01051789 AS DateTime), NULL, N'http://s.qplay.vn/1342-0-0-0--1/game/Skies-of-war-2014.html', 221)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (31, N'Death Racing 3D', N'Hãy đến và trải nghiệm Death Racing 3D - mang tới cho bạn niềm vui không giới hạn!
Cách chơi:
Miễn là bạn trong trò chơi và trên đường đua, nhặt các vật phẩm và nhắm kĩ mục tiêu , bạn có thể bắn , đập những kẻ ngáng đường .Chiếc xe phân khỗi lớn của bạn sẽ tiêu thụ nitơ khi tăng tốc , vì vậy hãy nhớ để thu thập nitơ, hoặc bạn sẽ tụt lại phía sau.
Tất nhiên bạn có thể chia sẻ điểm số của bạn để xếp hạng. Chứng minh xem ai là mạnh mẽ nhất với người chơi từ khắp nơi trên thế giới?
Có thể được chia sẻ với các mạng xã hội khác nhau, chẳng hạn như Facebook,...SÚNG và XE trong shop , hãy mua xe khủng và trải nghiệm sức mạnh của đế vương .Nào, đi thôi!', N'
	Hãy đến và trải nghiệm Death Racing 3D - mang tới cho bạn niềm vui không giới hạn!

	Cách chơi:

	Miễn là bạn trong trò chơi và trên đường đua, nhặt các vật phẩm và nhắm kĩ mục tiêu , bạn có thể bắn , đập những kẻ ngáng đường .Chiếc xe phân khỗi lớn của bạn sẽ tiêu thụ nitơ khi tăng tốc , vì vậy hãy nhớ để thu thập nitơ, hoặc bạn sẽ tụt lại phía sau.

	Tất nhiên bạn có thể chia sẻ điểm số của bạn để xếp hạng. Chứng minh xem ai là mạnh mẽ nhất với người chơi từ khắp nơi trên thế giới?

	Có thể được chia sẻ với các mạng xã hội khác nhau, chẳng hạn như Facebook,...SÚNG và XE trong shop , hãy mua xe khủng và trải nghiệm sức mạnh của đế vương .Nào, đi thôi!
', N'http://s.qplay.vn/images/product/icon/unnamedA6CLIB1L110714-105415110714-020040.png', N'
                        	Dung lượng: &#32;
            	21.5Mb
				Lượt tải: &#32;14,737
									', NULL, N'http://s.qplay.vn/1282-0-0-0--1/download/Death-Racing-3D.html', N'http://s.qplay.vn/images/product/poster/death-moto-racing-gp-2-0-s-307x512110714-105439110714-020102.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/unnamed8EWFHB94110714-105436110714-020059.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/unnamedRNYE39XL110714-105436110714-020059.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/unnamedURHH1H99110714-105436110714-020059.png">
		                </li>', CAST(0x0000A6CD0105187A AS DateTime), NULL, N'http://s.qplay.vn/1282-0-0-0--1/game/Death-Racing-3D.html', 222)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (32, N'Cross Fire', N'Thể loại game bắn súng siêu hay cho mọi người,cách chơi đơn giản với 1 góc nhìn.Trò chơi sẽ yêu cầu độ phản xạ,cũng như sự chính xác từ người chơi,tiết kiệm tối đa đạn của bạn để tiêu diệt đối phương.
Khi tham gia trò chơi,người chơi sẽ hóa thân thành những kẻ cướp nhà băng,trên đường tẩu tán bị cảnh sát theo đuổi phía sau,hãy nâng cấp súng và bán phá kẻ thù thật nhanh và gọn nhé', N'
	Thể loại game bắn súng siêu hay cho mọi người,cách chơi đơn giản với 1 góc nhìn.Trò chơi sẽ yêu cầu độ phản xạ,cũng như sự chính xác từ người chơi,tiết kiệm tối đa đạn của bạn để tiêu diệt đối phương.

	Khi tham gia trò chơi,người chơi sẽ hóa thân thành những kẻ cướp nhà băng,trên đường tẩu tán bị cảnh sát theo đuổi phía sau,hãy nâng cấp súng và bán phá kẻ thù thật nhanh và gọn nhé
', N'http://s.qplay.vn/images/product/icon/icon090714-094606.png', N'
                        	Dung lượng: &#32;
            	10.7Mb
				Lượt tải: &#32;5,292
									', NULL, N'http://s.qplay.vn/1182-0-0-0--1/download/Cross-Fire.html', N'http://s.qplay.vn/images/product/poster/unnamed090714-094857.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/sc1090714-094852.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc2090714-094852.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc3090714-094852.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/sc4090714-094852.png">
		                </li>', CAST(0x0000A6CD01051948 AS DateTime), NULL, N'http://s.qplay.vn/1182-0-0-0--1/game/Cross-Fire.html', 223)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (33, N'Ma tốc độ 2014', N'Ma tốc độ là một game đua xe vô cùng thú vị trện hệ điều hành Android. Bạn đã thử chưa nào? Với rất nhiều mẫu xe đua đẹp mắt, bạn hãy chọn cho mình một chiếc moto sành điệu nhất để trở thành một tay đua cừ khôi, dễ dàng chinh phục các chướng ngại vật và vi vu trên những đường phố nổi tiếng của New York nhé!', N'
	Ma tốc độ là một game đua xe vô cùng thú vị trện hệ điều hành Android. Bạn đã thử chưa nào? Với rất nhiều mẫu xe đua đẹp mắt, bạn hãy chọn cho mình một chiếc moto sành điệu nhất để trở thành một tay đua cừ khôi, dễ dàng chinh phục các chướng ngại vật và vi vu trên những đường phố nổi tiếng của New York nhé!
', N'http://s.qplay.vn/images/product/icon/f547a3305ama-toc-do_ICON030714-025315.png', N'
                        	Dung lượng: &#32;
            	4.2Mb
				Lượt tải: &#32;6,404
									', NULL, N'http://s.qplay.vn/1152-0-0-0--1/download/Ma-toc-do-2014.html', N'http://s.qplay.vn/images/product/poster/c2df72a07fma-toc-do_BANNER090812-100605030714-025340.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/4ed3559930cv030714-025335.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/5b2454a0c1da030714-025335.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/a3f251ef02XXX030714-025335.jpg">
		                </li>', CAST(0x0000A6CD01051A3F AS DateTime), NULL, N'http://s.qplay.vn/1152-0-0-0--1/game/Ma-toc-do-2014.html', 224)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (34, N'Cafe24h - Ứng dụng đọc báo số 1 Việt Nam', N'Cafe24h là ứng dụng đọc báo, giải trí, mua sắm trên Smartphone do Qplay phát hành hoàn toàn miễn phí. Cafe24h hỗ trợ bạn đọc tất cả các tờ báo online trên di động. Bạn có thể dễ dàng sử dụng như việc bạn đọc báo trên máy tính.
Tình năng chính :
- Ứng dụng đọc báo Cafe24h với giao diện hiện đại, mượt mà
- Nội dung phong phú và tốc độ nhanh, cập nhật liên tục trong ngày.
- Với trên 20 chuyên mục khác nhau như bóng đá, xã hội, hình sự, thế giới ..vv. Đáp ứng mọi lứa tuổi hay nhu cầu của người sử dụng.
Hi vọng với Ứng dụng Cafe24h sẽ giúp bạn có những phú giây giải trí cũng như thư giãn mỗi ngày.', N'
	Cafe24h là ứng dụng đọc báo, giải trí, mua sắm trên Smartphone do Qplay phát hành hoàn toàn miễn phí. Cafe24h hỗ trợ bạn đọc tất cả các tờ báo online trên di động. Bạn có thể dễ dàng sử dụng như việc bạn đọc báo trên máy tính.

	Tình năng chính :

	- Ứng dụng đọc báo Cafe24h với giao diện hiện đại, mượt mà

	- Nội dung phong phú và tốc độ nhanh, cập nhật liên tục trong ngày.

	- Với trên 20 chuyên mục khác nhau như bóng đá, xã hội, hình sự, thế giới ..vv. Đáp ứng mọi lứa tuổi hay nhu cầu của người sử dụng.

	Hi vọng với Ứng dụng Cafe24h sẽ giúp bạn có những phú giây giải trí cũng như thư giãn mỗi ngày.
', N'http://s.qplay.vn/images/product/icon/unnamed-53894e7a99442-100090614-015904.png', N'
                        	Dung lượng: &#32;
            	3.9Mb
				Lượt tải: &#32;3,019
									', NULL, N'http://s.qplay.vn/1002-0-0-0--1/download/Cafe24h---Ung-dung-doc-bao-so-1-Viet-Nam.html', N'http://s.qplay.vn/images/product/poster/cafe24h-banner-480-5375f7d63e75e-480300514-051456.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/s1300514-051452.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/s2300514-051452.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/s3300514-051453.png">
		                </li>', CAST(0x0000A6CD01051AE9 AS DateTime), NULL, N'http://s.qplay.vn/1002-0-0-0--1/ung-dung/Cafe24h---Ung-dung-doc-bao-so-1-Viet-Nam.html', 225)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (35, N'Bí mật ngôi mộ cổ', N'Khi chết đang đến gần,Zombies mang những nỗi sợ chết người!
Đây là một trò chơi chiến lược cũng như trò chơi hành động .
Bảo vệ ngôi mộ cổ trước sự sâm lăng của Zombies với kỹ năng đặc biệt của riêng mình, vì vậy bạn sẽ cần phải suy nghĩ nhanh và có một chiến lược thành công và chống lại tất cả trước khi chúng xâm nhập vào nhà của bạn và ám sát bạn .
Hãy cẩn thận với cách dùng người của bạn,vì bạn bị hạn chế vũ khí và đạn dược 
Bạn phải thật nhanh để bố trí thông minh và hành động.
Súng, Armored Xe tăng, Spears và Dao - Bạn có một loại kỳ lạ của vũ khí , nhưng bạn phải sử dụng chúng một cách khôn ngoan Hãy để anh hùng của bạn giúp bạn có được điểm trong một thời gian, nhưng không hình thành thói quen luôn luôn nhận được trong một sửa chữa! Vì vậy, hãy cẩn thận khi gặp phải sức mạnh của các chúa Zombie !
Ứng dụng này cung cấp trong ứng dụng mua hàng . Bạn có thể vô hiệu hóa mua trong ứng dụng sử dụng cài đặt thiết bị của bạn.', N'
	Khi chết đang đến gần,Zombies mang những nỗi sợ chết người!

	Đây là một trò chơi chiến lược cũng như trò chơi hành động .

	Bảo vệ ngôi mộ cổ trước sự sâm lăng của Zombies với kỹ năng đặc biệt của riêng mình, vì vậy bạn sẽ cần phải suy nghĩ nhanh và có một chiến lược thành công và chống lại tất cả trước khi chúng xâm nhập vào nhà của bạn và ám sát bạn .

	Hãy cẩn thận với cách dùng người của bạn,vì bạn bị hạn chế vũ khí và đạn dược&nbsp;

	Bạn phải thật nhanh để bố trí thông minh và hành động.

	Súng, Armored Xe tăng, Spears và Dao - Bạn có một loại kỳ lạ của vũ khí , nhưng bạn phải sử dụng chúng một cách khôn ngoan Hãy để anh hùng của bạn giúp bạn có được điểm trong một thời gian, nhưng không hình thành thói quen luôn luôn nhận được trong một sửa chữa! Vì vậy, hãy cẩn thận khi gặp phải sức mạnh của các chúa Zombie !

	Ứng dụng này cung cấp trong ứng dụng mua hàng . Bạn có thể vô hiệu hóa mua trong ứng dụng sử dụng cài đặt thiết bị của bạn.
', N'http://s.qplay.vn/images/product/icon/unnamed210514-015648.png', N'
                        	Dung lượng: &#32;
            	22.6Mb
				Lượt tải: &#32;8,405
									', NULL, N'http://s.qplay.vn/962-0-0-0--1/download/Bi-mat-ngoi-mo-co.html', N'http://s.qplay.vn/images/product/poster/com210514-020312.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/1210514-020307.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2210514-020307.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3210514-020307.png">
		                </li>', CAST(0x0000A6CD01051C30 AS DateTime), NULL, N'http://s.qplay.vn/962-0-0-0--1/game/Bi-mat-ngoi-mo-co.html', 226)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (36, N'Anh không đào mỏ', N'Hãy sẵn sàng cho cuộc phiêu lưu sử thi này!
Công việc của bạn là để thu thập đá quý và thỏi vàng! Sẽ có bất ngờ trên đường đi, và quà tặng đặc biệt mà bạn kiếm được nếu bạn may mắn! Phá vỡ những quả trứng đá để lộ những gì bên trong nó và nhận tất cả các đá quý cho bộ sưu tập cá nhân của nhà thám hiểm của bạn!
Tìm những con đường mới và thú vị để khám phá trên thiết bị của mình, và đi qua những độ khó đặc biệt để kiếm được nhiều hơn! Với nhiều môi trường thú vị,qua các hang động Crazy,Dưới Thế giới,Trong lòng đất,Vùng đất tuyết,trên máy hơi nước, tìm đường vào rừng Jurassic và khám phá lăng mộ của Pharaoh, tất cả điều này và nhiều cấp độ bất ngờ mà bạn sẽ ngạc nhiên với kịch bản đầy màu sắc của họ.
Bạn cũng có thể trang bị cho xe của bạn với bộ tăng sức mạnh để mở rộng cơ hội của bạn bên trong,Hãy hoàn thành nhiệm vụ và xếp hạng cao nhất, để trở thành nhà thám hiểm bậc thầy nào!', N'
	Hãy sẵn sàng cho cuộc phiêu lưu sử thi này!

	Công việc của bạn là để thu thập đá quý và thỏi vàng! Sẽ có bất ngờ trên đường đi, và quà tặng đặc biệt mà bạn kiếm được nếu bạn may mắn! Phá vỡ những quả trứng đá để lộ những gì bên trong nó và nhận tất cả các đá quý cho bộ sưu tập cá nhân của nhà thám hiểm của bạn!

	Tìm những con đường mới và thú vị để khám phá trên thiết bị của mình, và đi qua những độ khó đặc biệt để kiếm được nhiều hơn! Với nhiều môi trường thú vị,qua các hang động Crazy,Dưới Thế giới,Trong lòng đất,Vùng đất tuyết,trên máy hơi nước, tìm đường vào rừng Jurassic và khám phá lăng mộ của Pharaoh, tất cả điều này và nhiều cấp độ bất ngờ mà bạn sẽ ngạc nhiên với kịch bản đầy màu sắc của họ.

	Bạn cũng có thể trang bị cho xe của bạn với bộ tăng sức mạnh để mở rộng cơ hội của bạn bên trong,Hãy hoàn thành nhiệm vụ và xếp hạng cao nhất, để trở thành nhà thám hiểm bậc thầy nào!
', N'http://s.qplay.vn/images/product/icon/Rail_Rush_icon-300x300130514-101217.png', N'
                        	Dung lượng: &#32;
            	16.9Mb
				Lượt tải: &#32;12,002
									', NULL, N'http://s.qplay.vn/912-0-0-0--1/download/Anh-khong-dao-mo.html', N'http://s.qplay.vn/images/product/poster/banner-rail-rush130514-101236.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/2130514-101233.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3130514-101234.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4130514-101234.png">
		                </li>', CAST(0x0000A6CD01051CE9 AS DateTime), NULL, N'http://s.qplay.vn/912-0-0-0--1/game/Anh-khong-dao-mo.html', 227)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (37, N'Đấu trường sinh tử', N'Tựa game Đấu Trường Lửa vốn không xa lạ gì với nhiều người chơi game đối kháng, cái tên của nó làm người ta có thể liên tưởng ngay tới những trận chiến khốc liệt nơi mà ở đó không có chỗ cho sự khoan nhượng. Có thể kể đến 1 vài cái tên rất nổi bật trong loạt game này như Ruy, Ken, Vega, Chun-Li, Bi-Son… và với những người từng đam mê thể loại này thì việc được thưởng thức game trên nhiều hệ máy luôn là một trải nghiệm tuyệt vời.', N'
	&nbsp;Tựa game Đấu Trường Lửa vốn không xa lạ gì với nhiều người chơi game đối kháng, cái tên của nó làm người ta có thể liên tưởng ngay tới những trận chiến khốc liệt nơi mà ở đó không có chỗ cho sự khoan nhượng. Có thể kể đến 1 vài cái tên rất nổi bật trong loạt game này như Ruy, Ken, Vega, Chun-Li, Bi-Son… và với những người từng đam mê thể loại này thì việc được thưởng thức game trên nhiều hệ máy luôn là một trải nghiệm tuyệt vời.
', N'http://s.qplay.vn/images/product/icon/ryu080514-100756.png', N'
                        	Dung lượng: &#32;
            	18Mb
				Lượt tải: &#32;12,735
									', NULL, N'http://s.qplay.vn/906-0-0-0--1/download/Dau-truong-sinh-tu.html', N'http://s.qplay.vn/images/product/poster/980_The_King_of_Fighters_XIII_Steam_Edition_banner_1080514-100535.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/5080514-100533.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/6080514-100533.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/7080514-100533.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/8080514-100533.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/9080514-100533.jpg">
		                </li>', CAST(0x0000A6CD01051DA2 AS DateTime), NULL, N'http://s.qplay.vn/906-0-0-0--1/game/Dau-truong-sinh-tu.html', 228)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (38, N'Sky Force 2014', N'Tinny là một chàng lính cứu hỏa trẻ tự mãn luôn vi phạm kỉ luật. Sự ngạo mạn của nó vô tình đã cướp đi mạng sống của CAPTAIN BEN trong một điệp vụ. Từ đó Tinny sống trong mặc cảm tội lỗi và từ bỏ ước mơ làm lính cứu hỏa của mình. Cho đến một ngày đám cháy lại bốc lên và Tinny quyết định tiếp tục hành trình vượt qua nỗi sợ hãi của mình...
Trò chơi Sky Force phiên bản 2014, một mini game đơn giản trên thiết bị di động theo dạng bắn máy bay, kiếm đồ chơi nâng cấp sức mạnh. Sky Force ra đời cách đây 10 năm, rất được yêu thích và xuất hiện trên nhiều nền tảng điện thoại khác nhau, đặc biệt là những máy chạy Java. Và để kỉ niệm cột mốc đó thì giờ đây nó đã được làm mới với phiên bản 2014, có đồ họa đẹp hơn, cách chơi cũng phong phú đa dạng hơn, trong đó có bullet-time, hiệu ứng làm chậm lại mọi vật để chúng ta dễ né đạn hơn.', N'
	Tinny là một chàng lính cứu hỏa trẻ tự mãn luôn vi phạm kỉ luật. Sự ngạo mạn của nó vô tình đã cướp đi mạng sống của CAPTAIN BEN trong một điệp vụ. Từ đó Tinny sống trong mặc cảm tội lỗi và từ bỏ ước mơ làm lính cứu hỏa của mình. Cho đến một ngày đám cháy lại bốc lên và Tinny quyết định tiếp tục hành trình vượt qua nỗi sợ hãi của mình...

	Trò chơi Sky Force phiên bản 2014, một mini game đơn giản trên thiết bị di động theo dạng bắn máy bay, kiếm đồ chơi nâng cấp sức mạnh. Sky Force ra đời cách đây 10 năm, rất được yêu thích và xuất hiện trên nhiều nền tảng điện thoại khác nhau, đặc biệt là những máy chạy Java. Và để kỉ niệm cột mốc đó thì giờ đây nó đã được làm mới với phiên bản 2014, có đồ họa đẹp hơn, cách chơi cũng phong phú đa dạng hơn, trong đó có bullet-time, hiệu ứng làm chậm lại mọi vật để chúng ta dễ né đạn hơn.
', N'http://s.qplay.vn/images/product/icon/SkyForce-icon020514-021007.png', N'
                        	Dung lượng: &#32;
            	4.1Mb
				Lượt tải: &#32;8,715
									', NULL, N'http://s.qplay.vn/902-0-0-0--1/download/Sky-Force-2014.html', N'http://s.qplay.vn/images/product/poster/sky-force-2012_36941390290722020514-021243.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/SkyForce-1020514-020808.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/SkyForce-2020514-020808.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/SkyForce-3020514-020808.jpg">
		                </li>', CAST(0x0000A6CD01051E66 AS DateTime), NULL, N'http://s.qplay.vn/902-0-0-0--1/game/Sky-Force-2014.html', 229)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (39, N'Chicken Invaders 3', N'Trong nhiều thế kỷ, chúng ta đã áp bức loài gà, nướng, quay, hầm, và nhồi nhét chúng trong bánh. Đã đến lúc chúng ta phải trả. Gà đang xâm nhập trái đất, tìm trả thù cho sự áp bức của anh trai trần của họ! Đó là thời gian cho bạn để đấu tranh cho quyền tổ tiên của chúng tôi để món trứng tráng. Bạn sẽ thành công? 
Tương lai của bánh mì kẹp thịt gà sẽ được an toàn? Hoặc bạn sẽ kết thúc như là một phần của trình đơn trong một nhà hàng thịt gà thiên hà?
Có thể 4 người cùng chơi trên 1 game.
Hành trình phải vượt qua 12 dải sao
Khám phá 6 loại vũ khí cực mạnh
Thu thập tiền nhiều
Lưu điểm trên Internet. Bạn có thể lưu lại điểm của mình để mọi người trên mạng đều biết đến bạn', N'
	Trong nhiều thế kỷ, chúng ta đã áp bức loài gà, nướng, quay, hầm, và nhồi nhét chúng trong bánh. Đã đến lúc chúng ta phải trả. Gà đang xâm nhập trái đất, tìm trả thù cho sự áp bức của anh trai trần của họ! Đó là thời gian cho bạn để đấu tranh cho quyền tổ tiên của chúng tôi để món trứng tráng. Bạn sẽ thành công?&nbsp;

	Tương lai của bánh mì kẹp thịt gà sẽ được an toàn? Hoặc bạn sẽ kết thúc như là một phần của trình đơn trong một nhà hàng thịt gà thiên hà?

	Có thể 4 người cùng chơi trên 1 game.

	Hành trình phải vượt qua 12 dải sao

	Khám phá 6 loại vũ khí cực mạnh

	Thu thập tiền nhiều

	Lưu điểm trên Internet. Bạn có thể lưu lại điểm của mình để mọi người trên mạng đều biết đến bạn
', N'http://s.qplay.vn/images/product/icon/unnamed250414-102836.png', N'
                        	Dung lượng: &#32;
            	18.2Mb
				Lượt tải: &#32;14,999
									', NULL, N'http://s.qplay.vn/899-0-0-0--1/download/Chicken-Invaders-3.html', N'http://s.qplay.vn/images/product/poster/game_info_feature250414-102205.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/chicken_invaders_3_easter_edition-344383-1267668339250414-102156.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/chicken_invaders_3-350913-1269309901250414-102156.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/chicken-invaders-2-1250414-102156.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/chicken-invaders-3-22250414-102156.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/chicken-invaders-4thumb2250414-102156.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/chickeninvaders41250414-102156.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/images250414-102156.jpg">
		                </li>', CAST(0x0000A6CD01051F39 AS DateTime), NULL, N'http://s.qplay.vn/899-0-0-0--1/game/Chicken-Invaders-3.html', 230)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (40, N'Đường đua rực lửa', N'Đây là một trò chơi đua xe độc ​​đáo. Mục tiêu của bạn không phải là chỉ để tránh những trở ngại nữa, bạn nên dùng vũ khí của bạn và tiêu diệt đối thủ cạnh tranh khác trong trò chơi này!Tro chơi đồ họa 3D, động cơ thực tế với những cảnh trò chơi hoành tráng, kiểm soát trọng lực, và hiệu ứng âm thanh sống động. Tất cả những tính năng này sẽ cung cấp cho bạn một trải nghiệm chưa từng có trò chơi đua xe!
- Chướng ngại vật phong phú và đa dạng cung cấp cho bạn những thách thức chưa từng có!
- Hệ thống độc đáo khi cảnh sát đuổi theo,khiến cho bạn cảm giác trò chơi kích thích nhiều hơn nữa!
- Tạo động cơ hoàn hảo của bạn với hệ thống tăng cường và nâng cấp!
- Nghiêng điện thoại hoặc máy tính bảng để kiểm soát lại động cơ bên phải hoặc trái
- Thu thập tất cả các loại vũ khí và ném vào tay đua có động cơ khác
- Chạm vào màn hình để tăng tốc độ,hãy để ý bình N2o của bạn. Vì vậy bạn nên chú ý thu thập N2o dọc đường.
- Tăng tốc độ và chuyển hướng linh hoạt, chạy trốn khỏi cảnh sát!
- Mỗi động cơ có thể được tăng cường. Tạo ra động cơ mạnh nhất của bạn!
- Thu thập tiền xu để mở khóa động cơ khác!', N'
	Đây là một trò chơi đua xe độc ​​đáo. Mục tiêu của bạn không phải là chỉ để tránh những trở ngại nữa, bạn nên dùng vũ khí của bạn và tiêu diệt đối thủ cạnh tranh khác trong trò chơi này!Tro chơi đồ họa 3D, động cơ thực tế với những cảnh trò chơi hoành tráng, kiểm soát trọng lực, và hiệu ứng âm thanh sống động. Tất cả những tính năng này sẽ cung cấp cho bạn một trải nghiệm chưa từng có trò chơi đua xe!

	- Chướng ngại vật phong phú và đa dạng cung cấp cho bạn những thách thức chưa từng có!

	- Hệ thống độc đáo khi cảnh sát đuổi theo,khiến cho bạn cảm giác trò chơi kích thích nhiều hơn nữa!

	- Tạo động cơ hoàn hảo của bạn với hệ thống tăng cường và nâng cấp!

	- Nghiêng điện thoại hoặc máy tính bảng để kiểm soát lại động cơ bên phải hoặc trái

	- Thu thập tất cả các loại vũ khí và ném vào tay đua có động cơ khác

	- Chạm vào màn hình để tăng tốc độ,hãy để ý bình N2o của bạn. Vì vậy bạn nên chú ý thu thập N2o dọc đường.

	- Tăng tốc độ và chuyển hướng linh hoạt, chạy trốn khỏi cảnh sát!

	- Mỗi động cơ có thể được tăng cường. Tạo ra động cơ mạnh nhất của bạn!

	- Thu thập tiền xu để mở khóa động cơ khác!
', N'http://s.qplay.vn/images/product/icon/app_icon210414-104734240414-085759.png', N'
                        	Dung lượng: &#32;
            	19.4Mb
				Lượt tải: &#32;18,745
									', NULL, N'http://s.qplay.vn/893-0-0-0--1/download/Duong-dua-ruc-lua.html', N'http://s.qplay.vn/images/product/poster/BANNER__Moto-GP-13210414-102239240414-085430.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/1210414-102236240414-085425.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2210414-102236240414-085425.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3210414-102236240414-085425.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4210414-102236240414-085425.jpg">
		                </li>', CAST(0x0000A6CD01052009 AS DateTime), NULL, N'http://s.qplay.vn/893-0-0-0--1/game/Duong-dua-ruc-lua.html', 231)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (41, N'Đua xe công thức 1', N'Những tay đua siêu hạng, những chiếc xe công thức 1 siêu khủng. Bạn đã phải là một người có tinh thần thép để tham gia đường đua tử thần này. Với hàng trăm mẫu xe của các nhãn hiệu nổi tiếng trên thế giới kèm theo với những quốc lộ đông đúc ở khắp nơi. Nào hãy nhấn ga tham gia vào game Đua Xe Công Thức 1.', N'
	Những tay đua siêu hạng, những chiếc xe công thức 1 siêu khủng. Bạn đã phải là một người có tinh thần thép để tham gia đường đua tử thần này. Với hàng trăm mẫu xe của các nhãn hiệu nổi tiếng trên thế giới kèm theo với những quốc lộ đông đúc ở khắp nơi. Nào hãy nhấn ga tham gia vào game Đua Xe Công Thức 1.
', N'http://s.qplay.vn/images/product/icon/12110414-040931.png', N'
                        	Dung lượng: &#32;
            	35.9Mb
				Lượt tải: &#32;21,393
									', NULL, N'http://s.qplay.vn/880-0-0-0--1/download/Dua-xe-cong-thuc-1.html', N'http://s.qplay.vn/images/product/poster/980_F1_2013_banner110414-040603.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1110414-040611.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2110414-040611.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3110414-040611.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4110414-040611.jpg">
		                </li>', CAST(0x0000A6CD010520D9 AS DateTime), NULL, N'http://s.qplay.vn/880-0-0-0--1/game/Dua-xe-cong-thuc-1.html', 232)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (42, N'Ai thông minh hơn hs lớp 5 - New Version', N'Game show nổi tiếng của thế giới cũng như ở Việt Nam "Ai thong minh hon hs lop 5" nay đã chính thức có mặt trên Android. Bạn muốn thử sức mình với các em học sinh lớp 5 không chứ . Xem mình có giỏi bằng các e nhỏ không nhé.
Ai thong minh hon hs lop 5 miễn phí 100%
Cách chơi :
- Mô tả chân thật nhật như game show thực tế
- Các câu hỏi đúng với nhiều lĩnh vực khác nhau.
- Đồ hoạ + âm thanh đẹp mắt và sống động
Nào còn đợi gì nữa mau mau đấu trí cùng các em nhỏ với Ai thong minh hon hs lop 5 nào.', N'
	Game show nổi tiếng của thế giới cũng như ở Việt Nam "Ai thong minh hon hs lop 5" nay đã chính thức có mặt trên Android. Bạn muốn thử sức mình với các em học sinh lớp 5 không chứ . Xem mình có giỏi bằng các e nhỏ không nhé.

	Ai thong minh hon hs lop 5 miễn phí 100%

	Cách chơi :

	- Mô tả chân thật nhật như game show thực tế

	- Các câu hỏi đúng với nhiều lĩnh vực khác nhau.

	- Đồ hoạ + âm thanh đẹp mắt và sống động

	Nào còn đợi gì nữa mau mau đấu trí cùng các em nhỏ với Ai thong minh hon hs lop 5 nào.
', N'http://s.qplay.vn/images/product/icon/72150314-102052.png', N'
                        	Dung lượng: &#32;
            	10.1Mb
				Lượt tải: &#32;13,027
									', NULL, N'http://s.qplay.vn/837-0-0-0--1/download/Ai-thong-minh-hon-hs-lop-5---New-Version.html', N'http://s.qplay.vn/images/product/poster/480150314-102313.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/screen-1150314-102127.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen-2150314-102127.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen-3150314-102128.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen-4150314-102129.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen-5150314-102130.png">
		                </li>', CAST(0x0000A6CD0105219F AS DateTime), NULL, N'http://s.qplay.vn/837-0-0-0--1/game/Ai-thong-minh-hon-hs-lop-5---New-Version.html', 233)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (43, N'Bảo vệ thánh địa', N'Thế giới lâm nguy, các thế lực ma quái hoành hành với sự trỗi dậy của quỷ vương Drako, kẻ luôn tin là mình bất từ và luôn nuôi tham vọng thống trị thế giới. Đám yêu ma tay sai mặc sức đốt phá, giết chóc, cướp đi sinh mạng của rất nhiều rất nhiều những người dân vô tội. May thay vương quốc Radian có những chiến binh thật sự tinh nhuệ và anh dũng phi thường đã đứng ra chống lại thế lực ma quái. Liệu ai sẽ chiến thắng ? Liệu chính nghĩa có thắng được hung tàn. Tất cả đang đợi bạn thể hiện tài năng chiến đấu khi vào vai vị tướng tài ba vương quốc Radian chống lại thế lực yêu ma tàn bạo
- “Bảo vệ thánh địa” tự hào là game chiến thuật phòng thủ tháp made in Việt Nam lớn nhất hiện nay với 29 loại tháp, 15 loại quái vật, 24 loại nâng cấp, 4 kỹ năng tướng cùng 50 màn chơi và chế độ chơi khác nhau
Cách chơi: 
- Xây các tháp phòng thủ để bắn hạ hết những tên yêu ma tay sai của binh đoàn địa ngục
- 5 nhóm tháp có 5 chức năng khác nhau hãy kết hợp chúng với nhau thật tinh tế để tạo ra sức mạnh vô địch cản bước tiến của mọi kẻ địch
- Bạn hãy nhớ nâng cấp vũ khí hoặc kỹ năng ngay khi có thể để dễ dàng hơn trong việc tiêu diệt quân địch nhé
- Ngoài ra bạn hãy cố gắng sử dụng kỹ năng thật đúng lúc, đúng thời điểm chúng sẽ là rất cần thiết và đôi khi giúp bạn thay đổi cả cục diện trận đánh đấy', N'
	Thế giới lâm nguy, các thế lực ma quái hoành hành với sự trỗi dậy của quỷ vương Drako, kẻ luôn tin là mình bất từ và luôn nuôi tham vọng thống trị thế giới. Đám yêu ma tay sai mặc sức đốt phá, giết chóc, cướp đi sinh mạng của rất nhiều rất nhiều những người dân vô tội. May thay vương quốc Radian có những chiến binh thật sự tinh nhuệ và anh dũng phi thường đã đứng ra chống lại thế lực ma quái. Liệu ai sẽ chiến thắng ? Liệu chính nghĩa có thắng được hung tàn. Tất cả đang đợi bạn thể hiện tài năng chiến đấu khi vào vai vị tướng tài ba vương quốc Radian chống lại thế lực yêu ma tàn bạo

	- “Bảo vệ thánh địa” tự hào là game chiến thuật phòng thủ tháp made in Việt Nam lớn nhất hiện nay với 29 loại tháp, 15 loại quái vật, 24 loại nâng cấp, 4 kỹ năng tướng cùng 50 màn chơi và chế độ chơi khác nhau

	Cách chơi:&nbsp;

	- Xây các tháp phòng thủ để bắn hạ hết những tên yêu ma tay sai của binh đoàn địa ngục

	- 5 nhóm tháp có 5 chức năng khác nhau hãy kết hợp chúng với nhau thật tinh tế để tạo ra sức mạnh vô địch cản bước tiến của mọi kẻ địch

	- Bạn hãy nhớ nâng cấp vũ khí hoặc kỹ năng ngay khi có thể để dễ dàng hơn trong việc tiêu diệt quân địch nhé

	- Ngoài ra bạn hãy cố gắng sử dụng kỹ năng thật đúng lúc, đúng thời điểm chúng sẽ là rất cần thiết và đôi khi giúp bạn thay đổi cả cục diện trận đánh đấy
', N'http://s.qplay.vn/images/product/icon/72080314-093400.png', N'
                        	Dung lượng: &#32;
            	17.4Mb
				Lượt tải: &#32;14,203
									', NULL, N'http://s.qplay.vn/818-0-0-0--1/download/Bao-ve-thanh-dia.html', N'http://s.qplay.vn/images/product/poster/480080314-093455.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/Ban-do-fix080314-093450.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Gioi thieu fix080314-093450.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Main-menu-fix080314-093450.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Man-choi-fix080314-093450.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Nang-cap080314-093451.jpg">
		                </li>', CAST(0x0000A6CD01052274 AS DateTime), NULL, N'http://s.qplay.vn/818-0-0-0--1/game/Bao-ve-thanh-dia.html', 234)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (44, N'Doraemon Jump', N'Điều khiển Doremon nhảy cao và ăn bánh rán, mỗi chiếc bánh rán ăn được sẽ giúp Doremon nhảy cao hơn và sạc pin năng lượng để sử dụng các bảo bối. Các bảo bối có thể được mua từ cửa hàng bảo bối thế kỷ 22. 
+ Chong chóng tre
+ Đèn pin phóng đại
+ Mũ tàng hình
+ Vòng tròn an toàn
+ Doremini
+ Tên lửa phản lực
+ Đồng hồ ngưng đọng thời gian
+ Cỗ máy thời gian
Hãy cùng Doremon phiêu lưu vào thế kỷ 22 nhé', N'
	Điều khiển Doremon nhảy cao và ăn bánh rán, mỗi chiếc bánh rán ăn được sẽ giúp Doremon nhảy cao hơn và sạc pin năng lượng để sử dụng các bảo bối. Các bảo bối có thể được mua từ cửa hàng bảo bối thế kỷ 22.&nbsp;

	+ Chong chóng tre

	+ Đèn pin phóng đại

	+ Mũ tàng hình

	+ Vòng tròn an toàn

	+ Doremini

	+ Tên lửa phản lực

	+ Đồng hồ ngưng đọng thời gian

	+ Cỗ máy thời gian

	Hãy cùng Doremon phiêu lưu vào thế kỷ 22 nhé
', N'http://s.qplay.vn/images/product/icon/unnamed030314-125950.png', N'
                        	Dung lượng: &#32;
            	11.1Mb
				Lượt tải: &#32;9,327
									', NULL, N'http://s.qplay.vn/803-0-0-0--1/download/Doraemon-Jump.html', N'http://s.qplay.vn/images/product/poster/bannerdoremon030314-125620.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot_2014-03-03-11-42-13030314-125617.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot_2014-03-03-11-42-20030314-125617.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot_2014-03-03-11-42-58030314-125617.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot_2014-03-03-11-43-12030314-125617.jpg">
		                </li>', CAST(0x0000A6CD01052331 AS DateTime), NULL, N'http://s.qplay.vn/803-0-0-0--1/game/Doraemon-Jump.html', 235)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (45, N'Bắn cá đại dương', N'Thế giới hải dương rộng lớn mở ra với muôn ngàn những điều kỳ thú và những loài cá lung linh sắc màu đã đến rất gần với bạn với 1 game đậm chất mỹ thuật và vui nhộn “Bắn cá đại dương”. Bạn là anh chàng thủy thủ dũng cảm của biển cả, hay là những công chúa xinh đẹp của biển khơi, hãy tham gia những chuyến thám hiểm đại dương của chúng tôi để đắm chìm trong thế giới tuyệt đẹp của các loại cá và nhanh tay đánh bắt những chú cá đẹp nhát và to nhất để khoe bạn bè. Nào hãy đi cùng tôi đến đại dương sâu thẳm và kỳ vĩ nhé
Cách chơi:
- Chạm vào màn hình để bắn nShững chú cá. Cá càng nhỏ thì càng dễ bắt, những chú cá to thì rất khỏe và khó bắt nếu không bắn liên tục chúng bằng những súng mạnh nhất
- Bạn có thể nâng cấp súng cho mạnh lên và bắn nhanh hơn
- Có 9 loại súng, chúng khác nhau ở sức mạnh và phạm vi đánh bắt được của lưới. Súng càng to bắn càng mạnh nhưng tốn càng nhiều đạn
- Bom nước được dùng để đánh bắt nhanh chóng cá và đem lại cho bạn những khoản thu kếch xù nhờ bắt được những chú cá thật là bự
- Bánh mỳ là mồi câu lý tưởng, chúng thu hút cá đến với vị trí bạn thả bánh, thật đơn giản thả bánh rồi quăng lưới bắt cá phải không
- Bom điện giúp làm cho mấy chú cá bị choáng váng và trở nên chậm chạp lúc đó hãy thả thật nhiều lưới để bắt những con cá bự nha
- Ngoài ra bạn còn nhận thêm sự trợ giúp của súng điện, chúng rất mạnh và giúp bạn tiêu diệt hết cá trong nháy mắt Game được bổ sung hệ thống nhiệm vụ phong phú, và hệ thống thưởng vàng tự động mỗi 10 giây. Bạn tha hồ bắn cá mà không lo hết đạn, còn gì vui hơn nhỉ, nào hãy nhanh tay down về và thưởng ngoạn thế giới hải dương tuyệt đẹp thôi các bạn', N'
	Thế giới hải dương rộng lớn mở ra với muôn ngàn những điều kỳ thú và những loài cá lung linh sắc màu đã đến rất gần với bạn với 1 game đậm chất mỹ thuật và vui nhộn “Bắn cá đại dương”. Bạn là anh chàng thủy thủ dũng cảm của biển cả, hay là những công chúa xinh đẹp của biển khơi, hãy tham gia những chuyến thám hiểm đại dương của chúng tôi để đắm chìm trong thế giới tuyệt đẹp của các loại cá và nhanh tay đánh bắt những chú cá đẹp nhát và to nhất để khoe bạn bè. Nào hãy đi cùng tôi đến đại dương sâu thẳm và kỳ vĩ nhé

	Cách chơi:

	- Chạm vào màn hình để bắn nShững chú cá. Cá càng nhỏ thì càng dễ bắt, những chú cá to thì rất khỏe và khó bắt nếu không bắn liên tục chúng bằng những súng mạnh nhất

	- Bạn có thể nâng cấp súng cho mạnh lên và bắn nhanh hơn

	- Có 9 loại súng, chúng khác nhau ở sức mạnh và phạm vi đánh bắt được của lưới. Súng càng to bắn càng mạnh nhưng tốn càng nhiều đạn

	- Bom nước được dùng để đánh bắt nhanh chóng cá và đem lại cho bạn những khoản thu kếch xù nhờ bắt được những chú cá thật là bự

	- Bánh mỳ là mồi câu lý tưởng, chúng thu hút cá đến với vị trí bạn thả bánh, thật đơn giản thả bánh rồi quăng lưới bắt cá phải không

	- Bom điện giúp làm cho mấy chú cá bị choáng váng và trở nên chậm chạp lúc đó hãy thả thật nhiều lưới để bắt những con cá bự nha

	- Ngoài ra bạn còn nhận thêm sự trợ giúp của súng điện, chúng rất mạnh và giúp bạn tiêu diệt hết cá trong nháy mắt Game được bổ sung hệ thống nhiệm vụ phong phú, và hệ thống thưởng vàng tự động mỗi 10 giây. Bạn tha hồ bắn cá mà không lo hết đạn, còn gì vui hơn nhỉ, nào hãy nhanh tay down về và thưởng ngoạn thế giới hải dương tuyệt đẹp thôi các bạn
', N'http://s.qplay.vn/images/product/icon/icon-72250114-040056220214-103938.png', N'
                        	Dung lượng: &#32;
            	19.2Mb
				Lượt tải: &#32;19,505
									', NULL, N'http://s.qplay.vn/795-0-0-0--1/download/Ban-ca-dai-duong.html', N'http://s.qplay.vn/images/product/poster/banner--480250114-040229220214-104002.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-135310250114-040207220214-103959.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-135245250114-040207220214-103959.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-082910250114-040206220214-103959.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-082739250114-040205220214-104000.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-082631250114-040203220214-104000.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-082509250114-040202220214-104000.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/device-2014-01-25-082351250114-040201220214-104000.jpg">
		                </li>', CAST(0x0000A6CD010523F3 AS DateTime), NULL, N'http://s.qplay.vn/795-0-0-0--1/game/Ban-ca-dai-duong.html', 236)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (46, N'Love Challenge', N'Vào 1 ngày xấu trời nọ, Jack và Jane đang đi dạo thì bất chợt lũ côn đồ ở đâu lao ra tính giở trò ăn cướp. Tuy nhiên, cặp đôi này không ngon ăn, dễ xơi như chúng tưởng, vì cả 2 đều là dân parkour chuyên nghiệp. Bọn côn đồ thì cũng đang đói, cả ngày chả kiếm đc vụ nào, thế nên chúng hò nhau đuổi theo hòng kiếm tí tiền mua pizza ăn. Vậy là cuộc rượt đuổi bắt đầu.
Nhiệm vụ của các bạn là điều khiển 2 nhân vật chính của chúng ta tránh né các chướng ngại vật trên đường, đồng thời ăn các vật phẩm để có thể thoát khỏi chúng càng xa càng tốt. Hãy chơi, cảm nhận, chia sẻ trên facebook và có 1 Lễ Tình Nhân hạnh phúc bên người yêu của mình, các bạn nhé!', N'Vào 1 ngày xấu trời nọ, Jack và Jane đang đi dạo thì bất chợt lũ côn đồ ở đâu lao ra tính giở trò ăn cướp. Tuy nhiên, cặp đôi này không ngon ăn, dễ xơi như chúng tưởng, vì cả 2 đều là dân parkour chuyên nghiệp. Bọn côn đồ thì cũng đang đói, cả ngày chả kiếm đc vụ nào, thế nên chúng hò nhau đuổi theo hòng kiếm tí tiền mua pizza ăn. Vậy là cuộc rượt đuổi bắt đầu.
Nhiệm vụ của các bạn là điều khiển 2 nhân vật chính của chúng ta tránh né các chướng ngại vật trên đường, đồng thời ăn các vật phẩm để có thể thoát khỏi chúng càng xa càng tốt. Hãy chơi, cảm nhận, chia sẻ trên facebook và có 1 Lễ Tình Nhân hạnh phúc bên người yêu của mình, các bạn nhé!


', N'http://s.qplay.vn/images/product/icon/72x72280114-031737.png', N'
                        	Dung lượng: &#32;
            	15.2Mb
				Lượt tải: &#32;6,962
									', NULL, N'http://s.qplay.vn/781-0-0-0--1/download/Love-Challenge.html', N'http://s.qplay.vn/images/product/poster/Banner-Lochallenge-full280114-031747.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot 1280114-031759.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot 2280114-031802.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot 3280114-031803.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Screenshot 4280114-031809.png">
		                </li>', CAST(0x0000A6CD010524F9 AS DateTime), NULL, N'http://s.qplay.vn/781-0-0-0--1/game/Love-Challenge.html', 237)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (47, N'Nông trại huyền thoại', N'Thị trấn " Cối xay gió "  từng là một thị trấn hết sức xinh đẹp và sầm uất !
Những mặt hàng nông sản ở đây tốt đến nỗi mà nó trở thành mục tiêu săn lùng của các thương gia từ khắp nơi trên thế giới. Tuy nhiên, không  hiểu vì lý do gì mà vài năm gần đây tất cả các nông trại trong thị trấn đều bị mất mùa trầm trọng. Dù là Cà rốt, Khoai tây, Cà chua hay Nấm đều bị giảm sản lượng xuống đến mức báo động.
Những phiên chợ lớn hàng năm mở ra rồi lại chìm trong thất vọng, số lượng người mua bán thưa dần và chẳng còn ai nhớ đến nó nữa. Tiêp đó thị trấn còn phải đối mặt với khó khăn lớn nhất từ trước đến giờ khi lão thị trưởng quyết định bán dần những mảnh đất cho khu công nghiệp. 
Làng mạc tiêu điều và dân làng cũng dần chuyển sang nơi khác ...
Và bạn sẽ được nhận một nông trại nhỏ sắp tàn lụi ven thị trấn, bằng sự siêng năng của mình bạn sẽ vực dậy nó và đưa cả thị tấn trở lại những ngày huy hoàng như trước kia.
Các tính năng nổi bật:
-Sử dụng hình ảnh các trái cây nghộ nghĩnh dễ thương
-Dễ chơi, dễ nắm bắt nhưng đạt điểm cao trên top cao thủ thì không có dễ đâu nhé.
-Cách chơi rất đơn giản, nối các loại hoa quả cùng loại và loại bỏ chúng một cách nhanh nhất.
-Chú ý trạng thái hưng phấn của hoa quả để nhân combo  điểm cao hơn.
-Trong shop VIP có bán nhiều loại vật phẩm rất thú vị, hãy khám phá chúng nhé.
Với phong cách đồ họa tươi sáng dễ thương và âm thanh vui nhộn, chắc chắn Farm Saga: Nông trại huyền thoại sẽ mang đến cho bạn những giây phút giải trí thú vị nhất. 
Nhanh tay thu hoạch nào !', N'
	Thị trấn " Cối xay gió " &nbsp;từng là một thị trấn hết sức xinh đẹp và sầm uất !

	Những mặt hàng nông sản ở đây tốt đến nỗi mà nó trở thành mục tiêu săn lùng của các thương gia từ khắp nơi trên thế giới. Tuy nhiên, không &nbsp;hiểu vì lý do gì mà vài năm gần đây tất cả các nông trại trong thị trấn đều bị mất mùa trầm trọng. Dù là Cà rốt, Khoai tây, Cà chua hay Nấm đều bị giảm sản lượng xuống đến mức báo động.

	Những phiên chợ lớn hàng năm mở ra rồi lại chìm trong thất vọng, số lượng người mua bán thưa dần và chẳng còn ai nhớ đến nó nữa. Tiêp đó thị trấn còn phải đối mặt với khó khăn lớn nhất từ trước đến giờ khi lão thị trưởng quyết định bán dần những mảnh đất cho khu công nghiệp.&nbsp;

	Làng mạc tiêu điều và dân làng cũng dần chuyển sang nơi khác ...

	Và bạn sẽ được nhận một nông trại nhỏ sắp tàn lụi ven thị trấn, bằng sự siêng năng của mình bạn sẽ vực dậy nó và đưa cả thị tấn trở lại những ngày huy hoàng như trước kia.

	Các tính năng nổi bật:

	-Sử dụng hình ảnh các trái cây nghộ nghĩnh dễ thương

	-Dễ chơi, dễ nắm bắt nhưng đạt điểm cao trên top cao thủ thì không có dễ đâu nhé.

	-Cách chơi rất đơn giản, nối các loại hoa quả cùng loại và loại bỏ chúng một cách nhanh nhất.

	-Chú ý trạng thái hưng phấn của hoa quả để nhân combo &nbsp;điểm cao hơn.

	-Trong shop VIP có bán nhiều loại vật phẩm rất thú vị, hãy khám phá chúng nhé.

	Với phong cách đồ họa tươi sáng dễ thương và âm thanh vui nhộn, chắc chắn Farm Saga: Nông trại huyền thoại sẽ mang đến cho bạn những giây phút giải trí thú vị nhất.&nbsp;

	Nhanh tay thu hoạch nào !
', N'http://s.qplay.vn/images/product/icon/icon-72x72230114-093220.png', N'
                        	Dung lượng: &#32;
            	23.5Mb
				Lượt tải: &#32;15,925
									', NULL, N'http://s.qplay.vn/775-0-0-0--1/download/Nong-trai-huyen-thoai.html', N'http://s.qplay.vn/images/product/poster/banner480x235220114-051951.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/q1220114-051920.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/q2220114-051920.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/q3220114-051920.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/q4220114-051920.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/q5220114-051920.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/q6220114-051920.jpg">
		                </li>', CAST(0x0000A6CD010525C4 AS DateTime), NULL, N'http://s.qplay.vn/775-0-0-0--1/game/Nong-trai-huyen-thoai.html', 238)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (48, N'Boom nấm lùn', N'Ở một vùng đất xa ơi là xa… lâu ơi là lâu ….đã tồn tại một  vương  quốc Nấm Lùn trù phú xanh tươi. Ở đây có những cư dân Nấm Lùn xinh đẹp và cần cù lao động, điều đặc biệt các cư dân này là những trái cây biết đi biết nói biết hát ^^
 Một ngày kia xuất hiện 1 gã thổ dân vô cùng hung dữ, hắn cực kỳ thích thú và them khát các cư dân trái cây xinh đẹp và thơm ngon. Vì vậy hắn đã lôi kéo đám trái cây xấu bụng lười lao động bằng cách cho chúng cai trị cả Vương Quốc Nấm Lùn miễn là hang ngày “cúng tế” những cư dân trái cây thơm ngon cho hắn giải khát và…xay sinh tố uống dần. Hắn phong cho chúng những chức vụ như Chúa tể Thanh Long, Đại tá Dưa Hấu, Bà Chúa Tuyết,…giúp hắn đàn áp cư dân Nấm Lùn. Nhưng có 4 chiến binh Nấm Lùn xinh đẹp và dũng cảm quyết tâm chống lại âm mưu ác độc của bọn xấu xa.  

Còn cần chờ gì nữa bạn hãy nhập vai 1 trong 4 chiến binh Nấm Lùn đi chinh phục thử thách và giải cứu cả vương quốc ngay và luôn nào!!!!! 

Game với đồ họa chibi đáng yêu

Âm thanh ngộ nghĩnh vui vẻ.

Số lượng màn chơi với mode chơi phong phú.

Hệ thống chia sẻ điểm miễn phí lên facebook và với bạn bè chơi game.', N'
	Ở một vùng đất xa ơi là xa… lâu ơi là lâu ….đã tồn tại một vương quốc Nấm Lùn trù phú xanh tươi. Ở đây có những cư dân Nấm Lùn xinh đẹp và cần cù lao động, điều đặc biệt các cư dân này là những trái cây biết đi biết nói biết hát ^^ Một ngày kia xuất hiện 1 gã thổ dân vô cùng hung dữ, hắn cực kỳ thích thú và them khát các cư dân trái cây xinh đẹp và thơm ngon. Vì vậy hắn đã lôi kéo đám trái cây xấu bụng lười lao động bằng cách cho chúng cai trị cả Vương Quốc Nấm Lùn miễn là hang ngày “cúng tế” những cư dân trái cây thơm ngon cho hắn giải khát và…xay sinh tố uống dần. Hắn phong cho chúng những chức vụ như Chúa tể Thanh Long, Đại tá Dưa Hấu, Bà Chúa Tuyết,…giúp hắn đàn áp cư dân Nấm Lùn. Nhưng có 4 chiến binh Nấm Lùn xinh đẹp và dũng cảm quyết tâm chống lại âm mưu ác độc của bọn xấu xa.
	Còn cần chờ gì nữa bạn hãy nhập vai 1 trong 4 chiến binh Nấm Lùn đi chinh phục thử thách và giải cứu cả vương quốc ngay và luôn nào!!!!!
	Game với đồ họa chibi đáng yêu
	Âm thanh ngộ nghĩnh vui vẻ.
	Số lượng màn chơi với mode chơi phong phú.
	Hệ thống chia sẻ điểm miễn phí lên facebook và với bạn bè chơi game.
', N'http://s.qplay.vn/images/product/icon/icon72220114-105843.png', N'
                        	Dung lượng: &#32;
            	31.5Mb
				Lượt tải: &#32;12,109
									', NULL, N'http://s.qplay.vn/773-0-0-0--1/download/Boom-nam-lun.html', N'http://s.qplay.vn/images/product/poster/banner_s210114-095942.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1210114-095942.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2210114-095944.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3210114-095945.jpg">
		                </li>', CAST(0x0000A6CD0105267D AS DateTime), NULL, N'http://s.qplay.vn/773-0-0-0--1/game/Boom-nam-lun.html', 239)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (49, N'Tin nhắn chúc tết 2014', N'Năm mới đến rồi,hãy gửi những lời yêu thương đến bạn bè và gia đình mình lời chúc thân mật với bao tình cảm ta gửi gắm.Lời yêu thương dù nói mãi cũng chẳng bao giờ là thừa, tình yêu dù nhiều bao nhiêu cũng chẳng bao giờ là đủ. Hãy cho bạn bè, người thân và một nửa của bạn biết bạn yêu thương họ đến thế nào. Một tin nhắn, một e-mail chẳng làm mất của bạn bao nhiêu thời gian nhưng lại đem cho chúng ta một tình yêu vô hạn..', N'
	Năm mới đến rồi,hãy gửi những lời yêu thương đến bạn bè và gia đình mình lời chúc thân mật với bao tình cảm ta gửi gắm.Lời yêu thương dù nói mãi cũng chẳng bao giờ là thừa, tình yêu dù nhiều bao nhiêu cũng chẳng bao giờ là đủ. Hãy cho bạn bè, người thân và một nửa của bạn biết bạn yêu thương họ đến thế nào. Một tin nhắn, một e-mail chẳng làm mất của bạn bao nhiêu thời gian nhưng lại đem cho chúng ta một tình yêu vô hạn.

	Với những tính năng gửi SMS, gửi qua email, hay post tin nhắn lên Facebook sẽ giúp bạn bày tỏ tình cảm dễ dàng và nhanh chóng hơn. Hãy dùng app để thể hiện sự yêu thương của bạn với những người bạn yêu thương nhé!
', N'http://s.qplay.vn/images/product/icon/72200114-094232.png', N'
                        	Dung lượng: &#32;
            	0.5Mb
				Lượt tải: &#32;4,150
									', NULL, N'http://s.qplay.vn/770-0-0-0--1/download/Tin-nhan-chuc-tet-2014.html', N'http://s.qplay.vn/images/product/poster/480200114-094236.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/1200114-094240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2200114-094240.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3200114-094240.jpg">
		                </li>', CAST(0x0000A6CD0105271C AS DateTime), NULL, N'http://s.qplay.vn/770-0-0-0--1/ung-dung/Tin-nhan-chuc-tet-2014.html', 240)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (50, N'Người hùng', N'Một vùng đất chết, một vương quốc đang nguy kịch. Bạn có phải là người hùng muốn đến lên để khôi phuc lại vùng đất và vương quốc zola đó không?
Cách chơi :
- Chọn 1 trong 3 vị anh hùng
- Bầy mưu bố trận tấn công kẻ thù nguy hiểm
- Hệ thống skill + vũ khí đa dạng phong phú
Còn đợi gì nữa mau mau tải nào.', N'
	Một vùng đất chết, một vương quốc đang nguy kịch. Bạn có phải là người hùng muốn đến lên để khôi phuc lại vùng đất và vương quốc zola đó không?

	Cách chơi :

	- Chọn 1 trong 3 vị anh hùng

	- Bầy mưu bố trận tấn công kẻ thù nguy hiểm

	- Hệ thống skill + vũ khí đa dạng phong phú

	Còn đợi gì nữa mau mau tải nào.
', N'http://s.qplay.vn/images/product/icon/72300113-013023200114-090351.png', N'
                        	Dung lượng: &#32;
            	13.4Mb
				Lượt tải: &#32;10,435
									', NULL, N'http://s.qplay.vn/767-0-0-0--1/download/Nguoi-hung.html', N'http://s.qplay.vn/images/product/poster/480300113-013558200114-090431.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1300113-013551200114-090425.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2300113-013551200114-090425.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3300113-013551200114-090426.jpg">
		                </li>', CAST(0x0000A6CD010527EB AS DateTime), NULL, N'http://s.qplay.vn/767-0-0-0--1/game/Nguoi-hung.html', 241)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (51, N'Đặc nhiệm toàn cầu', N'Thế giới vẫn chưa bình yên, các lực lượng ly khai vẫn luôn nuôi tham vọng phá hoại và gây dựng thế lực. Nhưng đâu phải quốc gia nào cũng có thể bảo vệ chủ quyền và sinh mạng của dân thường bằng khả năng quân sự của mình. Vì thế “Lực lượng toàn cầu” - Global Operations (GO team), vào cuộc với những nhiệm vụ hết sức nguy hiểm trải dài từ châu Á sang châu Âu... những thành viên của GO team với điểm mạnh, điểm yếu riêng nhưng khi hợp sức sẽ tạo thành một lực lượng rất mạnh, cộng với trang thiết bị hiện đại đủ sức đối đầu với bất cứ thế lực xấu nào.
Global Operations thật sự cuốn hút người chơi ngay từ khâu chọn vũ khí bắt đầu nhiệm vụ mới. Vũ khí, quân trang rất thật và đa dạng với hơn 15 loại, từ AK47 quen thuộc cho đến súng ngắm AWP. Với các khoản tiền thưởng, người chơi có thể chọn cho mình những vũ khí tối tân hơn và tất nhiên hoàn thành nhiệm vụ nhanh hơn. 
Mỗi nhiệm vụ đều có một khoảng thời gian quy định, ở chế độ dễ (easy) hay bình thường (normal) thì khá dễ nhưng khi chơi ở mức khó (hard) thì địch bắn cực kỳ ghê gớm và việc hoàn thành nhiệm vụ đúng thời gian không hề dễ chút nào.
Nhiệm vụ trong game cũng khá đa dạng, khi giải cứu con tin, lúc lại phá hủy mục tiêu, gỡ bom hoặc tiêu diệt thủ lĩnh đối phương. 
Nào! Hãy vào vai các anh lính trong GO team để hành động, để trải nghiệm cảm giác anh hùng đặc nhiệm tham gia cứu thế giới!', N'
	Thế giới vẫn chưa bình yên, các lực lượng ly khai vẫn luôn nuôi tham vọng phá hoại và gây dựng thế lực. Nhưng đâu phải quốc gia nào cũng có thể bảo vệ chủ quyền và sinh mạng của dân thường bằng khả năng quân sự của mình. Vì thế “Lực lượng toàn cầu” - Global Operations (GO team), vào cuộc với những nhiệm vụ hết sức nguy hiểm trải dài từ châu Á sang châu Âu... những thành viên của GO team với điểm mạnh, điểm yếu riêng nhưng khi hợp sức sẽ tạo thành một lực lượng rất mạnh, cộng với trang thiết bị hiện đại đủ sức đối đầu với bất cứ thế lực xấu nào.

	Global Operations thật sự cuốn hút người chơi ngay từ khâu chọn vũ khí bắt đầu nhiệm vụ mới. Vũ khí, quân trang rất thật và đa dạng với hơn 15 loại, từ AK47 quen thuộc cho đến súng ngắm AWP. Với các khoản tiền thưởng, người chơi có thể chọn cho mình những vũ khí tối tân hơn và tất nhiên hoàn thành nhiệm vụ nhanh hơn.&nbsp;

	Mỗi nhiệm vụ đều có một khoảng thời gian quy định, ở chế độ dễ (easy) hay bình thường (normal) thì khá dễ nhưng khi chơi ở mức khó (hard) thì địch bắn cực kỳ ghê gớm và việc hoàn thành nhiệm vụ đúng thời gian không hề dễ chút nào.

	Nhiệm vụ trong game cũng khá đa dạng, khi giải cứu con tin, lúc lại phá hủy mục tiêu, gỡ bom hoặc tiêu diệt thủ lĩnh đối phương.&nbsp;

	Nào! Hãy vào vai các anh lính trong GO team để hành động, để trải nghiệm cảm giác anh hùng đặc nhiệm tham gia cứu thế giới!
', N'http://s.qplay.vn/images/product/icon/icon-72180114-112419.png', N'
                        	Dung lượng: &#32;
            	30.8Mb
				Lượt tải: &#32;15,237
									', NULL, N'http://s.qplay.vn/765-0-0-0--1/download/Dac-nhiem-toan-cau.html', N'http://s.qplay.vn/images/product/poster/banner180114-112455.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1180114-112452.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2180114-112452.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3180114-112452.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4180114-112453.jpg">
		                </li>', CAST(0x0000A6CD0105289F AS DateTime), NULL, N'http://s.qplay.vn/765-0-0-0--1/game/Dac-nhiem-toan-cau.html', 242)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (52, N'Cảnh sát hoàng gia', N'Luôn luôn bảo vệ dân chúng và hoàng gia,chống bạo loạn trên toàn lãnh thổ.Tác chiến khắp mọi nơi, tạo cho lực lượng bảo vệ chiến thắng nhanh chóng, đối phó được với các thách thức hiện nay; luôn sẵn sàng thực hiện nhiệm vụ tiếp theo; làm việc trong lực lượng lượng quốc phòng để gánh vác các nhiệm vụ chung khác."Điều này hỗ trợ cho mục đích của Bộ Quốc Phòng Quốc Tế "đảm bảo an ninh và bảo vệ Vương quốc và các vùng lãnh thổ thuộc sở hữu, bao gồm cả việc chống lại sự khủng bố; hỗ trợ cho chính sách đối ngoại của cả quốc gia để thực hiện mục đích thúc đẩy hoà bình và an ninh quốc tế.
Khi tham gia tấn công luôn tiên phong hàng đầu,không lo sợ trước bất kể thế lực thù địch nào.Sẵn sàng hy sinh vì nhiệm vụ của mình.Với tác phong nhanh nhạy và với kỹ năng nghiệp vụ cao,cảnh sát hoàng gia luôn là mối đe dọa cho toàn bộ quân địch phản loạn trong và ngoài quốc gia.', N'
	Luôn luôn bảo vệ dân chúng và hoàng gia,chống bạo loạn trên toàn lãnh thổ.Tác chiến khắp mọi nơi, tạo cho lực lượng bảo vệ chiến thắng nhanh chóng, đối phó được với các thách thức hiện nay; luôn sẵn sàng thực hiện nhiệm vụ tiếp theo; làm việc trong lực lượng lượng quốc phòng để gánh vác các nhiệm vụ chung khác."Điều này hỗ trợ cho mục đích của Bộ Quốc Phòng Quốc Tế "đảm bảo an ninh và bảo vệ Vương quốc và các vùng lãnh thổ thuộc sở hữu, bao gồm cả việc chống lại sự khủng bố; hỗ trợ cho chính sách đối ngoại của cả quốc gia để thực hiện mục đích thúc đẩy hoà bình và an ninh quốc tế.

	Khi tham gia tấn công luôn tiên phong hàng đầu,không lo sợ trước bất kể thế lực thù địch nào.Sẵn sàng hy sinh vì nhiệm vụ của mình.Với tác phong nhanh nhạy và với kỹ năng nghiệp vụ cao,cảnh sát hoàng gia luôn là mối đe dọa cho toàn bộ quân địch phản loạn trong và ngoài quốc gia.
', N'http://s.qplay.vn/images/product/icon/72240413-011456150114-092801.png', N'
                        	Dung lượng: &#32;
            	13.4Mb
				Lượt tải: &#32;10,225
									', NULL, N'http://s.qplay.vn/759-0-0-0--1/download/Canh-sat-hoang-gia.html', N'http://s.qplay.vn/images/product/poster/480240413-011526150114-092828.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1240413-011520150114-092825.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2240413-011520150114-092825.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3240413-011520150114-092825.jpg">
		                </li>', CAST(0x0000A6CD01052946 AS DateTime), NULL, N'http://s.qplay.vn/759-0-0-0--1/game/Canh-sat-hoang-gia.html', 243)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (53, N'Đua xe quăng xích', N'Đua xe quăng xích là trò chơi hãi hùng nhất từ trước tới nay.Tốc độ cao đến quay cuồng,cả thế giới như đang đổ dồn mọi con mắt vào ta.Xe đi tới đâu,khói chưa kịp bay đến đó.Được sự tài trợ phía bên Thổ,siêu xe ra đời,khói xe mịt mù như đêm đen,tiếng bô kêu như tiếng đại bác bắn ngoài đồng,bánh xe lăn nhanh trên đường chỉ còn lại vệt sáng.Thần kinh của bạn có tốt đến đâu,hãy tham gia và thử nghiệm,bạn sẽ biết được bản lĩnh tay đua siêu hạng thế nào.', N'
	Đua xe quăng xích là trò chơi hãi hùng nhất từ trước tới nay.Tốc độ cao đến quay cuồng,cả thế giới như đang đổ dồn mọi con mắt vào ta.Xe đi tới đâu,khói chưa kịp bay đến đó.Được sự tài trợ phía bên Thổ,siêu xe ra đời,khói xe mịt mù như đêm đen,tiếng bô kêu như tiếng đại bác bắn ngoài đồng,bánh xe lăn nhanh trên đường chỉ còn lại vệt sáng.Thần kinh của bạn có tốt đến đâu,hãy tham gia và thử nghiệm,bạn sẽ biết được bản lĩnh tay đua siêu hạng thế nào.
', N'http://s.qplay.vn/images/product/icon/unnamed130114-040154.png', N'
                        	Dung lượng: &#32;
            	27.7Mb
				Lượt tải: &#32;23,900
									', NULL, N'http://s.qplay.vn/757-0-0-0--1/download/Dua-xe-quang-xich.html', N'http://s.qplay.vn/images/product/poster/unnamed130114-040231.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1130114-040223.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2130114-040223.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3130114-040224.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4130114-040224.jpg">
		                </li>', CAST(0x0000A6CD01052A04 AS DateTime), NULL, N'http://s.qplay.vn/757-0-0-0--1/game/Dua-xe-quang-xich.html', 244)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (54, N'Ngọc rồng đại chiến', N'Người chơi game Đại Chiến Ngọc Rồng sẽ được hóa thân vào nhân vật Son Go ku để chiến đấu một mất một còn với các đại ma đầu như Picollo, Frieza, Cell để bảo vệ trái đất. Trên cuộc hành trình đi tiêu diệt những đại ma đầu đó, cậu bé gặp phải rất nhiều các vật cản cũng như những tên tay sai và phải chiến đấu với chúng để tìm ra nơi ẩn nấp của các đại ma đầu.
Nào hãy nhanh chóng tham gia Đại Chiến Ngọc rồng để bắt đầu chiến đấu!!!
Chúc các bạn chơi game vui vẻ!', N'
	Người chơi game Đại Chiến Ngọc Rồng sẽ được hóa thân vào nhân vật Son Go ku để chiến đấu một mất một còn với các đại ma đầu như Picollo, Frieza, Cell để bảo vệ trái đất. Trên cuộc hành trình đi tiêu diệt những đại ma đầu đó, cậu bé gặp phải rất nhiều các vật cản cũng như những tên tay sai và phải chiến đấu với chúng để tìm ra nơi ẩn nấp của các đại ma đầu.

	Nào hãy nhanh chóng tham gia Đại Chiến Ngọc rồng để bắt đầu chiến đấu!!!

	Chúc các bạn chơi game vui vẻ!
', N'http://s.qplay.vn/images/product/icon/icon130114-103301.png', N'
                        	Dung lượng: &#32;
            	14.3Mb
				Lượt tải: &#32;16,086
									', NULL, N'http://s.qplay.vn/753-0-0-0--1/download/Ngoc-rong-dai-chien.html', N'http://s.qplay.vn/images/product/poster/12130114-103132.png', N'<li>
		                    <img height="155" src="/images/product/intro-images/1130114-103128.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2130114-103128.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3130114-103128.png">
		                </li>', CAST(0x0000A6CD01052ADC AS DateTime), NULL, N'http://s.qplay.vn/753-0-0-0--1/game/Ngoc-rong-dai-chien.html', 245)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (55, N'Đế chế', N'Đến với Con đường chết là bạn đang đến với một thế loại trò chơi hoàn toàn mới, với nội dung về tiêu diệt thây ma nhưng cách chơi hoàn toàn khác khiến bạn sẽ nhiều cảm giác bất ngờ và những phút thư giãn lý thú', N'
	Đến với Con đường chết là bạn đang đến với một thế loại trò chơi hoàn toàn mới, với nội dung về tiêu diệt thây ma nhưng cách chơi hoàn toàn khác khiến bạn sẽ nhiều cảm giác bất ngờ và những phút thư giãn lý thú

	Cách chơi:

	-Một thể loại tích hợp giữa đua mua ô tô và bắn súng, bạn hãy chạy xe và sử dụng súng để bắn thây ma, trong màn hình trò chơi, sẽ không hiện thị hình súng bắn, bạn hãy đi theo chỉ dẫn những mũi tên đỏ được đặt ở các mép màn hình.

	-Bạn có thể bắn thây ma hoặc di chuyển chiếc xe bằng cách nghiêng trái hoặc phải sao cho thích hợp, việc di chuyển cũng giúp bạn tiêu diệt được chúng bằng cách đưa chúng sát vào những chiếc xe ô tô trên đường đi

	-Bạn sẽ có rất nhiều màn chơi khác nhau, như sa mạc, băng lạnh, sương mù, mỗi màn chơi sẽ tích hợp độ khó và dễ để bạn có được những cảm nhận khác nhau về trò chơi.

	-Tất nhiên về kho vũ khí những như xe bạn sẽ được nâng cấp nếu như bạn đạt đến một số điểm nhất định.

	và cuối cùng bạn hãy tự mình khám phá Con đường chết và thêm nhiều những thời gian thư giãn lý thú nhé.
', N'http://s.qplay.vn/images/product/icon/72120413-015436110114-095107.png', N'
                        	Dung lượng: &#32;
            	9.8Mb
				Lượt tải: &#32;17,331
									', NULL, N'http://s.qplay.vn/748-0-0-0--1/download/De-che.html', N'http://s.qplay.vn/images/product/poster/480120413-015500110114-095129.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1120413-015456110114-095126.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2120413-015456110114-095126.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3120413-015456110114-095127.jpg">
		                </li>', CAST(0x0000A6CD01052B89 AS DateTime), NULL, N'http://s.qplay.vn/748-0-0-0--1/game/De-che.html', 246)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (56, N'Nỗi sợ hãi', N'Nỗi sợ hãi nói về cuộc sống sau thảm họa dịch bệnh thây ma, về một nhóm nhỏ những người sống sót sau sự bùng nổ của đại dịch.Câu truyện của chúng ta là hoàn cảnh bị chúng bám theo trên đường, những người sống sót cố sức tìm một nơi trú thân mới, chạy trốn những thây ma ăn thịt sống.Hành động chủ đạo là đá đít các thây ma trên đường nhảy vào xe.Hãy cẩn thận đừng để chúng bám quá lâu mà bạn sẽ phải hối hận. Khi tình hình ngày càng trở nên hiểm nghèo, sự tuyệt vọng của nhóm người này đã đẩy họ đến bờ vực của sự mất trí. Dù đi đến đâu, họ cũng phải đối mặt với nỗi kinh hãi từ những thây ma, sự mất đoàn kết, cũng như sự đối địch của số nhỏ những người còn sống rải rác ở nơi khác chỉ quan tâm đến sự sống còn của riêng mình, khi mà trật tự xã hội trên toàn cầu đã sụp đổ,hãy cố chạy thật nhanh để có thể thoát thân đến 1 nơi nào đó treo cổ tự vẫn.............', N'
	Nỗi sợ hãi nói về cuộc sống sau thảm họa dịch bệnh thây ma, về một nhóm nhỏ những người sống sót sau sự bùng nổ của đại dịch.Câu truyện của chúng ta là hoàn cảnh bị chúng bám theo trên đường, những người sống sót cố sức tìm một nơi trú thân mới, chạy trốn những thây ma ăn thịt sống.Hành động chủ đạo là đá đít các thây ma trên đường nhảy vào xe.Hãy cẩn thận đừng để chúng bám quá lâu mà bạn sẽ phải hối hận. Khi tình hình ngày càng trở nên hiểm nghèo, sự tuyệt vọng của nhóm người này đã đẩy họ đến bờ vực của sự mất trí. Dù đi đến đâu, họ cũng phải đối mặt với nỗi kinh hãi từ những thây ma, sự mất đoàn kết, cũng như sự đối địch của số nhỏ những người còn sống rải rác ở nơi khác chỉ quan tâm đến sự sống còn của riêng mình, khi mà trật tự xã hội trên toàn cầu đã sụp đổ,hãy cố chạy thật nhanh để có thể thoát thân đến 1 nơi nào đó treo cổ tự vẫn.............
', N'http://s.qplay.vn/images/product/icon/72170413-013224110114-093952.png', N'
                        	Dung lượng: &#32;
            	16.1Mb
				Lượt tải: &#32;8,460
									', NULL, N'http://s.qplay.vn/746-0-0-0--1/download/Noi-so-hai.html', N'http://s.qplay.vn/images/product/poster/480170413-013310110114-094003.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/thayma170413-013306110114-093958.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/thayma1170413-013306110114-093958.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/thayma2170413-013306110114-093958.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/thayma3170413-013306110114-093958.jpg">
		                </li>', CAST(0x0000A6CD01052C3B AS DateTime), NULL, N'http://s.qplay.vn/746-0-0-0--1/game/Noi-so-hai.html', 247)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (57, N'Alien Shooter', N'" Với vũ khí tuyệt vời, không ngừng hành động , đồ họa tuyệt vời , âm nhạc hấp dẫn và thiết lập một cuộc phiêu lưu Kỳ thú, Alien Shooter là một trò chơi mang đến nguồn cảm hứng bất tận . "
Huyền thoại PC Alien Shooter bây giờ đã có trên thiết bị Android của bạn!Hãy bật điện thoại tải về ngay nào!
Trong các văn phòng,kho chứa,viên nghiên cứu đều rất nhiều xác chết,những sinh vật kinh tởm đang tấn công con người,hàng triệu triệu người đang bị ngã xuống,còn bạn thì sao?Có dám đứng lên để chống lại chúng ko?
- Hoàn thành 10 nhiệm vụ và tìm hiểu về nguồn gốc của lũ quái vật!
-Có nhiều hệ thống tự động để hỗ trợ người chơi!
- Có những lúc sẽ xuất hiện rất nhiều quái vật xông ra tấn công!
- Mức độ sẽ càng ngày càng khó hơn cho chúng ta!
Cuộc xâm lược ngoài hành tinh đã bắt đầu, chúng ta có một cơ hội , và đó là để ngăn chặn chúng lạnh trong khu vực đang nhốt chúng. Không cho phép chúng thoát khỏi cơ sở này, bạn là hy vọng cuối cùng của chúng tôi . Số phận của nhân loại bây giờ phụ thuộc vào bạn ! Tiêu diệt hết bọn chúng và hãy sống sót đi ra.', N'
	" Với vũ khí tuyệt vời, không ngừng hành động , đồ họa tuyệt vời , âm nhạc hấp dẫn và thiết lập một cuộc phiêu lưu Kỳ thú, Alien Shooter là một trò chơi mang đến nguồn cảm hứng bất tận . "

	Huyền thoại PC Alien Shooter bây giờ đã có trên thiết bị Android của bạn!Hãy bật điện thoại tải về ngay nào!

	Trong các văn phòng,kho chứa,viên nghiên cứu đều rất nhiều xác chết,những sinh vật kinh tởm đang tấn công con người,hàng triệu triệu người đang bị ngã xuống,còn bạn thì sao?Có dám đứng lên để chống lại chúng ko?

	- Hoàn thành 10 nhiệm vụ và tìm hiểu về nguồn gốc của lũ quái vật!

	-Có nhiều hệ thống tự động để hỗ trợ người chơi!

	- Có những lúc sẽ xuất hiện rất nhiều quái vật xông ra tấn công!

	- Mức độ sẽ càng ngày càng khó hơn cho chúng ta!

	Cuộc xâm lược ngoài hành tinh đã bắt đầu, chúng ta có một cơ hội , và đó là để ngăn chặn chúng lạnh trong khu vực đang nhốt chúng. Không cho phép chúng thoát khỏi cơ sở này, bạn là hy vọng cuối cùng của chúng tôi . Số phận của nhân loại bây giờ phụ thuộc vào bạn ! Tiêu diệt hết bọn chúng và hãy sống sót đi ra.
', N'http://s.qplay.vn/images/product/icon/unnamed100114-100337.png', N'
                        	Dung lượng: &#32;
            	47.7Mb
				Lượt tải: &#32;16,889
									', NULL, N'http://s.qplay.vn/742-0-0-0--1/download/Alien-Shooter.html', N'http://s.qplay.vn/images/product/poster/1100114-100407.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1100114-100403.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2100114-100403.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3100114-100404.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4100114-100404.png">
		                </li>', CAST(0x0000A6CD01052D0F AS DateTime), NULL, N'http://s.qplay.vn/742-0-0-0--1/game/Alien-Shooter.html', 248)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (58, N'Đua xe tăng bắn súng', N'Trong đại chiến thế giới thứ nhất và thứ 2 , có một số thứ có thể khiến các binh lính không lạnh mà run.Đầu tiên phải nhắc tới , đó là bom nguyên tử , thứ vũ khí với sát thương khó có thể tưởng tượng ra.Sau đó , là phi cơ , máy bay và xe tăng. Máy bay , là một pháo đầu trên không còn xe tăng lại là pháo đài gần như bất khả xâm phạm.Với lớp vỏ ngoài có thể chống lại hầu hết đạn của quân lính , hỏa lực thì không cần phải nói , súng máy , đạn pháo,có thể nói xe tăng gần như là một con quái vật trên chiến trường.Với game Tăng đại chiến của chúng tôi , các bạn sẽ được trải nghiệm cảm giác điều khiển một chiếc xe tăng - quái vật trên chiến trường.
Cách chơi:
- Tấn công bắn kẻ thủ trên chiến trường
- Đồ họa 3D cực đẹp', N'
	Trong đại chiến thế giới thứ nhất và thứ 2 , có một số thứ có thể khiến các binh lính không lạnh mà run.Đầu tiên phải nhắc tới , đó là bom nguyên tử , thứ vũ khí với sát thương khó có thể tưởng tượng ra.Sau đó , là phi cơ , máy bay và xe tăng. Máy bay , là một pháo đầu trên không còn xe tăng lại là pháo đài gần như bất khả xâm phạm.Với lớp vỏ ngoài có thể chống lại hầu hết đạn của quân lính , hỏa lực thì không cần phải nói , súng máy , đạn pháo,có thể nói xe tăng gần như là một con quái vật trên chiến trường.Với game Tăng đại chiến của chúng tôi , các bạn sẽ được trải nghiệm cảm giác điều khiển một chiếc xe tăng - quái vật trên chiến trường.
	Cách chơi:
	- Tấn công bắn kẻ thủ trên chiến trường
	- Đồ họa 3D cực đẹp
', N'http://s.qplay.vn/images/product/icon/21090114-105459.png', N'
                        	Dung lượng: &#32;
            	18.5Mb
				Lượt tải: &#32;16,247
									', NULL, N'http://s.qplay.vn/738-0-0-0--1/download/Dua-xe-tang-ban-sung.html', N'http://s.qplay.vn/images/product/poster/tai-game-tank-recon-3d-cho-android-75994090114-105122.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/2090114-105119.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2090114-105120.png">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3090114-105120.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4090114-105120.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/5090114-105120.jpg">
		                </li>', CAST(0x0000A6CD01052DCA AS DateTime), NULL, N'http://s.qplay.vn/738-0-0-0--1/game/Dua-xe-tang-ban-sung.html', 249)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (59, N'Zombies trở lại', N'Khi sự sống trên trái đất chỉ còn là những dịch bệnh, những con virus kì lạ và sự tồn tại duy nhất chỉ là những thây ma. Ở 1 nơi nào đó trên trái đất vẫn còn những con người không mắc phải dịch bệnh và họ ra sức chiến đấu chống lại những đội quân thây ma hùng hậu nhất. Thủ lĩnh và người dẫn dắt họ là Tom, một người luôn ngậm một tẩu thuốc và trên tay là khẩu súng đi khắp nơi để tiêu diệt và mang sự sống trở lại cho trái đất.', N'
	Khi sự sống trên trái đất chỉ còn là những dịch bệnh, những con virus kì lạ và sự tồn tại duy nhất chỉ là những thây ma. Ở 1 nơi nào đó trên trái đất vẫn còn những con người không mắc phải dịch bệnh và họ ra sức chiến đấu chống lại những đội quân thây ma hùng hậu nhất. Thủ lĩnh và người dẫn dắt họ là Tom, một người luôn ngậm một tẩu thuốc và trên tay là khẩu súng đi khắp nơi để tiêu diệt và mang sự sống trở lại cho trái đất.

	Cách chơi:

	- Di chuyển và tiêu diệt lũ Zombie khắp mọi nơi trên trái đất.

	- Kho vũ khí + hệ thống đồ đạc rất phong phú

	- Hình ảnh game ngộ nghĩnh nhưng có đôi chút ma quái nhé.

	Nào còn đợi gì nữa mau mau tải đi nào...
', N'http://s.qplay.vn/images/product/icon/72021112-013414080114-090606.png', N'
                        	Dung lượng: &#32;
            	7.8Mb
				Lượt tải: &#32;7,424
									', NULL, N'http://s.qplay.vn/734-0-0-0--1/download/Zombies-tro-lai.html', N'http://s.qplay.vn/images/product/poster/480-a021112-013444080114-090613.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1021112-013437080114-090618.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2021112-013437080114-090618.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3021112-013437080114-090619.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4021112-013437080114-090619.jpg">
		                </li>', CAST(0x0000A6CD01052E8A AS DateTime), NULL, N'http://s.qplay.vn/734-0-0-0--1/game/Zombies-tro-lai.html', 250)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (60, N'Chiến Thần Tam Quốc', N'Chào mừng bạn đã đên với vương quốc Tóc xù, nơi đây luôn có những điều lạ kỳ, những chú đom đóm luôn luôn phát sáng không chỉ ban đêm còn ban ngày, tại một vương quốc đen huyền bí, nơi mà Dơi ác chủ đứng đầu luôn luôn có lòng tham muốn bắt những chú đom đóm mục của đích chúng là không muốn chúng thắp sáng cho đất nước thần tiên. Kế hoạch đã lập ra đó là "Truy bắt đom đóm".', N'
	Chào mừng bạn đã đên với vương quốc Tóc xù, nơi đây luôn có những điều lạ kỳ, những chú đom đóm luôn luôn phát sáng không chỉ ban đêm còn ban ngày, tại một vương quốc đen huyền bí, nơi mà Dơi ác chủ đứng đầu luôn luôn có lòng tham muốn bắt những chú đom đóm mục của đích chúng là không muốn chúng thắp sáng cho đất nước thần tiên. Kế hoạch đã lập ra đó là "Truy bắt đom đóm". Nếu các bạn muốn giữ những chú đom đóm xinh đẹp này lại với chúng ta thì hãy tham gia ngay với hướng dẫn sau đây:

	-Các bạn sẽ được trang bị "súng cao su", bạn có thể nâng cấp chúng lên qua từng màn.

	-Hãy nhằm thật chính xác và bắn những con dơi ma quái. Càng lên cao càng khó tiêu diệt yêu cầu bạn cần phải nâng cấp thêm đạn.

	-Qua mỗi một bàn chơi bạn hãy cố gắng thu hết những ngôi sao lấp lánh, chúng sẽ giúp cho bạn có đủ kinh phí để nâng cấp lên không chỉ đạn dược mà còn cả những hộ trợ cần thiết.

	-Để vượt qua màn chơi bạn cần tiêu diệt Dơi thủ lĩnh, hãy cố gắng tiêu diệt và hoàn thành các nhiệm vụ được đề ra.

	Chúc các bạn tham gia vui vẻ và bảo vệ được những Đóm đóm thần tiên nhé!
', N'http://s.qplay.vn/images/product/icon/72-a141112-030710080114-085650.png', N'
                        	Dung lượng: &#32;
            	10.8Mb
				Lượt tải: &#32;6,277
									', NULL, N'http://s.qplay.vn/732-0-0-0--1/download/Chien-Than-Tam-Quoc.html', N'http://s.qplay.vn/images/product/poster/480-a141112-030805080114-085844.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1141112-030755080114-085837.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2141112-030755080114-085837.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3141112-030756080114-085837.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4141112-030756080114-085837.jpg">
		                </li>', CAST(0x0000A6CD01052F54 AS DateTime), NULL, N'http://s.qplay.vn/732-0-0-0--1/game/Chien-Than-Tam-Quoc.html', 251)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (61, N'Thây ma hủy diệt', N'Khi bóng tối xâm chiếm trái đất, và tất cả mọi người đang chím trong những giấc mơ đẹp tuyệt vời, Lũ Zombies xuất hiện! Từng bước, từng đêm, bọn chúng đang lên kế hoạch đen tối xâm chiếm. Thế giới có thể biến thành bãi tha ma Zombieland, nhưng Bomberman đã xuất hiện để chiến đấu với lũ quái vật này!', N'
	Khi bóng tối xâm chiếm trái đất, và tất cả mọi người đang chím trong những giấc mơ đẹp tuyệt vời, Lũ Zombies xuất hiện! Từng bước, từng đêm, bọn chúng đang lên kế hoạch đen tối xâm chiếm. Thế giới có thể biến thành bãi tha ma Zombieland, nhưng Bomberman đã xuất hiện để chiến đấu với lũ quái vật này!

	Trong game có 5 mức độ. Tiêu giệt tất cả các Zombies để tìm chiếc chìa khóa vào các màn chơi mới và mở quà tặng.

	Cách chơi tương đồng với game BOOM - đặt bomb cổ điển.

	- Đồ họa mới lạ, đáng yêu.

	- Có nhiều chế độ chơi để làm thỏa mãn niềm yêu thích chơi game của bạn
', N'http://s.qplay.vn/images/product/icon/72041212-082731080114-085208.png', N'
                        	Dung lượng: &#32;
            	8.5Mb
				Lượt tải: &#32;6,178
									', NULL, N'http://s.qplay.vn/730-0-0-0--1/download/Thay-ma-huy-diet.html', N'http://s.qplay.vn/images/product/poster/480 (1)041212-080240080114-085233.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/scrs1041212-080200080114-085228.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrs2041212-080200080114-085228.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrs3041212-080439080114-085228.jpg">
		                </li>', CAST(0x0000A6CD0105308D AS DateTime), NULL, N'http://s.qplay.vn/730-0-0-0--1/game/Thay-ma-huy-diet.html', 252)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (62, N'Bé yêu học bài', N'Ứng dụng Bé yêu học bài là ứng dụng mang giáo dục và giải trí cho trẻ em độ tuổi từ 3 đến 6. Ứng dụng được phát triển thành nhiều phiên bản, mỗi phiên bản là 1 chủ đề hấp dẫn để bé vừa học vừa chơi. Ưng dụng rất tốt cho trẻ em trong việc phát triển tư duy thông qua việc ghép tranh, nhận biết con vật và học tiếng anh bằng cách đọc tên các con vật.', N'
	Ứng dụng Bé yêu học bài là ứng dụng mang giáo dục và giải trí cho trẻ em độ tuổi từ 3 đến 6. Ứng dụng được phát triển thành nhiều phiên bản, mỗi phiên bản là 1 chủ đề hấp dẫn để bé vừa học vừa chơi. Ưng dụng rất tốt cho trẻ em trong việc phát triển tư duy thông qua việc ghép tranh, nhận biết con vật và học tiếng anh bằng cách đọc tên các con vật.

	Cách chơi:

	- Có 2 cấp độ dễ và khó dành cho các độ tuổi khác nhau.&nbsp;

	- Trò chơi có khả năng tăng cường kỹ năng nhận thức, kỹ năng thị giác, nhận biết hình dạng, khối hình, các bộ phận con vật và nhận diện con vật ... - Với màu sắc tươi sáng, hình ảnh ngộ nghĩnh trò chơi chắc chắn sẽ tạo được sự thú vị cho trẻ em.
', N'http://s.qplay.vn/images/product/icon/icon100113-114428060114-095954.png', N'
                        	Dung lượng: &#32;
            	37.5Mb
				Lượt tải: &#32;4,864
									', NULL, N'http://s.qplay.vn/726-0-0-0--1/download/Be-yeu-hoc-bai.html', N'http://s.qplay.vn/images/product/poster/480100113-114456060114-100105.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1100113-114449060114-100101.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2100113-114449060114-100101.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3100113-114450060114-100101.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4100113-114451060114-100101.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/5100113-114451060114-100101.jpg">
		                </li>', CAST(0x0000A6CD010531AF AS DateTime), NULL, N'http://s.qplay.vn/726-0-0-0--1/ung-dung/Be-yeu-hoc-bai.html', 253)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (63, N'Chụp ảnh với người nổi tiếng', N'PhotoFunia - Chụp Ảnh Với Người Nổi Tiếng Game được rất nhiều bạn trẻ yêu thích đã được phát triển với giao diện tiếng việt hoàn toàn mới. Hơn 100 hiệu ứng để người dùng lựa chọn khuôn mặt họ sẽ xuất hiện bên cạnh người nổi tiếng, những ngôi sao hàng đầu, hoặc có thể xuất hiện trên tạp chí nổi tiếng, các tấm áp phích, biển hiệu quảng cáo, trên cốc hay làm cướp biển. Hãy cùng thỏa sức chụp những bức ảnh ngộ ngĩnh để chia sẻ với bạn bè trên Facebook, Gmail, Yahoo nhé!', N'
	PhotoFunia - Chụp Ảnh Với Người Nổi Tiếng Game được rất nhiều bạn trẻ yêu thích đã được phát triển với giao diện tiếng việt hoàn toàn mới. Hơn 100 hiệu ứng để người dùng lựa chọn khuôn mặt họ sẽ xuất hiện bên cạnh người nổi tiếng, những ngôi sao hàng đầu, hoặc có thể xuất hiện trên tạp chí nổi tiếng, các tấm áp phích, biển hiệu quảng cáo, trên cốc hay làm cướp biển. Hãy cùng thỏa sức chụp những bức ảnh ngộ ngĩnh để chia sẻ với bạn bè trên Facebook, Gmail, Yahoo nhé!
', N'http://s.qplay.vn/images/product/icon/ca9e5b4c8946273d6ab2chup-anh-voi-ng-noi-tieng060114-095558.png', N'
                        	Dung lượng: &#32;
            	1.7Mb
				Lượt tải: &#32;6,425
									', NULL, N'http://s.qplay.vn/724-0-0-0--1/download/Chup-anh-voi-nguoi-noi-tieng.html', N'http://s.qplay.vn/images/product/poster/45c5059cecChup-anh-voi-ng-noi-tieng060114-095634.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/0ed6b676dbchup-anh-2060114-095508.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/dae55884c0chup-anh-1060114-095508.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/f9c8c260dcchup-anh-3060114-095508.jpg">
		                </li>', CAST(0x0000A6CD0105327E AS DateTime), NULL, N'http://s.qplay.vn/724-0-0-0--1/ung-dung/Chup-anh-voi-nguoi-noi-tieng.html', 254)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (64, N'Lựu đạn vô tình', N'Trong vai trò là một người lính tinh nhuệ thuộc binh chủng đặc biệt của quân đội, bạn hãy tìm và tiêu diệt những tên tử tù đang cố gắng vượt biên giới. Những tên tử tù tỏ ra rất ngoan cố không kém phần lưu manh. Chúng thường trốn trong những nơi tăm tối và vô cùng kín đáo. Số lượng vũ khí của bạn vô cùng có hạn buộc bạn không được có bất kì một sai lầm nào bởi dù chỉ một sơ hở những tên tử tù kia sẽ trốn thoát.', N'
	Trong vai trò là một người lính tinh nhuệ thuộc binh chủng đặc biệt của quân đội, bạn hãy tìm và tiêu diệt những tên tử tù đang cố gắng vượt biên giới. Những tên tử tù tỏ ra rất ngoan cố không kém phần lưu manh. Chúng thường trốn trong những nơi tăm tối và vô cùng kín đáo. Số lượng vũ khí của bạn vô cùng có hạn buộc bạn không được có bất kì một sai lầm nào bởi dù chỉ một sơ hở những tên tử tù kia sẽ trốn thoát.

	Cách chơi :

	-Ngắm và ném thật chuẩn tiêu diệt các tử tù đang chạy trốn

	-Âm thanh và tiếng động trong game là một phần vô cùng đáng nói.. Sống động và chân thật bất ngờ !!

	-Đồ họa ngộ nghĩnh , đẹp mắt.

	-Game nhiều màn chơi từ dễ đến khó trải qua nhiều bản đồ , nhiều địa điểm gian nan và hiểm trở.

	Hãy trải nghiệm !!
', N'http://s.qplay.vn/images/product/icon/72x72-b (1)191012-020843060114-095125.png', N'
                        	Dung lượng: &#32;
            	10.3Mb
				Lượt tải: &#32;5,258
									', NULL, N'http://s.qplay.vn/722-0-0-0--1/download/Luu-dan-vo-tinh.html', N'http://s.qplay.vn/images/product/poster/480x235 (1)191012-020949060114-095140.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/interview-1191012-015137060114-095135.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/interview-2191012-015137060114-095136.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/interview-3191012-015137060114-095136.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/interview-4191012-015137060114-095136.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/interview-5191012-015137060114-095136.jpg">
		                </li>', CAST(0x0000A6CD01053351 AS DateTime), NULL, N'http://s.qplay.vn/722-0-0-0--1/game/Luu-dan-vo-tinh.html', 255)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (65, N'Chém hoa quả 2', N'"Nghe xuân sang thấy trong lòng xốn xang..."
Nghe câu hát này lòng ta lại thấy nôn nao , không khí tết đang tràn về trên từng ngõ phố , từng con đường.
Ngày xuân Long Phụng sum vầy
Ngũ quả ngày tết , vui vầy bên nhau
Vâng , nói đến không khí tết thì lại không thể không nhắc tới bánh chưng bánh dầy , cây nêu , mâm ngũ quả.
Game : " Ngũ quả ngày tết " mang đến cho bạn không khí tết thật chân thật và mãnh liệt.
Cách chơi : - Chém những trái cây trong mâm ngũ quả để chào đón xuân về!', N'
	"Nghe xuân sang thấy trong lòng xốn xang..."
	Nghe câu hát này lòng ta lại thấy nôn nao , không khí tết đang tràn về trên từng ngõ phố , từng con đường.
	Ngày xuân Long Phụng sum vầy
	Ngũ quả ngày tết , vui vầy bên nhau
	Vâng , nói đến không khí tết thì lại không thể không nhắc tới bánh chưng bánh dầy , cây nêu , mâm ngũ quả.
	Game : " Ngũ quả ngày tết " mang đến cho bạn không khí tết thật chân thật và mãnh liệt.
	Cách chơi : - Chém những trái cây trong mâm ngũ quả để chào đón xuân về!
', N'http://s.qplay.vn/images/product/icon/unnamed040114-094409.png', N'
                        	Dung lượng: &#32;
            	3.7Mb
				Lượt tải: &#32;24,259
									', NULL, N'http://s.qplay.vn/718-0-0-0--1/download/Chem-hoa-qua-2.html', N'http://s.qplay.vn/images/product/poster/Untitled-2070113-032124040114-094503.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/scrsa070113-022052040114-094500.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrsb070113-022052040114-094500.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrsc070113-022052040114-094501.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/scrsd070113-022052040114-094501.jpg">
		                </li>', CAST(0x0000A6CD01053416 AS DateTime), NULL, N'http://s.qplay.vn/718-0-0-0--1/game/Chem-hoa-qua-2.html', 256)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (66, N'Bắn dơi', N'Chào mừng bạn đã đên với vương quốc Tóc xù, nơi đây luôn có những điều lạ kỳ, những chú đom đóm luôn luôn phát sáng không chỉ ban đêm còn ban ngày, tại một vương quốc đen huyền bí, nơi mà Dơi ác chủ đứng đầu luôn luôn có lòng tham muốn bắt những chú đom đóm mục của đích chúng là không muốn chúng thắp sáng cho đất nước thần tiên. Kế hoạch đã lập ra đó là "Truy bắt đom đóm".', N'
	Chào mừng bạn đã đên với vương quốc Tóc xù, nơi đây luôn có những điều lạ kỳ, những chú đom đóm luôn luôn phát sáng không chỉ ban đêm còn ban ngày, tại một vương quốc đen huyền bí, nơi mà Dơi ác chủ đứng đầu luôn luôn có lòng tham muốn bắt những chú đom đóm mục của đích chúng là không muốn chúng thắp sáng cho đất nước thần tiên. Kế hoạch đã lập ra đó là "Truy bắt đom đóm". Nếu các bạn muốn giữ những chú đom đóm xinh đẹp này lại với chúng ta thì hãy tham gia ngay với hướng dẫn sau đây:
	-Các bạn sẽ được trang bị "súng cao su", bạn có thể nâng cấp chúng lên qua từng màn.
	-Hãy nhằm thật chính xác và bắn những con dơi ma quái. Càng lên cao càng khó tiêu diệt yêu cầu bạn cần phải nâng cấp thêm đạn.
	-Qua mỗi một bàn chơi bạn hãy cố gắng thu hết những ngôi sao lấp lánh, chúng sẽ giúp cho bạn có đủ kinh phí để nâng cấp lên không chỉ đạn dược mà còn cả những hộ trợ cần thiết.
	-Để vượt qua màn chơi bạn cần tiêu diệt Dơi thủ lĩnh, hãy cố gắng tiêu diệt và hoàn thành các nhiệm vụ được đề ra.
	Chúc các bạn tham gia vui vẻ và bảo vệ được những Đóm đóm thần tiên nhé!
', N'http://s.qplay.vn/images/product/icon/72090413-025140040114-093152.png', N'
                        	Dung lượng: &#32;
            	18.8Mb
				Lượt tải: &#32;6,193
									', NULL, N'http://s.qplay.vn/716-0-0-0--1/download/Ban-doi.html', N'http://s.qplay.vn/images/product/poster/Untitled-1090413-025231040114-093310.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1090413-025223040114-093306.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2090413-025223040114-093306.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3090413-025223040114-093306.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/anh1090413-025224040114-093306.jpg">
		                </li>', CAST(0x0000A6CD010534E9 AS DateTime), NULL, N'http://s.qplay.vn/716-0-0-0--1/game/Ban-doi.html', 257)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (67, N'Phi đội thần long', N'Đất nước Qpaly dưới sự thống trị của tổng thống Mr.D đang dần phát triển và giàu có hơn rất nhiều. Chính vì lý do đó mà đất nước màu mỡ này thường xuyên là "điểm ngắm" của các tổ chức tội phạm nguy hiểm. Chúng nổi dậy tự phát, cướp bóc và sát hại những người dân hồn hậu chất phát của đất nước này.', N'
	&nbsp;Đất nước Qpaly dưới sự thống trị của tổng thống Mr.D đang dần phát triển và giàu có hơn rất nhiều. Chính vì lý do đó mà đất nước màu mỡ này thường xuyên là "điểm ngắm" của các tổ chức tội phạm nguy hiểm. Chúng nổi dậy tự phát, cướp bóc và sát hại những người dân hồn hậu chất phát của đất nước này.
	Một thông điệp của tổng thống Mr.D được gửi xuống cho phía quân đội yêu cầu thành lập ngay một đội đặc nhiệm dưới sự chỉ đạo của trung sĩ Donal, Mickey và nữ y tá Sakura.
	Trong game bạn sẽ vào vai một thành viên của đội đặc nhiệm, bằng mọi sức lực, mọi vũ khí - khí tài và khả năng có được của bạn... tiêu diệt toàn bộ những tên khủng khổ - phản loạn và các tổ chức tội phạm nguy hiểm. Đem lại bình yên cho người dân đất nước QPaly.
	Cách chơi:
	- Game hỗ trợ bạn cách điều khiển ở góc nhìn người thứ nhất - fps.
	- Các màn chơi được bố trí hợp lý. Bạn phải trải qua các màn chơi luyện tập mới có thể theo binh đoàn quân đội của mình tiêu diệt tội phạm.
	- Âm thanh và hình ảnh trong game sẽ khiến bạn ngạc nhiên.
	Nào !! Hãy chọn cho mình một nhân vật và những thứ vũ khí bạn muốn đễ tham gia "Phi đội thần tốc"
', N'http://s.qplay.vn/images/product/icon/12121112-020237030114-095528.png', N'
                        	Dung lượng: &#32;
            	7.7Mb
				Lượt tải: &#32;13,936
									', NULL, N'http://s.qplay.vn/714-0-0-0--1/download/Phi-doi-than-long.html', N'http://s.qplay.vn/images/product/poster/Untitled-1121112-015443030114-095555.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/1121112-015433030114-095603.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/2121112-015434030114-095603.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/3121112-015434030114-095603.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/4121112-015434030114-095603.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/5121112-015434030114-095603.jpg">
		                </li>', CAST(0x0000A6CD01053599 AS DateTime), NULL, N'http://s.qplay.vn/714-0-0-0--1/game/Phi-doi-than-long.html', 258)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (68, N'Mật lênh rồng vàng', N'Kế tiếp phiên bản tiền nhiệm - Mật lệnh rồng thiêng. Phiên bản 2 của tựa game này ra đời mục đích update, chỉnh sửa và bổ sung nhiều hơn các tính năng trong game.
Nhiệm vụ của bạn vẫn là chiến đấu chống lại quái vật và lũ ma quỉ vô hình nhưng giờ đây chúng đã trở nên nguy hiểm - thông minh hơn rất nhiều.', N'
	Kế tiếp phiên bản tiền nhiệm - Mật lệnh rồng thiêng. Phiên bản 2 của tựa game này ra đời mục đích update, chỉnh sửa và bổ sung nhiều hơn các tính năng trong game.
	Nhiệm vụ của bạn vẫn là chiến đấu chống lại quái vật và lũ ma quỉ vô hình nhưng giờ đây chúng đã trở nên nguy hiểm - thông minh hơn rất nhiều.
	Phiên bản " Mật lệnh rồng thiêng 2" bổ sung thêm 2 chế độ chơi vs nhiều item đặc biệt.
	Đồ họa được chau chuốt hơn so với bản đầu tiên.
	Cách chơi vẫn giống phiên bản trước nhưng các button - các phím điều khiển được bố trí hợp lý hơn rất nhiều.
	Nếu bạn đã theo chân vị ninja anh hùng tiếp nhận sứ mệnh bảo vệ vùng đất của mình trong phiên bản "mật lệnh rồng thiêng 1", chắc hẳn bạn sẽ không thể bỏ qua phiên bản tiếp theo này !
	Chúc các bạn có những giây phút vui vẻ và hài lòng khi giải trí với tựa game "Mật Lệnh Rồng Thiêng 2 "
', N'http://s.qplay.vn/images/product/icon/72091112-013109030114-095201.png', N'
                        	Dung lượng: &#32;
            	9.8Mb
				Lượt tải: &#32;5,010
									', NULL, N'http://s.qplay.vn/712-0-0-0--1/download/Mat-lenh-rong-vang.html', N'http://s.qplay.vn/images/product/poster/480-a121112-094308030114-095226.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/screenshot-1091112-013049030114-095231.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot---2091112-013050030114-095231.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot-4091112-013050030114-095231.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screenshot-5091112-013050030114-095231.jpg">
		                </li>', CAST(0x0000A6CD01053667 AS DateTime), NULL, N'http://s.qplay.vn/712-0-0-0--1/game/Mat-lenh-rong-vang.html', 259)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (69, N'Quái vật ngoài hành tinh', N'Vào những năm sau thảm họa thiên thạch cuối năm 2012 , con người đã phát triển lại thế giới hưng thịnh còn hơn thời điểm trước đó. Cùng với sự tiến bộ của xã hội , thì những loài động vật cũng tiến hóa theo thời gian. Một số loài thì dị biến do thừa hưởng huyết mạch từ thời thượng cổ , do đó rất nhiều loại quái vật lần lượt xuất hiện và trở thành nỗi kinh hoàng của nhân loại.', N'
	Vào những năm sau thảm họa thiên thạch cuối năm 2012 , con người đã phát triển lại thế giới hưng thịnh còn hơn thời điểm trước đó. Cùng với sự tiến bộ của xã hội , thì những loài động vật cũng tiến hóa theo thời gian. Một số loài thì dị biến do thừa hưởng huyết mạch từ thời thượng cổ , do đó rất nhiều loại quái vật lần lượt xuất hiện và trở thành nỗi kinh hoàng của nhân loại.
	Một số loài còn lại thì ảnh hưởng bởi một số loại phóng xạ , cũng ghê gớm không kém.
	Tuy vậy , những loài quái vật đó cũng ít khi quấy phá con người trừ khi bạn động đến chúng. Nhưng có một loại quái vật , được lai tạo ra giữa loài sâu nhỏ bé và Viễn cổ ma xà , lại có thân thể như của tộc cơ giới , nó có khả năng xuyên sâu vào lòng đất , với hàm răng bén nhọn , sắt thép trước mặt nó chỉ như đậu hũ. Mặc dù như thế , loài này lại là loài thích ẩn mình , không tự tìm phiền toái.
	Một ngày kia , con người đặt chân đến vùng đất nó sống , tàn sát đồng loại của nó.
	Và thế là hành trình báo thù của Ma thú Sâu khổng lồ bắt đầu!!
	Cách chơi :
	- Điều khiển Sâu khổng lồ tấn công kẻ địch
	- Truy sát kẻ thù từ vùng băng giá cực Bắc đến Hoang mạc nóng bỏng
', N'http://s.qplay.vn/images/product/icon/72161112-023048030114-094730.png', N'
                        	Dung lượng: &#32;
            	15.9Mb
				Lượt tải: &#32;5,592
									', NULL, N'http://s.qplay.vn/710-0-0-0--1/download/Quai-vat-ngoai-hanh-tinh.html', N'http://s.qplay.vn/images/product/poster/480 (1)161112-023118030114-094830.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/screen1161112-023114030114-094820.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen2161112-023114030114-094821.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/screen3161112-023114030114-094821.jpg">
		                </li>', CAST(0x0000A6CD0105374F AS DateTime), NULL, N'http://s.qplay.vn/710-0-0-0--1/game/Quai-vat-ngoai-hanh-tinh.html', 260)
INSERT [dbo].[Contents] ([Id], [Title], [Description], [Content], [Avatar], [Size], [Download], [LinkDownload], [AvatarBig], [ImageContent], [DateSynced], [DateModify], [Link], [LinkId]) VALUES (70, N'Rush ninja', N'Truyền thuyết kể rằng, thời xa xưa, khi mà thế lực đen tối bành trướng thế giới. Tận cùng tuyệt vọng, có một vị ninja đã một mình đứng lên chống lại. Với khả năng phi thường của mình, anh ta đã đẩy lùi thế lực đen tối, đem lại hòa bình cho thế giới.', N'
	Truyền thuyết kể rằng, thời xa xưa, khi mà thế lực đen tối bành trướng thế giới. Tận cùng tuyệt vọng, có một vị ninja đã một mình đứng lên chống lại. Với khả năng phi thường của mình, anh ta đã đẩy lùi thế lực đen tối, đem lại hòa bình cho thế giới.
	Cách chơi:
	-Nhập vai vào chàng ninja để vượt qua các chướng ngại vật
	-Sử dụng các vật dụng nhặt được để tiêu diệt kẻ thù
	-Đồ họa đẹp và âm thanh hấp dẫn
	Nào! Hãy hóa thân thành siêu ninja để chiến đấu chống lại thế lực đen tối và đem lại hòa bình cho thế giới nhé.
', N'http://s.qplay.vn/images/product/icon/72071212-111422030114-094249.png', N'
                        	Dung lượng: &#32;
            	12.7Mb
				Lượt tải: &#32;6,211
									', NULL, N'http://s.qplay.vn/708-0-0-0--1/download/Rush-ninja.html', N'http://s.qplay.vn/images/product/poster/480071212-110827030114-094329.jpg', N'<li>
		                    <img height="155" src="/images/product/intro-images/Rush-ninja-1071212-110820030114-094323.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Rush-ninja-2071212-110820030114-094323.jpg">
		                </li>,<li>
		                    <img height="155" src="/images/product/intro-images/Rush-ninja-3071212-110820030114-094323.jpg">
		                </li>', CAST(0x0000A6CD0105381F AS DateTime), NULL, N'http://s.qplay.vn/708-0-0-0--1/game/Rush-ninja.html', 261)
SET IDENTITY_INSERT [dbo].[Contents] OFF
SET IDENTITY_INSERT [dbo].[Links] ON 

INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (193, N'http://s.qplay.vn/3222-0-0-0--1/game/Super-Spy-Cat.html', 0, N'http://s.qplay.vn/images/product/icon/512151214-105450.png', N'Super Spy Cat', N'Rambo Combat - Biệt đội thú cưng

Nếu như bạn đã tham gia các cuộc chơi, đấu súng trên giả lập thì bạn chắc chắn không nên bỏ qua cuộc đại chiến Rambo Combat.
Lấy hình tượng nhân vật cực chuẩn là Mèo - Chuột (những con vật chiến đấu không có hồi kết) để tạo nên một trò chơi cực sáng tạo và ngộ nghĩnh.
Không giống như những thể loại trò chơi bắn súng thông thường. Lối chơi ở Rambo Combat cũng khiến cho người chơi cuốn hút hơn bởi những nhân vật có khả năng tự nhận dạng địch và di chuyển khéo léo, những hiệu ứng âm thanh góp phần tạo nên một sự thành công cuốn hút cho người tham gia chơi.
Hơn 60 bàn chơi được sắp xếp xen kẽ 10 bối cảnh và kho vũ phí được nâng cấp tối ưu tương thích với từng nhiệm vụ được đặt ra trong trò chơi.
Các thành tựu, những giải thưởng hấp dẫn khuyến khích cho người chơi cần đạt được khi tham gia. 
Công nghệ hình ảnh Unity 3D chân thực, với độ sắc nét cao. Giảm thiểu tối đa dung lượng để tích hợp với các dòng máy cơ bản. 
Với những góc hành động khác nhau, xây dựng nhiều bối cảnh  người chơi sẽ có nhiều trải nghiệm và cảm xúc mới mẻ khi tham gia một trò chơi bắn súng. 
Phiên bản chơi hoàn toàn miễn phí, nhưng để có thêm những vũ khí mạnh mẽ hay nâng cấp nhân vật bạn có thể bỏ các khoản chi phí cực nhỏ để nâng cấp hoặc đơn giản hơn là bạn phải "cày" để có được những vũ khí tối ưu nhất cho các cuộc chiến tiếp theo.

Rambo Combat đã có mặt trên đa nền tảng và chờ bạn tham gia', CAST(0x0000A6CD00E10833 AS DateTime), CAST(0x0000A6CD0103C25E AS DateTime), 0, 2, N'http://s.qplay.vn/3222-0-0-0--1/download/Super-Spy-Cat.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (194, N'http://s.qplay.vn/36-0-0-0--1/game/Ai-la-trieu-phu-(80000-cau-hoi).html', 0, N'http://s.qplay.vn/images/product/icon/2446805789ai-la-trieu-phu-offline.png', N'Ai là triệu phú (80000 câu hỏi)', N'Bạn rất yêu thích game show Ai là triệu phú trên VTV3 nhưng lại chưa có cơ hội được tham gia?', CAST(0x0000A6CD00E10860 AS DateTime), CAST(0x0000A6CD0103C566 AS DateTime), 0, 2, N'http://s.qplay.vn/36-0-0-0--1/download/Ai-la-trieu-phu-(80000-cau-hoi).html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (195, N'http://s.qplay.vn/42-0-0-0--1/game/Dao-vang-(Ban-mua-thu).html', 0, N'http://s.qplay.vn/images/product/icon/c3723ab4f3DV mua thu.png', N'Đào vàng (Bản mùa thu)', N'Game đào vàng kinh điển nay đã có mặt trên Android. Bạn sẽ vào vai một "ông già gân" ôm mộng làm giàu giữa vùng Alaska hoang dã. Tuy nhiên chặng đường thành đại gia còn rất dài với nhiều hiểm nguy.', CAST(0x0000A6CD00E10862 AS DateTime), CAST(0x0000A6CD0103C776 AS DateTime), 0, 2, N'http://s.qplay.vn/42-0-0-0--1/download/Dao-vang-(Ban-mua-thu).html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (196, N'http://s.qplay.vn/534-0-0-0--1/game/Dao-kim-cuong.html', 0, N'http://s.qplay.vn/images/product/icon/Icon_dao_kim_cuong_72200713-044844.png', N'Đào kim cương', N'Một lão thợ mỏ già cứng cựa với mơ ước làm giàu.
Những mỏ vàng kếch xù dưới lòng đất cùng với lớp đá cứng đầu. Thuốc nổ , dây thừng, xe đẩy … Tất cả đều tạo nên một tựa game đào vàng kinh điển…
Tuy nhiên khi đã cảm thấy công việc đào vàng đã quá nhàm chán. Bạn có thể thử trải nghiệm tựa game mới được phát triển dựa trên dòng game đào vàng vốn đã là huyền thoại.
Vào vai một lão thợ mỏ già yêu vàng, nhưng ở phiên bản này, vàng đã không còn là thứ gì quý giá nữa. Một mỏ kim cương mới được khai thác làm cho lão sáng mắt hơn cả. Tuy nhiên cái gì cũng có giá của nó, những chướng ngại vật ở phiên bản này còn kinh khủng và nguy hiểm hơn rất nhiều. Không phải ai cũng có thể dễ dàng vượt qua được.
Và điều này đành phải nhờ cậy vào chiến thuật chơi game tinh tế và sự khéo léo từ bạn. Hãy giúp lão thợ mỏ già một tay nhé !', CAST(0x0000A6CD00E10863 AS DateTime), CAST(0x0000A6CD0103C833 AS DateTime), 0, 2, N'http://s.qplay.vn/534-0-0-0--1/download/Dao-kim-cuong.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (197, N'http://s.qplay.vn/147-0-0-0--1/game/Dao-vang-phieu-luu.html', 0, N'http://s.qplay.vn/images/product/icon/72 (1)211212-011016.png', N'Đào vàng phiêu lưu', N'Game đào vàng cái tên đã quá quen thuộc với mọi người.Với Đào vàng phiêu lưu phiên bản mới sẽ đem lại sự quấn hút vô cùng đối với mọi người.Game là 1 cuộc phiêu lưu của ông lão từ khi nghèo đói đến lúc giàu sang.
- Cách chơi quen thuộc đơn giản
- Hệ thống nhiệm vụ mới lạ + kì thú
- Các mức độ chơi khác nhau đem lại vô vàn khó khăn cho người chơi
- Hãy chơi và khám phá điều thú vị của Đào vàng phiêu lưu nhé', CAST(0x0000A6CD00E10864 AS DateTime), CAST(0x0000A6CD0103C8EF AS DateTime), 0, 2, N'http://s.qplay.vn/147-0-0-0--1/download/Dao-vang-phieu-luu.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (198, N'http://s.qplay.vn/365-0-0-0--1/game/Dao-vang-(Ban-Mua-Xuan).html', 0, N'http://s.qplay.vn/images/product/icon/b271322e93DV mua xuan010213-113910.png', N'Đào vàng (Bản Mùa Xuân)', N'Phiên bản game đào vàng mùa xuân, đầy sắc màu và tràn ngập không khí đón tết. Hãy cùng đào thật nhiều vàng để đón một năm mới may mắn.', CAST(0x0000A6CD00E10866 AS DateTime), CAST(0x0000A6CD0103CAE4 AS DateTime), 0, 2, N'http://s.qplay.vn/365-0-0-0--1/download/Dao-vang-(Ban-Mua-Xuan).html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (199, N'http://s.qplay.vn/269-0-0-0--1/game/Ban-cung-sieu-dang.html', 0, N'http://s.qplay.vn/images/product/icon/72 (1)081212-092706.png', N'Bắn cung siêu đẳng', N'Bắn cung môn thể thao dân tộc lại 1 lần nữa được nhắc đến và tái hiện lại trong trò chơi cùng tên. Bạn có phải là 1 xạ thủ xuất sắc không. Nếu phải thì cùng thử sức nhé.
Cách chơi:
- Ngắm bắn thật chuẩn
- Với nhiều mức độ chơi từ dễ đến khó
- Bảng xếp hạng được update liên tục
Hãy cùng so tài nhé các bạn.', CAST(0x0000A6CD00E10868 AS DateTime), CAST(0x0000A6CD0103CBC7 AS DateTime), 0, 2, N'http://s.qplay.vn/269-0-0-0--1/download/Ban-cung-sieu-dang.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (200, N'http://s.qplay.vn/62-0-0-0--1/game/Ech-San-Moi.html', 0, N'http://s.qplay.vn/images/product/icon/3e0b0683c564.png', N'Ếch Săn Mồi', N'Game vui nhộn nhất trên Android đã xuất hiện!
Hãy vào vai chàng Hoàng tử Ếch béo mập và trải nghiệm cuộc sống vui vẻ trên đầm lầy xanh.', CAST(0x0000A6CD00E10869 AS DateTime), CAST(0x0000A6CD0103CD86 AS DateTime), 0, 2, N'http://s.qplay.vn/62-0-0-0--1/download/Ech-San-Moi.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (201, N'http://s.qplay.vn/454-0-0-0--1/game/Thanh-Giong-ve-troi.html', 0, N'http://s.qplay.vn/images/product/icon/icon72x72180413-020637.png', N'Thánh Gióng về trời', N'Giặc Ân đang xâm phạm bờ cõi nước ta, chúng mặc sức lộng hành và gieo bao tội ác đến những người dân vô tội. Trước cận cảnh nước mất nhà tan đó, Thánh Gióng lớn nhanh như thổi để trở thành 1 tráng sĩ khỏe mạnh, dũng mãnh vô song, cưỡi ngựa sắt, cầm roi sắt xông pha nơi chiến trận, phá tan cường địch. 
Hãy nhập vai vào nhân vật Thánh gióng và tiêu diệt chúng, bảo vệ sự ấm no, tự do và hạnh phúc của Đất nước
* Cách chơi: 
- Nhảy vượt các chướng ngại vật
- Tiêu diệt tất địch trên đường chạy
- Dùng tiền kiếm được để nâng cấp Thánh gióng khỏe hơn
- Có 2 kiểu chơi: 1 kiểu chơi đi bài và 1 kiểu chơi không giới hạn
* Mẹo: 
- Bạn có thể nhảy 2 lần liên tục và tấn công 2 lần liên tục mỗi lần ngựa Thánh gióng tiếp đất
- BẤM và GIỮ nút nhảy và nút tấn công càng lâu thì sẽ nhảy và tấn công càng xa
- Ăn vật phẩm và tấn công liên tiếp địch để ghi được nhiều điểm hơn', CAST(0x0000A6CD00E1086F AS DateTime), CAST(0x0000A6CD0103CF48 AS DateTime), 0, 2, N'http://s.qplay.vn/454-0-0-0--1/download/Thanh-Giong-ve-troi.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (202, N'http://s.qplay.vn/140-0-0-0--1/game/Cau-ca.html', 0, N'http://s.qplay.vn/images/product/icon/icon72150912-034649.png', N'Câu cá', N'Bạn đã bao giờ câu cá chưa ? Hãy đến với Câu cá trên Android phiên bản đặc biệt này.Cùng thỏa sức đánh bắt những chú cá từ nhỏ đến to , từ hiền lành đến hung dữ và cùng ngắm các nàng tiên cá bơi lòng trong đại dương xanh ngắt.', CAST(0x0000A6CD00E10870 AS DateTime), CAST(0x0000A6CD0103D216 AS DateTime), 0, 2, N'http://s.qplay.vn/140-0-0-0--1/download/Cau-ca.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (203, N'http://s.qplay.vn/493-0-0-0--1/game/Ban-ga.html', 0, N'http://s.qplay.vn/images/product/icon/icon72010613-112649.png', N'Bắn gà', N'Bầy Gà Xâm Lăng - Tựa game bắn gà hết sức vui nhộn với hình ảnh đáng yêu - thân thuộc và rất dễ thương. Trải qua nhiều phiên bản từng có mặt trên các store phần mềm - game trên toàn thế giới, game được cải tiến khá nhiều. Từ hệ thống đạn dược, hệ thống boss, hệ thống hành tinh, hệ thống gà. 
Điểm đáng nói nhất là cách điều khiển trong game dễ dàng và game hỗ trợ tất cả các dòng máy Android có trên thị trường từ trước tới nay.
Gameplay phong phú với nhiều màn chơi mang lại cảm giác bất ngờ và thư giản vui vẻ cho mọi người trong mùa hè này.
Hãy cùng chúng thôi tham gia vào cuộc chiến chống lại "Bầy Gà Xâm Lăng" nhé !', CAST(0x0000A6CD00E108FA AS DateTime), CAST(0x0000A6CD010408F2 AS DateTime), 0, 2, N'http://s.qplay.vn/493-0-0-0--1/download/Ban-ga.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (204, N'http://s.qplay.vn/2952-0-0-0--1/game/Dao-hai-tac.html', 0, N'http://s.qplay.vn/images/product/icon/ic270914-092810.png', N'Đảo hải tặc', N'Đảo hải tặc là câu chuyện kể về cuộc chiến giải quyết mối thù đẫm máu,của ba gia tộc đối thủ.Thế giới sau khải huyền này đã bị chìm gần như hoàn toàn và vài điểm còn lại của đất trở thành một phần thưởng quý giá cho người chiến thắng của cuộc giao tranh chết người giữa Thuyền trưởng Luffy với phần còn lại của thế giới.Tham gia chọn tàu để tấn công quân địch.Trò chơi ly kỳ và hấp dẫn với hỉnh ảnh 3D.Tất cả các hành động diễn ra trong khu nước khổng lồ, nơi bạn sẽ phải hoàn thành nhiệm vụ khác nhau và đánh bại kẻ thù từ gia tộc thù địch.Số tiền bạn kiếm được từ nhiệm vụ có thể được chi cho vũ khí mới và nâng cấp cho thuyền của bạn.Đảo hải tặc - lựa chọn vận mệnh của bạn trong thế giới này sau khi ngày tận thế!', CAST(0x0000A6CD00E108FC AS DateTime), CAST(0x0000A6CD01040A2B AS DateTime), 0, 2, N'http://s.qplay.vn/2952-0-0-0--1/download/Dao-hai-tac.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (205, N'http://s.qplay.vn/2762-0-0-0--1/game/Robin-Hood-Adventure.html', 0, N'http://s.qplay.vn/images/product/icon/ic130914-113355.png', N'Robin Hood Adventure', N'Robin vốn là một nhà quý tộc xứ Locksley. Khi hoàng tử Johny em của vua Richard âm mưu chiếm đoạt ngai vàng nhân lúc nhà vua vắng mặt, Robin tìm mọi cách ngăn chặn. Chàng bị truy đuổi, trở thành kẻ sống ngoài vòng pháp luật và đến lánh nạn ở khu rừng Sherwood. Tại đây chàng tập hợp quanh mình những kẻ cùng cảnh ngộ và trở thành thủ lĩnh Robin Hood của họ. Chàng chỉ huy đánh cướp bọn nhà giàu và chia cho dân nghèo, đồng thời cũng không quên nghĩa vụ phải trung thành với vua Richard, cũng như mối tình từ thuở còn thơ ấu với nàng Marian xinh đẹp', CAST(0x0000A6CD00E108FE AS DateTime), CAST(0x0000A6CD01040B33 AS DateTime), 0, 2, N'http://s.qplay.vn/2762-0-0-0--1/download/Robin-Hood-Adventure.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (206, N'http://s.qplay.vn/2692-0-0-0--1/game/Khuc-cua-tu-than-3D.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed120914-032941.png', N'Khúc cua tử thần 3D', N'Khúc cua tửa thần 3D,tựa game đua xe đáng chú ý nhất hiện nay,với tốc độ cuộc đua chóng mặt,những góc quay kinh điển chỉ có trong đường đua 3D.Không thua kém bất cứ tựa game đua xe nào hiện nay.hãy tham gia vào cuộc đua của những kẻ nổi loạn này.Chắc hẳn các bạn đã quá quen với bộ phim nổi tiếng hành động mỹ,những pha đuổi bắt trên đường cao tốc,những cảnh bắn nhau tóe lửa.
Game là sự mô phỏng của bộ phim Death race.Khi các tử tù vào đây sẽ phải tham gia vào cuộc đua khốc liệt,mà người đứng đầu 5 vòng đua sẽ được thoát khỏi địa ngục đó.
Tay đua đế vương là sự tập hợp của những tên tội phạm hàng đầu thế giới,nhưng pha bứt tốc,gài bom và bắn tên lửa sẽ giúp bạn giữ được vị trí hoặc đảo ngược vị trí.
Hãy thật cẩn thận nếu không xe của bạn sẽ bị đối phương phá hỏng,chỉ cần chậm 1 bước là bạn đã có thể bị bỏ rất xa.Hãy tham gia vào cuộc đua nào.........', CAST(0x0000A6CD00E10900 AS DateTime), CAST(0x0000A6CD01040BF7 AS DateTime), 0, 2, N'http://s.qplay.vn/2692-0-0-0--1/download/Khuc-cua-tu-than-3D.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (207, N'http://s.qplay.vn/102-0-0-0--1/game/O-an-quan.html', 0, N'http://s.qplay.vn/images/product/icon/icon_oanquan 72x72030812-072933.png', N'Ô ăn quan', N'Ô ăn quan một game dân gian vô cùng quen thuộc với người Việt Nam đã có mặt trên Android, chỉ với một bãi đất nhỏ, với những viên đá viên sỏi, ô ăn quan trở thành một trò chơi chiến thuật lý thú.', CAST(0x0000A6CD00E10902 AS DateTime), CAST(0x0000A6CD01040DB9 AS DateTime), 0, 2, N'http://s.qplay.vn/102-0-0-0--1/download/O-an-quan.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (208, N'http://s.qplay.vn/2532-0-0-0--1/game/Natra-tam-thai-tu.html', 0, N'http://s.qplay.vn/images/product/icon/ic050914-011813.png', N'Natra tam thái tử', N'Na Tra hình tượng một vị thiên tướng khôi ngô, tuấn tú, mặt đẹp như ngọc, mắt sáng như sao, môi đỏ như môi thiếu nữ. Song bản tính của Na Tra nóng nảy, thẳng thắn và thích xen vào chuyện bất bình.Với sức mạnh vô địch,natra đã chu du khắp nơi để giải cứu người dân khỏi cảnh sống khốn cùng.', CAST(0x0000A6CD00E10904 AS DateTime), CAST(0x0000A6CD01040E8B AS DateTime), 0, 2, N'http://s.qplay.vn/2532-0-0-0--1/download/Natra-tam-thai-tu.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (209, N'http://s.qplay.vn/2382-0-0-0--1/game/Ninja-loan-thi.html', 0, N'http://s.qplay.vn/images/product/icon/10858_com.falsehoodmask.NinjaWar_ninjas-stolen-scrolls280814-090415.png', N'Ninja loạn thị', N'Ninja loạn thị Truyện từng được xuất bản ở Việt Nam lần đầu vào 1998 với tên gọi “Ninja loạn thị”,và giờ chuyển thể thanh game với tựa đề Ninja loạn thị.  
Thời đại trong game là vào những năm cuối của triều đại Muromachi dựa vào chi tiết cảnh trí và con người trong game.Câu truyện bắt đầu vào thời Sengoku. Khi Rantaro được cha khuyến khích vào trường Ninjutsu Gakuen để học tập nhằm trở thành một ninja trứ danh làm rạng rỡ tổ tông. Sau khi vào trường, Rantoro đã quen được 2 người bạn mới là Kirimaru và Shinbee. Nhưng mọi chuyện lại không suôn sẻ khi cả 3 đều là những ninja hậu đậu.', CAST(0x0000A6CD00E10905 AS DateTime), CAST(0x0000A6CD01040F52 AS DateTime), 0, 2, N'http://s.qplay.vn/2382-0-0-0--1/download/Ninja-loan-thi.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (210, N'http://s.qplay.vn/2152-0-0-0--1/game/Subway-Surfers.html', 0, N'http://s.qplay.vn/images/product/icon/icon130814-020510.png', N'Subway Surfers', N'Subway Surfers cho Android được thiết kế khá đơn giản, nhẹ nhàng vui tươi với màu sắc, hình ảnh đẹp sống động và cách chơi thú vị sẽ cho bạn những giây phút thư giãn vô cùng thoải mái.
Tham gia trò chơi bạn sẽ vào vai những chú nhóc tinh nghịch Jake, Tricky và Fresh chạy trốn cảnh sát khi đã vẽ bậy lên những toa xe lửa.
Trên đường chạy, trên những tấm ván, người chơi sẽ phải nhảy tránh các chướng ngại vật, lách qua những toa tàu, tránh các đoàn tàu đang chạy và tìm mọi cách để chạy thoát khỏi vòng vây của cảnh sát.
Trên đường tẩu thoát, game thủ cần cố gắng nhặt càng nhiều càng tốt các đồng xu và thu thập các đạo cụ để tăng sức mạnh và tốc độ cho mình.', CAST(0x0000A6CD00E10906 AS DateTime), CAST(0x0000A6CD01041012 AS DateTime), 0, 2, N'http://s.qplay.vn/2152-0-0-0--1/download/Subway-Surfers.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (211, N'http://s.qplay.vn/2102-0-0-0--1/game/Kungfu-panda.html', 0, N'http://s.qplay.vn/images/product/icon/icon_256110814-045156.png', N'Kungfu panda', N'Kung Fu Panda, được biết là Gấu trúc kung fu là một bộ phim hoạt hình 3D của hãng DreamWorks.Bộ phim nói về một chú gấu trúc thích học môn võ thuật kungfu nhưng không được cha đồng ý vì bị bắt buộc phải nối nghiệp bán mì của cha mình. Rồi trong một dịp, cậu được học với 1 sư phụ bậc thầy môn võ kungfu cùng với những đồng môn có tiếng khác. Rồi những chuyện thú vị lại xảy đến với gấu trúc Po tham ăn nhưng đầy hy vọng.
Po là một chú gấu trúc với hình dáng to béo và tham ăn, cậu phải giúp đỡ cha mình chạy bàn trong tiệm mì gia truyền của gia đình. Cha cậu vốn là một đầu bếp lành nghề và mong muốn Po nối nghiệp nghề bán mì truyền thống này. Nhưng chú gấu Po lại có ước mơ khác hẳn là được học môn võ kungfu yêu thích và trở thành bậc thầy tài giỏi của môn võ này. Trong 1 ngày hội, lời tiên tri từ xưa đã giúp Po có thể thực hiện ước mơ của mình. Chú gấu được học với sư phụ Shifu và nhóm Ngũ Hùng (The Furious Five) gồm đại sư tỷ Hổ Nương, sư huynh Khỉ, sư huynh Sếu, sư huynh Bọ ngựa và sư tỷ Rắn.Một ngày nọ, tên hắc đạo báo tuyết Thái Long (người đã phản bội lại sư phụ và muốn trả thù bằng cách quậy phá) trốn thoát khỏi tù, gây nhiều hiểm họa cho mọi người. Trong sự hoảng loạn đó, nhiều sinh vật đều cầu cứu "kẻ được chọn" - võ sĩ Long Thần, đó là gấu trúc Po. Điều đó cũng đồng nghĩa với việc Po phải chiến đấu với tên hắc đạo nguy hiểm này. Với kích thước to béo, cùng tật tham ăn đã gây nhiều khó khăn trong con đường học võ thuật và để có thể chiến thắng được kẻ thù. Và rồi cậu đã biết tận dụng từ chính những điều đó để tạo nên một loại võ kungfu mang đặc trưng rất riêng của mình - Kung Fu Panda.', CAST(0x0000A6CD00E10908 AS DateTime), CAST(0x0000A6CD010411FB AS DateTime), 0, 2, N'http://s.qplay.vn/2102-0-0-0--1/download/Kungfu-panda.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (212, N'http://s.qplay.vn/2032-0-0-0--1/game/Co-may-huy-diet.html', 0, N'http://s.qplay.vn/images/product/icon/icon080814-101921.png', N'Cỗ máy hủy diệt', N'Commando Jack là game bảo vệ chiến thành, cho phép người chơi ngồi bên trong một tháp canh nhỏ và đối mặt với kẻ thù. Bạn là Commando Jack, một anh lính khó tính, ích kỷ và tồi nhất trên hành tinh này. Giờ đây, mọi việc lại tùy thuộc vào bạn khi giải cứu thế giới khỏi sự xâm lăng của người ngoài hành tinh. Xây dựng một mê cung các tòa tháp để đối mặt với sự tàn phá của chúng. Nếu những điều này là chưa đủ, hãy nhảy vào tháp canh và tự mình kết liễu những tên ngoan cố ngoài hành tinh này.', CAST(0x0000A6CD00E1090A AS DateTime), CAST(0x0000A6CD010412EB AS DateTime), 0, 2, N'http://s.qplay.vn/2032-0-0-0--1/download/Co-may-huy-diet.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (213, N'http://s.qplay.vn/1982-0-0-0--1/game/Gunny---Dau-truong-ga.html', 0, N'http://s.qplay.vn/images/product/icon/icon050814-031214.png', N'Gunny - Đấu trường gà', N'Cuộc chiến tranh lâu dài của nhân loại và gà kết nối bởi Chicken Revolution kết thúc với sự ra đời của những con gà zombie.
Zombie gà xuất hiện bất ngờ tấn công và lây nhiễm tất cả các sinh vật sống trong đó có con người và gà. Người và gà quản lý để hợp tác với nhau để tồn tại …
Đặc điểm
-400 Giai đoạn: dễ dàng, bình thường, khó,đặc biệt.
-Các kỹ năng với cách đánh mạnh mẽ
-Các kỹ năng phụ và toàn bộ các kỹ năng', CAST(0x0000A6CD00E109AB AS DateTime), CAST(0x0000A6CD0105111C AS DateTime), 0, 2, N'http://s.qplay.vn/1982-0-0-0--1/download/Gunny---Dau-truong-ga.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (214, N'http://s.qplay.vn/1942-0-0-0--1/game/Hiep-sy-trung-co.html', 0, N'http://s.qplay.vn/images/product/icon/icon020814-115221.png', N'Hiệp sỹ trung cổ', N'Một kỷ nguyên chiến tranh đã đến với thế giới bởi sự trừng phạt của các vị thần .
Lịch sử sẽ ghi danh người chiến thắng và tạo ra trật tự thế giới mới.
Hãy cùng theo hành trình lịch sử tìm hiểu sự thật đằng sau công lý giả dối này nhé!
Tính năng của trò chơi:
- Một cảm giác chiến đấu tuyệt vời
- Hàng loạt các nhân vật trong game
- Đồ họa dễ thương cùng các hiệu ứng tuyệt vời
- Thưởng thức các kiểu chiến đấu khác nhau qua 5 nhân vật anh hùng với những kỹ năng riêng của họ.
- Tạo các chiến lược chiến đấu khác nhau bằng cách kết hợp những anh hùng và các loại quân lính khác nhau .
- Hệ thống chiến đấu đa dạng
- 6 chế độ chiến đấu khác nhau
- Các loại kỹ năng đa dạng và hệ thống nâng cấp kỹ năng', CAST(0x0000A6CD00E109AD AS DateTime), CAST(0x0000A6CD010511DD AS DateTime), 0, 2, N'http://s.qplay.vn/1942-0-0-0--1/download/Hiep-sy-trung-co.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (215, N'http://s.qplay.vn/1902-0-0-0--1/game/Chien-than-Ga.html', 0, N'http://s.qplay.vn/images/product/icon/icon2010814-100157.png', N'Chiến thần Gà', N'Câu chuyện của game bắt đầu khi lũ Zombies từ một công ty y tế bất ngờ bị “xổng chuồng” và tràn ngập thành phố. Do vậy, những chú gà dũng cảm được tập hợp để tiêu diệt lũ Zombies này. Nếu bạn chưa từng tưởng tượng mình sẽ ra sao nếu nhập vai vào một loài vật thì bạn nên thử Chicken Warrior: Zombie Hunter. Bởi đơn giản, người chơi sẽ hóa thành các chiến binh gà. Nếu bạn không muốn thử một lần thì cũng không sao. Nhưng như vậy, bạn đã bỏ lỡ một trải nghiệm game hiếm có đấy. Hơn vậy, bạn đang tiếp tay cho lũ Zombies xấu xa kia tiếp tục đập phá, tiêu hủy mọi thứ trong thành phố và bắt người vô tội nữa.
Lũ Zombies này có số lượng rất lớn do vậy, bạn sẽ có sự hỗ trợ của hơn 200 loại vũ khí cùng công cụ khác nhau để tiêu diệt chúng. Với con số này, bạn có thể tìm thấy đủ loại vũ khí từ bom, mìn, súng cho tới mũ tránh đạn… Hãy cố gắng đánh phủ đầu đối phương ngay từ đầu, bởi bạn càng tiêu diệt được nhiều Zombies thì bạn càng có thêm nhiều điểm thưởng để mở khóa các bàn tiếp theo và có cơ hội sở hữu nhiều vũ khí hạng nặng cần thiết cho các nhiệm vụ khó khăn về sau.', CAST(0x0000A6CD00E109AE AS DateTime), CAST(0x0000A6CD010512AA AS DateTime), 0, 2, N'http://s.qplay.vn/1902-0-0-0--1/download/Chien-than-Ga.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (216, N'http://s.qplay.vn/1852-0-0-0--1/game/Dua-o-to-ban-sung.html', 0, N'http://s.qplay.vn/images/product/icon/twisted_metal_2_icono_by_nacho94-d7dbtwb310714-015851.png', N'Đua ô tô bắn súng', N'Twisted Metal 2 được coi là game đua xe mới nhất trong năm 2014 vừa được ra mắt. Điều đặc biệt là nó sẽ hội tự những tinh hoa nhất từ các game đua xe khác. Đây quả thực sẽ là phiên bản đua xe hay nhất từ trước đến nay.
Twisted Metal 2 được coi là một game đua xe phù hợp với mọi lứa tuổi, đơn giản chỉ việc ngang trái, nghiêng phải để điều khiển xe đi đúng hướng.
Trong game bạn sẽ được trải nghiệm rất nhiều loại xe đua danh tiếng với sức công phá mạnh mẽ,trải nghiệm đưa bạn từ bất ngờ này đến bất ngờ khác.', CAST(0x0000A6CD00E109B0 AS DateTime), CAST(0x0000A6CD0105135D AS DateTime), 0, 2, N'http://s.qplay.vn/1852-0-0-0--1/download/Dua-o-to-ban-sung.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (217, N'http://s.qplay.vn/1812-0-0-0--1/game/Cuoc-chien-thoi-tien-su.html', 0, N'http://s.qplay.vn/images/product/icon/icon300714-111917.png', N'Cuộc chiến thời tiền sử', N'Cuộc chiến thời tiền sử đã được tái hiện lại!
Thời gian dài trước đây trong thời kỳ đồ đá,cách duy nhất để tồn tại là để chiến đấu với các bộ tộc khác cho đất và nguồn lực hạn chế. Bạn có để làm chủ vũ khí của bạn và giành chiến thắng trong trận chiến sử thi để đảm bảo sự lãnh đạo của một trong những bộ lạc!
Cuộc chiến thời tiền sử là một trò chơi chiến lược chuyển thể.Người chơi sẽ sử dụng các vũ khí để tấn công đối phương,nó có kiểu chơi giống như Gunny.Hãy căn lực và góc thật tốt để có thể trúng được mục tiêu nhé!', CAST(0x0000A6CD00E109B1 AS DateTime), CAST(0x0000A6CD01051417 AS DateTime), 0, 2, N'http://s.qplay.vn/1812-0-0-0--1/download/Cuoc-chien-thoi-tien-su.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (218, N'http://s.qplay.vn/1772-0-0-0--1/game/Manh-Long-phuc-han.html', 0, N'http://s.qplay.vn/images/product/icon/icon290714-125640.png', N'Mãnh Long phục hận', N'Võ học thật là vô biên, bạn có bao giờ mong muốn một lần trở thành đại tông sư võ học, một lần trở thành minh chủ võ lâm?
Tinh thông các tuyệt kỹ bí truyền, các chiêu thức bá đạo, một người địch lại trăm người!
Mãnh long phục hận sẽ đem lại cho bạn cảm nhận như thế,bạn sẽ lạc vào một thế giới kiếm hiệp của những anh hùng trong truyền thuyết.Hành trình trở thành huyền thoại võ thuật của chàng trai Lý Tiểu Long.Câu chuyện về cuộc đời của huyền thoại võ thuật Lý tiểu long và môn phái Vịnh Xuân Quyền.Game hành động đối kháng với những chiêu thức võ thuật đẹp mắt...
Rất nhiều đối thủ mạnh sẽ xuất hiện trong từng bài chơi.', CAST(0x0000A6CD00E109B3 AS DateTime), CAST(0x0000A6CD010514D5 AS DateTime), 0, 2, N'http://s.qplay.vn/1772-0-0-0--1/download/Manh-Long-phuc-han.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (219, N'http://s.qplay.vn/1672-0-0-0--1/game/Ai-la-thanh-soi.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed240714-051712.png', N'Ai là thánh soi', N'Bạn đã bao giờ nghe đến biệt danh Thánh Soi chưa?
Nếu bạn là một fan của Haivl thì bạn hẳn đã biết đến biệt danh này rồi, trong các loại thánh có: Thánh Troll, Thánh Nhọ, Thánh Phồng, Thánh Tán Gái, Thánh Soi vân vân và vân vân. Thánh Soi là thể hiện sức mạnh của đôi mắt và trí tưởng tưởng vô cùng phong phú, để tìm ra những điểm đặc biệt của những bức ảnh.
Hòa cùng vào trào lưu "Đuổi hình bắt chữ", "Ai là thánh troll" đang làm mưa làm gió trên thị trường game Việt, Game Ai Là Thánh Soi đem đến cho bạn một trải nghiệm hoàn toàn mới của thể loại game Đuổi hình bắt chữ và rất nhiều thánh thức mà bạn có khó có thể vượt qua được.
Bạn có muốn thử khả năng săm soi của mình không? Chắc chắn bạn sẽ không bỏ lỡ cơ hội thể hiện khả năng vượt bậc của mình rồi. Hãy tải game và cùng so tài với các thánh.
Nhiệm vụ của bạn là phải tìm ra các đối tượng đang ẩn mình trong các hình ảnh, không chỉ đuổi hình băt chữ mà bạn còn phải đuổi hình bắt chó, đuổi hình bắt hổ, đuổi hình bắt dê, ôi còn nhiều lắm tha hồ mà đuổi.
Nếu bạn thấy thích game này thì hãy rate cho game nhé.', CAST(0x0000A6CD00E109B5 AS DateTime), CAST(0x0000A6CD01051608 AS DateTime), 0, 2, N'http://s.qplay.vn/1672-0-0-0--1/download/Ai-la-thanh-soi.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (220, N'http://s.qplay.vn/1472-0-0-0--1/game/Van-truot-huyen-thoai.html', 0, N'http://s.qplay.vn/images/product/icon/ic160714-041239.png', N'Ván trượt huyền thoại', N'Ván trượt là một trong những phần không thể thiếu trong "bộ sưu tập" trò chơi mạo hiểm ở mỗi khu vực giải trí. Các pha lộn nhào cùng tốc độ lao "như tên lửa" trên đường ray ngoằn ngoèo khiến không ít bạn cảm thấy "choáng váng".
Nếu như các bạn có tinh thần thép,thì hãy thử ngay,tuy trên game chúng ta được giảm nhẹ những pha hành động mạo hiểm,nhưng nó vẫn thật đáng để tải về.Tham gia cùng chú thỏ sành điệu này nhé', CAST(0x0000A6CD00E109B7 AS DateTime), CAST(0x0000A6CD010516C4 AS DateTime), 0, 2, N'http://s.qplay.vn/1472-0-0-0--1/download/Van-truot-huyen-thoai.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (221, N'http://s.qplay.vn/1342-0-0-0--1/game/Skies-of-war-2014.html', 0, N'http://s.qplay.vn/images/product/icon/1250614-013215120714-090512120714-104238.png', N'Skies of war 2014', N'Tái xuất giang hồ lần này của Splay chắc chắn là một phiên bản cực kỳ đáng được mong đợi mang tên Skies Of War - một thể loại bắn máy bay pha trộn theo phong cách Arcade và ý tưởng Nhập vai RPG.Hơn 50 chiếc máy bay được vẽ mới, 10 khung cảnh khác nhay được xây dựng tích hợp cho mỗi màn chơi, tuy chỉ là hình 2D nhưng sắc nét và cách phối mày thông minh dựa trên những mày sắc chủ đạo như xám, xanh, và sử dụng hiệu ứng triệt để của khói lửa tái hiện một không khí khốc liệt - một trận chiến của Bảo vệ chủ quyền
Game bao gồm 3 màn chơi chính
+ Protect Mode
+ Dead Mode
+ Target Mode
Nào hãy cùng SKies Of War không chỉ bay lượn không trung mà còn tham gia hơn 100 màn chơi khác nhau vô cùng sống động.', CAST(0x0000A6CD00E109B8 AS DateTime), CAST(0x0000A6CD0105178A AS DateTime), 0, 2, N'http://s.qplay.vn/1342-0-0-0--1/download/Skies-of-war-2014.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (222, N'http://s.qplay.vn/1282-0-0-0--1/game/Death-Racing-3D.html', 0, N'http://s.qplay.vn/images/product/icon/unnamedA6CLIB1L110714-105415110714-020040.png', N'Death Racing 3D', N'Hãy đến và trải nghiệm Death Racing 3D - mang tới cho bạn niềm vui không giới hạn!
Cách chơi:
Miễn là bạn trong trò chơi và trên đường đua, nhặt các vật phẩm và nhắm kĩ mục tiêu , bạn có thể bắn , đập những kẻ ngáng đường .Chiếc xe phân khỗi lớn của bạn sẽ tiêu thụ nitơ khi tăng tốc , vì vậy hãy nhớ để thu thập nitơ, hoặc bạn sẽ tụt lại phía sau.
Tất nhiên bạn có thể chia sẻ điểm số của bạn để xếp hạng. Chứng minh xem ai là mạnh mẽ nhất với người chơi từ khắp nơi trên thế giới?
Có thể được chia sẻ với các mạng xã hội khác nhau, chẳng hạn như Facebook,...SÚNG và XE trong shop , hãy mua xe khủng và trải nghiệm sức mạnh của đế vương .Nào, đi thôi!', CAST(0x0000A6CD00E109B9 AS DateTime), CAST(0x0000A6CD0105187C AS DateTime), 0, 2, N'http://s.qplay.vn/1282-0-0-0--1/download/Death-Racing-3D.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (223, N'http://s.qplay.vn/1182-0-0-0--1/game/Cross-Fire.html', 0, N'http://s.qplay.vn/images/product/icon/icon090714-094606.png', N'Cross Fire', N'Thể loại game bắn súng siêu hay cho mọi người,cách chơi đơn giản với 1 góc nhìn.Trò chơi sẽ yêu cầu độ phản xạ,cũng như sự chính xác từ người chơi,tiết kiệm tối đa đạn của bạn để tiêu diệt đối phương.
Khi tham gia trò chơi,người chơi sẽ hóa thân thành những kẻ cướp nhà băng,trên đường tẩu tán bị cảnh sát theo đuổi phía sau,hãy nâng cấp súng và bán phá kẻ thù thật nhanh và gọn nhé', CAST(0x0000A6CD00E10A44 AS DateTime), CAST(0x0000A6CD0105194A AS DateTime), 0, 2, N'http://s.qplay.vn/1182-0-0-0--1/download/Cross-Fire.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (224, N'http://s.qplay.vn/1152-0-0-0--1/game/Ma-toc-do-2014.html', 0, N'http://s.qplay.vn/images/product/icon/f547a3305ama-toc-do_ICON030714-025315.png', N'Ma tốc độ 2014', N'Ma tốc độ là một game đua xe vô cùng thú vị trện hệ điều hành Android. Bạn đã thử chưa nào? Với rất nhiều mẫu xe đua đẹp mắt, bạn hãy chọn cho mình một chiếc moto sành điệu nhất để trở thành một tay đua cừ khôi, dễ dàng chinh phục các chướng ngại vật và vi vu trên những đường phố nổi tiếng của New York nhé!', CAST(0x0000A6CD00E10A46 AS DateTime), CAST(0x0000A6CD01051A41 AS DateTime), 0, 2, N'http://s.qplay.vn/1152-0-0-0--1/download/Ma-toc-do-2014.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (225, N'http://s.qplay.vn/1002-0-0-0--1/ung-dung/Cafe24h---Ung-dung-doc-bao-so-1-Viet-Nam.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed-53894e7a99442-100090614-015904.png', N'Cafe24h - Ứng dụng đọc báo số 1 Việt Nam', N'Cafe24h là ứng dụng đọc báo, giải trí, mua sắm trên Smartphone do Qplay phát hành hoàn toàn miễn phí. Cafe24h hỗ trợ bạn đọc tất cả các tờ báo online trên di động. Bạn có thể dễ dàng sử dụng như việc bạn đọc báo trên máy tính.
Tình năng chính :
- Ứng dụng đọc báo Cafe24h với giao diện hiện đại, mượt mà
- Nội dung phong phú và tốc độ nhanh, cập nhật liên tục trong ngày.
- Với trên 20 chuyên mục khác nhau như bóng đá, xã hội, hình sự, thế giới ..vv. Đáp ứng mọi lứa tuổi hay nhu cầu của người sử dụng.
Hi vọng với Ứng dụng Cafe24h sẽ giúp bạn có những phú giây giải trí cũng như thư giãn mỗi ngày.', CAST(0x0000A6CD00E10A48 AS DateTime), CAST(0x0000A6CD01051AF1 AS DateTime), 0, 2, N'http://s.qplay.vn/1002-0-0-0--1/download/Cafe24h---Ung-dung-doc-bao-so-1-Viet-Nam.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (226, N'http://s.qplay.vn/962-0-0-0--1/game/Bi-mat-ngoi-mo-co.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed210514-015648.png', N'Bí mật ngôi mộ cổ', N'Khi chết đang đến gần,Zombies mang những nỗi sợ chết người!
Đây là một trò chơi chiến lược cũng như trò chơi hành động .
Bảo vệ ngôi mộ cổ trước sự sâm lăng của Zombies với kỹ năng đặc biệt của riêng mình, vì vậy bạn sẽ cần phải suy nghĩ nhanh và có một chiến lược thành công và chống lại tất cả trước khi chúng xâm nhập vào nhà của bạn và ám sát bạn .
Hãy cẩn thận với cách dùng người của bạn,vì bạn bị hạn chế vũ khí và đạn dược 
Bạn phải thật nhanh để bố trí thông minh và hành động.
Súng, Armored Xe tăng, Spears và Dao - Bạn có một loại kỳ lạ của vũ khí , nhưng bạn phải sử dụng chúng một cách khôn ngoan Hãy để anh hùng của bạn giúp bạn có được điểm trong một thời gian, nhưng không hình thành thói quen luôn luôn nhận được trong một sửa chữa! Vì vậy, hãy cẩn thận khi gặp phải sức mạnh của các chúa Zombie !
Ứng dụng này cung cấp trong ứng dụng mua hàng . Bạn có thể vô hiệu hóa mua trong ứng dụng sử dụng cài đặt thiết bị của bạn.', CAST(0x0000A6CD00E10A49 AS DateTime), CAST(0x0000A6CD01051C32 AS DateTime), 0, 2, N'http://s.qplay.vn/962-0-0-0--1/download/Bi-mat-ngoi-mo-co.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (227, N'http://s.qplay.vn/912-0-0-0--1/game/Anh-khong-dao-mo.html', 0, N'http://s.qplay.vn/images/product/icon/Rail_Rush_icon-300x300130514-101217.png', N'Anh không đào mỏ', N'Hãy sẵn sàng cho cuộc phiêu lưu sử thi này!
Công việc của bạn là để thu thập đá quý và thỏi vàng! Sẽ có bất ngờ trên đường đi, và quà tặng đặc biệt mà bạn kiếm được nếu bạn may mắn! Phá vỡ những quả trứng đá để lộ những gì bên trong nó và nhận tất cả các đá quý cho bộ sưu tập cá nhân của nhà thám hiểm của bạn!
Tìm những con đường mới và thú vị để khám phá trên thiết bị của mình, và đi qua những độ khó đặc biệt để kiếm được nhiều hơn! Với nhiều môi trường thú vị,qua các hang động Crazy,Dưới Thế giới,Trong lòng đất,Vùng đất tuyết,trên máy hơi nước, tìm đường vào rừng Jurassic và khám phá lăng mộ của Pharaoh, tất cả điều này và nhiều cấp độ bất ngờ mà bạn sẽ ngạc nhiên với kịch bản đầy màu sắc của họ.
Bạn cũng có thể trang bị cho xe của bạn với bộ tăng sức mạnh để mở rộng cơ hội của bạn bên trong,Hãy hoàn thành nhiệm vụ và xếp hạng cao nhất, để trở thành nhà thám hiểm bậc thầy nào!', CAST(0x0000A6CD00E10A4A AS DateTime), CAST(0x0000A6CD01051CEB AS DateTime), 0, 2, N'http://s.qplay.vn/912-0-0-0--1/download/Anh-khong-dao-mo.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (228, N'http://s.qplay.vn/906-0-0-0--1/game/Dau-truong-sinh-tu.html', 0, N'http://s.qplay.vn/images/product/icon/ryu080514-100756.png', N'Đấu trường sinh tử', N'Tựa game Đấu Trường Lửa vốn không xa lạ gì với nhiều người chơi game đối kháng, cái tên của nó làm người ta có thể liên tưởng ngay tới những trận chiến khốc liệt nơi mà ở đó không có chỗ cho sự khoan nhượng. Có thể kể đến 1 vài cái tên rất nổi bật trong loạt game này như Ruy, Ken, Vega, Chun-Li, Bi-Son… và với những người từng đam mê thể loại này thì việc được thưởng thức game trên nhiều hệ máy luôn là một trải nghiệm tuyệt vời.', CAST(0x0000A6CD00E10A4C AS DateTime), CAST(0x0000A6CD01051DA3 AS DateTime), 0, 2, N'http://s.qplay.vn/906-0-0-0--1/download/Dau-truong-sinh-tu.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (229, N'http://s.qplay.vn/902-0-0-0--1/game/Sky-Force-2014.html', 0, N'http://s.qplay.vn/images/product/icon/SkyForce-icon020514-021007.png', N'Sky Force 2014', N'Tinny là một chàng lính cứu hỏa trẻ tự mãn luôn vi phạm kỉ luật. Sự ngạo mạn của nó vô tình đã cướp đi mạng sống của CAPTAIN BEN trong một điệp vụ. Từ đó Tinny sống trong mặc cảm tội lỗi và từ bỏ ước mơ làm lính cứu hỏa của mình. Cho đến một ngày đám cháy lại bốc lên và Tinny quyết định tiếp tục hành trình vượt qua nỗi sợ hãi của mình...
Trò chơi Sky Force phiên bản 2014, một mini game đơn giản trên thiết bị di động theo dạng bắn máy bay, kiếm đồ chơi nâng cấp sức mạnh. Sky Force ra đời cách đây 10 năm, rất được yêu thích và xuất hiện trên nhiều nền tảng điện thoại khác nhau, đặc biệt là những máy chạy Java. Và để kỉ niệm cột mốc đó thì giờ đây nó đã được làm mới với phiên bản 2014, có đồ họa đẹp hơn, cách chơi cũng phong phú đa dạng hơn, trong đó có bullet-time, hiệu ứng làm chậm lại mọi vật để chúng ta dễ né đạn hơn.', CAST(0x0000A6CD00E10A4D AS DateTime), CAST(0x0000A6CD01051E68 AS DateTime), 0, 2, N'http://s.qplay.vn/902-0-0-0--1/download/Sky-Force-2014.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (230, N'http://s.qplay.vn/899-0-0-0--1/game/Chicken-Invaders-3.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed250414-102836.png', N'Chicken Invaders 3', N'Trong nhiều thế kỷ, chúng ta đã áp bức loài gà, nướng, quay, hầm, và nhồi nhét chúng trong bánh. Đã đến lúc chúng ta phải trả. Gà đang xâm nhập trái đất, tìm trả thù cho sự áp bức của anh trai trần của họ! Đó là thời gian cho bạn để đấu tranh cho quyền tổ tiên của chúng tôi để món trứng tráng. Bạn sẽ thành công? 
Tương lai của bánh mì kẹp thịt gà sẽ được an toàn? Hoặc bạn sẽ kết thúc như là một phần của trình đơn trong một nhà hàng thịt gà thiên hà?
Có thể 4 người cùng chơi trên 1 game.
Hành trình phải vượt qua 12 dải sao
Khám phá 6 loại vũ khí cực mạnh
Thu thập tiền nhiều
Lưu điểm trên Internet. Bạn có thể lưu lại điểm của mình để mọi người trên mạng đều biết đến bạn', CAST(0x0000A6CD00E10A50 AS DateTime), CAST(0x0000A6CD01051F41 AS DateTime), 0, 2, N'http://s.qplay.vn/899-0-0-0--1/download/Chicken-Invaders-3.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (231, N'http://s.qplay.vn/893-0-0-0--1/game/Duong-dua-ruc-lua.html', 0, N'http://s.qplay.vn/images/product/icon/app_icon210414-104734240414-085759.png', N'Đường đua rực lửa', N'Đây là một trò chơi đua xe độc ​​đáo. Mục tiêu của bạn không phải là chỉ để tránh những trở ngại nữa, bạn nên dùng vũ khí của bạn và tiêu diệt đối thủ cạnh tranh khác trong trò chơi này!Tro chơi đồ họa 3D, động cơ thực tế với những cảnh trò chơi hoành tráng, kiểm soát trọng lực, và hiệu ứng âm thanh sống động. Tất cả những tính năng này sẽ cung cấp cho bạn một trải nghiệm chưa từng có trò chơi đua xe!
- Chướng ngại vật phong phú và đa dạng cung cấp cho bạn những thách thức chưa từng có!
- Hệ thống độc đáo khi cảnh sát đuổi theo,khiến cho bạn cảm giác trò chơi kích thích nhiều hơn nữa!
- Tạo động cơ hoàn hảo của bạn với hệ thống tăng cường và nâng cấp!
- Nghiêng điện thoại hoặc máy tính bảng để kiểm soát lại động cơ bên phải hoặc trái
- Thu thập tất cả các loại vũ khí và ném vào tay đua có động cơ khác
- Chạm vào màn hình để tăng tốc độ,hãy để ý bình N2o của bạn. Vì vậy bạn nên chú ý thu thập N2o dọc đường.
- Tăng tốc độ và chuyển hướng linh hoạt, chạy trốn khỏi cảnh sát!
- Mỗi động cơ có thể được tăng cường. Tạo ra động cơ mạnh nhất của bạn!
- Thu thập tiền xu để mở khóa động cơ khác!', CAST(0x0000A6CD00E10A51 AS DateTime), CAST(0x0000A6CD0105200C AS DateTime), 0, 2, N'http://s.qplay.vn/893-0-0-0--1/download/Duong-dua-ruc-lua.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (232, N'http://s.qplay.vn/880-0-0-0--1/game/Dua-xe-cong-thuc-1.html', 0, N'http://s.qplay.vn/images/product/icon/12110414-040931.png', N'Đua xe công thức 1', N'Những tay đua siêu hạng, những chiếc xe công thức 1 siêu khủng. Bạn đã phải là một người có tinh thần thép để tham gia đường đua tử thần này. Với hàng trăm mẫu xe của các nhãn hiệu nổi tiếng trên thế giới kèm theo với những quốc lộ đông đúc ở khắp nơi. Nào hãy nhấn ga tham gia vào game Đua Xe Công Thức 1.', CAST(0x0000A6CD00E10A55 AS DateTime), CAST(0x0000A6CD010520DC AS DateTime), 0, 2, N'http://s.qplay.vn/880-0-0-0--1/download/Dua-xe-cong-thuc-1.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (233, N'http://s.qplay.vn/837-0-0-0--1/game/Ai-thong-minh-hon-hs-lop-5---New-Version.html', 0, N'http://s.qplay.vn/images/product/icon/72150314-102052.png', N'Ai thông minh hơn hs lớp 5 - New Version', N'Game show nổi tiếng của thế giới cũng như ở Việt Nam "Ai thong minh hon hs lop 5" nay đã chính thức có mặt trên Android. Bạn muốn thử sức mình với các em học sinh lớp 5 không chứ . Xem mình có giỏi bằng các e nhỏ không nhé.
Ai thong minh hon hs lop 5 miễn phí 100%
Cách chơi :
- Mô tả chân thật nhật như game show thực tế
- Các câu hỏi đúng với nhiều lĩnh vực khác nhau.
- Đồ hoạ + âm thanh đẹp mắt và sống động
Nào còn đợi gì nữa mau mau đấu trí cùng các em nhỏ với Ai thong minh hon hs lop 5 nào.', CAST(0x0000A6CD00E10AE5 AS DateTime), CAST(0x0000A6CD010521A1 AS DateTime), 0, 2, N'http://s.qplay.vn/837-0-0-0--1/download/Ai-thong-minh-hon-hs-lop-5---New-Version.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (234, N'http://s.qplay.vn/818-0-0-0--1/game/Bao-ve-thanh-dia.html', 0, N'http://s.qplay.vn/images/product/icon/72080314-093400.png', N'Bảo vệ thánh địa', N'Thế giới lâm nguy, các thế lực ma quái hoành hành với sự trỗi dậy của quỷ vương Drako, kẻ luôn tin là mình bất từ và luôn nuôi tham vọng thống trị thế giới. Đám yêu ma tay sai mặc sức đốt phá, giết chóc, cướp đi sinh mạng của rất nhiều rất nhiều những người dân vô tội. May thay vương quốc Radian có những chiến binh thật sự tinh nhuệ và anh dũng phi thường đã đứng ra chống lại thế lực ma quái. Liệu ai sẽ chiến thắng ? Liệu chính nghĩa có thắng được hung tàn. Tất cả đang đợi bạn thể hiện tài năng chiến đấu khi vào vai vị tướng tài ba vương quốc Radian chống lại thế lực yêu ma tàn bạo
- “Bảo vệ thánh địa” tự hào là game chiến thuật phòng thủ tháp made in Việt Nam lớn nhất hiện nay với 29 loại tháp, 15 loại quái vật, 24 loại nâng cấp, 4 kỹ năng tướng cùng 50 màn chơi và chế độ chơi khác nhau
Cách chơi: 
- Xây các tháp phòng thủ để bắn hạ hết những tên yêu ma tay sai của binh đoàn địa ngục
- 5 nhóm tháp có 5 chức năng khác nhau hãy kết hợp chúng với nhau thật tinh tế để tạo ra sức mạnh vô địch cản bước tiến của mọi kẻ địch
- Bạn hãy nhớ nâng cấp vũ khí hoặc kỹ năng ngay khi có thể để dễ dàng hơn trong việc tiêu diệt quân địch nhé
- Ngoài ra bạn hãy cố gắng sử dụng kỹ năng thật đúng lúc, đúng thời điểm chúng sẽ là rất cần thiết và đôi khi giúp bạn thay đổi cả cục diện trận đánh đấy', CAST(0x0000A6CD00E10AE7 AS DateTime), CAST(0x0000A6CD01052279 AS DateTime), 0, 2, N'http://s.qplay.vn/818-0-0-0--1/download/Bao-ve-thanh-dia.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (235, N'http://s.qplay.vn/803-0-0-0--1/game/Doraemon-Jump.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed030314-125950.png', N'Doraemon Jump', N'Điều khiển Doremon nhảy cao và ăn bánh rán, mỗi chiếc bánh rán ăn được sẽ giúp Doremon nhảy cao hơn và sạc pin năng lượng để sử dụng các bảo bối. Các bảo bối có thể được mua từ cửa hàng bảo bối thế kỷ 22. 
+ Chong chóng tre
+ Đèn pin phóng đại
+ Mũ tàng hình
+ Vòng tròn an toàn
+ Doremini
+ Tên lửa phản lực
+ Đồng hồ ngưng đọng thời gian
+ Cỗ máy thời gian
Hãy cùng Doremon phiêu lưu vào thế kỷ 22 nhé', CAST(0x0000A6CD00E10AEF AS DateTime), CAST(0x0000A6CD01052332 AS DateTime), 0, 2, N'http://s.qplay.vn/803-0-0-0--1/download/Doraemon-Jump.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (236, N'http://s.qplay.vn/795-0-0-0--1/game/Ban-ca-dai-duong.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72250114-040056220214-103938.png', N'Bắn cá đại dương', N'Thế giới hải dương rộng lớn mở ra với muôn ngàn những điều kỳ thú và những loài cá lung linh sắc màu đã đến rất gần với bạn với 1 game đậm chất mỹ thuật và vui nhộn “Bắn cá đại dương”. Bạn là anh chàng thủy thủ dũng cảm của biển cả, hay là những công chúa xinh đẹp của biển khơi, hãy tham gia những chuyến thám hiểm đại dương của chúng tôi để đắm chìm trong thế giới tuyệt đẹp của các loại cá và nhanh tay đánh bắt những chú cá đẹp nhát và to nhất để khoe bạn bè. Nào hãy đi cùng tôi đến đại dương sâu thẳm và kỳ vĩ nhé
Cách chơi:
- Chạm vào màn hình để bắn nShững chú cá. Cá càng nhỏ thì càng dễ bắt, những chú cá to thì rất khỏe và khó bắt nếu không bắn liên tục chúng bằng những súng mạnh nhất
- Bạn có thể nâng cấp súng cho mạnh lên và bắn nhanh hơn
- Có 9 loại súng, chúng khác nhau ở sức mạnh và phạm vi đánh bắt được của lưới. Súng càng to bắn càng mạnh nhưng tốn càng nhiều đạn
- Bom nước được dùng để đánh bắt nhanh chóng cá và đem lại cho bạn những khoản thu kếch xù nhờ bắt được những chú cá thật là bự
- Bánh mỳ là mồi câu lý tưởng, chúng thu hút cá đến với vị trí bạn thả bánh, thật đơn giản thả bánh rồi quăng lưới bắt cá phải không
- Bom điện giúp làm cho mấy chú cá bị choáng váng và trở nên chậm chạp lúc đó hãy thả thật nhiều lưới để bắt những con cá bự nha
- Ngoài ra bạn còn nhận thêm sự trợ giúp của súng điện, chúng rất mạnh và giúp bạn tiêu diệt hết cá trong nháy mắt Game được bổ sung hệ thống nhiệm vụ phong phú, và hệ thống thưởng vàng tự động mỗi 10 giây. Bạn tha hồ bắn cá mà không lo hết đạn, còn gì vui hơn nhỉ, nào hãy nhanh tay down về và thưởng ngoạn thế giới hải dương tuyệt đẹp thôi các bạn', CAST(0x0000A6CD00E10AF0 AS DateTime), CAST(0x0000A6CD010523F4 AS DateTime), 0, 2, N'http://s.qplay.vn/795-0-0-0--1/download/Ban-ca-dai-duong.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (237, N'http://s.qplay.vn/781-0-0-0--1/game/Love-Challenge.html', 0, N'http://s.qplay.vn/images/product/icon/72x72280114-031737.png', N'Love Challenge', N'Vào 1 ngày xấu trời nọ, Jack và Jane đang đi dạo thì bất chợt lũ côn đồ ở đâu lao ra tính giở trò ăn cướp. Tuy nhiên, cặp đôi này không ngon ăn, dễ xơi như chúng tưởng, vì cả 2 đều là dân parkour chuyên nghiệp. Bọn côn đồ thì cũng đang đói, cả ngày chả kiếm đc vụ nào, thế nên chúng hò nhau đuổi theo hòng kiếm tí tiền mua pizza ăn. Vậy là cuộc rượt đuổi bắt đầu.
Nhiệm vụ của các bạn là điều khiển 2 nhân vật chính của chúng ta tránh né các chướng ngại vật trên đường, đồng thời ăn các vật phẩm để có thể thoát khỏi chúng càng xa càng tốt. Hãy chơi, cảm nhận, chia sẻ trên facebook và có 1 Lễ Tình Nhân hạnh phúc bên người yêu của mình, các bạn nhé!', CAST(0x0000A6CD00E10AF2 AS DateTime), CAST(0x0000A6CD010524FB AS DateTime), 0, 2, N'http://s.qplay.vn/781-0-0-0--1/download/Love-Challenge.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (238, N'http://s.qplay.vn/775-0-0-0--1/game/Nong-trai-huyen-thoai.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72x72230114-093220.png', N'Nông trại huyền thoại', N'Thị trấn " Cối xay gió "  từng là một thị trấn hết sức xinh đẹp và sầm uất !
Những mặt hàng nông sản ở đây tốt đến nỗi mà nó trở thành mục tiêu săn lùng của các thương gia từ khắp nơi trên thế giới. Tuy nhiên, không  hiểu vì lý do gì mà vài năm gần đây tất cả các nông trại trong thị trấn đều bị mất mùa trầm trọng. Dù là Cà rốt, Khoai tây, Cà chua hay Nấm đều bị giảm sản lượng xuống đến mức báo động.
Những phiên chợ lớn hàng năm mở ra rồi lại chìm trong thất vọng, số lượng người mua bán thưa dần và chẳng còn ai nhớ đến nó nữa. Tiêp đó thị trấn còn phải đối mặt với khó khăn lớn nhất từ trước đến giờ khi lão thị trưởng quyết định bán dần những mảnh đất cho khu công nghiệp. 
Làng mạc tiêu điều và dân làng cũng dần chuyển sang nơi khác ...
Và bạn sẽ được nhận một nông trại nhỏ sắp tàn lụi ven thị trấn, bằng sự siêng năng của mình bạn sẽ vực dậy nó và đưa cả thị tấn trở lại những ngày huy hoàng như trước kia.
Các tính năng nổi bật:
-Sử dụng hình ảnh các trái cây nghộ nghĩnh dễ thương
-Dễ chơi, dễ nắm bắt nhưng đạt điểm cao trên top cao thủ thì không có dễ đâu nhé.
-Cách chơi rất đơn giản, nối các loại hoa quả cùng loại và loại bỏ chúng một cách nhanh nhất.
-Chú ý trạng thái hưng phấn của hoa quả để nhân combo  điểm cao hơn.
-Trong shop VIP có bán nhiều loại vật phẩm rất thú vị, hãy khám phá chúng nhé.
Với phong cách đồ họa tươi sáng dễ thương và âm thanh vui nhộn, chắc chắn Farm Saga: Nông trại huyền thoại sẽ mang đến cho bạn những giây phút giải trí thú vị nhất. 
Nhanh tay thu hoạch nào !', CAST(0x0000A6CD00E10AF3 AS DateTime), CAST(0x0000A6CD010525C7 AS DateTime), 0, 2, N'http://s.qplay.vn/775-0-0-0--1/download/Nong-trai-huyen-thoai.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (239, N'http://s.qplay.vn/773-0-0-0--1/game/Boom-nam-lun.html', 0, N'http://s.qplay.vn/images/product/icon/icon72220114-105843.png', N'Boom nấm lùn', N'Ở một vùng đất xa ơi là xa… lâu ơi là lâu ….đã tồn tại một  vương  quốc Nấm Lùn trù phú xanh tươi. Ở đây có những cư dân Nấm Lùn xinh đẹp và cần cù lao động, điều đặc biệt các cư dân này là những trái cây biết đi biết nói biết hát ^^
 Một ngày kia xuất hiện 1 gã thổ dân vô cùng hung dữ, hắn cực kỳ thích thú và them khát các cư dân trái cây xinh đẹp và thơm ngon. Vì vậy hắn đã lôi kéo đám trái cây xấu bụng lười lao động bằng cách cho chúng cai trị cả Vương Quốc Nấm Lùn miễn là hang ngày “cúng tế” những cư dân trái cây thơm ngon cho hắn giải khát và…xay sinh tố uống dần. Hắn phong cho chúng những chức vụ như Chúa tể Thanh Long, Đại tá Dưa Hấu, Bà Chúa Tuyết,…giúp hắn đàn áp cư dân Nấm Lùn. Nhưng có 4 chiến binh Nấm Lùn xinh đẹp và dũng cảm quyết tâm chống lại âm mưu ác độc của bọn xấu xa.  

Còn cần chờ gì nữa bạn hãy nhập vai 1 trong 4 chiến binh Nấm Lùn đi chinh phục thử thách và giải cứu cả vương quốc ngay và luôn nào!!!!! 

Game với đồ họa chibi đáng yêu

Âm thanh ngộ nghĩnh vui vẻ.

Số lượng màn chơi với mode chơi phong phú.

Hệ thống chia sẻ điểm miễn phí lên facebook và với bạn bè chơi game.', CAST(0x0000A6CD00E10AF4 AS DateTime), CAST(0x0000A6CD0105267F AS DateTime), 0, 2, N'http://s.qplay.vn/773-0-0-0--1/download/Boom-nam-lun.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (240, N'http://s.qplay.vn/770-0-0-0--1/ung-dung/Tin-nhan-chuc-tet-2014.html', 0, N'http://s.qplay.vn/images/product/icon/72200114-094232.png', N'Tin nhắn chúc tết 2014', N'Năm mới đến rồi,hãy gửi những lời yêu thương đến bạn bè và gia đình mình lời chúc thân mật với bao tình cảm ta gửi gắm.Lời yêu thương dù nói mãi cũng chẳng bao giờ là thừa, tình yêu dù nhiều bao nhiêu cũng chẳng bao giờ là đủ. Hãy cho bạn bè, người thân và một nửa của bạn biết bạn yêu thương họ đến thế nào. Một tin nhắn, một e-mail chẳng làm mất của bạn bao nhiêu thời gian nhưng lại đem cho chúng ta một tình yêu vô hạn..', CAST(0x0000A6CD00E10AF6 AS DateTime), CAST(0x0000A6CD0105271F AS DateTime), 0, 2, N'http://s.qplay.vn/770-0-0-0--1/download/Tin-nhan-chuc-tet-2014.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (241, N'http://s.qplay.vn/767-0-0-0--1/game/Nguoi-hung.html', 0, N'http://s.qplay.vn/images/product/icon/72300113-013023200114-090351.png', N'Người hùng', N'Một vùng đất chết, một vương quốc đang nguy kịch. Bạn có phải là người hùng muốn đến lên để khôi phuc lại vùng đất và vương quốc zola đó không?
Cách chơi :
- Chọn 1 trong 3 vị anh hùng
- Bầy mưu bố trận tấn công kẻ thù nguy hiểm
- Hệ thống skill + vũ khí đa dạng phong phú
Còn đợi gì nữa mau mau tải nào.', CAST(0x0000A6CD00E10AF8 AS DateTime), CAST(0x0000A6CD010527ED AS DateTime), 0, 2, N'http://s.qplay.vn/767-0-0-0--1/download/Nguoi-hung.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (242, N'http://s.qplay.vn/765-0-0-0--1/game/Dac-nhiem-toan-cau.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72180114-112419.png', N'Đặc nhiệm toàn cầu', N'Thế giới vẫn chưa bình yên, các lực lượng ly khai vẫn luôn nuôi tham vọng phá hoại và gây dựng thế lực. Nhưng đâu phải quốc gia nào cũng có thể bảo vệ chủ quyền và sinh mạng của dân thường bằng khả năng quân sự của mình. Vì thế “Lực lượng toàn cầu” - Global Operations (GO team), vào cuộc với những nhiệm vụ hết sức nguy hiểm trải dài từ châu Á sang châu Âu... những thành viên của GO team với điểm mạnh, điểm yếu riêng nhưng khi hợp sức sẽ tạo thành một lực lượng rất mạnh, cộng với trang thiết bị hiện đại đủ sức đối đầu với bất cứ thế lực xấu nào.
Global Operations thật sự cuốn hút người chơi ngay từ khâu chọn vũ khí bắt đầu nhiệm vụ mới. Vũ khí, quân trang rất thật và đa dạng với hơn 15 loại, từ AK47 quen thuộc cho đến súng ngắm AWP. Với các khoản tiền thưởng, người chơi có thể chọn cho mình những vũ khí tối tân hơn và tất nhiên hoàn thành nhiệm vụ nhanh hơn. 
Mỗi nhiệm vụ đều có một khoảng thời gian quy định, ở chế độ dễ (easy) hay bình thường (normal) thì khá dễ nhưng khi chơi ở mức khó (hard) thì địch bắn cực kỳ ghê gớm và việc hoàn thành nhiệm vụ đúng thời gian không hề dễ chút nào.
Nhiệm vụ trong game cũng khá đa dạng, khi giải cứu con tin, lúc lại phá hủy mục tiêu, gỡ bom hoặc tiêu diệt thủ lĩnh đối phương. 
Nào! Hãy vào vai các anh lính trong GO team để hành động, để trải nghiệm cảm giác anh hùng đặc nhiệm tham gia cứu thế giới!', CAST(0x0000A6CD00E10AFA AS DateTime), CAST(0x0000A6CD010528A1 AS DateTime), 0, 2, N'http://s.qplay.vn/765-0-0-0--1/download/Dac-nhiem-toan-cau.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (243, N'http://s.qplay.vn/759-0-0-0--1/game/Canh-sat-hoang-gia.html', 0, N'http://s.qplay.vn/images/product/icon/72240413-011456150114-092801.png', N'Cảnh sát hoàng gia', N'Luôn luôn bảo vệ dân chúng và hoàng gia,chống bạo loạn trên toàn lãnh thổ.Tác chiến khắp mọi nơi, tạo cho lực lượng bảo vệ chiến thắng nhanh chóng, đối phó được với các thách thức hiện nay; luôn sẵn sàng thực hiện nhiệm vụ tiếp theo; làm việc trong lực lượng lượng quốc phòng để gánh vác các nhiệm vụ chung khác."Điều này hỗ trợ cho mục đích của Bộ Quốc Phòng Quốc Tế "đảm bảo an ninh và bảo vệ Vương quốc và các vùng lãnh thổ thuộc sở hữu, bao gồm cả việc chống lại sự khủng bố; hỗ trợ cho chính sách đối ngoại của cả quốc gia để thực hiện mục đích thúc đẩy hoà bình và an ninh quốc tế.
Khi tham gia tấn công luôn tiên phong hàng đầu,không lo sợ trước bất kể thế lực thù địch nào.Sẵn sàng hy sinh vì nhiệm vụ của mình.Với tác phong nhanh nhạy và với kỹ năng nghiệp vụ cao,cảnh sát hoàng gia luôn là mối đe dọa cho toàn bộ quân địch phản loạn trong và ngoài quốc gia.', CAST(0x0000A6CD00E10B8A AS DateTime), CAST(0x0000A6CD01052947 AS DateTime), 0, 2, N'http://s.qplay.vn/759-0-0-0--1/download/Canh-sat-hoang-gia.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (244, N'http://s.qplay.vn/757-0-0-0--1/game/Dua-xe-quang-xich.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed130114-040154.png', N'Đua xe quăng xích', N'Đua xe quăng xích là trò chơi hãi hùng nhất từ trước tới nay.Tốc độ cao đến quay cuồng,cả thế giới như đang đổ dồn mọi con mắt vào ta.Xe đi tới đâu,khói chưa kịp bay đến đó.Được sự tài trợ phía bên Thổ,siêu xe ra đời,khói xe mịt mù như đêm đen,tiếng bô kêu như tiếng đại bác bắn ngoài đồng,bánh xe lăn nhanh trên đường chỉ còn lại vệt sáng.Thần kinh của bạn có tốt đến đâu,hãy tham gia và thử nghiệm,bạn sẽ biết được bản lĩnh tay đua siêu hạng thế nào.', CAST(0x0000A6CD00E10B8D AS DateTime), CAST(0x0000A6CD01052A08 AS DateTime), 0, 2, N'http://s.qplay.vn/757-0-0-0--1/download/Dua-xe-quang-xich.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (245, N'http://s.qplay.vn/753-0-0-0--1/game/Ngoc-rong-dai-chien.html', 0, N'http://s.qplay.vn/images/product/icon/icon130114-103301.png', N'Ngọc rồng đại chiến', N'Người chơi game Đại Chiến Ngọc Rồng sẽ được hóa thân vào nhân vật Son Go ku để chiến đấu một mất một còn với các đại ma đầu như Picollo, Frieza, Cell để bảo vệ trái đất. Trên cuộc hành trình đi tiêu diệt những đại ma đầu đó, cậu bé gặp phải rất nhiều các vật cản cũng như những tên tay sai và phải chiến đấu với chúng để tìm ra nơi ẩn nấp của các đại ma đầu.
Nào hãy nhanh chóng tham gia Đại Chiến Ngọc rồng để bắt đầu chiến đấu!!!
Chúc các bạn chơi game vui vẻ!', CAST(0x0000A6CD00E10B8E AS DateTime), CAST(0x0000A6CD01052ADF AS DateTime), 0, 2, N'http://s.qplay.vn/753-0-0-0--1/download/Ngoc-rong-dai-chien.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (246, N'http://s.qplay.vn/748-0-0-0--1/game/De-che.html', 0, N'http://s.qplay.vn/images/product/icon/72120413-015436110114-095107.png', N'Đế chế', N'Đến với Con đường chết là bạn đang đến với một thế loại trò chơi hoàn toàn mới, với nội dung về tiêu diệt thây ma nhưng cách chơi hoàn toàn khác khiến bạn sẽ nhiều cảm giác bất ngờ và những phút thư giãn lý thú', CAST(0x0000A6CD00E10B90 AS DateTime), CAST(0x0000A6CD01052B8C AS DateTime), 0, 2, N'http://s.qplay.vn/748-0-0-0--1/download/De-che.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (247, N'http://s.qplay.vn/746-0-0-0--1/game/Noi-so-hai.html', 0, N'http://s.qplay.vn/images/product/icon/72170413-013224110114-093952.png', N'Nỗi sợ hãi', N'Nỗi sợ hãi nói về cuộc sống sau thảm họa dịch bệnh thây ma, về một nhóm nhỏ những người sống sót sau sự bùng nổ của đại dịch.Câu truyện của chúng ta là hoàn cảnh bị chúng bám theo trên đường, những người sống sót cố sức tìm một nơi trú thân mới, chạy trốn những thây ma ăn thịt sống.Hành động chủ đạo là đá đít các thây ma trên đường nhảy vào xe.Hãy cẩn thận đừng để chúng bám quá lâu mà bạn sẽ phải hối hận. Khi tình hình ngày càng trở nên hiểm nghèo, sự tuyệt vọng của nhóm người này đã đẩy họ đến bờ vực của sự mất trí. Dù đi đến đâu, họ cũng phải đối mặt với nỗi kinh hãi từ những thây ma, sự mất đoàn kết, cũng như sự đối địch của số nhỏ những người còn sống rải rác ở nơi khác chỉ quan tâm đến sự sống còn của riêng mình, khi mà trật tự xã hội trên toàn cầu đã sụp đổ,hãy cố chạy thật nhanh để có thể thoát thân đến 1 nơi nào đó treo cổ tự vẫn.............', CAST(0x0000A6CD00E10B91 AS DateTime), CAST(0x0000A6CD01052C3F AS DateTime), 0, 2, N'http://s.qplay.vn/746-0-0-0--1/download/Noi-so-hai.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (248, N'http://s.qplay.vn/742-0-0-0--1/game/Alien-Shooter.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed100114-100337.png', N'Alien Shooter', N'" Với vũ khí tuyệt vời, không ngừng hành động , đồ họa tuyệt vời , âm nhạc hấp dẫn và thiết lập một cuộc phiêu lưu Kỳ thú, Alien Shooter là một trò chơi mang đến nguồn cảm hứng bất tận . "
Huyền thoại PC Alien Shooter bây giờ đã có trên thiết bị Android của bạn!Hãy bật điện thoại tải về ngay nào!
Trong các văn phòng,kho chứa,viên nghiên cứu đều rất nhiều xác chết,những sinh vật kinh tởm đang tấn công con người,hàng triệu triệu người đang bị ngã xuống,còn bạn thì sao?Có dám đứng lên để chống lại chúng ko?
- Hoàn thành 10 nhiệm vụ và tìm hiểu về nguồn gốc của lũ quái vật!
-Có nhiều hệ thống tự động để hỗ trợ người chơi!
- Có những lúc sẽ xuất hiện rất nhiều quái vật xông ra tấn công!
- Mức độ sẽ càng ngày càng khó hơn cho chúng ta!
Cuộc xâm lược ngoài hành tinh đã bắt đầu, chúng ta có một cơ hội , và đó là để ngăn chặn chúng lạnh trong khu vực đang nhốt chúng. Không cho phép chúng thoát khỏi cơ sở này, bạn là hy vọng cuối cùng của chúng tôi . Số phận của nhân loại bây giờ phụ thuộc vào bạn ! Tiêu diệt hết bọn chúng và hãy sống sót đi ra.', CAST(0x0000A6CD00E10B96 AS DateTime), CAST(0x0000A6CD01052D11 AS DateTime), 0, 2, N'http://s.qplay.vn/742-0-0-0--1/download/Alien-Shooter.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (249, N'http://s.qplay.vn/738-0-0-0--1/game/Dua-xe-tang-ban-sung.html', 0, N'http://s.qplay.vn/images/product/icon/21090114-105459.png', N'Đua xe tăng bắn súng', N'Trong đại chiến thế giới thứ nhất và thứ 2 , có một số thứ có thể khiến các binh lính không lạnh mà run.Đầu tiên phải nhắc tới , đó là bom nguyên tử , thứ vũ khí với sát thương khó có thể tưởng tượng ra.Sau đó , là phi cơ , máy bay và xe tăng. Máy bay , là một pháo đầu trên không còn xe tăng lại là pháo đài gần như bất khả xâm phạm.Với lớp vỏ ngoài có thể chống lại hầu hết đạn của quân lính , hỏa lực thì không cần phải nói , súng máy , đạn pháo,có thể nói xe tăng gần như là một con quái vật trên chiến trường.Với game Tăng đại chiến của chúng tôi , các bạn sẽ được trải nghiệm cảm giác điều khiển một chiếc xe tăng - quái vật trên chiến trường.
Cách chơi:
- Tấn công bắn kẻ thủ trên chiến trường
- Đồ họa 3D cực đẹp', CAST(0x0000A6CD00E10B97 AS DateTime), CAST(0x0000A6CD01052DCD AS DateTime), 0, 2, N'http://s.qplay.vn/738-0-0-0--1/download/Dua-xe-tang-ban-sung.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (250, N'http://s.qplay.vn/734-0-0-0--1/game/Zombies-tro-lai.html', 0, N'http://s.qplay.vn/images/product/icon/72021112-013414080114-090606.png', N'Zombies trở lại', N'Khi sự sống trên trái đất chỉ còn là những dịch bệnh, những con virus kì lạ và sự tồn tại duy nhất chỉ là những thây ma. Ở 1 nơi nào đó trên trái đất vẫn còn những con người không mắc phải dịch bệnh và họ ra sức chiến đấu chống lại những đội quân thây ma hùng hậu nhất. Thủ lĩnh và người dẫn dắt họ là Tom, một người luôn ngậm một tẩu thuốc và trên tay là khẩu súng đi khắp nơi để tiêu diệt và mang sự sống trở lại cho trái đất.', CAST(0x0000A6CD00E10B9A AS DateTime), CAST(0x0000A6CD01052E8C AS DateTime), 0, 2, N'http://s.qplay.vn/734-0-0-0--1/download/Zombies-tro-lai.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (251, N'http://s.qplay.vn/732-0-0-0--1/game/Chien-Than-Tam-Quoc.html', 0, N'http://s.qplay.vn/images/product/icon/72-a141112-030710080114-085650.png', N'Chiến Thần Tam Quốc', N'Chào mừng bạn đã đên với vương quốc Tóc xù, nơi đây luôn có những điều lạ kỳ, những chú đom đóm luôn luôn phát sáng không chỉ ban đêm còn ban ngày, tại một vương quốc đen huyền bí, nơi mà Dơi ác chủ đứng đầu luôn luôn có lòng tham muốn bắt những chú đom đóm mục của đích chúng là không muốn chúng thắp sáng cho đất nước thần tiên. Kế hoạch đã lập ra đó là "Truy bắt đom đóm".', CAST(0x0000A6CD00E10B9C AS DateTime), CAST(0x0000A6CD01052F56 AS DateTime), 0, 2, N'http://s.qplay.vn/732-0-0-0--1/download/Chien-Than-Tam-Quoc.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (252, N'http://s.qplay.vn/730-0-0-0--1/game/Thay-ma-huy-diet.html', 0, N'http://s.qplay.vn/images/product/icon/72041212-082731080114-085208.png', N'Thây ma hủy diệt', N'Khi bóng tối xâm chiếm trái đất, và tất cả mọi người đang chím trong những giấc mơ đẹp tuyệt vời, Lũ Zombies xuất hiện! Từng bước, từng đêm, bọn chúng đang lên kế hoạch đen tối xâm chiếm. Thế giới có thể biến thành bãi tha ma Zombieland, nhưng Bomberman đã xuất hiện để chiến đấu với lũ quái vật này!', CAST(0x0000A6CD00E10B9D AS DateTime), CAST(0x0000A6CD01053092 AS DateTime), 0, 2, N'http://s.qplay.vn/730-0-0-0--1/download/Thay-ma-huy-diet.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (253, N'http://s.qplay.vn/726-0-0-0--1/ung-dung/Be-yeu-hoc-bai.html', 0, N'http://s.qplay.vn/images/product/icon/icon100113-114428060114-095954.png', N'Bé yêu học bài', N'Ứng dụng Bé yêu học bài là ứng dụng mang giáo dục và giải trí cho trẻ em độ tuổi từ 3 đến 6. Ứng dụng được phát triển thành nhiều phiên bản, mỗi phiên bản là 1 chủ đề hấp dẫn để bé vừa học vừa chơi. Ưng dụng rất tốt cho trẻ em trong việc phát triển tư duy thông qua việc ghép tranh, nhận biết con vật và học tiếng anh bằng cách đọc tên các con vật.', CAST(0x0000A6CD00E10C2A AS DateTime), CAST(0x0000A6CD010531B1 AS DateTime), 0, 2, N'http://s.qplay.vn/726-0-0-0--1/download/Be-yeu-hoc-bai.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (254, N'http://s.qplay.vn/724-0-0-0--1/ung-dung/Chup-anh-voi-nguoi-noi-tieng.html', 0, N'http://s.qplay.vn/images/product/icon/ca9e5b4c8946273d6ab2chup-anh-voi-ng-noi-tieng060114-095558.png', N'Chụp ảnh với người nổi tiếng', N'PhotoFunia - Chụp Ảnh Với Người Nổi Tiếng Game được rất nhiều bạn trẻ yêu thích đã được phát triển với giao diện tiếng việt hoàn toàn mới. Hơn 100 hiệu ứng để người dùng lựa chọn khuôn mặt họ sẽ xuất hiện bên cạnh người nổi tiếng, những ngôi sao hàng đầu, hoặc có thể xuất hiện trên tạp chí nổi tiếng, các tấm áp phích, biển hiệu quảng cáo, trên cốc hay làm cướp biển. Hãy cùng thỏa sức chụp những bức ảnh ngộ ngĩnh để chia sẻ với bạn bè trên Facebook, Gmail, Yahoo nhé!', CAST(0x0000A6CD00E10C2C AS DateTime), CAST(0x0000A6CD01053280 AS DateTime), 0, 2, N'http://s.qplay.vn/724-0-0-0--1/download/Chup-anh-voi-nguoi-noi-tieng.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (255, N'http://s.qplay.vn/722-0-0-0--1/game/Luu-dan-vo-tinh.html', 0, N'http://s.qplay.vn/images/product/icon/72x72-b (1)191012-020843060114-095125.png', N'Lựu đạn vô tình', N'Trong vai trò là một người lính tinh nhuệ thuộc binh chủng đặc biệt của quân đội, bạn hãy tìm và tiêu diệt những tên tử tù đang cố gắng vượt biên giới. Những tên tử tù tỏ ra rất ngoan cố không kém phần lưu manh. Chúng thường trốn trong những nơi tăm tối và vô cùng kín đáo. Số lượng vũ khí của bạn vô cùng có hạn buộc bạn không được có bất kì một sai lầm nào bởi dù chỉ một sơ hở những tên tử tù kia sẽ trốn thoát.', CAST(0x0000A6CD00E10C2D AS DateTime), CAST(0x0000A6CD01053357 AS DateTime), 0, 2, N'http://s.qplay.vn/722-0-0-0--1/download/Luu-dan-vo-tinh.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (256, N'http://s.qplay.vn/718-0-0-0--1/game/Chem-hoa-qua-2.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed040114-094409.png', N'Chém hoa quả 2', N'"Nghe xuân sang thấy trong lòng xốn xang..."
Nghe câu hát này lòng ta lại thấy nôn nao , không khí tết đang tràn về trên từng ngõ phố , từng con đường.
Ngày xuân Long Phụng sum vầy
Ngũ quả ngày tết , vui vầy bên nhau
Vâng , nói đến không khí tết thì lại không thể không nhắc tới bánh chưng bánh dầy , cây nêu , mâm ngũ quả.
Game : " Ngũ quả ngày tết " mang đến cho bạn không khí tết thật chân thật và mãnh liệt.
Cách chơi : - Chém những trái cây trong mâm ngũ quả để chào đón xuân về!', CAST(0x0000A6CD00E10C2F AS DateTime), CAST(0x0000A6CD01053418 AS DateTime), 0, 2, N'http://s.qplay.vn/718-0-0-0--1/download/Chem-hoa-qua-2.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (257, N'http://s.qplay.vn/716-0-0-0--1/game/Ban-doi.html', 0, N'http://s.qplay.vn/images/product/icon/72090413-025140040114-093152.png', N'Bắn dơi', N'Chào mừng bạn đã đên với vương quốc Tóc xù, nơi đây luôn có những điều lạ kỳ, những chú đom đóm luôn luôn phát sáng không chỉ ban đêm còn ban ngày, tại một vương quốc đen huyền bí, nơi mà Dơi ác chủ đứng đầu luôn luôn có lòng tham muốn bắt những chú đom đóm mục của đích chúng là không muốn chúng thắp sáng cho đất nước thần tiên. Kế hoạch đã lập ra đó là "Truy bắt đom đóm".', CAST(0x0000A6CD00E10C30 AS DateTime), CAST(0x0000A6CD010534EA AS DateTime), 0, 2, N'http://s.qplay.vn/716-0-0-0--1/download/Ban-doi.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (258, N'http://s.qplay.vn/714-0-0-0--1/game/Phi-doi-than-long.html', 0, N'http://s.qplay.vn/images/product/icon/12121112-020237030114-095528.png', N'Phi đội thần long', N'Đất nước Qpaly dưới sự thống trị của tổng thống Mr.D đang dần phát triển và giàu có hơn rất nhiều. Chính vì lý do đó mà đất nước màu mỡ này thường xuyên là "điểm ngắm" của các tổ chức tội phạm nguy hiểm. Chúng nổi dậy tự phát, cướp bóc và sát hại những người dân hồn hậu chất phát của đất nước này.', CAST(0x0000A6CD00E10C32 AS DateTime), CAST(0x0000A6CD0105359B AS DateTime), 0, 2, N'http://s.qplay.vn/714-0-0-0--1/download/Phi-doi-than-long.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (259, N'http://s.qplay.vn/712-0-0-0--1/game/Mat-lenh-rong-vang.html', 0, N'http://s.qplay.vn/images/product/icon/72091112-013109030114-095201.png', N'Mật lênh rồng vàng', N'Kế tiếp phiên bản tiền nhiệm - Mật lệnh rồng thiêng. Phiên bản 2 của tựa game này ra đời mục đích update, chỉnh sửa và bổ sung nhiều hơn các tính năng trong game.
Nhiệm vụ của bạn vẫn là chiến đấu chống lại quái vật và lũ ma quỉ vô hình nhưng giờ đây chúng đã trở nên nguy hiểm - thông minh hơn rất nhiều.', CAST(0x0000A6CD00E10C33 AS DateTime), CAST(0x0000A6CD0105366A AS DateTime), 0, 2, N'http://s.qplay.vn/712-0-0-0--1/download/Mat-lenh-rong-vang.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (260, N'http://s.qplay.vn/710-0-0-0--1/game/Quai-vat-ngoai-hanh-tinh.html', 0, N'http://s.qplay.vn/images/product/icon/72161112-023048030114-094730.png', N'Quái vật ngoài hành tinh', N'Vào những năm sau thảm họa thiên thạch cuối năm 2012 , con người đã phát triển lại thế giới hưng thịnh còn hơn thời điểm trước đó. Cùng với sự tiến bộ của xã hội , thì những loài động vật cũng tiến hóa theo thời gian. Một số loài thì dị biến do thừa hưởng huyết mạch từ thời thượng cổ , do đó rất nhiều loại quái vật lần lượt xuất hiện và trở thành nỗi kinh hoàng của nhân loại.', CAST(0x0000A6CD00E10C35 AS DateTime), CAST(0x0000A6CD01053751 AS DateTime), 0, 2, N'http://s.qplay.vn/710-0-0-0--1/download/Quai-vat-ngoai-hanh-tinh.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (261, N'http://s.qplay.vn/708-0-0-0--1/game/Rush-ninja.html', 0, N'http://s.qplay.vn/images/product/icon/72071212-111422030114-094249.png', N'Rush ninja', N'Truyền thuyết kể rằng, thời xa xưa, khi mà thế lực đen tối bành trướng thế giới. Tận cùng tuyệt vọng, có một vị ninja đã một mình đứng lên chống lại. Với khả năng phi thường của mình, anh ta đã đẩy lùi thế lực đen tối, đem lại hòa bình cho thế giới.', CAST(0x0000A6CD00E10C36 AS DateTime), CAST(0x0000A6CD01053821 AS DateTime), 0, 2, N'http://s.qplay.vn/708-0-0-0--1/download/Rush-ninja.html', 0)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (262, N'http://s.qplay.vn/703-0-0-0--1/game/Dau-an-rong-thieng.html', 0, N'http://s.qplay.vn/images/product/icon/72180513-091447020114-103242.png', N'Dấu ấn rồng thiêng', N'7 viên ngọc rồng là câu chuyện kể về nhân vật SonGoKu và những viên ngọc thần. Ra đời năm 1984 đến năm 1995 cậu bé này đã trải qua những cuộc hành trình tiêu diệt cái ác cùng với những người bạn chung chí hướng. Không chỉ tại Việt Nam mà khắp nơi thế giới đều biết đến nhân vật này chính vì thế năm 2008 hãng Century Fox đã bắt tay sản xuất bộ phim hoạt hình cùng tên. 
Chúng ta chắc chắn đều nhớ đến nhân vật Goku với cái đuôi khỉ bên cạnh đó là Quy lão Kame, quay ngược thời gian, chúng ta hãy cùng đến thời thơ ấu của chú khỉ con này và cùng tham gia những buổi tập võ của Quy lão dành cho chú ta nhé.
Cách chơi:
-Chú Goku của chúng ta sẽ cầm những đồ vật mà Quy lão yêu cầu, và vượt qua các chướng ngại vật
-Khéo léo đưa chú ta đi một cách nhanh chóng, độ khó sẽ tăng dần đều theo từng màn
-Ngoài việc di chuyển có ánh sáng, chú ta sẽ phải di chuyển trong bóng tối nên bạn cần phải tinh nhạy để phán đoán vật cản đằng trước.
Hơn 50 màn chơi với các mức độ khác nhau bạn hãy khám phá và tập luyện cùng chú khỉ con này nhé.', CAST(0x0000A6CD00E10C38 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/703-0-0-0--1/download/Dau-an-rong-thieng.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (263, N'http://s.qplay.vn/699-0-0-0--1/game/Khong-kich-2014.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed311012-024158020114-093249.png', N'Không kích 2014', N'Chắc hẳn các bạn không thể thấy lạ lẫm khi nghe đến trận đánh " Điện Biên Phủ Trên Không" phải không nào ?
Chúng tôi vô cùng hãnh diện vì đã có thể ra mắt các bạn một siêu phẩm game mô tả lại trận không chiến anh hùng đó mang tên - "ĐIỆN BIÊN PHỦ TRÊN KHÔNG"
- Vào vai là 1 người lính không quân, bạn hãy điều khiển chiếc máy bay chiến đấu, tiêu diệt máy bay địch đang ra sức ném bom phá hủy căn cứ quân sự của ta đồng thời bảo vệ những chiếc máy bay chở lính và trang bị tiếp tế cho quân đội ta.
- Game với đồ họa đẹp mắt.
- Cách chơi đơn giản với nhiều chế độ chơi. Đặc biệt bạn có thể mở khóa các item - máy bay - vật phẩm bằng chính số điểm mà bạn có được trong game.
Bạn sẽ cảm thấy gần gũi và quen thuộc với âm thanh trong game.Với những bản anh hùng ca bất diệt của dân tộc Việt Nam
Nào !!! Hãy cùng cất cánh !!', CAST(0x0000A6CD00E10CEA AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/699-0-0-0--1/download/Khong-kich-2014.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (264, N'http://s.qplay.vn/697-0-0-0--1/game/Nguoi-trong-giang-ho.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72311213-095708.png', N'Người trong giang hồ', N'Thế giới ngầm , xã hội đen luôn luôn là điều kỳ bí và tò mò với rất nhiều người
Trên thế giới tồn tại khá nhiều băng nhóm xã hội đen lớn và nguy hiểm như Yakuza của Nhật , Triad ( Tam Hoàng ) của Trung Quốc , v.v.v
Các băng nhóm tham gia vào đủ mọi các lĩnh vực tài chính , bảo kê sòng bạc , nhà hàng , cho tới công sở . Đây là vấn nạn nhức nhối của rất nhiều nước đến nay vẫn chưa thể dẹp yên .
Game kể về hành trình của thanh niên hoàn lương Hùng Đại Hổ thâm nhập , tiêu diệt các băng nhóm xã hội đen nổi tiếng nhằm mua lại tự do cho bản thân và góp phần mang tới hòa bình cho xã hội .
Cách chơi :
-Sử dụng các button di chuyển trực quan trên màn hình
-Chạm vào màn hình để ra đòn tiêu diệt đối thủ .
-Số vàng thu thập được sẽ sử dụng để mua các vật phẩm cần thiết hỗ trợ Hổ trong quá trình HÀNH TẨU GIANG HỒ của mình , số Dollar thu thập được sẽ giúp Hổ chiêu mộ được những đàn em đắc lực trên đường đi . Giúp Hổ tránh được những cuộc đụng độ với số lượng lớn cùng dao kiếm , mã tấu .       
Hãy cùng khám phá thế giới ngầm của NGƯỜI TRONG GIANG HỒ bạn nhé !', CAST(0x0000A6CD00E10CED AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/697-0-0-0--1/download/Nguoi-trong-giang-ho.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (265, N'http://s.qplay.vn/695-0-0-0--1/game/Chien-binh-tham-lang.html', 0, N'http://s.qplay.vn/images/product/icon/72 (1)160513-014207311213-035742.png', N'Chiến binh thầm lặng', N'Chiến binh thầm lặng,những người hùng ẩn mình sau những chiếc mặt lạ,luôn âm thầm bảo vệ mọi người.Những tên du côn đến từ hành tinh sao hỏa đã bắt cóc người yêu 1 trong những vị anh hùng đó,chúng muốn điều khiển và ngăn những anh hùng cản trở việc của chúng.Những người anh hùng đã xông đến hành tinh sao hỏa để cướp lại người yêu cho mình.Với sức mạnh vô địch mang trong người chỉ thua mấy con Boss,các anh hùng của chúng ta đã tấn công gây hoảng loạn trong lòng địch.Đánh những tên lâu la chết như rơm rác.Chỉ trùn bước khi gặp Boss.Sự trợ giúp sẽ không vô nghĩa khi các bạn cùng tham gia và khám phá trò chơi...............', CAST(0x0000A6CD00E10CEF AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/695-0-0-0--1/download/Chien-binh-tham-lang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (266, N'http://s.qplay.vn/692-0-0-0--1/game/Tay-dua-de-vuong.html', 0, N'http://s.qplay.vn/images/product/icon/icon261212-104018311213-100447.png', N'Tay đua đế vương', N'Các bạn ham mê tốc độ và bạo lực,hãy tham gia vào cuộc đua của những kẻ nổi loạn này.Chắc hẳn các bạn đã quá quen với bộ phim nổi tiếng hành động mỹ,những pha đuổi bắt trên đường cao tốc,những cảnh bắn nhau tóe lửa.
Game là sự mô phỏng của bộ phim Death race.Khi các tử tù vào đây sẽ phải tham gia vào cuộc đua khốc liệt,mà người đứng đầu 5 vòng đua sẽ được thoát khỏi địa ngục đó.
Tay đua đế vương là sự tập hợp của những tên tội phạm hàng đầu thế giới,nhưng pha bứt tốc,gài bom và bắn tên lửa sẽ giúp bạn giữ được vị trí hoặc đảo ngược vị trí.
Hãy thật cẩn thận nếu không xe của bạn sẽ bị đối phương phá hỏng,chỉ cần chậm 1 bước là bạn đã có thể bị bỏ rất xa.Hãy tham gia vào cuộc đua nào.........', CAST(0x0000A6CD00E10CF0 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/692-0-0-0--1/download/Tay-dua-de-vuong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (267, N'http://s.qplay.vn/690-0-0-0--1/game/Doraemon-va-bao-boi-than-ki.html', 0, N'http://s.qplay.vn/images/product/icon/72070313-034419301213-011504.png', N'Doraemon và bảo bối thần kì', N'Xin chào các bạn Việt Nam thân yêu, tớ là Doremon chú mèo máy thông minh. Được sinh ra từ cuốn tranh nổi tiếng cùng tên, từ năm 1969 đến nay tớ đã đồng hành khắp nơi cùng với tất cả các bạn, không chỉ thiếu nhi mà còn cả những anh chị, cô chú, các bác .... Trong chuyến phưu lưu lần này tớ và những người bạn Nobita, Chaien, Xuka, Xeko.. đã đến một hòn đảo xinh đẹp để truy tìm những bảo bối và kho báu thần kỳ. Các bạn có sẵn lòng tham gia cùng bọn tớ không?
Cách chơi
-Nhìn đơn giản nhưng rất khó khăn đó. Hãy cùng tớ lênh đênh trên chiếc thuyền và khám phá kho báu tại biển sau.
-Hãy thả sợi đây một cách từ từ cho đến khi tới đáy đại dương, các bạn có thể bấm liên tục để thả sợi câu nhanh hơn. 
-Nghiêng máy để kéo sợi dây câu và thu thập tất cả những bí ẩn sâu trong lòng đại dương.
-Hãy dùng tiền và xu vàng kiếm được để nâng cấp tất cả những dụng cụ hỗ trợ trong chuyến phưu lưu lần này.
-Sau mỗi một lần khám phá đại dương các bạn sẽ thu nhập về những điều kỳ diệu đó.
Nào sẵn sàng lên đường cùng chúng tớ ngay nhé!!', CAST(0x0000A6CD00E10CF2 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/690-0-0-0--1/download/Doraemon-va-bao-boi-than-ki.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (268, N'http://s.qplay.vn/688-0-0-0--1/game/Manh-long-qua-giang.html', 0, N'http://s.qplay.vn/images/product/icon/Alpha_Acrocanthosaurus_shooting_a_blast_of_fire121012-112504281213-100126.png', N'Mãnh long quá giang', N'Câu chuyện của anh hùng của chúng tôi bắt đầu trong một ngôi làng nhỏ yên bình, xa nền văn minh.Ở đó,có 1 người trẻ tuổi thật thà và đầy nhiệt huyết tìm đến,anh tới để xin được nghiên cứu dưới sự giám hộ của một cụ già cao tuổi, một bậc thầy Kungfu,Qua thời gian,anh đã đạt được kỹ năng trong nghệ thuật cổ xưa của kungfu.
Đường Long, một thanh niên Hồng Kông đi khắp nơi để học kungfu,theo lời giới thiệu của một người chú tới ngôi làng mà ở đó có 1 người là cao thủ kungfu đang quy ẩn.Anh đã đến đây học tập được rất nhiều kỹ năng.
Sau đó một tháng,đột nhiên có 1 toán người đến ám sát sư phụ của mình,đường long đã rất đau lòng và đi điều tra nguyên nhân.Sau đó mới biết do bọn chúng tới để trả thù vì ông đã ra tay can thiệp vào vụ làm ăn phi pháp của chúng.
Dằn vặt, và thù hận kèm theo nỗi bất bình vì hành động bỉ ổi của chúng, anh hùng của chúng ta kêu lên trời với một lời hứa,anh sẽ trả thù cho sư phụ của mình.Anh thề với trời đất chấp nhận một gánh nặng của trách nhiệm, giữ làng an toàn và tiêu diệt hết kẻ bất lương.Trò chơi của chúng tôi bắt đầu từ đây...', CAST(0x0000A6CD00E10CF4 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/688-0-0-0--1/download/Manh-long-qua-giang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (269, N'http://s.qplay.vn/686-0-0-0--1/game/The-Walking-Dead-2014.html', 0, N'http://s.qplay.vn/images/product/icon/Alpha_Acrocanthosaurus_shooting_a_blast_of_fire121012-112504281213-094837.png', N'The Walking Dead 2014', N'Trải nghiệm cảm giác làm thiên thần cũng như ác quỷ nào nhé !
Vào năm 2020, T virus lây lan trên toàn thế giới. Một số lượng lớn người bị nhiễm với virus T và trở thành zombie. Bạn là một trong những người sống sót. Bạn đang tham gia trong cuộc chiến chống lại zombie.Bạn đã sẵn sàng chiến đấu chưa ???
Cách chơi + tính năng:
- Di chuyển xác định mục tiêu bán thật chuẩn 
- Tiêu diệt kẻ thù bằng súng + bom 
- Thưởng thức âm nhạc gây sốc và hiệu ứng âm thanh!
- Trải nghiệm cảm giác dữ dội cùng với các loại súng trên tay
- Giết và tiêu diệt các loại zombies khác nhau!
- Vũ khí mới và nâng cấp hệ thống!
- Thách thức với các nhiệm vụ cực kì nguy hiểm!
 - Những phần thưởng điểm mới và độc đáo!', CAST(0x0000A6CD00E10CF5 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/686-0-0-0--1/download/The-Walking-Dead-2014.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (270, N'http://s.qplay.vn/683-0-0-0--1/game/Ninja-cuu-me.html', 0, N'http://s.qplay.vn/images/product/icon/ninja cuu me (72)061012-100650281213-093431.png', N'Ninja cứu mẹ', N'Sâu trong rừng trúc có một ngôi làng mang huyền thoại ẩn chứa những ninja siêu hạng mà người ta tưởng chừng họ không còn nữa. Những ninja được truyền đời này sang đời khác, với những bí kíp siêu hạng, những thanh kiếm, phi tiêu lừng lẫy một thời. Tuy nhiên ngôi làng ninja đang bị đa dọa bởi những kẻ muốn xâm chiếm và muốn có được những bảo bối ninja kia. Chúng đã bắt lấy vị nữ thủ lĩnh của ngôi làng, người duy nhất có đủ khả năng và tài đức để cứu vị nữ thủ lĩnh chỉ có thể là chính con trai của bà.
Cách chơi:
- Nhập vai vào chàng trai ninja trẻ tuổi bạn sẽ tham gia chiến đấu với những vũ khí siêu hạng.
- Khéo léo di chuyển vì trên đường đi bạn sẽ gặp rất nhiều khó khăn.
- Đồ họa đẹp và âm thanh hấp dẫn.
Nào ! Hãy hóa thân thành một siêu ninja để tham gia chiến đấu giải cứu thủ lĩnh ninja và ngôi làng nhé !', CAST(0x0000A6CD00E10CF7 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/683-0-0-0--1/download/Ninja-cuu-me.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (271, N'http://s.qplay.vn/681-0-0-0--1/game/Street-Fighter-2014.html', 0, N'http://s.qplay.vn/images/product/icon/72 (8)250912-092132271213-095512.png', N'Street Fighter 2014', N'16 năm kể từ Angela D, tay đấm bốc siêu hạng đăng quang trong giải vô địch thế giới. Giờ đây Angela D đã bước vào độ tuổi tứ tuần, góa vợ và sống cô đơn với nỗi tiếc nhớ về thời hoàng kim xa vắng. Thỉnh thoảng, vẫn có vài phóng viên tới phỏng vấn ông về thời ông còn làm mưa làm gió trên các sàn đấu. Cho đến một ngày nọ, khi Angela D được xem một trận đấu ảo trên TV với kết quả võ sĩ Bambi hạ gục nhà vô địch trẻ tuổi Lulu thì nỗi khát khao được trở lại sàn đấu lại bùng cháy. Mặc cho con trai và bạn bè can ngăn, Angela D vẫn quyết định xỏ găng thi đấu vài trận nhỏ trước khi tham gia vào trận đấu cuối cùng trong đời võ sĩ với nhà vô địch Bambi bằng xương bằng thịt. Không ai hiểu được cái cảm giác muốn được đứng trên sàn đấu của Angela D chứ không phải là cảm giác giành được chiến thắng…
Cách chơi:
- Mới lạ và độc đáo (đánh tự do, đánh theo nhiệm vụ, luyện tập)
- Hệ thống nhân vật rất đa dạng phong phú
- Những màn thi đấu siêu đẳng với các đối thủ nặng kí
- Đồ hoạ + âm thanh vô cùng hấp dẫn và đẹp mắt
Hãy cùng so găng với những trận đánh điên cuồng nhé.', CAST(0x0000A6CD00E10CF9 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/681-0-0-0--1/download/Street-Fighter-2014.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (272, N'http://s.qplay.vn/679-0-0-0--1/game/Khuc-cua-tu-than.html', 0, N'http://s.qplay.vn/images/product/icon/72 (8)250912-092132271213-095028.png', N'Khúc cua tử thần', N'Bạn cần tìm những trò chơi đua xe hấp dẫn cho thiết bị Android của mình? Vậy thì đừng bỏ lỡ tựa game mới nhất của chúng tôi - Khúc Cua Tử Thần.
Trò chơi thuộc hể loại đua xe dùng "thủ đoạn" để dành chiến thắng. Cách chơi hay bởi người chơi có thể bị đánh úp bất ngờ bằng những cú húc xe, chèn ép, hoặc bị cho "hít khói" bởi tuyệt chiêu tăng tốc bằng những “đồ chơi” tặng kèm trên đường đua. Đây là lý do khiến trò chơi đạt khá nhiều lượt download và lượt "like" trên facebook và các mạng xã hội khác. Ngoài ra, có rất nhiều dạng đua được khuyến mãi thêm trong trò chơi như đua: tính thời gian, người sống sót cuối cùng…
Game với hệ thống điều khiển đa dạng
Âm thanh trong game phong phú với những bản nhạc nổi tiếng và hoành tráng.
Hãy thử trải nghiệm', CAST(0x0000A6CD00E10CFA AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/679-0-0-0--1/download/Khuc-cua-tu-than.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (273, N'http://s.qplay.vn/677-0-0-0--1/game/Noi-hoa-qua.html', 0, N'http://s.qplay.vn/images/product/icon/72 (8)250912-092132271213-094655.png', N'Nối hoa quả', N'Thuộc thể loại game văn phòng, Cách chơi đơn giản bạn chỉ cần nối những trái cây cùng loại trong thời gian ngắn nhất và dành thật nhiều điểm số.
Game với đồ hoạ đẹp mắt, nhiều cửa chơi, với nhiều tính năng khác chắc chắn sẽ làm hài lòng cả những người chơi khó tính nhất.
Chúc bạn chơi vui!', CAST(0x0000A6CD00E10D8A AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/677-0-0-0--1/download/Noi-hoa-qua.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (274, N'http://s.qplay.vn/668-0-0-0--1/game/Ca-lon-ca-be.html', 0, N'http://s.qplay.vn/images/product/icon/icon--72-SHARK-game261012-040509261213-024910.png', N'Cá lớn cá bé', N'Nemo là một chú cá nhỏ ham chơi và nghich ngợm. Do ham vui mà chú ta đã đi quá xa nơi mà chú đang ở và gặp một sự cố bất ngờ, đó là bị cuốn đi đến một đại dương nơi có quá nhiều cá dữ và nguy hiểm. Nơi đây chú cá nhỏ này sẽ được học một bài học lớn nhất mà không ai có thể dạy cho chú đó chính là sự sinh tồn. Làm sao để sinh tồn để không bị các loài cá khác ăn thịt hoặc tấn công. Cách duy nhất đó là trước khi bị tấn công thì hãy tấn công lại. Dựa theo bộ phim hoạt hình nổi tiếng Truy tìm Nemo được cả thế giới ưa thích, vẫn là chú cá bé nhỏ đó, tuy nhiên cuộc phưu này chú ta sẽ phải du ngoạn một mình. Bạn hãy là trợ thủ đắc lực và đồng hành cùng chú cá Nemo nhé!
Cách chơi:
- Nghiêng và nghiêng, bạn hãy nghiêng mọi gọc độ mọi hướng trái phải để đưa chú cá đi đến những chú cá bé hơn, cố gắng ăn những chú cá đó để lớn dần và bạn có thể tấn công đến những chú cá hung dữ và to lớn hơn.
- Ăn những vật phẩm cần thiết sẽ giúp tránh được kẻ thù nguy hiểm, tuy nhiên có những vật bạn không nên ăn hoặc phải tránh xa chúng ra. Nếu không bạn sẽ rất khó khăn để di chuyển hoặc mất mạng chơi.
- Đồ họa đẹp, âm thanh ngộ nghĩnh 
Hi vọng bạn sẽ tham gia cuộc dạo chơi vui vẻ cùng với Nemo.', CAST(0x0000A6CD00E10D8C AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/668-0-0-0--1/download/Ca-lon-ca-be.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (275, N'http://s.qplay.vn/666-0-0-0--1/game/Ban-ca.html', 0, N'http://s.qplay.vn/images/product/icon/72120313-013409251213-021329.png', N'Bắn cá', N'Sâu thẳm dưới đại dương có muôn vàn sinh vật, từ cá hề cho đến những loài sinh vật mà ta chưa từng biết đến. Một ngư dân quyết định xuống dưới đó đánh bắt cá. Liệu anh ta có thành công? Hãy giúp người ngư dân này đánh bắt thành công nhé!!!
Cách chơi:
- Ấn vào màn hình để bắn lưới
- Thay đổi cấp độ của lưới từ 1 đến 7 (Mỗi cấp tương ứng với số tiền bỏ ra)
- Hệ thống sinh vật đa dạng, độ khó đánh bắt khác nhau
- Hệ thống tính cấp độ đa dạng', CAST(0x0000A6CD00E10D8D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/666-0-0-0--1/download/Ban-ca.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (276, N'http://s.qplay.vn/662-0-0-0--1/game/Ma-toc-do-2014.html', 0, N'http://s.qplay.vn/images/product/icon/icon131112-021045251213-090624.png', N'Ma tốc độ 2014', N'Nếu bạn nghĩ đây là một tựa game ăn theo bộ phim nổi tiếng : “ Ma tốc độ “ thì đó là một sai lầm lớn!
Câu chuyện bắt đầu từ một ngày kia ,  trên ngai vàng của đỉnh Olympia , thần Zeus cảm thấy thật tẻ nhạt vì việc ngày nào cũng quan sát loài người. Ông lập tức gọi hai người anh em của mình là thần của đại dương Poseidon và thần cai quản địa ngục Hades đến để  bàn bạc về việc tổ chức một cuộc đua dành cho loài người . Họ bàn bạc trong điện thần rất lâu. Sau đó Poseidon và Hades đi ra với bộ mặt mãn nguyện và vui vẻ!!
Kể từ đó , dưới trần gian diễn ra một cuộc đua tàn khốc , không khoan nhượng! Và phần thưởng là danh hiệu “ Ma tốc độ” cùng với quyền năng mà 3 vị thần tối cao trao cho!!
Các tay đua đều được sở hữu những chiếc mô-tô siêu hạng , thể hiện khả năng tốc độ của mình để đạt lấy danh hiệu “ Ma tốc độ “ !!
Cách chơi : 
- Chọn lấy chiếc xế “khủng” 
- Chinh phục đường đua và các đối thủ nặng kí cho danh hiệu “ Ma tốc độ” khác!!
- Giành lấy chiến thắng , vinh quang , danh hiệu và rất nhiều thứ khác
Còn chờ gì nữa , hãy sở hữu ngay tựa game đáng chơi này !!!', CAST(0x0000A6CD00E10D8E AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/662-0-0-0--1/download/Ma-toc-do-2014.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (277, N'http://s.qplay.vn/660-0-0-0--1/game/Tay-sung-mien-tay.html', 0, N'http://s.qplay.vn/images/product/icon/abc328d5dd21gun241213-040945.png', N'Tay súng miền tây', N'Bạn sẽ hóa thân vào một chàng Cao Bồi hoang dã với khẩu súng trong tay, chiến đấu chống lại kẻ ác đang hoành hành tại vùng hoang  mạc để giành lấy chính nghĩa. Game Tay súng miền Tây với phiên bản tiếng việt, có đầy đủ hướng dẫn chi tiết với 3 cấp độ chơi khác nhau: dễ - bình thường - khó phù hợp với khả năng của từng người chơi khiến bạn có cảm giác như đang được phiêu lưu và hành trình trên một vùng đất mới. Phiêu lưu mạo hiểm cùng game để cảm nhận cuộc sống miền tây hoang dã bạn nhé.', CAST(0x0000A6CD00E10D90 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/660-0-0-0--1/download/Tay-sung-mien-tay.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (278, N'http://s.qplay.vn/657-0-0-0--1/game/Ban-trung-khung-long.html', 0, N'http://s.qplay.vn/images/product/icon/2140113-035012241213-034647.png', N'Bắn trứng khủng long', N'Bắn Trứng Khủng Long – Một trò chơi nổi tiếng đã xuất hiện trên Android.
Tựa game đầy màu sắc, tốc độ & đòi hỏi kỹ năng phản ứng nhanh của bạn. Cách chơi game rất đơn giản, bạn chỉ cần bắn ít nhất 3 quả trứng cùng màu để được ăn điểm. Chắc chắn bạn sẽ luôn thấy trò chơi hấp dẫn và ngày càng cuốn hút vì cấp độ ngày càng gay cấn. Hãy cố gắng ăn điểm liên tiếp để đạt được combo trong các lần bắn. Bạn sẽ được bom có sức mạnh công phá rất lớn nếu đạt combo x 7. Wow, thật tuyệt phải không ? Tuy nhiên, bạn cũng sẽ bị làm phiền bởi chú chim bất thình lình xuất hiện thả thêm các màu trứng khác lên bản đồ. Hãy dùng sự linh hoạt phản ứng để tiêu diệt nó.', CAST(0x0000A6CD00E10D92 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/657-0-0-0--1/download/Ban-trung-khung-long.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (279, N'http://s.qplay.vn/650-0-0-0--1/game/Huyen-thoai-Ninja.html', 0, N'http://s.qplay.vn/images/product/icon/72 x 72191213-030024.png', N'Huyền thoại Ninja', N'Ngôi làng của Sasuke bị 7 tên cướp quấy nhiễu, thiêu chết cha của Sasuke là một Ninja giỏi bởi vậy cậu quyết tâm theo cha mình thành một Ninja sát thủ
Tham gia chơi Huyền Thoại Ninja bạn sẽ vào vai cậu bé mồ côi sasuke ,để được lên cấp bạn phải chiến đấu và hoàn thành các nhiệm vụ được giao. Phát triển bản thân dựa trân 5 yếu tố: Sức mạnh, Tốc độ, Khả biến, Nhẫn nại và Cân bằng, cố gắng để trở thành một Ninja với Danh dự, Sự tôn kính, Trung thực, Rộng lượng và Can đảm.
Nào! Sẵn Sàng Lên Đường!', CAST(0x0000A6CD00E10D94 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/650-0-0-0--1/download/Huyen-thoai-Ninja.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (280, N'http://s.qplay.vn/648-0-0-0--1/game/Chua-te-dinh-Olympus.html', 0, N'http://s.qplay.vn/images/product/icon/icon72091213-091915.png', N'Chúa tể đỉnh Olympus', N'Vào 1 ngày Nhật thực dài nhất trong lịch sử loài người, khi ánh mặt trời bị che khuất hoàn toàn, khi bóng tối đáng sợ phủ bóng khắp mọi nơi, các thế lực ma quái được cầm đầu bởi Quỷ vương Drako - vua của các loài ma quỷ trỗi dậy, chúng đã thoát khỏi thế giới yêu ma qua cánh cổng Địa ngục và tấn công thế giới loài người.

Và chiến tranh bắt đầu !

Chúng tiêu diệt tất cả những gì chúng đi qua: từ làng mạc, thôn xóm cho đến chốn thành thị. Chúng tiến đánh cả đỉnh Olympus – thánh địa của các vị thần với tham vọng san bằng và xâm chiếm nơi đây, nếu điều đó xảy ra thì sẽ không còn ai có thể bảo vệ cho dân chúng. Và đó có thể  là sự diệt vong của loài người và đánh dấu cho sự xưng bá của thế giới loài quỷ. Nhưng may thay vẫn còn đó những vị thần ưu tú nhất, được cử để đứng ra chống lại chúng. Hercules, Ares, Apollo tất cả phải chiến đấu hết mình, để bảo vệ thánh địa để chứng tỏ rằng, ai mới là “Chúa tể đỉnh Olympus”

Cách chơi:
- Có 3 loại nhân vật cho bạn chọn lựa. Các nhân vật khác nhau ở khả năng tạo ra sát thương, tốc độ đánh, tầm xa, hệ thống kỹ năng đa dạng và riêng biệt
- Chỉnh hướng ném, giữ để tăng lực ném sau đó thả tay ra để ném
- Nâng cấp vật lý nhờ số vàng kiếm được trong các màn chơi, nó tăng khả năng tấn công trực tiếp cho nhân vật
- Nâng cấp phép thuật nhờ số sao kiếm được qua đánh giá mỗi màn chơi, nó gián tiếp tăng khả năng tấn công của nhân vật thông qua việc sử dụng các kỹ năng của nhân vật
- Bạn nên sử dụng kết hợp nhiều kỹ năng 1 lúc để đạt được hiệu quả tối đa', CAST(0x0000A6CD00E10D95 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/648-0-0-0--1/download/Chua-te-dinh-Olympus.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (281, N'http://s.qplay.vn/646-0-0-0--1/game/Dap-chuot.html', 0, N'http://s.qplay.vn/images/product/icon/icon 72x72020713-090142041213-051402.png', N'Đập chuột', N'Đập chuột là một trò chơi hết sức quen thuộc, nó mang tính vui nhộn, kiểm tra sự phản xạ và sự tinh mắt của người chơi. Game được thiết kế với thao tác đơn giản nhưng cách chơi sáng tạo, hình ảnh đẹp và âm thanh được chuẩn bị kỹ lưỡng nên rất hay và tinh tế. Do không chứa các nội dung và hình ảnh phản cảm, bạo lực nên trò chơi phù hợp với rộng rãi mọi lứa tuổi.
Trong game nhiệm vụ của người chơi là phải là cố gắng đập được những con chuột xuất hiện trên màn hình 1 cách nhịp nhàng. Đừng đập quá nhanh nhưng cũng đừng đập quá chậm, cố gắng giữ nhịp thật tốt để giữ Liên hoàn để ghi được thật nhiều điểm thật cao đem khoe bạn bè mình.
Bạn nhớ ghé qua “Thành tích” thường xuyên để xem những loại chuột mới bạn sắp được khám phá trong quá trình chơi nhé. Mỗi loại chuột với 1 đặc điểm riêng hứa hẹn sẽ đem lại cho bạn những trải nghiệm thực sự bất ngờ và thú vị. 
Nào bạn ơi, còn chần chừ gì mà chưa nhanh tay tải game về và tham gia vào xứ sở rộng lớn của các loại chuột nhỉ ? Game tải hoàn toàn miễn phí. Tải về và tận hưởng những phút giây cực kỳ sảng khoái và thú vị với “Đập chuột” thôi các bạn ơi ^^
*Cách chơi:
- Đập tất cả các loại chuột xuất hiện trên màn hình thật nhanh trước khi chúng kịp chui xuống hố
- Đập đồng hồ để tăng thời gian chơi, nhanh tay chạm lấy búa để đập tất cả chuột có mặt tại thời điểm hiện tại. Nhớ tránh đập những quả bom nhé, chúng sẽ trừ thời gian chơi của bạn rất nhanh
- Mỗi loại chuột sẽ có 1 đặc điểm riêng và 1 tính năng đặc biệt riêng vì vậy hãy cố gắng mở khóa hết các loại chuột để khám phá những bí ẩn đằng sau những loại chuột đó. Mở càng nhiều chuột thì khả năng đem lại cho bạn số điểm càng lớn .', CAST(0x0000A6CD00E10D97 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/646-0-0-0--1/download/Dap-chuot.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (282, N'http://s.qplay.vn/643-0-0-0--1/game/Dai-Chien-Xe-Tang.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72281113-053533.png', N'Đại Chiến Xe Tăng', N'"Chắc hẳn ai trong chúng ta cũng từng có một ký ức tuổi thơ khó phai về tựa game Tank 90 nổi tiếng trên hệ máy NES nổi tiếng ngày nào. Hãy cùng Đại Chiến Xe Tăng quay lại ký ức đẹp đẽ ngày nào theo một phong cách bắn tăng cực mới. Với hai mode chơi là Chiến dịch và Sống còn, bạn sẽ không phải nhàm chán khi phải chơi chỉ trong một màn hình vuông nhỏ bé mà còn trải rộng trên những bản đồ dài và nhiều loại địa hình cực mới lạ.
Sử dụng phím điều khiển giả lập để điều khiển xe tăng di chuyển, đồng thời chạm vào bất kỳ điểm nào trên màn hình để khai hỏa kẻ địch nhé !
Chúc cán bạn có những giờ phút giải trí vui vẻ với Đại Chiến Xe Tăng !"', CAST(0x0000A6CD00E10D98 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/643-0-0-0--1/download/Dai-Chien-Xe-Tang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (283, N'http://s.qplay.vn/638-0-0-0--1/game/Sinh-ton.html', 0, N'http://s.qplay.vn/images/product/icon/logo141113-085309.png', N'Sinh tồn', N'Một cuộc chiến ác liệt chống lại lũ zombies đang tấn công khắp thành phố. Bạn phải làm gì đây làm gì đây. Tất nhiên là phải đứng lên để bảo vệ thành phố rồi.
Một game phòng thủ với cách chơi khá mới lạ và độc đáo đấy nhé.', CAST(0x0000A6CD00E10E24 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/638-0-0-0--1/download/Sinh-ton.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (284, N'http://s.qplay.vn/636-0-0-0--1/game/Biet-doi.html', 0, N'http://s.qplay.vn/images/product/icon/icon_72121113-101748.png', N'Biệt đội', N'Bạn sẽ vào vai những người lính đặc nhiệm anh hùng xông pha trên chiến trường, tiêu diệt những phần tử nguy hiểm
Hãy cùng tham gia những chiến dịch nguy hiểm nhưng không kém phần hấp dẫn khắp thế giới
Game có nhiều cấp độ để bạn khám phá, một kho vũ khí lớn
những con trùm nguy hiểm sẽ không làm bạn chán nản qua các cấp độ của Game
tương ứng sẽ có nhiều nhiệm vụ tại các thành phố, các địa điểm khác nhau trên thế giới.
Chúc bạn sớm hoàn thành được nhiệm vụ!
Cách chơi: 
+ Di tay theo các hướng để di chuyển nhân vật
+ Bấm phím bắn để khai hỏa súng.
+ Nâng cấp vũ khí để tăng cường hỏa lực cho bản thân.', CAST(0x0000A6CD00E10E29 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/636-0-0-0--1/download/Biet-doi.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (285, N'http://s.qplay.vn/632-0-0-0--1/game/Quai-vat-tham-an.html', 0, N'http://s.qplay.vn/images/product/icon/72 x 72021113-113729.png', N'Quái vật tham ăn', N'Bạn sẽ làm gì nếu có trong tay một con quái vật đáng yêu nhưng háu ăn khủng khiếp ?
Đó là một con quái vật có thể ăn được tất cả mọi thứ, từ kim loại, cao su , vỏ chuối, rác thải , các loại vật dụng cũ hỏng ... Thứ gì nó cũng có thể đánh chén ngon lành, duy nhất chỉ có kẹo cao su là làm nó sợ hãi.
Cũng đúng thôi, bị dính răng bởi kẹo cao su thì chẳng vui vẻ gì. Nó sẽ chẳng ăn thêm được bất kì thứ gì nữa ...
Vì vậy, nếu có thể hãy giúp quái vật tham ăn này ăn tất cả mọi thứ và tránh mấy cái kẹo ra nhé ...
Sử dụng cơ chế điều khiển rung lắc hoàn toàn đặc biệt, bạn sẽ có những giây phút trải nghiệm thú vị nhất với tựa game " Quái vật tham ăn " . Bên cạnh đồ họa đẹp mắt, hình ảnh mượt mà cùng âm thanh ấn tượng cũng là điểm nhấn làm tăng thêm độ hấp dẫn của game. 
Hãy tải game và chuẩn bị rung và lắc theo cách của bạn nhé !', CAST(0x0000A6CD00E10E2B AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/632-0-0-0--1/download/Quai-vat-tham-an.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (286, N'http://s.qplay.vn/630-0-0-0--1/game/The-chien-Z.html', 0, N'http://s.qplay.vn/images/product/icon/logo b 72x72301013-070928.png', N'Thế chiến Z', N'Thế Chiến Z xoay quanh câu chuyện về Gerry Lane, một nhân viên Liên hợp quốc đi khắp nơi để tìm cách bảo vệ thế giới mình đang sống, khi loài người dần thay đổi và trở thành các sinh vật khát máu, sẵn sàng giẫm đạp lên nhau để tồn tại. 
Trong tựa game cùng tên "Thế Chiến Z", bạn sẽ vào vai Gerry Lane để chống lại bầy lũ thây la gớm ghiếc kinh tởm để giành lấy sự sống cho mình và những người thân yêu.
Game với đồ họa đẹp và âm thanh nổi bật
Cách chơi đơn giản khi chạm và nhấp sang hai bên để tấn công zombie.
Chúc các bạn cso những phút giải trí vui vẻ và sảng khoái!', CAST(0x0000A6CD00E10E2D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/630-0-0-0--1/download/The-chien-Z.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (287, N'http://s.qplay.vn/627-0-0-0--1/game/Truy-tim-kho-bau-dai-duong.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72261013-115458.png', N'Truy tìm kho báu đại dương', N'Nemo là môt chú cá thích phiêu lưu mạo hiểm.Một ngày nọ chú tìm được một tấm bản đồ kho báu trong truyền thuyết.Với sự đam mê mãnh liệt, chú quyết tâm phiêu lưu với cuộc hành trình truy tìm kho báu cổ xưa.Nhưng ở đại dương bao la đó,có vô vàn những khó khăn và thách thức mà chú phải vượt qua.Mỗi một đảo,một vùng biển là một thách thức mới, càng gần kho báu sẽ càng ly kỳ,hấp dẫn và đầy những nguy hiểm.Bạn hãy nhập vai vào chú cá Nemo để phiêu lưu trong cuộc hành trình truy tìm kho báu nhé! Với hệ thống nhân vật,đồ vật phong phú đang chờ bạn khám phá,cộng với game được đầu tư kĩ càng về đồ họa, âm thanh và đã được tối ưu hóa để có thể chạy trên hầu hết các dòng máy android hiện nay.Chắc hẳn sẽ làm bạn hài lòng.Nào,còn chờ gì nữa,hãy bắt đầu chuyến phiêu lưu truy tìm kho báu đại dương nào.
Game hỗ trợ nhiều kiểu điều kiển nhân vật khác nhau để bạn chọn kiểu nào là phù hợp với mình nhất.
+Di tay : hãy di tay từ từ để điều kiển chú cá đi theo hướng của mình nhé !
+Nghiêng : hãy nghiêng chiếc điện thoại về hướng mà bạn muốn chú cá đi nhé!
+Vuốt tay : bạn vuốt tay để điều khiển hướng của chú cá nhé!
+Di tay + vuốt : sau khi bạn di tay,khi nhả tay sẽ tự động chuyển sang vuốt.
Chúc bạn có một chuyến phiêu lưu vui vẻ !', CAST(0x0000A6CD00E10E2F AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/627-0-0-0--1/download/Truy-tim-kho-bau-dai-duong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (288, N'http://s.qplay.vn/624-0-0-0--1/game/Ong-gia-danh-cuop.html', 0, N'http://s.qplay.vn/images/product/icon/72231013-031845.png', N'Ông già đánh cướp', N'Ông già đánh cướp là tựa game vui nhộn vô cùng hấp dẫn, bạn hãy giúp ông già khó tính trừng trị những tên du côn phá phách hàng xóm nhé. 
- Với cách chơi nhập vai tương tự như những game võ thuật đi ngang
- Hãy sử dụng những chiêu thức hợp lý để tiêu diệt kẻ địch 
- Và hãy sử dụng thêm những tuyệt chiêu, những vũ khí lợi hại để kéo dài cuộc hành trình
Với rất nhiều nguy hiểm đang rình rập cả ban ngày và trong đêm tối , bạn phải thật khéo léo và quan sát  tốt những tên cướp có vũ khí vì chúng cực kỳ nguy hiểm .', CAST(0x0000A6CD00E10E31 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/624-0-0-0--1/download/Ong-gia-danh-cuop.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (289, N'http://s.qplay.vn/620-0-0-0--1/game/Xac-song-troi-day.html', 0, N'http://s.qplay.vn/images/product/icon/72_2181013-091905.png', N'Xác sống trỗi dậy', N'"Xác Sống Trỗi Dậy" - Tựa game hành động kinh dị đưa bạn vào một thế giới khủng khiếp của đại dịch zombie, nơi bạn không có cơ hội sống thứ 2 nếu để rơi vào tay lũ xác sống. Hãy làm tất cả những gì có thể để tiếp tục sống sót, bắn và tiêu diệt càng nhanh càng tốt và bảo vệ bản thân bằng mọi phương tiện và vũ khí cần thiết. Bạn sẽ sẽ phải vượt qua liên tiếp từ các cánh đồng hoặc khu rừng tưởng chừng kéo dài bất tận. Khi xác sống trỗi dậy, hãy bỏ chạy hoặc dũng cảm dùng lựu đạn để ném về phí chúng!', CAST(0x0000A6CD00E10E32 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/620-0-0-0--1/download/Xac-song-troi-day.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (290, N'http://s.qplay.vn/618-0-0-0--1/game/Xu-so-kim-cuong.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72171013-100647.png', N'Xứ sở kim cương', N'Xứ sở kim cương với đồ họa đẹp mắt, hiệu ứng sống động, âm thanhhấp dẫn đã ra mắt trên sóng của Qplay và hứa hẹn đem lại cho bạn 1 làn gió mới đối với thể loại game kim cương truyền thống. Cách chơi rất đơn giản, bạn chỉ cần nối các khôi kim cương theo chiều ngang và dọc sao cho thật dài và thật nhanh để ghi được những điểm số thật cao. Với chuỗi kim cương càng dài, bạn còn có khả năng tạo ra những quả bom kim cương rất đặc biệt. Những quả bom này có gì đặc biệt và ăn thật nhanh thì đem lại cho bạn những điều thú vị gì ? … Hì hì các bạn hãy cùng mình trải nghiệm và khám phá những điều bí ẩn đặc biệt nhé
Ngoài ra bạn có thể sử dụng những vật phẩm để dễ dàng ghi được thật nhiều điểm cao. Và đặc biệt hơn, với phiên bản nâng cấp sắp tới bạn sẽ được so tài với các cao thủ khác trên thế giới hoặc đơn giản là so sánh điểm với bạn bè của mình để chúng nó phải choáng và thán phục bạn khi nhìn thấy điểm số của bạn. Hãy liên tục cập nhật các phiên bản của chúng tôi để đón nhận những điều cực kỳ thú vị và hấp dẫn nhé. 
Game chơi miễn phí và sẽ được được cập nhật liên tục với hệ thống mạng xã hội đặc sắc, nào hãy nhanh chóng download game về và so tài thôi các bạn ơi', CAST(0x0000A6CD00E10E34 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/618-0-0-0--1/download/Xu-so-kim-cuong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (291, N'http://s.qplay.vn/617-0-0-0--1/game/Dao-vang-khong-gian.html', 0, N'http://s.qplay.vn/images/product/icon/72141013-050540.png', N'Đào vàng không gian', N'Năm 2050, Trái Đất trở nên cạn kiệt tài nguyên hơn bao giờ hết. Những cuộc xung đột vũ trang nổ ra để tranh giành nguồn tài nguyên ít ỏi còn lại giữa các quốc gia ngày càng ác liệt. Sau đó, 1 cơn mưa thiên thạch đã trút xuống và làm biến mất 75% dân số thế giới. Cả hành tinh xanh chỉ còn lại không quá 2 tỉ người. Sau đại thảm họa, thế giới trở thành 1 đống đổ nát và hoang phế, loài người chỉ biết sống với nhau thành từng thị trấn nhỏ, lấy việc săn bắn, trồng trọt và tìm kiếm những gì còn sót lại để cải tạo thành công cụ lao động và máy móc. Và chỉ chưa đến 3 năm sau, động cơ hơi nước đã trở lại, biến các thị trấn thành các thành phố sương mù, lúc nào cũng mịt mờ, ẩm ướt. Với sự trợ giúp của máy móc, con người đẩy mạnh việc khai thác khoáng sản, đồng thời phát hiện ra những nguồn tài nguyên mới, và 1 trong số đó là những viên tinh thạch đến từ vũ trụ, mang theo nguồn năng lượng ánh sáng gần như là vĩnh cửu. Máy móc hơi nước bị loại bỏ, những cỗ máy chạy bằng năng lượng ánh sáng ra đời, loài người lại có thêm 1 bước tiến dài trong cuộc cách mạng công nghệ tự động hóa, từ đó đã chế tạo ra các rô bốt với trí thông minh nhân tạo, để có thể thay con người tìm kiếm các viên tinh thạch ở những thiên hà xa xôi, và rô bốt GX-TP 2000 – nhân vật chính của chúng ta là 1 trong số đó.
Nhiệm vụ của bạn là điều khiển nhân vật chính của chúng ta, làm sao để nó thu thập càng nhiều viên tinh thạch càng tốt, qua đó kiếm được nhiều điểm nhất có thể. Nhớ kéo thật chính xác và liên tiếp để được thưởng nhiều điểm hơn nhé! Và đừng quên rằng, những mối nguy hiểm trong vụ trụ luôn luôn rình rập, đó là các UFO và lỗ đen, sẵn sàng phá hủy nhân vật chính của chúng ta bất cứ lúc nào, các bạn phải nhớ đấy!', CAST(0x0000A6CD00E10E36 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/617-0-0-0--1/download/Dao-vang-khong-gian.html', NULL)
GO
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (292, N'http://s.qplay.vn/615-0-0-0--1/game/Binh-doan-dia-nguc.html', 0, N'http://s.qplay.vn/images/product/icon/72111013-105036.png', N'Binh đoàn địa ngục', N'Binh đoàn địa ngục dưới sự chỉ huy của  chúa tể Dracula đang trở lại xâm chiếm và tàn phá thế giới. Chúng reo sự chết chóc khắp mọi nơi chúng đi qua. Vào vai một nhà chiến lược quân sự bạn phải tìm ra những chiến thuật để chống lại chúng.
Binh đoàn địa ngục là một game chiến thuật đơn giản, hấp dẫn. Nếu bạn đã từng chơi Plans and Zombies thì sẽ không quá lạ với lối chơi của game. Tuy nhiên khác với Plans and Zombies, trong game Binh đoàn địa ngục bạn sẽ không chỉ cần phòng thủ mà còn phải tấn công thành lũy của địch. Game có hệ thống nhân vật đa dạng kết hợp với những skill bổ trợ đẹp mắt sẽ mang lại giá trị khám phá cao cho game.
Game có tính năng rất đặc sắc đó là “Trồng cây thu sao”. Trong game để nâng cấp quân lính bạn phải dùng “Sao”. Bạn có thể kiếm “Sao” trong các màn chơi, tuy nhiên số lượng “Sao” bạn kiếm được trong các màn chơi khá ít. Vì vậy “Trồng cây thu sao” trong “Khu vườn” là cách hiệu quả nhất để kiếm “Sao”. Với tính năng này, NSX đã giảm đi khá nhiều sự khô khan thường thấy trong các dòng game chiến thuật.
Đồ họa và âm thanh là một điểm cộng lớn của game. Khi mới vào game bạn hãy mở hết cỡ âm lượng để cảm nhận sự Hùng tráng của game.
Lời kết: Binh đoàn địa ngục là một game đáng để thưởng thức. Nếu bạn đang tìm kiếm một game chiến thuật đơn giản, hấp dẫn thì đừng ngại ngần dow game về chơi thử.', CAST(0x0000A6CD00E10E37 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/615-0-0-0--1/download/Binh-doan-dia-nguc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (293, N'http://s.qplay.vn/614-0-0-0--1/game/Bong-ro.html', 0, N'http://s.qplay.vn/images/product/icon/72101013-073045.png', N'Bóng rổ', N'Bóng rổ đường phố - một trò chơi cực chất cho dân nghiền thể thao, đặc biệt là fan của bộ môn bóng rổ.
Game có lối chơi cực kỳ đơn giản nhưng cũng dễ gây nghiện. Bạn chỉ cần lướt ngón tay lên màn hình điện thoại và điều khiển hướng đi và lực ném bóng. Thực sự đơn giản chỉ có vậy ? 
Hãy tự mình khám phá nhé !
Bên cạnh đồ họa đẹp mắt, hình ảnh mượt mà cùng âm thanh ấn tượng cũng là điểm nhấn làm tăng thêm độ hấp dẫn của game. Việc hoàn thành những nhiệm vụ mỗi lúc một khó khăn hơn sẽ tăng thêm cảm giác thú vị và không gây nhàm chán cho những màn sau.
Kỹ năng ném rổ của bạn đến đâu ?  Hãy trải nghiệm và chứng minh khả năng của mình qua tựa game : Bóng rổ đường phố nhé .', CAST(0x0000A6CD00E10EC8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/614-0-0-0--1/download/Bong-ro.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (294, N'http://s.qplay.vn/612-0-0-0--1/game/Rua-con-tap-nhay.html', 0, N'http://s.qplay.vn/images/product/icon/icon72091013-041318.png', N'Rùa con tập nhẩy', N'Boucy là một chú rùa thông minh và đáng yêu. Chú thường bị bạn bè trêu trọc là chậm chạm. Vì không muốn bị trêu trọc chú đã tự tập luyện và đặt ra những thử thách cho mình là nhẩy lên những bậc cao. Tuy nhiên trong lúc nhẩy chú không thể di chuyển qua trái hoặc phải. Bạn hãy giúp Boucy vượt qua những thử thách đó nhé.
Hướng dẫn: Chạm hoặc dữ tay ở màn hình để chú rùa Boucy nhẩy lên sao cho chú về được đích đến.', CAST(0x0000A6CD00E10ECA AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/612-0-0-0--1/download/Rua-con-tap-nhay.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (295, N'http://s.qplay.vn/610-0-0-0--1/game/Nong-trai-hanh-phuc.html', 0, N'http://s.qplay.vn/images/product/icon/72051013-100327.png', N'Nông trại hạnh phúc', N'Nếu các bạn đã từng yêu thích game nông trại thì không thể bỏ qua Nông trại hạnh phúc, một dòng game nông Trại thế hệ mới với cách chơi được cải tiến hay hơn, hấp dẫn hơn, mới mẻ chưa từng xuất hiện ở Việt Nam. Không đơn thuần hóa thân thành một người chủ trang trại cần mẫn với đồng ruộng với những tính năng trồng cây mà hoạt động buôn bán giao thương còn giúp người chơi trải nghiệm cảm giác trở thành một nhà kinh doanh thật sự.
Tạm quên khói bụi của thành phố, Nông trại hạnh phúc đưa người chơi trở về với thiên nhiên qua khung cảnh thanh bình ở nông trại, trải nghiệm cảm giác trồng trọt làm bạn với các loài hoa, các loài quả đáng yêu & xinh xắn. Người chơi sẽ trở thành một người chủ trang trại thật sự, được thu hoạch mỗi khi đến vụ mùa, sản xuất những nông phẩm phong phú & dùng các sản phẩm tươi ngon này giao thương với rất nhiều thị trường tạo nên một không khí mua bán vô cùng sôi động và thú vị. Nào hãy cùng mình chúng ta xây dựng 1 thành phố toàn những Nông trại hạnh phúc nhé ^^
====================================================
Tính năng nổi bật:
- Chơi miễn phí.
- Trở thành người chủ trang trại thật thụ với nông trại của riêng mình
- Xây dựng nông trại theo ý thích một cách cá tính hóa
- Giúp đỡ, giao thương & chia sẻ thành tích với bạn bè
- Hình ảnh & âm thanh dễ thương tạo nên một nông trại sống động.
Cách chơi:
- Trồng chăm sóc cây cối và mở rộng buôn bán thường xuyên với các thị trường
- Bạn chú ý thực hiện nhiệm vụ của mỗi mùa để nhận được những món quà ý nghĩa cho nông trại
- Hệ thống nhiệm vụ và cách chơi mới sẽ được update liên tục vì vậy bạn hãy thường xuyên ghé qua Website của chúng tôi để cập nhật những phiên bản mới hơn, hấp dẫn hơn và vui vẻ hơn với Nông trại hạnh phúc', CAST(0x0000A6CD00E10ECC AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/610-0-0-0--1/download/Nong-trai-hanh-phuc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (296, N'http://s.qplay.vn/607-0-0-0--1/game/Thoat-khoi-mo-hoang.html', 0, N'http://s.qplay.vn/images/product/icon/72-x72181013-053127.png', N'Thoát khỏi mỏ hoang', N'Anh chàng  Jonh lạc vào một mỏ hoang đầy tiền, anh ta vô cùng hạnh phúc với kho báu khổng lồ này mà không hề biết mỏ vàng đang dần sụp đổ và có thể đè chết anh ta bất cứ lúc nào. Hãy cùng nhân vật Jonh chạy trốn khỏi hầm mỏ cũ nát đồng thời thu thập  thật nhiều vàng và kim cương và tiêu diệt tất cả các loài vật cản đường đi của bạn.
Cách chơi: 
Chạm vào bên trái nhân vật để nhảy qua các chướng ngại vật và chạm vào bên phải để bắn hạ các loài  nhện, rắn thậm chí là đất đá đang cản đường bạn.', CAST(0x0000A6CD00E10ECE AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/607-0-0-0--1/download/Thoat-khoi-mo-hoang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (297, N'http://s.qplay.vn/603-0-0-0--1/game/Di-nhan-bao-thu.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72270913-042053.png', N'Dị nhân báo thù', N'Trái đất năm 2039, quang cảnh đổ nát, hoang tàn, quái vật truy đuổi người ở khắp mọi nơi. Tiếp nối những đồng nghiệp spiderman, hulk, iron man,… gã dị nhân quái đản đặt chân lên sàn diễn. 
Sở hữu tài thiện xạ trên người nhện bắn tơ, tốc độ chạy iron man phải hít khói, dị nhân mang lại cho người chơi cảm giác phấn khích khi rượt đuổi và bắn nhau vs quái vật.
Không thể không nói đến khả năng hồi phục thần kì của dị nhân, nghĩa là, khi người chơi gần hết máu có thể tìm 1 góc yên ổn lánh nạn và máu sẽ “trâu bò” hồi phục lại, tuy nhiên người chơi cần phải cẩn thận vì rồng đất chúa có thể đuổi kịp bất cứ lúc nào.
Với gameplay đẹp mắt, nhân vật có những tính năng tuyệt vời, nhạc game đầy phấn khích, còn chờ gì nữa mà không down game', CAST(0x0000A6CD00E10ECF AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/603-0-0-0--1/download/Di-nhan-bao-thu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (298, N'http://s.qplay.vn/600-0-0-0--1/game/Rong-con-phieu-luu.html', 0, N'http://s.qplay.vn/images/product/icon/72240913-095103.png', N'Rồng con phiêu lưu', N'Hãy giúp chú rồng con đáng yêu tham gia chuyến thám hiểm kì thú trên bầu trời kinh thành. Cùng vượt qua những chướng ngại vật và thu thập thật nhiều đồ chơi để ghi thêm nhiều điểm nhé.
Kinh thành đang trong thời gian lễ hội. Trên bầu trời chăng đầy những chiếc lồng đèn sáng rực. Hãy khéo léo điều khiển chú rồng con ham ăn thưởng thức những chiếc bánh trung thu ngon lành để tăng sức mạnh nhưng không ăn nhầm những chiếc lồng đèn cháy sáng nhé. Chúng sẽ làm rồng con mất sức đấy.
Cách chơi:
-Chạm vào màn hình để điều khiển rồng con.
-Cố gắng tránh những chiếc lồng đèn cháy sáng xuất hiện ngày một nhiều hơn.
-Ăn bánh trung thu được bố trí ngẫu nhiên trong màn chơi để tăng cường sức khỏe', CAST(0x0000A6CD00E10ED1 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/600-0-0-0--1/download/Rong-con-phieu-luu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (299, N'http://s.qplay.vn/598-0-0-0--1/game/Vuot-bang.html', 0, N'http://s.qplay.vn/images/product/icon/72210913-033518.png', N'Vượt băng', N'Songoku trên hành trình tìm kiếm ngọc rồng để hồi sinh ông nội đã lạc vào 1 dãy núi băng cực kỳ hiểm trở. Người anh hùng bé nhỏ phải vượt qua các tầng băng với đầy rẫy lũ quái vật đói khát từ lâu mang theo trọng trách là đánh đuổi những con Trùm ăn thịt người độc ác ở tầng cao nhất bảo vệ dân làng. Gậy Như ý bị rơi trong quá trình tìm kiếm ngọc rồng nhưng may thay Songoku vẫn còn chiếc búa thần mà ông nội để lại và người bạn tri kỉ Cân đẩu vân bên cạnh để tự tin chinh phục những thử thách đầy nguy hiểm. Liệu Songoku có vượt qua được những thử thách và tìm được ngọc rồng hay không, chính nghĩa liệu có dành chiến thắng được sư hung ác hay không ? Tất cả đang chờ đợi bạn, hãy hóa thân vào Songoku, để giúp người anh hùng của chúng ta chinh phục thử thách, tìm kiếm được ngọc rồng và hoàn thành sứ mệnh cao cả nhé !
Cách chơi:
- Dùng 2 tay khéo léo điều khiển Songoku di chuyển theo các hướng và tấn công tiêu diệt những con quái vật ăn thịt độc ác
- Cố gắng nhảy lên tầng cao nhất, và tiêu diệt tất cả Trùm có trong màn chơi để dành chiến thắng
- Búa vàng trong cửa hàng giúp Songoku tấn công tầm xa, búa Titan có sức mạnh đập tan tất cả các chướng ngại vật, nước sinh mạng giúp tăng sinh mạng cho Songoku giúp chú khỉ con tự tin hơn vượt qua các thử thách. Nhớ ghé qua cửa hàng và trang bị đồ cho Goku khỏe hơn nhé', CAST(0x0000A6CD00E10ED6 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/598-0-0-0--1/download/Vuot-bang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (300, N'http://s.qplay.vn/596-0-0-0--1/game/Ma-toc-do.html', 0, N'http://s.qplay.vn/images/product/icon/72200913-112351.png', N'Ma tốc độ', N'“Ghost rider“  là một tựa game đua xe hành động mới được phát triển theo lối chơi đơn giản nhưng vẫn tràn ngập những thử thách điển hình của dòng game Racing Battle
Cùng với những bối cảnh là những thành phố có thật giống y hệt ngoài đời , những chiếc xe hơi bóng bẩy và các pha ép xe nghẹt thở ... Tất cả đều hiện diện trong tựa game đua xe mới : Ma tốc độ Nội dung của tựa game Ghost rider 2014 kể về Jonny Blaze , một kẻ trở về từ cõi chết sau khi thực hiện bản giao ước ma quỷ.  Gã lang thang trên những đại lộ tràn ngập các thế lực hắc ám để báo thù những kẻ đã làm hại cuộc đời gã …
Lần này Ghost rider tiếp tục lao vào một cuộc chiến sinh tử khác khi phải chạy đua với thời gian để cứu con trai anh thoát khỏi bàn tay Ác Quỷ. Kẻ muốn chiếm lấy thể xác cậu bé vào đúng ngày sinh nhật của cậu …
Màn đua xe trong " Ma tốc độ" sẽ không chỉ là sự so tài tay nghề lái xe giữa các tay đua, mà thêm vào đó là những màn hành động đối kháng quyết liệt ngay trên đường đua. Phong cách lối chơi của "Ma Tốc Độ" là đua xe chiến đấu - “Racing Battle” , với các món đồ tăng lực, những cú quăng xích kéo ngã đối thủ hay những màn solo tay đôi ngay trên những đại lộ ngập tràn xe cộ.
Thử thác và đầy mạo hiểm. Lựa chọn giữa lạng lách tránh né để về đích an toàn hay càn quét tất cả những gì trong tầm mắt bằng sức mạnh của mình. Điều gì thú vị hơn ?
Các bạn hãy tự mình tìm câu trả lời nhé !
Các tính năng của game:
-Chạm vào màn hình để tăng tốc.
-Chú ý sử dụng Nitro khi bình nitro đầy.
-Quăng xích để phá hủy vật cả hoặc kẻ địch.
-Sử dụng vật phẩm một cách hợp lý nhất để qua màn với điểm số cao.
Nếu là kẻ hưng phấn với tốc độ cao. Hãy sẵn sàng crazy theo cách của bạn và đốt chạy mọi con đường nào !', CAST(0x0000A6CD00E10ED8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/596-0-0-0--1/download/Ma-toc-do.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (301, N'http://s.qplay.vn/594-0-0-0--1/game/Mario-xep-thuoc.html', 0, N'http://s.qplay.vn/images/product/icon/icon_xepthuoc72180913-112203.png', N'Mario xếp thuốc', N'Mario xếp thuốc là game dựa theo game xếp thuốc kinh điển Dr.Mario của Nintendo. Trong game, người phải dùng các loại thuốc trị màu khác nhau để trị virus.Người chơi phải làm mọi cách để xếp thuốc cùng màu với virus, khi tiêu diệt được hết virus, người chơi sẽ chiến thắng
Game có đồ họa đẹp mắt, âm thanh sống động, cách chơi quen thuộc. Mario xếp thuốc chắc chắn sẽ đem lại những giây phút thư giãn thoải mái cho người chơi. 
Nào còn chờ gì nữa, hãy down về và thưởng thức thôi', CAST(0x0000A6CD00E10EDA AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/594-0-0-0--1/download/Mario-xep-thuoc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (302, N'http://s.qplay.vn/592-0-0-0--1/game/Truy-sat-kinh-ngu.html', 0, N'http://s.qplay.vn/images/product/icon/72x72180913-050054.png', N'Truy sát kình ngư', N'Trong game, bạn sẽ nhập vai 1 chiếc tàu ngầm khám phá hải tinh. Hãy cẩn thận vì có rất nhiều quái vật nguy hiểm. Bạn sẽ phải đối mặt với những con con cá biết bắn đạn độc và các chướng ngại vật xuất hiện liên tiếp. Game có đồ họa hoành tráng,  hiệu ứng đẹp mắt, chắc chắn sẽ đem lại cảm giác đã mắt, đã tay cho người chơi', CAST(0x0000A6CD00E10EDB AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/592-0-0-0--1/download/Truy-sat-kinh-ngu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (303, N'http://s.qplay.vn/590-0-0-0--1/game/Rocket-mania.html', 0, N'http://s.qplay.vn/images/product/icon/72180913-033232.png', N'Rocket mania', N'Bạn nghĩ sao về việc chúng ta sẽ đốt - bắn pháo hoa vào dịp trung thu sắp tới này ?? Lạ chưa nào ?? Cái sự lạ lẫm và nghe có vẻ hấp dẫn này chỉ có thể có trong tựa game mới của Qplay: "Rocket Mania"
Tựa game cùng tên với tựa game "Bắn Pháo Hoa" của PopCap với đồ họa và âm thanh đậm chất "châu Á".
Tựa game mang phong cách chơi giống với game xếp ống nước quen thuộc.
Hãy thưởng thức những màn bắn pháo hoa đẹp mắt trong tựa game "Rocket Mania" vào Tết Trung Thu này nhé!
Tết Trung Thu.. Tết của tình thương mến! Qplay chúc các bạn đón một dịp tết Trung Thu vui vẻ và hạnh phúc bên gia đình và người thân!', CAST(0x0000A6CD00E10F75 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/590-0-0-0--1/download/Rocket-mania.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (304, N'http://s.qplay.vn/587-0-0-0--1/game/Lua-bo.html', 0, N'http://s.qplay.vn/images/product/icon/72 x 72180913-092221.png', N'Lùa bò', N'Vào vai một người quản nông trại bò, công việc hằng ngày tưởng như đơn giản là lùa bò vào chuồng nay khó khăn hơn với sự tấn công không ngừng của Ailens, những kẻ đến từ ngoài trái đất. Công việc của bạn là lùa thật nhanh đàn bò và ngăn cản không cho Ailens vào chuồng bằng bất cứ giá nào để bảo vệ cả đàn bình yên vô sự. Đàn bò đều trông chờ vào đôi bàn tay khéo léo của bạn đấy.
Với lỗi chơi mới lạ, đồ họa đẹp mắt công thêm hiệu ứng âm thanh thật sự khác biệt, game sẽ mang lại cho bạn một cảm khác mới mẻ. Vậy còn chờ gì nữa mà không down game vè play ngay!', CAST(0x0000A6CD00E10F78 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/587-0-0-0--1/download/Lua-bo.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (305, N'http://s.qplay.vn/585-0-0-0--1/game/Ninja-bao-thu.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72x72160913-050209.png', N'Ninja báo thù', N'Sắp tới ngày tận thế , người thì nói rằng đó sẽ là thiên thạch rơi xuống , người thì nói là tiên tri này nọ , thậm chí có cả người cho rằng đó sẽ là một thảm họa zombie tràn ngập thế giới. Tôi thì cái vụ thiên thạch rơi thì không quan tâm , đằng nào nó mà rơi xuống thì chết chùm với nhau, chết không cô đơn tẹo nào. Còn tiên tri á , nếu mà tiên tri được thì khối nhà tiên tri đã chẳng phải chết vì gạch rơi trúng đầu hay là bất cứ lí do nào mà có thể tránh được. Riêng cái vụ zombie , thì , tôi biết một câu truyện xưa , có một chàng ninja đã từng trả thù mà làm thịt hết một ổ thây ma. Điều đó chứng tỏ , thây ma chẳng thể mang lại tận thế được đâu. Còn muốn thử chém nhau với thây ma , hãy cùng khám phá tại game " Ninja báo thù" này nhé.
Cách chơi : 
- Cách chơi mang phong cách chặt chém , hấp dẫn không kém DmC hay GoW 
- Nâng cấp vũ khí , đao, kiếm , đại đao , phi tiêu .....', CAST(0x0000A6CD00E10F7A AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/585-0-0-0--1/download/Ninja-bao-thu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (306, N'http://s.qplay.vn/583-0-0-0--1/game/Ban-trai-cay.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72150913-090356.png', N'Bắn trái cây', N'Cô bé quàng khăn đỏ trong 1 lần đi lạc trong rừng đã phải đối mặt với sói già gian ác. Cô phải tự bảo vệ mình khỏi con sói đồng thời phải bảo vệ được trái cây mà con sói ăn trộm. Con sói háu đói tham lam, cướp hết trái cây này đến trái cây khác đi và nếu cứ để nó mang đi như vậy thì sẽ bị đói. Không còn cách nào khác, cô bé sẽ phải bắn đuổi con sói đi để bảo vệ chính mình
Cách chơi:
- Bắn các loại trái cây trên đầu con sói.
- Tránh bắn trúng người con sói khi trên đầu nó còn hoa quả
- Cứ 3 màn thì lại có 1 màn bonus để bạn kiếm thêm vàng để mua vật phẩm
- Nhớ sử dụng vật phẩm nếu bạn gặp phải thử thách quá lớn từ con sói
Mỗi địa danh chứa đựng những điều bí ẩn. Hãy vượt qua những địa danh đó để mở khóa những nhân vật tiếp theo, đến những địa danh mới, khám phá những điều bí ẩn đó cùng “Bắn trái cây” và đưa cô bé quàng khăn đỏ trở về nhà an toàn nhé !', CAST(0x0000A6CD00E10F7B AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/583-0-0-0--1/download/Ban-trai-cay.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (307, N'http://s.qplay.vn/580-0-0-0--1/game/Hoa-qua-dai-chien.html', 0, N'http://s.qplay.vn/images/product/icon/icon-hoaqua180913-111256.png', N'Hoa quả đại chiến', N'Thể loại game tuyệt vời cho dịp trung thu với những nhân vật dễ thương của thế giới hoa quả, trái cây.
Cùng bước vào vương quốc của nhũng loài trái cây miền nhiệt đới trong cuộc chiến chống lại những kẻ thù hung hăng đang tìm cách xơi tái những cậu nhóc cà chua dễ thương
Còn chờ gì nữa bạn hãy giúp vương quốc hoa quả một tay để bảo vệ sự thanh bình của muôn loài nha
- Ngắm thật chuẩn rùi bắn đạn tấn công kẻ thù bằng cách chạm thẳng vào màn hình
- Bảng thành tích được cập nhật liên tục từ Việt Nam đến thế giới.
- Với đồ họa + âm thanh được thiết kế cầu kì chi tiết từng góc độ cũng như mọi hành động của nhân vật trong game.
Cùng thưởng thức phiên bản “Đại chiến hoa quả” nào.', CAST(0x0000A6CD00E10F7D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/580-0-0-0--1/download/Hoa-qua-dai-chien.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (308, N'http://s.qplay.vn/578-0-0-0--1/game/Hung-cu-bau-troi.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72100913-033851.png', N'Hùng cứ bầu trời', N'Hùng Cứ Bầu Trời là một game đỉnh cao trong các game không chiến - Tựa game hot nhất của Qplay trong năm 2013. Những pha lượn lờ trên không để tránh luồng đạn của kẻ địch và tiêu diệt chúng để giành điểm. Với mỗi màn chơi người chơi phải tiêu diệt được đủ phần trăm số kẻ địch theo quy định thì bạn mới có thể bước vào màn chơi tiếp theo.
Đồ họa và âm thanh của game tuyệt vời để bạn thưởng thức đấy!
Chúc bạn có những phút giây giải trí vui vẻ!', CAST(0x0000A6CD00E10F7E AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/578-0-0-0--1/download/Hung-cu-bau-troi.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (309, N'http://s.qplay.vn/576-0-0-0--1/game/Anh-hung-diet-bo.html', 0, N'http://s.qplay.vn/images/product/icon/icon72200913-041239.png', N'Anh hùng diệt bọ', N'Một vụ mùa bội thu đã đến trên khu vườn nho nhỏ của lão nông dân Terry. Vụ mùa năm nay lão sẽ tậu nguyên một chiếc máy cày mới nếu thắng lợi trọn vẹn.  Ấy vậy mà có có rất nhiều kẻ phá hoại đang lăm le ăn tươi nuốt sống khu vườn yêu quý của lão một cách tàn bạo. Đó chính là lũ sâu bọ khổng lồ, chẳng biết từ đâu kéo đến hàng đàn hàng lũ …
Lão biết hiểm họa cho khu vườn của lão là rất lớn và một mình lão phải chống chọi lại tất cả .
Nhưng lão không hề sợ. “ Những kẻ phá hoại sẽ phải nếm thử chiếc xẻng của ta “  - lão nói chắc như đinh đóng cột … 
Liệu cuộc chiến không cân sức này sẽ đi đến đâu ? "
Là một trò chơi mới được phát triển dựa trên cốt truyện hấp dẫn, thao tác đơn giản, hình ảnh tươi sáng. Trò chơi “ Anh hùng diệt bọ” được xây dựng nhằm giúp người chơi nâng cao khả năng trí tuệ , tăng cường hoạt động trí não, kỹ năng phán đoán , phản ứng nhanh nhạy trong cách tình huống bất ngờ …
Với những màn chơi được thiết kế trong  điều kiện áp lực về mặt thời gian khiến người chơi có được trải nghiệm gay cấn thú vị, bồi bổ tư duy và khả năng sáng tạo trong lúc chơi game cũng như cuộc sống hàng ngày. Game đặc biệt thích hợp cho trẻ nhỏ đang trong quá trình phát triển.
Không giống như những trò chơi trên web khác thường có các hình ảnh sexy, girl xinh, bạo lực… có thể gây ảnh hưởng không tốt đến nhận thức của trẻ và vi phạm các tiêu chuẩn về giáo dục đạo đức cho trẻ. Trò chơi anh hùng diệt bọ không chứa các hình ảnh phản cảm…, không chứa các nội dung bạo lực khủng bố, đánh bom, đẫm máu cũng như các nội dung có hại khác…
Trò chơi được đánh giá là hoàn toàn lành mạnh, mang tính giải trí và học tập cao. Thích hợp với nhiều lứa tuổi.', CAST(0x0000A6CD00E10F80 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/576-0-0-0--1/download/Anh-hung-diet-bo.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (310, N'http://s.qplay.vn/574-0-0-0--1/ung-dung/Boi-teen.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72(1)180913-030441.png', N'Bói teen', N'Dựa vào các sao ứng với khoảng ngày tháng năm sinh, Tử vi sẽ cho bạn biết tình hình tài chính của bạn ra sao, những lưu ý về sức khỏe, mách nhỏ về bí quyết thành công trong sự nghiệp và tình duyên để cuộc sống của bạn hoàn hảo hơn.
Không chỉ xem một ngày hay một tháng bất kì mà thông tin này sẽ được cập nhật chi tiết theo từng ngày, từng tuần, từng tháng và cả năm. Vì vậy bạn không cần vất vả tìm kiếm trên mạng hay sách tử vi mà chỉ cần mở điện thoại ra, bạn đã có thể theo dõi thường xuyên vận mệnh của mình.
Hãy sử dụng thông tin đó một cách có ích nhé!', CAST(0x0000A6CD00E10F82 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/574-0-0-0--1/download/Boi-teen.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (311, N'http://s.qplay.vn/570-0-0-0--1/game/Vua-dau-bep.html', 0, N'http://s.qplay.vn/images/product/icon/unnamed310813-051709.png', N'Vua đầu bếp', N'Câu chuyện kể về một lão Vua đầu bếp già muốn từ bỏ quá khứ vàng son để về quê mở một quán ăn nho nhỏ. Lão muốn tận hưởng sự bận rộn của một đầu bếp chân chính giống như quá khứ đã từng trải qua, phục vụ những món ăn đơn giản theo yêu cầu của khách hàng. Nhận những lời khen ngợi chân thành hơn là những gì phù phiếm và ganh đua trước mắt ...
Vua đầu bếp là một niềm vui mới đối với những fan của thể loại game nấu nướng + quản lý. Tham gia vào game Vua Đầu Bếp bạn sẽ có cơ hội để trở thành một đầu bếp bận rộn phải đối mặt với hàng tá yêu cầu ngày một khắt khe hơn của khách hàng. Trò chơi được xây dựng với phong cách đơn giản, nhẹ nhàng cộng thêm đồ họa đẹp mắt chắc chắn sẽ đem đến cho người chơi những giây phút giải trí thảnh thơi và thú vị nhất.
Vua Đầu Bếp có 2 chế độ chơi:
Chế độ Phiêu Lưu: Chơi theo phát triển của cốt truyện
Chế độ thời gian:  Đối phó với những yêu cầu liên lục từ khách hàng với khoảng thời gian eo hẹp
Cách Chơi cũng rất đơn giản và thú vị:
- Chạm vào các loại thực phẩm để lựa chọn chúng
- Chạm vào bếp để chế biến.
- Đưa các loại món ăn hoàn chỉnh ra đĩa
- Và cuối cùng là … Mời các thượng đế thôi !', CAST(0x0000A6CD00E10F83 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/570-0-0-0--1/download/Vua-dau-bep.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (312, N'http://s.qplay.vn/564-0-0-0--1/game/Ai-la-trieu-phu.html', 0, N'http://s.qplay.vn/images/product/icon/1260813-092409.png', N'Ai là triệu phú', N'Sự kiện ''Chơi triệu phú trúng ipad 4'' HOT HOT!
Thể lệ cuộc chơi : Người chơi giành chiến thắng nhiều nhất, chiến thắng nhiều đối thủ nhất
Chơi Ai là triệu phú và làm Tỷ phú bạn nghĩ sao. Một game siêu mới siêu hot trên thị trường Việt Nam hiện nay. Đảm bảo với bạn rằng 100% nó khắc với các phiên bản trên thị trường bạn đã từng chơi. Và thêm nữa có cực nhiều chức năng cũng như kiểu chơi vô cùng độc đáo
- Một cộng đồng chơi Ai là triệu phú bạn có thể thách đấu với họ
- So găng với trí thông minh của bạn với những người bạn thân của mình, hoặc các bạn bè khắp nơi trên đất nước Việt Nam.
- Có thể chơi online lẫn offline
- Phong cách chơi tiếng anh với bộ câu hỏi độc đáo
- Kiểu chơi hình ảnh dành cho các bạn không thích đọc ^^!
- Bộ câu hỏi lên đến gần 80 ngàn câu.
Còn đợi gì nữa mau mau nhanh tay tải đi nào các bạn', CAST(0x0000A6CD00E10F85 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/564-0-0-0--1/download/Ai-la-trieu-phu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (313, N'http://s.qplay.vn/561-0-0-0--1/game/Bao-ve-gai-lang.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72240813-100508.png', N'Bảo vệ gái làng', N'Gái làng dạo này nhiều em đột nhiên xinh và ngon lạ thường, khiến cho lực lượng nhòm ngó ở làng khác ngày càng đông. Trai làng ta thì FA rất nhiều, nguy cơ FA ngày càng lớn. Trước đây bọn trai làng khác vào làng thì vẫn ngó trước ngó sau vào làng ngoan lắm, giờ thì chúng nó cậy đông xông thẳng vào làng cưa cẩm mấy em ngoan hiền. Với cái đà này thì sớm muộn gì làng cũng hết gái mất thôi. Ngày xưa phép vua còn thua lệ làng thế mà giờ chúng nó chả coi lệ làng ra gì. Trước những cư xử không biết trước sau như vậy, trai làng ta quyết định mở 1 chiến dịch quy mô rộng lớn với đủ các loại gạch đá, cà chua trứng thối để đánh đuổi “bọn xâm lược” bảo vệ gái làng !!!
Cách chơi:
- Sử dụng các vũ khí cho sẵn để tấn công trai làng khác, mỗi loại vũ khí có tác dụng khác nhau nên bạn hãy kết hợp chúng với nhau để đạt hiệu quả cao nhất
- Sử dụng các vật phẩm hỗ trợ để trợ giúp trong những tình huống nguy cấp, khi bọn trai làng khác chuẩn bị ôm hôn mấy em xinh tươi làng mình
- Sử dụng số sao thu được từ các màn chơi để nâng cấp vũ khí, chú ý bạn có thể Reset điểm cộng để cộng lại nhé
Nào gạch đá đã sẵn sàng chúng ta hãy bắt đầu công cuộc “Bảo vệ gái làng” ! ^^', CAST(0x0000A6CD00E1100D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/561-0-0-0--1/download/Bao-ve-gai-lang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (314, N'http://s.qplay.vn/558-0-0-0--1/game/Dua-xe-sieu-toc.html', 0, N'http://s.qplay.vn/images/product/icon/icon72240813-024659.png', N'Đua xe siêu tốc', N'Những tay đua siêu hạng, những chiếc ô tô siêu khủng. Bạn đã phải là một người có tinh thần thép để tham gia đường đua tử thần này. Với hàng trăm mẫu xe của các nhãn hiệu nổi tiếng trên thế giới kèm theo với những quốc lộ đông đúc ở khắp nơi. Nào hãy nhấn ga tham gia vào game Đua Xe Siêu Tốc.', CAST(0x0000A6CD00E1100F AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/558-0-0-0--1/download/Dua-xe-sieu-toc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (315, N'http://s.qplay.vn/553-0-0-0--1/game/Rambo-lun.html', 0, N'http://s.qplay.vn/images/product/icon/icon72220813-112514.png', N'Rambo lùn', N'RAMBO- LÙN  Tượng đài của dòng game 2D đã có phiên bản Android mang tên : RAMBO - LÙN 2013
Ngày còn bé tôi hay được người anh họ dẫn ra quán game để chơi và ngay lần đầu tiên tôi đã kết trò mà hồi đó được gọi là “rambo lùn”
vâng game mà tôi định nói tới chính là Rambo lùn  “tượng đài của dòng game 2D”.
Và bây giờ một lần nữa lại được trở về với tuổi thơ với những chuyến phiêu lưu của anh chàng Rambo trẻ tuổi, điều tra những âm mưu của nhưng tên khủng bố gian ác.
Hãy khéo léo né tránh những viên đạn của kẻ thù, tiêu diệt những tên khủng bố trên khắp thế giới.
Trong quá trình chơi, game thủ sẽ trải qua những vùng đất khác nhau trên thế giới,  thường xuyên nhặt thêm “đạn” để nâng cấp vũ khí và giải cứu những người thổ dân tội nghiệp khỏi gông cùm của kẻ thù.
Cuối các Level luôn luôn là phần quan trọng nhất với những màn diệt trùm khốc liệt.
Cách chơi: 
+ Sử dụng cần điều khiển bên trái để điều hướng cho nhân vật chính.
+ Sử dụng các nút bên phải để tấn công hoặc nhảy.
Nào hãy cùng phá đảo RAMBO LÙN nha ☺', CAST(0x0000A6CD00E11011 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/553-0-0-0--1/download/Rambo-lun.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (316, N'http://s.qplay.vn/549-0-0-0--1/game/Doi-bong-thieu-lam.html', 0, N'http://s.qplay.vn/images/product/icon/icon72120813-015553.png', N'Đội bóng thiếu lâm', N'100 năm trước, vào năm Sao chổi Sozin đến, Hỏa vương Sozin đã lợi dụng cơ hội này phát động một cuộc chiến tranh xâm lược toàn cầu. Vì tham vọng lớn lao này chỉ có thể bị đe dọa bởi Thế Thần, nên Hỏa Quốc phát động tấn công vào Khí Tộc quốc gia mạnh mẽ quê hương của Thế Thần …
Tuy nhiên Khí Tộc vốn cũng là một quốc gia mạnh mẽ đáng gờm. Hỏa Quốc vẫn phải dè chừng không dám tấn công trực diện mà phải thăm dò thực lực và thu thập thông tin.
Cơ hội cũng đã đến khi giải đấu bóng của các ngự thuật sư được tổ chức tại Khí Tộc. Hỏa Quốc bèn lập tức cử đến những đại diện xuất sắc nhất của mình nhằm tranh giải phô trương thế lực.
Và tất nhiên đằng sau đó còn một âm mưu to lớn hơn …
Dựa trên bộ phim nổi tiếng Avatar: The Last Airbender trò chơi sẽ dẫn dắt các bạn đến thế giới huyền ảo của các ngự khí sư. Những trận chiến nảy lửa kết hợp giữa võ thuật và thể thao sẽ khiến các bạn có những giây phút giải trí thoải mái và vui nhộn nhất.
Bạn sẽ là người bảo vệ hòa bình hay trở thành kẻ châm ngòi chiến tranh tội nhân thiên cổ ?
Hãy tự lựa chọn con đường của mình với tựa game: “Đội bóng thiếu lâm”
Cách chơi:
-Chạm tay lên màn hình để di chuyển nhân vật.
-Cố gắng đỡ bóng khi bóng bay tới cầu gôn của mình
-Sử dụng các loại chiêu thức để tấn công và phòng thủ. Chạm vào biểu tương “kiếm” để tấn công và biểu tượng “khiên” để phòng thủ.', CAST(0x0000A6CD00E11013 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/549-0-0-0--1/download/Doi-bong-thieu-lam.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (317, N'http://s.qplay.vn/547-0-0-0--1/game/Sonic-chinh-phuc-Phanxipang.html', 0, N'http://s.qplay.vn/images/product/icon/72-x72090813-045051.png', N'Sonic chinh phục Phanxipăng', N'Tiểu quái Sonic, ông hoàng tốc độ đang có một kỳ nghỉ đông vui vẻ trên đỉnh PhanxiPang thì nghe tin viên đá Chaos đã bị tên tiến sĩ Eggman đánh cắp. Chàng ta bèn vội vã quay trở về vương quốc Elise nhưng mọi chuyện đã muộn. Viên đá thần đã rơi vào tay tên tiến sĩ độc ác và công chúa Elise cũng bị hắn ta giam cầm.
Không nản chí, chàng tiểu quái vẫn cố gắng vượt qua những cạm bẫy và tay chân tên tiến sĩ gian ác để trở về giải cứu vương cuốc của mình...
Cách chơi:
-Nghiêng màn hình đề điều khiến hướng di chuyển của Socnic
-Cố gắng tránh né những vật cản như các tảng đá, lũ quái thú và đặc biệt là tên sói băng - tay chân của lão tiến sĩ Eggman
-Nhanh tay ăn những vật phẩm để tăng điểm và biến hình
-Chú ý biến hình thành những trạng thái mạnh hơn như rocket, superman để có thể hạ kẻ địch trước mặt
-Trong những tình huống nguy hiểm, nhớ sử dụng những vật phẩm trong shop để hỗ trợ.
-Và cuối cùng là. Let’s Go!', CAST(0x0000A6CD00E11016 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/547-0-0-0--1/download/Sonic-chinh-phuc-Phanxipang.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (318, N'http://s.qplay.vn/545-0-0-0--1/game/Nguoi-van-chuyen.html', 0, N'http://s.qplay.vn/images/product/icon/72030813-035702.png', N'Người vận chuyển', N'Với những ai từng là tín đồ của tốc độ hẳn đều rất ấn tượng với lối chơi arcade đơn giản nhưng vẫn cực kỳ thử thách, đòi hỏi kỹ năng cao của các game đua xe hành động. Cùng với những bối cảnh là những thành phố có thật giống y hệt ngoài đời và các chiếc xe hơi bóng bẩy, những pha ép xe nghẹt thở ... Tất cả đều hiện diện trong tựa game đua xe mới : Người vận chuyển.
Màn đua xe trong " Người vận chuyển" sẽ không chỉ là sự so tài tay nghề lái xe giữa các tay đua, mà thêm vào đó là những màn hành động đối kháng quyết liệt ngay trên đường đua. Phong cách lối chơi của "Người vận chuyển" là đua xe chiến đấu - “Racing Battle” , với các món đồ tăng lực, vũ khí “ăn” được trong khi đua, bị củ hành bởi những tên boss khó xơi ...
Thử thác và đầy mạo hiểm. Lạng lách ăn đồ và nã tất cả những gì mình có vào đối phương .... Liệu tất cả chỉ có thế ???
Các bạn hãy tự mình tìm câu trả lời .', CAST(0x0000A6CD00E11018 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/545-0-0-0--1/download/Nguoi-van-chuyen.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (319, N'http://s.qplay.vn/542-0-0-0--1/game/Cuoc-chien-huyen-thoai.html', 0, N'http://s.qplay.vn/images/product/icon/icon020813-031847.png', N'Cuộc chiến huyền thoại', N'Đã từ rất lâu rồi, từ khi thế giới này còn bị bao phủ bởi bóng tối của ma thuật và những con quỷ khát máu vẫn ngày ngày bước đi trên mặt đất, reo rắc nỗi kinh hoàng, sự thống trị và cái chết dành cho toàn nhân loại …
Trong khi loài người đang trong cơn đau khổ và tuyệt vọng, 1 vị anh hùng đã xuất hiện, đem lại và thắp sáng hi vọng cho hàng triệu con người, giúp họ có thêm niềm tin vào một ngày mai  tươi sáng, khi mà lũ quỷ dữ bị tiêu diệt hoàn toàn và mang bình yên trở lại nơi đây …
Vũ khí để tiêu diệt được lũ ác quỷ đến từ địa ngục của vị anh hùng này, không phải chỉ bằng 1 ngọn giáo, 1 thanh kiếm thông thường, mà là những cỗ máy Ballista với sức mạnh kinh hoàng, một khi đã bắn ra thì sẽ tiêu diệt được cả hàng quân địch, cùng với những loại phép thuật của thần linh. Cứ điểm phòng thủ cũng như hi vọng cuối cùng của loài người, chỉ còn lại tòa thành cuối cùng này …
Biết tin, tên chúa tể địa ngục đã ra lệnh cho con Rồng ngàn tuổi – quái vật mạnh nhất địa ngục cùng với 4 quân đoàn khác tiến thẳng về tòa thành ấy. Một cuộc chiến long trời lở đất đã nổ ra, mà sự ác liệt và tàn khốc của nó đủ để khiến người đời sau phải gọi bằng cái tên: Cuộc chiến huyền thoại.
Cách chơi: Có 2 chế độ chơi: Chiến đấu và sống còn. Người chơi sẽ phải vượt qua 20 màn chơi đơn ở chế độ chiến đấu để có thể sở hữu được tất cả các loại ballista và phép thuật cần thiết trước khi bước vào chế độ sống còn và cố gắng tiêu diệt lũ quỷ dữ bằng mọi thứ đang có, nếu không muốn chúng tiến đến và san bằng cả tòa thành của bạn. Người chơi phải chạm vào màn hình để điểu khiển cỗ máy ballista bắn tên hoặc chạm vào các phép thuật mà mình sở hữu, sau đó kéo thả vào vị trí mình muốn để tiêu diệt lũ quỷ dữ. Bạn đã sẵn sàng bước vào “Cuộc chiến huyền thoại” chưa?', CAST(0x0000A6CD00E1101A AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/542-0-0-0--1/download/Cuoc-chien-huyen-thoai.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (320, N'http://s.qplay.vn/540-0-0-0--1/game/Kungfu-gau-truc.html', 0, N'http://s.qplay.vn/images/product/icon/i72030813-034628.png', N'Kungfu gấu trúc', N'Đại hội võ thuật đang tới gần mà Panda đợt này tham ăn nên béo lên trông thấy. Sư phụ Chồn vàng đã ra giáo trình tập luyện mới cho Panda là tập chạy để luyện thân pháp. Nếu không tập chăm chỉ thì với thân hình mập mạp và di chuyển chậm như bây giờ thì chắc là Panda bị loại ngay từ vòng đầu thôi. Vì vậy, Panda của chúng ta cần cố gắng tập luyện nhiều hơn nữa để có thể đạt thứ hạng caoở đại hội sắp tới. Nào các bạn hãy cùng mình, chúng ta tập luyện cho Panda để chú gấu trúc này trở thành quán quân nhé.
- Cách chơi:
+ Chạm vào màn hình để nhảy lên
+ Nhảy qua các địa hình và nhảy tránh hoa độc giữa đường
+ Cố gắng ăn mạng và vật phẩm dọc đường để đạt được thật nhiều điểm cao tha hồ mà khoe bạn bè ^^', CAST(0x0000A6CD00E1101C AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/540-0-0-0--1/download/Kungfu-gau-truc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (321, N'http://s.qplay.vn/537-0-0-0--1/game/Dao-vang-tinh-yeu.html', 0, N'http://s.qplay.vn/images/product/icon/icon72260713-030905.png', N'Đào vàng tình yêu', N'Phiên bản thứ 2 với nhiều cải tiến mới về đồ họa cũng như nội dung game.
Trên hòn đảo thiên đường , nằm không xa những bãi biển tuyệt đẹp là hai ngọn núi mang tên “con trai” và “con gái”. Trên núi có đôi bạn trẻ đang sinh sống trong yên bình và cô đơn.  Họ giành tình cảm cho nhau đã lâu nhưng lại đang phải chịu thử thách của cách vị thần. Đó là nếu không chứng minh được tình cảm của mình thì họ sẽ mãi mãi không thể gặp nhau được.
Không còn cách nào khác. Họ bèn thả tình yêu của mình lên những đám mây và nhờ mây chuyển đến cho người mình yêu. Tuy nhiên hành trình tình yêu của họ luôn bị cản trở bởi tên thần chết khó tính và tên nhóc quỷ tham lam. Đến lúc này họ chỉ còn cách nhờ cậy đến khả năng thiện xạ và trí thông minh từ bạn.
Hãy giúp họ đến với nhau bạn nhé !
Dựa trên trò chơi “đào vàng” và “chinh phục ái tình” truyền thống nhưng mang theo những yếu tố cách tân mới mẻ. Game sẽ đem lại trải nghiệm thú vị nhất. Đây cũng là phiên bản chuẩn được cân bằng lại không quá khó hay dễ. Nhân vật thần chết luôn rình mò phá những trái tim vàng bạn đang kéo lên còn tên quỷ tham lam thì lăm le lấy trộm chúng cũng tăng thêm mức độ thử thách và vui nhộn.
Cả trò chơi là một thế giới đầy sắc màu và tràn ngập không khí lãng mạn, nhẹ nhàng, bay bổng. Mục tiêu của bạn là phải:
-Vượt qua được mức độ thử thách của từng màn chơi.
-Phải tính toán mua những vật phẩm hỗ trợ để qua màn.
-Khéo léo tránh những hòm thuốc nổ bày khắp nơi.
-Vào shop vip để mua những vật phẩm hỗ trợ qua màn nhé. Trong đó có bán những vật phẩm rất lợi hại giúp ta dễ dàng vượt qua màn hơn như Cung thần, Thánh giá , Nước tăng lực, Cỏ may mắn … với giá vô cùng phải chăng đấy !
-Gợi ý : Bạn hãy sử dụng ngọc trai trong ShopVip để có thể lưu lại màn chơi đó nếu có việc phải off game. Rất tiện lợi nhé.
Trang bị cẩn thận rồi, cuối cùng là hãy cũng nhau chinh phục ái tình thôi !', CAST(0x0000A6CD00E1101E AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/537-0-0-0--1/download/Dao-vang-tinh-yeu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (322, N'http://s.qplay.vn/535-0-0-0--1/game/Ga-chien.html', 0, N'http://s.qplay.vn/images/product/icon/72250713-100832.png', N'Gà chiến', N'Thằng em họ đến chơi cứ thích nghịch ngợm bắt gà của mẹ rồi thả vào bồn nước làm đàn gà cứ bị sặc nước liên tục. Chỉ khổ thân đám gà ngụp lên lặn xuống, con nào không vớt kịp thì chết ngất luôn. Mẹ về mà thấy gà con sống, con chết ngất thế này thì kiểu gì cũng đánh đòn mình mất. Biết làm sao bây giờ, thôi đành phải nhờ đến bạn đưa những chú gà về lồng an toàn trước sự nghịch ngợm của thằng em họ vậy. Bạn giúp mình với nhé :((
Cách chơi
- Khi gà bị thả vào bồn nước,bạn hãy nhanh tay chạm vào nó và kéo lên phía trên lồng gà và thả xuống. Bạn nhớ là kéo lên trên lồng gà rồi mới thả xuống nhé không là gà sẽ rơi xuống đất mất
- Khi gà rơi xuống đất mà sau 3s mà bạn không đưa vào được trong lồng gà sẽ chết ngất đấy
- Khi gà chạm mặt nước 4 lần gà cũng sẽ chết ngất vì vậy khi thấy gà chuyển sang màu xanh bạn hãy ưu tiên đưa nó vào lồng trước nhé', CAST(0x0000A6CD00E1101F AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/535-0-0-0--1/download/Ga-chien.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (323, N'http://s.qplay.vn/532-0-0-0--1/game/Nhin-hinh-doan-chu.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72160713-071937.png', N'Nhìn hình đoán chữ', N'“Nhìn hình đoán chữ” là 1 game trí tuệ, vui nhộn được xây dựng trên nền của game show rất quen thuộc trên truyền hình là “Đuổi hình bắt chữ”.  Khi vào game người chơi sẽ xem những hình ảnh rất quen thuộc và nhiệm vụ của người chơi là đoán sao cho đúng nhất thông điệp ẩn chứa đằng sau những bức ảnh đó. Tất cả các đáp án sẽ là dãy chữ cái bằng tiếng Việt, viết liền và không có dấu. Game bao gồm có 2 kiểu chơi là đoán nhanh và đoán chuẩn.
Đoán chuẩn: Người chơi sẽ được xem 4 ảnh. Trong suốt quá trình chơi nếu người chơi đoán sai quá 5 lần người chơi sẽ thua cuộc. Kiểu chơi này không giới hạn thời gian, chỉ giới hạn số lần đoán sai
Đoán nhanh: Người chơi sẽ lần lượt được xem từng bức ảnh mỗi 15s. Nếu trong 1 phút người chơi không thể đoán được nội dung những bức ảnh thì sẽ bị thua cuộc. Kiểu chơi này không giới hạn số lần đoán sai, chỉ giới hạn thời gian
Người chơi có 3 sự trợ giúp đắc lực:
- Loại bỏ 50% chữ cái không có trong đáp án
- Lật 1 ô chữ tùy ý để xem đáp án phía dưới
- Bỏ qua: bỏ qua câu hỏi đó và chuyển tiếp sang câu sau (người chơi chỉ được bỏ qua duy nhất 1 lần trong 1 lần chơi)', CAST(0x0000A6CD00E110B0 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/532-0-0-0--1/download/Nhin-hinh-doan-chu.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (324, N'http://s.qplay.vn/526-0-0-0--1/game/Ban-nam.html', 0, N'http://s.qplay.vn/images/product/icon/icon72x72080713-014433.png', N'Bắn nấm', N'Chắc hẳn các bạn đã không còn quá xa lạ với anh chàng Mario vui nhộn ưa chạy nhảy trong những tựa game plasform truyền thống. Tuy nhiên lần này các bạn sẽ được gặp lại anh chàng trong một diện mạo khác. Đó là xạ thủ bắn nấm.
Với lối chơi tương tự như thể loại Angry bird nổi tiếng. Các bạn sẽ phải dùng đến sự tinh tế của mình căn góc độ và lực bắn phù hợp để đưa những viên nấm vào đúng chiếc xô của mình. Vào những màn sau, thử thách càng trở nên khó khăn hơn khi những chiếc xô được đặt vào những góc rất tinh quái đòi hỏi bạn phải có kinh nghiệm chơi những game tương tự như: Gunbound, Angry bird, Gunny ...
Nào, bây giờ hãy cùng bắn thôi !
Cách chơi:
- Chạm vào phần phía trước nòng pháo để bắt đầu bắn
- Chạm càng xa, bắn càng mạnh
- Trong lúc bắn nhớ căn góc độ thật khéo léo để đưa những viên nấm vào xô nhé !', CAST(0x0000A6CD00E110B2 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/526-0-0-0--1/download/Ban-nam.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (325, N'http://s.qplay.vn/522-0-0-0--1/game/Zombie-dai-chien.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72040713-071033.png', N'Zombie đại chiến', N'Tựa game hành động siêu hót cho mùa hè năm nay.
Hãy tham gia trận đại chiến tiêu diệt những con Zombie hung hãn đang suất hiện khắp nơi trên thế giới 
Các bạn sẽ không phải thất vọng với tựa game hành động với hình ảnh siêu đẹp, hệ thống vũ khí cực kỳ đa dạng.
Thử thách cao hơn với chế độ chơi Săn Boss với rất nhiều phần thưởng giá trị đang chờ đón bạn khi tiêu diệt boss.
Hệ thống item hỗ trợ game thủ giúp cho người chơi có thể vượt qua thách thức của màn chơi.
* Cách chơi:
-Thao tác nhảy và tấn công với các button tương ứng.
- Chọn các bài chơi phù hợp và chế độ chơi hợp lý.
-Hãy sử dụng cửa hàng để lựa chọn vật phẩm phù hợp nha :)
-Chúc các bạn chơi game vui vẻ.', CAST(0x0000A6CD00E110B4 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/522-0-0-0--1/download/Zombie-dai-chien.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (326, N'http://s.qplay.vn/520-0-0-0--1/game/Chem-hoa-qua.html', 0, N'http://s.qplay.vn/images/product/icon/icon 72x72020713-090142.png', N'Chém hoa quả', N'Chém Trái Cây một phiên bản mới của Ninja fruit nổi tiếng trên khắp thế giới và giờ đã có mặt tại việt nam. Với một loạt những nâng cấp về đồ họa cũng như gameplay và vẫn giữ được yếu tố hấp dẫn truyền thống của dòng game Ninja fruit.
Thử thách dành cho bạn là cắt càng nhiều trái cây càng tốt trong khi tránh các quả bom nguy hiểm. Nếu bạn cắt cùng lúc nhiều trái cây, bạn sẽ được thưởng thêm điểm. Đừng để trái cây rơi ... hãy chém đứt trái cây ngay lập tức!
Hiện tại phiên bản này có 2 mode chơi chính :
- Chế độ chơi thường : đáp ứng sự giải trí nhẹ nhàng tạo ra những cảm giác thư giãn 
-Chế độ sinh tử: với sự nguy hiểm bất ngờ , nó khiến bạn phải thật sự tập trung để không chém nhầm vào những vật nguy hiểm.
Game được chúng tôi phát triển phiên bản mới với đồ họa đẹp mắt, âm thanh sống động và cách chơi đa dạng, chắc chắn sẽ đem đến cho các bạn sự thích thú và những giây phút giải trí nhẹ nhàng.
Đặc biệt Chém Trái Cây còn có thể thêm tính năng chia sẻ điểm Online để các game thủ trên toàn thế giới thi thố khả năng chém của mình. Shop vật phẩm với những loại vũ khí đa dạng càng làm cho quá trình chặt chém thêm đã tay.
Còn suy nghĩ gì nữa. "Chém" thôi!!', CAST(0x0000A6CD00E110B5 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/520-0-0-0--1/download/Chem-hoa-qua.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (327, N'http://s.qplay.vn/518-0-0-0--1/game/Pikachu-New.html', 0, N'http://s.qplay.vn/images/product/icon/pikachu icon 72x72020413-113708280613-084735.png', N'Pikachu New', N'Pikachu New chỉ một cái tên đã nói lên tất cả, một tựa game đã quá nổi tiếng, nay được cải tiến và thêm những hiệu ứng mới lạ và cách chơi mới đầy hấp dẫn.
-Được thừa hưởng từ phiên bản truyền thống, Pikachu New vẫn giữ nguyên cách chơi cũ với gần năm mươi màn chơi đầy biến hóa hấp dẫn với độ khó tăng dần thỏa sức khẳng định đẳng cấp của người chơi.
-Bên cạnh đó, phiên bản Pikachu New đã được thêm một cách chơi mới mà ở đó, người chơi có thể bỏ ra số kim cương của mình để cá cược, nếu thắng, số kim cương thu về hơn gấp 2 lần mà người chơi bỏ ra. Thỏa sức cược thôi!!!!
-Với sự ra mắt mới của của màn chơi cá cược thì bên cạnh đó, màn chơi Đua TOP lại là chỗ cho những người chơi đỉnh cao thi thố tài năng của mình. Ở màn chơi này, tất cả người chơi được thể hiện tài năng của mình dành thật nhiều điểm tích lũy vào quỹ điểm cao.
-Ba thể loại chơi đang chờ đón mọi người, không những vậy, với phiên bản này, Pikachu New đã được nâng cấp hiệu ứng âm thanh sống động, hiệu ứng hình ảnh tuyệt với và chơi cực mượt trên tất cả các dòng máy Android.
Nào, còn chờ gì nữa mọi người, hãy so tài cùng Pikachu New! ^.^', CAST(0x0000A6CD00E110B7 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/518-0-0-0--1/download/Pikachu-New.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (328, N'http://s.qplay.vn/515-0-0-0--1/game/Buoc-nhay-dia-nguc.html', 0, N'http://s.qplay.vn/images/product/icon/72260613-044241.png', N'Bước nhảy địa ngục', N'Điều huyền bí gì đang ẩn chứa sau 18 tầng địa ngục sâu thẳm, hãy cùng chạy thoát khỏi 18 tầng địa ngục. Với những quái thú nguy hiểm chết người, với những cạm bẫy đang ẩn chứa sau màn đêm đen tối của 18 tầng địa ngục. Hãy chạy,chạy và chạy, liệu bạn có thể thoát khỏi địa ngục kinh hoàng này không?
Game với phong cách đồ họa tuyệt đẹp, mang lại trải nghiệm thú vị cho người chơi. Giúp người chơi nhập vai hoàn toàn vào nhân vật và cùng chạy thoát khỏi 18 tầng địa ngục.
Cách chơi:
-Chạm vào nút mũi tên để thực hiện các thao tác : nhảy, cuộn, xoay.
-Sử dụng nút tấn công để tiêu diệt các quái vật cản đường.
-Hãy sử dụng shop để hỗ trợ tốt hơn cho bạn trong quá trình chơi.', CAST(0x0000A6CD00E110B8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/515-0-0-0--1/download/Buoc-nhay-dia-nguc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (329, N'http://s.qplay.vn/512-0-0-0--1/game/Bau-cua-ca.html', 0, N'http://s.qplay.vn/images/product/icon/72x72210613-093241.png', N'Bầu cua cá', N'Bầu tôm cua cá là một trò chơi dân gian rất hấp dẫn và phổ biến của người Việt. Nguồn gốc của nó khá huyền bí khi xoay quanh 6 linh vật may mắn của người xưa. Để chơi game bạn phải dựa vào cả may mắn lẫn chiến lược đặt cược mới có thể thắng cuộc.
Trở thành tỉ phú hoặc trắng tay trở về. Bạn có hứng thú chinh phục trò chơi cực kì hấp hẫn này không?
Cách chơi:
-Trên màn hình hiển thị 6 linh vật may mắn: Tôm, Cua, Cá, Gà, Bầu, Hươu.
-Người chơi sẽ đặt tiền vào một hoặc nhiều ô trên bàn chơi, sau đó nhà cái sẽ gieo 3 con xúc xắc (6 mặt xúc xắc tương ứng với 6 vật linh).
-Nếu 3 mặt xúc xắc được lật ra trùng với các ô mà người chơi đã chọn, người chơi sẽ được thưởng gấp đôi số tiền đã đặt.
-Điều quan trọng là phải tìm cho mình một chiến lược hợp lý để thắng được nhiều tiền nhất!', CAST(0x0000A6CD00E110B9 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/512-0-0-0--1/download/Bau-cua-ca.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (330, N'http://s.qplay.vn/503-0-0-0--1/game/Mong-tay-xinh.html', 0, N'http://s.qplay.vn/images/product/icon/icon_MTX72150613-105628.png', N'Móng tay xinh', N'Bảo Ngân là một cô gái yêu thích thời trang và đam mê thiết kế, sau một thời gian tích lũy tiền - tiết kiệm tiền cô đã có thể mở một tiệm sơn móng tay cho mình. Hãy cùng cô kiếm thật nhiều khách hàng và sơn móng tay thật đẹp để mang lại danh tiếng cho của tiện nhé!
Game với đồ họa đáng yêu - bắt mắt thích hợp với các bạn gái trẻ tuổi teen yêu thích thời trang và thiết kế.
Tựa game với cách chơi đơn giản những không kém phần thú vị này chắc hẳn sẽ khiến các bạn phải thốt lên trầm trồ với "Ôi ! Thật là đẹp .. Thật là hay!"
Hãy cùng trải nghiệm tựa game " Móng Tay Xinh" thú vị và đáng yêu này nhé!', CAST(0x0000A6CD00E110BA AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/503-0-0-0--1/download/Mong-tay-xinh.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (331, N'http://s.qplay.vn/3244-0-0-0--1/game/Game-kim-cuong-phieu-luu-cho-Android.html', 0, N'http://s.qplay.vn/images/product/icon/icon-kim-cuong-phieu-luu110615-085839.png', N'Game kim cương phiêu lưu cho Android', N'Game kim cương phiêu lưu cho Android - “Kim cương phiêu lưu” đã xây dựng lên 1 bản anh hùng ca hào hùng đầy sôi động về những cuộc chiến không  khoan nhượng giữa người anh hùng vĩ với quái thú trong truyền thuyết.', CAST(0x0000A6CD00E110BC AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/3244-0-0-0--1/download/Game-kim-cuong-phieu-luu-cho-Android.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (332, N'http://s.qplay.vn/495-0-0-0--1/game/Diet-sau-bo.html', 0, N'http://s.qplay.vn/images/product/icon/72060613-035614.png', N'Diệt sâu bọ', N'Kiến, sâu, nhện, châu chấu những loài côn trùng đáng ghét luôn tìm cách phá hoại cây trái, lại còn tha đồ ăn của chúng ta đi khắp mọi nơi. Đôi khi chúng làm bạn giật mình và cảm thấy sợ hãi vì những chiếc răng nhọn hoắt và những chiếc lông đầy gớm ghiếc của chúng. Nếu 1 ngày nào đó chúng bò đến nhà bạn thì sao nhỉ? Ôi chao !Hãy cứ tưởng tượng ra cảnh những con kiến chạy ngang chạy dọc để tìm kiếm thức ăn,rồi những con sâu thì háu đói, lúc nào cũng trực chạy thẳng đến vườn cây để ăn hết lá cây trong vườn. Những con nhện thì lại chạy chẳng theo quỹ đạo nào cả. Còn những con châu chấu thì cứ nhảy liên hồi, thật chẳng dễ dàng gì mà bắt được chúng !Vậy chẳng lẽ chịu thua chúng sao? Không !Đừng quá lo lắng bạn ơi ... Với bom và bình xịt côn trùng, chỉ cần 1 vài giây và khéo léo một chút chúng ta cũng sẽ tiêu diệt được hết chúng mà thôi. Nào hãy cùng mình, chúng ta cùng tiêu diệt chúng nhé. Sắn tay áo lên nào và cùng “Diệt sâu bọ” đuổi chúng ra khỏi nhà bạn và ghi được những số điểm thật bao để khoe với bạn bè của mình ^^
- Cách chơi:
+ Đập tất cả những loài côn trùng như: Kiến, sâu xanh, nhện, châu chấu, sâu róm, …
+ Tránh đập những loài như: chuồn chuồn – chúng sẽ trừ điểm của bạn, ong – chúng sẽ đốt bạn và làm bạn mất 1 mạng
+ Sử dụng vật phẩm: bom, bình xịt và hồi máu khi cần thiết nhé', CAST(0x0000A6CD00E110BE AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/495-0-0-0--1/download/Diet-sau-bo.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (333, N'http://s.qplay.vn/492-0-0-0--1/game/Dai-chien-tau-ngam.html', 0, N'http://s.qplay.vn/images/product/icon/72x72010613-102732.png', N'Đại chiến tàu ngầm', N'Tàu ngầm Hà Nội đang trên đường bảo vệ biển đảo của tổ quốc thì rơi vào vùng tập kích của quân địch, trên mặt biển là những chiếc tàu liên tục phóng boom xuống để tiêu diệt. Làm sao để tàu ngầm có thể tránh được mưa boom của kẻ thù? Giữ gìn toàn vẹn chủ quyền đất nước? Tất cả chỉ có thể dựa vảo khả năng điều khiển khéo léo của bạn mà thôi,  nào hãy tiến lên ^^.
Cáchchơi: 
-Bạn hãy điều khiển tàu ngầm bằng cần điều khiển ngay trong khoang lái của tàu
-Khéo léo tránh né bom đạn của kẻ thù thả xuống từ trên mặt biển
-Thu thập các thùng tiếp tế để nâng cấp tàu của bạn
-Tiêu diệt các tàu xâm lăng bằng ngư lôi để qua màn.', CAST(0x0000A6CD00E1114C AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/492-0-0-0--1/download/Dai-chien-tau-ngam.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (334, N'http://s.qplay.vn/490-0-0-0--1/game/Cong-chua-keo-ngot.html', 0, N'http://s.qplay.vn/images/product/icon/72300513-021832.png', N'Công chúa kẹo ngọt', N'Tại một lâu đài xa xa, nơi sản xuất kẹo ngọt dành cho cả thế giới, để làm ra những đồ ăn ngon tuyệt đó, các công chúa của lâu đài đang tìm ra những công thức mới, tuy nhiên 1 ngày kia, có những kẻ xấu xa từ vương quốc Quạ đen đã cho quân sang ám sát các nàng công chúa kẹo ngọt, cuộc trốn chạy bắt đầu, chúng đặt bẫy khắp nơi và tàn sát các nàng công chúa
Cách chơi:
-Khéo léo dùng tay di chuyển các nàng công chúa xinh đẹp sang trái hoặc phải hoặc nhấn vào để giải thoát.
-Hãy cẩn thận đừng để những tên đồ để tóm được, chúng đi rất đông vào theo sát ngay đằng sau và chỉ cần sơ hở chúng sẽ tóm được các nàng
-Bẫy chông nhọn đặt khắp nơi và bạn phải kịp thời đưa các nàng đi nếu không các nàng công chúa kẹo ngọt sẽ thiệt mạng
-Trò chơi được xây dựng từ dễ đến khó và từ chậm đến nhanh bạn cần hết sức lưu ý để giải cứu công chúa một cách nhanh chóng và khéo léo nhất
Tham gia ngay để giải cứu Công chúa kẹo ngọt', CAST(0x0000A6CD00E1114E AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/490-0-0-0--1/download/Cong-chua-keo-ngot.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (335, N'http://s.qplay.vn/3242-0-0-0--1/game/Ninja-Hero-2015---Game-phieu-luu-hay-nhat-2015.html', 0, N'http://s.qplay.vn/images/product/icon/72260514-091607-539275ae9074f-100270515-103734.png', N'Ninja Hero 2015 - Game phiêu lưu hay nhất 2015', N'Ninja Hero mang trong mình các yếu tố của 1 tựa game vừa lạ nhưng lại vừa quen . Người chơi có thể “ điên cuồng “ tiêu diệt các đối thủ trên đường đi bằng thao tác vuốt như Fruit Ninja', CAST(0x0000A6CD00E11150 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/3242-0-0-0--1/download/Ninja-Hero-2015---Game-phieu-luu-hay-nhat-2015.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (336, N'http://s.qplay.vn/484-0-0-0--1/game/Mario-vs-nguoi-tuyet.html', 0, N'http://s.qplay.vn/images/product/icon/72x72240513-045823.png', N'Mario vs người tuyết', N'Anh chàng thợ sửa ống nước Mario sau khi hoàn thành nhiệm vụ giải cứu vương quốc nấm đã tự thưởng cho mình một chuyến ” phượt ” dài ngày xuyên qua đỉnh Everest.  Sau chuyến du hành đầy kì thú qua vùng núi tuyết thì chàng Mario lại nghe tin tên rùa già Bowser đã bắt cóc công chúa Peach một lần nữa …
Trên đường về vương quốc nấm, chàng ta lại gặp thêm một kẻ địch mới. Đó là gã người tuyết Yeti.
Tên người tuyết ngốc nghếch này nhầm tưởng Mario với một món đồ chơi của gã nên tìm cách đuổi bắt Mario cho bằng được. Còn chàng thợ sửa ống nước của chúng ta thì đang mải lo lắng cho số phận của vương quốc nấm và chẳng có thời gian đôi co với gã nữa. Chàng ta chỉ còn cách chạy trốn thật nhanh mặc cho tên Yeti đuổi theo sau.
Nào, hãy cùng giúp chàng ta cắt đuôi gã người tuyết phiền phức này nhé !
Cách chơi:
-Nghiêng màn hình đề điều khiến hướng di chuyển của Mario.
-Cố gắng tránh né những vật cản như các tảng đá, lũ lợn rừng …
-Nhanh tay ăn những vật phẩm để tăng điểm, nhặt tuyết để ném tên yeti.
-Chạm vào màn hình để ném vào tên người tuyết ở phía sau, nhớ căn cho chính xác nhé.
-Trong những tình huống nguy hiểm, nhớ sử dụng những vật phẩm trong shop để hỗ trợ.
-Và cuối cùng là. Let’s Go!', CAST(0x0000A6CD00E11152 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/484-0-0-0--1/download/Mario-vs-nguoi-tuyet.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (337, N'http://s.qplay.vn/478-0-0-0--1/game/Bao-ve-bien-dao.html', 0, N'http://s.qplay.vn/images/product/icon/72160513-091039.png', N'Bảo vệ biển đảo', N'Chắc hẳn ai trong chúng ta cũng đã từng mê mẩn bắn phá hàng giờ liền với tựa game Beachhead danh tiếng của Digital Fusion Inc. Cảm giác hồi hộp đến thót tim khi hàng trăm quân lính với đầy đủ trang thiết bị và đội quân cơ giới tối tân cùng đổ bộ xuống mảnh đất nhỏ bé mà bạn đang cố thủ, mưu đồ một lần quét sạch những gì trước mặt. Và bạn, với duy nhất một họng súng, quá trình xả đạn càn quét và tính toán tiêu diệt kẻ địch đầy hưng phấn bắt đầu …
Không ngủ quên bởi cái bóng của quá khứ. Tựa game từng gây nghiện hàng triệu người trên thế giới này đã quay trở lại với một diện mạo hoàn toàn mới.
“ Bảo vệ biển đảo “ – thuộc dòng game cố thủ cứ điểm rất lôi cuốn. Đây là phiên bản nâng cấp của Beachhead không chỉ với nhiều cải tiến về âm thanh, đồ họa mà còn khéo léo sắp đặt bối cảnh vào những tình huống hết nhạy cảm khi sóng gió ở Biển Đông mỗi lúc một phức tạp.
Lấy cảm hứng từ những chiến sĩ  anh dũng nơi biển đảo, những người luôn phải nắm chắc tay súng bảo vệ từng mảnh đất của tổ quốc. Người chơi sẽ sử dụng những thứ vũ khí tối tân như súng máy, đại pháo, tên lửa đề chống lại tham vọng bành trướng của các thế lực ngoại xâm. Và không phải cứ nhấp bắn điên cuồng là có thể giành được thắng lơi, chúng ta phải tính toán những chiến thuật hợp lý cho từng loại quân địch. Việc này không quá khó khăn nhưng chắc chắn sẽ đem lại cho chúng ta những giây phút tiêu diệt kẻ địch và nếm trải vinh quang thắng lợi hưng phấn nhất.
Hãy theo chân các chiến sĩ hải quân vùng biển đảo, cùng góp sức mình hoàn thành nhiệm vụ đẩy lùi các thế lực ngoại xâm hùng mạnh đang lăm le xâm phạm mảnh đất thiêng liêng của tổ quốc nhé.', CAST(0x0000A6CD00E11154 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/478-0-0-0--1/download/Bao-ve-bien-dao.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (338, N'http://s.qplay.vn/467-0-0-0--1/game/Audition.html', 0, N'http://s.qplay.vn/images/product/icon/icon_72_270413-091849.png', N'Audition', N'Chắc hẳn các bạn không còn lạ lẫm với tựa game Audition - tựa game đình đám cho giới trẻ phải không nào ? Vâng !! Tựa game xu thế đậm chất cool và trẻ trung của giới trẻ khắp 5 châu. Hòa mình vào trong game với nhiều nhân vật, các phong cách thời trang lạ, mới mẻ, bắt mắt không kém phần cuốn hút bởi những điệu nhảy bài nhảy cùng âm thanh âm nhạc hiện đại và siêu hot hiện nay. Phiên bản game với đồ họa xuất sắc, chất lượng âm thanh rõ ràng chi tiết nhưng không hề yêu cầu cao về cấu hình của các thiết bị Android hiện nay.
Cách chơi: 
- Game không yêu cầu quá nhiều
- Thao tác. Đáp ứng những mặt tích cực về thao tác đơngiản - dễ hiểu. Nắm bắt được những điểm ưu về cách điều khiển của game Audition Online trên PC
Nào hãy hòa mình vào những điệu nhảy với game Audition.', CAST(0x0000A6CD00E11156 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/467-0-0-0--1/download/Audition.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (339, N'http://s.qplay.vn/462-0-0-0--1/game/Songoku---Than-rong-tro-lai.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72250413-052813.png', N'Songoku - Thần rồng trở lại', N'Bắt nguồn từ cốt truyện 7 viên ngọc rồng đã từng làm mưa làm gió ở thị trường truyện tranh Việt Nam nay đã được chuyển thể sang game mobile. Nhiệm vụ sủa bạn là giúp sogoku tìm được đủ 7 viên ngọc rồng để thực hiện nhiệm vụ cứu giúp nhân loại bằng cách bạn phải liên tục nhảy lên cao để tìm kiếm những điều thần bí ở trên đó . Không chỉ có Sogoku mà bạn còn được gặp lại các nhân vật ban đầu là kẻ thù của sogoku nhưng sau trở thành bạn và cùng chung tay bảo vệ trái đất tươi đẹp đó là Picolo + karrik + ma bư kòm….Các đối thủ đó thực sự là thử thách của goku trước khi ăn lấy được các viên ngọc thần .
- Trên đường tìm đủ 7 viên ngọc vô cùng nguy hiểm do đó bạn hãy chuẩn bị thật nhiều máu + vòng bảo vệ ….. trong cửa hàng để giúp Sogoku vượt qua tất cả nguy hiểm đó để thực hiện nhiệm vụ cứu giúp nhân loại . 
- Với Hệ Thống Bản Đồ rộng lớn Sogoku - Rồng thần trở lại  dẫn dắt người chơi vào những cuộc phiêu lưu kỳ thú, buộc người chơi phải trổ hết tài khéo léo thì mới tìm được đủ 7 viên ngọc .
Còn chần chờ gì nữa , các bạn hãy nhanh tay tải game tham gia vào hành trình tìm ngọc rồng cùng Sogoku .', CAST(0x0000A6CD00E11157 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/462-0-0-0--1/download/Songoku---Than-rong-tro-lai.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (340, N'http://s.qplay.vn/457-0-0-0--1/game/Loan-12-su-quan.html', 0, N'http://s.qplay.vn/images/product/icon/Icon_72x72180413-095719.png', N'Loạn 12 sứ quân', N'Bạn đã bao giờ nghĩ mình sẽ trở thành 1 vị tướng tài ba chống lại các đợt xâm lăng của quân địch?
Bạn có muốn trải nghiệm game chiến thuật?
Bạn có muốn trải nghiệm game phòng thủ?
Tất cả những điều bạn muốn sẽ hội tụ đủ và tuyệt vời trong game Loạn 12 sứ quân.
- Game hiện tại là game tower defense đầu tiên của Việt Nam, sử dụng hiệu ứng hình ảnh âm thanh sống động, gameplay tuyệt vời sẽ mang lại cho các bạn cảm giác chiến trường, thủ thành tốt nhất trong thời điểm hiện tại.
- Hệ thống map chơi đa dạng, phong phú, hệ thống tower hấp dẫn, tính năng đặc biệt sẽ giúp bạn đẩy luu quân thù, dù là những kẻ mạnh mẽ nhất.
Hãy theo chân Đinh Bộ Lĩnh thống nhất quốc gia, đẩy lùi giặc ngoại xâm, tấn công các thành trì nổi tiếng, bạn sẽ thấy mình như trở thành nhà lãnh đạo tuyệt vời, dẫn dắt cả quân đội đi lên hùng mạnh.
Bạn còn chần chờ gì nữa  …. Hãy nhanh tay tải game để trải nghiệm những giây phút tuyệt vời cùng Loạn 12 sứ quân .', CAST(0x0000A6CD00E11158 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/457-0-0-0--1/download/Loan-12-su-quan.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (341, N'http://s.qplay.vn/455-0-0-0--1/game/Cam-bay.html', 0, N'http://s.qplay.vn/images/product/icon/Icon_mroop72x72180413-094030.png', N'Cạm bẫy', N'Chú bé loắt choắt, cái xắc xinh xinh, cái chân thoăn thoắt, cái đầu nghênh nghênh. Chắc hẳn không ai trong chúng ta là không biết đến chú bé đưa thư anh hùng Lượm ngày ngày phải vượt qua những làn mưa bom bão đạn để chuyển những bức thư tuyệt mật. Nhiệm vụ thật cao cả nhưng cực kỳ khó khăn và ẩn chứa muôn vàn hiểm họa mà không phải ai cũng dám nhận
Lấy cốt truyện về 1 người anh hùng của dân tộc, qplay đã phát triển thành 1 game nhập vai đầy hấp dẫn. Trong đó bạn sẽ vào vai chú bé đưa thư anh hùng ngày nào và  thể hiện sự tinh tường và thông minh của để mình vượt qua những thử thách, những cạm bẫy đầy nguy hiểm để đưa những bức thư cực kỳ tuyệt mật về những nơi ngày đêm cần đến nó
Cách chơi:
- Điều khiển nhân vật tránh khỏi những vũ khí tấn công từ các hướng
- Sử dụng khiên đúng lúc để trở nên bất tử khi ở những tình huống ngàn cân treo sợi tóc
- Có 2 kiểu chơi: chơi theo từng màn và chơi không giới hạn độ khó  để bạn lựa chọn', CAST(0x0000A6CD00E1115A AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/455-0-0-0--1/download/Cam-bay.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (342, N'http://s.qplay.vn/449-0-0-0--1/game/Ban-trollface.html', 0, N'http://s.qplay.vn/images/product/icon/72120413-051912.png', N'Bắn trollface', N'Soi đi, kĩ vào, mau soi đê….. Gruuuuhahhaaaaa.
Siêu bựa, siêu quậy, những chú Troll thật đáng ghét cứ lượn lờ quanh khu vực chúng ta đang sống, những chú troll liên tục trêu tức chúng ta, vì thế với khẩu súng bắn tỉa, hãy cùng nhau tiêu diệt!!!!!
Sở hữu những màn chơi độc đáo với đồ họa bắt mắt, âm thanh cực chất Bắn Troll là một trải nghiệm cực kì thú vị với thể loại bắn súng đẳng cấp.
Cách chơi:
-Vào game bạn sẽ chạm lên màn hình để bắn vào đầu những chú Troll.
-Bạn phải bắn hết tất cả những chú Troll đang ẩn nấp trên màn hình để qua bài.
-Bạn sẽ có 2 sự trợ giúp để tìm ra được chú Troll nào đang ẩn nấp trên màn hình.
-Sẽ có 7 màn chơi vô cùng thú vị với các siêu cấp độ cho bạn trải nghiệm.
Thả phanh và thể hiện đẳng cấp nào!!!  Này thì nấp nè……… Đoàng đoàng. ^.^', CAST(0x0000A6CD00E1115B AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/449-0-0-0--1/download/Ban-trollface.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (343, N'http://s.qplay.vn/442-0-0-0--1/game/Nha-hang-vui-ve.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72x72040413-094824.png', N'Nhà hàng vui vẻ', N'Bạn có bao giờ từng nghĩ mình sẽ làm một ông chủ hay bà chủ của một tiệm ăn chưa. Vâng với Nhà hàng vui vẻ bạn có thể sẽ thực hiện được ước mơ đó.
Cách chơi :
- Nhẹ nhàng thú vị
- Thực hiện các món ăn và đưa thật nhanh đến các vị khác
- Đồ họa đẹp, nét , âm thanh sống động.
Còn đợi gì nữa mau mau tải nào', CAST(0x0000A6CD00E111EC AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/442-0-0-0--1/download/Nha-hang-vui-ve.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (344, N'http://s.qplay.vn/417-0-0-0--1/game/Dua-phi-thuyen.html', 0, N'http://s.qplay.vn/images/product/icon/72 (1)140313-022517.png', N'Đua phi thuyền', N'Chiếc phi cơ đang lao vun vút trên đường đua,tốc độ khiến người theo dõi phải sợ hãi và nể phục.
Năm 2230,những người sao hỏa đến thăm trái đất,với những tiến bộ khoa học vượt bậc,họ đã chế tạo ra những chiếc phi cơ nhỏ gọn dùng chở người đi lại và những chiếc phi cơ đó còn có thể dùng vào bộ môn đua xe,khi những chiếc ô tô đã chở nên quá cổ,con người tiến vào thử thách mới:đua phi thuyền.
Những chiếc phi thuyền tốc độ cao đến chóng mặt,những con đường với vòng cua kinh điển,những ổ voi khổng lồ đang đợi chúng ta vượt qua.
Cảnh báo với những ai sợ tốc độ cao,không nên chơi,vì trò chơi diễn ra chóng mặt,với những đoạn cua ngoằn nghèo có thể khiến chúng ta hưng phấn,nhưng cũng có thể khiến chúng ta hoa mắt.
Phải thật vững tay với tinh thần tốt để có thể chinh phục được tốc độ cao này....', CAST(0x0000A6CD00E111F0 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/417-0-0-0--1/download/Dua-phi-thuyen.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (345, N'http://s.qplay.vn/413-0-0-0--1/game/Ech-ban-bong.html', 0, N'http://s.qplay.vn/images/product/icon/zuma_72100313-023905.png', N'Ếch bắn bóng', N'Ếch bắn bóng là trò chơi của người chơi vô cùng thú vị và hấp dẫn do Qplay sản xuất. với cốt
truyện dựa trên một trò chơi của người maya cổ đại sẽ đem đến cho quý vị rất nhiều điều thần bí trong
game.Hãy chuẩn bị thật nhiều mạng và bom trong cửa hàng để giúp chú ếch vượt qua tất cả những nguy hiểm
đang rình rập ….Người chơi phải xoay chú ếch ở tâm màn hình để bắn các quả bóng ngậm ở trong miệng và chuỗi bóng đang không ngừng tiến về cửa nguy hiểm.Bắn được 3 hay nhiều hơn bóng cùng màu chúng sẽ tự động biến mất.Để chơi tốt Game bạn cần phải thật khéo léo và tập trung trong từng lần nhả bóng . Hãy chú ý đến
sự xuât hiện của đồng xu thi thoảng hiện lên ở các góc màn hình vì biết đâu bạn lại nhận được một
phần thưởng rất bất ngờ.Bảng xếp hạng những người chơi giỏi nhất sẽ là nơi bạn tranh tài với các game thủ thông qua số điểm cao thu được sau mỗi màn chơi. Đặc biệt những Game thủ có điểm cao nhất trong tháng sẽ nhận
được nhiều phần quà thú vị từ nhà phát triển Qplay.Với Đồ họa đẹp mắt + nhiều map chơi hấp dẫn sẽ đem lại cho người chơi một cảm giác chơi game thú vị . Bạn còn chần chờ gì nữa …. Hãy nhanh tay tải game để thử tài săn bắn của bạn .', CAST(0x0000A6CD00E111F3 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/413-0-0-0--1/download/Ech-ban-bong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (346, N'http://s.qplay.vn/404-0-0-0--1/game/Doraemon-va-bao-boi-than-ki.html', 0, N'http://s.qplay.vn/images/product/icon/doraemon-72030313-032637.png', N'Doraemon và bảo bối thần kì', N'Xin chào các bạn Việt Nam thân yêu, tớ là Doremon chú mèo máy thông minh. Được sinh ra từ cuốn tranh nổi tiếng cùng tên, từ năm 1969 đến nay tớ đã đồng hành khắp nơi cùng với tất cả các bạn, không chỉ thiếu nhi mà còn cả những anh chị, cô chú, các bác .... Trong chuyến phưu lưu lần này tớ và những người bạn Nobita, Chaien, Xuka, Xeko.. đã đến một hòn đảo xinh đẹp để truy tìm những bảo bối và kho báu thần kỳ. Các bạn có sẵn lòng tham gia cùng bọn tớ không?
Cách chơi
-Nhìn đơn giản nhưng rất khó khăn đó. Hãy cùng tớ lênh đênh trên chiếc thuyền và khám phá kho báu tại biển sau.
-Hãy thả sợi đây một cách từ từ cho đến khi tới đáy đại dương, các bạn có thể bấm liên tục để thả sợi câu nhanh hơn. 
-Nghiêng máy để kéo sợi dây câu và thu thập tất cả những bí ẩn sâu trong lòng đại dương.
-Hãy dùng tiền và xu vàng kiếm được để nâng cấp tất cả những dụng cụ hỗ trợ trong chuyến phưu lưu lần này.
-Sau mỗi một lần khám phá đại dương các bạn sẽ thu nhập về những điều kỳ diệu đó.
Nào sẵn sàng lên đường cùng chúng tớ ngay nhé!!', CAST(0x0000A6CD00E111F5 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/404-0-0-0--1/download/Doraemon-va-bao-boi-than-ki.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (347, N'http://s.qplay.vn/395-0-0-0--1/ung-dung/Nhac-chuong-doc.html', 0, N'http://s.qplay.vn/images/product/icon/72x72230213-022305.png', N'Nhạc chuộng độc', N'Vào ứng dụng là bạn được tham gia vào một thế giới với một thư viện hàng triệu bài hát, nóng hổi từng ngày.Với một list danh sách các bài hát khổng lồ và đa dạng về nội dung, đủ thể loại cho bạn thưởng thức.Với ứng dụng nhạc chuông này các bạn có thể nghe trực tiếp những bài hát để xem bài đó mình có thích không để tải về làm nhạc chờ, nhạc chuông cho riêng máy của mình mà không sợ khi tải về nó không được như ý muốn của mình.', CAST(0x0000A6CD00E111F8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/395-0-0-0--1/download/Nhac-chuong-doc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (348, N'http://s.qplay.vn/388-0-0-0--1/game/Lat-anh-2.html', 0, N'http://s.qplay.vn/images/product/icon/icon72070213-082000.png', N'Lật ảnh 2', N'Nếu bạn là fan của nhưng game trí tuệ thì không nên bỏ qua game Lật Ảnh 2 này, một tựa game thử tài trí nhớ vô cùng thú vị cùng với hệ thống đồ họa âm thanh sống động.
Cách chơi:
- Chúng ta cùng đi tìm những cặp ảnh ngộ nghĩnh đang được dấu dưới màn chơi, nhiệm vụ của bạn là tìm và lật lên những hình giống nhau.
- Tại mỗi cửa, bạn sẽ gặp những thử thách rất thú vị.
- Rất nhiều điều hấp dẫn khác đang chờ bạn trong những màn chơi.', CAST(0x0000A6CD00E111FA AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/388-0-0-0--1/download/Lat-anh-2.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (349, N'http://s.qplay.vn/386-0-0-0--1/game/Gach-chien.html', 0, N'http://s.qplay.vn/images/product/icon/akanoid_icon72070213-022902.png', N'Gạch chiến', N'Một tựa game kinh điển của những thập niên về trước , nay với công nghệ hiện đại , game “ Phá gạch “ đã trở lại và lợi hại gấp đôi!!
Con người ta khi thời gian trôi qua thì thường có ý nghĩ hoài cổ , muốn quay lại tuổi thơ.Vậy thì tại sao khi chúng tôi đang phát miễn phí cho bạn một tấm vé để trở về tuổi thơ, khi mà bạn bè anh em giành nhau chiếc tay cầm để phá gạch thì các bạn lại có thể bỏ lỡ được nhỉ???
Vẫn là quả bóng và thanh đỡ , nhưng bây giờ hình ảnh đã được chau truốt , mượt mà hơn , sống động hơn. Chơi “ Phá gạch “ sẽ đem lại cho bạn cảm giác như ngày xưa , dịch chuyển thanh đỡ để đẩy quả bóng sắt và phá vỡ những bức tường gạch. 
Cách chơi : 
- Di chuyển thanh đỡ để không cho trái bóng sắt rơi xuống
- Ăn các vật phẩm hỗ trợ để tăng them khả năng ghi điểm và sống sót', CAST(0x0000A6CD00E111FD AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/386-0-0-0--1/download/Gach-chien.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (350, N'http://s.qplay.vn/381-0-0-0--1/game/Mario-gia-rua.html', 0, N'http://s.qplay.vn/images/product/icon/Icon-72070213-100827.png', N'Mario giã rùa', N'Mario tựa game quá nổi tiếng đi vào lòng mọi người Việt Nam chúng ta. Hãy thưởng thước phiên bản "Mario giã rùa" để quay lại tuổi thơ yêu quý nhé.
Mau mau tải thôi nào.', CAST(0x0000A6CD00E111FE AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/381-0-0-0--1/download/Mario-gia-rua.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (351, N'http://s.qplay.vn/377-0-0-0--1/game/Karateka.html', 0, N'http://s.qplay.vn/images/product/icon/icon72060213-042827.png', N'Karateka', N'Karateka môn võ cổ truyền của người Nhật. Bạn có biết nó chứ ??? . Bạn có muốn hóa thân thành 1 võ sỹ Karateka dũng mãnh không. Hãy mau mau tải game để biết nhé.
Cách chơi :
- Nhập thân vào võ sỹ Karate dũng mãnh
- Tấn công kẻ thù bằng các chiêu thức dũng mãnh
- Đồ họa game rất đẹp và hoàn hảo', CAST(0x0000A6CD00E111FF AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/377-0-0-0--1/download/Karateka.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (352, N'http://s.qplay.vn/371-0-0-0--1/game/Xep-hinh-dich-chuyen.html', 0, N'http://s.qplay.vn/images/product/icon/xephinh-72x72050213-050955.png', N'Xếp hình dịch chuyển', N'Xếp hình dịch chuyển một thể loại xếp hình ngược đặc sắc thú vị. Bạn có từng nghĩ chơi xếp hình ngược chơi. Nếu chưa thì mau mau tải nào :
Cách chơi :
- Các khối hình được di chuyển từ dưới lên trên
- Màu sắc trong game được bố trì hài hòa đẹp mắt.
- Hãy đạt những điểm số cao nhất để khoe với bạn bè nhé.', CAST(0x0000A6CD00E11201 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/371-0-0-0--1/download/Xep-hinh-dich-chuyen.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (353, N'http://s.qplay.vn/366-0-0-0--1/game/Rambo-lun-2.html', 0, N'http://s.qplay.vn/images/product/icon/72010213-023850.png', N'Rambo lùn 2', N'Rambo lùn 2 trò chơi hành động bắn súng rất nổi tiếng 1 thời khi tham gia vào trò chơi,chúng ta sẽ được trải nghiệm trò chơi với tiết tấu nhanh và yếu tố hài hước vui nhộn không lẫn vào đâu được rất phù hợp cho mục đích giải trí sau một ngày mệt mỏi học tập và làm việc.', CAST(0x0000A6CD00E1128D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/366-0-0-0--1/download/Rambo-lun-2.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (354, N'http://s.qplay.vn/351-0-0-0--1/game/Xeng-hoa-qua.html', 0, N'http://s.qplay.vn/images/product/icon/icon-new72250113-104823.png', N'Xèng hoa quả', N'Xèng hoa quả hay còn gọi là điện tự xèng, slot machine là trò chơi cá cược may rủi cực kì phổ biến trong các casino lớn nhỏ. Với các yếu tố đơn giản, dễ chơi, game đã thu hút được hàng triệu người dùng khắp nơi trên thế giới ngay cả đối với những khách hàng khó tính nhất.
Qplay xin giới thiệu các bạn game Xèng hoa quả – Slot machine mô phỏng lại tương tác giữa người chơi và máy điện tử xèng. Với đồ họa đẹp mắt, âm thanh sống động và gameplay đơn giản, Xèng hoa quả sẽ chinh phục bạn ngay từ cái nhìn đầu tiên. Còn chần chừ gì nữa, hãy chơi và trải nghiệm.', CAST(0x0000A6CD00E11290 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/351-0-0-0--1/download/Xeng-hoa-qua.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (356, N'http://s.qplay.vn/343-0-0-0--1/game/Cao-thu-ban-vit.html', 0, N'http://s.qplay.vn/images/product/icon/Icon_72x72210113-085538.png', N'Cao thủ bắn vịt', N'Săn bắn là môn thể thao cực kỳ hấp dẫn và lý thú với rất nhiều thử thách và hào hứng lôi cuốn khác nhau. Nay tất cả các cảm xúc đó đều được hội tụ trong game mobile “ cao thủ bắn vịt “ do  Qplay sản xuất. Game được bầu chọn  là trò chơi săn bắn số 1 trên di động hiện nay .
- Hãy chuẩn bị đạn dược thật nhiều trong Shop cùng với Kho vũ khí đi săn đồ sộ để bách phát bách trúng 
- Hệ thống vịt bay đa dạng và những nguy hiểm rình rập bất ngờ sẽ đem đến cho người chơi một cảm nhận thực thụ của một cuộc đi săn. 
- Để chơi tốt Game bạn cần phải thật khéo léo và tập trung trong từng phát ngắm bắn. Hãy chú ý đến những túi ngôi sao sáng thi thoảng bay vượt qua màn hình nhé vì biết đâu bạn lại nhận được một phần thưởng rất bất ngờ.
- Bảng xếp hạng những tay thiện xạ là nơi bạn tranh tài với các game thủ thông qua số điểm cao thu được sau mỗi màn chơi. Đặc biệt những Game thủ có điểm cao nhất trong tháng sẽ nhận được nhiều phần quà thú vị từ nhà phát triển Qplay.
- Với Đồ họa đẹp mắt + nhiều map chơi hấp dẫn cùng  kho vũ khí đi săn tối tân sẽ đem lại cho người chơi một cảm giác đi săn thực thụ . Bạn còn chần chờ gì nữa  …. Hãy nhanh tay tải game để thử tài săn bắn của bạn.', CAST(0x0000A6CD00E112A5 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/343-0-0-0--1/download/Cao-thu-ban-vit.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (357, N'http://s.qplay.vn/332-0-0-0--1/ung-dung/Sms-loi-chuc-tet.html', 0, N'http://s.qplay.vn/images/product/icon/72-a110113-114933.png', N'Sms lời chúc tết', N'Ứng dụng gửi tin nhắn hình ký tự và các lời chúc mừng năm mới ý nghĩa tới bạn bè và người thân.
Được xây dựng nội dung theo chủ đề tết cổ truyền, chắc chắn sẽ làm bạn hài lòng.
- Gửi tin nhắn qua trình gửi tin của điện thoại
- Hỗ trợ cả tin nhắn có dấu và không dấu
- Rất nhiều hình ký tự đặc sắc và ý nghĩa.
- Hỗ trợ copy tin nhắn, gửi tin nhắn qua yahoo ....
- Có chế độ tạo tin nhắn, ưa thích , lịch sử tin nhắn đã gửi.
Chúc bạn một năm may mắn, vạn sự như ý !', CAST(0x0000A6CD00E112A8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/332-0-0-0--1/download/Sms-loi-chuc-tet.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (358, N'http://s.qplay.vn/324-0-0-0--1/game/Ngu-qua-ngay-tet.html', 0, N'http://s.qplay.vn/images/product/icon/72070113-031724.png', N'Ngũ quả ngày tết', N'"Nghe xuân sang thấy trong lòng xốn xang..."
Nghe câu hát này lòng ta lại thấy nôn nao , không khí tết đang tràn về trên từng ngõ phố , từng con đường.
Ngày xuân Long Phụng sum vầy
Ngũ quả ngày tết , vui vầy bên nhau
Vâng , nói đến không khí tết thì lại không thể không nhắc tới bánh chưng bánh dầy , cây nêu , mâm ngũ quả.
Game : " Ngũ quả ngày tết " mang đến cho bạn không khí tết thật chân thật và mãnh liệt.
Cách chơi : - Chém những trái cây trong mâm ngũ quả để chào đón xuân về!', CAST(0x0000A6CD00E112A9 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/324-0-0-0--1/download/Ngu-qua-ngay-tet.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (359, N'http://s.qplay.vn/315-0-0-0--1/game/San-ga-tay.html', 0, N'http://s.qplay.vn/images/product/icon/aaaaaa030113-114022.png', N'Săn gà tây', N'Trong khu rừng nhỏ của vương quốc Qpaly , bạo chúa Chajo có một đàn gà tây rất lớn.
Vào mùa đông năm ấy , thực vật không sống nổi , mọi người lâm vào một nguy cơ rất lớn đó là thiếu thức ăn dự trữ mùa đông.
Họ đến gặp Chajo nhưng không thể thỏa hiệp được với hắn ta.
Khi mọi người đang âu sầu lo lắng thì Sponge đi ra , anh nói mình sẽ kiếm thức ăn cho mọi người.
Sau đó một người một súng lên đường tới khu rừng của bạo chúa kia.
Các bạn có đoán ra Sponge sẽ làm gì không? Vâng , anh ấy đi săn gà tây của bạo chúa Chajo', CAST(0x0000A6CD00E112AB AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/315-0-0-0--1/download/San-ga-tay.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (360, N'http://s.qplay.vn/305-0-0-0--1/game/Olympic.html', 0, N'http://s.qplay.vn/images/product/icon/72291212-103710.png', N'Olympic', N'Olympic  thế vận hội hàng đầu của thế giới hàng năm luôn luôn đem lại sự phấn khích của những viện động viên. Bạn có phải là 1 vận động viên suất sắc không, nếu phải thì tham gia ngay đi nhé.
Cách chơi:
- Tham gia vào các môn thể thao
- Đồ họa ngộ ngĩnh
Còn đợi gì nữa mau mau tham gia đi nào', CAST(0x0000A6CD00E112AD AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/305-0-0-0--1/download/Olympic.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (361, N'http://s.qplay.vn/290-0-0-0--1/game/Thap-tu-chinh.html', 0, N'http://s.qplay.vn/images/product/icon/72181212-111919.png', N'Thập tự chinh', N'Những cuộc chiến thời trung cổ ở Châu Âu có lẽ vẫn còn hơi xa lạ với các bạn. Hãy cùng chúng tôi nhập vai vào một chiến lược gia thời đó. Với chiến thuật của riêng bạn, hãy tấn công và tiêu diệt những kẻ xâm lăng.
Cách chơi:
+ Dùng nỏ để bắn vào lính hoặc thành của địch
+ Chiến thắng bằng cách cho lính của bạn ra cướp cờ đưa về thành mình hoặc phá hủy thành của địch
+ Có hệ thống nâng cấp theo chiến thuật của riêng bạn', CAST(0x0000A6CD00E112AE AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/290-0-0-0--1/download/Thap-tu-chinh.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (362, N'http://s.qplay.vn/289-0-0-0--1/ung-dung/Chup-anh-Han-Quoc.html', 0, N'http://s.qplay.vn/images/product/icon/icon72181212-095843.png', N'Chụp ảnh Hàn Quốc', N'Một ứng dụng không thể thiếu đối với các bạn thích chụp ảnh, thích trang hoàng với các bức ảnh của mình. Với "Chụp ảnh Hàn Quốc" bạn có thể biến hóa những bức ảnh của mình bạn bè và người thân 1 cách rất thú vị và đặc sắc.
Chức năng :
- Rất nhiều hiệu ứng đẹp lạ mắt.
- Cách sử dụng dễ dàng thuận tiện
Còn đợi gì nữa mau mau tải nào', CAST(0x0000A6CD00E112B1 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/289-0-0-0--1/download/Chup-anh-Han-Quoc.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (363, N'http://s.qplay.vn/267-0-0-0--1/game/Ninja-doc-hanh.html', 0, N'http://s.qplay.vn/images/product/icon/72071212-111422.png', N'Ninja độc hành', N'Truyền thuyết kể rằng, thời xa xưa, khi mà thế lực đen tối bành trướng thế giới. Tận cùng tuyệt vọng, có một vị ninja đã một mình đứng lên chống lại. Với khả năng phi thường của mình, anh ta đã đẩy lùi thế lực đen tối, đem lại hòa bình cho thế giới.
Cách chơi:
-Nhập vai vào chàng ninja để vượt qua các chướng ngại vật
-Sử dụng các vật dụng nhặt được để tiêu diệt kẻ thù
-Đồ họa đẹp và âm thanh hấp dẫn
Nào! Hãy hóa thân thành siêu ninja để chiến đấu chống lại thế lực đen tối và đem lại hòa bình cho thế giới nhé.', CAST(0x0000A6CD00E1133D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/267-0-0-0--1/download/Ninja-doc-hanh.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (364, N'http://s.qplay.vn/260-0-0-0--1/game/Xep-hinh.html', 0, N'http://s.qplay.vn/images/product/icon/icon-72x72031212-031716.png', N'Xếp hình', N'Phiên bản xếp hình nổi tiếng Tetris nay đã có trên Android.Cách chơi quen thuộc với đồ họa được thiết kế lại một cách rất đẹp mắt', CAST(0x0000A6CD00E11340 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/260-0-0-0--1/download/Xep-hinh.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (365, N'http://s.qplay.vn/107-0-0-0--1/game/Xep-bai-(Solitaire).html', 0, N'http://s.qplay.vn/images/product/icon/72090812-061726.png', N'Xếp bài (Solitaire)', N'Game Xếp bài kinh điểm trên PC giờ đã có trên chiếc Mobile của bạn.', CAST(0x0000A6CD00E11342 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/107-0-0-0--1/download/Xep-bai-(Solitaire).html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (366, N'http://s.qplay.vn/121-0-0-0--1/game/Funny-penalty.html', 0, N'http://s.qplay.vn/images/product/icon/72X72240812-053003.png', N'Funny penalty', N'Chém gió cùng Anh Tạ Biên Cương, Hãy chơi và ăn mừng bàn thắng theo cách của Balotelli', CAST(0x0000A6CD00E11344 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/121-0-0-0--1/download/Funny-penalty.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (367, N'http://s.qplay.vn/241-0-0-0--1/game/Cuop-bien-Caribe.html', 0, N'http://s.qplay.vn/images/product/icon/battleship_72201112-051138.png', N'Cướp biển Caribe', N'Một cuộc chiến ác liệt đã diễn ra giữa 1 nhóm người ngoài hành tinh có tên The Regents và nhóm người trái đất, Game được chuyển thể lên Android viết theo nội dung của game của hãng Milton Bradley. Với nhiều tình tiết hấp dẫn những pha chiến đấu kinh hoàng sẽ mang tới cho các bạn 1 cảm giác hồi hộp. 
Cách chơi :
- Mới lạ đem lại các trận chiến tuyệt vời trên biển
- Hệ thống đồ đạc + nhiệm vụ phong phú
- Hình ảnh + âm thanh được thiết kế sống động.
Còn đợi gì nữa mau mau tải đi nào....', CAST(0x0000A6CD00E11346 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/241-0-0-0--1/download/Cuop-bien-Caribe.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (368, N'http://s.qplay.vn/49-0-0-0--1/game/BOOM.html', 0, N'http://s.qplay.vn/images/product/icon/fd64b43da0icon 72.png', N'BOOM', N'Game BOOM nước với hình ảnh rực rỡ và âm thanh sống động nay đã có mặt trên Android.', CAST(0x0000A6CD00E11347 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/49-0-0-0--1/download/BOOM.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (369, N'http://s.qplay.vn/234-0-0-0--1/game/Naruto.html', 0, N'http://s.qplay.vn/images/product/icon/72151112-023924.png', N'Naruto', N'Ngày xửa ngày xưa , vào thời đại mà thế giới được phân tranh bởi vài quốc gia lớn , thời đại hoàng kim của các ninja , tại Hỏa Quốc , trong một ngôi làng tên là làng “ Lá “ có một cậu bé đặc biệt ra đời.
Cha của cậu bé là người đứng đầu của làng “ Lá “ , biệt danh là Yondaime , là Hokage đệ tứ!!
Vào đêm mà cậu sinh ra , làng “ Lá “ bị một kẻ bí mật có tên là Obito tấn công , hắn đã triệu hồi Cửu Vĩ Hồ Ly “ Kurama “ để phá hoại làng “ Lá “.
Với bản lĩnh tối cường , Yondaime đã thành công trong việc đánh bại Cửu Vỹ Hồ Ly nhưng cái giá phải trả quá lớn. Ông đã phong ấn con hồ ly chín đuôi vào cơ thể của đứa con trai mới chào đời.
Đó là món quà đầy quyền năng nhưng cũng đầy ác nghiệt , cậu bé lớn lên bị các đứa trẻ khác xa lánh , tuy nhiên , có một đội ninja , đội 7 đã chấp nhận cậu , và người bạn thân nhất cũng là người cậu bé muốn vượt qua nhất đó là Sasuke của gia tộc Uchiha
Vì theo đuổi mục đích báo thù , Sasuke bị dụ dỗ đứng về phía cái ác. Không muốn bạn mình lún sâu thêm , Naruto quyết định xông vào hang ổ kẻ địch , mang cậu bạn quay lại với ánh sáng!
Cách chơi : 
- Lựa chọn các vũ khí
- Xông  pha vào hang ổ kẻ địch
- Lướt trên màn hình để chém', CAST(0x0000A6CD00E11349 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/234-0-0-0--1/download/Naruto.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (370, N'http://s.qplay.vn/194-0-0-0--1/game/Ai-thong-minh-hon-hoc-sinh-lop-5.html', 0, N'http://s.qplay.vn/images/product/icon/icon72x72201012-090846.png', N'Ai thông minh hơn học sinh lớp 5', N'Game show nổi tiếng của thế giới cũng như ở Việt Nam "Ai thông minh hơn học sinh lớp 5" nay đã chính thức có mặt trên Android. Bạn muốn thử sức mình với các em học sinh lớp 5 không chứ . Xem mình có giỏi bằng các e nhỏ không nhé.
Cách chơi :
- Mô tả chân thật nhật như game show thực tế
- Các câu hỏi đúng với nhiều lĩnh vực khác nhau.
- Đồ hoạ + âm thanh đẹp mắt và sống động
Nào còn đợi gì nữa mau mau tải nhé :D', CAST(0x0000A6CD00E1134A AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/194-0-0-0--1/download/Ai-thong-minh-hon-hoc-sinh-lop-5.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (371, N'http://s.qplay.vn/74-0-0-0--1/game/Duong-len-dinh-Olympia.html', 0, N'http://s.qplay.vn/images/product/icon/5eabbe5d3eicon-512c.png', N'Đường lên đỉnh Olympia', N'Game trí tuệ Đường lên đỉnh Olympia đã xuất hiện trên Android.', CAST(0x0000A6CD00E1134C AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/74-0-0-0--1/download/Duong-len-dinh-Olympia.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (372, N'http://s.qplay.vn/60-0-0-0--1/game/Caro-hoc-duong.html', 0, N'http://s.qplay.vn/images/product/icon/icon 72x72290812-081633.png', N'Caro học đường', N'Bạn bao giờ đánh cờ caro với Ngọc Trinh, Hồ Ngọc Hà, hay những hot girl khác, hãy trải nghiệm game cờ caro phiên bản mới nhất này nhé.', CAST(0x0000A6CD00E1134D AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/60-0-0-0--1/download/Caro-hoc-duong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (373, N'http://s.qplay.vn/50-0-0-0--1/game/Giot-nuoc-mau-nhiem.html', 0, N'http://s.qplay.vn/images/product/icon/596178de7bicon giotnuocmaunhiem.png', N'Giọt nước màu nhiệm', N'Qua hàng ngàn năm không xuất hiện, bỗng một ngày tại một vùng đất xa xôi và bí ẩn nơi mà gần như con người không thể đặt chân tới xuất hiện bốn luồng sáng soi rọi lên bầu trời đang vần vũ.Tại nơi đây, hậu duệ của tứ linh “Thanh Long – Bạch Hổ - Chu Tước – Huyền Vũ” đang trong giai đoạn cuối của quá trình tu luyện.
Nơi tận cùng của ngọn núi lửa, hậu duệ của “Chu Tước” – “Phượng Phì” đang tu luyện bên những khối cầu nham thạch nóng bỏng.
Còn ở đáy sâu nhất của hang băng giá, “Dần Ngố” – hậu duệ của “Bạch Hổ” đang ẩn mình luyện tập với những khối cầu băng tê buốt.
Ở đại dương cuộn sóng, “Quy Sún” đang tu luyện với những khối thủy mạc dưới sự dẫn dắt của tiền bối “Huyền Vũ”
Và trên bầu trời tinh vân, “Long Lé” đang cuộn mình khổ luyện với những khối cầu không khí theo bước đàn anh “Thanh Long”
Bạn sẽ vào vai “4LINH” để hoàn thành quá trình luyện tập này và đạt được chính quả.', CAST(0x0000A6CD00E113E9 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/50-0-0-0--1/download/Giot-nuoc-mau-nhiem.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (374, N'http://s.qplay.vn/210-0-0-0--1/game/Kim-cuong-van-phong.html', 0, N'http://s.qplay.vn/images/product/icon/diamond311012-035143.png', N'Kim cương văn phòng', N'Ứng dụng xếp kim cương quen thuộc, giao diện thân thiện, lối chơi vui vẻ mang tính giải trí cao đối với các nhân viên văn phòng
- Ngôn ngữ tiếng Việt
- Thích hợp nhiều loại màn hình đặc biệt là màn hình lớn (Tablet 1280 x 800)
- Cách chơi đơn giản 
Nào hãy tải và chơi Kim cương văn phòng nhé.', CAST(0x0000A6CD00E113EB AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/210-0-0-0--1/download/Kim-cuong-van-phong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (375, N'http://s.qplay.vn/168-0-0-0--1/game/Hay-bat-toi-!-Neu-co-the.html', 0, N'http://s.qplay.vn/images/product/icon/72021012-042227.png', N'Hãy bắt tôi ! Nếu có thể', N'Hãy tưởng tượng bạn là 1 tên cướp .... thì sao ? Hãy thử trải nghiệm cảm giác đó qua tựa game :" Hãy bắt tôi ! Nếu có thể "
Bạn sẽ ngạc nhiên với những chi tiết những hình ảnh quen thuộc quanh đời sống có trong game như : Chợ bưởi, những bức tường sơn chằng chịt quảng cáo khoan cắt bê tông ......Những con phố con đường rất thân thuộc.Hãy chạy chạy chạy nào….
Cách chơi:
-Vô cùng mới lạ và thú vị
-Đồ họa + âm thanh đặc sắc đem đến sự vui nhộn và cảm giác thoải mái khi chơi
-Còn chờ gì nữa hay chơi đi nào .', CAST(0x0000A6CD00E113ED AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/168-0-0-0--1/download/Hay-bat-toi-!-Neu-co-the.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (376, N'http://s.qplay.vn/90-0-0-0--1/game/Sudoku.html', 0, N'http://s.qplay.vn/images/product/icon/6e82819791Icons-23.png', N'Sudoku', N'Sudoku - Game xếp số trí tuệ phiên bản đặc biệt dành cho Android.', CAST(0x0000A6CD00E113EF AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/90-0-0-0--1/download/Sudoku.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (377, N'http://s.qplay.vn/149-0-0-0--1/game/Do-min.html', 0, N'http://s.qplay.vn/images/product/icon/72200912-095913.png', N'Dò mìn', N'Minesweeper là một trò chơi kinh điển dựa trên một trò chơi mang tên Jerimac Ratliff''s Cube ra đời năm khoảng 1960 đến 1970. Cho đến nay nó vẫn còn tồn tại trên một số hệ điều hành khi nhắc đến nó người ta vẫn thường nói đây là một trò chơi thông minh và đòi hoi sự kiên nhẫn của người chơi. Để giúp các bạn tham gia chơi một cách dễ dàng hơn chúng tôi đã triển hóa nó thành phiên bản Dò mìn trên máy điện thoại. 
Cách chơi không thay đổi so với phiên bản gốc nhưng, được làm mới và phong phú hơn so với những phiên cũ, mỗi một bàn là một cấp độ khác nhau kèm theo đó đồ họa và âm thanh hấp dẫn hơn.
Hi vọng Minesweeper vẫn là một trò chơi Dò mìn thu hút trí thông minh và tính kiên nhẫn của người chơi nhất! Hãy tham gia thôi.', CAST(0x0000A6CD00E113F4 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/149-0-0-0--1/download/Do-min.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (378, N'http://s.qplay.vn/179-0-0-0--1/game/Ke-cap-gap-ba-gia.html', 0, N'http://s.qplay.vn/images/product/icon/icon72101012-011744.png', N'Kẻ cắp gặp bà già', N'Đừng nghĩ ta già mà ta không bắt được cướp nhé.Tựa game “Kẻ cắp gặp bà già” xây dựng trên cuốn tiểu thuyết nổi tiếng cùng tên . Sẽ đem đến tiếng cười thứ vị cho các bạn sau những màn chơi , sau những địa điểm lý thú mà bà già đi bắt cướp :D
Cách chơi :
-Đúng với tựa đề game , chạy thật nhanh , uyển chuyển vượt qua các chướng ngại vật để bắt cướp.
-Cực kì nhiều thử thách + các map chơi thú vị.Từ nông thôn đến các khu mua sắm sầm uất ở thành phố
-Đồ họa + âm thanh trong game phải nói chuẩn không cần chỉnh (chỉnh là hỏng ngay)
Hãy khám phá tựa game nổi tiếng khắp thế giới này nhé.Nếu không chơi thì phí lắm :D', CAST(0x0000A6CD00E113F6 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/179-0-0-0--1/download/Ke-cap-gap-ba-gia.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (379, N'http://s.qplay.vn/172-0-0-0--1/game/Tay-dua-gam-nham.html', 0, N'http://s.qplay.vn/images/product/icon/72-3071112-041058.png', N'Tay đua gặm nhấm', N'Hãy thể hiện mình là một chú chuột tài ba. Ghi thật nhiều điểm và xứng đáng là tay đua số 1 trong tựa game "Tay Đua Gặm Nhấm" nhé các bạn. 
Game với đồ họa hài hước, màu sắc ngộ nghĩnh.
Có nhiều màn chơi với các skill đặc biệt - đẹp cho các bạn tha hồ lựa chọn
Game có 2 kiểu điều khiển tích hợp cho mọi hệ máy Android.', CAST(0x0000A6CD00E113F8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/172-0-0-0--1/download/Tay-dua-gam-nham.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (380, N'http://s.qplay.vn/166-0-0-0--1/game/Tay-co-duong-pho.html', 0, N'http://s.qplay.vn/images/product/icon/icon021012-104708.png', N'Tay cơ đường phố', N'Các bộ môn thể thao luôn giúp cho chúng ta tập luyện tốt nhất cho sức khỏe, không chỉ những môn thể thao liên quan đến vận động bên cạnh đó còn có những môn thể thao liên quan đến trí tuệ. Bi-a là một trong những môn thể thao như thế, bộ môn bi-a được ra đời từ khá lâu, chỉ đơn giản là một chiếc bàn và những trái bóng được đặt số kèm theo cây gậy để đẩy bóng nhưng nó đã thu hút hàng triệu người trên khắp thế giới tham gia. Tuy nhiên không phải ai cũng có thời gian để chơi hoặc đến những câu lạc bộ bi-a để hòa mình vào với những trái bóng vì vậy chúng tôi đã thu gọn thành một mô hình để các bạn có thể chơi trên chính chiếc điện thoại của mình ở mọi lúc, mọi nơi.
Cách chơi:
-Tổng cộng có 3 hệ chơi: đấu đơn, đối kháng, chọn màn chơi. Mỗi một hệ chơi sẽ bao gồm rất nhiều bàn chơi nhỏ khác nhau, kèm theo lời hướng dẫn cụ thể khi mới tham gia chơi.
-Người chơi có thể lựa chọn cách chơi 8 bóng hoặc 9 bóng. Với những bàn Bi-a khác nhau và những cây cơ khác nhau để không tạo nên sự nhàm chán cho người tham gia.
-Bạn có thể chơi đấu đơn để tập luyên, tham gia đối kháng để thi đấu với người chơi khác, hoặc bạn có thể tham gia vào các màn chơi khác nhau từ dễ đến khó.
-Bạn có thể tham gia so sánh điểm chơi với những người cùng tham gia.
Chúng tôi gọi đây là mô hình kỳ diệu bởi nó chứa đựng tất cả những điều mà ai ham mê bộ môn này hoặc mới thử tham gia đều phải yêu thích nó. Hãy tham gia cùng với chúng tôi, chúc các bạn vui vẻ.', CAST(0x0000A6CD00E113F9 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/166-0-0-0--1/download/Tay-co-duong-pho.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (381, N'http://s.qplay.vn/160-0-0-0--1/game/Hoa-son-luan-kiem.html', 0, N'http://s.qplay.vn/images/product/icon/72-1071112-033657.png', N'Hoa sơn luận kiếm', N'Vùng núi Hoa Sơn là nơi mà biết bao nhiêu cao thủ võ lâm muốn đặt chân tới. Nơi đây là nơi thích hợp nhất cho việc học tập và tu luyện những bí kíp võ công  cái thế  trong thiên hạ. Đường đến với núi Hoa Sơn có vô vàn khó khăn trắc trở. Vào vai 1 cao thủ võ lâm, bạn hãy tiêu diệt lũ quái vật - yêu tinh gớm ghiếc và thu thập những bí kíp võ công.
Bạn có thể bắt gặp và nhận ra những võ công quen thuộc như : vạn kiếm quy tông, thất sát chưởng hay như lai thần chưởng... nếu bạn đã từng là fan của những dòng game nổi tiếng như Võ lâm Truyền Kỳ, Tinh Võ online.
Bạn sẽ ngạc nhiên vì đồ họa bắt mắt và âm thanh sống động trong game.
Nào ! Hãy thử trải nghiệm với game Hoa Sơn Luận Kiếm.', CAST(0x0000A6CD00E113FB AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/160-0-0-0--1/download/Hoa-son-luan-kiem.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (382, N'http://s.qplay.vn/134-0-0-0--1/game/Duong-dua-tu-than.html', 0, N'http://s.qplay.vn/images/product/icon/test110912-100418.png', N'Đường đua tử thần', N'Những tay đua siêu hạng, những chiếc ô tô siêu khủng. Bạn đã phải là một người có tinh thần thép để tham gia đường đua tử thần này. Với hàng trăm mẫu xe của các nhãn hiệu nổi tiếng trên thế giới kèm theo với những quốc lộ đông đúc ở khắp nơi. Nào hãy nhấn ga tham gia vào Đường đua tử thần.', CAST(0x0000A6CD00E113FC AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/134-0-0-0--1/download/Duong-dua-tu-than.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (383, N'http://s.qplay.vn/57-0-0-0--1/game/Co-tuong.html', 0, N'http://s.qplay.vn/images/product/icon/f3f24fe8d6icon_cotuong-72x72.png', N'Cờ tướng', N'32 quân cờ và hai đối thủ đối mặt với nhau trên một bàn cờ. Mỗi người đều phải tự tính toán để có được nước cờ thông minh nhất và chiến thắng hiểm hách nhất.', CAST(0x0000A6CD00E114B1 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/57-0-0-0--1/download/Co-tuong.html', NULL)
INSERT [dbo].[Links] ([Id], [Link], [SiteId], [Avatar], [Title], [Description], [DateCrawler], [DateSynced], [CountSynced], [LinkType], [LinkDownload], [GameType]) VALUES (384, N'http://s.qplay.vn/95-0-0-0--1/game/Dot-kich.html', 0, N'http://s.qplay.vn/images/product/icon/28ea2c3f70icon.png', N'Đột kích', N'Một ngọn đồi bình yên, một bờ biển thanh bình...Nay đã là chiến trường máu lửa. Bạn có phải là chiến binh dũng cảm để đem mọi thứ trở lại như xưa không ?', CAST(0x0000A6CD00E114B8 AS DateTime), NULL, 0, 2, N'http://s.qplay.vn/95-0-0-0--1/download/Dot-kich.html', NULL)
SET IDENTITY_INSERT [dbo].[Links] OFF
SET IDENTITY_INSERT [dbo].[Sites] ON 

INSERT [dbo].[Sites] ([Id], [SiteUrl]) VALUES (1, N's.qplay.vn')
SET IDENTITY_INSERT [dbo].[Sites] OFF
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_SiteId]  DEFAULT ((1)) FOR [SiteId]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_DateCrawler]  DEFAULT (getdate()) FOR [DateCrawler]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_CountSynced]  DEFAULT ((0)) FOR [CountSynced]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_LinkType]  DEFAULT ((1)) FOR [LinkType]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_GameType]  DEFAULT ((1)) FOR [GameType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Detail; 2: Cat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Links', @level2type=N'COLUMN',@level2name=N'LinkType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Android; 1: iOS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Links', @level2type=N'COLUMN',@level2name=N'GameType'
GO
USE [master]
GO
ALTER DATABASE [Crawler] SET  READ_WRITE 
GO
