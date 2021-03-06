USE [master]
GO
/****** Object:  Database [Uber]    Script Date: 14-06-2021 12:54:46 ******/
CREATE DATABASE [Uber]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Uber', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MYSQL2017\MSSQL\DATA\Uber.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Uber_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MYSQL2017\MSSQL\DATA\Uber_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Uber] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Uber].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Uber] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Uber] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Uber] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Uber] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Uber] SET ARITHABORT OFF 
GO
ALTER DATABASE [Uber] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Uber] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Uber] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Uber] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Uber] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Uber] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Uber] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Uber] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Uber] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Uber] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Uber] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Uber] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Uber] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Uber] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Uber] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Uber] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Uber] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Uber] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Uber] SET  MULTI_USER 
GO
ALTER DATABASE [Uber] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Uber] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Uber] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Uber] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Uber] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Uber] SET QUERY_STORE = OFF
GO
USE [Uber]
GO
/****** Object:  Schema [Admins]    Script Date: 14-06-2021 12:54:46 ******/
CREATE SCHEMA [Admins]
GO
/****** Object:  Schema [Drivers]    Script Date: 14-06-2021 12:54:46 ******/
CREATE SCHEMA [Drivers]
GO
/****** Object:  Schema [Riders]    Script Date: 14-06-2021 12:54:46 ******/
CREATE SCHEMA [Riders]
GO
/****** Object:  Table [Riders].[Riders]    Script Date: 14-06-2021 12:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riders].[Riders](
	[RiderID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[EmailVerified] [bit] NOT NULL,
	[IsNew] [bit] NOT NULL,
	[ContactNumber] [decimal](10, 0) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
	[InviteCode] [varchar](20) NOT NULL,
	[Country] [varchar](50) NULL,
	[IsBlocked] [bit] NULL,
	[IsLoggedIn] [bit] NULL,
	[SessionExpiresIn] [datetime] NULL,
	[UserId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 14-06-2021 12:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[TripID] [bigint] IDENTITY(1,1) NOT NULL,
	[RiderID] [bigint] NOT NULL,
	[DriverID] [bigint] NOT NULL,
	[SourceLocationID] [bigint] NOT NULL,
	[DestinationLocationID] [bigint] NOT NULL,
	[RideTypeID] [bigint] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [varchar](20) NOT NULL,
	[EstimatedFairAmount] [float] NULL,
	[ActualFairAmount] [float] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[CancelledBy] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Drivers].[Drivers]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Drivers].[Drivers](
	[DriverID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[EmailVerified] [bit] NOT NULL,
	[ContactNumber] [decimal](10, 0) NOT NULL,
	[TotalRidesDone] [int] NOT NULL,
	[TotalRidesCancelled] [int] NOT NULL,
	[Salary] [float] NULL,
	[IsBlocked] [bit] NULL,
	[IsLoggedIn] [bit] NULL,
	[SessionExpiresIn] [datetime] NULL,
	[Password] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
	[UserId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](max) NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RideTypes]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RideTypes](
	[RideTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[RideName] [varchar](50) NOT NULL,
	[PricePerKm] [float] NOT NULL,
	[SeatingCapacity] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RideTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Drivers].[Vehicles]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Drivers].[Vehicles](
	[VehicleID] [bigint] IDENTITY(1,1) NOT NULL,
	[DriverID] [bigint] NOT NULL,
	[CurrentRideTypeID] [bigint] NULL,
	[VehicleBrand] [varchar](max) NOT NULL,
	[VehicleName] [varchar](max) NOT NULL,
	[RegistrationNo] [varchar](max) NOT NULL,
	[VehicleDocument] [varchar](max) NOT NULL,
	[VehicleType] [varchar](max) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTripsData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTripsData]
                        AS
                        SELECT 
                        T.TripID,
                        R.RiderID AS RiderId,
                        D.DriverID AS DriverId,
                        R.FirstName + ' ' + R.LastName AS RiderName, 
                        D.FirstName + ' ' + D.LastName AS DriverName, 
                        L1.LocationName AS SourceLocation, 
                        L2.LocationName AS DestinationLocation,
                        RT.RideName,
                        V.VehicleBrand,
		                V.VehicleName,
		                V.RegistrationNo,
                        StartTime,
                        EndTime,
                        Status,
                        EstimatedFairAmount,
                        ActualFairAmount,
                        CancelledBy
                        FROM Trips AS T
                        JOIN Riders.Riders AS R ON R.RiderID = T.RiderID
                        JOIN Drivers.Drivers AS D ON D.DriverID = T.DriverID
                        JOIN Locations AS L1 ON L1.LocationID = T.SourceLocationID
                        JOIN Locations AS L2 ON L2.LocationID = T.DestinationLocationID
                        JOIN RideTypes RT ON RT.RideTypeID = T.RideTypeID
	                    JOIN Drivers.Vehicles V ON V.DriverID = D.DriverID
GO
/****** Object:  View [Riders].[vRiders]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [Riders].[vRiders]
                        AS
                        SELECT 
                        RiderID, 
                        FirstName,
                        LastName,
                        Email,
                        ContactNumber,
                        InviteCode,
                        Country,
                        ModifiedAt
                        FROM Riders.Riders
GO
/****** Object:  View [dbo].[vCurrentTrips]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vCurrentTrips]
AS
SELECT 
TripID,
RiderID, 
DriverID, 
SourceLocationID, 
DestinationLocationID,
RideTypeID,
StartTime,
EndTime,
Status,
EstimatedFairAmount,
ActualFairAmount,
CancelledBy,
CreatedAt, 
ModifiedAt
FROM Trips WHERE Status='Current'
GO
/****** Object:  View [Drivers].[vDrivers]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [Drivers].[vDrivers]
                    AS
                    SELECT 
                    DriverID, 
                    FirstName,
                    LastName,
                    Email,
                    ContactNumber,
                    ModifiedAt
                    FROM Drivers.Drivers
GO
/****** Object:  View [Riders].[RiderCredentials]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [Riders].[RiderCredentials]
AS
SELECT
RiderID,
Password,
IsBlocked,
IsLoggedIn,
SessionExpiresIn
FROM Riders.Riders;
GO
/****** Object:  View [Drivers].[DriverCredentials]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- view to access Credentials of Driver
CREATE   VIEW [Drivers].[DriverCredentials]
AS
SELECT
DriverID,
Password,
IsBlocked,
IsLoggedIn,
SessionExpiresIn
FROM Drivers.Drivers;
GO
/****** Object:  Table [Admins].[Admins]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admins].[Admins](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNumber] [decimal](10, 0) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
	[UserId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Drivers].[ApplicableIncentives]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Drivers].[ApplicableIncentives](
	[DriverID] [bigint] NOT NULL,
	[IncentiveID] [bigint] NOT NULL,
	[IsDisabled] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Drivers].[DriverDetails]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Drivers].[DriverDetails](
	[DriverID] [bigint] NULL,
	[DrivingLicense] [varchar](max) NULL,
	[AadharCard] [varchar](max) NULL,
	[PanCard] [varchar](max) NULL,
	[OtherDocument] [varchar](max) NULL,
	[CurrentAddress] [varchar](max) NULL,
	[PermenantAddress] [varchar](max) NULL,
	[Country] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Drivers].[Incentives]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Drivers].[Incentives](
	[IncentiveID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IncentiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Drivers].[Ratings]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Drivers].[Ratings](
	[RatingID] [bigint] IDENTITY(1,1) NOT NULL,
	[RiderID] [bigint] NOT NULL,
	[DriverID] [bigint] NOT NULL,
	[TripID] [bigint] NOT NULL,
	[Comments] [varchar](max) NULL,
	[MediaAttached] [varchar](max) NULL,
	[Rating] [float] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Riders].[ApplicableOffers]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riders].[ApplicableOffers](
	[RiderID] [bigint] NOT NULL,
	[OfferID] [bigint] NOT NULL,
	[IsDisabled] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Riders].[Offers]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riders].[Offers](
	[OfferID] [bigint] IDENTITY(1,1) NOT NULL,
	[OfferCode] [varchar](50) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Riders].[Ratings]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riders].[Ratings](
	[RatingID] [bigint] IDENTITY(1,1) NOT NULL,
	[RiderID] [bigint] NOT NULL,
	[DriverID] [bigint] NOT NULL,
	[TripID] [bigint] NOT NULL,
	[Comments] [varchar](max) NULL,
	[MediaAttached] [varchar](max) NULL,
	[Rating] [float] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Riders].[SavedPaymentModes]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riders].[SavedPaymentModes](
	[RiderID] [bigint] NULL,
	[PaymentMode] [varchar](20) NOT NULL,
	[CardNumber] [decimal](16, 0) NOT NULL,
	[CardDate] [datetime] NOT NULL,
	[CardName] [varchar](100) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Admins].[Admins] ON 

INSERT [Admins].[Admins] ([ID], [FirstName], [LastName], [Email], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (1, N'Milit', N'Panchasara', N'milit6116@gmail.com', CAST(7990349033 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Admins].[Admins] ([ID], [FirstName], [LastName], [Email], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (2, N'Admin', N'1', N'admin@gmail.com', CAST(7990349011 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-06-03T17:49:18.000' AS DateTime), NULL, N'3888a22a-d56d-409d-ac48-853b2a79f471')
SET IDENTITY_INSERT [Admins].[Admins] OFF
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210428081607_initial', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210428082044_UserForeignKeys', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210428182927_updatedRiderDriverViews', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210429104808_TripView', N'5.0.5')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'31be295c-e908-4070-9239-f4bc47b98ba3', N'Rider', N'RIDER', N'7e9dd91e-7614-4269-8cfa-c8060f44f078')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'abf85da4-12ad-48c5-b300-5d850ab794cb', N'Driver', N'DRIVER', N'aadbf84d-1335-4819-9541-016fcd97b799')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f087efb4-bce9-4ea9-a865-1948befc71fa', N'Admin', N'ADMIN', N'de24a7a9-24b5-45d7-a8c4-b5dd746fe542')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12d7ccb9-3c7d-4f0d-b1c5-c7f37f36d925', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1576d022-2fd2-4e15-90ba-395d46abd0bf', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c7697ea-54d6-4096-994c-755db7d323b5', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'473e37a9-61d2-4df7-b519-e9aa53677bf8', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'53259c84-cfa0-41e4-9d35-b963e9887972', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'69e4c363-9c0c-48ee-ad8a-80a09239e8b2', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9ff59ef4-3f43-4cac-85fe-94b7ee110f90', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b59fbc25-f184-4c9c-a2a3-71aa5955750d', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd85e14c3-c769-4a51-a6a0-7ce4199fa5d8', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dc736b73-e0cd-4203-8250-3581d6e03efa', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6009fd7-379b-4c1a-a2ec-4b173b91fd4f', N'31be295c-e908-4070-9239-f4bc47b98ba3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2bcfc487-db54-447d-91c7-94279aaff94c', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8093bfb8-9a60-4e92-9f3e-f6a4eaf97ffb', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c7c327af-380c-421b-8823-0af3074cf929', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd5b8abe6-c60a-4c3f-aad7-60728c627538', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dbea348c-5dd6-487c-b0a2-110559973f42', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e7be1c31-1230-4a66-b0ea-e2e772530988', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f23afc03-2526-427c-82eb-004dabdf0b12', N'abf85da4-12ad-48c5-b300-5d850ab794cb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3888a22a-d56d-409d-ac48-853b2a79f471', N'f087efb4-bce9-4ea9-a865-1948befc71fa')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'12d7ccb9-3c7d-4f0d-b1c5-c7f37f36d925', N'm2@m.m', N'M2@M.M', N'm2@m.m', N'M2@M.M', 0, N'AQAAAAEAACcQAAAAEDbPkhbgamJchtlLIzesxcwYpy1YG3jtCyVhw5PK2GHaFyEFfsvO0vIIGbvqp/UklQ==', N'F6R3VMQIAYOMXYP3VET3NUW573RH27TU', N'11d9a96f-59d6-4bd1-8bc0-3f2fd1c23009', N'8989898989', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1576d022-2fd2-4e15-90ba-395d46abd0bf', N'nefaloj247@slowimo.com', N'NEFALOJ247@SLOWIMO.COM', N'nefaloj247@slowimo.com', N'NEFALOJ247@SLOWIMO.COM', 0, N'AQAAAAEAACcQAAAAEOL8IHDFKOSQPg/02aJ5jP/2+kKgKQFHh9yZRLhKgLJ00kYm82QVMSAtBOI56aZXMQ==', N'MF5RLGTXQJVQ32NKXDOZA5A5WM5RDH7O', N'3f682ced-41ac-45ef-a60d-0945c6fdddaa', N'2121212121', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c7697ea-54d6-4096-994c-755db7d323b5', N'201601166@daiict.ac.in', N'201601166@DAIICT.AC.IN', N'201601166@daiict.ac.in', N'201601166@DAIICT.AC.IN', 0, N'AQAAAAEAACcQAAAAEMM31T4BKcnTCkeoxUR9zKYkHIoERCzd0M1Z2b7Z9rLKW4Ng7q7InzQ0UyFQNIFmjA==', N'ZQMLWSDBRSGIIYDGPLYAUPALJRWBYUBY', N'cecffe41-d076-4179-9d76-eca24db8cb9c', N'7878787812', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2bcfc487-db54-447d-91c7-94279aaff94c', N'milit22112@gmail.com', N'MILIT22112@GMAIL.COM', N'milit22112@gmail.com', N'MILIT22112@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHQN8osrA2mk7JXcil3sRZzcuDxx/+7ksh0KFehxI7ZtXTILPIymPtISGsPTEu7ItQ==', N'BOD5L6RUZAYSRNY4RNPDOP57U7T43ZDR', N'eb6691df-39a6-4a85-b1b2-996332d21746', N'7990349012', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3888a22a-d56d-409d-ac48-853b2a79f471', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKr0L9JfbQWA30F1XH8kaPqw7dwEzahO/fG4PZISpYcMyUDSckJmBwTgI1RUKMyooQ==', N'P2YYDBT3ESRAPJUWW7FCOO5556ALTOC3', N'83f205ca-8ae6-4c01-9fdd-699f68155441', N'7990349011', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'473e37a9-61d2-4df7-b519-e9aa53677bf8', N'spsp6116@gmail.com', N'SPSP6116@GMAIL.COM', N'spsp6116@gmail.com', N'SPSP6116@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENkTmzUWsqVk6+XuZ624+cYXjZl2eD6jWCMUzm/T/eodtFzaxJBsPDI4kFBKkA0xLg==', N'DKIZJHJY3BNUTFULHFRSULSOPVPLN2GP', N'e0aef041-c977-4440-8924-ab56e4bf7f72', N'2323232323', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'53259c84-cfa0-41e4-9d35-b963e9887972', N'm@mm.mm', N'M@MM.MM', N'm@mm.mm', N'M@MM.MM', 0, N'AQAAAAEAACcQAAAAELzve2IXvJrbx+TlytqYvFDwqq8AO6fW+Ls9lBMCPAVVwemgrOD9NPgu4nw1kO3k8A==', N'FPM4KVK5J3TJHMVSXZTTJXQMMLQUG7T4', N'd69d0fac-8ed6-45f0-8574-ad205d738e57', N'4848484848', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'69e4c363-9c0c-48ee-ad8a-80a09239e8b2', N'm@m.m', N'M@M.M', N'm@m.m', N'M@M.M', 0, N'AQAAAAEAACcQAAAAEHzks7PYTpOTW0/7r51PGIKAvEZzjmdDq8NIqvoo73WyEM+eRNm3DPDRlvOp8f2rwA==', N'MODUWT4Q7LK7LSTG5CONQ7CVRS5B32KS', N'7ed80efa-e81a-42d6-9685-9dec21959b13', N'7990349033', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8093bfb8-9a60-4e92-9f3e-f6a4eaf97ffb', N'milit2212@gmail.com', N'MILIT2212@GMAIL.COM', N'milit2212@gmail.com', N'MILIT2212@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEODzcX65ySkcohslLwKw1OYFKIKGYsAHS4kZIMBaGwIs5zom3G1GMmVZJRMCSaw4Dw==', N'GNGJXF3XF3PE6764OQSLK7W5U753YYL3', N'a43781a6-6732-45e4-bb34-648936c032e6', N'7990349022', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9ff59ef4-3f43-4cac-85fe-94b7ee110f90', N'm4@m.m', N'M4@M.M', N'm4@m.m', N'M4@M.M', 0, N'AQAAAAEAACcQAAAAEDsP/2h/WlM7/9h6GzMD4imrabwGG+Ep6O5ohGvQXq/6VgJHcTzgdVl9lvOj6EPW9Q==', N'LKLKZ7OWBCZXN3MDHSGEVXMVJAZVIEDO', N'333cb032-7c4e-49bb-9540-578996fd2c9d', N'7990349033', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b59fbc25-f184-4c9c-a2a3-71aa5955750d', N'm@M.mm', N'M@M.MM', N'm@M.mm', N'M@M.MM', 0, N'AQAAAAEAACcQAAAAEGG7TXhQMAPn3Fz2sneHIzIi7zkiPsnd9aMebQTxeshsLGNzR9Iq2AXautmUS9ApzA==', N'CAT7CMTSGPO4CHNE5PKY3XRCIXMGCPOD', N'c7bb37fc-9f6c-4fc7-a2fe-a95518cd2403', N'2121212121', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c7c327af-380c-421b-8823-0af3074cf929', N'milit22@gmail.com', N'MILIT22@GMAIL.COM', N'milit22@gmail.com', N'MILIT22@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAhV95+JHhEkTxhWktRhEa5mP+K1ZeGxA0OTTXav820F/GLyGMBPOQ+AaD2LMw3v/g==', N'EXBCZT3ZCDSFIWNYORI4C77YK2S3F6JC', N'91f8fdbf-2e80-42fa-9637-4bc0d8373733', N'7990349072', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd5b8abe6-c60a-4c3f-aad7-60728c627538', N'm3223@m.mp', N'M3223@M.MP', N'm3223@m.mp', N'M3223@M.MP', 0, N'AQAAAAEAACcQAAAAENe2jSE4Za8YqkNsKQrdUVt1wo1I4MTerexe7z31MNk8AG8DBAHQH8Utk1EU43m2aQ==', N'KGGC5ZBTKZADZE54653OLJGLYN62UL62', N'b9c6b5a4-5ec7-4715-8d04-3129adea831a', N'4545454567', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd85e14c3-c769-4a51-a6a0-7ce4199fa5d8', N'milit1@gmail.com', N'MILIT1@GMAIL.COM', N'milit1@gmail.com', N'MILIT1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJDZb6VnC0U4JODrSlYdAnAKhOriufAagtnfwtBAzTzlf40sy9VziIfcSD7BJbckzw==', N'XDSJQSHEDG6TBP6EUUXJ6UJ5TT7YMLJK', N'8ffa6dfa-cb61-4f0b-900b-4b56b2c9ad96', N'7990349032', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dbea348c-5dd6-487c-b0a2-110559973f42', N'mmm@mm.mm', N'MMM@MM.MM', N'mmm@mm.mm', N'MMM@MM.MM', 0, N'AQAAAAEAACcQAAAAEO/NklX1ANtjOSRXrpDMUqu8Vnrkn/zC7nOPOyVDxUGKKqoA4jPptDBwb+zR/eBQcA==', N'2PPK5Y5KERJNKEGVCJK26MMAFUWFO7OI', N'd4d221d4-71d3-4137-b3e3-862bd4e76b8c', N'4848484822', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dc736b73-e0cd-4203-8250-3581d6e03efa', N'm3@m.m', N'M3@M.M', N'm3@m.m', N'M3@M.M', 0, N'AQAAAAEAACcQAAAAEBDyo8i64Ehe7tBR0y+ECZsO2jKbh1MHhYaKITIFQNRDhCXfb9zwpGLoSrfMsifKog==', N'UJL4RPXBDOGEGPKO35BEYS44XMPXTZO3', N'c799dd5d-85d6-4f6b-8366-bca400bf335e', N'9898989855', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e6009fd7-379b-4c1a-a2ec-4b173b91fd4f', N'milit6116@gmail.com', N'MILIT6116@GMAIL.COM', N'milit6116@gmail.com', N'MILIT6116@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEA+qGxTKOpJwdWtMnVhhr+1A/TMIs6DVjZDFGzrm/yXnVCiBK/FMpOzQH8TGff+tPQ==', N'DSAMZJ2PDY5VYBEQ3Q5SZHYWC2LCJ4ZJ', N'715bd0bb-957a-4d0b-84bc-aeb493d95aba', N'7990349033', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e7be1c31-1230-4a66-b0ea-e2e772530988', N'milit222@gmail.com', N'MILIT222@GMAIL.COM', N'milit222@gmail.com', N'MILIT222@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL1bF5HlUDmwuviYCOpd0QYkPzUDmZDyb4KzHztfMkoKWCAiW/+NWNCMg0bvUkRApw==', N'KZRDYKMRTLONJRY3HMAORUULUGVBQDUX', N'fb1a8312-e193-431d-95a9-38f8cb992523', N'7990349022', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f23afc03-2526-427c-82eb-004dabdf0b12', N'rohan@r.r', N'ROHAN@R.R', N'rohan@r.r', N'ROHAN@R.R', 0, N'AQAAAAEAACcQAAAAECJ3MmJMRgjiWr95xOqtDd+xurKSGISaQ7mSlbQm4SKIpl+2g2Zm82CqZvG7P45Glg==', N'OQESS3F22O4FBLQDYXPVLGPXOY6KAXYO', N'f6abdc02-d427-45aa-acba-2353e56077e7', N'1515546566', 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [LocationName], [Longitude], [Latitude], [CreatedAt], [ModifiedAt]) VALUES (1, N'DA-IICT, Gandhinagar, Gujarat', 72.6279837718273, 23.18899005518514, CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Longitude], [Latitude], [CreatedAt], [ModifiedAt]) VALUES (6, N'Radixweb, S. G. Highway, Ahmedabad', 72.547188661474934, 23.120455827022017, CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Longitude], [Latitude], [CreatedAt], [ModifiedAt]) VALUES (10, N'Nirma University, Ahmedabad', 72.542613, 23.128743, CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Longitude], [Latitude], [CreatedAt], [ModifiedAt]) VALUES (11, N'Iscon Crossroad, Ahmedabad', 72.507549, 23.027236, CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[RideTypes] ON 

INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (3, N'UberMoto', 5, 1, CAST(N'2021-04-01T14:37:14.420' AS DateTime), CAST(N'2021-04-01T18:19:19.427' AS DateTime))
INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (8, N'UberAuto', 10, 2, CAST(N'2021-04-01T14:37:14.420' AS DateTime), NULL)
INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (9, N'UberGo', 20, 4, CAST(N'2021-04-01T14:37:14.420' AS DateTime), NULL)
INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (10, N'UberXL', 24, 6, NULL, CAST(N'2021-06-04T14:04:49.387' AS DateTime))
INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (17, N'UberNew2', 7, 3, CAST(N'2021-06-04T14:05:07.990' AS DateTime), CAST(N'2021-06-04T19:37:54.267' AS DateTime))
INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (18, N'U2', 1, 1, CAST(N'2021-06-04T19:38:02.777' AS DateTime), CAST(N'2021-06-04T19:38:07.890' AS DateTime))
INSERT [dbo].[RideTypes] ([RideTypeID], [RideName], [PricePerKm], [SeatingCapacity], [CreatedAt], [ModifiedAt]) VALUES (19, N'Uber new', 10, 2, CAST(N'2021-06-08T10:54:59.420' AS DateTime), CAST(N'2021-06-08T10:55:10.427' AS DateTime))
SET IDENTITY_INSERT [dbo].[RideTypes] OFF
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (4, 12, 1, 1, 6, 3, CAST(N'2021-04-01T14:37:27.630' AS DateTime), CAST(N'2021-04-01T14:43:00.127' AS DateTime), N'Cancelled', 150, NULL, NULL, N'Rider', CAST(N'2021-04-01T14:37:27.630' AS DateTime), CAST(N'2021-04-01T14:43:00.127' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (5, 12, 1, 1, 6, 3, CAST(N'2021-04-01T14:46:06.417' AS DateTime), CAST(N'2021-04-01T14:59:57.883' AS DateTime), N'Completed', 150, 155.5, N'Cash', NULL, CAST(N'2021-04-01T14:38:41.397' AS DateTime), CAST(N'2021-04-01T14:59:57.883' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (6, 21, 3, 6, 1, 9, NULL, CAST(N'2021-06-02T12:48:14.220' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T12:23:01.830' AS DateTime), CAST(N'2021-06-02T12:48:14.220' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (7, 21, 3, 10, 1, 9, NULL, CAST(N'2021-06-02T12:48:52.083' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T12:48:25.093' AS DateTime), CAST(N'2021-06-02T12:48:52.083' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (8, 21, 3, 1, 6, 9, NULL, CAST(N'2021-06-02T13:00:29.390' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T12:53:07.710' AS DateTime), CAST(N'2021-06-02T13:00:29.390' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (9, 21, 3, 1, 6, 9, NULL, CAST(N'2021-06-02T13:10:56.007' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T13:00:38.557' AS DateTime), CAST(N'2021-06-02T13:10:56.007' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (10, 21, 3, 10, 1, 9, CAST(N'2021-06-02T13:25:20.073' AS DateTime), CAST(N'2021-06-02T13:38:02.340' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T13:22:34.233' AS DateTime), CAST(N'2021-06-02T13:38:02.340' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (11, 21, 3, 10, 6, 9, NULL, CAST(N'2021-06-02T13:43:49.047' AS DateTime), N'Completed', 188, 188, N'Cash', NULL, CAST(N'2021-06-02T13:42:53.723' AS DateTime), CAST(N'2021-06-02T13:43:49.047' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (12, 21, 3, 10, 1, 9, NULL, CAST(N'2021-06-02T13:45:21.497' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T13:43:57.297' AS DateTime), CAST(N'2021-06-02T13:45:21.497' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (13, 21, 3, 6, 1, 9, CAST(N'2021-06-02T14:14:32.180' AS DateTime), CAST(N'2021-06-02T14:14:42.223' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T13:45:41.723' AS DateTime), CAST(N'2021-06-02T14:14:42.223' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (14, 21, 3, 6, 1, 9, NULL, CAST(N'2021-06-02T14:16:02.470' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T14:15:55.430' AS DateTime), CAST(N'2021-06-02T14:16:02.470' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (15, 21, 3, 10, 1, 9, CAST(N'2021-06-02T14:16:26.933' AS DateTime), CAST(N'2021-06-02T14:16:34.587' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T14:16:19.903' AS DateTime), CAST(N'2021-06-02T14:16:34.587' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (16, 21, 3, 10, 1, 9, CAST(N'2021-06-02T14:17:40.083' AS DateTime), CAST(N'2021-06-02T14:17:46.787' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T14:17:33.020' AS DateTime), CAST(N'2021-06-02T14:17:46.787' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (17, 21, 3, 6, 1, 9, CAST(N'2021-06-02T14:24:08.530' AS DateTime), CAST(N'2021-06-02T14:24:21.427' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T14:24:01.470' AS DateTime), CAST(N'2021-06-02T14:24:21.427' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (18, 21, 3, 11, 6, 9, CAST(N'2021-06-02T14:36:39.370' AS DateTime), CAST(N'2021-06-02T14:37:33.440' AS DateTime), N'Cancelled', 222.60000000000002, 222.60000000000002, N'Cash', N'Rider', CAST(N'2021-06-02T14:36:22.517' AS DateTime), CAST(N'2021-06-02T14:37:33.440' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (19, 21, 3, 6, 1, 9, CAST(N'2021-06-02T16:48:02.967' AS DateTime), CAST(N'2021-06-02T16:48:12.997' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T16:47:55.920' AS DateTime), CAST(N'2021-06-02T16:48:12.997' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (20, 21, 2, 10, 1, 3, CAST(N'2021-06-02T16:49:49.573' AS DateTime), CAST(N'2021-06-02T16:49:59.617' AS DateTime), N'Completed', 94.350000000000009, 94.350000000000009, N'Cash', NULL, CAST(N'2021-06-02T16:49:42.530' AS DateTime), CAST(N'2021-06-02T16:49:59.617' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (21, 21, 3, 11, 1, 9, CAST(N'2021-06-02T16:55:55.673' AS DateTime), CAST(N'2021-06-02T16:56:05.697' AS DateTime), N'Completed', 436, 436, N'Cash', NULL, CAST(N'2021-06-02T16:55:48.600' AS DateTime), CAST(N'2021-06-02T16:56:05.697' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (22, 21, 3, 6, 1, 9, CAST(N'2021-06-02T17:05:02.420' AS DateTime), CAST(N'2021-06-02T17:05:12.437' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-02T17:04:55.357' AS DateTime), CAST(N'2021-06-02T17:05:12.437' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (23, 21, 3, 11, 10, 9, CAST(N'2021-06-02T17:07:46.907' AS DateTime), CAST(N'2021-06-02T17:07:56.953' AS DateTime), N'Completed', 85.8, 85.8, N'Cash', NULL, CAST(N'2021-06-02T17:07:39.853' AS DateTime), CAST(N'2021-06-02T17:07:56.953' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (24, 21, 3, 10, 1, 9, CAST(N'2021-06-02T17:09:21.580' AS DateTime), CAST(N'2021-06-02T17:09:31.600' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T17:09:14.510' AS DateTime), CAST(N'2021-06-02T17:09:31.600' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (25, 21, 3, 10, 1, 9, CAST(N'2021-06-02T19:07:54.633' AS DateTime), CAST(N'2021-06-02T19:08:04.667' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T19:07:47.570' AS DateTime), CAST(N'2021-06-02T19:08:04.667' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (26, 21, 2, 10, 1, 3, CAST(N'2021-06-02T19:10:57.143' AS DateTime), CAST(N'2021-06-02T19:11:09.320' AS DateTime), N'Completed', 94.350000000000009, 94.350000000000009, N'Cash', NULL, CAST(N'2021-06-02T19:10:47.447' AS DateTime), CAST(N'2021-06-02T19:11:09.320' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (27, 21, 1, 11, 1, 3, CAST(N'2021-06-02T19:29:15.087' AS DateTime), CAST(N'2021-06-02T19:29:25.123' AS DateTime), N'Completed', 109, 109, N'Cash', NULL, CAST(N'2021-06-02T19:29:05.893' AS DateTime), CAST(N'2021-06-02T19:29:25.123' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (28, 21, 3, 10, 1, 9, CAST(N'2021-06-02T19:30:10.980' AS DateTime), CAST(N'2021-06-02T19:30:21.033' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-02T19:30:03.910' AS DateTime), CAST(N'2021-06-02T19:30:21.033' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (29, 21, 1, 11, 1, 3, CAST(N'2021-06-02T19:32:37.033' AS DateTime), CAST(N'2021-06-02T19:38:41.890' AS DateTime), N'Completed', 109, 109, N'Cash', NULL, CAST(N'2021-06-02T19:32:29.993' AS DateTime), CAST(N'2021-06-02T19:38:41.890' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30, 21, 2, 11, 1, 3, CAST(N'2021-06-02T19:38:57.667' AS DateTime), CAST(N'2021-06-02T19:39:07.720' AS DateTime), N'Completed', 109, 109, N'Cash', NULL, CAST(N'2021-06-02T19:32:30.517' AS DateTime), CAST(N'2021-06-02T19:39:07.720' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (31, 21, 3, 6, 1, 9, NULL, CAST(N'2021-06-02T19:39:23.157' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Rider', CAST(N'2021-06-02T19:38:50.613' AS DateTime), CAST(N'2021-06-02T19:39:23.157' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (10006, 21, 2, 6, 1, 3, CAST(N'2021-06-04T18:40:29.683' AS DateTime), CAST(N'2021-06-04T18:40:39.740' AS DateTime), N'Completed', 56.2, 56.2, N'Cash', NULL, CAST(N'2021-06-04T18:40:22.603' AS DateTime), CAST(N'2021-06-04T18:40:39.740' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (10007, 21, 3, 1, 6, 9, CAST(N'2021-06-04T19:38:54.947' AS DateTime), CAST(N'2021-06-04T19:39:04.980' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-04T19:38:48.390' AS DateTime), CAST(N'2021-06-04T19:39:04.980' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (10008, 21, 1, 10, 1, 3, CAST(N'2021-06-07T12:07:57.510' AS DateTime), CAST(N'2021-06-07T12:08:07.553' AS DateTime), N'Completed', 94.350000000000009, 94.350000000000009, N'Cash', NULL, CAST(N'2021-06-07T12:07:50.933' AS DateTime), CAST(N'2021-06-07T12:08:07.553' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (10009, 21, 3, 10, 1, 9, CAST(N'2021-06-07T12:31:26.617' AS DateTime), CAST(N'2021-06-07T12:31:52.037' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-07T12:31:20.027' AS DateTime), CAST(N'2021-06-07T12:31:52.037' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (20008, 21, 3, 10, 1, 9, CAST(N'2021-06-08T10:48:08.903' AS DateTime), CAST(N'2021-06-08T10:48:18.943' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-08T10:48:02.340' AS DateTime), CAST(N'2021-06-08T10:48:18.943' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (20009, 21, 3, 1, 6, 9, NULL, CAST(N'2021-06-08T10:49:44.470' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Rider', CAST(N'2021-06-08T10:49:38.760' AS DateTime), CAST(N'2021-06-08T10:49:44.470' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (20010, 21, 3, 10, 1, 9, CAST(N'2021-06-08T10:50:00.697' AS DateTime), CAST(N'2021-06-08T10:50:16.690' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-08T10:49:54.160' AS DateTime), CAST(N'2021-06-08T10:50:16.690' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30008, 21, 3, 1, 6, 9, CAST(N'2021-06-08T17:34:17.567' AS DateTime), CAST(N'2021-06-08T17:34:27.737' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-08T17:34:10.973' AS DateTime), CAST(N'2021-06-08T17:34:27.737' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30009, 21, 2, 10, 6, 3, NULL, CAST(N'2021-06-08T17:49:16.120' AS DateTime), N'Cancelled', 47, 47, N'Cash', N'Rider', CAST(N'2021-06-08T17:49:13.307' AS DateTime), CAST(N'2021-06-08T17:49:16.120' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30010, 21, 2, 6, 1, 3, CAST(N'2021-06-08T17:56:02.723' AS DateTime), CAST(N'2021-06-08T17:56:26.740' AS DateTime), N'Completed', 56.2, 56.2, N'Cash', NULL, CAST(N'2021-06-08T17:55:56.173' AS DateTime), CAST(N'2021-06-08T17:56:26.740' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30011, 21, 2, 6, 1, 3, CAST(N'2021-06-08T17:59:12.037' AS DateTime), CAST(N'2021-06-08T17:59:15.730' AS DateTime), N'Cancelled', 56.2, 56.2, N'Cash', N'Rider', CAST(N'2021-06-08T17:59:05.467' AS DateTime), CAST(N'2021-06-08T17:59:15.730' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30012, 21, 3, 10, 1, 9, NULL, CAST(N'2021-06-08T18:00:32.993' AS DateTime), N'Cancelled', 377.40000000000003, 377.40000000000003, N'Cash', N'Rider', CAST(N'2021-06-08T18:00:28.517' AS DateTime), CAST(N'2021-06-08T18:00:32.993' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30013, 21, 2, 6, 1, 3, CAST(N'2021-06-08T19:37:45.007' AS DateTime), CAST(N'2021-06-08T19:37:45.613' AS DateTime), N'Cancelled', 56.2, 56.2, N'Cash', N'Rider', CAST(N'2021-06-08T19:37:38.387' AS DateTime), CAST(N'2021-06-08T19:37:45.613' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30014, 21, 2, 10, 1, 3, CAST(N'2021-06-08T19:39:21.657' AS DateTime), CAST(N'2021-06-08T19:39:31.690' AS DateTime), N'Completed', 94.350000000000009, 94.350000000000009, N'Cash', NULL, CAST(N'2021-06-08T19:39:15.057' AS DateTime), CAST(N'2021-06-08T19:39:31.690' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (30015, 21, 2, 10, 1, 3, CAST(N'2021-06-08T19:40:05.430' AS DateTime), CAST(N'2021-06-08T19:40:15.497' AS DateTime), N'Completed', 94.350000000000009, 94.350000000000009, N'Cash', NULL, CAST(N'2021-06-08T19:39:58.853' AS DateTime), CAST(N'2021-06-08T19:40:15.497' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40008, 21, 3, 1, 6, 9, CAST(N'2021-06-11T14:22:39.100' AS DateTime), CAST(N'2021-06-11T14:22:49.143' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-11T14:22:32.923' AS DateTime), CAST(N'2021-06-11T14:22:49.143' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40009, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T14:24:33.463' AS DateTime), N'Cancelled', 377.40000000000003, 377.40000000000003, N'Cash', N'Rider', CAST(N'2021-06-11T14:24:28.630' AS DateTime), CAST(N'2021-06-11T14:24:33.463' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40010, 21, 3, 1, 10, 9, CAST(N'2021-06-11T14:28:01.193' AS DateTime), CAST(N'2021-06-11T14:29:14.117' AS DateTime), N'Completed', 377.40000000000003, 377.40000000000003, N'Cash', NULL, CAST(N'2021-06-11T14:27:55.203' AS DateTime), CAST(N'2021-06-11T14:29:14.117' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40011, 21, 3, 1, 10, 9, CAST(N'2021-06-11T14:29:53.327' AS DateTime), CAST(N'2021-06-11T14:29:57.627' AS DateTime), N'Cancelled', 377.40000000000003, 377.40000000000003, N'Cash', N'Rider', CAST(N'2021-06-11T14:29:46.590' AS DateTime), CAST(N'2021-06-11T14:29:57.627' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40012, 21, 3, 1, 6, 9, CAST(N'2021-06-11T14:30:33.437' AS DateTime), CAST(N'2021-06-11T14:30:34.903' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Rider', CAST(N'2021-06-11T14:30:26.860' AS DateTime), CAST(N'2021-06-11T14:30:34.903' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40013, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T16:10:30.127' AS DateTime), N'Cancelled', 377.40000000000003, 377.40000000000003, N'Cash', N'Rider', CAST(N'2021-06-11T16:09:54.913' AS DateTime), CAST(N'2021-06-11T16:10:30.127' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40014, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T17:20:00.393' AS DateTime), N'Cancelled', 377.40000000000003, 377.40000000000003, N'Cash', N'Rider', CAST(N'2021-06-11T16:36:19.897' AS DateTime), CAST(N'2021-06-11T17:20:00.393' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40015, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T18:03:48.087' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Driver', CAST(N'2021-06-11T17:20:25.823' AS DateTime), CAST(N'2021-06-11T18:03:48.087' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40016, 21, 3, 1, 6, 9, CAST(N'2021-06-11T18:05:07.880' AS DateTime), CAST(N'2021-06-11T18:07:14.303' AS DateTime), N'Completed', 224.8, 224.8, N'Cash', NULL, CAST(N'2021-06-11T18:04:11.533' AS DateTime), CAST(N'2021-06-11T18:07:14.303' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (40017, 21, 3, 1, 11, 9, CAST(N'2021-06-11T18:07:46.710' AS DateTime), CAST(N'2021-06-11T18:07:57.430' AS DateTime), N'Cancelled', 436, 436, N'Cash', N'Driver', CAST(N'2021-06-11T18:07:38.143' AS DateTime), CAST(N'2021-06-11T18:07:57.430' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50008, 21, 3, 1, 10, 9, CAST(N'2021-06-11T19:53:54.877' AS DateTime), CAST(N'2021-06-11T19:54:08.750' AS DateTime), N'Completed', 220, 220, N'Cash', NULL, CAST(N'2021-06-11T19:53:32.647' AS DateTime), CAST(N'2021-06-11T19:54:08.750' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50009, 21, 3, 1, 6, 9, NULL, CAST(N'2021-06-11T20:25:37.150' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Rider', CAST(N'2021-06-11T20:25:30.323' AS DateTime), CAST(N'2021-06-11T20:25:37.150' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50010, 21, 3, 1, 6, 9, NULL, CAST(N'2021-06-11T20:53:51.183' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Rider', CAST(N'2021-06-11T20:53:43.797' AS DateTime), CAST(N'2021-06-11T20:53:51.183' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50011, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T20:55:19.597' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Rider', CAST(N'2021-06-11T20:55:13.393' AS DateTime), CAST(N'2021-06-11T20:55:19.597' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50012, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T20:55:42.287' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Driver', CAST(N'2021-06-11T20:55:38.330' AS DateTime), CAST(N'2021-06-11T20:55:42.287' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50013, 21, 3, 6, 11, 9, CAST(N'2021-06-11T20:59:04.853' AS DateTime), CAST(N'2021-06-11T20:59:07.973' AS DateTime), N'Cancelled', 222.60000000000002, 222.60000000000002, N'Cash', N'Driver', CAST(N'2021-06-11T20:58:48.150' AS DateTime), CAST(N'2021-06-11T20:59:07.973' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50014, 21, 3, 1, 6, 9, CAST(N'2021-06-11T20:59:43.080' AS DateTime), CAST(N'2021-06-11T20:59:45.870' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Driver', CAST(N'2021-06-11T20:59:41.810' AS DateTime), CAST(N'2021-06-11T20:59:45.870' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50015, 21, 3, 1, 6, 9, NULL, CAST(N'2021-06-11T21:00:07.050' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Driver', CAST(N'2021-06-11T20:59:59.873' AS DateTime), CAST(N'2021-06-11T21:00:07.050' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50016, 21, 3, 6, 10, 9, CAST(N'2021-06-11T21:01:42.993' AS DateTime), CAST(N'2021-06-11T21:01:47.317' AS DateTime), N'Cancelled', 20.6, 20.6, N'Cash', N'Driver', CAST(N'2021-06-11T21:01:32.850' AS DateTime), CAST(N'2021-06-11T21:01:47.317' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50017, 21, 3, 1, 10, 9, CAST(N'2021-06-11T21:02:40.263' AS DateTime), CAST(N'2021-06-11T21:02:44.100' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Driver', CAST(N'2021-06-11T21:02:36.360' AS DateTime), CAST(N'2021-06-11T21:02:44.100' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50018, 21, 3, 1, 10, 9, CAST(N'2021-06-11T21:03:37.750' AS DateTime), CAST(N'2021-06-11T21:04:06.150' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Driver', CAST(N'2021-06-11T21:03:36.497' AS DateTime), CAST(N'2021-06-11T21:04:06.150' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50019, 21, 3, 1, 10, 9, CAST(N'2021-06-11T21:06:47.113' AS DateTime), CAST(N'2021-06-11T21:06:52.280' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Driver', CAST(N'2021-06-11T21:06:35.380' AS DateTime), CAST(N'2021-06-11T21:06:52.280' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50020, 21, 3, 6, 10, 9, NULL, CAST(N'2021-06-11T21:11:30.357' AS DateTime), N'Cancelled', 20.6, 20.6, N'Cash', N'Driver', CAST(N'2021-06-11T21:11:19.300' AS DateTime), CAST(N'2021-06-11T21:11:30.357' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50021, 21, 3, 1, 10, 9, NULL, CAST(N'2021-06-11T21:11:54.367' AS DateTime), N'Cancelled', 220, 220, N'Cash', N'Driver', CAST(N'2021-06-11T21:11:49.360' AS DateTime), CAST(N'2021-06-11T21:11:54.367' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50022, 21, 3, 1, 6, 9, CAST(N'2021-06-11T21:12:13.140' AS DateTime), CAST(N'2021-06-11T21:12:25.997' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Driver', CAST(N'2021-06-11T21:12:11.240' AS DateTime), CAST(N'2021-06-11T21:12:25.997' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50023, 21, 3, 6, 1, 9, CAST(N'2021-06-11T21:13:18.843' AS DateTime), CAST(N'2021-06-11T21:13:20.883' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Driver', CAST(N'2021-06-11T21:13:16.343' AS DateTime), CAST(N'2021-06-11T21:13:20.883' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50024, 21, 3, 1, 10, 9, CAST(N'2021-06-11T21:14:06.193' AS DateTime), CAST(N'2021-06-11T21:14:06.700' AS DateTime), N'Completed', 220, 220, N'Cash', NULL, CAST(N'2021-06-11T21:14:05.613' AS DateTime), CAST(N'2021-06-11T21:14:06.700' AS DateTime))
INSERT [dbo].[Trips] ([TripID], [RiderID], [DriverID], [SourceLocationID], [DestinationLocationID], [RideTypeID], [StartTime], [EndTime], [Status], [EstimatedFairAmount], [ActualFairAmount], [PaymentMethod], [CancelledBy], [CreatedAt], [ModifiedAt]) VALUES (50025, 21, 3, 1, 6, 9, CAST(N'2021-06-11T21:14:24.600' AS DateTime), CAST(N'2021-06-11T21:14:26.140' AS DateTime), N'Cancelled', 224.8, 224.8, N'Cash', N'Driver', CAST(N'2021-06-11T21:14:24.043' AS DateTime), CAST(N'2021-06-11T21:14:26.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[Trips] OFF
INSERT [Drivers].[ApplicableIncentives] ([DriverID], [IncentiveID], [IsDisabled], [CreatedAt], [ModifiedAt]) VALUES (1, 1, 0, CAST(N'2021-04-02T00:00:00.000' AS DateTime), NULL)
INSERT [Drivers].[DriverDetails] ([DriverID], [DrivingLicense], [AadharCard], [PanCard], [OtherDocument], [CurrentAddress], [PermenantAddress], [Country], [CreatedAt], [ModifiedAt]) VALUES (1, N'-', N'-', N'-', N'-', N'Ahmedabad', N'Rajkot', N'India', NULL, NULL)
SET IDENTITY_INSERT [Drivers].[Drivers] ON 

INSERT [Drivers].[Drivers] ([DriverID], [FirstName], [LastName], [Email], [EmailVerified], [ContactNumber], [TotalRidesDone], [TotalRidesCancelled], [Salary], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (1, N'John', N'K', N'johnk@gmail.com', 0, CAST(7990349033 AS Decimal(10, 0)), 5, 1, NULL, 0, 1, CAST(N'2021-04-01T15:04:34.907' AS DateTime), N'john', CAST(N'2021-04-01T12:04:34.907' AS DateTime), CAST(N'2021-04-01T12:05:38.677' AS DateTime), NULL)
INSERT [Drivers].[Drivers] ([DriverID], [FirstName], [LastName], [Email], [EmailVerified], [ContactNumber], [TotalRidesDone], [TotalRidesCancelled], [Salary], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (2, N'Milit22', N'Gajjar22', N'milit22@gmail.com', 0, CAST(7990349072 AS Decimal(10, 0)), 7, 3, NULL, 0, 0, NULL, N'Secret@123', CAST(N'2021-06-02T12:19:29.793' AS DateTime), NULL, N'c7c327af-380c-421b-8823-0af3074cf929')
INSERT [Drivers].[Drivers] ([DriverID], [FirstName], [LastName], [Email], [EmailVerified], [ContactNumber], [TotalRidesDone], [TotalRidesCancelled], [Salary], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (3, N'Milit222', N'Gajjar222', N'milit222@gmail.com', 0, CAST(7990349022 AS Decimal(10, 0)), 34, 27, NULL, 0, 0, NULL, N'Secret@123', CAST(N'2021-06-02T12:19:42.010' AS DateTime), NULL, N'e7be1c31-1230-4a66-b0ea-e2e772530988')
INSERT [Drivers].[Drivers] ([DriverID], [FirstName], [LastName], [Email], [EmailVerified], [ContactNumber], [TotalRidesDone], [TotalRidesCancelled], [Salary], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (10003, N'Milit221', N'Gajjar212', N'milit22112@gmail.com', 0, CAST(7990349012 AS Decimal(10, 0)), 0, 0, NULL, 0, 0, NULL, N'Secret@123', CAST(N'2021-06-10T11:42:07.903' AS DateTime), NULL, N'2bcfc487-db54-447d-91c7-94279aaff94c')
INSERT [Drivers].[Drivers] ([DriverID], [FirstName], [LastName], [Email], [EmailVerified], [ContactNumber], [TotalRidesDone], [TotalRidesCancelled], [Salary], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (10008, N'mp', N'mp', N'm3223@m.mp', 0, CAST(4545454567 AS Decimal(10, 0)), 0, 0, NULL, 0, 0, NULL, N'Secret@123', CAST(N'2021-06-11T19:17:16.667' AS DateTime), NULL, N'd5b8abe6-c60a-4c3f-aad7-60728c627538')
INSERT [Drivers].[Drivers] ([DriverID], [FirstName], [LastName], [Email], [EmailVerified], [ContactNumber], [TotalRidesDone], [TotalRidesCancelled], [Salary], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [Password], [CreatedAt], [ModifiedAt], [UserId]) VALUES (10009, N'rohan', N'seth', N'rohan@r.r', 0, CAST(1515546566 AS Decimal(10, 0)), 0, 0, NULL, 0, 0, NULL, N'Secret@123', CAST(N'2021-06-11T19:22:49.523' AS DateTime), NULL, N'f23afc03-2526-427c-82eb-004dabdf0b12')
SET IDENTITY_INSERT [Drivers].[Drivers] OFF
SET IDENTITY_INSERT [Drivers].[Incentives] ON 

INSERT [Drivers].[Incentives] ([IncentiveID], [Description], [StartDate], [EndDate], [CreatedAt], [ModifiedAt]) VALUES (1, N'10% extra reward on trips longer than 5 kms.', CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2021-04-16T00:00:00.000' AS DateTime), CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [Drivers].[Incentives] OFF
SET IDENTITY_INSERT [Drivers].[Ratings] ON 

INSERT [Drivers].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (1, 12, 1, 5, N'Nice Customer', NULL, 5, NULL, NULL)
SET IDENTITY_INSERT [Drivers].[Ratings] OFF
SET IDENTITY_INSERT [Drivers].[Vehicles] ON 

INSERT [Drivers].[Vehicles] ([VehicleID], [DriverID], [CurrentRideTypeID], [VehicleBrand], [VehicleName], [RegistrationNo], [VehicleDocument], [VehicleType], [CreatedAt], [ModifiedAt]) VALUES (1, 1, 3, N'Hyundai', N'i20', N'GJ-03 KM 0012', N'-', N'Hatchback', CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [Drivers].[Vehicles] ([VehicleID], [DriverID], [CurrentRideTypeID], [VehicleBrand], [VehicleName], [RegistrationNo], [VehicleDocument], [VehicleType], [CreatedAt], [ModifiedAt]) VALUES (2, 2, 3, N'Hyundai', N'i20', N'GJ-03 LM 4512', N'-', N'Hatchback', CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [Drivers].[Vehicles] ([VehicleID], [DriverID], [CurrentRideTypeID], [VehicleBrand], [VehicleName], [RegistrationNo], [VehicleDocument], [VehicleType], [CreatedAt], [ModifiedAt]) VALUES (3, 3, 9, N'Hyundai', N'Xcent', N'GJ-01 KK 2222', N'-', N'Sedan', CAST(N'2020-04-01T00:00:00.000' AS DateTime), NULL)
INSERT [Drivers].[Vehicles] ([VehicleID], [DriverID], [CurrentRideTypeID], [VehicleBrand], [VehicleName], [RegistrationNo], [VehicleDocument], [VehicleType], [CreatedAt], [ModifiedAt]) VALUES (10003, 10008, 8, N'Atul', N'Auto', N'GJ-03 KO 2121', N'-', N'Auto', NULL, NULL)
INSERT [Drivers].[Vehicles] ([VehicleID], [DriverID], [CurrentRideTypeID], [VehicleBrand], [VehicleName], [RegistrationNo], [VehicleDocument], [VehicleType], [CreatedAt], [ModifiedAt]) VALUES (10004, 10009, 9, N'Tata', N'Indica', N'GJ-01 JJ 1010', N'-', N'Sedan', NULL, NULL)
SET IDENTITY_INSERT [Drivers].[Vehicles] OFF
INSERT [Riders].[ApplicableOffers] ([RiderID], [OfferID], [IsDisabled], [CreatedAt], [ModifiedAt]) VALUES (12, 2, 0, NULL, NULL)
INSERT [Riders].[ApplicableOffers] ([RiderID], [OfferID], [IsDisabled], [CreatedAt], [ModifiedAt]) VALUES (12, 3, 0, NULL, NULL)
SET IDENTITY_INSERT [Riders].[Offers] ON 

INSERT [Riders].[Offers] ([OfferID], [OfferCode], [Description], [StartDate], [EndDate], [CreatedAt], [ModifiedAt]) VALUES (2, N'NEW100', N'Flat 100 rs. off o the first ride.', CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [Riders].[Offers] ([OfferID], [OfferCode], [Description], [StartDate], [EndDate], [CreatedAt], [ModifiedAt]) VALUES (3, N'ICICI10', N'10% Cashback by using ICICI Credit Card', CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Riders].[Offers] OFF
SET IDENTITY_INSERT [Riders].[Ratings] ON 

INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (1, 12, 1, 5, N'A nice ride', NULL, 4, CAST(N'2021-04-01T15:30:07.830' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (2, 21, 2, 17, N'Good Comfort.', N'', 4, CAST(N'2021-06-02T17:03:52.790' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (3, 21, 3, 22, N'', N'', 4, CAST(N'2021-06-02T17:05:27.930' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (4, 21, 3, 24, N'', N'', 4, CAST(N'2021-06-02T17:09:37.177' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (5, 21, 3, 25, N'', N'', 2, CAST(N'2021-06-02T19:08:18.973' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (6, 21, 1, 29, N'', N'', 4, CAST(N'2021-06-02T19:38:43.727' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (7, 21, 2, 30, N'', N'', 4, CAST(N'2021-06-02T19:39:10.257' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (10002, 21, 2, 10006, N'', N'', 4, CAST(N'2021-06-04T18:40:46.147' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (10003, 21, 3, 10007, N'', N'', 4, CAST(N'2021-06-04T19:39:09.350' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (10004, 21, 1, 10008, N'', N'', 4, CAST(N'2021-06-07T12:08:09.500' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (10005, 21, 3, 10009, N'', N'', 4, CAST(N'2021-06-07T12:32:02.247' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (20004, 21, 3, 20008, N'', N'', 3, CAST(N'2021-06-08T10:48:38.053' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (30004, 21, 3, 30008, N'', N'', 0, CAST(N'2021-06-08T17:34:32.947' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (30005, 21, 2, 30014, N'', N'', 0, CAST(N'2021-06-08T19:39:32.830' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (30006, 21, 2, 30015, N'', N'', 0, CAST(N'2021-06-08T19:40:16.753' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (40004, 21, 3, 40008, N'', N'', 0, CAST(N'2021-06-11T14:24:00.573' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (40005, 21, 3, 40016, N'', N'', 4, CAST(N'2021-06-11T18:07:22.320' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (40006, 21, 3, 40017, N'', N'', 3, CAST(N'2021-06-11T18:08:13.177' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50004, 21, 3, 50008, N'', N'', 0, CAST(N'2021-06-11T19:54:24.513' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50005, 21, 3, 50012, N'', N'', 4, CAST(N'2021-06-11T20:55:50.633' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50006, 21, 3, 50013, N'', N'', 3, CAST(N'2021-06-11T20:59:15.100' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50007, 21, 3, 50015, N'', N'', 0, CAST(N'2021-06-11T21:00:10.770' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50008, 21, 3, 50016, N'', N'', 4, CAST(N'2021-06-11T21:01:54.087' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50009, 21, 3, 50017, N'', N'', 4, CAST(N'2021-06-11T21:02:51.163' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50010, 21, 3, 50018, N'', N'', 0, CAST(N'2021-06-11T21:04:36.793' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50011, 21, 3, 50019, N'', N'', 4, CAST(N'2021-06-11T21:06:55.297' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50012, 21, 3, 50021, N'', N'', 0, CAST(N'2021-06-11T21:12:00.050' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50013, 21, 3, 50022, N'', N'', 4, CAST(N'2021-06-11T21:12:30.383' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50014, 21, 3, 50023, N'', N'', 3, CAST(N'2021-06-11T21:13:26.243' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50015, 21, 3, 50024, N'', N'', 4, CAST(N'2021-06-11T21:14:10.977' AS DateTime), NULL)
INSERT [Riders].[Ratings] ([RatingID], [RiderID], [DriverID], [TripID], [Comments], [MediaAttached], [Rating], [CreatedAt], [ModifiedAt]) VALUES (50016, 21, 3, 50025, N'', N'', 4, CAST(N'2021-06-11T21:14:29.483' AS DateTime), NULL)
SET IDENTITY_INSERT [Riders].[Ratings] OFF
SET IDENTITY_INSERT [Riders].[Riders] ON 

INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (12, N'John', N'Abraham', N'john@gmail.com', 0, 1, CAST(7878787878 AS Decimal(10, 0)), N'secret123', CAST(N'2021-04-01T14:25:14.750' AS DateTime), NULL, N'johnab12', N'India', 0, 0, NULL, NULL)
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (15, N'Anil', N'Khan', N'anil@gmail.com', 0, 1, CAST(4848484848 AS Decimal(10, 0)), N'mmmmm', NULL, NULL, N'anilk123', N'India', 0, 1, NULL, NULL)
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (19, N'MEHUL', N'kapoor', N'meh@gmail.com', 1, 0, CAST(4828484848 AS Decimal(10, 0)), N'jjjjjj12', NULL, NULL, N'mehul123', N'India', 0, 0, NULL, NULL)
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (20, N'SANDIP', N'S', N'SANDIP@gmail.com', 0, 1, CAST(7777777777 AS Decimal(10, 0)), N'SANDIP', NULL, NULL, N'SANDIP123', N'India', 1, 0, NULL, NULL)
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (21, N'Milit12', N'Panchasara', N'milit6116@gmail.com', 0, 1, CAST(7990349033 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-05-31T20:39:08.900' AS DateTime), CAST(N'2021-06-11T12:56:06.883' AS DateTime), N'7990349033', NULL, 0, 0, NULL, N'e6009fd7-379b-4c1a-a2ec-4b173b91fd4f')
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (22, N'Milit', N'Gajjar', N'milit1@gmail.com', 0, 1, CAST(7990349032 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-06-01T15:12:11.657' AS DateTime), NULL, N'7990349032', NULL, 0, 0, NULL, N'd85e14c3-c769-4a51-a6a0-7ce4199fa5d8')
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (10022, N'm', N'p', N'm@M.mm', 0, 1, CAST(2121212121 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-06-03T16:46:46.597' AS DateTime), NULL, N'2121212121', NULL, 0, 0, NULL, N'b59fbc25-f184-4c9c-a2a3-71aa5955750d')
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (10023, N'm', N'p', N'm2@m.m', 0, 1, CAST(8989898989 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-06-03T16:49:06.657' AS DateTime), NULL, N'8989898989', NULL, 0, 0, NULL, N'12d7ccb9-3c7d-4f0d-b1c5-c7f37f36d925')
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (10024, N'mm', N'pp', N'm3@m.m', 0, 1, CAST(9898989855 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-06-03T16:58:03.720' AS DateTime), NULL, N'9898989855', NULL, 0, 0, NULL, N'dc736b73-e0cd-4203-8250-3581d6e03efa')
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (20024, N'd', N'd', N'spsp6116@gmail.com', 0, 1, CAST(2323232323 AS Decimal(10, 0)), N'Secret@123', CAST(N'2021-06-04T14:21:36.567' AS DateTime), NULL, N'2323232323', NULL, 0, 0, NULL, N'473e37a9-61d2-4df7-b519-e9aa53677bf8')
INSERT [Riders].[Riders] ([RiderID], [FirstName], [LastName], [Email], [EmailVerified], [IsNew], [ContactNumber], [Password], [CreatedAt], [ModifiedAt], [InviteCode], [Country], [IsBlocked], [IsLoggedIn], [SessionExpiresIn], [UserId]) VALUES (20025, N'milit', N'p', N'201601166@daiict.ac.in', 0, 1, CAST(7878787812 AS Decimal(10, 0)), N'Secret@!123', CAST(N'2021-06-08T10:45:17.820' AS DateTime), NULL, N'7878787812', NULL, 0, 0, NULL, N'1c7697ea-54d6-4096-994c-755db7d323b5')
SET IDENTITY_INSERT [Riders].[Riders] OFF
INSERT [Riders].[SavedPaymentModes] ([RiderID], [PaymentMode], [CardNumber], [CardDate], [CardName], [CreatedAt], [ModifiedAt]) VALUES (12, N'CreditCard', CAST(1515151515151515 AS Decimal(16, 0)), CAST(N'2022-04-03T00:00:00.000' AS DateTime), N'XYZ', CAST(N'2021-04-01T00:00:00.000' AS DateTime), NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Admins_UserId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_Admins_UserId] ON [Admins].[Admins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 14-06-2021 12:54:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 14-06-2021 12:54:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uk_Locations_Coordinates]    Script Date: 14-06-2021 12:54:47 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [uk_Locations_Coordinates] UNIQUE NONCLUSTERED 
(
	[Longitude] ASC,
	[Latitude] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uk_Drivers_ContactNumber]    Script Date: 14-06-2021 12:54:47 ******/
ALTER TABLE [Drivers].[Drivers] ADD  CONSTRAINT [uk_Drivers_ContactNumber] UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Drivers_UserId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_Drivers_UserId] ON [Drivers].[Drivers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uk_Riders_ContactNumber]    Script Date: 14-06-2021 12:54:47 ******/
ALTER TABLE [Riders].[Riders] ADD  CONSTRAINT [uk_Riders_ContactNumber] UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uk_Riders_InviteCode]    Script Date: 14-06-2021 12:54:47 ******/
ALTER TABLE [Riders].[Riders] ADD  CONSTRAINT [uk_Riders_InviteCode] UNIQUE NONCLUSTERED 
(
	[InviteCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Riders_UserId]    Script Date: 14-06-2021 12:54:47 ******/
CREATE NONCLUSTERED INDEX [IX_Riders_UserId] ON [Riders].[Riders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Drivers].[Drivers] ADD  DEFAULT ((0)) FOR [EmailVerified]
GO
ALTER TABLE [Drivers].[Drivers] ADD  DEFAULT ((0)) FOR [TotalRidesDone]
GO
ALTER TABLE [Drivers].[Drivers] ADD  DEFAULT ((0)) FOR [TotalRidesCancelled]
GO
ALTER TABLE [Drivers].[Drivers] ADD  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [Drivers].[Drivers] ADD  DEFAULT ((0)) FOR [IsLoggedIn]
GO
ALTER TABLE [Riders].[Riders] ADD  DEFAULT ((0)) FOR [EmailVerified]
GO
ALTER TABLE [Riders].[Riders] ADD  DEFAULT ((1)) FOR [IsNew]
GO
ALTER TABLE [Riders].[Riders] ADD  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [Riders].[Riders] ADD  DEFAULT ((0)) FOR [IsLoggedIn]
GO
ALTER TABLE [Admins].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [Admins].[Admins] CHECK CONSTRAINT [FK_Admins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [fk_Trips_DestinationLocationID] FOREIGN KEY([DestinationLocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [fk_Trips_DestinationLocationID]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [fk_Trips_DriverID] FOREIGN KEY([DriverID])
REFERENCES [Drivers].[Drivers] ([DriverID])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [fk_Trips_DriverID]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [fk_Trips_RiderID] FOREIGN KEY([RiderID])
REFERENCES [Riders].[Riders] ([RiderID])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [fk_Trips_RiderID]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [fk_Trips_RideTypeID] FOREIGN KEY([RideTypeID])
REFERENCES [dbo].[RideTypes] ([RideTypeID])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [fk_Trips_RideTypeID]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [fk_Trips_SourceLocationID] FOREIGN KEY([SourceLocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [fk_Trips_SourceLocationID]
GO
ALTER TABLE [Drivers].[ApplicableIncentives]  WITH CHECK ADD  CONSTRAINT [fk_ApplicableIncentives_DriverID] FOREIGN KEY([DriverID])
REFERENCES [Drivers].[Drivers] ([DriverID])
GO
ALTER TABLE [Drivers].[ApplicableIncentives] CHECK CONSTRAINT [fk_ApplicableIncentives_DriverID]
GO
ALTER TABLE [Drivers].[ApplicableIncentives]  WITH CHECK ADD  CONSTRAINT [fk_ApplicableIncentives_IncentiveID] FOREIGN KEY([IncentiveID])
REFERENCES [Drivers].[Incentives] ([IncentiveID])
GO
ALTER TABLE [Drivers].[ApplicableIncentives] CHECK CONSTRAINT [fk_ApplicableIncentives_IncentiveID]
GO
ALTER TABLE [Drivers].[DriverDetails]  WITH CHECK ADD  CONSTRAINT [fk_DriverDetails_DriverID] FOREIGN KEY([DriverID])
REFERENCES [Drivers].[Drivers] ([DriverID])
GO
ALTER TABLE [Drivers].[DriverDetails] CHECK CONSTRAINT [fk_DriverDetails_DriverID]
GO
ALTER TABLE [Drivers].[Drivers]  WITH CHECK ADD  CONSTRAINT [FK_Drivers_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [Drivers].[Drivers] CHECK CONSTRAINT [FK_Drivers_AspNetUsers_UserId]
GO
ALTER TABLE [Drivers].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_DriverID] FOREIGN KEY([DriverID])
REFERENCES [Drivers].[Drivers] ([DriverID])
GO
ALTER TABLE [Drivers].[Ratings] CHECK CONSTRAINT [fk_Ratings_DriverID]
GO
ALTER TABLE [Drivers].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_RiderID] FOREIGN KEY([RiderID])
REFERENCES [Riders].[Riders] ([RiderID])
GO
ALTER TABLE [Drivers].[Ratings] CHECK CONSTRAINT [fk_Ratings_RiderID]
GO
ALTER TABLE [Drivers].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_TripID] FOREIGN KEY([TripID])
REFERENCES [dbo].[Trips] ([TripID])
GO
ALTER TABLE [Drivers].[Ratings] CHECK CONSTRAINT [fk_Ratings_TripID]
GO
ALTER TABLE [Drivers].[Vehicles]  WITH CHECK ADD  CONSTRAINT [fk_Vehicles_CurrentRideTypeID] FOREIGN KEY([CurrentRideTypeID])
REFERENCES [dbo].[RideTypes] ([RideTypeID])
GO
ALTER TABLE [Drivers].[Vehicles] CHECK CONSTRAINT [fk_Vehicles_CurrentRideTypeID]
GO
ALTER TABLE [Drivers].[Vehicles]  WITH CHECK ADD  CONSTRAINT [fk_Vehicles_DriverID] FOREIGN KEY([DriverID])
REFERENCES [Drivers].[Drivers] ([DriverID])
GO
ALTER TABLE [Drivers].[Vehicles] CHECK CONSTRAINT [fk_Vehicles_DriverID]
GO
ALTER TABLE [Riders].[ApplicableOffers]  WITH CHECK ADD  CONSTRAINT [fk_ApplicableOffers_OfferID] FOREIGN KEY([OfferID])
REFERENCES [Riders].[Offers] ([OfferID])
GO
ALTER TABLE [Riders].[ApplicableOffers] CHECK CONSTRAINT [fk_ApplicableOffers_OfferID]
GO
ALTER TABLE [Riders].[ApplicableOffers]  WITH CHECK ADD  CONSTRAINT [fk_ApplicableOffers_RiderID] FOREIGN KEY([RiderID])
REFERENCES [Riders].[Riders] ([RiderID])
GO
ALTER TABLE [Riders].[ApplicableOffers] CHECK CONSTRAINT [fk_ApplicableOffers_RiderID]
GO
ALTER TABLE [Riders].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_DriverID] FOREIGN KEY([DriverID])
REFERENCES [Drivers].[Drivers] ([DriverID])
GO
ALTER TABLE [Riders].[Ratings] CHECK CONSTRAINT [fk_Ratings_DriverID]
GO
ALTER TABLE [Riders].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_RiderID] FOREIGN KEY([RiderID])
REFERENCES [Riders].[Riders] ([RiderID])
GO
ALTER TABLE [Riders].[Ratings] CHECK CONSTRAINT [fk_Ratings_RiderID]
GO
ALTER TABLE [Riders].[Ratings]  WITH CHECK ADD  CONSTRAINT [fk_Ratings_TripID] FOREIGN KEY([TripID])
REFERENCES [dbo].[Trips] ([TripID])
GO
ALTER TABLE [Riders].[Ratings] CHECK CONSTRAINT [fk_Ratings_TripID]
GO
ALTER TABLE [Riders].[Riders]  WITH CHECK ADD  CONSTRAINT [FK_Riders_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [Riders].[Riders] CHECK CONSTRAINT [FK_Riders_AspNetUsers_UserId]
GO
ALTER TABLE [Riders].[SavedPaymentModes]  WITH CHECK ADD  CONSTRAINT [fk_SavedPaymentModes_RiderID] FOREIGN KEY([RiderID])
REFERENCES [Riders].[Riders] ([RiderID])
GO
ALTER TABLE [Riders].[SavedPaymentModes] CHECK CONSTRAINT [fk_SavedPaymentModes_RiderID]
GO
/****** Object:  StoredProcedure [Admins].[usp_BlockUnblockUser]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Admins.usp_BlockUnblockUser --
CREATE   PROCEDURE [Admins].[usp_BlockUnblockUser]
	@Action varchar(20),
	@UserType varchar(10),
	@UserID bigint
AS
SET NOCOUNT ON;
BEGIN TRY
	IF @Action = 'BLOCK'
	BEGIN
		IF(  @UserType = 'RIDER')
		BEGIN
			UPDATE Riders.vRiders SET IsBlocked = 1 WHERE RiderID = @UserID
		END
		ELSE IF @UserType = 'DRIVER'
		BEGIN
			UPDATE Drivers.vDrivers SET IsBlocked = 1 WHERE DriverID = @UserID
		END
		SELECT 1 AS Response, 'Success' AS Message
		RETURN
	END

	IF @Action = 'UNBLOCK'
	BEGIN
		IF(  @UserType = 'RIDER')
		BEGIN
			UPDATE Riders.vRiders SET IsBlocked = 0 WHERE RiderID = @UserID
		END
		ELSE IF @UserType = 'DRIVER'
		BEGIN
			UPDATE Drivers.vDrivers SET IsBlocked = 0 WHERE DriverID = @UserID
		END
		SELECT 1 AS Response, 'Success' AS Message
		RETURN
	END
END TRY
BEGIN CATCH
	SELECT 0 AS Response, ERROR_MESSAGE() AS Message
END CATCH
	SET NOCOUNT OFF;
GO
/****** Object:  StoredProcedure [Admins].[usp_GetAllUsersData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- Admins.usp_GetAllUsersData --
CREATE   PROCEDURE [Admins].[usp_GetAllUsersData]
	@UserType varchar(10)
AS
	SET NOCOUNT ON;
	IF @UserType = 'RIDER'
	BEGIN
		SELECT 
			RiderID,
			FirstName,
			LastName,
			Email,
			EmailVerified,
			IsNew,
			ContactNumber,
			Country,
			InviteCode,
			IsBlocked,
			CreatedAt
		FROM Riders.vRiders;
	END
	ELSE IF @UserType = 'DRIVER'
	BEGIN
		SELECT 
			DriverID,
			FirstName,
			LastName,
			Email,
			EmailVerified,
			ContactNumber,
			TotalRidesDone,
			TotalRidesCancelled,
			IsBlocked,
			CreatedAt
		FROM Drivers.vDrivers;
	END
	
	SET NOCOUNT OFF;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteRideTypesData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_DeleteRideTypesData --
CREATE   PROCEDURE [dbo].[usp_DeleteRideTypesData]
	@ridetype_id bigint
AS
BEGIN TRY
	IF @ridetype_id IS NULL
	BEGIN
		SELECT 0 AS Response, 'RideTypeID cannot be NULL' AS Message
		RETURN
	END
	DELETE FROM RideTypes WHERE RideTypeID = @ridetype_id;
	SELECT 1 AS Response, 'Success' AS Message
END TRY
BEGIN CATCH
	SELECT 0 AS Response, ERROR_MESSAGE() AS Message
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_GetLocationData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_GetLocationData --
CREATE   PROCEDURE [dbo].[usp_GetLocationData]
	@location_id bigint
AS
	SELECT LocationID, LocationName, Longitude, Latitude, CreatedAt, ModifiedAt FROM Locations WHERE LocationID = @location_id;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRideTypesData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_GetRideTypesData --
CREATE   PROCEDURE [dbo].[usp_GetRideTypesData]
AS
	SELECT RideTypeID, RideName, PricePerKm, SeatingCapacity, CreatedAt, ModifiedAt FROM RideTypes;
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveLocationData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_SaveLocationData --
CREATE   PROCEDURE [dbo].[usp_SaveLocationData]
	@location_name varchar(50),
	@longitude float,
	@latitude float
AS
BEGIN TRY
	INSERT INTO Locations (LocationName, Latitude, Longitude, CreatedAt)
	VALUES (@location_name, @latitude, @longitude, GETDATE())
	SELECT 1 AS Response, 'Success' AS Message
END TRY
BEGIN CATCH
	SELECT 0 AS Response, ERROR_MESSAGE() AS Message
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveNewTripData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_SaveNewTripData --
CREATE   PROCEDURE [dbo].[usp_SaveNewTripData]
	@RiderID bigint,
	@DriverID bigint,
	@SourceLocationID bigint,
	@DestinationLocationID bigint,
	@RideTypeID bigint,
	@Status varchar(20),
	@EstimatedFairAmount float
AS
BEGIN TRY
	INSERT INTO Trips 
	(RiderID, 
	DriverID, 
	SourceLocationID, 
	DestinationLocationID,
	RideTypeID,
	Status,
	EstimatedFairAmount,
	CreatedAt, 
	ModifiedAt) 
	VALUES 
	(@RiderID,
	@DriverID,
	@SourceLocationID,
	@DestinationLocationID,
	@RideTypeID, 
	@Status, 
	@EstimatedFairAmount,
	GETDATE(),
	NULL);
	SELECT 1 AS Response, 'Success' AS Message

END TRY
BEGIN CATCH
	SELECT 0 AS Response, ERROR_MESSAGE() AS Message
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveRideTypesData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_SaveRideTypesData --
CREATE   PROCEDURE [dbo].[usp_SaveRideTypesData]
	@action varchar(10),
	@ridetype_id bigint = NULL,
	@ride_name varchar(50) = NULL,
	@price float = NULL,
	@seating_capacity int = NULL
AS
	BEGIN TRY
	IF @action = 'INSERT'
	BEGIN
		IF @ride_name IS NULL OR @price IS NULL OR @seating_capacity IS NULL
		BEGIN
		SELECT 0 AS Response, 'RideName, PricePerKm, SeatingCapacity cannot be NULL' AS Message
		RETURN
		END

		IF EXISTS (SELECT RideName FROM RideTypes WHERE RideName = @ride_name)
		BEGIN
		SELECT 0 AS Response, 'RideName already exists' AS Message
		RETURN
		END

		INSERT INTO RideTypes 
		(RideName, PricePerKm, SeatingCapacity, CreatedAt, ModifiedAt) 
		VALUES 
		(@ride_name, @price, @seating_capacity, GETDATE(), NULL);
		SELECT 1 AS Response, 'Success' AS Message
	END

	IF @action = 'UPDATE'
	BEGIN
		IF @ridetype_id IS NULL OR @ride_name IS NULL OR @price IS NULL OR @seating_capacity IS NULL
		BEGIN
		SELECT 0 AS Response, 'RideTypeID, RideName, PricePerKm, SeatingCapacity cannot be NULL' AS Message
		RETURN
		END

		UPDATE RideTypes SET 
		RideName = @ride_name,
		PricePerKm = @price,
		SeatingCapacity = @seating_capacity,
		ModifiedAt = GETDATE()
		WHERE RideTypeID = @ridetype_id;
		SELECT 1 AS Response, 'Success' AS Message
	END	

	END TRY
	BEGIN CATCH
		SELECT 0 AS Response, ERROR_MESSAGE() AS Message
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTripData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- usp_UpdateTripData --
CREATE   PROCEDURE [dbo].[usp_UpdateTripData]
	@Action varchar(20),
	@TripID bigint,
	@ActualFairAmount float = NULL,
	@PaymentMethod varchar(50) = NULL,
	@CancelledBy varchar(20) = NULL
AS

BEGIN TRY

	IF @Action = 'TripCancelled'
	BEGIN
		UPDATE Trips SET 
		EndTime = GETDATE(),
		Status = 'Cancelled',
		ActualFairAmount = @ActualFairAmount,
		PaymentMethod = @PaymentMethod,
		CancelledBy = @CancelledBy,
		ModifiedAt = GETDATE()
		WHERE TripID = @TripID;
		SELECT 1 AS Response, 'Success' AS Message

		UPDATE Drivers.Drivers
		SET TotalRidesCancelled = TotalRidesCancelled + 1 
		WHERE DriverID = (SELECT DriverID FROM Trips WHERE TripID = @TripID)
			
	END

	IF @Action = 'TripCompleted'
	BEGIN
		UPDATE Trips SET 
		EndTime = GETDATE(),
		Status = 'Completed',
		ActualFairAmount = @ActualFairAmount,
		PaymentMethod = @PaymentMethod,
		CancelledBy = NULL,
		ModifiedAt = GETDATE()
		WHERE TripID = @TripID;
		SELECT 1 AS Response, 'Success' AS Message;

		UPDATE Drivers.Drivers
		SET TotalRidesDone = TotalRidesDone + 1 
		WHERE DriverID = (SELECT DriverID FROM Trips WHERE TripID = @TripID)
	END

	IF @Action = 'TripStarted'
	BEGIN
		UPDATE Trips SET 
		Status = 'Started',
		StartTime = GETDATE(),
		ModifiedAt = GETDATE()
		WHERE TripID = @TripID;
		SELECT 1 AS Response, 'Success' AS Message
	END

END TRY
BEGIN CATCH
	SELECT 0 AS Response, ERROR_MESSAGE() AS Message
END CATCH
GO
/****** Object:  StoredProcedure [Drivers].[usp_GetDriverData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Drivers.usp_GetDriverData --
CREATE   PROCEDURE [Drivers].[usp_GetDriverData]
	@driver_id bigint
AS
	SELECT DriverID, FirstName, LastName, Email, EmailVerified, ContactNumber, TotalRidesCancelled, TotalRidesDone, Salary, CreatedAt, ModifiedAt
	FROM Drivers.vDrivers WHERE DriverID = @driver_id
GO
/****** Object:  StoredProcedure [Drivers].[usp_SaveDriverData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Drivers.usp_SaveDriverData --
CREATE   PROCEDURE [Drivers].[usp_SaveDriverData]
	@action varchar(10),
	@driver_id bigint = NULL,
	@first_name varchar(50),
	@last_name varchar(50),
	@email varchar(50),
	@email_verified bit = 0,
	@contact_number decimal(10,0) = NULL,
	@password varchar(100) = NULL
AS
	BEGIN TRY
	IF @action = 'INSERT'
	BEGIN
		IF @contact_number IS NULL OR @password IS NULL
		BEGIN
			SELECT 0 AS 'Response', 'ContactNumber,Password cannot be NULL' AS Message
			RETURN
		END
		INSERT INTO Drivers.Drivers 
		(FirstName, LastName, Email, EmailVerified, ContactNumber, TotalRidesCancelled, TotalRidesDone, Salary, Password, IsBlocked, IsLoggedIn, SessionExpiresIn, CreatedAt, ModifiedAt) 
		VALUES 
		(@first_name, @last_name, @email, @email_verified, @contact_number, 0, 0, NULL, @password, 0, 1, DATEADD(HOUR,3,GETDATE()), GETDATE(), NULL);
		SELECT 1 AS Response, 'Success' AS Message
	END

	IF @action = 'UPDATE' AND @driver_id IS NOT NULL
	BEGIN
		UPDATE Drivers.vDrivers SET 
		FirstName = @first_name,
		LastName = @last_name,
		Email = @email,
		EmailVerified = @email_verified,
		ModifiedAt = GETDATE()
		WHERE DriverID = @driver_id;
		SELECT 1 AS Response, 'Success' AS Message
	END
	END TRY
	BEGIN CATCH
		SELECT 0 AS Response, ERROR_MESSAGE() AS Message
	END CATCH
GO
/****** Object:  StoredProcedure [Drivers].[usp_SaveVehicleData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Drivers.usp_SaveVehicleData --
CREATE   PROCEDURE [Drivers].[usp_SaveVehicleData]
	@driver_id bigint,
	@vehicle_name varchar(50),
	@vehicle_brand varchar(50),
	@reg_no varchar(50),
	@ride_type varchar(10),
	@vehicle_type varchar(20),
	@documents varchar(MAX)
AS
	BEGIN TRY

		INSERT INTO Drivers.Vehicles 
		(DriverID, 
		CurrentRideTypeID,
		VehicleBrand,
		VehicleName,
		VehicleType,
		RegistrationNo,
		VehicleDocument,
		CreatedAt,
		ModifiedAt) 
		VALUES 
		(@driver_id,
		(SELECT RideTypeID FROM RideTypes WHERE RideName = @ride_type), 
		@vehicle_brand,
		@vehicle_name, 
		@vehicle_type,
		@reg_no,
		@documents,
		GETDATE(), 
		NULL);
		SELECT 1 AS Response, 'Success' AS Message

	END TRY
	BEGIN CATCH
		SELECT 0 AS Response, ERROR_MESSAGE() AS Message
	END CATCH
GO
/****** Object:  StoredProcedure [Riders].[usp_GetCurrentTripData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Riders.usp_GetCurrentTripData --
CREATE   PROCEDURE [Riders].[usp_GetCurrentTripData]
	@RiderID bigint
AS
SET NOCOUNT OFF
	SELECT 
		DR.FirstName + ' ' + DR.LastName AS DriverName,
		S.LocationName AS Source,
		D.LocationName AS Destination,
		V.VehicleBrand,
		V.VehicleName,
		V.RegistrationNo,
		T.StartTime,
		T.EndTime,
		T.Status,
		T.EstimatedFairAmount

	FROM vCurrentTrips T 
	JOIN Locations S ON S.LocationID = T.SourceLocationID
	JOIN Locations D ON D.LocationID = T.DestinationLocationID
	JOIN Drivers.Drivers DR ON DR.DriverID = T.DriverID
	JOIN RideTypes RT ON RT.RideTypeID = T.RideTypeID
	JOIN Drivers.Vehicles V ON V.DriverID = DR.DriverID
	WHERE T.RiderID = @RiderID
SET NOCOUNT ON
GO
/****** Object:  StoredProcedure [Riders].[usp_GetRiderData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Riders.usp_GetRiderData --
CREATE   PROCEDURE [Riders].[usp_GetRiderData]
	@rider_id bigint
AS
	SELECT RiderID, FirstName, LastName, Email, EmailVerified, IsNew, ContactNumber, InviteCode, Country, CreatedAt, ModifiedAt
	FROM Riders.vRiders WHERE RiderID = @rider_id
GO
/****** Object:  StoredProcedure [Riders].[usp_GetTripsData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Riders.usp_GetTripsData --
CREATE   PROCEDURE [Riders].[usp_GetTripsData]
	@RiderID bigint
AS
	SET NOCOUNT ON;
	SELECT 
		DR.FirstName + ' ' + DR.LastName AS DriverName,
		S.LocationName AS Source,
		D.LocationName AS Destination,
		V.VehicleBrand,
		V.VehicleName,
		V.RegistrationNo,
		T.StartTime,
		T.EndTime,
		T.Status,
		T.EstimatedFairAmount,
		T.ActualFairAmount,
		T.PaymentMethod,
		T.CancelledBy

	FROM Trips T 
	JOIN Locations S ON S.LocationID = T.SourceLocationID
	JOIN Locations D ON D.LocationID = T.DestinationLocationID
	JOIN Drivers.Drivers DR ON DR.DriverID = T.DriverID
	JOIN RideTypes RT ON RT.RideTypeID = T.RideTypeID
	JOIN Drivers.Vehicles V ON V.DriverID = DR.DriverID
	WHERE T.RiderID = @RiderID
	SET NOCOUNT OFF;
GO
/****** Object:  StoredProcedure [Riders].[usp_SaveRatingData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Riders.usp_SaveRatingData --
CREATE   PROCEDURE [Riders].[usp_SaveRatingData]
	@RiderID bigint,
	@DriverID bigint,
	@TripID bigint,
	@Comments varchar(MAX) = NULL,
	@MediaAttached varchar(MAX) = NULL,
	@Rating float
AS
BEGIN TRY
	INSERT INTO Riders.Ratings 
	(RiderID, 
	DriverID, 
	TripID, 
	Comments,
	MediaAttached,
	Rating,
	CreatedAt, 
	ModifiedAt) 
	VALUES 
	(@RiderID,
	@DriverID,
	@TripID,
	@Comments,
	@MediaAttached, 
	@Rating, 
	GETDATE(),
	NULL);
	SELECT 1 AS Response, 'Success' AS Message

END TRY
BEGIN CATCH
	SELECT 0 AS Response, ERROR_MESSAGE() AS Message
END CATCH
GO
/****** Object:  StoredProcedure [Riders].[usp_SaveRiderData]    Script Date: 14-06-2021 12:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Riders.usp_SaveRiderData --
CREATE   PROCEDURE [Riders].[usp_SaveRiderData]
	@action varchar(10),
	@rider_id bigint = NULL,
	@first_name varchar(50),
	@last_name varchar(50),
	@email varchar(50),
	@email_verified bit = 0,
	@is_new bit = 1,
	@contact_number decimal(10,0) = NULL,
	@password varchar(100) = NULL,
	@invite_code varchar(50) = NULL,
	@country varchar(50)
AS
	BEGIN TRY
	IF @action = 'INSERT'
	BEGIN
		IF @contact_number IS NULL OR @password IS NULL OR @invite_code IS NULL
		BEGIN
			SELECT 0 AS 'Response', 'ContactNumber, Password, InviteCode cannot be NULL' AS Message
			RETURN
		END
		INSERT INTO Riders.Riders 
		(FirstName, LastName, Email, EmailVerified, IsNew, ContactNumber, Password, InviteCode, Country, IsBlocked, IsLoggedIn, SessionExpiresIn, CreatedAt, ModifiedAt) 
		VALUES 
		(@first_name, @last_name, @email, @email_verified, @is_new, @contact_number, @password, @invite_code, @country, 0, 1, DATEADD(HOUR,3,GETDATE()), GETDATE(), NULL);
		SELECT 1 AS Response, 'Success' AS Message
	END

	IF @action = 'UPDATE' AND @rider_id IS NOT NULL
	BEGIN
		UPDATE Riders.vRiders SET  -- uses view to update
		FirstName = @first_name,
		LastName = @last_name,
		Email = @email,
		EmailVerified = @email_verified,
		IsNew = @is_new,
		ModifiedAt = GETDATE()
		WHERE RiderID = @rider_id;
		SELECT 1 AS Response, 'Success' AS Message
	END
	END TRY
	BEGIN CATCH
		SELECT 0 AS Response, ERROR_MESSAGE() AS Message
	END CATCH
GO
USE [master]
GO
ALTER DATABASE [Uber] SET  READ_WRITE 
GO
