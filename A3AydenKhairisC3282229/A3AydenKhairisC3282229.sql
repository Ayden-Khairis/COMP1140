DROP TABLE Reservation
DROP TABLE Enrolment
DROP TABLE Loan
DROP TABLE ImmovableResource
DROP TABLE MovableResource
DROP TABLE Privilege
DROP TABLE CourseOffering
DROP TABLE StaffMember
DROP TABLE StudentMember
DROP TABLE Resource
DROP TABLE Location
DROP TABLE Category
DROP TABLE Acquisition
DROP TABLE Administrator
DROP TABLE Member

CREATE TABLE Member (
MemberID	Char(5)			PRIMARY KEY,
Name		Varchar(30),
Email		Varchar(30),
Address		Varchar(30),
City		Varchar(30),
State		Varchar(30),
Postcode	Char(4),
Status		Varchar(12),
PhoneNumber	Char(10),
Comments	Varchar(100),
)
go

CREATE TABLE Administrator (
AdminID		Char(10)		PRIMARY KEY,
Status		Varchar(15),
FundCode	Char(5),
VendorCode	Char(5),
Price		Varchar(7),
Notes		Varchar(50),
)
go

CREATE TABLE Acquisition (
AcquisitionID		Char(5)	PRIMARY KEY,
AquisitionRequest	Varchar(30),
ItemName			Varchar(30),
Make				Varchar(20),
Manufacturer		Varchar(20),
Model				Varchar(20),
Year				Char(4),
ItemDescription		Varchar(150),
ItemUrgency			Varchar(12)
)
go

CREATE TABLE Category (
CategoryCode	Char(5)		PRIMARY KEY,
Name			Varchar(30),
Description		Varchar(100),
TimeAllowed		Varchar(10)
)
go

CREATE TABLE Location (
LocationID		Char(5)		PRIMARY KEY,
Room			Char(3),
Building		Varchar(3),
Campus			Varchar(20)
)
go

CREATE TABLE Resource (
ResourceID		Char(5)		PRIMARY KEY,
CategoryCode	Char(5),
LocationID		Char(5),
Name			Varchar(30),
Description		Varchar(100),
Status			Varchar(30),
FOREIGN KEY (CategoryCode) REFERENCES Category(CategoryCode) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON UPDATE CASCADE ON DELETE NO ACTION,
)
go

CREATE TABLE StudentMember (
MemberID	Char(5)		PRIMARY KEY,
PenaltyPts	Int DEFAULT '12',
FOREIGN KEY (MemberID) REFERENCES Member(MemberID) ON UPDATE CASCADE ON DELETE NO ACTION,
)
go

CREATE TABLE StaffMember (
MemberID	Char(5)		PRIMARY KEY,
FOREIGN KEY (MemberID) REFERENCES Member(MemberID) ON UPDATE CASCADE ON DELETE NO ACTION,
)
go

CREATE TABLE CourseOffering (
OfferingID			Char(6)		PRIMARY KEY,
Name				Varchar(50),
SemesterOffered		Int,
YearOffered			Char(4),
StartDate			Varchar(20),
EndDate				Varchar(20),
)
go

CREATE TABLE Privilege (
PrivilegeID		Char(4)		PRIMARY KEY,
Name			Varchar(30),
Description		Varchar(50),
CategoryCode	Char(5),
MaxResources	Int,
FOREIGN KEY (CategoryCode) REFERENCES Category(CategoryCode) ON UPDATE CASCADE ON DELETE NO ACTION,
)
go

CREATE TABLE MovableResource (
ResourceID	Char(5)			PRIMARY KEY,
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID) ON UPDATE CASCADE ON DELETE NO ACTION,
)

CREATE TABLE ImmovableResource (
ResourceID	Char(5)			PRIMARY KEY,
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID) ON UPDATE CASCADE ON DELETE NO ACTION,
)
go

CREATE TABLE Loan (
MemberID		Char(5)		PRIMARY KEY,
ResourceID		Char(5),
DateLoaned		Varchar(12),
DateDue			Varchar(12),
TimeLoaned		Varchar(5),
TimeDue			Varchar(5),
FOREIGN KEY (MemberID) REFERENCES Member(MemberID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID) ON UPDATE CASCADE ON DELETE NO ACTION,
)
go

CREATE TABLE Enrolment (
OfferingID	Char(6)			PRIMARY KEY,
MemberID	Char(5),
Foreign key  (OfferingID) REFERENCES CourseOffering ON UPDATE CASCADE ON DELETE NO ACTION,
Foreign key  (MemberID) REFERENCES StudentMember ON UPDATE CASCADE ON DELETE NO ACTION );
go

CREATE TABLE Reservation (
ReservationID	Char(5)		PRIMARY KEY,
MemberID		Char(5),
ResourceID		Char(5),
DateRequired	Varchar(12),
DateDue			Varchar(12),  
FOREIGN KEY (ResourceID) REFERENCES Resource(ResourceID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (MemberID) REFERENCES Member(MemberID) ON UPDATE CASCADE ON DELETE CASCADE
)
go

INSERT INTO Member VALUES ('M0001', 'Ayden Khairis', 'M0001@uon.edu.au', '2 Gannet Close', 'Berkeley Vale', 'NSW', '2261', 'Active', '0423505584', NULL );
INSERT INTO Member VALUES ('M0002', 'Ahmed Ab', 'M0002@uon.edu.au', '43 Hinkler Street', 'Maroubra', 'NSW', '2035', 'Active', '0447054131', NULL );
INSERT INTO Member VALUES ('M0003', 'Faraz Zarni', 'M0003@uon.edu.au', '2 Wirigi Street', 'Berkeley Vale', 'NSW', '2261', 'Active', '0243884294', NULL );
INSERT INTO Member VALUES ('M1000', 'Lachlan McGuire', 'M1000@uon.edu.au', '42 Hillside Drive', 'Berkeley Vale', 'NSW', '2261', 'Active', '0293456639', NULL );
INSERT INTO Member VALUES ('M2000', 'Grace Rainey', 'M2000@uon.edu.au', '63 Gavenlock Road', 'Gosford', 'NSW', '2260', 'Active', '0459878955', NULL );
INSERT INTO Member VALUES ('M3000', 'Adam Northover', 'M3000@uon.edu.au', '114 Cygnet Drive', 'Berkeley Vale', 'NSW', '2261', 'Active', '0419875634', NULL );

INSERT INTO Administrator VALUES ('A000000001', 'Active', 'F0001', 'V0001', '100.00', NULL );
INSERT INTO Administrator VALUES ('A000000002', 'Active', 'F0002', 'V0002', '200.00', NULL );
INSERT INTO Administrator VALUES ('A000000003', 'Active', 'F0003', 'V0003', '300.00', NULL );

INSERT INTO Acquisition VALUES ('A0001', 'Camera', 'Canon G66', 'Canon', 'Canon INC', 'DMC200G', '2016', 'G-Series Camera is good for video recording and specialises in dark mode photography.', 'Not Urgent' );
INSERT INTO Acquisition VALUES ('A0002', 'Speaker', 'Sony 2.0 Soundbar', 'Sony', 'SMC', 'HTS100F', '2018', 'The Sony 2.0 Channel Soundbar with Built-in Subwoofer lets you enjoy listening to your favourite music with full-bodied, surround sound.', 'Not Urgent' );
INSERT INTO Acquisition VALUES ('A0003', 'Microphone', 'Blue Yeti Blackout', 'Blue Yeti', 'Blue', 'Yeti Blackout', '2017', 'Yeti microphones produce pristine, studio-quality recordings with legendary ease.', 'Not Urgent' );

INSERT INTO Category VALUES ('C0001', 'PCamera', 'Cameras good for photography', '2 weeks' );
INSERT INTO Category VALUES ('C0002', 'VCamera', 'Cameras good for videography', '2 weeks' );
INSERT INTO Category VALUES ('C0003', 'Speaker', 'Collection of all speakers', '1 week' );
INSERT INTO Category VALUES ('C1000', 'Rooms', 'Rooms for students and staff to use', '2 hours' );

INSERT INTO Location VALUES ('L0001', '001', 'CT', 'Callaghan' );
INSERT INTO Location VALUES ('L0002', '002', 'CT', 'Callaghan' );
INSERT INTO Location VALUES ('L0003', '003', 'CT', 'Callaghan' );

INSERT INTO Resource VALUES ('R0001', 'C0001', 'L0001', 'Camera', 'Camera for Computer Science students', 'In Use' );
INSERT INTO Resource VALUES ('R0002', 'C0002', 'L0002', 'Video Camera', 'Camera for Arts students', 'Maintenance' );
INSERT INTO Resource VALUES ('R0003', 'C0003', 'L0003', 'Speaker', 'Speaker for Computer Science students', 'Available' );
INSERT INTO Resource VALUES ('R1000', 'C1000', 'L0001', 'Study Room', 'Study Room for Computer Science students', 'Available' );
INSERT INTO Resource VALUES ('R2000', 'C1000', 'L0002', 'Study Room', 'Study Room for Software Engineering students', 'Available' );
INSERT INTO Resource VALUES ('R3000', 'C1000', 'L0003', 'Study Room','Study Room for Arts students', 'Available' );

INSERT INTO StudentMember VALUES ('M0001', '12' );
INSERT INTO StudentMember VALUES ('M0002', '12' );
INSERT INTO StudentMember VALUES ('M0003', '12' );

INSERT INTO StaffMember VALUES ('M1000');
INSERT INTO StaffMember VALUES ('M2000');
INSERT INTO StaffMember VALUES ('M3000');

INSERT INTO CourseOffering VALUES ('CP1010', 'Computing Fundamentals', '1', '2018', '14/02/2018', '28/06/2018' ); 
INSERT INTO CourseOffering VALUES ('SG1001', 'Introduction to Programming', '1', '2018', '14/02/2018', '28/06/2018' ); 
INSERT INTO CourseOffering VALUES ('BS1150', 'Business Essentials', '1', '2018', '14/02/2018', '28/06/2018' ); 

INSERT INTO Privilege VALUES ('STU1', 'Student1', 'First Year Student', 'C0001', '2' );
INSERT INTO Privilege VALUES ('STU2', 'Student2', 'Second Year Student', 'C0002', '4' );
INSERT INTO Privilege VALUES ('STAF', 'Staff', 'University Staff', 'C0003', '8' );

INSERT INTO MovableResource VALUES ('R0001');
INSERT INTO MovableResource VALUES ('R0002');
INSERT INTO MovableResource VALUES ('R0003');

INSERT INTO ImmovableResource VALUES ('R1000');
INSERT INTO ImmovableResource VALUES ('R2000');
INSERT INTO ImmovableResource VALUES ('R3000');

INSERT INTO Loan VALUES ('M0001', 'R0001', '1/5/2018', '15/5/2018', '8:00', '17:00' );
INSERT INTO Loan VALUES ('M0002', 'R0002', '5/6/2018', '20/6/2018', '9:00', '17:00' );
INSERT INTO Loan VALUES ('M0003', 'R0003', '19/8/2018', '2/9/2018', '10:00', '17:00' );

INSERT INTO Enrolment VALUES ('CP1010','M0001' );
INSERT INTO Enrolment VALUES ('SG1001','M0002' );
INSERT INTO Enrolment VALUES ('BS1150','M0003' );

INSERT INTO Reservation VALUES ('RES01', 'M0001', 'R1000', '1/5/2018', '15/5/2018')
INSERT INTO Reservation VALUES ('RES02', 'M0002', 'R2000', '5/6/2018', '20/6/2018')
INSERT INTO Reservation VALUES ('RES03', 'M0003', 'R3000', '19/8/2018', '2/9/2018')

--SELECT * FROM Member
--SELECT * FROM Administrator
--SELECT * FROM Acquisition
--SELECT * FROM Category
--SELECT * FROM Location
--SELECT * FROM Resource
--SELECT * FROM StudentMember
--SELECT * FROM CourseOffering
--SELECT * FROM Privilege
--SELECT * FROM StaffMember
--SELECT * FROM MovableResource
--SELECT * FROM ImmovableResource
--SELECT * FROM Loan
--SELECT * FROM Enrolment
--SELECT * FROM Reservation

SELECT MemberID, PhoneNumber 
FROM Member
WHERE MemberID='M1000'

SELECT Name
FROM Member
WHERE MemberID=
		(SELECT MemberID
		FROM Enrolment
		WHERE OfferingID='CP1010')

SELECT Name
FROM Member
WHERE MemberID=
		(SELECT MemberID
		FROM Loan
		WHERE ResourceID=
				(SELECT ResourceID
				FROM Resource
				WHERE CategoryCode=
						(SELECT CategoryCode
						FROM Category
						WHERE CategoryCode='C0001')))

SELECT ResourceID
FROM MovableResource
WHERE ResourceID=
		(SELECT ResourceID
		FROM Loan
		WHERE DateLoaned='1/5/2018')

SELECT MaxResources
FROM Privilege
WHERE CategoryCode=
		(SELECT CategoryCode
		FROM Category
		WHERE CategoryCode='C0003')

SELECT ResourceID, DateRequired
FROM Reservation
WHERE DateRequired='1/5/2018' or DateRequired='5/6/2018' or DateRequired='19/8/2018'