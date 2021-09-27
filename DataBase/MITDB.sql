
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
/****** Object:  Table [dbo].[AumltInventors]    Script Date: 27/09/2021 8:34:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AumltInventors](
	[AUMLTInventor_Id] [int] IDENTITY(1,1) NOT NULL,
	[OCLC_Number] [nvarchar](max) NULL,
	[Item_Barcode] [nvarchar](max) NULL,
	[TextBookId] [int] NULL,
	[Campus_Id] [int] NULL,
	[Inventor_FileUpload_Id] [int] NULL,
	[UnitCode_Id] [int] NULL,
 CONSTRAINT [PK_AumltInventors] PRIMARY KEY CLUSTERED 
(
	[AUMLTInventor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campuses]    Script Date: 27/09/2021 8:34:08 PM ******/
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
/****** Object:  Table [dbo].[Coordinators]    Script Date: 27/09/2021 8:34:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordinators](
	[Coordinator_Id] [int] IDENTITY(1,1) NOT NULL,
	[Coordinator_Name] [nvarchar](50) NULL,
	[UnitCode_Id] [int] NULL,
 CONSTRAINT [PK_Coordinators] PRIMARY KEY CLUSTERED 
(
	[Coordinator_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileUploads]    Script Date: 27/09/2021 8:34:08 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 27/09/2021 8:34:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[TextBook_Id] [int] NULL,
	[Unit_Id] [int] NULL,
	[IsNew] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[OrderComplated] [bit] NULL,
	[FileId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 27/09/2021 8:34:08 PM ******/
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
/****** Object:  Table [dbo].[Semesters]    Script Date: 27/09/2021 8:34:08 PM ******/
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
/****** Object:  Table [dbo].[StudentEnrollments]    Script Date: 27/09/2021 8:34:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollments](
	[StudentEnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[UnitCode_Id] [int] NULL,
	[Capacity] [int] NULL,
	[Campus_Id] [int] NULL,
	[Total_Enrollment] [int] NULL,
	[RunningOrNot] [bit] NULL,
	[Lab_and_tut_capacity] [int] NULL,
	[StudentDetail_FileId] [int] NULL,
 CONSTRAINT [PK_StudentEnrollments] PRIMARY KEY CLUSTERED 
(
	[StudentEnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBooks]    Script Date: 27/09/2021 8:34:08 PM ******/
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
	[Coordinator_Name] [nvarchar](max) NULL,
	[UnitCode_Id] [int] NULL,
 CONSTRAINT [PK_TextBooks] PRIMARY KEY CLUSTERED 
(
	[TextBook_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitCode]    Script Date: 27/09/2021 8:34:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitCode](
	[UnitCodeId] [int] IDENTITY(1,1) NOT NULL,
	[UnitCodeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UnitCode] PRIMARY KEY CLUSTERED 
(
	[UnitCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/09/2021 8:34:08 PM ******/
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
/****** Object:  Table [dbo].[Years]    Script Date: 27/09/2021 8:34:08 PM ******/
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
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (1, N'711716819', N'I0027227754', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (2, N'711716819', N'I0027227762', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (3, N'711716819', N'I0027227770', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (4, N'711716819', N'I0027227801', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (5, N'711716819', N'I0027227827', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (6, N'711716819', N'I0027231575', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (7, N'711716819', N'I0027231583', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (8, N'711716819', N'I0027231622', 11, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (9, N'711716819', N'I0029060598', 11, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (10, N'711716819', N'I0029060603', 11, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (11, N'711716819', N'I0029060611', 11, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (12, N'711716819', N'I0029060629', 11, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (13, N'807180288', N'I0027262445', 16, 1, 9, 11)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (14, N'807180288', N'I0027262453', 16, 1, 9, 11)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (15, N'807180288', N'I0029087736', 16, 2, 9, 11)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (16, N'807180288', N'I0029087744', 16, 2, 9, 11)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (17, N'838754052', N'I0027261449', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (18, N'838754052', N'I0027261457', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (19, N'838754052', N'I0027261465', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (20, N'838754052', N'I0027261473', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (21, N'838754052', N'I0027261504', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (22, N'838754052', N'I0027261512', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (23, N'838754052', N'I0027261520', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (24, N'838754052', N'I0027261538', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (25, N'838754052', N'I0027274955', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (26, N'838754052', N'I0027279913', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (27, N'838754052', N'I0027279921', 18, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (28, N'838754052', N'I0029080857', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (29, N'838754052', N'I0029080996', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (30, N'838754052', N'I0029081007', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (31, N'838754052', N'I0029086984', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (32, N'838754052', N'I0029087273', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (33, N'838754052', N'I0029087281', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (34, N'838754052', N'I0029087299', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (35, N'838754052', N'I0029087304', 18, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (36, N'870646291', N'I0027259434', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (37, N'870646291', N'I0027259442', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (38, N'870646291', N'I0027267445', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (39, N'870646291', N'I0027267518', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (40, N'870646291', N'I0027267526', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (41, N'870646291', N'I0027289861', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (42, N'870646291', N'I0027289879', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (43, N'870646291', N'I0027290862', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (44, N'870646291', N'I0027290870', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (45, N'870646291', N'I0027292131', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (46, N'870646291', N'I0027292149', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (47, N'870646291', N'I0027292157', 28, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (48, N'870646291', N'I0029092228', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (49, N'870646291', N'I0029093622', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (50, N'870646291', N'I0029093630', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (51, N'870646291', N'I0029093648', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (52, N'870646291', N'I0029101679', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (53, N'870646291', N'I0029101687', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (54, N'870646291', N'I0029106166', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (55, N'870646291', N'I0029106174', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (56, N'870646291', N'I0029106182', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (57, N'870646291', N'I0029106190', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (58, N'870646291', N'I0029106205', 28, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (59, N'875346096', N'I0027268124', 21, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (60, N'879370188', N'I0027278941', 22, 1, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (61, N'879370188', N'I0027278959', 22, 1, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (62, N'879370188', N'I0027278967', 22, 1, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (63, N'879370188', N'I0027278975', 22, 1, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (64, N'879370188', N'I0027283328', 22, 1, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (65, N'879370188', N'I0027283336', 22, 1, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (66, N'879370188', N'I0029084699', 22, 2, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (67, N'879370188', N'I0029084704', 22, 2, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (68, N'879370188', N'I0029084712', 22, 2, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (69, N'879370188', N'I0029084720', 22, 2, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (70, N'879370188', N'I0029100966', 22, 2, 9, 102)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (71, N'881368275', N'I0027271185', 23, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (72, N'881368275', N'I0027271193', 23, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (73, N'881368275', N'I0027271208', 23, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (74, N'881368275', N'I0027271216', 23, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (75, N'881368275', N'I0029095577', 23, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (76, N'881368275', N'I0029095585', 23, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (77, N'881368275', N'I0029095593', 23, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (78, N'881368275', N'I0029095608', 23, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (79, N'908448040', N'I0027278470', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (80, N'908448040', N'I0027278488', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (81, N'908448040', N'I0027278496', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (82, N'908448040', N'I0027278501', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (83, N'908448040', N'I0027278519', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (84, N'908448040', N'I0027278527', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (85, N'908448040', N'I0027278535', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (86, N'908448040', N'I0027284138', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (87, N'908448040', N'I0027284146', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (88, N'908448040', N'I0027284154', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (89, N'908448040', N'I0027284162', 4, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (90, N'908448040', N'I0029084021', 4, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (91, N'908448040', N'I0029084039', 4, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (92, N'908448040', N'I0029084047', 4, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (93, N'908448040', N'I0029084055', 4, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (94, N'914290586', N'I0027279507', 26, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (95, N'914290586', N'I0027279565', 26, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (96, N'914290586', N'I0027279581', 26, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (97, N'914290586', N'I0027279604', 26, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (98, N'914290586', N'I0027279612', 26, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (99, N'914290586', N'I0027283946', 26, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (100, N'914290586', N'I0029085166', 26, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (101, N'914290586', N'I0029085174', 26, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (102, N'914290586', N'I0029085182', 26, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (103, N'914290586', N'I0029085190', 26, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (104, N'940646591', N'I0027278365', 30, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (105, N'940646591', N'I0027278373', 30, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (106, N'940646591', N'I0029084982', 30, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (107, N'940646591', N'I0029084990', 30, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (108, N'941428273', N'I0027276321', 31, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (109, N'941428273', N'I0027276339', 31, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (110, N'941428273', N'I0027276347', 31, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (111, N'941428273', N'I0027276355', 31, 1, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (112, N'941428273', N'I0029080344', 31, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (113, N'941428273', N'I0029080352', 31, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (114, N'941428273', N'I0029080360', 31, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (115, N'941428273', N'I0029080378', 31, 2, 9, 12)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (116, N'944226207', N'I0027292953', 32, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (117, N'944226207', N'I0027294573', 32, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (118, N'944226207', N'I0027294581', 32, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (119, N'944226207', N'I0027294599', 32, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (120, N'944226207', N'I0029104083', 32, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (121, N'944226207', N'I0029104091', 32, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (122, N'944226207', N'I0029104106', 32, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (123, N'944226207', N'I0029104114', 32, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (124, N'946118199', N'I0027276509', 33, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (125, N'946118199', N'I0027276517', 33, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (126, N'946118199', N'I0027276525', 33, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (127, N'946118199', N'I0027276533', 33, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (128, N'946118199', N'I0029080718', 33, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (129, N'946118199', N'I0029080726', 33, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (130, N'946118199', N'I0029080734', 33, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (131, N'946118199', N'I0029080742', 33, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (132, N'947107355', N'I0027279337', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (133, N'947107355', N'I0027279345', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (134, N'947107355', N'I0027279353', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (135, N'947107355', N'I0027279361', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (136, N'947107355', N'I0027279379', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (137, N'947107355', N'I0027279387', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (138, N'947107355', N'I0027279395', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (139, N'947107355', N'I0027283556', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (140, N'947107355', N'I0027283564', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (141, N'947107355', N'I0027283572', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (142, N'947107355', N'I0027283580', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (143, N'947107355', N'I0027283988', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (144, N'947107355', N'I0027283996', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (145, N'947107355', N'I0027284007', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (146, N'947107355', N'I0027284015', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (147, N'947107355', N'I0027284023', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (148, N'947107355', N'I0027284031', 34, 1, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (149, N'947107355', N'I0029085027', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (150, N'947107355', N'I0029085035', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (151, N'947107355', N'I0029085043', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (152, N'947107355', N'I0029085051', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (153, N'947107355', N'I0029101069', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (154, N'947107355', N'I0029101077', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (155, N'947107355', N'I0029101085', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (156, N'947107355', N'I0029101093', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (157, N'947107355', N'I0029101108', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (158, N'947107355', N'I0029101116', 34, 2, 9, 15)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (159, N'948669971', N'I0027285265', 35, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (160, N'948669971', N'I0027285273', 35, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (161, N'948669971', N'I0027285281', 35, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (162, N'948669971', N'I0027285299', 35, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (163, N'948669971', N'I0027293789', 35, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (164, N'948669971', N'I0027293797', 35, 1, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (165, N'948669971', N'I0029098224', 35, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (166, N'948669971', N'I0029098232', 35, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (167, N'948669971', N'I0029098240', 35, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (168, N'948669971', N'I0029098258', 35, 2, 9, 18)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (169, N'959949320', N'I0027296517', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (170, N'959949320', N'I0027296525', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (171, N'959949320', N'I0027296533', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (172, N'959949320', N'I0027296541', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (173, N'959949320', N'I0027298056', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (174, N'959949320', N'I0027298064', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (175, N'959949320', N'I0027298072', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (176, N'959949320', N'I0027298080', 37, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (177, N'959949320', N'I0029105102', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (178, N'959949320', N'I0029105110', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (179, N'959949320', N'I0029105128', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (180, N'959949320', N'I0029105136', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (181, N'959949320', N'I0029105649', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (182, N'959949320', N'I0029105657', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (183, N'959949320', N'I0029105908', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (184, N'959949320', N'I0029105958', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (185, N'959949320', N'I0029106001', 37, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (186, N'960849457', N'I0027294769', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (187, N'960849457', N'I0027294777', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (188, N'960849457', N'I0027294785', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (189, N'960849457', N'I0027294793', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (190, N'960849457', N'I0027295511', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (191, N'960849457', N'I0027295529', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (192, N'960849457', N'I0027295537', 38, 1, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (193, N'960849457', N'I0029103582', 38, 2, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (194, N'960849457', N'I0029103590', 38, 2, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (195, N'960849457', N'I0029103605', 38, 2, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (196, N'960849457', N'I0029103613', 38, 2, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (197, N'973877902', N'I0027294361', 14, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (198, N'973877902', N'I0027294379', 14, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (199, N'973877902', N'I0027294387', 14, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (200, N'973877902', N'I0027294418', 14, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (201, N'973877902', N'I0027295935', 14, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (202, N'973877902', N'I0027299921', 14, 1, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (203, N'973877902', N'I0029104326', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (204, N'973877902', N'I0029104334', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (205, N'973877902', N'I0029104342', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (206, N'973877902', N'I0029104350', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (207, N'973877902', N'I0029104732', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (208, N'973877902', N'I0029105835', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (209, N'973877902', N'I0029105885', 14, 2, 9, 10)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (210, N'974545640', N'I0027294531', 8, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (211, N'974545640', N'I0027294549', 8, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (212, N'974545640', N'I0027294557', 8, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (213, N'974545640', N'I0027294565', 8, 1, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (214, N'974545640', N'I0029104287', 8, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (215, N'974545640', N'I0029104295', 8, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (216, N'974545640', N'I0029104300', 8, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (217, N'974545640', N'I0029104318', 8, 2, 9, 5)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (218, N'995773615', N'I0027311838', 66, 1, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (219, N'995773615', N'I0027311977', 66, 1, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (220, N'995773615', N'I0027312020', 66, 1, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (221, N'995773615', N'I0027312070', 66, 1, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (222, N'995773615', N'I0029110050', 66, 2, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (223, N'995773615', N'I0029110068', 66, 2, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (224, N'995773615', N'I0029110076', 66, 2, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (225, N'995773615', N'I0029110084', 66, 2, 9, 114)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (226, N'995781450', N'I0027295414', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (227, N'995781450', N'I0027296208', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (228, N'995781450', N'I0027296216', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (229, N'995781450', N'I0027296224', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (230, N'995781450', N'I0027296232', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (231, N'995781450', N'I0027296240', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (232, N'995781450', N'I0027296258', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (233, N'995781450', N'I0027296266', 43, 1, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (234, N'995781450', N'I0029103972', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (235, N'995781450', N'I0029103980', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (236, N'995781450', N'I0029103998', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (237, N'995781450', N'I0029104009', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (238, N'995781450', N'I0029104059', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (239, N'995781450', N'I0029104067', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (240, N'995781450', N'I0029104075', 43, 2, 9, 97)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (241, N'1017589900', N'I0027294989', 12, 1, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (242, N'1017589900', N'I0027294997', 12, 1, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (243, N'1017589900', N'I0027295008', 12, 1, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (244, N'1017589900', N'I0027295016', 12, 1, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (245, N'1017589900', N'I0027297165', 12, 1, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (246, N'1017589900', N'I0029104164', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (247, N'1017589900', N'I0029104172', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (248, N'1017589900', N'I0029104180', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (249, N'1017589900', N'I0029104198', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (250, N'1017589900', N'I0029106483', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (251, N'1017589900', N'I0029106491', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (252, N'1017589900', N'I0029106506', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (253, N'1017589900', N'I0029106514', 12, 2, 9, 8)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (254, N'1019688569', N'I0027297513', 9, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (255, N'1019688569', N'I0027297521', 9, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (256, N'1019688569', N'I0027297547', 9, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (257, N'1019688569', N'I0027298404', 9, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (258, N'1019688569', N'I0027312410', 9, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (259, N'1019688569', N'I0027312428', 9, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (260, N'1019688569', N'I0029105788', 9, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (261, N'1019688569', N'I0029105796', 9, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (262, N'1019688569', N'I0029105801', 9, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (263, N'1019688569', N'I0029106019', 9, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (264, N'1029471680', N'I0027296062', 56, 1, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (265, N'1029471680', N'I0027296070', 56, 1, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (266, N'1029471680', N'I0027296088', 56, 1, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (267, N'1029471680', N'I0027296096', 56, 1, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (268, N'1029471680', N'I0029104782', 56, 2, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (269, N'1029471680', N'I0029104790', 56, 2, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (270, N'1029471680', N'I0029104805', 56, 2, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (271, N'1029471680', N'I0029104813', 56, 2, 9, 103)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (272, N'1032349264', N'I0027296444', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (273, N'1032349264', N'I0027296452', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (274, N'1032349264', N'I0027296460', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (275, N'1032349264', N'I0027296478', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (276, N'1032349264', N'I0027296486', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (277, N'1032349264', N'I0027296494', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (278, N'1032349264', N'I0027296509', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (279, N'1032349264', N'I0027297686', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (280, N'1032349264', N'I0027297694', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (281, N'1032349264', N'I0027297709', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (282, N'1032349264', N'I0027297717', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (283, N'1032349264', N'I0027299808', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (284, N'1032349264', N'I0027299816', 6, 1, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (285, N'1032349264', N'I0029105021', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (286, N'1032349264', N'I0029105039', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (287, N'1032349264', N'I0029105047', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (288, N'1032349264', N'I0029105055', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (289, N'1032349264', N'I0029105819', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (290, N'1032349264', N'I0029105869', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (291, N'1032349264', N'I0029105916', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (292, N'1032349264', N'I0029105966', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (293, N'1032349264', N'I0029105974', 6, 2, 9, 3)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (294, N'1038015578', N'I0027296313', 54, 1, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (295, N'1038015578', N'I0027296321', 54, 1, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (296, N'1038015578', N'I0027296339', 54, 1, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (297, N'1038015578', N'I0027296347', 54, 1, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (298, N'1038015578', N'I0029104986', 54, 2, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (299, N'1038015578', N'I0029104994', 54, 2, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (300, N'1038015578', N'I0029105005', 54, 2, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (301, N'1038015578', N'I0029105013', 54, 2, 9, 101)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (302, N'1050107760', N'I0027296800', 57, 1, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (303, N'1050107760', N'I0027296818', 57, 1, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (304, N'1050107760', N'I0027296826', 57, 1, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (305, N'1050107760', N'I0027296834', 57, 1, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (306, N'1050107760', N'I0027299769', 57, 1, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (307, N'1050107760', N'I0027299777', 57, 1, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (308, N'1050107760', N'I0029105267', 57, 2, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (309, N'1050107760', N'I0029105275', 57, 2, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (310, N'1050107760', N'I0029105283', 57, 2, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (311, N'1050107760', N'I0029105291', 57, 2, 9, 105)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (312, N'1057237530', N'I0027299175', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (313, N'1057237530', N'I0027299183', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (314, N'1057237530', N'I0027299191', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (315, N'1057237530', N'I0027299206', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (316, N'1057237530', N'I0027312436', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (317, N'1057237530', N'I0027312444', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (318, N'1057237530', N'I0027312452', 15, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (319, N'1057237530', N'I0029106336', 15, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (320, N'1057237530', N'I0029106344', 15, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (321, N'1057237530', N'I0029106352', 15, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (322, N'1057237530', N'I0029106360', 15, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (323, N'1057237646', N'I0027317143', 52, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (324, N'1057237646', N'I0027317151', 52, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (325, N'1057237646', N'I0027317193', 52, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (326, N'1057237646', N'I0027317208', 52, 1, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (327, N'1057237646', N'I0029107748', 52, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (328, N'1057237646', N'I0029107756', 52, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (329, N'1057237646', N'I0029107764', 52, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (330, N'1057237646', N'I0029107772', 52, 2, 9, 7)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (331, N'1061867094', N'I0027311854', 48, 1, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (332, N'1061867094', N'I0027311901', 48, 1, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (333, N'1061867094', N'I0027311993', 48, 1, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (334, N'1061867094', N'I0027312004', 48, 1, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (335, N'1061867094', N'I0029109279', 48, 2, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (336, N'1061867094', N'I0029109287', 48, 2, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (337, N'1061867094', N'I0029109295', 48, 2, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (338, N'1061867094', N'I0029109300', 48, 2, 9, 46)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (339, N'1079400910', N'I0027312460', 17, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (340, N'1079400910', N'I0027312478', 17, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (341, N'1079400910', N'I0027312486', 17, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (342, N'1079400910', N'I0027312494', 17, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (343, N'1079400910', N'I0027312509', 17, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (344, N'1079400910', N'I0027312517', 17, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (345, N'1079400910', N'I0029107251', 17, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (346, N'1079400910', N'I0029107269', 17, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (347, N'1079400910', N'I0029107277', 17, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (348, N'1079400910', N'I0029107285', 17, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (349, N'1084397012', N'I0027297490', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (350, N'1084397012', N'I0027297505', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (351, N'1084397012', N'I0027311951', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (352, N'1084397012', N'I0027312088', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (353, N'1084397012', N'I0027312135', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (354, N'1084397012', N'I0027312143', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (355, N'1084397012', N'I0027312151', 64, 1, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (356, N'1084397012', N'I0029109978', 64, 2, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (357, N'1084397012', N'I0029109986', 64, 2, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (358, N'1084397012', N'I0029109994', 64, 2, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (359, N'1084397012', N'I0029110000', 64, 2, 9, 111)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (360, N'1084434706', N'I0029109732', 45, 2, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (361, N'1084434706', N'I0029109740', 45, 2, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (362, N'1084434706', N'I0029109758', 45, 2, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (363, N'1084434706', N'I0029109910', 45, 2, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (364, N'1089719735', N'I0027311927', 59, 1, 9, 106)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (365, N'1089719735', N'I0029109211', 59, 2, 9, 106)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (366, N'1089928938', N'I0027317868', 63, 1, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (367, N'1089928938', N'I0027317876', 63, 1, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (368, N'1089928938', N'I0027317915', 63, 1, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (369, N'1089928938', N'I0027317965', 63, 1, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (370, N'1089928938', N'I0029107536', 63, 2, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (371, N'1089928938', N'I0029107544', 63, 2, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (372, N'1089928938', N'I0029107552', 63, 2, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (373, N'1089928938', N'I0029107560', 63, 2, 9, 110)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (374, N'1091649337', N'I0029110018', 61, 2, 9, 108)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (375, N'1091649337', N'I0029110026', 61, 2, 9, 108)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (376, N'1091855204', N'I0027317680', 13, 1, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (377, N'1091855204', N'I0027317884', 13, 1, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (378, N'1091855204', N'I0027317931', 13, 1, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (379, N'1091855204', N'I0027317973', 13, 1, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (380, N'1091855204', N'I0029107219', 13, 2, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (381, N'1091855204', N'I0029107227', 13, 2, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (382, N'1091855204', N'I0029107235', 13, 2, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (383, N'1091855204', N'I0029107243', 13, 2, 9, 9)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (384, N'1103985809', N'I0029109237', 67, 2, 9, 116)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (385, N'1103985809', N'I0029109245', 67, 2, 9, 116)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (386, N'1103985809', N'I0029109253', 67, 2, 9, 116)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (387, N'1103985809', N'I0029109261', 67, 2, 9, 116)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (388, N'1106086638', N'I0027312371', 19, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (389, N'1106086638', N'I0027312389', 19, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (390, N'1106086638', N'I0027312397', 19, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (391, N'1106086638', N'I0027312525', 19, 1, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (392, N'1106086638', N'I0029107390', 19, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (393, N'1106086638', N'I0029107405', 19, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (394, N'1106086638', N'I0029107413', 19, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (395, N'1106086638', N'I0029107421', 19, 2, 9, 13)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (396, N'1111390950', N'I0027317347', 68, 1, 9, 20)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (397, N'1111390950', N'I0029109114', 68, 2, 9, 20)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (398, N'1120772292', N'I0027311820', 42, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (399, N'1120772292', N'I0027311870', 42, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (400, N'1120772292', N'I0027312012', 42, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (401, N'1120772292', N'I0027312127', 42, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (402, N'1120772292', N'I0029110092', 42, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (403, N'1120772292', N'I0029110107', 42, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (404, N'1120772292', N'I0029110115', 42, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (405, N'1120772292', N'I0029110123', 42, 2, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (406, N'1154423588', N'I0027311812', 5, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (407, N'1154423588', N'I0027311862', 5, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (408, N'1154423588', N'I0027311919', 5, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (409, N'1154423588', N'I0027311969', 5, 1, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (410, N'1154423588', N'I0029109936', 5, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (411, N'1154423588', N'I0029109944', 5, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (412, N'1154423588', N'I0029109952', 5, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (413, N'1154423588', N'I0029109960', 5, 2, 9, 2)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (414, N'1232107352', N'I0027311846', 7, 1, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (415, N'1232107352', N'I0027312054', 7, 1, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (416, N'1232107352', N'I0027312096', 7, 1, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (417, N'1232107352', N'I0027312101', 7, 1, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (418, N'1232107352', N'I0029110034', 7, 2, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (419, N'1232107352', N'I0029110042', 7, 2, 9, 4)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (420, N'1236252234', N'I0029110165', 74, 2, 9, 35)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (421, N'959949320', NULL, 93, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (422, N'959949320', NULL, 93, 1, 9, 1)
GO
INSERT [dbo].[AumltInventors] ([AUMLTInventor_Id], [OCLC_Number], [Item_Barcode], [TextBookId], [Campus_Id], [Inventor_FileUpload_Id], [UnitCode_Id]) VALUES (423, N'959949320', NULL, 93, 1, 9, 1)
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
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (1, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-25T23:36:09.967' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (2, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-25T23:38:14.567' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (3, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-25T23:45:46.797' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (4, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-25T23:54:59.063' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (5, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-26T00:02:59.970' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (6, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-26T00:06:01.817' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (7, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-26T12:52:06.430' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (8, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-26T12:53:57.973' AS DateTime))
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id], [DateTime]) VALUES (9, N'StudentDetails.csv,Inventory.csv', N'UploadFile', 1, CAST(N'2021-09-26T12:57:52.960' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[FileUploads] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [TextBook_Id], [Unit_Id], [IsNew], [OrderDate], [UpdateDate], [UserName], [OrderComplated], [FileId]) VALUES (1, 93, 1, 1, CAST(N'2021-09-26T23:11:43.763' AS DateTime), CAST(N'2021-09-27T19:41:27.957' AS DateTime), N'kinjal@mit.edu.au', 1, 9)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
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
SET IDENTITY_INSERT [dbo].[StudentEnrollments] ON 
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (1, 1, 25, 1, 5, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (2, 2, 25, 1, 8, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (3, 3, 25, 1, 6, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (4, 4, 25, 1, 7, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (5, 5, 25, 1, 1, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (6, 6, 25, 1, 5, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (7, 7, 25, 1, 8, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (8, 8, 25, 1, 7, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (9, 9, 26, 1, 25, 0, 58, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (10, 10, 25, 1, 22, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (11, 11, 25, 1, 15, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (12, 12, 25, 1, 19, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (13, 13, 25, 1, 9, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (14, 14, 25, 1, 13, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (15, 15, 10, 1, 10, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (16, 16, 25, 1, 6, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (17, 17, 25, 1, 7, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (18, 18, 25, 1, 6, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (19, 19, 25, 1, 5, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (20, 20, 25, 1, 11, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (21, 21, 25, 1, 12, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (22, 22, 25, 1, 6, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (23, 23, 25, 1, 10, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (24, 24, 25, 1, 10, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (25, 25, 25, 1, 6, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (26, 26, 25, 1, 9, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (27, 27, 25, 1, 0, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (28, 28, 25, 1, 0, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (29, 29, 25, 1, 14, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (30, 30, 25, 1, 4, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (31, 31, 25, 1, 2, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (32, 32, 25, 1, 0, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (33, 33, 25, 1, 15, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (34, 34, 25, 1, 4, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (35, 35, 5, 1, 1, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (36, 36, 100, 1, 66, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (37, 37, 125, 1, 88, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (38, 38, 100, 1, 63, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (39, 39, 75, 1, 48, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (40, 40, 75, 1, 50, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (41, 41, 25, 1, 23, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (42, 42, 25, 1, 1, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (43, 43, 75, 1, 61, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (44, 44, 25, 1, 17, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (45, 45, 35, 1, 33, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (46, 46, 17, 1, 17, 0, 51, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (47, 47, 26, 1, 25, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (48, 48, 50, 1, 46, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (49, 49, 25, 1, 15, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (50, 50, 35, 1, 29, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (51, 51, 26, 1, 25, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (52, 52, 50, 1, 27, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (53, 53, 35, 1, 32, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (54, 54, 50, 1, 33, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (55, 55, 35, 1, 27, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (56, 56, 50, 1, 26, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (57, 57, 40, 1, 25, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (58, 58, 25, 1, 22, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (59, 59, 30, 1, 20, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (60, 60, 25, 1, 6, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (61, 61, 25, 1, 5, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (62, 62, 1, 1, 0, 1, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (63, 63, 3, 1, 0, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (64, 64, 25, 1, 6, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (65, 65, 25, 1, 19, 0, 42, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (66, 66, 25, 1, 5, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (67, 67, 4, 1, 0, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (68, 68, 25, 1, 9, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (69, 69, 25, 1, 3, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (70, 70, 25, 1, 5, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (71, 71, 3, 1, 0, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (72, 72, 2, 1, 0, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (73, 73, 25, 1, 1, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (74, 74, 25, 1, 3, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (75, 75, 25, 1, 4, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (76, 76, 25, 1, 7, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (77, 77, 25, 1, 3, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (78, 78, 25, 1, 10, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (79, 79, 25, 1, 3, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (80, 80, 2, 1, 0, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (81, 81, 25, 1, 3, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (82, 82, 25, 1, 9, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (83, 83, 25, 1, 11, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (84, 84, 20, 1, 17, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (85, 85, 13, 1, 12, 0, 30, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (86, 86, 25, 1, 4, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (87, 87, 25, 1, 8, 0, 28, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (88, 88, 27, 1, 26, 0, 60, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (89, 89, 25, 1, 19, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (90, 90, 25, 1, 10, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (91, 91, 25, 1, 5, 0, 30, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (92, 92, 25, 1, 17, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (93, 93, 25, 1, 21, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (94, 94, 25, 1, 10, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (95, 95, 25, 1, 5, 0, 25, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (96, 96, 30, 1, 28, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (97, 97, 1, 1, 0, 1, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (98, 98, 25, 1, 5, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (99, 99, 25, 1, 12, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (100, 100, 25, 1, 8, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (101, 101, 25, 1, 22, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (102, 102, 25, 1, 19, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (103, 103, 50, 1, 38, 0, 53, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (104, 104, 35, 1, 30, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (105, 105, 25, 1, 6, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (106, 106, 25, 1, 0, 1, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (107, 107, 43, 1, 43, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (108, 108, 50, 1, 47, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (109, 109, 25, 1, 10, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (110, 110, 100, 1, 72, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (111, 111, 100, 1, 74, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (112, 112, 100, 1, 73, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (113, 113, 25, 1, 3, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (114, 114, 25, 1, 2, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (115, 115, 25, 1, 7, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (116, 116, 25, 1, 3, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (117, 117, 25, 1, 8, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (118, 118, 25, 1, 16, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (119, 119, 25, 1, 4, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (120, 120, 25, 1, 18, 0, 50, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (121, 121, 25, 1, 0, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (122, 122, 150, 1, 544, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (123, 123, 100, 1, 9, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (124, 124, 225, 1, 156, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (125, 125, 225, 1, 157, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (126, 126, 200, 1, 151, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (127, 127, 300, 1, 209, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (128, 128, 125, 1, 98, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (129, 129, 50, 1, 27, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (130, 130, 75, 1, 25, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (131, 131, 100, 1, 27, 0, 100, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (132, 132, 50, 1, 49, 0, 200, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (133, 133, 102, 1, 102, 0, 402, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (134, 134, 50, 1, 34, 0, 200, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (135, 135, 125, 1, 101, 0, 400, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (136, 136, 37, 1, 37, 0, 200, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (137, 137, 116, 1, 116, 0, 215, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (138, 138, 500, 1, 255, 0, 0, 9)
GO
INSERT [dbo].[StudentEnrollments] ([StudentEnrollmentId], [UnitCode_Id], [Capacity], [Campus_Id], [Total_Enrollment], [RunningOrNot], [Lab_and_tut_capacity], [StudentDetail_FileId]) VALUES (139, 139, 500, 1, 77, 0, 0, 9)
GO
SET IDENTITY_INSERT [dbo].[StudentEnrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[TextBooks] ON 
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (4, 2019, N'Nobles, T., Mattison, B., Matsumura, E., Best, P., Fraser, D., Tan, R., & Willett, R., (', N'Horngren’s Financial Accounting e-Book, 8 th edition.', N'Pearson Education', N'908448040', N'Prescribed', N'A/Prof Michael De Martinis', 1)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (5, 2020, N'Romney,  M.B., Steinbart, P.J., Summers, S.L., & Wood, D.A.', N'Accounting Information Systems, Global Edition eBook (15th Edn)', N'Pearson', N'1154423588', N'Prescribed', N'Ms Beverley Jones', 2)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (6, 2018, N'Leo, K., Knapp, J., McGowan, S. & Sweeting, J', N'Company Accounting, 11th edition', N'John Wiley & Sons', N'1032349264', N'Prescribed', N'Dr Jayasinghe Hewa Dulige', 3)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (7, 2020, N'Sadiq, K., Black, C., Hanegbi, R., Jogarajan, S., Krever, R., Obst, W., Teoh, J., Ting, A.,', N'Principles of Taxation Law 2021', N'Thomson Reuters', N'1232107352', N'Prescribed', N'Irene Collins', 4)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (8, 2018, N'Mowen, M., Hansen, R., Heitger, L', N'Managerial Accounting: The Cornerstone of Business DecisionMaking, 7th edition', N'Cengage Learning.', N'974545640', N'Prescribed', N'Dr Jayasinghe Hewa Dulige', 5)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (9, 2018, N'Harris, J., Hargovan, A., Adams, M', N'Australian Corporate Law, 6th edition', N'Lexis Nexis Butterworths', N'1019688569', N'Prescribed', N'Dr. Tushar Das', 2)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (10, 2012, N'Hopwood, W., Young, Y., & Leiner, J.', N'Forensic Accounting and Fraud Examination, 2nd edition', N'McGraw-Hill', N'496955990', N'Recommended', N'A/Prof Michael De Martinis', 6)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (11, 2011, N'Samson, D., & Daft, R. L.', N'Fundamentals of Management [4th Edition]', N'Cengage', N'711716819', N'Recommended', N'Dr. Eijaz Ahmed Khan', 7)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (12, 2018, N'Albrecht, W. S., Chad O. Albrecht, C. O., Albrecht, C.C., & Zimbelman, M. F', N'Fraud Examination, 6th edition', N'Cengage Learning.', N'1017589900', N'Prescribed', N'A/Prof Michael De Martinis', 8)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (13, 2019, N'Leung, P., Coram, P., Cooper. B., Richardson, P.', N'Audit and Assurance 1st Edn', N'John Wiley and Sons', N'1091855204', N'Prescribed', N'Dr Ronald Macewan Wright', 9)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (14, 2018, N'Pride, W., Ferrel, O., Lukas, B.A., Schembri, S., Niininen, O. & Casidy, R', N'Marketing Principles (3rd Asia Pacific Edition)', N'Cengage Learning', N'973877902', N'Prescribed', N'Dr Gayathri Chethi', 10)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (15, 2018, N'Layton, A., Robinson, T. & Tucker, I', N'Economics for Today, (6th Asia Pacific ed.', N'Cengage Learning', N'1057237530', N'Prescribed', N'Pu Chen', 2)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (16, 2013, N'Loftus, J., Leo, K., Picker, R., Wise, W. & Clark, K', N'Understanding Australian Accounting Standards', N'John Wiley & Sons', N'807180288', N'Recommended', N'Dr Jayasinghe Hewa Dulige', 11)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (17, 2019, N'Graw, S., Parker, D., Whitford, K., Sangkuhl, E., Do, C.', N'Understanding Business Law, 9 th edition', N'Lexis Nexis Butterworths', N'1079400910', N'Prescribed', N'Dr Tushar Das', 2)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (18, 2014, N'Henderson, S., Peirson, G., Herbohn, K. F., Artiach, T & Howieson, B.', N'Issues in Financial Accounting, 15th edition', N'Pearson PrenticeHall.', N'838754052', N'Recommended', N'Dr Jayasinghe Hewa Dulige', 12)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (19, 2019, N'Crane, Matten, Glozer, & Spence', N'Business ethics: managing corporate citizenship and sustainability in the age of globalization, 5th ed.', N'Oxford University Press', N'1106086638', N'Prescribed', N'Dr Marise Williams', 13)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (20, 2018, N'Sharma, E.', N'Strategic Human Resource Management and Development, [1st Edition].', N'Pearson Education', N'1125073856', N'Prescribed', N'Dr Eijaz Ahmed Khan', 14)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (21, 2016, N'Hubbard, R.G., Garnett, A., Lewis, P.T., & O’Brien, A.P.', N'Essentials of Economics (3rd ed.).', N'Pearson Education', N'875346096', N'Recommended', N'Pu Chen', 10)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (22, 2014, N'Gans, J.; Kings, S.; Stonecash, R.; Byford,M.; Libich, J. & Mankiw, N. G', N'Principles of Economics, (6th ed.)', N'Cengage Learning', N'879370188', N'Recommended', N'Pu Chen', 102)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (23, 2014, N'Sharda, R., Delen, D. and Turban, E.', N'Business Intelligence and Analytics: Systems for Decision Support (10th Edition)', N'Pearson', N'881368275', N'Recommended', N'Dr Ken Mardaneh', 12)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (24, 2015, N'Hahn, B., Rufus, R., Miller, L', N'Forensic Accounting, Global Edition', N'Pearson Higher Ed', N'903956190', N'Recommended', N'A/Prof Michael De Martinis', 12)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (25, 2016, N'Nobles, T., Mattison, B., Matsumura, E., Best, P., Fraser, D., Tan, R., & Willett, R.', N'Financial Accounting, 8 th edition', N'Pearson', N'908448040', N'Recommended', N'Dr Mohobbot Ali', 12)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (26, 2016, N'Porter, G. A., & Norton, C.L.', N'Financial Accounting: The Impact on Decision Makers, 10th edition', N'Cengage Learning', N'914290586', N'Recommended', N'Dr Mohobbot Ali', 13)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (27, 2016, N'Picker, R., Clark, K., Dunn, J., Kolitz, D., Livne, G., Loftus, J., & van der Tas, L.,', N'Applying IFRS Standards, 4 th edition.', N'Wiley', N'920727246', N'Recommended', N'Dr Mohobbot Ali', 18)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (28, 2014, N'William Stallings, Moumita Mitra Manna', N'Data and Computer Communications, 10th ed', N'Pearson', N'870646291', N'Prescribed', N'Dr. Giok Han Anies Hannawati Lo', 18)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (29, 2016, N'William Stallings, Florence Agboma, Sofiene Jelassi', N'Foundations of Modern Networking: SDN, NFV, QoE, IoT, and Cloud', N'Pearson', N'927715441', N'Recommended', N'Dr. Giok Han Anies Hannawati Lo', 2)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (30, 2016, N'Locke, C.,', N'Chartered Accountants Australia and New Zealand''s Financial Reporting Handbook 2016', N'John Wiley & Sons Australia', N'940646591', N'Recommended', N'Dr Jayasinghe Hewa Dulige', 10)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (31, 2014, N'Mankiw, N. G', N'Essentials of Economics, (7th ed.)', N'Cengage Learning', N'941428273', N'Recommended', N'Pu Chen', 12)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (32, 2016, N'Selvanathan, E.A., Selvanathan, S., Keller, G', N'Business Statistics, ABRIDGED, Ed. 7;', N'Cengage learning', N'944226207', N'Recommended', N'Dr Ken Mardaneh', 5)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (33, 2016, N'Hanrahan, P., Ramsay, I. & Stapledon, G', N'Commercial Applications of Company Law', N'Oxford University Press', N'946118199', N'Recommended', N'Dr. Tushar Das', 15)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (34, 2016, N'Gulati, R., Mayo, A. J., & Nohria, N.', N'Management: An Integrated Approach', N'Cengage Learning', N'947107355', N'Recommended', N'Dr. Eijaz Ahmed Khan', 15)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (35, 2017, N'Adam, C., Gunasingham, B., Graham, J., Smart, S', N'Introduction to Corporate Finance, 2 nd edition', N'Cengage Learning', N'948669971', N'Recommended', N'', 18)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (36, 2016, N'Scott Empson', N'CCNA Routing and Switching Portable Command Guide', N'Cisco Press', N'951124614', N'Recommended', N'Dr. Giok Han Anies Hannawati Lo', 9)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (37, 2016, N'Newman, A.', N'Business Communication: In Person, In Print, Online [10th Edition]', N'Cengage Learning', N'959949320', N'Recommended', N'Dr Eijaz Ahmed Khan', 7)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (38, 2017, N'Henderson, S., Peirson, G., and Herbohn, K. F., Ramsay, A & Borg, V', N'Issues in Financial Accounting, 16th edition', N'Pearson Prentice-Hall', N'960849457', N'Recommended', N'Dr Mohobbot Ali', 35)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (39, 2017, N'Hitt, M.A., Ireland, D.R., & Hoskisson, R.E.', N'Strategic Management Competitiveness & Globalization Concepts and Cases, 12th ed.', N'Cengage', N'962419489', N'Recommended', N'Stuart Orr', 105)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (40, 2017, N'Hitt, M.A., Ireland, D.R., & Hoskisson, R.E.', N'Strategic Management Competitiveness & Globalization Concepts and Cases, 12th ed.', N'Cengage', N'962419489', N'Recommended', N'Stuart Orr', 18)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (41, 2019, N'Philip Cateora, John Graham, Mary Gilly', N'International Marketing  18th ed', N'McGraw-Hill Education', N'1052903606', N'Prescribed', N'Professor Siva Muthaly', 34)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (42, 2019, N'Nankervis, A., Baird, M., Coffey, J., & Shields, J.', N'Human Resource Management: Strategy and Practice, 10th ed.', N'Cengage', N'1120772292', N'Prescribed', N'Dr Eijaz Khan', 1)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (43, 2016, N'Parkes A., Considine, B., Olesen K., Blount, Y.,', N'Accounting Information Systems: understanding business processes, 5th ed', N'John Wiley', N'995781450', N'Recommended', N'Ms Beverley Jones', 97)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (44, 2017, N'Parkes A., Considine, B., Olesen K., Blount, Y.', N'Accounting Information Systems: understanding business processes, 5th ed', N'John Wiley', N'995781450', N'Recommended', N'Dr Mac Wright', 35)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (45, 2020, N'Hill, C., Schilling, M., & Jones, G.', N'Strategic Management: Theory & Cases: An Integrated Approach, 13th ed', N'Cengage', N'1084434706', N'Prescribed', N'Stuart Orr', 4)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (46, 2020, N'Sveningsson, S & Sorgare, N.', N'Managing change in organizations : how, what and why?', N'Sage', N'1125067477', N'Prescribed', N'Jyoti Sharma', 4)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (47, 2018, N'McLaney, E., & Atrill, P.', N'Accounting and Finance: An Introduction, 9th Edition', N'Pearson', N'1010693529', N'Recommended', N'Dr Mohobbot Ali', 46)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (48, 2019, N'David M. Kroenke, David J. Auer, Scott L. Vandenberg, Robert C. Yoder', N'Database Concepts', N'Pearson', N'1061867094', N'Prescribed', N'Dr Deepani Guruge', 46)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (49, 2019, N'David M. Kroenke, David J. Auer, Scott L. Vandenberg, Robert C. Yoder', N'Database Concepts', N'Pearson', N'1061867094', N'Prescribed', N'Dr Deepani Guruge', 6)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (50, 2014, N'Elliott G.', N'Marketing (3rd edition)', N'John Willey and Sons', N'1037304322', N'Recommended', N'Dr Gayathri Chethi', 1)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (51, 2018, N'Rael, R.', N'The traits of today''s CFO : A handbook for excelling in an evolving role.', N'', N'1046085254', N'Recommended', N'', 6)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (52, 2019, N'Trotman,K., Carson, E., & Morgan,K.,', N'Financial Accounting: An Integrated Approach, 7 th edition', N' Cengage Learning.', N'1057237646', N'Recommended', N'Dr Mohobbot Ali', 7)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (53, 2017, N'Selvanathan, E.A., Selvanathan, S., Keller, G.', N'Business Statistics, ABRIDGED, Ed. 7', N'Cengage', N'944226207', N'Prescribed', N'Dr Ken Mardaneh', 97)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (54, 2018, N'Gelinas, U. J., Dull, R. B. & Wheeler, P.R., Hill, M.C.,', N'Accounting Information Systems. (11th ed.)', N'Cengage', N'1038015578', N'Prescribed', N'Dr Mac Wright', 101)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (55, 2017, N'Henderson, S., Peirson, G., Herbohn, K., Artiach, T. and Howieson, B.', N'Issues in Financial Accounting (16th ed.)', N'Pearson', N'960849457', N'Prescribed', N'Dr Jayasinghe Hewa Dulige', 102)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (56, 2019, N'Anderson, D. R. Sweeney, D. J., Williams, T. A., Camm, J. D., Cochran, J. J., ; Fry, M. J., and Ohlmann, J. W.', N'An Introduction to Management Science: Quantitative Approach, 15th Edition ', N'Cengage', N'1029471680', N'Prescribed', N'Dr Ken Mardaneh', 103)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (57, 2018, N'Gay, G, & Simnett, R.', N'Auditing and Assurance Services in Australia (7th edition)', N'McGraw-Hill', N'1050107760', N'Prescribed', N'Dr Ronald Mac Wright', 105)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (58, 2020, N'Hill, C., Schilling, M., & Jones, G.', N'Strategic Management: Theory & Cases: An Integrated Approach, 13th ed', N'Cengage', N'1084434706', N'Prescribed', N'Stuart Orr', 15)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (59, 2019, N'Clarke, E.A., Wilson, Y., and Wilsom, M.', N'Accounting: An Introduction to Principles and Practice, 9th ed', N'Cengage', N'1089719735', N'Recommended', N'A/Professor Michael De Martinis', 106)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (60, 2018, N'Albrecht, W.S., Albrecht, C.O., Albrecht, C.C., and Zimbelman, M.F.,', N'Fraud Examination (6th edition)', N'Cengage', N'1017589900', N'Prescribed', N'A/Prof Michael De Martinis', 106)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (61, 2019, N'Palepu, K. G., Healy, P. M. and Peek E', N'Business Analysis and Valuation: IFRS Edition (5th edition', N'Cengage', N'1091649337', N'Prescribed', N'A/Prof Michael De Martinis', 108)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (62, 2018, N'Bajpal, N.', N'Business Research Methods,', N'Pearson', N'1007702123', N'Prescribed', N'Professor Siva Muthaly', 109)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (63, 2018, N'Neck, H. M., Neck, C. P., Murray, E. L.', N'Entrepreneurship: The Practice and Mindset', N'Sage', N'1089928938', N'Prescribed', N'Dr Eijaz Ahmed Khan', 110)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (64, 2019, N'R. Peck, T. Short', N'Introduction to Statistics and Data Analysis (6th ed.)', N'Cengage Learning US', N'1084397012', N'Prescribed', N'Prof Paul Kwan', 111)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (65, 2017, N'Wes McKinney', N'Python for Data Analysis', N'O''Reilly Media, Inc.', N'1005138881', N'Prescribed', N'Dr Deepani Guruge', 112)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (66, 2018, N'George Reynolds', N'Ethics in Information Technology 6th Edition', N'Cengage Learning', N'995773615', N'Prescribed', N'Prof Savitri Bevinakoppa', 114)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (67, 2019, N'Pressman, R. S., Maxim, B. R. ', N'Software Engineering: A Practitioner''s Approach', N'McGraw-Hill Education', N'1103985809', N'Prescribed', N'Dr Tayab Memon', 116)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (68, 2020, N'Hanrahan, P., Ramsay, I. & Stapledon, G', N'Commercial Applications of Company Law', N'Oxford University Press', N'1111390950', N'Recommended', N'Dr Tushar Das', 20)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (69, 2020, N'Dahl, J. ', N'Leading Lean', N'O’ Reilly Media, Inc.', N'1137802617', N'Recommended', N'A/Prof Monica Jurin', 18)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (70, 2020, N'Scott Empson', N'CCNA 200-301 Portable Command Guide', N'Cisco Press', N'1138950110', N'Recommended', N'Dr. Giok Han Anies Hannawati Lo', 102)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (71, 2020, N'Grant, R.M., Murray, P., Orr, S, Butler, B., Bezemer, M.', N'Strategic Management, Essentials Edition', N'John Wiley & Sons', N'1156470516', N'Recommended', N'Stuart Orr', 105)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (72, 2020, N'Grant, R.M., Murray, P., Orr, S, Butler, B., Bezemer, M.', N'Strategic Management, Essentials Edition', N'John Wiley & Sons', N'1156470516', N'Recommended', N'Stuart Orr', 18)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (73, 2020, N'Cisco Networking Academy', N'Introduction to Networks Companion Guide (CCNAv7), 1st ed', N'Cisco Press', N'1156472972', N'Recommended', N'Dr. Giok Han Anies Hannawati Lo', 106)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (74, 2020, N'Woellner, R., Woellner, R.H., Barkoczy, S., Murphy, S., Evans, C., Pinto, D', N'Australian Taxation Law (31th ed.)', N'Oxford University Press', N'1236252234', N'Recommended', N'Irene Collins', 35)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (75, 2020, N'Fred R. David, Forest R. David', N'Strategic Management: A Competitive Advantage Approach, Concepts and Cases, 16th ed', N'Pearson', N'9780000000000', N'Recommended', N'Stuart Orr', 109)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (76, 2020, N'Fred R. David, Forest R. David', N'Strategic Management: A Competitive Advantage Approach, Concepts and Cases, 16th ed', N'Pearson', N'9780000000000', N'Recommended', N'Stuart Orr', 110)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (77, 2013, N'Emerson, L.', N'Writing Guidelines for Business Students (5th ed.)', N'Cengage Learning Australia', N'9780000000000', N'Recommended', N'Dr Marise Williams', 111)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (78, 2019, N'Trotman,K., Gibbins,M., & Carson, E.,', N'Financial Accounting: An Integrated Approach, 7 th edition', N'Cengage Learning', N'9780000000000', N'Recommended', N'A/Prof Michael De Martinis', 14)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (79, 2017, N'Vaughn, L.', N'Concise Guide to Critical Thinking', N'Oxford University Press.', N'9780000000000', N'Recommended', N'Dr Marise Williams', 14)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (80, 2016, N'Vaughn, L', N'The Power of Critical Thinking: Effective Reasoning About Ordinary and Extraordinary Claims (5th ed.)', N'Oxford University Press', N'9780000000000', N'Recommended', N'Dr Marise Williams', 13)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (81, 2020, N'Jerry J. Weygandt, Paul D. Kimmel, Donald E. Kieso', N'Financial Accounting , 11th edition', N'John Wiley', N'9780000000000', N'Recommended', N'A/Prof Michael De Martinis', 14)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (82, 2019, N'Parboteeah, K. P., & Cullen, J. B.', N'Business Ethics (2nd ed.)', N'Routledge', N'9780000000000', N'Recommended', N'Dr Marise Williams', 107)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (83, 2021, N'Becker, EF, Wortmann, J', N'Mastering Communication at Work, Second Edition: How to Lead, Manage, and Influence, 2nd Edition', N'McGraw-Hill', N'9780000000000', N'Recommended', N'A/Prof Monica Jurin', 15)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (84, 2015, N'DuBrin, A.', N'Human Relations: Interpersonal Job-Oriented Skills. (12th ed.). ', N'New Jersey, USA: Prentice-Hall.', N'9780000000000', N'Recommended', N'A/Prof Monica Jurin', 13)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (85, 2017, N'Werner, J.,', N'Human Resource Development: Talent Development, [7th Edition]', N'Cengage Learning', N'9780000000000', N'Recommended', N'Dr Eijaz Ahmed Khan', 15)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (86, 2018, N'Gido, J., Clements, J., & Baker, R', N'Successful Project Management. (7th ed.).', N'Cengage Learning.', N'9780000000000', N'Recommended', N'A/Prof Monica Jurin', 8)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (87, 2018, N'Johnstone, K., Gramling, A., & Rittenberg, L. E.', N'Auditing: A Risk-Based Approach to Conducting a Quality Audit, 11th edition.', N'Cengage Learning.', N'9780000000000', N'Recommended', N'Dr Ronald Macewan Wright', 8)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (88, 2019, N'Andrew Thomas, Anne Marie Ward', N'Introdcution to Financial Accounting, 9th edition', N'McGraw-Hill Australia', N'9780000000000', N'Recommended', N'A/Prof Michael De Martinis', 14)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (89, 2017, N'West, S', N'Critical Thinking Skills: Practical Strategies for Better Decision making, Problem-Solving and Goal Setting', N'CreateSpace Independent Publishing Platform', N'9780000000000', N'Recommended', N'Dr Marise Williams', 6)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (90, 2017, N'Ross, S. A., Drew, M., Walk, A., Westerfield, R., & Jordan, B. D.', N'Fundamentals of Corporate Finance (7th ed.)', N'McGraw-Hill Education', N'9780000000000', N'Recommended', N'', 8)
GO
INSERT [dbo].[TextBooks] ([TextBook_Id], [TextBook_Year], [Author], [Title], [Publisher], [Identifier], [Requirement], [Coordinator_Name], [UnitCode_Id]) VALUES (93, 2016, N'Newman, A.', N'Business Communication: In Person, In Print, Online [10th Edition]', N'Cengage Learning', N'959949320', N'Recommended', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[TextBooks] OFF
GO
SET IDENTITY_INSERT [dbo].[UnitCode] ON 
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (1, N'BA206')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (2, N'BA214')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (3, N'BA215')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (4, N'BA216')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (5, N'BA217')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (6, N'BA301')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (7, N'BA302')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (8, N'BA313')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (9, N'BB101')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (10, N'BB106')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (11, N'BB107')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (12, N'BB108')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (13, N'BB212')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (14, N'BB313')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (15, N'BB330')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (16, N'BE101')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (17, N'BE201')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (18, N'BE202')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (19, N'BE203')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (20, N'BE301')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (21, N'BE302')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (22, N'BE303')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (23, N'BE304')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (24, N'BE700')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (25, N'BK202')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (26, N'BK208')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (27, N'BK209')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (28, N'BK210')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (29, N'BK213')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (30, N'BK214')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (31, N'BK217')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (32, N'BK307')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (33, N'BM203')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (34, N'BM212')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (35, N'BM302')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (36, N'BN103')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (37, N'BN104')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (38, N'BN106')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (39, N'BN108')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (40, N'BN109')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (41, N'BN110')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (42, N'BN111')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (43, N'BN200')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (44, N'BN201')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (45, N'BN202')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (46, N'BN204')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (47, N'BN205')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (48, N'BN206')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (49, N'BN208')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (50, N'BN209')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (51, N'BN223')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (52, N'BN301')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (53, N'BN303')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (54, N'BN304')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (55, N'BN305')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (56, N'BN309')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (57, N'BN321')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (58, N'BN323')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (59, N'BN324')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (60, N'BUACC2603')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (61, N'BUACC3701')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (62, N'BUACC3706')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (63, N'BUACC5935')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (64, N'BUENT3705')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (65, N'BUGEN1502')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (66, N'BUHRM1501')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (67, N'BULAW2611')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (68, N'BUMGT1501')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (69, N'BUMGT2621')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (70, N'BUMGT5922')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (71, N'BUMGT5977')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (72, N'BUMGT6973')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (73, N'BUMKT1501')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (74, N'ITECH1001')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (75, N'ITECH1101')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (76, N'ITECH1102')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (77, N'ITECH1103')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (78, N'ITECH1104')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (79, N'ITECH1400')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (80, N'ITECH2000')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (81, N'ITECH2001')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (82, N'ITECH2004')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (83, N'ITECH2250')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (84, N'ITECH2300')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (85, N'ITECH2305')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (86, N'ITECH2309')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (87, N'ITECH3001')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (88, N'ITECH3002')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (89, N'ITECH3100')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (90, N'ITECH3101')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (91, N'ITECH3103')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (92, N'ITECH3208')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (93, N'ITECH3209')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (94, N'ITECH7400')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (95, N'ITECH7409')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (96, N'ITECH7415')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (97, N'MA509')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (98, N'MA511')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (99, N'MA514')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (100, N'MA515')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (101, N'MA601')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (102, N'MA609')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (103, N'MA611')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (104, N'MA613')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (105, N'MA616')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (106, N'MA617')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (107, N'MA618')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (108, N'MA619')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (109, N'MA625')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (110, N'MDA511')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (111, N'MDA512')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (112, N'MDA513')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (113, N'MDA522')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (114, N'MDA523')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (115, N'ME502')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (116, N'ME504')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (117, N'ME601')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (118, N'ME602')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (119, N'ME603')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (120, N'ME604')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (121, N'ME700')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (122, N'MIT001')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (123, N'MLC101')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (124, N'MN404')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (125, N'MN405')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (126, N'MN501')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (127, N'MN502')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (128, N'MN503')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (129, N'MN504')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (130, N'MN506')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (131, N'MN601')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (132, N'MN603')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (133, N'MN621')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (134, N'MN623')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (135, N'MN624')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (136, N'MN691')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (137, N'MN692')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (138, N'PGCNA001')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (139, N'PGDAA001')
GO
INSERT [dbo].[UnitCode] ([UnitCodeId], [UnitCodeName]) VALUES (140, N'UGCNA001(')
GO
SET IDENTITY_INSERT [dbo].[UnitCode] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (1, N'kinjal@mit.edu.au', N'Kinjal@143', N'kinjal', N'lahar', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Years] ON 
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (1, N'1900')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (2, N'1901')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (3, N'1902')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (4, N'1903')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (5, N'1904')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (6, N'1905')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (7, N'1906')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (8, N'1907')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (9, N'1908')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (10, N'1909')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (11, N'1910')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (12, N'1911')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (13, N'1912')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (14, N'1913')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (15, N'1914')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (16, N'1915')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (17, N'1916')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (18, N'1917')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (19, N'1918')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (20, N'1919')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (21, N'1920')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (22, N'1921')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (23, N'1922')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (24, N'1923')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (25, N'1924')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (26, N'1925')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (27, N'1926')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (28, N'1927')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (29, N'1928')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (30, N'1929')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (31, N'1930')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (32, N'1931')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (33, N'1932')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (34, N'1933')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (35, N'1934')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (36, N'1935')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (37, N'1936')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (38, N'1937')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (39, N'1938')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (40, N'1939')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (41, N'1940')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (42, N'1941')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (43, N'1942')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (44, N'1943')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (45, N'1944')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (46, N'1945')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (47, N'1946')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (48, N'1947')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (49, N'1948')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (50, N'1949')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (51, N'1950')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (52, N'1951')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (53, N'1952')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (54, N'1953')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (55, N'1954')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (56, N'1955')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (57, N'1956')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (58, N'1957')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (59, N'1958')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (60, N'1959')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (61, N'1960')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (62, N'1961')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (63, N'1962')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (64, N'1963')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (65, N'1964')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (66, N'1965')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (67, N'1966')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (68, N'1967')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (69, N'1968')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (70, N'1969')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (71, N'1970')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (72, N'1971')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (73, N'1972')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (74, N'1973')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (75, N'1974')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (76, N'1975')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (77, N'1976')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (78, N'1977')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (79, N'1978')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (80, N'1979')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (81, N'1980')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (82, N'1981')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (83, N'1982')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (84, N'1983')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (85, N'1984')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (86, N'1985')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (87, N'1986')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (88, N'1987')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (89, N'1988')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (90, N'1989')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (91, N'1990')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (92, N'1991')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (93, N'1992')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (94, N'1993')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (95, N'1994')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (96, N'1995')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (97, N'1996')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (98, N'1997')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (99, N'1998')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (100, N'1999')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (101, N'2000')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (102, N'2001')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (103, N'2002')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (104, N'2003')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (105, N'2004')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (106, N'2005')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (107, N'2006')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (108, N'2007')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (109, N'2008')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (110, N'2009')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (111, N'2010')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (112, N'2011')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (113, N'2012')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (114, N'2013')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (115, N'2014')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (116, N'2015')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (117, N'2016')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (118, N'2017')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (119, N'2018')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (120, N'2019')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (121, N'2020')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (122, N'2021')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (123, N'2022')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (124, N'2023')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (125, N'2024')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (126, N'2025')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (127, N'2026')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (128, N'2027')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (129, N'2028')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (130, N'2029')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (131, N'2030')
GO
INSERT [dbo].[Years] ([Year_Id], [Year_Name]) VALUES (132, N'2031')
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
ALTER TABLE [dbo].[AumltInventors]  WITH CHECK ADD  CONSTRAINT [FK_AumltInventors_UnitCode] FOREIGN KEY([UnitCode_Id])
REFERENCES [dbo].[UnitCode] ([UnitCodeId])
GO
ALTER TABLE [dbo].[AumltInventors] CHECK CONSTRAINT [FK_AumltInventors_UnitCode]
GO
ALTER TABLE [dbo].[FileUploads]  WITH CHECK ADD  CONSTRAINT [FK_FileUploads_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[FileUploads] CHECK CONSTRAINT [FK_FileUploads_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TextBooks] FOREIGN KEY([TextBook_Id])
REFERENCES [dbo].[TextBooks] ([TextBook_Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TextBooks]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UnitCode] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[UnitCode] ([UnitCodeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_UnitCode]
GO
ALTER TABLE [dbo].[StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollmentDetails_UnitCode] FOREIGN KEY([UnitCode_Id])
REFERENCES [dbo].[UnitCode] ([UnitCodeId])
GO
ALTER TABLE [dbo].[StudentEnrollments] CHECK CONSTRAINT [FK_StudentEnrollmentDetails_UnitCode]
GO
ALTER TABLE [dbo].[StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollments_StudentEnrollments] FOREIGN KEY([StudentDetail_FileId])
REFERENCES [dbo].[FileUploads] ([File_Upload_Id])
GO
ALTER TABLE [dbo].[StudentEnrollments] CHECK CONSTRAINT [FK_StudentEnrollments_StudentEnrollments]
GO
ALTER TABLE [dbo].[StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_Units_Campuses] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Campus_id])
GO
ALTER TABLE [dbo].[StudentEnrollments] CHECK CONSTRAINT [FK_Units_Campuses]
GO
ALTER TABLE [dbo].[TextBooks]  WITH CHECK ADD  CONSTRAINT [FK_TextBooks_UnitCode] FOREIGN KEY([UnitCode_Id])
REFERENCES [dbo].[UnitCode] ([UnitCodeId])
GO
ALTER TABLE [dbo].[TextBooks] CHECK CONSTRAINT [FK_TextBooks_UnitCode]
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
