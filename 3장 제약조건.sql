#날짜 : 2024/07/02
#이름 : 강은경
#내용 : 3장 제약조건

#실습 3-1 기본키 실습하기
create table `User2` (
	`uid` varchar(10) primary key,
    `name` varchar(10),
    `birth` char(10),
	`addr` varchar(50)
    );
select * from `User2`;

#실습 3-2 User2 데이터 추가하기
insert into `User2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `User2` values ('A102', '김춘추', '1972-11-23', '경남 경주시');
insert into `User2` values ('A103', '장보고', '1978-03-01', '전남 완도군');
insert into `User2` values ('A104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `User2` values ('A105', '이순신', '1981-05-23', '부산시 진구');

#실습 3-3 고유키 실습하기
create table `User3` (
	`uid` varchar(10) primary key,
	`name` varchar(10),
    `birth` char(10),
    `hp` char(13) unique,
	`addr` varchar(50)
    );
select * from `User3`;

#실습 3-4
insert into `User3` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `User3` values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
insert into `User3` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `User3` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `User3` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');

#실습 3-5 외래키 실습하기
create table `Parent` (
	`pid` varchar(10) primary key,
	`name` varchar(10),
	`birth` char(10),
	`addr` varchar(100)
    );
    
create table `Child` (
`cid` varchar(10) primary key,
`name` varchar(10),
`hp` char(13) unique,
`parent` varchar(10),
foreign key (`parent`) references `Parent` (`pid`)
);
SELECT * FROM `Parent`;
SELECT * FROM `Child`;

#실습 3-6
insert into `Parent` values ('P101', '김유신', '1968-05-09', '경남 김해시');
insert into `Parent` values ('P102', '김춘추', '1972-11-23', '경남 경주시');
insert into `Parent` values ('P103', '장보고', '1978-03-01', '전남 완도군');
insert into `Parent` values ('P104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `Parent` values ('P105', '이순신', '1981-05-23', '부산시 진구');

#실습 3-7
create table `User4` (
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `gender` char(1),
    `age` int default 1,
    `hp` char(13) unique,
    `addr` varchar(20)
    );
select * from `User4`;

#실습 3-8
insert into `User4` values ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into `User4` values ('A102', '김춘추', 'M', 25, '010-1234-2222', '경남 경주시');
insert into `User4` values ('A103', '장보고', 'M', 25, '010-1234-3333', '전남 완도시');
insert into `User4` values ('A104', '강감찬', 'M', 25, '010-1234-4444', '서울시 관악구');
insert into `User4` values ('A105', '이순신', 'M', 25, '010-1234-5555', '부산시 진구');
insert into `User4` values ('A106', '신사임당', 'F', 32, NULL, '강릉시');
insert into `User4` values ('A107', '허난설현', 'F', 27, NULL, '경기도 광주시');

#실습 3-9
create table `User5` (
	`seq` int primary key auto_increment,
    `name` varchar(10) not null,
    `gender` char(1) check (`gender` in('M', 'F')),
    `age` int default 1 check (`age` > 0 and `age` < 100),
    `addr` varchar(20)
    );
select * from `User5`;

#실습 3-10
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', 25, '경남 김해시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', 23, '경남 경주시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', 35, '전남 완도시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('강감찬', 'M', 42, '서울시 관악구');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('이순신', 'M', 51, '부산시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('신사임당', 'F', 22, '강릉시');
