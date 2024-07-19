#날짜 : 2024/07/05
#이름 : 강은경
#내용 : 5장 데이터베이스 개체 

#실습 5-1 인덱스 조회 
SHOW INDEX FROM `User1`;  # pk 지정안해서 index 없음 
show index from `User2`;  # 기본기 출력 
show index from `User3`;  # 기본키와 고유키가 나옴 

#실습 5-2 인덱스 생성 및 적용
create index `idx_user1_uid` on `User1`(`uid`);
analyze table `User1`;

select * from `User5`;
# select 한 크기만큼 insert
insert into `User5` (`name`, `gender`, `age`, `addr`) select `name`, `gender`, `age`, `addr` from `User5`;

update `User5` set `name` = '홍길동' where `seq` = 3;
update `User5` set `name` = '정약용' where `seq` = 1000000;

select count(*) from `User5`;
select * from `User5` where `name`='정약용';
select * from `User5` where `name`='홍길동';

# 인덱스 생성 시 데이터가 빠르게 조회 됨 
create index `idx_user5_name` on `User5` (`name`);
analyze table `User5`;

#실습 5-4 뷰 생성
create view `vw_user1` as (select `name`, `hp`, `age` from `User1`);
create view `vw_user4_age_under30` as (select * from `User4` where `age` < 30);
create view `vw_member_with_sales` as (
	select
		a.`uid` as `직원아이디`,
        b.`name` as `직원이름`,
        b.`pos` as `직급`,
        c.`name` as `부서명`,
        a.`year` as `매출년도`,
        a.`month` as `월`,
        a.`sale` as `매출액`
	from `Sales` as a
    join `Member` as b on a.uid = b.uid
    join `Department` as c on b.dep = c.depNo
    );

#실습 5-5 뷰 조회
select * from `vw_user1`;
select * from `vw_user4_age_under30`;

#실습 5-6 뷰 삭제
drop view `vw_user1`;

#실습 5-7 프로시저 생성 및 실행 기본
DELIMITER $$
	create procedure proc_test1()
    begin
		select * from `Member`;
        select * from `Department`;
	end $$
	DELIMITER ;
  
call proc_test1();
  
#실습 5-8 매개변수를 갖는 프로시저 생성 및 실행
DELIMITER $$
	create procedure proc_test2(IN _userName VARCHAR(10))
    BEGIN
		select * from `Member` where `name` = _userName;
	end $$
	DELIMITER ;

CALL proc_test2('김유신');

DELIMITER $$
	create procedure proc_test3(in _pos varchar(10), in _dep tinyint)
    begin
		select * from `Member` where `pos` = _pos and `dep` = _dep;
	end $$
	DELIMITER ;

call proc_test3('차장', 101);

DELIMITER $$
	create procedure proc_test4(in _pos varchar(10), out _count int)
    begin
		select count(*) into _count from `Member` where `pos` = _pos ;
	end $$
    DELIMITER ;

call proc_test4('대리', @_count);
select concat('_count : ', @_count);

#실습 5-9 프로시저 프로그래밍
DELIMITER $$
	create procedure proc_test5(in _name varchar(10))
    begin
		declare userId varchar(10);
		select `uid` into userId from `Member` where `name` = _name;
		select * from `Sales` where `uid` = userId;
	end $$
    DELIMITER ;
    
call proc_test5('김유신');

DELIMITER $$
	create procedure proc_test6()
    begin
		declare num1 int;
		declare num2 int;
        
		set num1 = 1;
        set num2 = 2;
        
        if (num1 > num2) then
			select 'NUM1이 NUM2보다 크다.' as `결과2`;
		else
			select 'NUM1이 NUM2보다 작다.' as `결과2`;
		end if;
	end $$
    DELIMITER ;

call proc_test6();

DELIMITER $$
	create procedure proc_test7()
    begin
		declare sum int;
		declare num int;
        
		set sum = 0;
        set num = 1;
        
       while (num <= 10) do
		set sum = sum + num;
        set num = num + 1;
	   end while;
       
       select sum as '1부터 10까지 합계';
	end $$
    DELIMITER ;

call proc_test7();

#실습 5-10 커서를 활용하는 프로시저
DELIMITER $$
	create procedure proc_test8()
    BEGIN
		# 변수 선언
        declare total int default 0;
        declare price int;
        declare endOfRow boolean default false;
        
        # 커서 선언(데이터를 가리키는 포인터)
        declare salesCursor cursor for
			select `sale` from `Sales`;
            
		# 반복 조건
        declare continue handler
			for not found set endOfRow = true;
            
		# 커서 열기
        open salesCursor;
        
        cursor_loop: LOOP
			FETCH salesCursor INTO price;
            
            IF endOfRow THEN
				LEAVE cursor_loop;
			end if;
            
            set total = total + price;
		END LOOP;
        
        select total as '전체 합계';
        
        close salesCursor;
	end $$
	DELIMITER ;
    
    call proc_test8();

#실습 5-11 저장 함수 생성 및 호출
SET GLOBAL  log_bin_trust_function_creators=ON;

DELIMITER $$
	create function func_test1(_userid varchar(10)) returns int
    begin
		declare total int;
		select sum(`sale`) into total from `Sales` where `uid` = _userid;
		return total;
	end $$
    DELIMITER ;

select func_test1('a101');

DELIMITER $$
	create function func_test2(_sale int) returns double
    begin
		declare bonus double;
        
        if(_sale >= 100000) then
			set bonus = _sale * 0.1;
		else
			set bonus = _sale * 0.05;
		end if;
	
    return bonus;
    end $$
    DELIMITER ;
    
select
	`uid`,
    `year`,
    `month`,
    `sale`,
    func_test2(`sale`) as `bonus`
from `Sale`;


