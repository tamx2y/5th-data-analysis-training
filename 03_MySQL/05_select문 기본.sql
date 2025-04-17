# 사원들의 정보를 모두 가져온다.
# select : 무엇을 조회할 것인가?, 조회할 컬럼(열)을 지정함. 
# from : 어디에서 조회할 것인가? 데이터를 가져올 테이블의 이름을 명시함. 

select * # 전체 데이터를 확인하고 싶을 때 *을 사용함. 
from employees;

# 부서 정보를 모두 가져온다.
select *
from departments;

# 사원들의 직함정보를 모두 가져온다.
select *
from titles;

# 모든 사원의 사원번호, 사원이름1, 사원이름2를 모두 가져온다.
select emp_no, first_name, last_name 
from employees;

# 사원의 사원번호, 생년월일, 성별을 가져온다.
select emp_no, birth_date, gender
from employees;

# 부서의 부서번호, 부서 이름을 가져온다. 
select dept_no, dept_name
from departments;

# 각 사원의 사원번호, 급여액을 가져온다.
select emp_no, salary
from salaries;

# 각 사원의 사원번호, 직함 이름을 가져온다.
select emp_no, title
from titles;