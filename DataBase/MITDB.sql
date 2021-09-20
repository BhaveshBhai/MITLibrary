
ALTER DATABASE [MITDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MITDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MITDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MITDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MITDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MITDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MITDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MITDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MITDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MITDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MITDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MITDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MITDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MITDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MITDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MITDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MITDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MITDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MITDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MITDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MITDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MITDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MITDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MITDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MITDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MITDB] SET  MULTI_USER 
GO
ALTER DATABASE [MITDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MITDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MITDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MITDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MITDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MITDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MITDB] SET QUERY_STORE = OFF
GO
USE [MITDB]
GO
/****** Object:  Table [dbo].[AumltInventors]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AumltInventors](
	[AUMLTInventor_Id] [int] IDENTITY(1,1) NOT NULL,
	[OCLC_Number] [numeric](18, 0) NULL,
	[Item_Barcode] [nvarchar](max) NULL,
	[TextBookId] [int] NULL,
	[Unit_Id] [int] NULL,
	[Campus_Id] [int] NULL,
	[Inventor_FileUpload_Id] [int] NULL,
 CONSTRAINT [PK_AumltInventors] PRIMARY KEY CLUSTERED 
(
	[AUMLTInventor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campuses]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campuses](
	[Campus_id] [int] IDENTITY(1,1) NOT NULL,
	[Campus_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Campuses] PRIMARY KEY CLUSTERED 
(
	[Campus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coordinators]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordinators](
	[Coordinator_Id] [int] IDENTITY(1,1) NOT NULL,
	[Coordinator_Name] [nvarchar](50) NULL,
	[Unit_Id] [int] NULL,
 CONSTRAINT [PK_Coordinators] PRIMARY KEY CLUSTERED 
(
	[Coordinator_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileUploads]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileUploads](
	[File_Upload_Id] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[User_Id] [int] NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_FileUploads] PRIMARY KEY CLUSTERED 
(
	[File_Upload_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[Semester_Id] [int] IDENTITY(1,1) NOT NULL,
	[Semester_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Semesters] PRIMARY KEY CLUSTERED 
(
	[Semester_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBooks]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBooks](
	[TextBook_Id] [int] IDENTITY(1,1) NOT NULL,
	[TextBook_Year] [int] NULL,
	[Author] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Publisher] [nvarchar](250) NULL,
	[Identifier] [nvarchar](150) NULL,
	[Requirement] [nvarchar](250) NULL,
	[Semesters_Id] [int] NULL,
	[Year_Id] [int] NULL,
	[Campus_Id] [int] NULL,
	[FileUpload_Id] [int] NULL,
	[Coordinator_Name] [nvarchar](max) NULL,
	[Unit_Id] [int] NULL,
 CONSTRAINT [PK_TextBooks] PRIMARY KEY CLUSTERED 
(
	[TextBook_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[Unit_Id] [int] IDENTITY(1,1) NOT NULL,
	[Unit_Code] [nvarchar](50) NULL,
	[Unit_Title] [nvarchar](250) NULL,
	[Capacity] [int] NULL,
	[Campus_Id] [int] NULL,
	[Total_Enrollment] [int] NULL,
	[RunningOrNot] [bit] NULL,
	[Lab_and_tut_capacity] [int] NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[Unit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Role_Id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Years]    Script Date: 21/09/2021 12:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Years](
	[Year_Id] [int] IDENTITY(1,1) NOT NULL,
	[Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Years] PRIMARY KEY CLUSTERED 
(
	[Year_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AumltInventors] ON 
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (842, CAST(711716819 AS Numeric(18, 0)), N'I0027227754', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (843, CAST(711716819 AS Numeric(18, 0)), N'I0027227762', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (844, CAST(711716819 AS Numeric(18, 0)), N'I0027227770', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (845, CAST(711716819 AS Numeric(18, 0)), N'I0027227801', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (846, CAST(711716819 AS Numeric(18, 0)), N'I0027227827', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (847, CAST(711716819 AS Numeric(18, 0)), N'I0027231575', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (848, CAST(711716819 AS Numeric(18, 0)), N'I0027231583', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (849, CAST(711716819 AS Numeric(18, 0)), N'I0027231622', 574, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (850, CAST(711716819 AS Numeric(18, 0)), N'I0029060598', 574, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (851, CAST(711716819 AS Numeric(18, 0)), N'I0029060603', 574, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (852, CAST(711716819 AS Numeric(18, 0)), N'I0029060611', 574, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (853, CAST(711716819 AS Numeric(18, 0)), N'I0029060629', 574, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (854, CAST(807180288 AS Numeric(18, 0)), N'I0027262445', 579, 432, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (855, CAST(807180288 AS Numeric(18, 0)), N'I0027262453', 579, 432, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (856, CAST(807180288 AS Numeric(18, 0)), N'I0029087736', 579, 432, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (857, CAST(807180288 AS Numeric(18, 0)), N'I0029087744', 579, 432, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (858, CAST(838754052 AS Numeric(18, 0)), N'I0027261449', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (859, CAST(838754052 AS Numeric(18, 0)), N'I0027261457', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (860, CAST(838754052 AS Numeric(18, 0)), N'I0027261465', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (861, CAST(838754052 AS Numeric(18, 0)), N'I0027261473', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (862, CAST(838754052 AS Numeric(18, 0)), N'I0027261504', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (863, CAST(838754052 AS Numeric(18, 0)), N'I0027261512', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (864, CAST(838754052 AS Numeric(18, 0)), N'I0027261520', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (865, CAST(838754052 AS Numeric(18, 0)), N'I0027261538', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (866, CAST(838754052 AS Numeric(18, 0)), N'I0027274955', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (867, CAST(838754052 AS Numeric(18, 0)), N'I0027279913', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (868, CAST(838754052 AS Numeric(18, 0)), N'I0027279921', 581, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (869, CAST(838754052 AS Numeric(18, 0)), N'I0029080857', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (870, CAST(838754052 AS Numeric(18, 0)), N'I0029080996', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (871, CAST(838754052 AS Numeric(18, 0)), N'I0029081007', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (872, CAST(838754052 AS Numeric(18, 0)), N'I0029086984', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (873, CAST(838754052 AS Numeric(18, 0)), N'I0029087273', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (874, CAST(838754052 AS Numeric(18, 0)), N'I0029087281', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (875, CAST(838754052 AS Numeric(18, 0)), N'I0029087299', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (876, CAST(838754052 AS Numeric(18, 0)), N'I0029087304', 581, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (877, CAST(870646291 AS Numeric(18, 0)), N'I0027259434', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (878, CAST(870646291 AS Numeric(18, 0)), N'I0027259442', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (879, CAST(870646291 AS Numeric(18, 0)), N'I0027267445', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (880, CAST(870646291 AS Numeric(18, 0)), N'I0027267518', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (881, CAST(870646291 AS Numeric(18, 0)), N'I0027267526', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (882, CAST(870646291 AS Numeric(18, 0)), N'I0027289861', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (883, CAST(870646291 AS Numeric(18, 0)), N'I0027289879', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (884, CAST(870646291 AS Numeric(18, 0)), N'I0027290862', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (885, CAST(870646291 AS Numeric(18, 0)), N'I0027290870', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (886, CAST(870646291 AS Numeric(18, 0)), N'I0027292131', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (887, CAST(870646291 AS Numeric(18, 0)), N'I0027292149', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (888, CAST(870646291 AS Numeric(18, 0)), N'I0027292157', 591, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (889, CAST(870646291 AS Numeric(18, 0)), N'I0029092228', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (890, CAST(870646291 AS Numeric(18, 0)), N'I0029093622', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (891, CAST(870646291 AS Numeric(18, 0)), N'I0029093630', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (892, CAST(870646291 AS Numeric(18, 0)), N'I0029093648', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (893, CAST(870646291 AS Numeric(18, 0)), N'I0029101679', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (894, CAST(870646291 AS Numeric(18, 0)), N'I0029101687', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (895, CAST(870646291 AS Numeric(18, 0)), N'I0029106166', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (896, CAST(870646291 AS Numeric(18, 0)), N'I0029106174', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (897, CAST(870646291 AS Numeric(18, 0)), N'I0029106182', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (898, CAST(870646291 AS Numeric(18, 0)), N'I0029106190', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (899, CAST(870646291 AS Numeric(18, 0)), N'I0029106205', 591, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (900, CAST(875346096 AS Numeric(18, 0)), N'I0027268124', 584, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (901, CAST(879370188 AS Numeric(18, 0)), N'I0027278941', 585, 523, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (902, CAST(879370188 AS Numeric(18, 0)), N'I0027278959', 585, 523, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (903, CAST(879370188 AS Numeric(18, 0)), N'I0027278967', 585, 523, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (904, CAST(879370188 AS Numeric(18, 0)), N'I0027278975', 585, 523, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (905, CAST(879370188 AS Numeric(18, 0)), N'I0027283328', 585, 523, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (906, CAST(879370188 AS Numeric(18, 0)), N'I0027283336', 585, 523, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (907, CAST(879370188 AS Numeric(18, 0)), N'I0029084699', 585, 523, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (908, CAST(879370188 AS Numeric(18, 0)), N'I0029084704', 585, 523, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (909, CAST(879370188 AS Numeric(18, 0)), N'I0029084712', 585, 523, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (910, CAST(879370188 AS Numeric(18, 0)), N'I0029084720', 585, 523, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (911, CAST(879370188 AS Numeric(18, 0)), N'I0029100966', 585, 523, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (912, CAST(881368275 AS Numeric(18, 0)), N'I0027271185', 586, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (913, CAST(881368275 AS Numeric(18, 0)), N'I0027271193', 586, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (914, CAST(881368275 AS Numeric(18, 0)), N'I0027271208', 586, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (915, CAST(881368275 AS Numeric(18, 0)), N'I0027271216', 586, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (916, CAST(881368275 AS Numeric(18, 0)), N'I0029095577', 586, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (917, CAST(881368275 AS Numeric(18, 0)), N'I0029095585', 586, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (918, CAST(881368275 AS Numeric(18, 0)), N'I0029095593', 586, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (919, CAST(881368275 AS Numeric(18, 0)), N'I0029095608', 586, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (920, CAST(908448040 AS Numeric(18, 0)), N'I0027278470', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (921, CAST(908448040 AS Numeric(18, 0)), N'I0027278488', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (922, CAST(908448040 AS Numeric(18, 0)), N'I0027278496', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (923, CAST(908448040 AS Numeric(18, 0)), N'I0027278501', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (924, CAST(908448040 AS Numeric(18, 0)), N'I0027278519', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (925, CAST(908448040 AS Numeric(18, 0)), N'I0027278527', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (926, CAST(908448040 AS Numeric(18, 0)), N'I0027278535', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (927, CAST(908448040 AS Numeric(18, 0)), N'I0027284138', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (928, CAST(908448040 AS Numeric(18, 0)), N'I0027284146', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (929, CAST(908448040 AS Numeric(18, 0)), N'I0027284154', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (930, CAST(908448040 AS Numeric(18, 0)), N'I0027284162', 567, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (931, CAST(908448040 AS Numeric(18, 0)), N'I0029084021', 567, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (932, CAST(908448040 AS Numeric(18, 0)), N'I0029084039', 567, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (933, CAST(908448040 AS Numeric(18, 0)), N'I0029084047', 567, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (934, CAST(908448040 AS Numeric(18, 0)), N'I0029084055', 567, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (935, CAST(914290586 AS Numeric(18, 0)), N'I0027279507', 589, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (936, CAST(914290586 AS Numeric(18, 0)), N'I0027279565', 589, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (937, CAST(914290586 AS Numeric(18, 0)), N'I0027279581', 589, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (938, CAST(914290586 AS Numeric(18, 0)), N'I0027279604', 589, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (939, CAST(914290586 AS Numeric(18, 0)), N'I0027279612', 589, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (940, CAST(914290586 AS Numeric(18, 0)), N'I0027283946', 589, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (941, CAST(914290586 AS Numeric(18, 0)), N'I0029085166', 589, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (942, CAST(914290586 AS Numeric(18, 0)), N'I0029085174', 589, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (943, CAST(914290586 AS Numeric(18, 0)), N'I0029085182', 589, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (944, CAST(914290586 AS Numeric(18, 0)), N'I0029085190', 589, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (945, CAST(940646591 AS Numeric(18, 0)), N'I0027278365', 593, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (946, CAST(940646591 AS Numeric(18, 0)), N'I0027278373', 593, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (947, CAST(940646591 AS Numeric(18, 0)), N'I0029084982', 593, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (948, CAST(940646591 AS Numeric(18, 0)), N'I0029084990', 593, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (949, CAST(941428273 AS Numeric(18, 0)), N'I0027276321', 594, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (950, CAST(941428273 AS Numeric(18, 0)), N'I0027276339', 594, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (951, CAST(941428273 AS Numeric(18, 0)), N'I0027276347', 594, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (952, CAST(941428273 AS Numeric(18, 0)), N'I0027276355', 594, 433, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (953, CAST(941428273 AS Numeric(18, 0)), N'I0029080344', 594, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (954, CAST(941428273 AS Numeric(18, 0)), N'I0029080352', 594, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (955, CAST(941428273 AS Numeric(18, 0)), N'I0029080360', 594, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (956, CAST(941428273 AS Numeric(18, 0)), N'I0029080378', 594, 433, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (957, CAST(944226207 AS Numeric(18, 0)), N'I0027292953', 595, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (958, CAST(944226207 AS Numeric(18, 0)), N'I0027294573', 595, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (959, CAST(944226207 AS Numeric(18, 0)), N'I0027294581', 595, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (960, CAST(944226207 AS Numeric(18, 0)), N'I0027294599', 595, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (961, CAST(944226207 AS Numeric(18, 0)), N'I0029104083', 595, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (962, CAST(944226207 AS Numeric(18, 0)), N'I0029104091', 595, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (963, CAST(944226207 AS Numeric(18, 0)), N'I0029104106', 595, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (964, CAST(944226207 AS Numeric(18, 0)), N'I0029104114', 595, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (965, CAST(946118199 AS Numeric(18, 0)), N'I0027276509', 596, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (966, CAST(946118199 AS Numeric(18, 0)), N'I0027276517', 596, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (967, CAST(946118199 AS Numeric(18, 0)), N'I0027276525', 596, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (968, CAST(946118199 AS Numeric(18, 0)), N'I0027276533', 596, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (969, CAST(946118199 AS Numeric(18, 0)), N'I0029080718', 596, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (970, CAST(946118199 AS Numeric(18, 0)), N'I0029080726', 596, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (971, CAST(946118199 AS Numeric(18, 0)), N'I0029080734', 596, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (972, CAST(946118199 AS Numeric(18, 0)), N'I0029080742', 596, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (973, CAST(947107355 AS Numeric(18, 0)), N'I0027279337', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (974, CAST(947107355 AS Numeric(18, 0)), N'I0027279345', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (975, CAST(947107355 AS Numeric(18, 0)), N'I0027279353', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (976, CAST(947107355 AS Numeric(18, 0)), N'I0027279361', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (977, CAST(947107355 AS Numeric(18, 0)), N'I0027279379', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (978, CAST(947107355 AS Numeric(18, 0)), N'I0027279387', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (979, CAST(947107355 AS Numeric(18, 0)), N'I0027279395', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (980, CAST(947107355 AS Numeric(18, 0)), N'I0027283556', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (981, CAST(947107355 AS Numeric(18, 0)), N'I0027283564', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (982, CAST(947107355 AS Numeric(18, 0)), N'I0027283572', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (983, CAST(947107355 AS Numeric(18, 0)), N'I0027283580', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (984, CAST(947107355 AS Numeric(18, 0)), N'I0027283988', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (985, CAST(947107355 AS Numeric(18, 0)), N'I0027283996', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (986, CAST(947107355 AS Numeric(18, 0)), N'I0027284007', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (987, CAST(947107355 AS Numeric(18, 0)), N'I0027284015', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (988, CAST(947107355 AS Numeric(18, 0)), N'I0027284023', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (989, CAST(947107355 AS Numeric(18, 0)), N'I0027284031', 597, 436, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (990, CAST(947107355 AS Numeric(18, 0)), N'I0029085027', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (991, CAST(947107355 AS Numeric(18, 0)), N'I0029085035', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (992, CAST(947107355 AS Numeric(18, 0)), N'I0029085043', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (993, CAST(947107355 AS Numeric(18, 0)), N'I0029085051', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (994, CAST(947107355 AS Numeric(18, 0)), N'I0029101069', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (995, CAST(947107355 AS Numeric(18, 0)), N'I0029101077', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (996, CAST(947107355 AS Numeric(18, 0)), N'I0029101085', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (997, CAST(947107355 AS Numeric(18, 0)), N'I0029101093', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (998, CAST(947107355 AS Numeric(18, 0)), N'I0029101108', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (999, CAST(947107355 AS Numeric(18, 0)), N'I0029101116', 597, 436, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1000, CAST(948669971 AS Numeric(18, 0)), N'I0027285265', 598, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1001, CAST(948669971 AS Numeric(18, 0)), N'I0027285273', 598, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1002, CAST(948669971 AS Numeric(18, 0)), N'I0027285281', 598, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1003, CAST(948669971 AS Numeric(18, 0)), N'I0027285299', 598, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1004, CAST(948669971 AS Numeric(18, 0)), N'I0027293789', 598, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1005, CAST(948669971 AS Numeric(18, 0)), N'I0027293797', 598, 439, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1006, CAST(948669971 AS Numeric(18, 0)), N'I0029098224', 598, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1007, CAST(948669971 AS Numeric(18, 0)), N'I0029098232', 598, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1008, CAST(948669971 AS Numeric(18, 0)), N'I0029098240', 598, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1009, CAST(948669971 AS Numeric(18, 0)), N'I0029098258', 598, 439, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1010, CAST(959949320 AS Numeric(18, 0)), N'I0027296517', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1011, CAST(959949320 AS Numeric(18, 0)), N'I0027296525', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1012, CAST(959949320 AS Numeric(18, 0)), N'I0027296533', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1013, CAST(959949320 AS Numeric(18, 0)), N'I0027296541', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1014, CAST(959949320 AS Numeric(18, 0)), N'I0027298056', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1015, CAST(959949320 AS Numeric(18, 0)), N'I0027298064', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1016, CAST(959949320 AS Numeric(18, 0)), N'I0027298072', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1017, CAST(959949320 AS Numeric(18, 0)), N'I0027298080', 600, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1018, CAST(959949320 AS Numeric(18, 0)), N'I0029105102', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1019, CAST(959949320 AS Numeric(18, 0)), N'I0029105110', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1020, CAST(959949320 AS Numeric(18, 0)), N'I0029105128', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1021, CAST(959949320 AS Numeric(18, 0)), N'I0029105136', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1022, CAST(959949320 AS Numeric(18, 0)), N'I0029105649', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1023, CAST(959949320 AS Numeric(18, 0)), N'I0029105657', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1024, CAST(959949320 AS Numeric(18, 0)), N'I0029105908', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1025, CAST(959949320 AS Numeric(18, 0)), N'I0029105958', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1026, CAST(959949320 AS Numeric(18, 0)), N'I0029106001', 600, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1027, CAST(960849457 AS Numeric(18, 0)), N'I0027294769', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1028, CAST(960849457 AS Numeric(18, 0)), N'I0027294777', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1029, CAST(960849457 AS Numeric(18, 0)), N'I0027294785', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1030, CAST(960849457 AS Numeric(18, 0)), N'I0027294793', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1031, CAST(960849457 AS Numeric(18, 0)), N'I0027295511', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1032, CAST(960849457 AS Numeric(18, 0)), N'I0027295529', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1033, CAST(960849457 AS Numeric(18, 0)), N'I0027295537', 601, 456, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1034, CAST(960849457 AS Numeric(18, 0)), N'I0029103582', 601, 456, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1035, CAST(960849457 AS Numeric(18, 0)), N'I0029103590', 601, 456, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1036, CAST(960849457 AS Numeric(18, 0)), N'I0029103605', 601, 456, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1037, CAST(960849457 AS Numeric(18, 0)), N'I0029103613', 601, 456, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1038, CAST(973877902 AS Numeric(18, 0)), N'I0027294361', 577, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1039, CAST(973877902 AS Numeric(18, 0)), N'I0027294379', 577, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1040, CAST(973877902 AS Numeric(18, 0)), N'I0027294387', 577, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1041, CAST(973877902 AS Numeric(18, 0)), N'I0027294418', 577, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1042, CAST(973877902 AS Numeric(18, 0)), N'I0027295935', 577, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1043, CAST(973877902 AS Numeric(18, 0)), N'I0027299921', 577, 431, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1044, CAST(973877902 AS Numeric(18, 0)), N'I0029104326', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1045, CAST(973877902 AS Numeric(18, 0)), N'I0029104334', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1046, CAST(973877902 AS Numeric(18, 0)), N'I0029104342', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1047, CAST(973877902 AS Numeric(18, 0)), N'I0029104350', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1048, CAST(973877902 AS Numeric(18, 0)), N'I0029104732', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1049, CAST(973877902 AS Numeric(18, 0)), N'I0029105835', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1050, CAST(973877902 AS Numeric(18, 0)), N'I0029105885', 577, 431, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1051, CAST(974545640 AS Numeric(18, 0)), N'I0027294531', 571, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1052, CAST(974545640 AS Numeric(18, 0)), N'I0027294549', 571, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1053, CAST(974545640 AS Numeric(18, 0)), N'I0027294557', 571, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1054, CAST(974545640 AS Numeric(18, 0)), N'I0027294565', 571, 426, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1055, CAST(974545640 AS Numeric(18, 0)), N'I0029104287', 571, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1056, CAST(974545640 AS Numeric(18, 0)), N'I0029104295', 571, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1057, CAST(974545640 AS Numeric(18, 0)), N'I0029104300', 571, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1058, CAST(974545640 AS Numeric(18, 0)), N'I0029104318', 571, 426, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1059, CAST(995773615 AS Numeric(18, 0)), N'I0027311838', 629, 535, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1060, CAST(995773615 AS Numeric(18, 0)), N'I0027311977', 629, 535, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1061, CAST(995773615 AS Numeric(18, 0)), N'I0027312020', 629, 535, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1062, CAST(995773615 AS Numeric(18, 0)), N'I0027312070', 629, 535, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1063, CAST(995773615 AS Numeric(18, 0)), N'I0029110050', 629, 535, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1064, CAST(995773615 AS Numeric(18, 0)), N'I0029110068', 629, 535, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1065, CAST(995773615 AS Numeric(18, 0)), N'I0029110076', 629, 535, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1066, CAST(995773615 AS Numeric(18, 0)), N'I0029110084', 629, 535, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1067, CAST(995781450 AS Numeric(18, 0)), N'I0027295414', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1068, CAST(995781450 AS Numeric(18, 0)), N'I0027296208', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1069, CAST(995781450 AS Numeric(18, 0)), N'I0027296216', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1070, CAST(995781450 AS Numeric(18, 0)), N'I0027296224', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1071, CAST(995781450 AS Numeric(18, 0)), N'I0027296232', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1072, CAST(995781450 AS Numeric(18, 0)), N'I0027296240', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1073, CAST(995781450 AS Numeric(18, 0)), N'I0027296258', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1074, CAST(995781450 AS Numeric(18, 0)), N'I0027296266', 606, 518, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1075, CAST(995781450 AS Numeric(18, 0)), N'I0029103972', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1076, CAST(995781450 AS Numeric(18, 0)), N'I0029103980', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1077, CAST(995781450 AS Numeric(18, 0)), N'I0029103998', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1078, CAST(995781450 AS Numeric(18, 0)), N'I0029104009', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1079, CAST(995781450 AS Numeric(18, 0)), N'I0029104059', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1080, CAST(995781450 AS Numeric(18, 0)), N'I0029104067', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1081, CAST(995781450 AS Numeric(18, 0)), N'I0029104075', 606, 518, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1082, CAST(1017589900 AS Numeric(18, 0)), N'I0027294989', 575, 429, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1083, CAST(1017589900 AS Numeric(18, 0)), N'I0027294997', 575, 429, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1084, CAST(1017589900 AS Numeric(18, 0)), N'I0027295008', 575, 429, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1085, CAST(1017589900 AS Numeric(18, 0)), N'I0027295016', 575, 429, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1086, CAST(1017589900 AS Numeric(18, 0)), N'I0027297165', 575, 429, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1087, CAST(1017589900 AS Numeric(18, 0)), N'I0029104164', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1088, CAST(1017589900 AS Numeric(18, 0)), N'I0029104172', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1089, CAST(1017589900 AS Numeric(18, 0)), N'I0029104180', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1090, CAST(1017589900 AS Numeric(18, 0)), N'I0029104198', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1091, CAST(1017589900 AS Numeric(18, 0)), N'I0029106483', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1092, CAST(1017589900 AS Numeric(18, 0)), N'I0029106491', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1093, CAST(1017589900 AS Numeric(18, 0)), N'I0029106506', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1094, CAST(1017589900 AS Numeric(18, 0)), N'I0029106514', 575, 429, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1095, CAST(1019688569 AS Numeric(18, 0)), N'I0027297513', 572, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1096, CAST(1019688569 AS Numeric(18, 0)), N'I0027297521', 572, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1097, CAST(1019688569 AS Numeric(18, 0)), N'I0027297547', 572, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1098, CAST(1019688569 AS Numeric(18, 0)), N'I0027298404', 572, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1099, CAST(1019688569 AS Numeric(18, 0)), N'I0027312410', 572, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1100, CAST(1019688569 AS Numeric(18, 0)), N'I0027312428', 572, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1101, CAST(1019688569 AS Numeric(18, 0)), N'I0029105788', 572, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1102, CAST(1019688569 AS Numeric(18, 0)), N'I0029105796', 572, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1103, CAST(1019688569 AS Numeric(18, 0)), N'I0029105801', 572, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1104, CAST(1019688569 AS Numeric(18, 0)), N'I0029106019', 572, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1105, CAST(1029471680 AS Numeric(18, 0)), N'I0027296062', 619, 524, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1106, CAST(1029471680 AS Numeric(18, 0)), N'I0027296070', 619, 524, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1107, CAST(1029471680 AS Numeric(18, 0)), N'I0027296088', 619, 524, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1108, CAST(1029471680 AS Numeric(18, 0)), N'I0027296096', 619, 524, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1109, CAST(1029471680 AS Numeric(18, 0)), N'I0029104782', 619, 524, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1110, CAST(1029471680 AS Numeric(18, 0)), N'I0029104790', 619, 524, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1111, CAST(1029471680 AS Numeric(18, 0)), N'I0029104805', 619, 524, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1112, CAST(1029471680 AS Numeric(18, 0)), N'I0029104813', 619, 524, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1113, CAST(1032349264 AS Numeric(18, 0)), N'I0027296444', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1114, CAST(1032349264 AS Numeric(18, 0)), N'I0027296452', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1115, CAST(1032349264 AS Numeric(18, 0)), N'I0027296460', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1116, CAST(1032349264 AS Numeric(18, 0)), N'I0027296478', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1117, CAST(1032349264 AS Numeric(18, 0)), N'I0027296486', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1118, CAST(1032349264 AS Numeric(18, 0)), N'I0027296494', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1119, CAST(1032349264 AS Numeric(18, 0)), N'I0027296509', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1120, CAST(1032349264 AS Numeric(18, 0)), N'I0027297686', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1121, CAST(1032349264 AS Numeric(18, 0)), N'I0027297694', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1122, CAST(1032349264 AS Numeric(18, 0)), N'I0027297709', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1123, CAST(1032349264 AS Numeric(18, 0)), N'I0027297717', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1124, CAST(1032349264 AS Numeric(18, 0)), N'I0027299808', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1125, CAST(1032349264 AS Numeric(18, 0)), N'I0027299816', 569, 424, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1126, CAST(1032349264 AS Numeric(18, 0)), N'I0029105021', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1127, CAST(1032349264 AS Numeric(18, 0)), N'I0029105039', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1128, CAST(1032349264 AS Numeric(18, 0)), N'I0029105047', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1129, CAST(1032349264 AS Numeric(18, 0)), N'I0029105055', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1130, CAST(1032349264 AS Numeric(18, 0)), N'I0029105819', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1131, CAST(1032349264 AS Numeric(18, 0)), N'I0029105869', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1132, CAST(1032349264 AS Numeric(18, 0)), N'I0029105916', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1133, CAST(1032349264 AS Numeric(18, 0)), N'I0029105966', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1134, CAST(1032349264 AS Numeric(18, 0)), N'I0029105974', 569, 424, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1135, CAST(1038015578 AS Numeric(18, 0)), N'I0027296313', 617, 522, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1136, CAST(1038015578 AS Numeric(18, 0)), N'I0027296321', 617, 522, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1137, CAST(1038015578 AS Numeric(18, 0)), N'I0027296339', 617, 522, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1138, CAST(1038015578 AS Numeric(18, 0)), N'I0027296347', 617, 522, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1139, CAST(1038015578 AS Numeric(18, 0)), N'I0029104986', 617, 522, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1140, CAST(1038015578 AS Numeric(18, 0)), N'I0029104994', 617, 522, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1141, CAST(1038015578 AS Numeric(18, 0)), N'I0029105005', 617, 522, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1142, CAST(1038015578 AS Numeric(18, 0)), N'I0029105013', 617, 522, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1143, CAST(1050107760 AS Numeric(18, 0)), N'I0027296800', 620, 526, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1144, CAST(1050107760 AS Numeric(18, 0)), N'I0027296818', 620, 526, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1145, CAST(1050107760 AS Numeric(18, 0)), N'I0027296826', 620, 526, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1146, CAST(1050107760 AS Numeric(18, 0)), N'I0027296834', 620, 526, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1147, CAST(1050107760 AS Numeric(18, 0)), N'I0027299769', 620, 526, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1148, CAST(1050107760 AS Numeric(18, 0)), N'I0027299777', 620, 526, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1149, CAST(1050107760 AS Numeric(18, 0)), N'I0029105267', 620, 526, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1150, CAST(1050107760 AS Numeric(18, 0)), N'I0029105275', 620, 526, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1151, CAST(1050107760 AS Numeric(18, 0)), N'I0029105283', 620, 526, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1152, CAST(1050107760 AS Numeric(18, 0)), N'I0029105291', 620, 526, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1153, CAST(1057237530 AS Numeric(18, 0)), N'I0027299175', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1154, CAST(1057237530 AS Numeric(18, 0)), N'I0027299183', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1155, CAST(1057237530 AS Numeric(18, 0)), N'I0027299191', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1156, CAST(1057237530 AS Numeric(18, 0)), N'I0027299206', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1157, CAST(1057237530 AS Numeric(18, 0)), N'I0027312436', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1158, CAST(1057237530 AS Numeric(18, 0)), N'I0027312444', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1159, CAST(1057237530 AS Numeric(18, 0)), N'I0027312452', 578, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1160, CAST(1057237530 AS Numeric(18, 0)), N'I0029106336', 578, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1161, CAST(1057237530 AS Numeric(18, 0)), N'I0029106344', 578, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1162, CAST(1057237530 AS Numeric(18, 0)), N'I0029106352', 578, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1163, CAST(1057237530 AS Numeric(18, 0)), N'I0029106360', 578, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1164, CAST(1057237646 AS Numeric(18, 0)), N'I0027317143', 615, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1165, CAST(1057237646 AS Numeric(18, 0)), N'I0027317151', 615, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1166, CAST(1057237646 AS Numeric(18, 0)), N'I0027317193', 615, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1167, CAST(1057237646 AS Numeric(18, 0)), N'I0027317208', 615, 428, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1168, CAST(1057237646 AS Numeric(18, 0)), N'I0029107748', 615, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1169, CAST(1057237646 AS Numeric(18, 0)), N'I0029107756', 615, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1170, CAST(1057237646 AS Numeric(18, 0)), N'I0029107764', 615, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1171, CAST(1057237646 AS Numeric(18, 0)), N'I0029107772', 615, 428, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1172, CAST(1061867094 AS Numeric(18, 0)), N'I0027311854', 611, 467, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1173, CAST(1061867094 AS Numeric(18, 0)), N'I0027311901', 611, 467, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1174, CAST(1061867094 AS Numeric(18, 0)), N'I0027311993', 611, 467, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1175, CAST(1061867094 AS Numeric(18, 0)), N'I0027312004', 611, 467, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1176, CAST(1061867094 AS Numeric(18, 0)), N'I0029109279', 611, 467, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1177, CAST(1061867094 AS Numeric(18, 0)), N'I0029109287', 611, 467, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1178, CAST(1061867094 AS Numeric(18, 0)), N'I0029109295', 611, 467, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1179, CAST(1061867094 AS Numeric(18, 0)), N'I0029109300', 611, 467, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1180, CAST(1079400910 AS Numeric(18, 0)), N'I0027312460', 580, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1181, CAST(1079400910 AS Numeric(18, 0)), N'I0027312478', 580, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1182, CAST(1079400910 AS Numeric(18, 0)), N'I0027312486', 580, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1183, CAST(1079400910 AS Numeric(18, 0)), N'I0027312494', 580, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1184, CAST(1079400910 AS Numeric(18, 0)), N'I0027312509', 580, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1185, CAST(1079400910 AS Numeric(18, 0)), N'I0027312517', 580, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1186, CAST(1079400910 AS Numeric(18, 0)), N'I0029107251', 580, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1187, CAST(1079400910 AS Numeric(18, 0)), N'I0029107269', 580, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1188, CAST(1079400910 AS Numeric(18, 0)), N'I0029107277', 580, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1189, CAST(1079400910 AS Numeric(18, 0)), N'I0029107285', 580, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1190, CAST(1084397012 AS Numeric(18, 0)), N'I0027297490', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1191, CAST(1084397012 AS Numeric(18, 0)), N'I0027297505', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1192, CAST(1084397012 AS Numeric(18, 0)), N'I0027311951', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1193, CAST(1084397012 AS Numeric(18, 0)), N'I0027312088', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1194, CAST(1084397012 AS Numeric(18, 0)), N'I0027312135', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1195, CAST(1084397012 AS Numeric(18, 0)), N'I0027312143', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1196, CAST(1084397012 AS Numeric(18, 0)), N'I0027312151', 627, 532, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1197, CAST(1084397012 AS Numeric(18, 0)), N'I0029109978', 627, 532, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1198, CAST(1084397012 AS Numeric(18, 0)), N'I0029109986', 627, 532, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1199, CAST(1084397012 AS Numeric(18, 0)), N'I0029109994', 627, 532, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1200, CAST(1084397012 AS Numeric(18, 0)), N'I0029110000', 627, 532, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1201, CAST(1084434706 AS Numeric(18, 0)), N'I0029109732', 608, 425, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1202, CAST(1084434706 AS Numeric(18, 0)), N'I0029109740', 608, 425, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1203, CAST(1084434706 AS Numeric(18, 0)), N'I0029109758', 608, 425, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1204, CAST(1084434706 AS Numeric(18, 0)), N'I0029109910', 608, 425, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1205, CAST(1089719735 AS Numeric(18, 0)), N'I0027311927', 622, 527, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1206, CAST(1089719735 AS Numeric(18, 0)), N'I0029109211', 622, 527, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1207, CAST(1089928938 AS Numeric(18, 0)), N'I0027317868', 626, 531, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1208, CAST(1089928938 AS Numeric(18, 0)), N'I0027317876', 626, 531, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1209, CAST(1089928938 AS Numeric(18, 0)), N'I0027317915', 626, 531, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1210, CAST(1089928938 AS Numeric(18, 0)), N'I0027317965', 626, 531, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1211, CAST(1089928938 AS Numeric(18, 0)), N'I0029107536', 626, 531, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1212, CAST(1089928938 AS Numeric(18, 0)), N'I0029107544', 626, 531, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1213, CAST(1089928938 AS Numeric(18, 0)), N'I0029107552', 626, 531, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1214, CAST(1089928938 AS Numeric(18, 0)), N'I0029107560', 626, 531, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1215, CAST(1091649337 AS Numeric(18, 0)), N'I0029110018', 624, 529, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1216, CAST(1091649337 AS Numeric(18, 0)), N'I0029110026', 624, 529, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1217, CAST(1091855204 AS Numeric(18, 0)), N'I0027317680', 576, 430, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1218, CAST(1091855204 AS Numeric(18, 0)), N'I0027317884', 576, 430, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1219, CAST(1091855204 AS Numeric(18, 0)), N'I0027317931', 576, 430, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1220, CAST(1091855204 AS Numeric(18, 0)), N'I0027317973', 576, 430, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1221, CAST(1091855204 AS Numeric(18, 0)), N'I0029107219', 576, 430, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1222, CAST(1091855204 AS Numeric(18, 0)), N'I0029107227', 576, 430, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1223, CAST(1091855204 AS Numeric(18, 0)), N'I0029107235', 576, 430, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1224, CAST(1091855204 AS Numeric(18, 0)), N'I0029107243', 576, 430, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1225, CAST(1103985809 AS Numeric(18, 0)), N'I0029109237', 630, 537, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1226, CAST(1103985809 AS Numeric(18, 0)), N'I0029109245', 630, 537, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1227, CAST(1103985809 AS Numeric(18, 0)), N'I0029109253', 630, 537, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1228, CAST(1103985809 AS Numeric(18, 0)), N'I0029109261', 630, 537, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1229, CAST(1106086638 AS Numeric(18, 0)), N'I0027312371', 582, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1230, CAST(1106086638 AS Numeric(18, 0)), N'I0027312389', 582, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1231, CAST(1106086638 AS Numeric(18, 0)), N'I0027312397', 582, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1232, CAST(1106086638 AS Numeric(18, 0)), N'I0027312525', 582, 434, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1233, CAST(1106086638 AS Numeric(18, 0)), N'I0029107390', 582, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1234, CAST(1106086638 AS Numeric(18, 0)), N'I0029107405', 582, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1235, CAST(1106086638 AS Numeric(18, 0)), N'I0029107413', 582, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1236, CAST(1106086638 AS Numeric(18, 0)), N'I0029107421', 582, 434, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1237, CAST(1111390950 AS Numeric(18, 0)), N'I0027317347', 631, 441, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1238, CAST(1111390950 AS Numeric(18, 0)), N'I0029109114', 631, 441, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1239, CAST(1120772292 AS Numeric(18, 0)), N'I0027311820', 605, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1240, CAST(1120772292 AS Numeric(18, 0)), N'I0027311870', 605, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1241, CAST(1120772292 AS Numeric(18, 0)), N'I0027312012', 605, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1242, CAST(1120772292 AS Numeric(18, 0)), N'I0027312127', 605, 422, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1243, CAST(1120772292 AS Numeric(18, 0)), N'I0029110092', 605, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1244, CAST(1120772292 AS Numeric(18, 0)), N'I0029110107', 605, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1245, CAST(1120772292 AS Numeric(18, 0)), N'I0029110115', 605, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1246, CAST(1120772292 AS Numeric(18, 0)), N'I0029110123', 605, 422, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1247, CAST(1154423588 AS Numeric(18, 0)), N'I0027311812', 568, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1248, CAST(1154423588 AS Numeric(18, 0)), N'I0027311862', 568, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1249, CAST(1154423588 AS Numeric(18, 0)), N'I0027311919', 568, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1250, CAST(1154423588 AS Numeric(18, 0)), N'I0027311969', 568, 423, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1251, CAST(1154423588 AS Numeric(18, 0)), N'I0029109936', 568, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1252, CAST(1154423588 AS Numeric(18, 0)), N'I0029109944', 568, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1253, CAST(1154423588 AS Numeric(18, 0)), N'I0029109952', 568, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1254, CAST(1154423588 AS Numeric(18, 0)), N'I0029109960', 568, 423, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1255, CAST(1232107352 AS Numeric(18, 0)), N'I0027311846', 570, 425, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1256, CAST(1232107352 AS Numeric(18, 0)), N'I0027312054', 570, 425, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1257, CAST(1232107352 AS Numeric(18, 0)), N'I0027312096', 570, 425, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1258, CAST(1232107352 AS Numeric(18, 0)), N'I0027312101', 570, 425, 1, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1259, CAST(1232107352 AS Numeric(18, 0)), N'I0029110034', 570, 425, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1260, CAST(1232107352 AS Numeric(18, 0)), N'I0029110042', 570, 425, 2, 75)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Unit_Id], [Campus_Id], [Inventor_FileUpload_Id]) VALUES (1261, CAST(1236252234 AS Numeric(18, 0)), N'I0029110165', 637, 456, 2, 75)
GO
SET IDENTITY_INSERT [dbo].[AumltInventors] OFF
GO
SET IDENTITY_INSERT [dbo].[Campuses] ON 
GO
INSERT [dbo].[Campuses] ([Campus_id], [Campus_Name]) VALUES (1, N'MITM')
GO
INSERT [dbo].[Campuses] ([Campus_id], [Campus_Name]) VALUES (2, N'MITS')
GO
INSERT [dbo].[Campuses] ([Campus_id], [Campus_Name]) VALUES (3, N'Both')
GO
SET IDENTITY_INSERT [dbo].[Campuses] OFF
GO
SET IDENTITY_INSERT [dbo].[FileUploads] ON 
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (75, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-20T23:58:28.927' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[FileUploads] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Role_Id], [Role_Name]) VALUES (1, N'Super Admin')
GO
INSERT [dbo].[Roles] ([Role_Id], [Role_Name]) VALUES (2, N'Course Coordinator')
GO
INSERT [dbo].[Roles] ([Role_Id], [Role_Name]) VALUES (3, N'Library Staff')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Semesters] ON 
GO
INSERT [dbo].[Semesters] ([Semester_Id], [Semester_Name]) VALUES (1, N'Semester-1')
GO
INSERT [dbo].[Semesters] ([Semester_Id], [Semester_Name]) VALUES (2, N'Semester-2')
GO
INSERT [dbo].[Semesters] ([Semester_Id], [Semester_Name]) VALUES (3, N'Summer')
GO
SET IDENTITY_INSERT [dbo].[Semesters] OFF
GO
SET IDENTITY_INSERT [dbo].[TextBooks] ON 
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (567, 2019, N'Nobles, T., Mattison, B., Matsumura, E., Best, P., Fraser, D., Tan, R., & Willett, R., (', N'Horngren’s Financial Accounting e-Book, 8 th edition.', N'Pearson Education', N'908448040', N'Prescribed', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 422)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (568, 2020, N'Romney,  M.B., Steinbart, P.J., Summers, S.L., & Wood, D.A.', N'Accounting Information Systems, Global Edition eBook (15th Edn)', N'Pearson', N'1154423588', N'Prescribed', 1, 1, 1, 75, N'Ms Beverley Jones', 423)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (569, 2018, N'Leo, K., Knapp, J., McGowan, S. & Sweeting, J', N'Company Accounting, 11th edition', N'John Wiley & Sons', N'1032349264', N'Prescribed', 1, 1, 1, 75, N'Dr Jayasinghe Hewa Dulige', 424)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (570, 2020, N'Sadiq, K., Black, C., Hanegbi, R., Jogarajan, S., Krever, R., Obst, W., Teoh, J., Ting, A.,', N'Principles of Taxation Law 2021', N'Thomson Reuters', N'1232107352', N'Prescribed', 1, 1, 1, 75, N'Irene Collins', 425)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (571, 2018, N'Mowen, M., Hansen, R., Heitger, L', N'Managerial Accounting: The Cornerstone of Business DecisionMaking, 7th edition', N'Cengage Learning.', N'974545640', N'Prescribed', 1, 1, 1, 75, N'Dr Jayasinghe Hewa Dulige', 426)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (572, 2018, N'Harris, J., Hargovan, A., Adams, M', N'Australian Corporate Law, 6th edition', N'Lexis Nexis Butterworths', N'1019688569', N'Prescribed', 1, 1, 1, 75, N'Dr. Tushar Das', 423)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (573, 2012, N'Hopwood, W., Young, Y., & Leiner, J.', N'Forensic Accounting and Fraud Examination, 2nd edition', N'McGraw-Hill', N'496955990', N'Recommended', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 427)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (574, 2011, N'Samson, D., & Daft, R. L.', N'Fundamentals of Management [4th Edition]', N'Cengage', N'711716819', N'Recommended', 1, 1, 1, 75, N'Dr. Eijaz Ahmed Khan', 428)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (575, 2018, N'Albrecht, W. S., Chad O. Albrecht, C. O., Albrecht, C.C., & Zimbelman, M. F', N'Fraud Examination, 6th edition', N'Cengage Learning.', N'1017589900', N'Prescribed', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 429)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (576, 2019, N'Leung, P., Coram, P., Cooper. B., Richardson, P.', N'Audit and Assurance 1st Edn', N'John Wiley and Sons', N'1091855204', N'Prescribed', 1, 1, 1, 75, N'Dr Ronald Macewan Wright', 430)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (577, 2018, N'Pride, W., Ferrel, O., Lukas, B.A., Schembri, S., Niininen, O. & Casidy, R', N'Marketing Principles (3rd Asia Pacific Edition)', N'Cengage Learning', N'973877902', N'Prescribed', 1, 1, 1, 75, N'Dr Gayathri Chethi', 431)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (578, 2018, N'Layton, A., Robinson, T. & Tucker, I', N'Economics for Today, (6th Asia Pacific ed.', N'Cengage Learning', N'1057237530', N'Prescribed', 1, 1, 1, 75, N'Pu Chen', 423)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (579, 2013, N'Loftus, J., Leo, K., Picker, R., Wise, W. & Clark, K', N'Understanding Australian Accounting Standards', N'John Wiley & Sons', N'807180288', N'Recommended', 1, 1, 1, 75, N'Dr Jayasinghe Hewa Dulige', 432)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (580, 2019, N'Graw, S., Parker, D., Whitford, K., Sangkuhl, E., Do, C.', N'Understanding Business Law, 9 th edition', N'Lexis Nexis Butterworths', N'1079400910', N'Prescribed', 1, 1, 1, 75, N'Dr Tushar Das', 423)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (581, 2014, N'Henderson, S., Peirson, G., Herbohn, K. F., Artiach, T & Howieson, B.', N'Issues in Financial Accounting, 15th edition', N'Pearson PrenticeHall.', N'838754052', N'Recommended', 1, 1, 1, 75, N'Dr Jayasinghe Hewa Dulige', 433)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (582, 2019, N'Crane, Matten, Glozer, & Spence', N'Business ethics: managing corporate citizenship and sustainability in the age of globalization, 5th ed.', N'Oxford University Press', N'1106086638', N'Prescribed', 1, 1, 1, 75, N'Dr Marise Williams', 434)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (583, 2018, N'Sharma, E.', N'Strategic Human Resource Management and Development, [1st Edition].', N'Pearson Education', N'1125073856', N'Prescribed', 1, 1, 1, 75, N'Dr Eijaz Ahmed Khan', 435)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (584, 2016, N'Hubbard, R.G., Garnett, A., Lewis, P.T., & O’Brien, A.P.', N'Essentials of Economics (3rd ed.).', N'Pearson Education', N'875346096', N'Recommended', 1, 1, 1, 75, N'Pu Chen', 431)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (585, 2014, N'Gans, J.; Kings, S.; Stonecash, R.; Byford,M.; Libich, J. & Mankiw, N. G', N'Principles of Economics, (6th ed.)', N'Cengage Learning', N'879370188', N'Recommended', 1, 1, 1, 75, N'Pu Chen', 523)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (586, 2014, N'Sharda, R., Delen, D. and Turban, E.', N'Business Intelligence and Analytics: Systems for Decision Support (10th Edition)', N'Pearson', N'881368275', N'Recommended', 1, 1, 1, 75, N'Dr Ken Mardaneh', 433)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (587, 2015, N'Hahn, B., Rufus, R., Miller, L', N'Forensic Accounting, Global Edition', N'Pearson Higher Ed', N'903956190', N'Recommended', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 433)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (588, 2016, N'Nobles, T., Mattison, B., Matsumura, E., Best, P., Fraser, D., Tan, R., & Willett, R.', N'Financial Accounting, 8 th edition', N'Pearson', N'908448040', N'Recommended', 1, 1, 1, 75, N'Dr Mohobbot Ali', 433)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (589, 2016, N'Porter, G. A., & Norton, C.L.', N'Financial Accounting: The Impact on Decision Makers, 10th edition', N'Cengage Learning', N'914290586', N'Recommended', 1, 1, 1, 75, N'Dr Mohobbot Ali', 434)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (590, 2016, N'Picker, R., Clark, K., Dunn, J., Kolitz, D., Livne, G., Loftus, J., & van der Tas, L.,', N'Applying IFRS Standards, 4 th edition.', N'Wiley', N'920727246', N'Recommended', 1, 1, 1, 75, N'Dr Mohobbot Ali', 439)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (591, 2014, N'William Stallings, Moumita Mitra Manna', N'Data and Computer Communications, 10th ed', N'Pearson', N'870646291', N'Prescribed', 1, 1, 1, 75, N'Dr. Giok Han Anies Hannawati Lo', 439)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (592, 2016, N'William Stallings, Florence Agboma, Sofiene Jelassi', N'Foundations of Modern Networking: SDN, NFV, QoE, IoT, and Cloud', N'Pearson', N'927715441', N'Recommended', 1, 1, 1, 75, N'Dr. Giok Han Anies Hannawati Lo', 423)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (593, 2016, N'Locke, C.,', N'Chartered Accountants Australia and New Zealand''s Financial Reporting Handbook 2016', N'John Wiley & Sons Australia', N'940646591', N'Recommended', 1, 1, 1, 75, N'Dr Jayasinghe Hewa Dulige', 431)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (594, 2014, N'Mankiw, N. G', N'Essentials of Economics, (7th ed.)', N'Cengage Learning', N'941428273', N'Recommended', 1, 1, 1, 75, N'Pu Chen', 433)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (595, 2016, N'Selvanathan, E.A., Selvanathan, S., Keller, G', N'Business Statistics, ABRIDGED, Ed. 7;', N'Cengage learning', N'944226207', N'Recommended', 1, 1, 1, 75, N'Dr Ken Mardaneh', 426)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (596, 2016, N'Hanrahan, P., Ramsay, I. & Stapledon, G', N'Commercial Applications of Company Law', N'Oxford University Press', N'946118199', N'Recommended', 1, 1, 1, 75, N'Dr. Tushar Das', 436)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (597, 2016, N'Gulati, R., Mayo, A. J., & Nohria, N.', N'Management: An Integrated Approach', N'Cengage Learning', N'947107355', N'Recommended', 1, 1, 1, 75, N'Dr. Eijaz Ahmed Khan', 436)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (598, 2017, N'Adam, C., Gunasingham, B., Graham, J., Smart, S', N'Introduction to Corporate Finance, 2 nd edition', N'Cengage Learning', N'948669971', N'Recommended', 1, 1, 1, 75, N'', 439)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (599, 2016, N'Scott Empson', N'CCNA Routing and Switching Portable Command Guide', N'Cisco Press', N'951124614', N'Recommended', 1, 1, 1, 75, N'Dr. Giok Han Anies Hannawati Lo', 430)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (600, 2016, N'Newman, A.', N'Business Communication: In Person, In Print, Online [10th Edition]', N'Cengage Learning', N'959949320', N'Recommended', 1, 1, 1, 75, N'Dr Eijaz Ahmed Khan', 428)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (601, 2017, N'Henderson, S., Peirson, G., and Herbohn, K. F., Ramsay, A & Borg, V', N'Issues in Financial Accounting, 16th edition', N'Pearson Prentice-Hall', N'960849457', N'Recommended', 1, 1, 1, 75, N'Dr Mohobbot Ali', 456)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (602, 2017, N'Hitt, M.A., Ireland, D.R., & Hoskisson, R.E.', N'Strategic Management Competitiveness & Globalization Concepts and Cases, 12th ed.', N'Cengage', N'962419489', N'Recommended', 1, 1, 1, 75, N'Stuart Orr', 526)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (603, 2017, N'Hitt, M.A., Ireland, D.R., & Hoskisson, R.E.', N'Strategic Management Competitiveness & Globalization Concepts and Cases, 12th ed.', N'Cengage', N'962419489', N'Recommended', 1, 1, 1, 75, N'Stuart Orr', 439)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (604, 2019, N'Philip Cateora, John Graham, Mary Gilly', N'International Marketing  18th ed', N'McGraw-Hill Education', N'1052903606', N'Prescribed', 1, 1, 1, 75, N'Professor Siva Muthaly', 455)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (605, 2019, N'Nankervis, A., Baird, M., Coffey, J., & Shields, J.', N'Human Resource Management: Strategy and Practice, 10th ed.', N'Cengage', N'1120772292', N'Prescribed', 1, 1, 1, 75, N'Dr Eijaz Khan', 422)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (606, 2016, N'Parkes A., Considine, B., Olesen K., Blount, Y.,', N'Accounting Information Systems: understanding business processes, 5th ed', N'John Wiley', N'995781450', N'Recommended', 1, 1, 1, 75, N'Ms Beverley Jones', 518)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (607, 2017, N'Parkes A., Considine, B., Olesen K., Blount, Y.', N'Accounting Information Systems: understanding business processes, 5th ed', N'John Wiley', N'995781450', N'Recommended', 1, 1, 1, 75, N'Dr Mac Wright', 456)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (608, 2020, N'Hill, C., Schilling, M., & Jones, G.', N'Strategic Management: Theory & Cases: An Integrated Approach, 13th ed', N'Cengage', N'1084434706', N'Prescribed', 1, 1, 1, 75, N'Stuart Orr', 425)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (609, 2020, N'Sveningsson, S & Sorgare, N.', N'Managing change in organizations : how, what and why?', N'Sage', N'1125067477', N'Prescribed', 1, 1, 1, 75, N'Jyoti Sharma', 425)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (610, 2018, N'McLaney, E., & Atrill, P.', N'Accounting and Finance: An Introduction, 9th Edition', N'Pearson', N'1010693529', N'Recommended', 1, 1, 1, 75, N'Dr Mohobbot Ali', 467)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (611, 2019, N'David M. Kroenke, David J. Auer, Scott L. Vandenberg, Robert C. Yoder', N'Database Concepts', N'Pearson', N'1061867094', N'Prescribed', 1, 1, 1, 75, N'Dr Deepani Guruge', 467)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (612, 2019, N'David M. Kroenke, David J. Auer, Scott L. Vandenberg, Robert C. Yoder', N'Database Concepts', N'Pearson', N'1061867094', N'Prescribed', 1, 1, 1, 75, N'Dr Deepani Guruge', 427)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (613, 2014, N'Elliott G.', N'Marketing (3rd edition)', N'John Willey and Sons', N'1037304322', N'Recommended', 1, 1, 1, 75, N'Dr Gayathri Chethi', 422)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (614, 2018, N'Rael, R.', N'The traits of today''s CFO : A handbook for excelling in an evolving role.', N'', N'1046085254', N'Recommended', 1, 1, 1, 75, N'', 427)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (615, 2019, N'Trotman,K., Carson, E., & Morgan,K.,', N'Financial Accounting: An Integrated Approach, 7 th edition', N' Cengage Learning.', N'1057237646', N'Recommended', 1, 1, 1, 75, N'Dr Mohobbot Ali', 428)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (616, 2017, N'Selvanathan, E.A., Selvanathan, S., Keller, G.', N'Business Statistics, ABRIDGED, Ed. 7', N'Cengage', N'944226207', N'Prescribed', 1, 1, 1, 75, N'Dr Ken Mardaneh', 518)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (617, 2018, N'Gelinas, U. J., Dull, R. B. & Wheeler, P.R., Hill, M.C.,', N'Accounting Information Systems. (11th ed.)', N'Cengage', N'1038015578', N'Prescribed', 1, 1, 1, 75, N'Dr Mac Wright', 522)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (618, 2017, N'Henderson, S., Peirson, G., Herbohn, K., Artiach, T. and Howieson, B.', N'Issues in Financial Accounting (16th ed.)', N'Pearson', N'960849457', N'Prescribed', 1, 1, 1, 75, N'Dr Jayasinghe Hewa Dulige', 523)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (619, 2019, N'Anderson, D. R. Sweeney, D. J., Williams, T. A., Camm, J. D., Cochran, J. J., ; Fry, M. J., and Ohlmann, J. W.', N'An Introduction to Management Science: Quantitative Approach, 15th Edition ', N'Cengage', N'1029471680', N'Prescribed', 1, 1, 1, 75, N'Dr Ken Mardaneh', 524)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (620, 2018, N'Gay, G, & Simnett, R.', N'Auditing and Assurance Services in Australia (7th edition)', N'McGraw-Hill', N'1050107760', N'Prescribed', 1, 1, 1, 75, N'Dr Ronald Mac Wright', 526)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (621, 2020, N'Hill, C., Schilling, M., & Jones, G.', N'Strategic Management: Theory & Cases: An Integrated Approach, 13th ed', N'Cengage', N'1084434706', N'Prescribed', 1, 1, 1, 75, N'Stuart Orr', 436)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (622, 2019, N'Clarke, E.A., Wilson, Y., and Wilsom, M.', N'Accounting: An Introduction to Principles and Practice, 9th ed', N'Cengage', N'1089719735', N'Recommended', 1, 1, 1, 75, N'A/Professor Michael De Martinis', 527)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (623, 2018, N'Albrecht, W.S., Albrecht, C.O., Albrecht, C.C., and Zimbelman, M.F.,', N'Fraud Examination (6th edition)', N'Cengage', N'1017589900', N'Prescribed', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 527)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (624, 2019, N'Palepu, K. G., Healy, P. M. and Peek E', N'Business Analysis and Valuation: IFRS Edition (5th edition', N'Cengage', N'1091649337', N'Prescribed', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 529)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (625, 2018, N'Bajpal, N.', N'Business Research Methods,', N'Pearson', N'1007702123', N'Prescribed', 1, 1, 1, 75, N'Professor Siva Muthaly', 530)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (626, 2018, N'Neck, H. M., Neck, C. P., Murray, E. L.', N'Entrepreneurship: The Practice and Mindset', N'Sage', N'1089928938', N'Prescribed', 1, 1, 1, 75, N'Dr Eijaz Ahmed Khan', 531)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (627, 2019, N'R. Peck, T. Short', N'Introduction to Statistics and Data Analysis (6th ed.)', N'Cengage Learning US', N'1084397012', N'Prescribed', 1, 1, 1, 75, N'Prof Paul Kwan', 532)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (628, 2017, N'Wes McKinney', N'Python for Data Analysis', N'O''Reilly Media, Inc.', N'1005138881', N'Prescribed', 1, 1, 1, 75, N'Dr Deepani Guruge', 533)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (629, 2018, N'George Reynolds', N'Ethics in Information Technology 6th Edition', N'Cengage Learning', N'995773615', N'Prescribed', 1, 1, 1, 75, N'Prof Savitri Bevinakoppa', 535)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (630, 2019, N'Pressman, R. S., Maxim, B. R. ', N'Software Engineering: A Practitioner''s Approach', N'McGraw-Hill Education', N'1103985809', N'Prescribed', 1, 1, 1, 75, N'Dr Tayab Memon', 537)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (631, 2020, N'Hanrahan, P., Ramsay, I. & Stapledon, G', N'Commercial Applications of Company Law', N'Oxford University Press', N'1111390950', N'Recommended', 1, 1, 1, 75, N'Dr Tushar Das', 441)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (632, 2020, N'Dahl, J. ', N'Leading Lean', N'O’ Reilly Media, Inc.', N'1137802617', N'Recommended', 1, 1, 1, 75, N'A/Prof Monica Jurin', 439)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (633, 2020, N'Scott Empson', N'CCNA 200-301 Portable Command Guide', N'Cisco Press', N'1138950110', N'Recommended', 1, 1, 1, 75, N'Dr. Giok Han Anies Hannawati Lo', 523)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (634, 2020, N'Grant, R.M., Murray, P., Orr, S, Butler, B., Bezemer, M.', N'Strategic Management, Essentials Edition', N'John Wiley & Sons', N'1156470516', N'Recommended', 1, 1, 1, 75, N'Stuart Orr', 526)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (635, 2020, N'Grant, R.M., Murray, P., Orr, S, Butler, B., Bezemer, M.', N'Strategic Management, Essentials Edition', N'John Wiley & Sons', N'1156470516', N'Recommended', 1, 1, 1, 75, N'Stuart Orr', 439)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (636, 2020, N'Cisco Networking Academy', N'Introduction to Networks Companion Guide (CCNAv7), 1st ed', N'Cisco Press', N'1156472972', N'Recommended', 1, 1, 1, 75, N'Dr. Giok Han Anies Hannawati Lo', 527)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (637, 2020, N'Woellner, R., Woellner, R.H., Barkoczy, S., Murphy, S., Evans, C., Pinto, D', N'Australian Taxation Law (31th ed.)', N'Oxford University Press', N'1236252234', N'Recommended', 1, 1, 1, 75, N'Irene Collins', 456)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (638, 2020, N'Fred R. David, Forest R. David', N'Strategic Management: A Competitive Advantage Approach, Concepts and Cases, 16th ed', N'Pearson', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Stuart Orr', 530)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (639, 2020, N'Fred R. David, Forest R. David', N'Strategic Management: A Competitive Advantage Approach, Concepts and Cases, 16th ed', N'Pearson', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Stuart Orr', 531)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (640, 2013, N'Emerson, L.', N'Writing Guidelines for Business Students (5th ed.)', N'Cengage Learning Australia', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Marise Williams', 532)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (641, 2019, N'Trotman,K., Gibbins,M., & Carson, E.,', N'Financial Accounting: An Integrated Approach, 7 th edition', N'Cengage Learning', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 435)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (642, 2017, N'Vaughn, L.', N'Concise Guide to Critical Thinking', N'Oxford University Press.', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Marise Williams', 435)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (643, 2016, N'Vaughn, L', N'The Power of Critical Thinking: Effective Reasoning About Ordinary and Extraordinary Claims (5th ed.)', N'Oxford University Press', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Marise Williams', 434)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (644, 2020, N'Jerry J. Weygandt, Paul D. Kimmel, Donald E. Kieso', N'Financial Accounting , 11th edition', N'John Wiley', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 435)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (645, 2019, N'Parboteeah, K. P., & Cullen, J. B.', N'Business Ethics (2nd ed.)', N'Routledge', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Marise Williams', 528)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (646, 2021, N'Becker, EF, Wortmann, J', N'Mastering Communication at Work, Second Edition: How to Lead, Manage, and Influence, 2nd Edition', N'McGraw-Hill', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'A/Prof Monica Jurin', 436)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (647, 2015, N'DuBrin, A.', N'Human Relations: Interpersonal Job-Oriented Skills. (12th ed.). ', N'New Jersey, USA: Prentice-Hall.', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'A/Prof Monica Jurin', 434)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (648, 2017, N'Werner, J.,', N'Human Resource Development: Talent Development, [7th Edition]', N'Cengage Learning', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Eijaz Ahmed Khan', 436)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (649, 2018, N'Gido, J., Clements, J., & Baker, R', N'Successful Project Management. (7th ed.).', N'Cengage Learning.', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'A/Prof Monica Jurin', 429)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (650, 2018, N'Johnstone, K., Gramling, A., & Rittenberg, L. E.', N'Auditing: A Risk-Based Approach to Conducting a Quality Audit, 11th edition.', N'Cengage Learning.', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Ronald Macewan Wright', 429)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (651, 2019, N'Andrew Thomas, Anne Marie Ward', N'Introdcution to Financial Accounting, 9th edition', N'McGraw-Hill Australia', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'A/Prof Michael De Martinis', 435)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (652, 2017, N'West, S', N'Critical Thinking Skills: Practical Strategies for Better Decision making, Problem-Solving and Goal Setting', N'CreateSpace Independent Publishing Platform', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'Dr Marise Williams', 427)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Semesters_Id], [Year_Id], [Campus_Id], [FileUpload_Id], [Coordinator_Name], [Unit_Id]) VALUES (653, 2017, N'Ross, S. A., Drew, M., Walk, A., Westerfield, R., & Jordan, B. D.', N'Fundamentals of Corporate Finance (7th ed.)', N'McGraw-Hill Education', N'9780000000000', N'Recommended', 1, 1, 1, 75, N'', 429)
GO
SET IDENTITY_INSERT [dbo].[TextBooks] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (422, N'BA206', N'Accounting Information Systems and Cloud Technologies', 25, 1, 0, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (423, N'BA214', N'Corporate Accounting', 25, 1, 8, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (424, N'BA215', N'Taxation Law', 25, 1, 6, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (425, N'BA216', N'Management Accounting for Planning and Control', 25, 1, 7, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (426, N'BA217', N'Company Law', 25, 1, 1, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (427, N'BA301', N'Introduction to Finance', 25, 1, 5, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (428, N'BA302', N'Accounting Theory', 25, 1, 8, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (429, N'BA313', N'Auditing', 25, 1, 7, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (430, N'BB101', N'Business Communications', 26, 1, 25, 0, 58)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (431, N'BB106', N'Economic Principles', 25, 1, 22, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (432, N'BB107', N'Commercial Law', 25, 1, 15, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (433, N'BB108', N'Business Statistics', 25, 1, 19, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (434, N'BB212', N'Human Resource Development', 25, 1, 9, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (435, N'BB313', N'Critical Thinking and Decision Making', 25, 1, 13, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (436, N'BB330', N'Industry Based Capstone Project', 10, 1, 10, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (437, N'BE101', N'Engineering Mathematics ', 25, 1, 6, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (438, N'BE201', N'Digital Communication', 25, 1, 7, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (439, N'BE202', N'Local and Wide Area Network Technologies', 25, 1, 6, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (440, N'BE203', N'Telecommunication Systems', 25, 1, 5, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (441, N'BE301', N'Telecommunication Modelling and simulation', 25, 1, 11, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (442, N'BE302', N'Mobile and Satellite Communication Systems', 25, 1, 12, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (443, N'BE303', N'Project 1', 25, 1, 6, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (444, N'BE304', N'Project 2', 25, 1, 10, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (445, N'BE700', N'Industry experience', 25, 1, 10, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (446, N'BK202', N'Consumer Behaviour', 25, 1, 6, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (447, N'BK208', N'Digital Marketing Foundations', 25, 1, 9, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (448, N'BK209', N'Digital Content Creation and Management', 25, 1, 0, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (449, N'BK210', N'Market Research', 25, 1, 0, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (450, N'BK213', N'Services Marketing', 25, 1, 14, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (451, N'BK214', N'Integrated Marketing Communications', 25, 1, 4, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (452, N'BK217', N'Social Media, Video and Search Marketing', 25, 1, 2, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (453, N'BK307', N'Designing the User Experience', 25, 1, 0, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (454, N'BM203', N'Project Management', 25, 1, 15, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (455, N'BM212', N'Strategic Human Resource Management', 25, 1, 4, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (456, N'BM302', N'Strategic Management', 5, 1, 1, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (457, N'BN103', N'Platform Technologies', 100, 1, 66, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (458, N'BN104', N'Operating Systems', 125, 1, 88, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (459, N'BN106', N'Networking Fundamentals', 100, 1, 63, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (460, N'BN108', N'Introduction to Programming ', 75, 1, 48, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (461, N'BN109', N'Web and Multimedia Systems', 75, 1, 50, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (462, N'BN110', N'Information Systems Fundamentals', 25, 1, 23, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (463, N'BN111', N'Programming Fundamentals', 25, 1, 1, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (464, N'BN200', N'Network Security Fundamentals', 75, 1, 61, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (465, N'BN201', N'Professional Issues of IT', 25, 1, 17, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (466, N'BN202', N'Internetworking Technologies', 35, 1, 33, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (467, N'BN204', N'Database Technologies', 17, 1, 17, 0, 51)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (468, N'BN205', N'Project Management', 26, 1, 25, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (469, N'BN206', N'System Administration and Management', 50, 1, 46, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (470, N'BN208', N'Networked Applications', 25, 1, 15, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (471, N'BN209', N'Software Engineering', 35, 1, 29, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (472, N'BN223', N'Cyber Security Principles', 26, 1, 25, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (473, N'BN301', N'Industry Based Project 1 ', 50, 1, 27, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (474, N'BN303', N'Wireless Networks and Security', 35, 1, 32, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (475, N'BN304', N'Industry Based Project 2', 50, 1, 33, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (476, N'BN305', N'Virtual Private Networks', 35, 1, 27, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (477, N'BN309', N'Computer Forensics', 50, 1, 26, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (478, N'BN321', N'Advanced Network Design', 40, 1, 25, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (479, N'BN323', N'Ethical Hacking and Security Governance', 25, 1, 22, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (480, N'BN324', N'Enterprise Cyber Security and Management', 30, 1, 20, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (481, N'BUACC2603', N'Corporate Accounting', 25, 1, 6, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (482, N'BUACC3701', N'Financial Management', 25, 1, 5, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (483, N'BUACC3706', N'Financial Accounting', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (484, N'BUACC5935', N'Auditing and Assurance Services', 3, 1, 0, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (485, N'BUENT3705', N'WORK INTEGRATED LEARNING: INDUSTRY BASED CASE STUDIES', 25, 1, 6, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (486, N'BUGEN1502', N'Business Statistics', 25, 1, 19, 0, 42)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (487, N'BUHRM1501', N'Introduction to Human Resource', 25, 1, 5, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (488, N'BULAW2611', N'Organisations Law', 4, 1, 0, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (489, N'BUMGT1501', N'Management Principles', 25, 1, 9, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (490, N'BUMGT2621', N'Business Communications', 25, 1, 3, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (491, N'BUMGT5922', N'Effective Business Communication', 25, 1, 5, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (492, N'BUMGT5977', N'Innovation And Entrepreneurship', 3, 1, 0, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (493, N'BUMGT6973', N'Project Management', 2, 1, 0, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (494, N'BUMKT1501', N'Introduction to Marketing', 25, 1, 1, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (495, N'ITECH1001', N'Communication and Technology', 25, 1, 3, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (496, N'ITECH1101', N'IT Problem Solving', 25, 1, 4, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (497, N'ITECH1102', N'Networking and Security', 25, 1, 7, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (498, N'ITECH1103', N'Big Data and Analytics', 25, 1, 3, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (499, N'ITECH1104', N'Cloud and Enterprise Computing', 25, 1, 10, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (500, N'ITECH1400', N'Foundations of Programming', 25, 1, 3, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (501, N'ITECH2000', N'Mobile Development Fundamentals', 2, 1, 0, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (502, N'ITECH2001', N'Game Development Fundamentals', 25, 1, 3, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (503, N'ITECH2004', N'Data Modelling', 25, 1, 9, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (504, N'ITECH2250', N'IT Project management Techniques', 25, 1, 11, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (505, N'ITECH2300', N'MOBILE NETWORKS AND WIRELESS COMMUNICATIONS', 20, 1, 17, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (506, N'ITECH2305', N'Analysing The Modern Business', 13, 1, 12, 0, 30)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (507, N'ITECH2309', N'Software Engineering', 25, 1, 4, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (508, N'ITECH3001', N'User Experience', 25, 1, 8, 0, 28)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (509, N'ITECH3002', N'Professionalism and Entrepreneurship', 27, 1, 26, 0, 60)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (510, N'ITECH3100', N'Cloud And Mobile Security', 25, 1, 19, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (511, N'ITECH3101', N'Business Analytics and Decision Support', 25, 1, 10, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (512, N'ITECH3103', N'IT Strategy and Governance', 25, 1, 5, 0, 30)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (513, N'ITECH3208', N'Project1', 25, 1, 17, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (514, N'ITECH3209', N'Project 2', 25, 1, 21, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (515, N'ITECH7400', N'IT Service Management and Professional Culture', 25, 1, 10, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (516, N'ITECH7409', N'Software Testing', 25, 1, 5, 0, 25)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (517, N'ITECH7415', N'Masters Project', 30, 1, 28, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (518, N'MA509', N'Accounting Information Systems', 1, 1, 0, 1, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (519, N'MA511', N'Financial Accounting and Reporting', 25, 1, 5, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (520, N'MA514', N'Business Finance', 25, 1, 12, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (521, N'MA515', N'Managerial Accounting', 25, 1, 8, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (522, N'MA601', N'Theory and Current Issues in Accounting', 25, 1, 22, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (523, N'MA609', N'Business Analytics and Data Intelligence', 25, 1, 19, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (524, N'MA611', N'Auditing', 50, 1, 38, 0, 53)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (525, N'MA613', N'Taxation Law', 35, 1, 30, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (526, N'MA616', N'Strategic Management', 25, 1, 6, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (527, N'MA617', N'Forensic Accounting', 25, 1, 0, 1, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (528, N'MA618', N'Industry Based Capstone Project', 43, 1, 43, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (529, N'MA619', N'Accounting Research', 50, 1, 47, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (530, N'MA625', N'Entrepreneurship and Innovation', 25, 1, 10, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (531, N'MDA511', N'Mathematical and Statistical Methods', 100, 1, 72, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (532, N'MDA512', N'Data Science', 100, 1, 74, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (533, N'MDA513', N'ICT Practices', 100, 1, 73, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (534, N'MDA522', N'Artificial Intelligence', 25, 1, 3, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (535, N'MDA523', N'Software Engineering Fundamentals', 25, 1, 2, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (536, N'ME502', N'Overview of Digital Communication', 25, 1, 7, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (537, N'ME504', N'Advanced Networking', 25, 1, 3, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (538, N'ME601', N'Telecommunication Modeling and simulation ', 25, 1, 8, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (539, N'ME602', N'Mobile and Satellite Communication Systems', 25, 1, 16, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (540, N'ME603', N'Project 1', 25, 1, 4, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (541, N'ME604', N'Project 2', 25, 1, 18, 0, 50)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (542, N'ME700', N'Industry Experience', 25, 1, 0, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (543, N'MIT001', N'Learning Foundations', 150, 1, 544, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (544, N'MLC101', N'Student Language Support Program', 100, 1, 9, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (545, N'MN404', N'Fundamentals of Operating Systems and Programming', 225, 1, 156, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (546, N'MN405', N'Data and Information Management', 225, 1, 157, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (547, N'MN501', N'Network Management in Organisations', 200, 1, 151, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (548, N'MN502', N'Overview of Network Security', 300, 1, 209, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (549, N'MN503', N'Overview of Internetworking', 125, 1, 98, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (550, N'MN504', N'Networked Application Management', 50, 1, 27, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (551, N'MN506', N'System Management', 75, 1, 25, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (552, N'MN601', N'Network Project Management', 100, 1, 27, 0, 100)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (553, N'MN603', N'Wireless Networks and Security', 50, 1, 49, 0, 200)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (554, N'MN621', N'Advanced Network Design', 102, 1, 102, 0, 402)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (555, N'MN623', N'Cyber Security and Analytics', 50, 1, 34, 0, 200)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (556, N'MN624', N'Digital Forensics', 125, 1, 101, 0, 400)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (557, N'MN691', N'Research Methods and Project Design', 37, 1, 37, 0, 200)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (558, N'MN692', N'Capstone Project', 116, 1, 116, 0, 215)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (559, N'PGCNA001', N'Assessment Workshop', 500, 1, 255, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (560, N'PGDAA001', N'Assessment Workshop', 500, 1, 77, 0, 0)
GO
INSERT [dbo].[Units] ([Unit_Id], [Unit_Code], [Unit_Title], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity]) VALUES (561, N'UGCNA001', N'Assessment Workshop', 500, 1, 74, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (1, N'kinjal@mit.edu.au', N'Kinjal@143', N'Kinjal', N'Lahar', 1)
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (4, N'kinjal2@mit.edu.au', N'Kinjal@143', N'kinjal.1', N'lahar', 2)
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (5, N'kinjal3@mit.edu.au', N'Kinjal@143', N'kinjal', N'lahar', 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Years] ON 
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (1, N'2020')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (2, N'2021')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (3, N'2022')
GO
SET IDENTITY_INSERT [dbo].[Years] OFF
GO
ALTER TABLE [dbo].[AumltInventors]  WITH CHECK ADD  CONSTRAINT [FK_AumltInventors_Campuses] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Campus_id])
GO
ALTER TABLE [dbo].[AumltInventors] CHECK CONSTRAINT [FK_AumltInventors_Campuses]
GO
ALTER TABLE [dbo].[AumltInventors]  WITH CHECK ADD  CONSTRAINT [FK_AumltInventors_FileUploads] FOREIGN KEY([Inventor_FileUpload_Id])
REFERENCES [dbo].[FileUploads] ([File_Upload_Id])
GO
ALTER TABLE [dbo].[AumltInventors] CHECK CONSTRAINT [FK_AumltInventors_FileUploads]
GO
ALTER TABLE [dbo].[AumltInventors]  WITH CHECK ADD  CONSTRAINT [FK_AumltInventors_TextBooks] FOREIGN KEY([TextBookId])
REFERENCES [dbo].[TextBooks] ([TextBook_Id])
GO
ALTER TABLE [dbo].[AumltInventors] CHECK CONSTRAINT [FK_AumltInventors_TextBooks]
GO
ALTER TABLE [dbo].[AumltInventors]  WITH CHECK ADD  CONSTRAINT [FK_AumltInventors_Units] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[Units] ([Unit_Id])
GO
ALTER TABLE [dbo].[AumltInventors] CHECK CONSTRAINT [FK_AumltInventors_Units]
GO
ALTER TABLE [dbo].[Coordinators]  WITH CHECK ADD  CONSTRAINT [FK_Coordinators_Units] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[Units] ([Unit_Id])
GO
ALTER TABLE [dbo].[Coordinators] CHECK CONSTRAINT [FK_Coordinators_Units]
GO
ALTER TABLE [dbo].[FileUploads]  WITH CHECK ADD  CONSTRAINT [FK_FileUploads_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[FileUploads] CHECK CONSTRAINT [FK_FileUploads_Users]
GO
ALTER TABLE [dbo].[TextBooks]  WITH CHECK ADD  CONSTRAINT [FK_TextBooks_Campuses] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Campus_id])
GO
ALTER TABLE [dbo].[TextBooks] CHECK CONSTRAINT [FK_TextBooks_Campuses]
GO
ALTER TABLE [dbo].[TextBooks]  WITH CHECK ADD  CONSTRAINT [FK_TextBooks_FileUploads] FOREIGN KEY([FileUpload_Id])
REFERENCES [dbo].[FileUploads] ([File_Upload_Id])
GO
ALTER TABLE [dbo].[TextBooks] CHECK CONSTRAINT [FK_TextBooks_FileUploads]
GO
ALTER TABLE [dbo].[TextBooks]  WITH CHECK ADD  CONSTRAINT [FK_TextBooks_Semesters] FOREIGN KEY([Semesters_Id])
REFERENCES [dbo].[Semesters] ([Semester_Id])
GO
ALTER TABLE [dbo].[TextBooks] CHECK CONSTRAINT [FK_TextBooks_Semesters]
GO
ALTER TABLE [dbo].[TextBooks]  WITH CHECK ADD  CONSTRAINT [FK_TextBooks_Units] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[Units] ([Unit_Id])
GO
ALTER TABLE [dbo].[TextBooks] CHECK CONSTRAINT [FK_TextBooks_Units]
GO
ALTER TABLE [dbo].[TextBooks]  WITH CHECK ADD  CONSTRAINT [FK_TextBooks_Years] FOREIGN KEY([Year_Id])
REFERENCES [dbo].[Years] ([Year_Id])
GO
ALTER TABLE [dbo].[TextBooks] CHECK CONSTRAINT [FK_TextBooks_Years]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [FK_Units_Campuses] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Campus_id])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [FK_Units_Campuses]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Role_Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [MITDB] SET  READ_WRITE 
GO
