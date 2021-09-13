USE [master]
GO
/****** Object:  Database [MITDB]    Script Date: 13/09/2021 11:12:26 PM ******/

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
/****** Object:  Table [dbo].[Campuses]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[Coordinators]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[FileUploads]    Script Date: 13/09/2021 11:12:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileUploads](
	[File_Upload_Id] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_FileUploads] PRIMARY KEY CLUSTERED 
(
	[File_Upload_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[Semesters]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[TextBooks]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[Units]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 13/09/2021 11:12:26 PM ******/
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
/****** Object:  Table [dbo].[Years]    Script Date: 13/09/2021 11:12:26 PM ******/
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
SET IDENTITY_INSERT [dbo].[Campuses] ON 
GO
INSERT [dbo].[Campuses] ([Campus_id], [Campus_Name]) VALUES (1, N'Melbourne')
GO
INSERT [dbo].[Campuses] ([Campus_id], [Campus_Name]) VALUES (2, N'Sydney')
GO
INSERT [dbo].[Campuses] ([Campus_id], [Campus_Name]) VALUES (3, N'Both')
GO
SET IDENTITY_INSERT [dbo].[Campuses] OFF
GO
SET IDENTITY_INSERT [dbo].[FileUploads] ON 
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (61, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (62, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (63, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (64, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (65, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (66, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (67, N'Book1.csv', N'UploadFile', 1)
GO
INSERT [dbo].[FileUploads] ([File_Upload_Id], [File_Name], [Location], [User_Id]) VALUES (68, N'Book1.csv', N'UploadFile', 1)
GO
SET IDENTITY_INSERT [dbo].[FileUploads] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Role_Id], [Role_Name]) VALUES (1, N'Super Admin')
GO
INSERT [dbo].[Roles] ([Role_Id], [Role_Name]) VALUES (2, N'Course Coordinator')
GO
INSERT [dbo].[Roles] ([Role_Id], [Role_Name]) VALUES (3, N'User')
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
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (1, N'osi.kinjal@gmail.com', N'Kinjal@143', N'Kinjal', N'Lahar', 1)
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (2, N'bhvesh@mit.edu.au', N'Bhavesh@143', N'BhaveshBhai', N'Narola', 3)
GO
INSERT [dbo].[Users] ([User_Id], [UserName], [Password], [FirstName], [LastName], [Role_Id]) VALUES (3, N'bhavesh@mit.edu.au', N'Bhavesh@143', N'bhavesh', N'narola', 3)
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
