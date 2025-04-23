# join
# 다수의 테이블에 있는 데이터들을 한번에 가져올 수 있다.
# 한번에 가져오고자 하는 테이블 간에 공통된 부분이 있어야 한다. 

# 각 사원들의 사원번호, 근무 부서 번호, 근무 부서 이름을 가져온다.
# 사원번호를 기준으로 오름차순 정렬한다.
 
select dept_emp.emp_no, dept_emp.dept_no, departments.dept_no, departments.dept_name
from dept_emp, departments
where dept_emp.to_date = '9999-01-01'
order by dept_emp.emp_no ; 
# join을 하게 되면 다대다의 관계를 가져옴 -> 우리가 원하는 방식은 아님

select dept_emp.emp_no, dept_emp.dept_no, departments.dept_no, departments.dept_name
from dept_emp, departments 
where dept_emp.to_date = '9999-01-01' and dept_emp.dept_no = departments.dept_no
order by dept_emp.emp_no ; 

# 테이블명에 별칭을 부여해주면 편하게 작업할 수 있음. 
# as 별칭 (as는 생략 가능)
select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp as a1, departments a2 
where a1.to_date = '9999-01-01' and a1.dept_no = a2.dept_no
order by a1.emp_no ; 

# 별칭은 데이터를 가져오는 결과의 컬럼 명에도 붙힐 수 있다.
# as는 항상 생략 가능
select salary * 1.1 as "10% 인상" 
from salaries
where to_date = '9999-01-01' ;

# join의 종류
# inner join : join을 하고자 하는 두 테이블에서 조인 조건에 만족하는 것만 모두 가져온다.
# 만족하지 않는 행들은 모두 제거된다. 

# from [기준이 되는 테이블명]
# 	inner join [join하고자 하는 테이블 명]
#	on [join을 위한 조건]

select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp a1
	join departments a2
    on a1.dept_no = a2.dept_no # 다대다 조건을 해결하기 위해 사용
where a1.to_date = '9999-01-01'
order by a1.emp_no;
# inner join 시 inner는 생략 가능함. 

# 대부분의 join 작업은 inner join이기 때문에 편하게 작성할 수 있는 문법도 제공된다.
select a1.emp_no, a1.dept_no, a2.dept_no, a2.dept_name
from dept_emp as a1, departments a2 
where a1.to_date = '9999-01-01' and a1.dept_no = a2.dept_no
order by a1.emp_no ; 

# outer join
# inner join의 경우 조건에 만족하지 않는 행은 모두 제외된다.
# outer join 역시 조건에 만족하지 않는 행은 모두 제외된다. 
# 단, outer join은 한 쪽 테이블에는 있지만 다른 테이블에는 없는 것은 포함시킬 수 있다.
# 이 때, 없는 쪽은 값이 null로 채워진다. 
# 즉, 두 테이블이 다:다의 관계로 조인이 이루어지고 on 다음의 조건을 수행해서 
# 조건에 위배가 되는 것들은 모두 제외시킨다.
# 그 후, left인 경우에는 left에는 있지만 right에는 없는 것을 포함시켜주고,
# right인 경우에는 right에 있지만 left에 없는 것을 포함시켜준다.
# full인 경우에는 left에는 있지만 right에는 없는 것과 right에는 있지만 left에는 없는 것까지 포함시켜준다.
# 출력 x, 데이터를 가지고 오는 것까지만 해당됨.

# left outer join
# 기준이 되는 테이블(좌측)에는 있지만, join을 하는 테이블(우측)에는 없는 결과까지 포함된다.
# 가져온 행에서 join을 하는 테이블(우측) 부분의 컬럼에는 null 값이 채워진다. 
select a2.emp_no, a2.last_name, a1.dept_no, a1.emp_no
from employees as a2
	left outer join dept_manager a1
    on a1.emp_no = a2.emp_no;
    
# left outer join
# 기준이 되는 테이블(좌측)에는 없지만, join을 하는 테이블(우측)에는 있는 결과까지 포함된다.
# 가져온 행에서 join을 하는 테이블(좌측) 부분의 컬럼에는 null 값이 채워진다. 
select a2.emp_no, a2.last_name, a1.dept_no, a1.emp_no
from employees as a2
	right outer join dept_manager a1
    on a1.emp_no = a2.emp_no;

# full outer join
# 양쪽 모두에게 없는 것들도 결과에 모두 포함된다.


-- 각 사원의 사원번호, 근무 부서 번호, 근무 부서 이름을 가져온다.
-- 사원 번호를 기준으로 오름 차순 정렬한다.
select a1.emp_no, a1.dept_no, a2.dept_name
from dept_emp as a1, departments as a2
where a1.to_date = '9999-01-01' and a1.dept_no = a2.dept_no
order by a1.emp_no; 

-- 각 사원들의 사원번호, first_name, 근무 부서 번호를 가져온다.
select a1.emp_no, a1.first_name, a2.dept_no
from employees a1, dept_emp a2
where a2.to_date = '9999-01-01' and a1.emp_no = a2.emp_no;

-- 각 사원들의 사원번호, first_name, 현재 받고 있는 급여액을 가져온다.
select a1.emp_no, a1.first_name, a2.salary
from employees a1, salaries a2
where a1.emp_no = a2.emp_no and a2.to_date = '9999-01-01'; 

-- 각 사원들의 사원번호, first_name, 근무 부서 이름을 가져온다.
# employees + dept_emp + departments
# 3개의 테이블을 n:n:n으로 연결한 것임. 
select a1.emp_no, a1.first_name, a2.dept_name
from employees a1, departments a2, dept_emp a3
where a3.to_date = '9999-01-01' and a1.emp_no = a3.emp_no and a2.dept_no = a2.dept_no;


# 문제점: 근무부서 이름이 있는 테이블에는 dept_no, dept_name만 있고,
# first_name이 있는 테이블에는 dept_no, dept_name도 없음. 
# 둘 사이를 연결해줄 수 있는 테이블을 하나 더 만든 다음에 다시 연결











