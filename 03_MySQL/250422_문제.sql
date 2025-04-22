# d001 부서에 근무하고 있는 사원들의 수를 구하세요.
# 결과는 다음과 같이 나온다.
# 현재 d001 부서에 근무하고 있는 사원의 수는 000명입니다.
select *
from dept_emp
where dept_no = 'd001' and to_date = '9999-01-01';

select concat('현재 ', dept_no, '부서에 근무하고 있는 사원의 수는 ', count(*), '명 입니다')
from dept_emp
where dept_no = 'd001' and to_date = '9999-01-01';

# 현재 d003 부서에 근무하고 있는 사원들 중에 1990년 01월 01일 이후부터 
# 근무하기 시작한 사원들의 수를 구하세요.
select *
from dept_emp
where dept_no = 'd003' and from_date >= '1990-01-01' and to_date = '9999-01-01'
order by from_date; 

select count(*)
from dept_emp
where dept_no = 'd003' and from_date >= '1990-01-01' and to_date = '9999-01-01';

# 과거부터 현재까지 d004 부서의 매니저를 했던 사람의 수를 구하세요.
select *
from dept_manager
where dept_no = 'd004';

select count(*)
from dept_manager
where dept_no = 'd004';

# 성별이 남자인 사원들의 수를 구하세요.
select *
from employees
where gender = 'm' ; 

select count(*)
from employees
where gender = 'm' ; 

# 성별이 여자인 사원들의 수를 구하세요.
select *
from employees
where gender = 'f' ; 

select count(*)
from employees
where gender = 'f' ; 

# first_name이 Georgi에 해당하는 사원들 중 성별이 여자인 사원의 수를 구하세요. 
select *
from employees
where first_name = 'Georgi' and gender = 'f' ; 

select count(*)
from employees
where first_name = 'Georgi' and gender = 'f' ; 

# 현재 받고 있는 급여 중 최고액과 최저액의 차이를 구하세요. 
select max(salary) - min(salary)
from salaries
where to_date = '9999-01-01';

# 현재 받고 있는 급여 중 70,000 이상을 받는 사람들의 평균 급여를 구하세요.
select *
from salaries
where salary >= 70000
order by salary;

select avg(salary)
from salaries
where salary >= 70000;

# 만약 salary 컬럼에 null이 있을 경우 그냥 avg를 하면 null은 빼고 나머지를 가지고 평균을 구한다.
# 만약 평균을 구하는데 참여할 거라면 null을 0으로 바꾼 결과를 통해 평균을 구해야 한다. 

select avg(ifnull(salary,0))
from salaries
where salary >= 70000;

# 현재 받고 있는 급여 중 2001년 01월 01일부터 받기 시작한 급여의 평균을 구하세요. 
select avg(salary)
from salaries
where from_date >= '2001-01-01' and to_date = '9999-01-01'; 

