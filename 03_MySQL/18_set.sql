# 합집합
# union : 중복된 부분은 하나만 가져온다.
# union all : 중복된 것들도 모두 포함한다.

select emp_no from titles where title = 'Senior Staff' and emp_no in (10005, 10007, 10013, 10002)
union
select emp_no from titles where title = 'Staff' and emp_no in (10005, 10007, 10013, 10002);

select emp_no from titles where title = 'Senior Staff' and emp_no in (10005, 10007, 10013, 10002)
union all
select emp_no from titles where title = 'Staff' and emp_no in (10005, 10007, 10013, 10002);

# 교집합
select a1.emp_no
from titles a1, titles a2
where a1.emp_no = a2.emp_no and a1.title = 'senior staff' and a2.title = 'staff' 
and a1.emp_no in (10005, 10007, 10013, 10002) and a2.emp_no in (10005, 10007, 10013, 10002);

# 차집합
select emp_no
from titles
where title = 'senior staff' and emp_no in(10005, 10007, 10013, 10002)
and emp_no not in(
				  select emp_no
				  from titles
				  where title = 'staff' and emp_no in(10005, 10007, 10013, 10002)
);
 