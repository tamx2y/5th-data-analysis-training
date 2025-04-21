# MySQL 각종 함수들
# https://dev.mysql.com/doc/refman/9.3/en/functions.html

# 절대값
select abs(100), abs(-100);

# 급여액에서 100000을 뺀 후 절대값을 구한다.
select salary, salary - 100000, abs(salary - 100000)
from salaries
order by salary desc; 

# 소수점 이하 첫번째 자리를 1로 올린다
select ceil(10.1), ceil(10.4), ceil(10.5), ceil(10.8) ; 

# 급여의 90% 금액을 구한다. 소수점 이하는 올린다.
select salary, salary * 0.9, ceil(salary * 0.9)
from salaries; 

# 소수점 이하 첫번째 자리를 0으로 내린다
select floor(10.1), floor(10.4), floor(10.5), floor(10.8);

# 급여액의 90% 금액을 구한다. 소수점 이하는 버린다. 
select salary, salary * 0.9, floor(salary * 0.9)
from salaries;

# 반올림 
select round(10.1), round(10.4), round(10.5), round(10.8);
# 두번째에는 반올림 기준이 되는 자리수를 설정할 수 있음. 
# 0 : 소수점 이하 첫 번째 자리
# 1 이상 : 소수점 이하 두 번째 자리부터 
# -1 이하 : 정수부분 자리
# 생략 시 0으로 설정한다.
select round(166.555, 0), round(166.555, 1), round(166.555, -1);
select round(-166.555, 0), round(-166.555, 1), round(-166.555, -1);

# 모든 사원들이 현재 받는 급여액을 100의 자리를 기준으로 반올림하여 가져온다.
select emp_no, salary, round(salary, -3)
from salaries
where to_date = '9999-01-01'; 

# floor는 소수점 자리를 0으로 내리기 때문에 더 작은 숫자가 나온다.
select floor(10.5), floor(-10.5);
# truncate는 숫자를 버리기 때문에 양수는 작아지고 음수는 커진다. 
select truncate(10.5, 0), truncate(-10.5, 0);

# pow(x, y), power(x, y) : x의 y 승
select pow(10, 2), power(10, 2), pow(10, 3);

# 나머지 구하기
select mod(10, 3);

# 최대숫자 구하기
select greatest(10, 4, 20, 1);

# 각 행에서 지정된 컬럼의 값 중 큰 값들을 가져온다
select salary, round(salary, -2), greatest(salary, round(salary, -2))
from salaries; 

# 최소 숫자 구하기
select least(10, 4, 20, 1);

# 각 행에서 지정된 컬럼의 값 중 큰 값들을 가져온다
select salary, round(salary, -2), least(salary, round(salary, -2))
from salaries; 