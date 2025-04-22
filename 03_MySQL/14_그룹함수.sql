# 그룹 함수
# select문을 수행해서 가져온 결과를 정해준 기준으로 그룹으로 나눈다.
# 그 후에 각 그룹별로 값을 구하는 함수들

-- 사원의 수를 구한다.
select *
from employees;

# count : 가져온 데이터의 총 행의 개수를 구해준다.
# 만약 컬럼을 지정했다면 컬럼 내의 null(=의미가 없는 값 or 무한대)값을 제외하고 가져온다. 
select count(*)
from employees;

-- 남자 사원의 수를 구한다.
select *
from employees
where gender = 'M';

select count(*)
from employees
where gender = 'M'; 

-- 현재 d005 부서에 근무하고 있는 사원들의 수를 구한다.
select *
from dept_emp
where dept_no = 'd005' and to_date = '9999-01-01';

select count(*)
from dept_emp
where dept_no = 'd005' and to_date = '9999-01-01';

-- 현재 받고 있는 급여의 총합을 구한다.
select salary
from salaries
where to_date = '9999-01-01';

# sum : 지정된 컬럼의 값에서 null을 제외한 총합을 구한다. 
select sum(salary)
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 평균을 구한다.
# avg : 지정된 컬럼의 값에서 null을 제외한 평균을 구한다.
select avg(salary)
from salaries
where to_date = '9999-01-01';

# 만약 null을 포함해 평균을 구하고 싶다면
select avg(ifnull(salary, 0))
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 최대 급여액을 구한다.
# max : 지정된 컬럼의 값에서 null(<-정렬부분에서는 음수 무한대를 의미)을 제외한 최대값을 구한다.
select max(salary)
from salaries
where to_date = '9999-01-01';

-- 현재 받고 있는 급여의 최저 급여액을 구한다.
# min : 지정된 컬럼의 값에서 최소값을 구한다.
select min(salary)
from salaries
where to_date = '9999-01-01';

