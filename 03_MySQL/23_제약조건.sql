# 테스트용 데이터 베이스 생성
create database test_db2;

use test_db2;


# not null 제약조건
# 컬럼에 저장되는 데이터는 null을 허용하지 않겠다는 의미
# 즉 행을 추가할 때 반드시 값을 정해줘야 한다.
create table test_table10(
data1 int,
data2 int not null
);

# 모든 컬럼에 값을 지정했다.
insert into test_table10 (data1, data2) values (100, 200);
select * from test_table10;

# not null은 컬럼에는 값을 지정해주었고 not null이 아닌 컬럼은 생략했다.
# 이 때, 생략한 컬럼은 null을 저장하려고 한다.
insert into test_table10 (data2) value (201);
select * from test_table10;

# not null이 설정되어 있는 컬럼에 null을 저장하려고 한다
# (컬럼명을 생략하거나 저장될 값을 null로 지정한 경우)
insert into test_table10(data1, data2) value(102, null);
insert into test_table10(data1) values (103);

# primary key : 중복을 허용하지 않고 null을 허용하지 않는다.
# 각 행들을 구분하기 위한 유일한 값을 저장할 때 사용한다.
# 또한, 각 행들을 구분하기 위한 유일한 값을 저장한다는 특징 때문에
# 조건절에 자주 등장하는 컬럼이다. 이에, 빠르게 검색을 하기 위해
# DBMS 자체적으로 indexing 작업을 수행해준다.
# constraint 키이름 primary key(컬럼이름)
create table test_table20(
data1 int,
data2 int not null,
constraint pk1 primary key(data1)
);

insert into test_table20 (data1, data2) values (100, 200);
select * from test_table20;

# pk 컬럼에 중복되지 않는 데이터를 저장
insert into test_table20 (data1, data2) values (101, 201);
select * from test_table20;

# pk 컬럼에 중복된 데이터를 저장 (오류)
insert into test_table20 (data1, data2) values (100, 200);

# pk 컬럼에 null 을 저장 (null을 지정하였거나 생략했을 경우)
insert into test_table20 (data1, data2) values (null, 202);
insert into test_table20 (data2) values (203);

# Foreign key : 다른 테이블 혹은 같은 테이블에 있는 PK 컬럼을 참조하는
# 제약조건이다. 참조하는 컬럼에 있는 값만 저장이 가능하며 null 을 허용한다.
# constraint 이름 foreign key(컬럼명) references 테이블명(참조할컬럼명)
create table test_table30(
value1 int,
value2 int,
constraint pk2 primary key(value1),
constraint fk2 foreign key(value2) references test_table20(data1)
);

# test_table20의 data1 컬럼에 저장되어 있는 값을 지정하여 저장한다.
insert into test_table30 (value1, value2) values (1, 100);
select * from test_table30;

# test_table20의 data1 컬럼에 저장되어 있지 않는 값을 지정하여 저장한다.
insert into test_table30 (value1, value2) values (2, 200);

# test_table29의 data1을 참조하는 컬럼에 null 값을 저장한다.
insert into test_table30 (value1, value2) values (3, null);
insert into test_table30 (value1) values (4);
select * from test_table30;

# unique : 중복된 데이터를 허용하지 않지만 null은 중복을 허용한다.
create table test_table40(
data1 int,
data2 int not null,
constraint uq1 unique(data1),
constraint uq2 unique(data2)
);

insert into test_table40 (data1, data2) values (100, 200);
select * from test_table40;

# unique 컬럼에 중복되지 않는 데이터를 저장한다.
insert into test_table40 (data1, data2) values (101, 201);
select * from test_table40;

# 중복된 데이터를 저장해본다.
insert into test_table40 (data1, data2) values (100, 202);
insert into test_table40 (data1, data2) values (102, 200);

# unique는 null을 허용한다. 허나 not null 이 있는 unique에 관계없이 null을
# 허용하지 않는다. 이에 null을 허용하지 않고 중복되지 않게 하겠다면
# unique와 not null 둘 다 지정해주면 된다. 허나 primary key 다른 점은
# dbms 자체적으로 검색 속도를 빠르게 하기 위한 indexing 작업은 primary key 컬럼에만
# 자동 지정된다. 만약 다른 컬럼에서 하고 싶다면 직접 설정해줘야 한다(비추)
insert into test_table40 (data1, data2) values (null, 203);
insert into test_table40 (data1, data2) values (null, 204);

select * from test_table40;

insert into test_table40 (data1, data2) values (105, null);

# check 제약 조건
# 컬럼에 들어갈 값의 범위나 종류를 지정한다.
create table test_table50(
data1 int not null,
data2 int not null,
constraint chk1 check (data1 > 10),
constraint chk2 check (data2 in(10, 20, 30))
);

insert into test_table50 (data1, data2) values (20, 30);
select * from test_table50;

insert into test_table50 (data1, data2) values (1, 100);
select * from test_table50;

# default : 컬럼을 생략하고 insert 할 때 null 대신에 들어갈 값을 지정한다.
create table test_table60(
data1 int not null default 1,
data2 int not null default 10
);

insert into test_table60 (data1, data2) values (100, 200);
select * from test_table60;

insert into test_table60 (data1, data2) values (null, null);
select * from test_table60;

insert into test_table60 (data1) values (1000);
insert into test_table60 (data2) values (2000);
select * from test_table60;