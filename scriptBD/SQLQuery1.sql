USE [master]
GO
/****** Object:  Database [PPplutenko]    Script Date: 10.04.2023 9:22:54 ******/
CREATE DATABASE [PPplutenko]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YPplutenko', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VLADSQL\MSSQL\DATA\YPplutenko.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YPplutenko_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VLADSQL\MSSQL\DATA\YPplutenko_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PPplutenko] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PPplutenko].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PPplutenko] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PPplutenko] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PPplutenko] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PPplutenko] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PPplutenko] SET ARITHABORT OFF 
GO
ALTER DATABASE [PPplutenko] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PPplutenko] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PPplutenko] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PPplutenko] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PPplutenko] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PPplutenko] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PPplutenko] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PPplutenko] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PPplutenko] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PPplutenko] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PPplutenko] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PPplutenko] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PPplutenko] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PPplutenko] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PPplutenko] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PPplutenko] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PPplutenko] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PPplutenko] SET RECOVERY FULL 
GO
ALTER DATABASE [PPplutenko] SET  MULTI_USER 
GO
ALTER DATABASE [PPplutenko] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PPplutenko] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PPplutenko] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PPplutenko] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PPplutenko] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PPplutenko] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PPplutenko', N'ON'
GO
ALTER DATABASE [PPplutenko] SET QUERY_STORE = OFF
GO
USE [PPplutenko]
GO
/****** Object:  Table [dbo].[regis]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[login] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_regis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗаказанныеТовары]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗаказанныеТовары](
	[ID_заказа] [int] NULL,
	[ID_товара] [int] NULL,
	[Количество_товара_в_заказе] [int] NULL,
	[Стоимость_товара_в_заказе] [money] NULL,
	[ID_заказ_товары] [int] NOT NULL,
 CONSTRAINT [PK_ЗаказанныеТовары] PRIMARY KEY CLUSTERED 
(
	[ID_заказ_товары] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[ID_заказа] [int] NOT NULL,
	[Дата_заказа] [date] NULL,
	[ID_клиента] [int] NULL,
	[Сумма_заказа] [money] NULL,
	[ID_сотрудника] [int] NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ID_клиента] [int] NOT NULL,
	[ФИО_клиента] [nvarchar](50) NULL,
	[Адрес_клиента] [nvarchar](50) NULL,
	[Телефон_клиента] [nvarchar](50) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[ID_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ID_поставщика] [int] NOT NULL,
	[Наименование_поставщика] [nvarchar](50) NULL,
	[Адрес_поставщика] [nvarchar](50) NULL,
	[Телефон_поставщика] [nvarchar](50) NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_сотрудника] [int] NOT NULL,
	[ФИО_сотрудника] [nvarchar](50) NULL,
	[Должность] [nvarchar](50) NULL,
	[Адрес_сотрудника] [nvarchar](50) NULL,
	[Телефон_сотрудника] [nvarchar](50) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 10.04.2023 9:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[ID_товара] [int] NOT NULL,
	[Наименование_товара] [nvarchar](50) NULL,
	[Количество_на_складе] [int] NULL,
	[Цена_за_единицу_товара] [money] NULL,
	[ID_поставщика] [int] NULL,
 CONSTRAINT [PK_Товары] PRIMARY KEY CLUSTERED 
(
	[ID_товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ЗаказанныеТовары]  WITH CHECK ADD  CONSTRAINT [FK_Заказанные_товары_Заказы] FOREIGN KEY([ID_заказа])
REFERENCES [dbo].[Заказы] ([ID_заказа])
GO
ALTER TABLE [dbo].[ЗаказанныеТовары] CHECK CONSTRAINT [FK_Заказанные_товары_Заказы]
GO
ALTER TABLE [dbo].[ЗаказанныеТовары]  WITH CHECK ADD  CONSTRAINT [FK_Заказанные_товары_Товары] FOREIGN KEY([ID_товара])
REFERENCES [dbo].[Товары] ([ID_товара])
GO
ALTER TABLE [dbo].[ЗаказанныеТовары] CHECK CONSTRAINT [FK_Заказанные_товары_Товары]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Клиенты] FOREIGN KEY([ID_клиента])
REFERENCES [dbo].[Клиенты] ([ID_клиента])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Клиенты]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Сотрудники] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Сотрудники]
GO
ALTER TABLE [dbo].[Товары]  WITH CHECK ADD  CONSTRAINT [FK_Товары_Поставщики] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщики] ([ID_поставщика])
GO
ALTER TABLE [dbo].[Товары] CHECK CONSTRAINT [FK_Товары_Поставщики]
GO
USE [master]
GO
ALTER DATABASE [PPplutenko] SET  READ_WRITE 
GO
