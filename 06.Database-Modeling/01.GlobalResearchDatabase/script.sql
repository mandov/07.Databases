USE [master]
GO
/****** Object:  Database [CountriesData]    Script Date: 30.1.2018 г. 22:06:25 ******/
CREATE DATABASE [CountriesData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Homework', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Homework.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Homework_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Homework_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CountriesData] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountriesData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountriesData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountriesData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountriesData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountriesData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountriesData] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountriesData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountriesData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountriesData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountriesData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountriesData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountriesData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountriesData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountriesData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountriesData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountriesData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountriesData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountriesData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountriesData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountriesData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountriesData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountriesData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountriesData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountriesData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountriesData] SET  MULTI_USER 
GO
ALTER DATABASE [CountriesData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountriesData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountriesData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountriesData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CountriesData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CountriesData] SET QUERY_STORE = OFF
GO
USE [CountriesData]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CountriesData]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 30.1.2018 г. 22:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Continents]    Script Date: 30.1.2018 г. 22:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 30.1.2018 г. 22:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentId] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 30.1.2018 г. 22:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 30.1.2018 г. 22:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Address], [TownId]) VALUES (1, N'Hristo Botev 51', 1)
INSERT [dbo].[Addresses] ([Id], [Address], [TownId]) VALUES (2, N'Alexander Malinov 22', 2)
INSERT [dbo].[Addresses] ([Id], [Address], [TownId]) VALUES (3, N'Robin Schulz 2', 3)
INSERT [dbo].[Addresses] ([Id], [Address], [TownId]) VALUES (4, N'Joao De Salesao 1', 13)
INSERT [dbo].[Addresses] ([Id], [Address], [TownId]) VALUES (5, N'John Livenger St 33', 5)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (3, N'North America')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (4, N'South America')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (5, N'Africa')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (6, N'Australia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (7, N'Antarctica')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (1, N'Albania', N'1         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (2, N'Bulgaria', N'1         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (3, N'Germany', N'1         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (4, N'Greece', N'1         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (5, N'USA', N'3         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (6, N'Mexico', N'3         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (7, N'Canada', N'3         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (8, N'China', N'2         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (9, N'Japan', N'2         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (10, N'Australia', N'6         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (11, N'New Zeland', N'6         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (12, N'Nigeria', N'5         ')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (13, N'Brazil', N'4         ')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'Ivan', N'Kopanov', 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Gosho', N'Parvanov', 2)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'George ', N'Bush', 3)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'Nikita ', N'Hruschov', 4)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [AddressId]) VALUES (5, N'Jason ', N'Statham', 5)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (1, N'Dimitrovgrad', 2)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (2, N'Sofia', 2)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (3, N'Berlin', 3)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (4, N'Brazil', 13)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (5, N'Kanbera', 10)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (6, N'Tirana', 1)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (7, N'Mexico', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (8, N'New York', 5)
SET IDENTITY_INSERT [dbo].[Towns] OFF
USE [master]
GO
ALTER DATABASE [CountriesData] SET  READ_WRITE 
GO
