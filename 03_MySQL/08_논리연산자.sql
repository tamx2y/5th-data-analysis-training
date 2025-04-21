# d001 부서의 매니저 중에 1990년 이후부터 매니저인 사원의 
# 사원번호, 부서번호, 매니저 시작 날짜를 가져온다.
select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01' ; 

# 1990년 이후에 입사한 남자 사원의 사원번호, 성별, 입사일을 가져온다.
select emp_no, gender, hire_date
from employees 
where hire_date >= '1990-01-01' and gender = 'M' ;

# 1990년 이후부터 60000 이상의 급여를 받는 사원의 
# 사원번호, 급여, 급여 수령 시작 날짜를 가져온다.
select emp_no, salary, from_date
from salaries
where from_date >= '1990-01-01' and salary >= 60000 ; 

# d001 부서와 d002 부서 매니저의 사원 번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002' ; 

# 직함이 Staff인 사원과 Engineer인 사원의 사원번호, 직함을 가져온다.
select emp_no, title
from titles 
where title = 'Staff' or title = 'Engineer' ; 

# d003 부서의 매니저가 아닌 매니저의 사원번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_manager
where dept_no <> 'd003' ;

# 급여가 60000이상 70000이하인 사원의 사원번호, 급여를 가져온다.
select emp_no, salary
from salaries
where salary between 60000 and 70000 ; 

# d001부서와 d002부서 매니저의 사원번호, 부서 번호를 가져온다 (in 사용)
select emp_no, dept_no
from dept_manager
where dept_no in ('d001', 'd002') ;   

# d001부서와 d002부서가 아닌 매니저의 사원번호, 부서 번호를 가져온다.
select emp_no, dept_no
from dept_manager
where dept_no not in ('d001', 'd002') ;   

# 사원들의 사원번호와 급여액을 가져온다. 급여액은 1988년에 받는 급여이다.
select emp_no, salary
from salaries
# where from_date between '1988-01-01' and '1988-12-31' ;
where from_date >= '1988-01-01' and to_date <= '1988-12-31' ;

# 매니저의 사원번호와 매니저 시작일자를 가져온다. 근무 시작일이 1985년인 매니저 사원들의 정보만 가져온다.
select emp_no, from_date
from dept_manager 
where from_date between '1985-01-01' and '1985-12-31' ; 

# 직함이 Senior Engineer, Staff이거나 Engineer인 사원들의 사원번호와 직함을 가져온다.  
select emp_no, title
from titles
where title in ('Senior Engineer', 'Staff', 'Engineer'); 
