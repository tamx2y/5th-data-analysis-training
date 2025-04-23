# 서브쿼리
# 쿼리문 안에 쿼리문을 작성하는 개념
# 쿼리문에 들어가야 할 값 등을 다른 쿼리문으로 구해야 할 때 사용한다.

-- select 사원번호, 급여액
-- from
-- where 현재 받는 급여의 평균보다 많은 급여를 받는다. 현재 받는 급여 
-- group by 없음
-- having 없음
-- order by 없음

# 현재 받는 급여의 평균이 얼마인지 모르므로 대충 아무값이나 정해서 쿼리문을 만든다. 
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > 
(select avg(salary)
from salaries
where to_date = '9999-01-01' ); #30000은 임의 지정

# 현재 받는 급여의 평균을 구하는 쿼리문을 작성한다. 
select avg(salary)
from salaries
where to_date = '9999-01-01'; 

-- 1960년대 이후에 태어난 사원들이 근무하는 사원들의 사원번호, 근무부서 번호를 가져온다.

#1
select emp_no, first_name
from employees
where emp_no = 10001;

#2
select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001';

# 1+2
select emp_no, first_name
from employees
where emp_no in (
select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001'
);

select a1.emp_no, a1.first_name
from employees a1, dept_emp a2
where a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01' and a2.dept_no = 'd001';

# 서브쿼리
# 쿼리문 안에 쿼리문 작성하는 개념
# 쿼리문에 들어가야 할 값 등을 다른 쿼리문으로 구해야 할 때 사용한다.

-- 현재 받는 급여의 평균보다 많이 받는 사원들의 사원번호, 급여액을 가져온다.
-- select 사원번호, 급여액
-- from
-- where 현재 받는 급여의 평균보다 많은 급여를 받는다. 현재 받는 급여 
-- group by 없음
-- having 없음
-- order by 없음

# 현재 받는 급여의 평균이 얼마인지 모르므로 대충 아무값이나 정해서 쿼리문을 만들어준다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > 30000;

# 현재 받는 급여의 평균을 구하는 쿼리문을 작성한다.
select avg(salary)
from salaries
where to_date = '9999-01-01';

# 첫 번째 쿼리문에 임의로 정한 값 부분을 그 값을 구하는 쿼리문으로 대체한다.
select emp_no, salary
from salaries
where to_date = '9999-01-01' and salary > (select avg(salary)
											from salaries
											where to_date = '9999-01-01');

-- d001부서에 근무하고 있는 사원들의 사원번호와 first_name을 가져온다.
-- select 사원 번호, first_name
-- from
-- where d001 부서에 근무하고 있는 사원들, 현재 근무하고 있는 사원들
-- group by 없음
-- having 없음
-- order by 없음

select emp_no, first_name
from employees
where emp_no = 10001;

select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001';

select emp_no, first_name
from employees
where emp_no in (select emp_no
				 from dept_emp
				 where to_date = '9999-01-01' and dept_no = 'd001');
                 
select a1.emp_no, a1.first_name
from employees a1, dept_emp a2
where a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01' and a2.dept_no='d001';

-- 1960년 이후에 태어난 사원들이 근무하고 사원들의 사원번호, 근무 부서 이름 가져온다.
-- select 사원번호, 근무 부서 이름
-- from
-- where 현재 근무하고 있는 부서, 1960년 이후에 태어난 사원들
-- group by 없음
-- having 없음
-- order by 없음

select a1.emp_no, a2.dept_name
from dept_emp a1, departments a2
where a1.dept_no = a2.dept_no and a1.to_date = '9999-01-01' and a1.emp_no = 10001;

select emp_no
from employees
where birth_date >= '1960-01-01';

select a1.emp_no, a2.dept_name
from dept_emp a1, departments a2
where a1.dept_no = a2.dept_no and a1.to_date = '9999-01-01' 
      and a1.emp_no in (select emp_no
						from employees
						where birth_date >= '1960-01-01');
                        
select a1.emp_no, a2.dept_name
from dept_emp a1, departments a2, employees a3
where a1.dept_no = a2.dept_no and a1.emp_no = a3.emp_no and
	  a1.to_date = '9999-01-01' and a3.birth_date >= '1960-01-01';
