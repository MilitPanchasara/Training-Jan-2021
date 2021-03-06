USE [master]
GO
/****** Object:  Database [SQLDay5]    Script Date: 10-03-2021 13:13:10 ******/
CREATE DATABASE [SQLDay5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLDay5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SQLDay5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQLDay5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SQLDay5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SQLDay5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLDay5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLDay5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLDay5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLDay5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLDay5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLDay5] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLDay5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQLDay5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLDay5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLDay5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLDay5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLDay5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLDay5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLDay5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLDay5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLDay5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SQLDay5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLDay5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLDay5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLDay5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLDay5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLDay5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLDay5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLDay5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SQLDay5] SET  MULTI_USER 
GO
ALTER DATABASE [SQLDay5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLDay5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLDay5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLDay5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQLDay5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQLDay5] SET QUERY_STORE = OFF
GO
USE [SQLDay5]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] NOT NULL,
	[VIN] [int] NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Year] [numeric](4, 0) NOT NULL,
	[Mileage] [float] NOT NULL,
	[AskPrice] [float] NOT NULL,
	[InvoicePrice] [float] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealerships]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealerships](
	[DealershipID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dealerships] PRIMARY KEY CLUSTERED 
(
	[DealershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [decimal](6, 0) NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](25) NOT NULL,
	[JoiningDate] [date] NOT NULL,
	[Salary] [int] NULL,
	[ManagerID] [int] NULL,
	[Department] [varchar](20) NULL,
 CONSTRAINT [pkEmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incentives]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incentives](
	[IncentiveID] [int] NULL,
	[EmployeeRefID] [decimal](6, 0) NULL,
	[IncentiveDate] [date] NULL,
	[IncentiveAmount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] NOT NULL,
	[VIN] [int] NOT NULL,
	[DealershipID] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportsTo]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportsTo](
	[ReportsToID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[ManagingSalesPersonID] [int] NOT NULL,
 CONSTRAINT [PK_ReportsTo] PRIMARY KEY CLUSTERED 
(
	[ReportsToID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] NOT NULL,
	[VIN] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[DealershipID] [int] NOT NULL,
	[SalePrice] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPersons]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPersons](
	[SalesPersonID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SalesPersons] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorksAt]    Script Date: 10-03-2021 13:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorksAt](
	[WorksAtID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[DealershipID] [int] NOT NULL,
	[MonthWorked] [int] NOT NULL,
	[BaseSalaryForMonth] [int] NOT NULL,
 CONSTRAINT [PK_WorksAt] PRIMARY KEY CLUSTERED 
(
	[WorksAtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (1, 1, N'Nissan', N'GT-R', CAST(2016 AS Numeric(4, 0)), 5, 20000000, 22000000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (2, 2, N'Ford', N'GT', CAST(2018 AS Numeric(4, 0)), 6, 12000000, 13000000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (3, 3, N'Ferrari', N'GTO', CAST(2018 AS Numeric(4, 0)), 8, 20000000, 21000000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (4, 4, N'Toyota', N'Prius', CAST(2020 AS Numeric(4, 0)), 15, 1000000, 1100000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (5, 5, N'Honda', N'Civic', CAST(2018 AS Numeric(4, 0)), 12, 1500000, 1600000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (6, 6, N'Hyundai', N'Sonata', CAST(2020 AS Numeric(4, 0)), 10, 2000000, 2050000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (7, 7, N'Hyundai', N'Grand i10', CAST(2016 AS Numeric(4, 0)), 18, 700000, 750000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (8, 8, N'Toyota', N'Camry', CAST(2018 AS Numeric(4, 0)), 12, 2400000, 2450000)
INSERT [dbo].[Cars] ([CarID], [VIN], [Make], [Model], [Year], [Mileage], [AskPrice], [InvoicePrice]) VALUES (9, 9, N'Toyota', N'Camry', CAST(2018 AS Numeric(4, 0)), 12.5, 2410000, 2460000)
GO
INSERT [dbo].[Customers] ([CustomerID], [Name], [Address], [City], [State]) VALUES (1, N'Milit', N'Gondal Rd.', N'Rajkot', N'Gujarat')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Address], [City], [State]) VALUES (2, N'Raj', N'S. G. Highway', N'Ahmedabad', N'Gujarat')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Address], [City], [State]) VALUES (3, N'Udit', N'XYZ', N'Delhi', N'Delhi')
GO
INSERT [dbo].[Dealerships] ([DealershipID], [Name], [Address], [City], [State]) VALUES (1, N'Nissan Cars', N'S. G. Highway', N'Ahmedabad', N'Gujarat')
INSERT [dbo].[Dealerships] ([DealershipID], [Name], [Address], [City], [State]) VALUES (2, N'Ferrari Sales', N'XYZ', N'Mumbai', N'Maharastra')
INSERT [dbo].[Dealerships] ([DealershipID], [Name], [Address], [City], [State]) VALUES (3, N'Ford', N'Gondal Rd.', N'Rajkot', N'Gujarat')
INSERT [dbo].[Dealerships] ([DealershipID], [Name], [Address], [City], [State]) VALUES (4, N'Hero Honda Car World', N'Gondal Rd.', N'Rajkot', N'Gujarat')
INSERT [dbo].[Dealerships] ([DealershipID], [Name], [Address], [City], [State]) VALUES (5, N'Concept Hyundai', N'Paldi', N'Ahmedabad', N'Gujarat')
INSERT [dbo].[Dealerships] ([DealershipID], [Name], [Address], [City], [State]) VALUES (6, N'Toyota Performance', N'Paldi', N'Ahmedabad', N'Gujarat')
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(1 AS Decimal(6, 0)), N'John', N'Abraham', CAST(N'2013-01-01' AS Date), 1000000, NULL, N'Banking')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(2 AS Decimal(6, 0)), N'Michael', N'Clarke', CAST(N'2013-01-01' AS Date), 800000, 1, N'Insurance')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(3 AS Decimal(6, 0)), N'Roy', N'Thomas', CAST(N'2013-02-01' AS Date), 700000, 1, N'Banking')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(4 AS Decimal(6, 0)), N'Tom', N'Jose', CAST(N'2013-02-01' AS Date), 600000, 2, N'Insurance')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(5 AS Decimal(6, 0)), N'Jerry', N'Pinto', CAST(N'2013-02-01' AS Date), 650000, 3, N'Insurance')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(6 AS Decimal(6, 0)), N'Philip', N'Mathew', CAST(N'2013-01-01' AS Date), 750000, 3, N'Services')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(7 AS Decimal(6, 0)), N'TestName1', N'123', CAST(N'2013-01-01' AS Date), 650000, 2, N'Services')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [JoiningDate], [Salary], [ManagerID], [Department]) VALUES (CAST(8 AS Decimal(6, 0)), N'TestName2', N'Lname%', CAST(N'2013-02-01' AS Date), 600000, 2, N'Insurance')
GO
INSERT [dbo].[Incentives] ([IncentiveID], [EmployeeRefID], [IncentiveDate], [IncentiveAmount]) VALUES (1, CAST(1 AS Decimal(6, 0)), CAST(N'2013-02-01' AS Date), 5000)
INSERT [dbo].[Incentives] ([IncentiveID], [EmployeeRefID], [IncentiveDate], [IncentiveAmount]) VALUES (2, CAST(2 AS Decimal(6, 0)), CAST(N'2013-02-01' AS Date), 3000)
INSERT [dbo].[Incentives] ([IncentiveID], [EmployeeRefID], [IncentiveDate], [IncentiveAmount]) VALUES (3, CAST(3 AS Decimal(6, 0)), CAST(N'2013-02-01' AS Date), 4000)
INSERT [dbo].[Incentives] ([IncentiveID], [EmployeeRefID], [IncentiveDate], [IncentiveAmount]) VALUES (4, CAST(1 AS Decimal(6, 0)), CAST(N'2013-01-01' AS Date), 4500)
INSERT [dbo].[Incentives] ([IncentiveID], [EmployeeRefID], [IncentiveDate], [IncentiveAmount]) VALUES (5, CAST(2 AS Decimal(6, 0)), CAST(N'2013-01-01' AS Date), 3500)
GO
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (1, 1, 1)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (2, 2, 3)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (3, 3, 2)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (4, 5, 4)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (5, 4, 6)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (6, 6, 5)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (7, 7, 5)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (8, 8, 6)
INSERT [dbo].[Inventory] ([InventoryID], [VIN], [DealershipID]) VALUES (9, 9, 6)
GO
INSERT [dbo].[ReportsTo] ([ReportsToID], [SalesPersonID], [ManagingSalesPersonID]) VALUES (1, 1, 2)
INSERT [dbo].[ReportsTo] ([ReportsToID], [SalesPersonID], [ManagingSalesPersonID]) VALUES (2, 3, 7)
INSERT [dbo].[ReportsTo] ([ReportsToID], [SalesPersonID], [ManagingSalesPersonID]) VALUES (3, 5, 4)
INSERT [dbo].[ReportsTo] ([ReportsToID], [SalesPersonID], [ManagingSalesPersonID]) VALUES (4, 6, 4)
INSERT [dbo].[ReportsTo] ([ReportsToID], [SalesPersonID], [ManagingSalesPersonID]) VALUES (5, 10, 7)
GO
INSERT [dbo].[Sales] ([SaleID], [VIN], [CustomerID], [SalesPersonID], [DealershipID], [SalePrice], [SaleDate]) VALUES (1, 1, 1, 1, 1, 30000000, CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Sales] ([SaleID], [VIN], [CustomerID], [SalesPersonID], [DealershipID], [SalePrice], [SaleDate]) VALUES (2, 1, 2, 1, 1, 31000000, CAST(N'2019-05-01' AS Date))
INSERT [dbo].[Sales] ([SaleID], [VIN], [CustomerID], [SalesPersonID], [DealershipID], [SalePrice], [SaleDate]) VALUES (3, 2, 3, 6, 3, 24000000, CAST(N'2020-05-01' AS Date))
INSERT [dbo].[Sales] ([SaleID], [VIN], [CustomerID], [SalesPersonID], [DealershipID], [SalePrice], [SaleDate]) VALUES (4, 3, 1, 7, 2, 30000000, CAST(N'2020-10-17' AS Date))
INSERT [dbo].[Sales] ([SaleID], [VIN], [CustomerID], [SalesPersonID], [DealershipID], [SalePrice], [SaleDate]) VALUES (5, 7, 3, 9, 5, 780000, CAST(N'2018-01-15' AS Date))
INSERT [dbo].[Sales] ([SaleID], [VIN], [CustomerID], [SalesPersonID], [DealershipID], [SalePrice], [SaleDate]) VALUES (6, 6, 1, 8, 5, 2000000, CAST(N'2020-10-10' AS Date))
GO
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (1, N'Mike')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (2, N'John')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (3, N'Sheldon')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (4, N'George')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (5, N'Lisa')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (6, N'Neil')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (7, N'Adam Smith')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (8, N'X')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (9, N'Y')
INSERT [dbo].[SalesPersons] ([SalesPersonID], [Name]) VALUES (10, N'Z')
GO
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (1, 1, 1, 8, 12000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (2, 2, 1, 13, 15000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (3, 3, 2, 12, 14000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (4, 4, 3, 134, 25000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (5, 5, 3, 2, 8000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (6, 6, 3, 14, 15000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (7, 7, 2, 134, 35000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (8, 8, 5, 25, 30000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (9, 9, 5, 15, 20000)
INSERT [dbo].[WorksAt] ([WorksAtID], [SalesPersonID], [DealershipID], [MonthWorked], [BaseSalaryForMonth]) VALUES (10, 10, 2, 10, 20000)
GO
/****** Object:  Index [IX_Cars]    Script Date: 10-03-2021 13:13:10 ******/
ALTER TABLE [dbo].[Cars] ADD  CONSTRAINT [IX_Cars] UNIQUE NONCLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ('0') FOR [EmployeeID]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [FirstName]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [Salary]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [ManagerID]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [Department]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Cars] FOREIGN KEY([VIN])
REFERENCES [dbo].[Cars] ([VIN])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Cars]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Dealerships] FOREIGN KEY([DealershipID])
REFERENCES [dbo].[Dealerships] ([DealershipID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Dealerships]
GO
ALTER TABLE [dbo].[ReportsTo]  WITH CHECK ADD  CONSTRAINT [FK_SalesPersonID] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[ReportsTo] CHECK CONSTRAINT [FK_SalesPersonID]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Cars] FOREIGN KEY([VIN])
REFERENCES [dbo].[Cars] ([VIN])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Cars]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Customers]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Dealerships] FOREIGN KEY([DealershipID])
REFERENCES [dbo].[Dealerships] ([DealershipID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Dealerships]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SalesPersons] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_SalesPersons]
GO
ALTER TABLE [dbo].[WorksAt]  WITH CHECK ADD  CONSTRAINT [FK_WorksAt_Dealerships] FOREIGN KEY([DealershipID])
REFERENCES [dbo].[Dealerships] ([DealershipID])
GO
ALTER TABLE [dbo].[WorksAt] CHECK CONSTRAINT [FK_WorksAt_Dealerships]
GO
ALTER TABLE [dbo].[WorksAt]  WITH CHECK ADD  CONSTRAINT [FK_WorksAt_SalesPersons] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [dbo].[WorksAt] CHECK CONSTRAINT [FK_WorksAt_SalesPersons]
GO
USE [master]
GO
ALTER DATABASE [SQLDay5] SET  READ_WRITE 
GO
