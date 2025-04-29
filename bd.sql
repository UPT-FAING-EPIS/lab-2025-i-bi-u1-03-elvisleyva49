SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- BuildVersion table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BuildVersion]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[BuildVersion](
        [SystemInformationID] [tinyint] IDENTITY(1,1) NOT NULL,
        [Database Version] [nvarchar](25) NOT NULL,
        [VersionDate] [datetime] NOT NULL,
        [ModifiedDate] [datetime] NOT NULL
    ) ON [PRIMARY]
END
GO

-- ErrorLog table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLog]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[ErrorLog](
        [ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
        [ErrorTime] [datetime] NOT NULL,
        [UserName] [sysname] NOT NULL,
        [ErrorNumber] [int] NOT NULL,
        [ErrorSeverity] [int] NULL,
        [ErrorState] [int] NULL,
        [ErrorProcedure] [nvarchar](126) NULL,
        [ErrorLine] [int] NULL,
        [ErrorMessage] [nvarchar](4000) NOT NULL,
        CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY CLUSTERED ([ErrorLogID] ASC)
    ) ON [PRIMARY]
END
GO

-- Address table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Address](
        [AddressID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [AddressLine1] [nvarchar](60) NOT NULL,
        [AddressLine2] [nvarchar](60) NULL,
        [City] [nvarchar](30) NOT NULL,
        [StateProvince] [nvarchar](50) NOT NULL,
        [CountryRegion] [nvarchar](50) NOT NULL,
        [PostalCode] [nvarchar](15) NOT NULL,
        [rowguid] [uniqueidentifier] ROWGUIDCOL NOT NULL,
        [ModifiedDate] [datetime] NOT NULL,
        CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED ([AddressID] ASC)
    ) ON [PRIMARY]
END
GO

-- Customer table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Customer](
        [CustomerID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [NameStyle] [bit] NOT NULL,
        [Title] [nvarchar](8) NULL,
        [FirstName] [nvarchar](50) NOT NULL,
        [MiddleName] [nvarchar](50) NULL,
        [LastName] [nvarchar](50) NOT NULL,
        [Suffix] [nvarchar](10) NULL,
        [CompanyName] [nvarchar](128) NULL,
        [SalesPerson] [nvarchar](256) NULL,
        [EmailAddress] [nvarchar](50) NULL,
        [Phone] [varchar](15) NULL,
        [PasswordHash] [varchar](128) NOT NULL,
        [PasswordSalt] [varchar](10) NOT NULL,
        [rowguid] [uniqueidentifier] ROWGUIDCOL NOT NULL,
        [ModifiedDate] [datetime] NOT NULL,
        CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
    ) ON [PRIMARY]
END
GO

-- Continue with other tables...

SET IDENTITY_INSERT [dbo].[BuildVersion] ON 
INSERT INTO [dbo].[BuildVersion] ([SystemInformationID], [Database Version], [VersionDate], [ModifiedDate]) 
VALUES (1, N'10.50.91013.00', CAST(N'2009-10-13T00:00:00.000' AS DateTime), CAST(N'2009-10-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BuildVersion] OFF
GO