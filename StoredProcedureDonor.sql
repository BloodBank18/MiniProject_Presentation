use Training_19Sep18_Pune

 select * from  BloodDonerDetails

 alter procedure AddDonorDetails(
 @BloodDonerId varchar(50),
 @FirstName varchar(255),
 @LastName varchar(255),
 @Address varchar(255),
 @City varchar(255),
 @MobileNo bigint,
 @BloodGroup varchar(255)

 )
 AS 
 Begin
 insert into BloodDonerDetails(BloodDonerId,FirstName,LastName,Address,City,MobileNo,BloodGroup) 
 values(@BloodDonerId,@FirstName,@LastName,@Address,@City,@MobileNo,@BloodGroup)
 End


 alter proc EditDonor
(
 @BloodDonerId varchar(50),
 @FirstName varchar(255),
 @LastName varchar(255),
 @Address varchar(255),
 @City varchar(255),
 @MobileNo bigint,
 @BloodGroup varchar(255)
)
as
begin
	update BloodDonerDetails
	set FirstName = @FirstName,LastName=@LastName,Address=@Address,City=@City,
	MobileNo=@MobileNo,BloodGroup=@BloodGroup
	where BloodDonerId = @BloodDonerId
end
 

 alter proc DeleteDonor
(
@BloodDonerId  varchar(50)
)
as
begin
	delete from BloodDonerDetails
	where BloodDonerId = @BloodDonerId
end

alter proc SearchDonor
(
@BloodDonerId varchar(50)
)
as
begin
	select * from BloodDonerDetails
	where BloodDonerId = @BloodDonerId
end

create table BloodDonerDetails
(
BloodDonerId int primary key, 
FirstName varchar(255) not null, 
LastName varchar(255) not null, 
Address varchar(255) not null, 
City varchar(255) not null, 
MobileNo Bigint not null, 
BloodGroup int not null foreign key references BGCategory(BGId)
)


create table BGCategory
(
BGId int identity(1,1) primary key,
BG varchar(50) not null unique
)

insert into BGCategory
values ('A +ve'),('B +ve'),('AB +ve'),('O +ve'),('A -ve'),('B -ve'),('AB -ve'),('O -ve')

create proc GetBGCategories
as
begin
	select BGId,BG 
	from BGCategory
	order by BGId
end

create proc GetDoners
as
begin
	select * from BloodDonerDetails
end

create proc VerifyBloodDonorID
(
@BDID varchar(50)
)
as
begin
	select count(*) from BloodDonerDetails Where BloodDonerId=@BDID
end


create proc DonorID
as
begin
	select BloodDonerId 
	from BloodDonerDetails
end





