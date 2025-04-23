### 1. 
# 현재 매니저로 근무하고 있는 사원들의 사원 번호, 이름, 근무 부서 이름, 직함을 가져온다.
select 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    d.dept_name, 
    t.title
from dept_manager dm
join employees e on dm.emp_no = e.emp_no
join departments d on dm.dept_no = d.dept_no
join titles t on e.emp_no = t.emp_no
where dm.to_date = '9999-01-01' and title = 'manager' ;

# Development 부서에 근무하고 있는 사원들 중 
# 급여가 60000 이상인 사원들의 사원번호와 급여를 가져온다.
select a1.emp_no, a1.salary, a3.dept_name
from salaries a1, dept_emp a2, departments a3
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no
	  and dept_name = 'Development' and salary >= 60000;

### 2. 
# 현재 매니저로 근무하고 있는 사원들 중 
# 현재 매니저 사원의 급여 평균보다 더 많은 급여를 받는 매니저 사원의 
# 사원번호, first_name, 근무 부서명 , 급여를 가져온다.
select 
    e.emp_no, 
    e.first_name, 
    d.dept_name, 
    s.salary
from employees e 
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
join salaries s on e.emp_no = s.emp_no
where dm.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
  and s.salary > (
      select avg(s2.salary)
      from dept_manager dm2
      join salaries s2 on dm2.emp_no = s2.emp_no
      where dm2.to_date = '9999-01-01'
        and s2.to_date = '9999-01-01'
  );

### 3. 
# 현재 매니저 사원의 급여 평균
select avg(s.salary)
from dept_manager dm, salaries s
where dm.emp_no = s.emp_no;


### 4. 
# 1991-01-01 이후에 고용된 사원들 중 
# 현재 매니저로 근무하고 있는 사원들과 같은 부서에 근무하고 있는 사원들의 
# 사원이름, 사원번호를 가져온다.
select e.first_name, e.last_name, e.emp_no
from employees e
join dept_manager dm
on e.emp_no = dm.emp_no
where e.hire_date >= '1991-01-01' 
	and dm.to_date = '9999-01-01';

### 5. 
# 남자 사원들의 평균 급여보다 급여평균이 더 많은 
# 부서들의 이름과 급여 평균을 가져온다 (현재 급여만으로 해주세요)
select d.dept_name, avg(s.salary) as avg_salary
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
group by d.dept_name
having avg(s.salary) > (
    select avg(s2.salary)
    from employees e2
    join salaries s2 on e2.emp_no = s2.emp_no
    where e2.gender = 'M' and s2.to_date = '9999-01-01'
);


