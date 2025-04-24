# test_db 사용 설정
use test_db; 

# test_table1 정보 조회
desc test_table1;

# 행을 추가한다
# insert into 테이블명
# (컬럼명1, 컬럼명2, 컬럼명3)
# values (값1, 값2, 값3)
# 앞에서부터 순서대로 매칭하여 각 컬럼의 값이 결정되고 행이 추가됨.

insert into test_table1
(data1, data2, data3)
values(100, '문자열1' , 11.11); 

select * from test_table1;

# 컬럼 이름 순서는 테이블을 생성할 때 지정한 컬럼의 순서와 상관이 없다.
# insert문 내에서 컬럼의 순서와 저장할 값의 순서만 맞춰주면 된다.

insert into test_table1
(data3, data1, data2)
values(22.22, 200, '문자열3'); 

select * from test_table1;

# 일부만 지정할 수 있다.
# 지정되지 않은 컬럼은 null 값이 저장된다. 
insert into test_table1
(data1, data2)
values (300, 33.33);

select * from test_table1;

# 만약 모든 컬럼에 대해 저장할 값을 지정한다면 컬럼목록은 생략할 수 있다. 
# 이 때 값의 순서는 테이블을 생성할 때 작성한 컬럼의 순서와 일치해야 한다. 
# desc 테이블명; 으로 순서를 확인해야 한다.

desc test_table1 ;

insert into test_table1
value (400, '문자열4', '44.44');

select * from test_table1;

# 만약 컬럼의 목록에 명시한 컬럼의 수와 저장할 데이터의 개수가 다르다면 (오류)
insert into test_table1
(data1, data2)
values(500, '문자열5', 55.55); 

# 컬럼의 데이터 타입과 다른 값이 지정될 경우(오류)
insert into test_table1
(data1, data2, data3)
values(600, 66.66, '문자열6');

# 숫자 컬럼에 숫자 양식으로 되어 있는 문자열로 지정하면 숫자로 변환되서 저장된다. (날짜도 마찬가지이다)
# 이는 데이터 베이스 제품군의 종류에 따라 혹은 버전에 따라 다를 수 있다.
insert into test_table1
(data1, data2, data3)
values ('700', '문자열7', '77.77');

select * from test_table1;

# 숫자형태로 되어 있지 않은 문자열을 지정하면 오류가 발생한다.
insert into test_table1
(data1, data2, data3)
values ('팔백', '문자열8', '팔십팔쩜팔팔');

# 서브쿼리를 통해서 데이터를 저장할 수 있다.

# 테이블을 위해 테이블의 구조를 복제한다.
create table test_table2
as
select * from test_table1 
where 1=0; 

select * from test_table2;

# test_table1의 data1이 300 이하인 행들을 가져와 test_table2애 저장한다.
insert into test_table2
(data1, data2, data3)
select *
from test_table1
where data1 <= 300;

select * from test_table2; 

# 수정
# update 테이블명
# set 컬럼명=값, 컬럼명=값, 컬럼명=값
# where 조건절
# where는 필수가 아니지만 필수라고 생각하세요~~

# 조건절 없이
create table test_table3
as
select * from test_table1;

select * from test_table3;

# workbench 설정 > SQL editor 클릭 > 우측 창에 저장되어 있는 safe update 체크를 해제해야 함.
update test_table3
set data1 = 1000, data3 = 99.99;
# option : rejects updates and deletes with no restriction

select * from test_table3;

# 조건절은 필수라고 생각해주세요.
update test_table1
set data1 = 1000, data3 = 99.99
where data2 = '문자열1';

select * from test_table1;

# 삭제 
# 삭제도 뇌 주름에 조건절이 있다고 생각해주세요..ㅎㅎ
# delete from 테이블명
# where 조건절 (조건에 만족하면 다 삭제해주세요라는 뜻)
delete from test_table3; 
select * from test_table3;

delete from test_table1
where data1 = 1000; # 행이 삭제되는 것

select * from test_table1;








