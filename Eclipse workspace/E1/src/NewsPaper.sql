create database NewsPaper
use NewsPaper

create table Articles(
articleID int not null primary key,
title nvarchar(200),
content nvarchar(max),
category nvarchar(20)
)

create table Users(
username varchar(20) not null primary key,
password varchar(15) not null
)

create table Comments(
commentID int not null primary key,
username varchar(20) not null foreign key references Users(username),
articleID int not null foreign key references Articles(articleID),
content nvarchar(max)
)

insert into Articles values
(1, 'Trump loses the election', 'content 1', 'Politics'),
(2, 'Elon moves to Texas', 'content 2', 'Lifestyle'),
(3, 'Parasite won Oscar 2020', 'content 3', 'Entertainment'),
(4, 'US releases a new stimulus package', 'content 3', 'Economy')

insert into Users values
('Thang', 'pw1'),
('Lam', 'pw2'),
('Thu', 'pw3'),
('Minh', 'pw4'),
('An', 'pw5')

insert into Comments values
(1, 'Thang', 1, 'comment content 1 1'),
(2, 'Thang', 2, 'comment content 2 1'),
(3, 'Thang', 2, 'comment content 2 2'),
(4, 'Lam', 2, 'comment content 2 1'),
(5, 'Lam', 2, 'comment content 2 2'),
(6, 'Lam', 3, 'comment content 3 1'),
(7, 'Lam', 4, 'comment content 4 1'),
(8, 'Thu', 4, 'comment content 4 1'),
(9, 'Thu', 4, 'comment content 4 2')

select * from Users
select * from Articles
select * from Comments

select Articles.articleID, title, count(commentID) as 'comment count'
from Articles
inner join Comments on Articles.articleID = Comments.articleID
group by Articles.articleID, title

select Articles.articleID, title, count(commentID) as 'comment count'
from Articles
inner join Comments on Articles.articleID = Comments.articleID
group by Articles.articleID, title
having count(commentID) > 2
