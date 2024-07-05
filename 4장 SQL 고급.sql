#날짜 : 2024/07/03
#이름 : 강은경
#내용 : 4장 SQL 고급

#실습 4-1
create table `Member` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`hp` VARCHAR(13) UNIQUE NOT NULL,
	`pos` VARCHAR(10) DEFAULT '사원',
	`dep` TINYINT,
	`rdate` DATETIME NOT NULL
);
create table `Department` (
	`depNo` INT PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`tel` CHAR(12) NOT NULL
);
create table `Sales` (
	`seq` int auto_increment PRIMARY KEY,
    `uid` VARCHAR(10) NOT NULL,
    `year` YEAR NOT NULL,
    `month` TINYINT NOT NULL,
    `sale` INT
);

#실습 4-2
insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
insert into `Member` values ('a102', '김유신', '010-1234-1002', '차장', 101, NOW());
insert into `Member` values ('a103', '김춘추', '010-1234-1003', '사원', 101, NOW());
insert into `Member` values ('a104', '장보고', '010-1234-1004', '대리', 102, NOW());
insert into `Member` values ('a105', '강감찬', '010-1234-1005', '과장', 102, NOW());
insert into `Member` values ('a106', '이성계', '010-1234-1006', '차장', 103, NOW());
insert into `Member` values ('a107', '정철', '010-1234-1007', '차장', 103, NOW());
insert into `Member` values ('a108', '이순신', '010-1234-1008', '부장', 104, NOW());
insert into `Member` values ('a109', '허균', '010-1234-1009', '부장', 104, NOW());
insert into `Member` values ('a110', '정약용', '010-1234-1010', '사원', 105, NOW());
insert into `Member` values ('a111', '박지원', '010-1234-1011', '사원', 105, NOW());
select * from `Member`;

insert into `Department` values (101, '영업1부', '051-512-1001');
insert into `Department` values (102, '영업2부', '051-512-1002');
insert into `Department` values (103, '영업3부', '051-512-1003');
insert into `Department` values (105, '영업4부', '051-512-1004');
insert into `Department` values (106, '영업5부', '051-512-1005');
insert into `Department` values (107, '영업지원부', '051-512-1006');
insert into `Department` values (108, '인사부', '051-512-1007');
select * from `Department`;

insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2018, 1, 98100);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2018, 1, 136000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2018, 1, 80100);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2018, 1, 78000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2018, 1, 93000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2018, 2, 23500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2018, 2, 126000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2018, 2, 18500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2018, 2, 19000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a106', 2018, 2, 53000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2019, 1, 109000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2019, 1, 101000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2019, 1, 53500);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a107', 2019, 1, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2019, 2, 160000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2019, 2, 101000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2019, 2, 43000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2019, 2, 24000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a106', 2019, 2, 109000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2020, 1, 201000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2020, 1, 63000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2020, 1, 74000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a106', 2020, 1, 122000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a107', 2020, 1, 111000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2020, 2, 120000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2020, 2, 93000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2020, 2, 84000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2020, 2, 180000);
insert into `Sales` (`uid`, `year`, `month`, `sale`) values ('a108', 2020, 2, 76000);
select * from `Sales`;

#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `pos`='차장' and dep = 101;
select * from `Member` where `pos`='차장' or dep = 101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos`='사원' or `pos`='대리';
select * from `Member` where `pos` in('사원', '대리');
select * from `Member` where `dep` in(101, 102, 103);
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Member` where `name` like '정_';
select * from `Sales` where `sale` > 50000;
select * from `Sales` where `sale` >=50000 and `sale` < 100000 and `month`=1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 100000;
select * from `Sales` where `year` in(2020);
select * from `Sales` where `month` in(1, 2);

#실습 4-4
select * from `Sales` order by `sale`; # 기본적으로 오름차순 
select * from `Sales` order by `sale` asc; # 오름차순 
select * from `Sales` order by `sale` desc; #내림차순 
select * from `Member` order by `name`;
select * from `Member` order by `name` desc;
select * from `Member` order by `rdate` asc;
select * from `Sales`
 where `sale` > 50000
 order by `sale` desc;
select * from `Sales`
 where `sale` > 50000
 order by `year`, `month`, `sale` desc; # year > month > sale 순으로 정렬

#실습 4-5
select * from `Sales` limit 3;
select * from `Sales` limit 0, 3; # limit index, size
select * from `Sales` limit 1, 2;
select * from `Sales` limit 5, 3;
select * from `Sales` order by `sale` desc limit 3, 5;
select * from `Sales`
 where `sale` < 50000
 order by `sale` desc limit 3;
 select * from `Sales`
  where `sale` > 50000
  order by `year` desc, `month`, `sale` desc
  limit 5;

#실습 4-6
select sum(sale) as `합계` from `Sales`;
select avg(sale) as `평균` from `Sales`;
select max(sale) as `최대값` from `Sales`;
select min(sale) as `최소값` from `Sales`;
select ceiling(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand();
select ceiling(rand() * 10);
select count(sale) as `갯수` from `Sales`;
select count(*) as `갯수` from `Sales`;

select left('HelloWorld', 5); # 왼쪽으로 문자 갯수 만큼 문자열을 반환 
select right('HelloWorld', 5); # 오른쪽으로 문자 갯수 만큼 문자열을 반환
select substring('HelloWorld', 6, 5); # 문자열의 시작부분부터 문자열의 끝부분까지 자르기 
select concat('Hello', 'World') as `결과`;    # 문자열 연결 
select concat(`uid`, `name`, `hp`) from `member` where `uid`='a108';
select now();
insert into `Member` values('a112', '유관순', '010-1234-1012', '대리', 107, now());

#실습 4-7 2018년 1월 매출의 총합을 구하시오.
select sum(sale) as `2028년 1월 매출의 총합` 
 from `Sales` 
 where `year` = 2018 and `month` = 1;
 
#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
select sum(sale) as `2019년 총합`
     , avg(sale) as `2019년 평균` 
  from `Sales` 
 where `year` = 2019 and `month` = 2 and `sale` >= 50000;
 
#실습 4-9 2020년 전체 매출 가운데 최저, 최고 매출을 구하시오.
select min(sale) as `최저 매출`
     , max(sale) as `최고 매출` 
  from `Sales` 
 where `year` = 2020;

#실습 4-10
select * from `Sales`;
select * from `Sales` group by `uid`; 
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`, `year`;
select `uid`, count(*) as `건수` from `Sales` group by `uid`;
select `uid`, sum(`sale`) as `합계` from `Sales` group by `uid`;
select `uid`, avg(`sale`) as `평균` from `Sales` group by `uid`;

select `uid`, `year`, sum(sale) as `합계`
 from `Sales`
 group by `uid`, `year`;
 
 select `uid`, `year`, sum(sale) as `합계`
  from `Sales`
  group by `uid`, `year`
  order by `year` asc, `합계` desc;
  
  select `uid`, `year`, sum(sale) as `합계`
   from `Sales`
   where `sale` >= 50000
   group by `uid`, `year`
   order by `합계` desc;

#실습 4-11
select `uid`, sum(sale) as `합계` from `Sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
 from `Sales`
 where `sale` >= 100000
 group by `uid`, `year`
 having `합계` >= 200000
 order by `합계` desc;

#실습 4-12
create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
set sql_safe_updates=0; # 조건 없이 update 모드 해제
update `Sales2` set `year` = `year` + 3;

select * from `Sales` union select * from `Sales2`;
select * from `Sales` where `sale` >= 100000
 union
select * from `Sales2` where `sale` >= 100000;

select `uid`, `year`, `sale` from `Sales`
 union
select `uid`, `year`, `sale` from `Sales2`; 

select `uid`, `year`, sum(sale) as `합계`
 from `Sales`
 group by `uid`, `year`
 union
select `uid`, `year`, sum(sale) as `합계`
 from `Sales2`
 group by `uid`, `year`
 order by `year` asc, `합계` desc;

#실습 4-13
select * from `Sales` 
inner join `Member` on `Sales`.uid = `Member`.uid;

select * from `Member` 
inner join `Department` on `Member`.dep = `Department`.depNo;

select * from `Sales` as a
 join `Member` as b on a.uid = b.uid;
 
 select * from `Member` as a
  join `Department` as b on a.dep = b.depNo;
  
select * from `Sales` as a , `Member` as b where a.uid = b.uid;
select * from `Member` as a, `Department` as b where a.dep = b.depNo;

select a.`seq`, a.`uid`, `sale`, `name`, `pos` 
 from `Sales` as a
 join `Member` as b on a.`uid` = b.`uid`;
 
select a.`seq`, a.`uid`, `sale`, `name`, `pos` from `Sales` as a
 join `Member` as b using(uid);

select a.`seq`, a.`uid`, `sale`, `name`, `pos` 
 from `Sales` as a 
 join `Member` as b on a.`uid` = b.`uid`
 where `sale` >= 100000;
 
 select a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, sum(`sale`) as `합계`
  from `Sales` as a
  join `Member` as b on a.uid = b.uid
  group by a.`uid`, a.`year` having `합계` >= 100000
  order by a.`year` asc, `합계` desc;
  
  select * from `Sales` as a
   join `Member` as b on a.uid = b.uid
   join `Department` as c on b.dep = c.depNo;
   
   select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` 
    from `Sales` as a
    join `Member` as b on a.uid = b.uid
    join `Department` as c on b.dep = c.depNo;
    
    select a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name`
     from `Sales` as a
     join `Member` as b on a.uid = b.uid
     join `Department` as c on b.dep = c.depNo
     where `sale` > 100000
     order by `sale` desc;

#실습 4-14
select * from `Sales` as a
left join `Member` as b on a.uid = b.uid;

select * from `Sales` as a
right join `Member` as b on a.uid = b.uid;

select a.seq, a.uid, `sale`, `name`, `pos` 
 from Sales as a
 left join Member as b using(uid);
 
 select a.seq, a.uid, `sale`, `name`, `pos`	
  from Sales as a
  right join Member as b using(uid);

#실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
select a.uid, a.name, a.pos, b.name 
 from `Member` as a
 join `Department` as b on a.dep = b.depNo;

#실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.
select sum(a.sale) as `2019년도 매출 합` 
 from `Sales` as a
 join `Member` as b on a.uid = b.uid
 where a.year = 2019
   and b.name = '김유신';
 
#실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 단. 매출 합이 큰 순서부터 정렬
select b.name, c.name, b.pos, a.year, sum(a.sale) as `합계`
 from `Sales` as a
 join `Member` as b on a.uid = b.uid
 join `Department` as c on c.depNo = b.dep
where `year` = 2019 and `sale` >= 50000
group by a.`uid`
 having `합계` >= 100000
order by `합계` desc;