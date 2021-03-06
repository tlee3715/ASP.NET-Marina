/***********************************************************************************************
*	CPRG-255 .NET Level 5 Inland Marina Final Assignment - Database Script                   *
*	September, 2008                                                                         *
*	To install: run the following from a command prompt  (in lab)                          *
*	sqlcmd -S .\sqlexpress -U sa -P p@ssw0rd -i InlandMarina.sql                        *
*       Running this script on your personal system: use -E instead of -U and -P and instance name is sqlexpress not coned               *
***********************************************************************************************/


/**************************************** PART 1 CREATE DATABASE ******************************/


USE [master]
GO

IF EXISTS(SELECT * FROM Sysdatabases WHERE NAME LIKE 'InlandMarina')
  DROP DATABASE InlandMarina
  GO

/****** Object:  Database [InlandMarina]    Script Date: 11/12/2007 08:39:11 ******/
CREATE DATABASE [InlandMarina]
GO

USE [InlandMarina]
Go


/****************************** CREATE LOCATION TABLE  ***************************************/

CREATE TABLE [dbo].[Location](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID]
))

GO


/******************************** CREATE DOCK TABLE  ****************************************/

CREATE TABLE [dbo].[Dock](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LocationId] [int] NOT NULL,
	[WaterService] [bit] NOT NULL,
	[ElectricalService] [bit] NOT NULL,
 CONSTRAINT [PK_Dock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO

ALTER TABLE [dbo].[Dock]  WITH CHECK ADD  CONSTRAINT [FK_DockLocation] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([ID])
GO
ALTER TABLE [dbo].[Dock] CHECK CONSTRAINT [FK_DockLocation]


/******************************** CREATE SLIP TABLE  ****************************************/

CREATE TABLE [dbo].[Slip](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[Width] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[DockID] [int] NOT NULL,
 CONSTRAINT [PK_Slip] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO
ALTER TABLE [dbo].[Slip]  WITH CHECK ADD  CONSTRAINT [FK_SlipDock] FOREIGN KEY([DockID])
REFERENCES [dbo].[Dock] ([ID])
GO
ALTER TABLE [dbo].[Slip] CHECK CONSTRAINT [FK_SlipDock]


/******************************** CREATE LeaseType TABLE  **********************************/

CREATE TABLE [dbo].[LeaseType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StandardRateAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_LeaseType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO


/******************************** CREATE CUSTOMER TABLE  ***********************************/

CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Phone] [varchar](14) NOT NULL,
	[City] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO


/******************************** CREATE BOAT TABLE  ***************************************/

CREATE TABLE [dbo].[Boat](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[RegistrationNumber] [varchar](20) NOT NULL,
	[Manufacturer] [varchar](50) NOT NULL,
	[ModelYear] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Boat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Boat]  WITH CHECK ADD  CONSTRAINT [FK_BoatCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Boat] CHECK CONSTRAINT [FK_BoatCustomer]


/******************************** CREATE AUTHORIZE TABLE  **********************************/

CREATE TABLE [dbo].[Authorize](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](14) NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Authorize] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Authorize]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizeCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Authorize] CHECK CONSTRAINT [FK_AuthorizeCustomer]


/******************************** CREATE LEASE TABLE  *************************************/

CREATE TABLE [dbo].[Lease](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[SlipID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LeaseTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Lease] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))

GO
ALTER TABLE [dbo].[Lease]  WITH CHECK ADD  CONSTRAINT [FK_LeaseCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Lease] CHECK CONSTRAINT [FK_LeaseCustomer]
GO
ALTER TABLE [dbo].[Lease]  WITH CHECK ADD  CONSTRAINT [FK_LeaseLeaseType] FOREIGN KEY([LeaseTypeID])
REFERENCES [dbo].[LeaseType] ([ID])
GO
ALTER TABLE [dbo].[Lease] CHECK CONSTRAINT [FK_LeaseLeaseType]
GO
ALTER TABLE [dbo].[Lease]  WITH CHECK ADD  CONSTRAINT [FK_LeaseSlip] FOREIGN KEY([SlipID])
REFERENCES [dbo].[Slip] ([ID])
GO
ALTER TABLE [dbo].[Lease] CHECK CONSTRAINT [FK_LeaseSlip]
GO


/**************************************** PART 2 INSERT DATA ******************************/

--INSERT INTO LOCATION

INSERT INTO Location([Name]) VALUES('Inland Lake')
INSERT INTO Location([Name]) VALUES('Sab Diego')
GO


--INSERT INTO DOCK

INSERT INTO Dock([Name], LocationId, WaterService, ElectricalService) VALUES('Dock A', 1, 1, 1)
INSERT INTO Dock([Name], LocationId, WaterService, ElectricalService) VALUES('Dock B', 1, 1, 0)
INSERT INTO Dock([Name], LocationId, WaterService, ElectricalService) VALUES('Dock C', 1, 0, 1)
GO


--INSERT INTO SLIP

-- Dock A slips

INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,1)
GO

-- Dock B slips

INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,16,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,18,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(8,20,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,26,2)
GO

-- Dock C slips

INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,22,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(10,24,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
INSERT INTO SLIP(Width, [Length], DockId) VALUES(12,28,3)
GO


--INSERT INTO LEASE TYPE

INSERT INTO LeaseType([Name], StandardRateAmount) VALUES('Daily', 25.50)
INSERT INTO LeaseType([Name], StandardRateAmount) VALUES('Weekly', 145.50)
INSERT INTO LeaseType([Name], StandardRateAmount) VALUES('Monthly', 500.00)
INSERT INTO LeaseType([Name], StandardRateAmount) VALUES('Yearly', 5000.00)
GO

-- INSERT CUSTOMER
INSERT INTO Customer(FirstName,LastName,Phone,City) VALUES('John','Doe','555-545-1212','Phoenix');
GO

-- INSERT CUSTOMER BOAT
INSERT INTO Boat(RegistrationNumber,Manufacturer,ModelYear,[Length],CustomerID)  
VALUES('AR8373-223-2','Yamaha',2005,18,1000)
GO

-- INSERT AUTHORIZE
INSERT INTO Authorize(UserName,Password,CustomerID) VALUES('jdoe','p@ssword',1000)
GO

-- INSERT LEASE
INSERT INTO Lease(StartDate,EndDate,SlipID,CustomerID,LeaseTypeID) VALUES('09-12-2007','09-12-2008',1030,1000,4)
GO

---EXECUTE TEST SQL STATEMENT

SELECT c.FirstName, c.LastName, b.Manufacturer, b.ModelYear, b.[Length], l.StartDate, lt.Name, s.ID, d.Name, loc.Name 
FROM   Customer c inner join Boat b on c.ID = b.CustomerID 
                  inner join Lease l on c.ID = l.CustomerID
                  inner join LeaseType lt on l.LeaseTypeID = lt.ID
                  inner join Slip s on l.SlipID = s.ID
                  inner join Dock d on s.DockID = d.ID
                  inner join Location loc on d.LocationID = loc.ID 
WHERE  loc.Name = 'Inland Lake'
GO


/**************************************** PART 3 CREATE CRUD Stored Procedures ******************************/


-- AUTHORIZE 

CREATE PROCEDURE prAuthorizeInsert 
	@UserName varchar(50),
	@Password varchar(14),
	@CustomerID int
AS
BEGIN
	INSERT INTO [dbo].[Authorize]
           ([UserName]
           ,[Password]
           ,[CustomerID])
        VALUES
           (@UserName
           ,@Password
           ,@CustomerID)
END
GO

CREATE PROCEDURE prAuthorizeUpdate 
	@AuthorizeID int,
	@UserName varchar(50),
	@Password varchar(14),
	@CustomerID int
AS
BEGIN
	UPDATE [dbo].[Authorize]
        SET    [UserName] = @UserName,
               [Password] = @Password,
	       [CustomerID] = @CustomerID
        WHERE  [ID] = @AuthorizeID
END
GO

CREATE PROCEDURE prAuthorizeDelete 
	@AuthorizeID int
AS
BEGIN
	DELETE FROM [dbo].[Authorize]
        WHERE  [ID] = @AuthorizeID
END
GO

CREATE PROCEDURE prAuthorizeGetByCustomer 
	@CustomerID int
AS
BEGIN
	SELECT [ID]
              ,[UserName]
              ,[Password]
              ,[CustomerID]
        FROM   [dbo].[Authorize]
	WHERE  [CustomerID] = @CustomerID
END
GO

--BOATS

CREATE PROCEDURE prBoatInsert 
	@RegistrationNumber varchar(20),
	@Manufacturer varchar(50),
	@ModelYear int,
	@Length int,
	@CustomerID int
AS
BEGIN
	INSERT INTO [dbo].[Boat]
           ([RegistrationNumber]
           ,[Manufacturer]
           ,[ModelYear]
           ,[Length]
           ,[CustomerID])
        VALUES
           (@RegistrationNumber
           ,@Manufacturer
           ,@ModelYear
           ,@Length
           ,@CustomerID)
END
GO

CREATE PROCEDURE prBoatUpdate 
	@BoatID int,
	@RegistrationNumber varchar(20),
	@Manufacturer varchar(50),
	@ModelYear int,
	@Length int,
	@CustomerID int
AS
BEGIN
	UPDATE [InlandMarina].[dbo].[Boat]
        SET    [RegistrationNumber] = @RegistrationNUmber
              ,[Manufacturer] = @Manufacturer
              ,[ModelYear] = @ModelYear
              ,[Length] = @Length
              ,[CustomerID] = @CustomerID
         WHERE [ID] = @BoatID
END
GO

CREATE PROCEDURE prBoatDelete 
	@BoatID int
AS
BEGIN
	    DELETE FROM [dbo].[Boat]    
        WHERE  [ID] = @BoatID
END
GO

CREATE PROCEDURE prBoatGetAllRecords 
AS
BEGIN
	SELECT [ID]
              ,[RegistrationNumber]
              ,[Manufacturer]
              ,[ModelYear]
              ,[Length]
              ,[CustomerID]
        FROM   [dbo].[Boat]
END
GO

CREATE PROCEDURE prBoatGetRecordsByCustomer
	@CustomerID int 
AS
BEGIN
	SELECT [ID]
              ,[RegistrationNumber]
              ,[Manufacturer]
              ,[ModelYear]
              ,[Length]
              ,[CustomerID]
        FROM   [dbo].[Boat]
	WHERE  [CustomerID] = @CustomerID
END
GO

-- CUSTOMERS

CREATE PROCEDURE prCustomerInsert
	@FirstName varchar(30),
	@LastName varchar(30),
	@Phone varchar(14),
	@City varchar(30) 
AS
BEGIN
	INSERT INTO [dbo].[Customer]
           ([FirstName]
           ,[LastName]
           ,[Phone]
           ,[City])
     VALUES
           (@FirstName
           ,@LastName
           ,@Phone
           ,@City)
END
GO

CREATE PROCEDURE prCustomerUpdate
	@CustomerID int,
	@FirstName varchar(30),
	@LastName varchar(30),
	@Phone varchar(14),
	@City varchar(30) 
AS
BEGIN
	UPDATE [InlandMarina].[dbo].[Customer]
        SET    [FirstName] = @FirstName
              ,[LastName] = @LastName
              ,[Phone] = @Phone
              ,[City] = @City
         WHERE [ID] = @CustomerID
END
GO

CREATE PROCEDURE prCustomerDelete
	@CustomerID int
AS
BEGIN
	DELETE FROM [dbo].[Customer]    
        WHERE  [ID] = @CustomerID
END
GO

CREATE PROCEDURE prCustomerGetAllRecords
AS
BEGIN
	SELECT [ID]
              ,[FirstName]
              ,[LastName]
              ,[Phone]
              ,[City]
        FROM   [dbo].[Customer]
END
GO

-- LOCATION

CREATE PROCEDURE prLocationGetAllRecords
AS
BEGIN
	SELECT [ID]
              ,[Name]
        FROM   [dbo].[Location]
END
GO

-- DOCK

CREATE PROCEDURE prDockGetAllRecords
AS
BEGIN
	SELECT [ID]
              ,[Name]
              ,[LocationId]
              ,[WaterService]
              ,[ElectricalService]
        FROM   [dbo].[Dock]
END
GO

-- SLIP

CREATE PROCEDURE prSlipGetAllRecords
AS
BEGIN
	SELECT [ID]
              ,[Width]
              ,[Length]
              ,[DockID]
        FROM   [dbo].[Slip]
END
GO

CREATE PROCEDURE prSlipGetAllRecordsByDock
	@DockID int
AS
BEGIN
	SELECT [ID]
              ,[Width]
              ,[Length]
              ,[DockID]
        FROM   [dbo].[Slip]
	WHERE  [DockID] = @DockID
END
GO


CREATE PROCEDURE prSlipGetAllAvailable
	@DockID int
AS
BEGIN
	SELECT   s.[ID]
		,s.[Width]
		,s.[Length]
                ,s.[DockID]
	FROM       [dbo].[Slip] s 
	INNER JOIN [dbo].[Dock] d ON  s.DockID = d.ID 
	INNER JOIN [dbo].[Location] loc ON d.LocationID = loc.ID 
	INNER JOIN [dbo].[Lease] lse ON s.ID = lse.SlipID 
	WHERE      GetDate() NOT BETWEEN lse.StartDate AND lse.EndDate
END
GO

-- LEASE

CREATE PROCEDURE prLeaseInsert
	@StartDate datetime,
        @EndDate datetime,
        @SlipID int,
        @CustomerID int,
        @LeaseTypeID int
AS
BEGIN
	 INSERT INTO [dbo].[Lease]
           ([StartDate]
           ,[EndDate]
           ,[SlipID]
           ,[CustomerID]
           ,[LeaseTypeID])
     VALUES
           (@StartDate
           ,@EndDate
           ,@SlipID
           ,@CustomerID
           ,@LeaseTypeID)
END
GO

CREATE PROCEDURE prLeaseGetRecordsByCustomer
        @CustomerID int
AS
BEGIN
	 SELECT [ID]
               ,[StartDate]
               ,[EndDate]
               ,[SlipID]
               ,[CustomerID]
               ,[LeaseTypeID]
     	 FROM   [dbo].[Lease]
	 WHERE  [CustomerID] = @CustomerID
END
GO

CREATE PROCEDURE [prLeaseGetActiveRecordsByCustomer]
        @CustomerID int
AS
BEGIN
	 SELECT [ID]
               ,[StartDate]
               ,[EndDate]
               ,[SlipID]
               ,[CustomerID]
               ,[LeaseTypeID]
         FROM   [dbo].[Lease]
	 WHERE  [CustomerID] = @CustomerID
	 AND    GetDate() BETWEEN [StartDate] AND [EndDate]
END
GO

CREATE PROCEDURE prLeaseGetActiveRecords	
AS
BEGIN
	 SELECT [ID]
               ,[StartDate]
               ,[EndDate]
               ,[SlipID]
               ,[CustomerID]
               ,[LeaseTypeID]
     	 FROM   [dbo].[Lease]
	 WHERE  GetDate() BETWEEN [StartDate] AND [EndDate]
END
GO


-- LEASE TYPES

CREATE PROCEDURE prLeaseTypeGetAllRecords	
AS
BEGIN
	 SELECT [ID]
               ,[Name]
               ,[StandardRateAmount]
         FROM   [dbo].[LeaseType]
END
GO



