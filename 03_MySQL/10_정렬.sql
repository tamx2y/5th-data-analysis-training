# 사원의 번호와 급여를 가져온다.
# 급여를 기준으로 오름차순 정렬한다.

select emp_no, salary
from salaries 
order by salary asc;
# asc는 생략이 가능함

# 사원의 번호와 급여를 가져온다.
# 급여를 기준으로 내림차순 정렬한다.

select emp_no, salary
from salaries 
order by salary desc;

# 각 사원들의 사원번호와 현재 받는 급여액을 사원번호를 기준으로 내림차순 정렬하여 가져온다.
# 현재 받는 급여액은 to_date가 9999-01-01인 것이다. 
select emp_no, salary
from salaries
where to_date = '9999-01-01'
order by emp_no desc;

# 사원의 번호와 first_name을 가져온다.
# 이름을 기준으로 정렬한다
select emp_no, first_name
from employees
order by first_name asc;

select emp_no, first_name
from employees
order by first_name desc;

# 사원의 번호와 입사일을 가져온다.
# 입사일을 기준으로 정렬한다.
select emp_no, hire_date
from employees
order by hire_date;

# 정렬기준이 다수인 경우
# 사원번호를 기준으로 내림차순 정렬
# 급여액을 기준으로 오름차순 정렬
# 첫 번째 기준으로 정렬을 하고 
# 첫 번째 기준의 컬럼의 값이 같은 것끼리 그룹을 나눠서 그 그룹 안에서 각각 두번째 기준으로 정렬한다.

select *
from salaries
order by emp_no desc, salary asc ; 