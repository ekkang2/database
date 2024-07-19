#날짜 : 2024/07/09
#이름 : 강은경
#내용 : SQL 연습문제4

#실습 4-1
create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on Theater.* TO 'theater'@'%';
flush privileges;

#실습 4-2
CREATE TABLE `Movies` (
	`movie_id`	int PRIMARY KEY auto_increment,
	`title`  	VARCHAR(30) NOT NULL,
	`genre`		VARCHAR(10) NOT NULL,
	`release_date`	datetime not null
);

CREATE TABLE `Customers` (
	`customer_id`	int PRIMARY KEY auto_increment,
	`name`  	VARCHAR(20) NOT NULL,
	`email`		VARCHAR(50) NOT NULL,
	`phone`	CHAR(13) not null
);

CREATE TABLE `Bookings` (
	`booking_id`	int PRIMARY KEY,
	`customer_id`  	int NOT NULL,
	`movie_id`		int NOT NULL,
	`num_tickets`	int not null,
	`booking_date`	datetime not null
);

#실습 4-3
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('쇼생크의 탈출', '드라마', '1994-10-14');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('타이타닉', '로맨스', '1997-03-24');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('탑건', '액션', '1987-07-16');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('쥬라기공원', '액션', '1994-02-11');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('글래디에이터', '액션', '2000-05-03');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('시네마천국', '드라마', '1995-04-12');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('미션임파서블', '액션', '1995-11-11');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('노트북', '로맨스', '2003-08-23');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('인터스텔라', 'SF', '2011-05-26');
INSERT INTO `Movies` (`title`, `genre`, `release_date`) VALUES ('아바타', 'SF', '2010-02-10');

INSERT INTO `Customers` (`name`, `email`, `phone`) VALUES ('김유신', 'kys@example.com', '010-1234-1001');
INSERT INTO `Customers` (`name`, `email`, `phone`) VALUES ('김춘추', 'kcc@example.com', '010-1234-1002');
INSERT INTO `Customers` (`name`, `email`, `phone`) VALUES ('장보고', 'jbg@example.com', '010-1234-1003');
INSERT INTO `Customers` (`name`, `email`, `phone`) VALUES ('강감찬', 'kgc@example.com', '010-1234-1004');
INSERT INTO `Customers` (`name`, `email`, `phone`) VALUES ('이순신', 'lss@example.com', '010-1234-1005');

INSERT INTO `Bookings` VALUES (101, 1, 1, 2, '2023-01-10 00:00:00');
INSERT INTO `Bookings` VALUES (102, 2, 2, 3, '2023-01-11 00:00:00');
INSERT INTO `Bookings` VALUES (103, 3, 2, 2, '2023-01-13 00:00:00');
INSERT INTO `Bookings` VALUES (104, 4, 3, 1, '2023-01-17 00:00:00');
INSERT INTO `Bookings` VALUES (105, 5, 5, 2, '2023-01-21 00:00:00');
INSERT INTO `Bookings` VALUES (106, 3, 8, 2, '2023-01-21 00:00:00');
INSERT INTO `Bookings` VALUES (107, 1, 10, 4, '2023-01-21 00:00:00');
INSERT INTO `Bookings` VALUES (108, 2, 9, 1, '2023-01-22 00:00:00');
INSERT INTO `Bookings` VALUES (109, 5, 7, 2, '2023-01-23 00:00:00');
INSERT INTO `Bookings` VALUES (110, 3, 4, 2, '2023-01-23 00:00:00');
INSERT INTO `Bookings` VALUES (111, 1, 6, 1, '2023-01-24 00:00:00');
INSERT INTO `Bookings` VALUES (112, 3, 5, 3, '2023-01-25 00:00:00');

#실습 4-4
select title from `movies`;

#실습 4-5
select * from Movies where `genre` = '로맨스';

#실습 4-6 ???
select
	title,
    release_date
from Movies where ;

#실습 4-7
select
	booking_id, booking_date
from Bookings where `num_tickets` >= 3;

#실습 4-8
select * from Bookings where `booking_date` < '2023-01-20';

#실습 4-9
select * from Movies where release_date between '1990-01-01' and '1999-12-31';

#실습 4-10
select * from Bookings
order by booking_date desc
limit 3;

#실습 4-11
select title, release_date from Movies
order by release_date asc
limit 1;

#실습 4-12
select
	concat(title, ' - ', release_date) as movie_info
from Movies
where `title` like '%공원'
order by release_date asc
limit 1;

#실습 4-13
select booking_date, title
from Bookings
join Movies
 on Movies.movie_id = Bookings.movie_id
 where customer_id = 2;
 
#실습 4-14
select
	c.name,
    c.phone,
    b.booking_date,
    m.title
 from bookings B
 join Customers C on B.customer_id = C.customer_id
 join Movies M on B.movie_id = M.movie_id;

#실습 4-15
select
	m.genre,
    avg(b.num_tickets) as avg_tickets
 from bookings b
 join Movies m on b.movie_id = m.movie_id
 group by `genre`;
 
#실습 4-16
select
	c.name,
    avg(b.num_tickets) as avg_tickets
from Bookings B
join Customers c on b.customer_id = c.customer_id
group by `name`;

#실습 4-17
select
	c.name,
    sum(b.num_tickets) as `전체 예매 티켓 수`
from bookings b
join Customers c on b.customer_id = c.customer_id
group by `name`
order by `전체 예매 티켓 수` desc;

#실습 4-18
select
	b.booking_id,
    b.movie_id,
    c.name,
    b.booking_date
 from Bookings b
 join Customers c on b.customer_id = c.customer_id
 order by b.booking_date asc
 limit 1;
 
#실습 4-19
select
	genre, title, release_date
from Movies
where (genre, release_date) in (
	select genre, max(release_date)
	from Movies
    group by `genre`
);

#실습 4-20
select * from Movies
where movie_id in(
	select movie_id from Bookings
    where customer_id = (select customer_id from Customers where `name` = '김유신')
);

#실습 4-21
select name, email from Customers
where customer_id = (
	select customer_id
    from Bookings
    group by customer_id
    order by sum(num_tickets) desc
	limit 1

);

#실습 4-22
select * from bookings
where num_tickets > (select avg(num_tickets) from Bookings);

#실습 4-23
select
	m.title, sum(b.num_tickets) as total_tickets
from Bookings b
join Movies m on b.movie_id = m.movie_id
group by `title`;

#실습 4-24
select
	c.name,
    sum(b.num_tickets) as total_tickets,
    avg(b.num_tickets) as avg_tickets
from Bookings b
join customers c on b.customer_id = c.customer_id
group by `name`;

#실습 4-25
select
	c.customer_id,
    c.name,
    c.email,
    sum(b.num_tickets) as `예매 티켓수`
from Bookings b
join Customers c on b.customer_id = c.customer_id
group by `customer_id`
order by `예매 티켓수` desc;

#실습 4-26
select
	c.name,
    m.title,
    b.num_tickets,
    b.booking_date
 from bookings b
 join customers c on b.customer_id = c.customer_id
 join movies m on b.movie_id = m.movie_id
 order by num_tickets desc;
 
#실습 4-27
select
	m.title,
    m.genre,
    sum(b.num_tickets) as `예매 티켓 수`,
    avg(b.num_tickets) as `평균 티켓 수`
from bookings b
join Movies m on b.movie_id = m.movie_id
where m.genre = '액션'
group by `title`
order by `평균 티켓 수` desc;

#실습 4-28
select
	b.customer_id,
    c.name,
    sum(`num_tickets`) as `ticket_total`
from bookings b
join Customers c on b.customer_id = c.
#실습 4-29

#실습 4-30