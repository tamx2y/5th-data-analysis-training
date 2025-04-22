# 현재 날짜와 시간
# now() : mysql DBMS가 관리하는 시간값을 가져온다.
# sysdate() : 컴퓨터가 관리하는 시간값을 가져온다.
# current_timestamp(): mysql dbms를 운영하는 서버의 시간을 가져온다.
# mysql dbms가 관리하는 시간값은 컴퓨터의 시간값과 동기화된다. 컴퓨터의 시간이 강제로 변경되면 동기화가 이루어진다.
# mysql dbms를 운영하는 서버는 mysql dbms가 설치되어 있는 컴퓨터에 해당되기 때문에 컴퓨터의 시간과 동일하다. 
select now(), sysdate(), current_timestamp();

# 현재 날짜
select curdate(), current_date() ; 

# 현재 시간
select curtime(), current_time() ; 

# date_add : 주어진 날짜와 시간에서 주어진 기준의 날짜나 시간값을 주어진 만큼 증가시킨다.
# 기준 : year, month, day, hour, minute, second
select now(), date_add(now(), interval 100 day), date_add(now(), interval 100 minute);

select date_add(hire_date, interval 10 year) 
from employees; 

# date_sub : 주어진 날짜와 시간에서 주어진 기준의 날짜나 시간값을 주어진 만큼 감소시킨다.
# 기준 : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
select now(), date_sub(now(), interval 100 day), date_sub(now(), interval 100 MINUTE);

select date_sub(hire_date, interval 10 year) 
from employees;

-- YEAR(날짜) : 날짜의 연도를 가져온다.
-- MONTH(날짜) : 날짜의 월을 가져온다.
-- MONTHNAME(날짜) : 날짜의 월을 영어로 가져온다.
-- DAYNAME(날짜) : 날짜의 요일을 영어로 가져온다.
-- DAYOFMONTH(날짜) : 날짜의 월별 일자를 가져온다.
-- DAYOFWEEK(날짜) : 날짜의 주별 일자를 가져온다. 일요일 – 1, 월요일 – 2, 화요일 – 3…
-- WEEKDAY(날짜) : 날짜의 주별 일자를 가져온다. 월요일 – 0, 화요일 – 1, 수요일 - 2…
select now(), year(now()), month(now()), monthname(now()), dayname(now()),
       dayofmonth(now()), dayofweek(now()), dayofyear(now()), weekday(now());
       
# 포멧
select now(), date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %S초 %p');

# 각 사원들의 고용 날짜를 다음 양식에 맞춰서 가져온다.
# 0000-00-00
select date_format(hire_date, '%Y-%m-%d')
from employees; 