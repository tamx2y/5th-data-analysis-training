### 1. 
-- select 사원번호, first_name, 근무 부서 이름, 직함
-- from
-- where 현재 매니저로 근무하고 있는 사원
-- group by 없음
-- having 없음
-- order by 없음

select a1.emp_no, a1.first_name, a4.dept_name, a2.title
from employees a1, titles a2, dept_emp a3, departments a4
where a1.emp_no = a2.emp_no and a1.emp_no = a3.emp_no and a3.dept_no = a4.dept_no
      and a1.emp_no = 10001 and a3.to_date = '9999-01-01' and a2.to_date = '9999-01-01';


select emp_no
from dept_manager
where to_date = '9999-01-01';

select a1.emp_no, a1.first_name, a4.dept_name, a2.title
from employees a1, titles a2, dept_emp a3, departments a4
where a1.emp_no = a2.emp_no and a1.emp_no = a3.emp_no and a3.dept_no = a4.dept_no
      and a1.emp_no in (select emp_no
                        from dept_manager
                        where to_date = '9999-01-01') 
      and a3.to_date = '9999-01-01'
      and a2.to_date = '9999-01-01';



### 2. 
-- select 사원번호, 급여
-- from
-- where 현재 Development 에 근무하고 있다 and 급여가 60000이상이다
-- group by 없음
-- having 없음
-- order by 없음

select emp_no, salary
from salaries
where to_date = '9999-01-01' and emp_no = 10001 and salary >= 60000;

select emp_no
from dept_emp
where to_date = '9999-01-01' and dept_no = 'd001';

select dept_no
from departments
where dept_name = 'Development';

select emp_no, salary
from salaries
where to_date = '9999-01-01'   # 현재 받는 급여의 조건
      and emp_no in (select emp_no     # 현재 Development 부서에 근무하고 있는 사원들의
                     from dept_emp     # 사원 번호를 가져온다
                     where to_date = '9999-01-01' 
                           and dept_no = (select dept_no  # Development 부서의 부서 번호를 가져온다
                                          from departments
                                          where dept_name = 'Development')
                    ) 
and salary >= 60000;    # 60000 이상 급여 조건

select a1.emp_no, a1.salary
from salaries a1, dept_emp a2, departments a3
where a1.emp_no = a2.emp_no and a2.dept_no = a3.dept_no # 조인 조건
      and a1.to_date = '9999-01-01' # 현재 받는 급여 조건
      and a2.to_date = '9999-01-01' # 현재 근부하고 있는 조건
      and a3.dept_name = 'Development'  # Development 부서에 근무하고 있는 조건
      and a1.salary >= 60000; # 급여가 60000 이상인 조건
      
     
     
### 3. 
-- select 매니저 사원의 사원번호, first_name, 근무 부서명, 급여
-- from
-- where 현재 매니저로 근무하고 있다 and 매니저 사원의 급여 평균보다 급여를 많이 받는다
-- group by 없음
-- having 없음 
-- order by 없음

select a1.emp_no, a2.first_name, a3.dept_name, a4.salary
from dept_manager a1, employees a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a1.dept_no = a3.dept_no # 조인 조건
      and a1.emp_no = a4.emp_no
      and a1.to_date = '9999-01-01' # 현재 매니저인 사원 조건
      and a4.to_date = '9999-01-01' # 현재 받는 급여 조건
      and a4.salary > 60000;        # 현재 받고 있는 매니저 사원의 평균 급여보다 많이 받는다 조건
      
select avg(salary)
from dept_manager b1, salaries b2
where b1.emp_no = b2.emp_no
      and b1.to_date = '9999-01-01'
      and b2.to_date = '9999-01-01';
      
select a1.emp_no, a2.first_name, a3.dept_name, a4.salary
from dept_manager a1, employees a2, departments a3, salaries a4
where a1.emp_no = a2.emp_no and a1.dept_no = a3.dept_no # 조인 조건
      and a1.emp_no = a4.emp_no
      and a1.to_date = '9999-01-01' # 현재 매니저인 사원 조건
      and a4.to_date = '9999-01-01' # 현재 받는 급여 조건
      and a4.salary > (                # 매니저 사원들이 현재 받고 있는 급여의 평균보다 더 많이 받는 조건
            select avg(salary)        # 매니저 사원들이 현재 받고 있는 급여의 평균을 가져온다.
            from dept_manager b1, salaries b2
            where b1.emp_no = b2.emp_no
                  and b1.to_date = '9999-01-01'
                  and b2.to_date = '9999-01-01'
      );



 ### 3. 
-- select 사원의 이름, 사원번호
-- from 
-- where 1991-01-01 이후에 고용된 사원들 중 현재 매니저로 근무하고 있는 사원들과 같은 부서에 근무하고 있다
-- group by 없음
-- having 없음
-- order by 없음

select a1.first_name, a1.emp_no
from employees a1, dept_emp a2
where  a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01'
       and dept_no = 'd001';
       
select dept_no
from dept_manager
where to_date = '9999-01-01' and emp_no = 10001;

select emp_no
from employees
where hire_date >= '1991-01-01';

select a1.first_name, a1.emp_no
from employees a1, dept_emp a2
where  a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01'
       and a2.dept_no in (select dept_no
                         from dept_manager
                         where to_date = '9999-01-01' and emp_no in (select emp_no
                                                                     from employees
                                                                     where hire_date >= '1991-01-01')
                      );



### 4. 
-- select 부서의 이름, 평균 급여
-- from
-- where 현재 받는 급여
-- group by 부서이름
-- having 평균 급여가 남자 사원들의 평균 급여보다 많다
-- order by 없음

select a1.dept_name, a2.salary
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a2.to_date = '9999-01-01' and a3.to_date = '9999-01-01';


-- select 부서의 이름, 평균 급여
-- from
-- where 현재 받는 급여
-- group by 부서이름
-- having 평균 급여가 남자 사원들의 평균 급여보다 많다
-- order by 없음


select a1.dept_name, avg(a2.salary)
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a2.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
group by a1.dept_name
having avg(a2.salary) > 65000;

select avg(a2.salary)
from employees a1, salaries a2
where a1.emp_no = a2.emp_no and
      a2.to_date = '9999-01-01' and a1.gender = 'M';
      
select a1.dept_name, avg(a2.salary)
from departments a1, salaries a2, dept_emp a3
where a1.dept_no = a3.dept_no and a2.emp_no = a3.emp_no
      and a2.to_date = '9999-01-01' and a3.to_date = '9999-01-01'
group by a1.dept_name
having avg(a2.salary) > (select avg(b2.salary)
                        from employees b1, salaries b2
                        where b1.emp_no = b2.emp_no and
                              b2.to_date = '9999-01-01' and b1.gender = 'M');
      
      
      
# 각 부서의 현재 평균임금을 구하고, 현재 평균임금에 따라 내림차순으로 정렬하세요.
select 
    d.dept_name, 
    avg(s.salary) as avg_salary
from salaries s
join dept_emp de on s.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
where de.to_date = '9999-01-01' 
  and s.to_date = '9999-01-01'
group by d.dept_name
order by avg_salary desc;
