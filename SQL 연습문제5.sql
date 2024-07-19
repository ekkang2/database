#날짜 : 2024/07/12
#이름 : 강은경
#내용 : SQL 연습문제5

#실습 5-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.*to 'bookstore'@'%';
flush privileges;

#실습 5-2
CREATE TABLE `Customer` (
	`custId`	int PRIMARY KEY auto_increment,
	`name`  	VARCHAR(10) NOT NULL,
	`address`	VARCHAR(20) default null,
	`phone`	VARCHAR(13) default null
);

CREATE TABLE `Book` (
	`bookId`	int PRIMARY KEY,
	`bookName`  VARCHAR(20) NOT NULL,
	`publisher`	VARCHAR(20) not null,
	`price`	int default null
);

CREATE TABLE `Order` (
	`orderId` int PRIMARY KEY auto_increment,
	`custId`  int NOT NULL,
	`bookId`  int not null,
	`salePrice`	int not null,
    `orderDate` datetime not null
);


#실습 5-3
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('박지성', '영국 멘체스타', '000-5000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('박세리', '대한민국 대전', null);

INSERT INTO `Book` VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO `Book` VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO `Book` VALUES (6, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO `Book` VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Person', 13000);

INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (1, 1, 6000, '2014-07-01');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (1, 3, 21000, '2014-07-03');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (2, 5, 8000, '2014-07-03');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (3, 6, 6000, '2014-07-04');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (4, 7, 20000, '2014-07-05');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (1, 2, 12000, '2014-07-07');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (4, 8, 13000, '2014-07-07');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (3, 10, 12000, '2014-07-08');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (2, 10, 7000, '2014-07-09');
INSERT INTO `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) VALUES (3, 8, 13000, '2014-07-10');

#실습 5-4
select `custId`, `name`, `address` from `Customer`;

#실습 5-5
select bookname, price from `Book`;

#실습 5-6
select price, bookname from `Book`;

#실습 5-7
select bookId, bookname, publisher, price from `Book`;

#실습 5-8
select publisher from `Book`;

#실습 5-9
select distinct publisher from `Book`;

#실습 5-10
select bookId, bookname, publisher, price from `Book` where price >= 20000;

#실습 5-11
select bookId, bookname, publisher, price from `Book` where price < 20000;

#실습 5-12
select bookId, bookname, publisher, price from `Book` where price between 10000 and 20000;

#실습 5-13
select bookId, bookname, price from `Book` where price between 15000 and 30000;

#실습 5-14
select bookId, bookname, publisher, price from `Book` where bookId in(2, 3, 5);

#실습 5-15
select bookId, bookname, publisher, price from `Book` where bookId % 2 = 0;

#실습 5-16
select custId, name, address, phone from `Customer` where name like '박%';

#실습 5-17
select custId, name, address, phone from `Customer` where address like '%대한민국%';

#실습 5-18
select custId, name, address, phone from `Customer` where phone is not null;

#실습 5-19
select bookId, bookname, publisher, price from `Book` where publisher = '굿스포츠' or publisher = '대한미디어';

#실습 5-20
select publisher from `Book` where bookname = '축구의 역사';

#실습 5-21
select publisher from `Book` where bookname like '%축구%';

#실습 5-22
select bookId, bookname, publisher, price from `Book` where bookname like '_구%';

#실습 5-23
select bookId, bookname, publisher, price from `Book` where bookname like '%축구%' and price >= 22000;

#실습 5-24
select bookId, bookname, publisher, price from `Book` order by bookname;

#실습 5-25
select bookId, bookname, publisher, price from `Book` order by price, bookname;

#실습 5-26
select bookId, bookname, publisher, price from `Book` order by price desc, publisher;

#실습 5-27
select bookId, bookname, publisher, price from `Book` order by price desc limit 3;

#실습 5-28
select bookId, bookname, publisher, price from `Book` order by price limit 3;

#실습 5-29
select sum(salePrice) as `총판매액` from `Order`;

#실습 5-30
select sum(salePrice) as `총판매액`, 
	   avg(salePrice) as `평균값`, 
       min(salePrice) as `최저가`,
       max(salePrice) as `최고가`
from `Order`;

#실습 5-31
select count(orderId) as `판매건수` from `Order` ;

#실습 5-32 
 select bookId, 
  replace(`bookname`, '야구', '농구'), 
  publisher, 
  price 
  from `Book`;
 
#실습 5-33 
select custId, count(bookId) as `수량` 
 from `Order` 
 where salePrice >= 8000 
 group by custId
 having `수량` >= 2;

#실습 5-34
select 
	a.custId,
    a.name,
    a.address,
    a.phone,
    b.orderId,
    b.custId,
    b.bookId,
    b.salePrice,
    b.orderdate
from `Customer` as a
left join `Order` as b 
 on b.custId = a.custId;

#실습 5-35
select 
	a.custId,
    a.name,
    a.address,
    a.phone,
    b.orderId,
    b.custId,
    b.bookId,
    b.salePrice,
    b.orderdate
from `Customer` as a
left join `Order` as b 
 on b.custId = a.custId
order by b.custId;

#실습 5-36
select a.name, b.salePrice
from `Customer` as a
join `Order` as b 
 on b.custId = a.custId
 order by a.custId;
 
#실습 5-37
select name, sum(`salePrice`) 
 from `Customer` as a
 join `Order` as b
 on b.custId = a.custId
 group by name
 order by name;
 
#실습 5-38
select a.name, c.bookName
 from `Customer` as a
 join `Order` as b
 on b.custId = a.custId
 join `Book` as c
 on b.bookId = c.bookId;
 
#실습 5-39
select a.name, c.bookName
 from `Customer` as a
 join `Order` as b
 on b.custId = a.custId
 join `Book` as c
 on b.bookId = c.bookId
 where b.salePrice = 20000;
 
#실습 5-40
select a.name, b.salePrice
 from `Customer` as a
 left outer join `Order` as b
  on b.custId = a.custId;
  
#실습 5-41
select sum(salePrice) as `총매출`
 from `Customer` as a
 join `Order` as b
  on b.custId = a.custId
where a.name = '김연아';

#실습 5-42
select bookName 
 from `Book`
 order by price desc limit 1;
 
#실습 5-43
select name 
  from `Customer` as a
  left join `Order` as b
   on a.custId = b.custId
   where b.orderId is null;

#실습 5-44
INSERT INTO `Book` VALUES (11, '스포츠 의학', '한솔의학서적', null);

#실습 5-45
update `Customer`
  set address = '대한민국 부산'
  where custId = 5;

#실습 5-46
delete  
  from `Customer`
where custId = 5;


