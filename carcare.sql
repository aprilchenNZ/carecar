create database carecar;
use carecar
go


create table UserLogin
(
	LoginID bigint identity primary key,
	UserID bigint, /* foreign key Users.UserID */
	Login_Timestamp timestamp,
	Login_longitude Double,
	Login_latitude Double,
	Login_IP  varchar(256), /* notice: IPV6 */
	Counter	tinyint /*incorrect password login times*/
)

create index idxlogin on UserLogin(UserName,UserEmail,Password);


create table Users
(
	UserID bigint identity primary key,
	UserName nvarchar(50),
	UserEmail varchar(50),
	Password varchar(20), /* do not miss this field */
	Gender  char(1),
	UAddress nvarchar(100), /* User's home address??? */
	BirthYear int,
	BirthMonth int,
	BirthDay int,
	MobileNO varchar(15),
	TelNO    varchar(15) 
)

create table RepairShop
(
	ShopID bigint identity primary key,
	OwnerID bigint,  /* foreign key Users.UserID */
	ShopName nvarchar(100),
	ShopAddress nvarchar(100),
	Longitude Double,
	Latitude Double, /* Also need these two important GPS info */
	MobileNO varchar(15), /* Add this mobile phone field. */
	TelNO varchar(15),
	stars tinyint, /*how many stars this shops has 4.5/5*/
	discountinfo varchar(100),
	logofile varbinary(max) /*logo image file*/
)

create table comments
(
	CommentID bigint identity primary key,
	UserID bigint, /*anonymous user id generate automatically*/
	ShopID bigint foreign key references RepairShop(ShopID),
	stars tinyint,
	content nvarchar(500),
	photos varbinary(max)
)
