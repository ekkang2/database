#날짜 : 2024/07/08
#이름 : 강은경
#내용 : SQL 연습문제1 실습하기

#실습1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.* to 'shop'@'%';
flush privileges;

#실습1-2
# 고객 테이블 생성
create table `Customer` (
	`custId` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`hp` VARCHAR(13) UNIQUE DEFAULT NULL,
	`addr` VARCHAR(100) DEFAULT NULL,
	`rdate` DATETIME NOT NULL
);

# 제품 테이블 생성
create table `Product` (
	`prodNo` int PRIMARY KEY,
	`prodName` VARCHAR(10) NOT NULL,
	`stock` int DEFAULT 0 NOT NULL,
	`price` int DEFAULT NULL,
	`company`  VARCHAR(20) NOT NULL
);

#주문 테이블 생성 
create table `Order` (
	`orderNo` int PRIMARY KEY auto_increment,
	`orderId` VARCHAR(10) NOT NULL,
	`orderProduct` int NOT NULL,
	`orderCount` int DEFAULT 1,
	`orderDate` DATETIME NOT NULL
);

#실습1-3
# 고객테이블 insert
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 정산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` values ('c105', '이성계', null, null, '2022-01-05');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` values ('c107', '허준', null, null, '2022-01-07');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

#제품 테이블 insert
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (4, '양파링', 1250, 1800, '농심');
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (5, '죠리퐁', 2200, null, '크라운');
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

#주문 테이블 insert
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 3, 2, '2022-07-01 13:15:10');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 4, 1, '2022-07-01 14:16:11');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', 1, 1, '2022-07-01 17:23:18');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', 6, 5, '2022-07-02 10:46:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 2, 1, '2022-07-03 09:15:37');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 7, 3, '2022-07-03 12:35:12');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', 1, 2, '2022-07-03 16:55:36');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', 2, 4, '2022-07-04 14:23:23');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 1, 3, '2022-07-04 21:54:34');
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', 6, 1, '2022-07-05 14:21:03');

#실습1-4
select * from `Customer`;

#실습1-5
select `custId`, `name`, `hp` from `Customer`;

#실습1-6
select * from `Product`;

#실습1-7
select `company` from `Product`;

#실습1-8
select distinct `company` from `Product`;

#실습1-9
select `prodName`, `price` from `Product`;

#실습1-10
select `prodName`, `price` + 500 as `조정단가` from `Product`;

#실습1-11
select `prodName`, `stock`, `price` from `Product` where `company` = '오리온';

#실습1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

#실습1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102' and `orderCount` >= 2;

#실습1-14
select * from `Product` where `price` >= 1000 and `price` <= 2000;
select * from `Product` where `price` between 1000 and 2000;

#실습1-15
select `custid`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습1-16 
select `custid`	, `name`, `hp`, `addr` from `Customer` where `name` like'__';

#실습1-17
select * from `Customer` where `hp` is null;

#실습1-18
select * from `Customer` where `addr` is not null;

#실습1-19
select * from `Customer` order by `rdate` desc;

#실습1-20 
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc, `orderProduct` asc;

#실습1-21
select avg(`price`) as `AVG(price)` from `Product`;

#실습1-22
select sum(stock) as `재고량 합계` from `Product` where `company` = '농심';

#실습1-23
select count(*) as `고객수` from `Customer`;

#실습1-24
select count(distinct `company`) as `제조업체 수` from `Product`;

#실습1-25
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량` from `Order` group by `orderProduct`;

#실습1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `Product` group by `company`;

#실습1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `Product` group by `company` having `제품수` >= 2;

#실습1-28 
select `orderProduct`, `orderId`, sum(`orderCount`) as `총 주문수량` from `Order` group by `orderId`, `orderProduct`;

#실습1-29 
select a.orderId, b.prodName from `Order` as a join `Product` as b on a.orderProduct = b.prodNo where `orderId` = 'c102';

#실습1-30
select `orderId`, `name`, `prodName`, `orderDate` from `Order` as a 
 join `Customer` as b
  on a.orderId = b.custId
  join `Product` as c
  on a.orderProduct = c.prodNo
  where LEFT(`orderDate`, 10) = '2022-07-03';
  
select `orderId`, `name`, `prodName`, `orderDate` from `Order` as a 
 join `Customer` as b
  on a.orderId = b.custId
  join `Product` as c
  on a.orderProduct = c.prodNo
  where substr(`orderDate`, 1, 10) = '2022-07-03';