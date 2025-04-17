# 각 사원의 급여를 10% 인상된 금액을 가져온다.
select emp_no, salary, salary * 0.1, salary * 1.1
from salaries;

# 각 사원의 급여를 10% 인하된 금액을 가져온다.
select emp_no, salary, salary * 0.1, salary * 0.9
from salaries;

# 숫자 컬럼이 아닌 컬럼을 연산하면 결과는 0이 나온다.
select first_name + last_name
from employees;

# distinct : 중복제거
# 사원들이 근무 중에 있는 모든 부서의 번호를 중복되지 않게 가져온다. 
select distinct dept_no
from dept_emp;

# 각 사원들의 직함을 중복되지 않게 가져온다.
select distinct title
from titles;