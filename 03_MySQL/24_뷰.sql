create table test_table1000(
data1 int,
data2 int not null,
constraint pk1 primary key (data1)
);

create table test_table2000(
data1 int not null,
data3 int not null,
constraint fk1 foreign key (data1) references test_table1000(data1)
);

insert into test_table1000(data1, data2) values (1, 10);
insert into test_table1000(data1, data2) values (2, 20);
insert into test_table1000(data1, data2) values (3, 30);

select * from test_table1000;

insert into test_table2000(data1, data3) values (1, 100);
insert into test_table2000(data1, data3) values (2, 200);
insert into test_table2000(data1, data3) values (3, 300);

select * from test_table2000;

select a1.data1, a1.data2, a2.data3
from test_table1000 a1, test_table2000 a2
where a1.data1 = a2.data1;

# 가상테이블 View를 생성한다.
# select를 통해서 가져온 결과를 저장해두는 것이 아닌
# View를 만들기 위해서 작성한 select 쿼리문을 저장한다.
# 즉 select를 통해 view의 가져오는 것은
# view를 만들때 사용한 쿼리문을 수행해서 그 결과를 가져오는 것이다.
create view test_view1
as
select a1.data1, a1.data2, a2.data3
from test_table1000 a1, test_table2000 a2
where a1.data1 = a2.data1;

select * from test_view1;

# with : 복잡한 쿼리를 따로 빼서 만들어 사용하는 개념
# 단, with는 물리적으로 저장되지 않고
# with를 사용하는 select문을 바로 작성해줘야 한다.
# 그리고 with로 만든 요소는 두 번다시 사용할 수 없다.
with test_with as (
    select a1.data1, a1.data2, a2.data3
    from test_table1000 a1, test_table2000 a2
    where a1.data1 = a2.data1
)
select * from test_with;