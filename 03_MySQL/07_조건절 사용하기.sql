# d005 부서 매니저의 사원번호, 부서번호를 가져온다. 
select emp_no, dept_no
from dept_manager
where dept_no = 'd005';

# 급여가 150000 이상인 사원들의 사원 번호, 급여를 가져온다.
select emp_no, salary
from salaries
where salary >= 150000;

# 급여가 40000 이하인 사원들의 사원 번호, 급여를 가져온다.
select emp_no, salary
from salaries
where salary <= 40000;
