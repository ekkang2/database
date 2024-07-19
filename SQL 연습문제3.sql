#날짜 : 2024/07/10
#이름 : 강은경
#내용 : SQL 연습문제3

#실습 3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on `College`.*to 'college'@'%';
flush privileges;

#실습 3-2
CREATE TABLE `Student` (
	`stdNo`		CHAR(8) PRIMARY KEY,
	`stdName`	VARCHAR(20) NOT NULL,
	`stdHp`		CHAR(13) NOT NULL,
	`stdYear`	int NOT NULL,
	`stdAddress` VARCHAR(100) default null
);

CREATE TABLE `Lecture` (
	`lecNo`		int PRIMARY KEY,
	`lecName`	VARCHAR(20) NOT NULL,
	`lecCredit`	int NOT NULL,
	`lecTime`	int NOT NULL,
	`lecClass` VARCHAR(10) default null
);

CREATE TABLE `Register` (
	`regStdNo`  CHAR(8) NOT NULL,
	`regLecNo`	INT NOT NULL,
	`regMidScore` int default NULL,
	`regFinalScore` int default NULL,
	`regTotalScore`	int default NULL,
	`regGrade` CHAR(1) default null
);

#실습 3-3
INSERT INTO `Student` VALUES ('20201016', '김유신', '010-1234-1001', 3, null);
INSERT INTO `Student` VALUES ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO `Lecture` VALUES (159, '인지행동심리학', 3, 40, '본304');
INSERT INTO `Lecture` VALUES (167, '운영체제론', 3, 25, '본605');
INSERT INTO `Lecture` VALUES (234, '중급 영문법', 3, 20, '본201');
INSERT INTO `Lecture` VALUES (239, '세법개론', 3, 40, '본204');
INSERT INTO `Lecture` VALUES (248, '빅데이터 개론', 3, 20, '본801');
INSERT INTO `Lecture` VALUES (253, '컴퓨팅사고와 코딩', 2, 10, '본802');
INSERT INTO `Lecture` VALUES (349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 234);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 248);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 253);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 239);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210216', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210326', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 167);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20220416', 349);

#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `Student`;

#실습 3-6
select * from `Register`; 

#실습 3-7
select * from `Student` where `stdYear` = 3;

#실습 3-8
select * from `Lecture` where `lecCredit` = 2;

#실습 3-9
set sql_safe_updates=0;
update `Register` 
   set `regMidScore`=36
     , `regFinalScore`=42 
 where `regStdNo` = '20201126' and `regLecNo` = 234;
update `Register` 
   set `regMidScore`=24
     , `regFinalScore`=62 
 where `regStdNo` = '20201016' and `regLecNo` = 248;
 update `Register` 
   set `regMidScore`=28
     , `regFinalScore`=40 
 where `regStdNo` = '20201016' and `regLecNo` = 253;
 update `Register` 
   set `regMidScore`=37
     , `regFinalScore`=57 
 where `regStdNo` = '20201126' and `regLecNo` = 239;
 update `Register` 
   set `regMidScore`=28
     , `regFinalScore`=68 
 where `regStdNo` = '20210216' and `regLecNo` = 349;
 update `Register` 
   set `regMidScore`=16
     , `regFinalScore`=65 
 where `regStdNo` = '20210326' and `regLecNo` = 349;
 update `Register` 
   set `regMidScore`=18
     , `regFinalScore`=38 
 where `regStdNo` = '20201016' and `regLecNo` = 167;
 update `Register` 
   set `regMidScore`=25
     , `regFinalScore`=58 
 where `regStdNo` = '20220416' and `regLecNo` = 349;
 
 select * from `Register`;
 
#실습 3-10 
update `Register` 
   set `regTotalScore` = `regMidScore` + `regFinalScore`,
	   `regGrade` = if(`regTotalScore` >= 90, 'A',
					if(`regTotalScore` >= 80, 'B',
					if(`regTotalScore` >= 70, 'C',
					if(`regTotalScore` >= 60, 'D', 'F'))));

select * from `Register`;

#실습 3-11
select * from `Register` order by `regTotalScore` desc;

#실습 3-12
select * from `Register` where `regLecNo` = 349 order by `regTotalScore` desc;

#실습 3-13
select * from `Lecture` where `lecTime` >= 30;

#실습 3-14
select `lecName`, `lecClass` from `Lecture`;

#실습 3-15
select `stdNo`, `stdName` from `Student`;

#실습 3-16
select * from `Student` where `stdAddress` is null;

#실습 3-17
select * from `Student` where `stdAddress` like '부산시%';

#실습 3-18
select * from `Student` as a 
 left outer join `Register` as b 
  on a.stdNo = b.regStdNo;
  
#실습 3-19 
select 
	`stdNo`, `stdName`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
 from `Student` as a, `Register` as b where a.stdNo = b.regStdNo;

#실습 3-20 
select `stdName`, `stdNo`, `regLecNo`
  from `Student` as a
  join `Register` as b 
  on a.stdNo = b.regStdNo
  where `regLecNo` = 349;
  
#실습 3-21 
select `stdNo`,
	   `stdName`,
       count(`stdNo`) as `수강신청 건수`,
       sum(`regTotalScore`) as `종합점수`,
       sum(`regTotalScore`) / count(`stdNo`) as `평균`
  from `Student` as a
  join `Register` as b
  on a.stdNo = b.regStdNo
  group by `stdNo`;
  
#실습 3-22
select * from `Register` as a
join `Lecture` as b 
 on b.lecNo = a.regLecNo;
 
#실습 3-23
select
	`regStdNo`,
    `regLecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Register` a
join `Lecture` as b
  on b.lecNo = a.regLecNo;
  
#실습 3-24
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `Register` as a join `Lecture` as b 
 on b.lecNo = a.regLecNo
 where `lecName` = '사회복지 마케팅';
 
#실습 3-25
select 
	`regStdNo`,
    `lecName`
from `Register` as a join `Lecture` as b on b.lecNo = a.regLecNo
where `regGrade` = 'A';

#실습 3-26
select * from `Student` as a
 join `Register` as b on b.regStdNo = a.stdNo
 join `Lecture` as c on c.lecNo = b.regLecNo;
 
#실습 3-27
select
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
 join `Register` as b on b.regStdNo = a.stdNo
 join `Lecture` as c on c.lecNo = b.regLecNo
order by `regTotalScore` desc;

#실습 3-28
select 
	`stdNo`,
    `stdName`,
    `lecName`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
 join `Register` as b on b.regStdNo = a.stdNo
 join `Lecture` as c on c.lecNo = b.regLecNo
 order by `regGrade` desc limit 1;

#실습 3-29
select
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as `이수학점`
from `Student` as a
join `Register` as b on b.regStdNo = a.stdNo
join `Lecture` as c on c.lecNo = b.regLecNo
where b.`regGrade` <> 'F'
 group by `stdNo`;
 
 select
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as `이수학점`
from `Student` as a
join `Register` as b on b.regStdNo = a.stdNo
join `Lecture` as c on c.lecNo = b.regLecNo
where b.`regGrade`  not IN ('F')
 group by `stdNo`;
 
#실습 3-30
select
	`stdNo`,
    `stdName`,
    group_concat(`lecName`) as `신청과목`,
    group_concat(if(`regTotalScore` >= 60, `lecName`, null)) as `이수과목`
from `Student` AS a
join `Register` as b on b.regStdNo = a.stdNo
join `Lecture` as c on c.lecNo = b.regLecNo
group by `stdNo`;

