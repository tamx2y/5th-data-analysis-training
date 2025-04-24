create table test_table300(
data1 int,
data2 double,
data3 char(100)
);

insert into test_table300 (data1, data2, data3) values (100, 11.11, '문자열1');
insert into test_table300 (data1, data2, data3) values (200, 21.11, '문자열2');
insert into test_table300 (data1, data2, data3) values (300, 31.11, '문자열3');
insert into test_table300 (data1, data2, data3) values (400, 41.11, '문자열4');
insert into test_table300 (data1, data2, data3) values (500, 51.11, '문자열5');

select * from test_table300;

# 테이블의 이름 변경
# rename table 테이블명 to 새로운이름

show tables;

rename table test_table300 to test_table400;

show tables;

# 컬럼의 데이터 타입 변경
# 주의!! 저장되어 있는 데이터에 따라서 변경이 불가능하거나 데이터의 유실이 
# 발생할 수 있다.
desc test_table400;

alter table test_table400 modify data3 char(200);

desc test_table400;

# 컬럼의 이름을 변경한다. 이 때, 데이터 타입도 같이 변경이 가능하다.
desc test_table400;

alter table test_table400 change data3 data30 char(255); 

desc test_table400;

# 컬럼을 추가한다.
desc test_table400;

alter table test_table400 add data4 varchar(200);

desc test_table400;

# 컬럼을 제거한다.
# 주의!! 컬럼내의 데이터가 모두 제거된다.
desc test_table400;

alter table test_table400 drop data4;

desc test_table400;

# 테이블 제거
# 주의!! 테이블 내의 데이터는 모두 삭제된다.
show tables;

drop table test_table400;

show tables;

# 데이터 베이스 삭제
# 주의!! 데이터베이스 내의 모든 테이블이 삭제된다.
drop database test_db;

# 삭제 하신 후 Navigtor의 schemas 에서 새로고침 해주세요

