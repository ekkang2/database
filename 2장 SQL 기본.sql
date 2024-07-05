#날짜 : 2024/07/01
#이름 : 강은경
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

create table `User1` (
`uid` varchar(10),
`name` varchar(10),
`hp` char(13),
`age` int
);

#실습 2-2. 데이터 입력
insert into `User1` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User1` values ('A102', '김춘추', '010-1234-1111', 23);
insert into `User1` values ('A103', '장보고', '010-1234-1111', 32);
insert into `User1` (`uid`, `name`, `age`) values ('A104', '강감찬', 45);
insert into `User1` set 
						`uid`='A105',
                        `name`='이순신',
                        `hp`='010-1234-5555';
                        
#실습 2-3. 데이터 조회
select * from `User1`;
select * from `User1` where `uid`='A101';
select * from `User1` where `name`='김춘추';
select * from `User1` where `age` < 30;
select * from `User1` where `age` >=30;
select `uid`, `name`, `age` from `User1`;

#실습 2-4. 데이터 수정
set sql_safe_updates=0;
update `User1` set `hp`='010-1234-4444' where `uid`='A104';
update `User1` set `age`=51 where `uid`='A105';
update `User1` set `hp`='010-1234-1001', `age`=27 where `uid`='A101';

#실습 2-5. 데이터 삭제
delete from `User1` where `uid`='A101';
delete from `User1` where `uid`='A102' and `age`=25;
delete from `User1` where `age` >= 30;

#실습 2-6. 테이블 컬럼 수정
alter table `User1` add `gender` tinyint;
alter table `User1` add `birth` char(10) after `name`;
alter table `User1` modify `gender` char(1);
alter table `User1` modify `age` tinyint;
alter table `User1` drop `gender`;

#실습 2-7. 테이블 복사
create table `User1Copy` like `User1`;
insert into `User1Copy` select * from `User1`;

#실습 2-8. 테이블 생성 후 데이터 입력 (회원 테이블)
create table `TblUser` (
`user_id` varchar(10),
`user_name` varchar(10),
`user_hp` char(13),
`user_age` int,
`user_addr` varchar(10)
);

select * from `TblUser`;
insert into `TblUser` values ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
insert into `TblUser` values ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
insert into `TblUser` values ('p103', '장보고', NULL, 31, '전남 완도군');
insert into `TblUser` values ('p104', '강감찬', NULL, NULL, '서울시 중구');
insert into `TblUser` values ('p105', '이순신', '010-1234-1005', 50, NULL);

#실습 2-8. 테이블 생성 후 데이터 입력 (제품 테이블)
create table `TblProduct` (
`prod_no` varchar(10),
`prod_name` varchar(10),
`prod_price` varchar(13),
`prod_stock` int,
`prod_company` varchar(10),
`prod_date` varchar(10)
);

select * from `TblProduct`;
insert into `TblProduct` set 
						`prod_no`='1001',
                        `prod_name`='냉장고',
                        `prod_price`='800,000',
                        `prod_stock`=25,
                        `prod_company`='LG전자',
                        `prod_date`='2022-01-06';

insert into `TblProduct` set 
						`prod_no`='1002',
                        `prod_name`='노트북',
                        `prod_price`='1,200,000',
                        `prod_stock`=120,
                        `prod_company`='삼성전자',
                        `prod_date`='2022-01-07';

insert into `TblProduct` set 
						`prod_no`='1003',
                        `prod_name`='모니터',
                        `prod_price`='350,000',
                        `prod_stock`=35,
                        `prod_company`='LG전자',
                        `prod_date`='2023-01-13';

insert into `TblProduct` set 
						`prod_no`='1004',
                        `prod_name`='세탁기',
                        `prod_price`='1,000,000',
                        `prod_stock`=80,
                        `prod_company`='삼성전자',
                        `prod_date`='2021-01-01';
                        
insert into `TblProduct` set 
						`prod_no`='1005',
                        `prod_name`='컴퓨터',
                        `prod_price`='1,500,000',
                        `prod_stock`=20,
                        `prod_company`='삼성전자',
                        `prod_date`='2023-10-01';
                        
insert into `TblProduct` set 
						`prod_no`='1006',
                        `prod_name`='휴대폰',
                        `prod_price`='950,000',
                        `prod_stock`=102,
                        `prod_company`=null,
                        `prod_date`=null;
                        
#실습 2-9. 아래 SQL 실행
select * from `TblUser`;
select `user_name` from `TblUser`;
select `user_name`, `user_hp` from `TblUser`;
select * from `TblUser` where `user_id` = 'p102';
select * from `TblUser` where `user_id` = 'p104' or `user_id` ='p105';
select * from `TblUser` where `user_addr` = '부산시 금정구';
select * from `TblUser` where `user_age` > 30;
select * from `TblUser` where `user_hp` is null;
update `TblUser` set `user_age`=42 where `user_id`='p104';
update `TblUser` set `user_addr`='부산시 진구' where `user_id`='p105';
delete from `TblUser` where `user_id` = 'p103';

select * from `TblProduct`;
select `prod_name` from `TblProduct`;
select `prod_name`, `prod_company`, `prod_price` from `TblProduct`;
select * from `TblProduct` where `prod_company` = 'LG전자';
select * from `TblProduct` where `prod_company` = '삼성전자';
update `TblProduct` set
					`prod_company`='삼성전자',
                    `prod_date`='2024-01-01'
                    where
                    `prod_no`=1006;