#날짜 : 2024/07/15
#이름 : 강은경
#내용 : 데이터 모델링 실습하기

#실습 6-1

#실습 6-2
INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
INSERT INTO `Customer` VALUES ('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

INSERT INTO `Product` VALUES (1, '새우깡', 5000, 1500, '농심');
INSERT INTO `Product` VALUES (2, '초코파이', 2500, 2500, '오리온');
INSERT INTO `Product` VALUES (3, '포카칩', 3600, 1700, '오리온');
INSERT INTO `Product` VALUES (4, '양파링', 1250, 1800, '농심');
INSERT INTO `Product` VALUES (5, '죠리퐁', 2200, null, '크라운');

INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c102', 3, 2, '2023-01-01 13:15:10');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c101', 4, 1, '2023-01-01 13:15:12');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c102', 1, 1, '2023-01-01 13:15:14');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c103', 6, 5, '2023-01-01 13:15:16');
INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES ('c105', 2, 1, '2023-01-01 13:15:18');

#실습 6-3
select a.orderId, b.name, c.prodName, a.orderCount, a.orderDate
  from `Order` as a
 join `Customer` as b 
  on b.custId = a.orderId
 join `Product` as c
 on c.prodNo = a.orderProduct;
 
 select a.orderId, c.prodNo, c.prodName, c.price, a.orderCount, a.orderDate
   from `Order` as a
 join `Customer` as b 
  on b.custId = a.orderId
 join `Product` as c
 on c.prodNo = a.orderProduct
 where b.name = '김유신';
 
 select sum(b.price * a.orderCount) as `총 주문 금액`
  from `Order` as a
  join `Product` as b
   on b.prodNo = a.orderProduct;
   
#실습 6-4

#실습 6-5
INSERT INTO `bank_customer` VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
INSERT INTO `bank_customer` VALUES ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
INSERT INTO `bank_customer` VALUES ('730423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
INSERT INTO `bank_customer` VALUES ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
INSERT INTO `bank_customer` VALUES ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

INSERT INTO `bank_account` VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
INSERT INTO `bank_account` VALUES ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
INSERT INTO `bank_account` VALUES ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
INSERT INTO `bank_account` VALUES ('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14');
INSERT INTO `bank_account` VALUES ('101-13-1001', 'S3', '정기저축예금', '730423-1000001', 1200000, '2011-08-15');

insert into `bank_transaction` set `t_a_no`='101-11-1001', `t__dist`=1, `t_amount`=50000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-12-1001', `t__dist`=2, `t_amount`=1000000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t__dist`=3, `t_amount`=260000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t__dist`=2, `t_amount`=100000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1003', `t__dist`=3, `t_amount`=750000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1001', `t__dist`=1, `t_amount`=150000, `t_datetime`=NOW();


#실습 6-8
INSERT INTO `Student` VALUES ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
INSERT INTO `Student` VALUES ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
INSERT INTO `Student` VALUES ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
INSERT INTO `Student` VALUES ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
INSERT INTO `Student` VALUES ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

INSERT INTO `Lecture` VALUES (101, '컴퓨터과학 개론', 2, 40, '본301');
INSERT INTO `Lecture` VALUES (102, '프로그래밍 언어', 3, 52, '본302');
INSERT INTO `Lecture` VALUES (103, '데이터베이스', 3, 56, '본303');
INSERT INTO `Lecture` VALUES (104, '자료구조', 3, 60, '본304');
INSERT INTO `Lecture` VALUES (105, '운영체제', 3, 52, '본305');

INSERT INTO `Register` VALUES ('20220415', 101, 60, 30, null, null);
INSERT INTO `Register` VALUES ('20210324', 103, 54, 36, null, null);
INSERT INTO `Register` VALUES ('20201011', 105, 52, 28, null, null);
INSERT INTO `Register` VALUES ('20220415', 102, 38, 40, null, null);
INSERT INTO `Register` VALUES ('20210324', 104, 56, 32, null, null);
INSERT INTO `Register` VALUES ('20210213', 103, 48, 40, null, null);

#실습 6-9
select `stdNo`, `stdName`, `stdHp`, `stdYear` 
from `Student` as a
left join `Register` as b
 on b.regStdNo = a.stdNo
 where `regStdNo` is null; 
 
select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;
 
 select `stdNo`, `stdName`, `lecName`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
  from `Student` as a
 join `Register` as b
  on b.regStdNo = a.stdNo
 join `Lecture` as c
  on c.lecNo = b.regLecNo
where `stdYear` = 2;
 


