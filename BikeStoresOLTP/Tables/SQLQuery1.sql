USE [master]
GO
/****** Object:  Database [Bookstore]    Script Date: 9/11/2025 21:12:54 ******/
CREATE DATABASE [Bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bookstore.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Bookstore_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Bookstore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bookstore] SET RECOVERY FULL 
GO
ALTER DATABASE [Bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [Bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bookstore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bookstore', N'ON'
GO
ALTER DATABASE [Bookstore] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bookstore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bookstore]
GO
/****** Object:  Table [dbo].[address]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] NOT NULL,
	[street_number] [varchar](10) NULL,
	[street_name] [varchar](200) NULL,
	[city] [varchar](100) NULL,
	[country_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[address_status]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address_status](
	[status_id] [int] NOT NULL,
	[address_status] [varchar](30) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_addr_status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[author]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author](
	[author_id] [int] NOT NULL,
	[author_name] [varchar](400) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_author] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[book_id] [int] NOT NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[language_id] [int] NULL,
	[num_pages] [int] NULL,
	[publication_date] [date] NULL,
	[publisher_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_author]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_author](
	[book_id] [int] NOT NULL,
	[author_id] [int] NOT NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_bookauthor] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_language]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_language](
	[language_id] [int] NOT NULL,
	[language_code] [varchar](8) NULL,
	[language_name] [varchar](50) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_language] PRIMARY KEY CLUSTERED 
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[country_id] [int] NOT NULL,
	[country_name] [varchar](200) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_order]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[customer_id] [int] NULL,
	[shipping_method_id] [int] NULL,
	[dest_address_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_custorder] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](200) NULL,
	[last_name] [varchar](200) NULL,
	[email] [varchar](350) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_address]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_address](
	[customer_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[status_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_custaddr] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_history]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_history](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[status_id] [int] NULL,
	[status_date] [datetime] NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_orderhist] PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_line]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_line](
	[line_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[book_id] [int] NULL,
	[price] [decimal](5, 2) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_orderline] PRIMARY KEY CLUSTERED 
(
	[line_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[status_id] [int] NOT NULL,
	[status_value] [varchar](20) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_orderstatus] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher](
	[publisher_id] [int] NOT NULL,
	[publisher_name] [varchar](400) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_publisher] PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_method]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_method](
	[method_id] [int] NOT NULL,
	[method_name] [varchar](100) NULL,
	[cost] [decimal](6, 2) NULL,
	[rowversion] [timestamp] NOT NULL,
 CONSTRAINT [pk_shipmethod] PRIMARY KEY CLUSTERED 
(
	[method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [fk_addr_ctry] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [fk_addr_ctry]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [fk_book_lang] FOREIGN KEY([language_id])
REFERENCES [dbo].[book_language] ([language_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [fk_book_lang]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [fk_book_pub] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[publisher] ([publisher_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [fk_book_pub]
GO
ALTER TABLE [dbo].[book_author]  WITH CHECK ADD  CONSTRAINT [fk_ba_author] FOREIGN KEY([author_id])
REFERENCES [dbo].[author] ([author_id])
GO
ALTER TABLE [dbo].[book_author] CHECK CONSTRAINT [fk_ba_author]
GO
ALTER TABLE [dbo].[book_author]  WITH CHECK ADD  CONSTRAINT [fk_ba_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[book_author] CHECK CONSTRAINT [fk_ba_book]
GO
ALTER TABLE [dbo].[cust_order]  WITH CHECK ADD  CONSTRAINT [fk_order_addr] FOREIGN KEY([dest_address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[cust_order] CHECK CONSTRAINT [fk_order_addr]
GO
ALTER TABLE [dbo].[cust_order]  WITH CHECK ADD  CONSTRAINT [fk_order_cust] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[cust_order] CHECK CONSTRAINT [fk_order_cust]
GO
ALTER TABLE [dbo].[cust_order]  WITH CHECK ADD  CONSTRAINT [fk_order_ship] FOREIGN KEY([shipping_method_id])
REFERENCES [dbo].[shipping_method] ([method_id])
GO
ALTER TABLE [dbo].[cust_order] CHECK CONSTRAINT [fk_order_ship]
GO
ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [fk_ca_addr] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [fk_ca_addr]
GO
ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [fk_ca_cust] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [fk_ca_cust]
GO
ALTER TABLE [dbo].[customer_address]  WITH CHECK ADD  CONSTRAINT [fk_customer_address_addres_status_id] FOREIGN KEY([status_id])
REFERENCES [dbo].[address_status] ([status_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[customer_address] CHECK CONSTRAINT [fk_customer_address_addres_status_id]
GO
ALTER TABLE [dbo].[order_history]  WITH CHECK ADD  CONSTRAINT [fk_oh_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[cust_order] ([order_id])
GO
ALTER TABLE [dbo].[order_history] CHECK CONSTRAINT [fk_oh_order]
GO
ALTER TABLE [dbo].[order_history]  WITH CHECK ADD  CONSTRAINT [fk_oh_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[order_status] ([status_id])
GO
ALTER TABLE [dbo].[order_history] CHECK CONSTRAINT [fk_oh_status]
GO
ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_ol_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_ol_book]
GO
ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_ol_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[cust_order] ([order_id])
GO
ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_ol_order]
GO
/****** Object:  StoredProcedure [dbo].[GetAddressChangesByRowVersion]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAddressChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	select 
	a.[address_id]
	,a.[street_name]
	,a.[street_number]
	,a.[city]
	,co.[country_name]
  FROM [dbo].[address] a
  JOIN [dbo].[country] co on (a.country_id = co.country_id)
  WHERE (a.[rowversion] > CONVERT(ROWVERSION,@startRow) AND a.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (co.[rowversion] > CONVERT(ROWVERSION,@startRow) AND co.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
/****** Object:  StoredProcedure [dbo].[GetBookChangesByRowVersion]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBookChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
  SELECT b.[book_id]
      ,b.[title]
      ,b.[isbn13]
      ,bl.[language_code]
      ,bl.[language_name]
      ,b.[num_pages]
      ,b.[publication_date]
      ,p.[publisher_name]
      ,a.[author_name]
    FROM [dbo].[book] b
    INNER JOIN [dbo].[book_language] bl ON b.language_id = bl.language_id
    INNER JOIN [dbo].[publisher] p ON b.publisher_id = p.publisher_id
    INNER JOIN [dbo].[book_author] ba ON b.book_id = ba.book_id
    INNER JOIN [dbo].[author] a ON ba.author_id = a.author_id
    WHERE (b.[rowversion] > CONVERT(ROWVERSION,@startRow) AND b.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (bl.[rowversion] > CONVERT(ROWVERSION,@startRow) AND bl.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (p.[rowversion] > CONVERT(ROWVERSION,@startRow) AND p.[rowversion] <= CONVERT(ROWVERSION,@endRow))
    OR (ba.[rowversion] > CONVERT(ROWVERSION,@startRow) AND ba.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (a.[rowversion] > CONVERT(ROWVERSION,@startRow) AND a.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END



-- Address
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerChangesByRowVersion]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	select c.[customer_id]
      ,c.[first_name]
      ,c.[last_name]
      ,c.[email]
	  ,a.[street_name]
	  ,a.[street_number]
	  ,a.city
	  ,adds.address_status
	  ,co.country_name
  FROM [Bookstore].[dbo].[customer] c
  JOIN [dbo].[customer_address] ca ON (c.customer_id = ca.customer_id)
  JOIN [dbo].[address_status] adds ON (ca.status_id = adds.status_id)
  JOIN [dbo].[address] a ON (ca.address_id = a.address_id)
  JOIN [dbo].[country] co on (a.country_id = co.country_id)
  WHERE (c.[rowversion] > CONVERT(ROWVERSION,@startRow) AND c.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (ca.[rowversion] > CONVERT(ROWVERSION,@startRow) AND ca.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (adds.[rowversion] > CONVERT(ROWVERSION,@startRow) AND adds.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (a.[rowversion] > CONVERT(ROWVERSION,@startRow) AND a.[rowversion] <= CONVERT(ROWVERSION,@endRow))
  OR (co.[rowversion] > CONVERT(ROWVERSION,@startRow) AND co.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END



-- BOOK
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetDatabaseRowVersion]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDatabaseRowVersion]
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET NOCOUNT ON

	SELECT DBTS = (CONVERT(BIGINT,MIN_ACTIVE_ROWVERSION())-1);
END


-- Shipping Method
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[GetShippingMethodChangesByRowVersion]    Script Date: 9/11/2025 21:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetShippingMethodChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [method_id]
      ,[method_name]
      ,[cost]
	  FROM [dbo].[shipping_method]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END

--CUSTOMER
SET ANSI_NULLS ON
GO
USE [master]
GO
ALTER DATABASE [Bookstore] SET  READ_WRITE 
GO
