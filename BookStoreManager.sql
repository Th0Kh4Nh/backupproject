create table Category(
 CategoryID int identity(1,1) primary key,
 CategoryName nvarchar(100) not null
)

CREATE TABLE Author(
	AuthorID int identity(1,1) primary key,
	AuthorName nvarchar(50) NOT NULL,
	AuthorEmail nvarchar(50) NULL,	
	AuthorAddress nvarchar(150) NULL
) 

create table Book(
 BookID int identity(1,1) primary key,
 Title nvarchar(200) not null,
 AuthorID int  not null,
 Price decimal(18,0),
 Images varchar(200),
 CategoryID int not null,
 Description ntext,
 Published datetime default(getdate()),
 ViewCount int default(0),
 constraint fk_book_category foreign key (CategoryID) references Category(CategoryID),
 constraint fk_book_author	foreign key(AuthorID) references Author(AuthorID)
)