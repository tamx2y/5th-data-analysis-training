# first_name을 기준으로 그룹을 묶은 다음 사원의 수를 계산해본다.
select first_name, count(*)
from employees
group by first_name
order by first_name;

# first_name을 기준으로 그룹을 묶고 그 안에서 성별을 기준으로 그룹을 묶어 사원수를 계산한다.
select first_name, gender, count(*)
from employees
group by first_name, gender
order by first_name;

-- 사원의 수를 성별로 가져온다.
select gender, count(*)
from employees
group by gender;

-- 각 부서에 현재 근무하고 있는 사원들의 수를 가져온다.
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no;

-- 각 부서별 과거의 매니저의 수를 구한다.
select dept_no, count(*)
from dept_manager
where to_date <> '9999-01-01'
group by dept_no;

-- 급여 수령 시작일별 급여 총합을 구한다.
-- 급여 수령 시작일별 급여 평균을 구한다.
-- 급여 수령 시작일 별 급여 최고액을 구한다.
-- 급여 수령 시작일 별 급여 최저액을 구한다.

select from_date, sum(salary), avg(salary), max(salary), min(salary)
from salaries
group by from_date 
order by from_date; 

# 현재 사용중인 각 직함별 사원의 수를 가져온다. 
# 이 때, 3만명 이상인 직함만 가져온다. 
select title, count(*)
from titles
where to_date = '9999-01-01'
group by title 
having count(title) >= 30000 ;

# 10만명 이상이 사용하고 있는 직함의 이름과 직원의 수를 가져온다.
select title, count(*)
from titles
group by title
having count(*) >= 100000 ; 

# 5만명 이상 근무하고 있는 부서의 부서 번호와 부서 소속 사원의 수를 가져온다.
select dept_no, count(*)
from dept_emp
group by dept_no
having count(*) >= 50000 ; 
