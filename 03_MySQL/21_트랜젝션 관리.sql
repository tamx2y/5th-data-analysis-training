# 트랜젝션
# 데이터베이스에서 데이터 처리의 한 단위
# 물리적인 디스크에 데이터가 실제로 반영된 후부터 다음에 반영될 때까지의 작업을 의미함.
# mySQL과 같은 다양한 DBMS들은 개발자가 테이블 내의 데이터에 대해 무언가를 작업하면 실제로 물리적인 디스크에 반영되지 않는다.
# 이는 개발자가 실수로 데이터에 문제를 발생시켰을 경우를 대비하기 위함이다. 

# 테스트용 테이블 생성
use test_db;

drop table test_table20;

create table test_table20(
data1 int, 
data2 double,
data3 char(100)
);

desc test_table10;

insert into test_table20 (data1, data2, data3) values (100, 11.11, '문자열1');
insert into test_table20 (data1, data2, data3) values (200, 21.11, '문자열2');
insert into test_table20 (data1, data2, data3) values (300, 31.11, '문자열3');
insert into test_table20 (data1, data2, data3) values (400, 41.11, '문자열4');
insert into test_table20 (data1, data2, data3) values (500, 51.11, '문자열5');

select * from test_table20;

# 되돌리기 
rollback;
select * from test_table20;

# 데이터 수정
update test_table20
set data2 = 88.88, data3 = '문자열100' 
where data1 = 100;

update test_table20
set data2 = 99.99, data3 = '문자열200' 
where data1 = 200;

select * from test_table20;

# 되돌린다. 
rollback;

select * from test_table20;