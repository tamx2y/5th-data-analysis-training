# DDL (데이터 정의어) : 데이터 베이스나 테이블에 대해 생성, 삭제, 수정 등의 작업을 하는 명령어이다.
# create, drop, alter, truncate 등등

# DML (데이터 조작어) : 테이블에 저장되어 있는 데이터를 가져오거나 추가, 수정, 삭제 등의 작업을 하는 명령어 
# select, insert, update, delete 등등

# DCL (데이터 제어어): 계정의 권한에 관련된 명령어나 트랜젝션 관리를 위한 명령어 등에 해당된다.
# grant, revoke, commit, rollback 등등..

# 데이터베이스 만들기
# 복습할 때는 이름을 변경해서 해주세요. 
create database test_db; 

# 만약 기본 캐릭터 셋이 utf8이 아니라면 데이터베이스 생성 시 설정해줘야 한다. 
create database test_db ; 
# character set = 'utf8'
# collate = 'utf8_general_ci';

# 데이터베이스 사용 설정
use test_db;

# 테이블 생성
create table test_table1(
data1 int(10),
data2 varchar(10),
data3 float(10, 2)
);

# 테이블 정보 조회
desc test_table1 ;
select * from test_table1;

use employees; 

# 현재 사원들이 받고 있는 급여들만 모아서 테이블 생성한다.
create table salaries_now
as
select emp_no, salary
from salaries
where to_date = '9999-01-01';

# 새로고침을 해야 볼 수 있음 (마우스 우클릭 > refresh all)
# 테이블을 만든다는 것은 물리적인 저장소를 차지하겠다는 것
select * from salaries_now;

# 만약 테이블의 구조만 복제하고 싶다면
# 서브쿼리의 조건에 모든 행에 대해서 거짓이 되는 조건을 설정해주면 된다. 
create table employees_temp
as
select emp_no, first_name, gender
from employees
where 1=0;

select * from employees_temp;




