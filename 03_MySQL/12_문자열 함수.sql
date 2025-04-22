# concat : 주어진 문자열 들을 하나의 문자열로 합쳐서 가져온다.
select concat('aaa', 'bbb', 'ccc');
select concat('aaa', 100, 11.11);

select concat('사원번호 ', emp_no, '사원이 현재 받는 급여는 ', salary, '달러 입니다')
from salaries 
where to_date = '9999-01-01' ;

# insert : 원본문자열에서 순서값에서부터 글자수만큼 글자를 제거하고 그 위치에 새롭게 적용할 글자를 삽입해준다.
# insert : (원본문자열, 순서값(1부터 시작), 글자수, 새롭게 적용할 글자)
select insert('aaaaa', 2, 2, 'bbb'); 
select insert('aaaaa', 2, 0, 'bbb'); # 삽입용도로 쓸려면 0으로 지정해줘야 함. 

select insert(first_name, 2, 2, '메롱') 
from employees;

# replace : 원본 문자열에서 지정한 문자열1을 지정한 문자열2로 변경한다.
select replace('aabbcckkkkddbbc', 'bb', 'dddd');

select replace(title, 'Senior', '숙련자')
from titles;

# instr : 원본 문자열에서 주어진 문자열이 어디에 있는가를 확인함. 
# 찾으면 찾은 위치(1부터) 반환하고 없으면 0을 반환한다.
select instr('abcdefg', 'cde');
select instr('abcdefgcdejig', 'cde'); # 왼쪽에서부터 찾아나감.

select instr(first_name, 'e')
from employees; 

select emp_no, title
from titles
where instr(title, 'Senior');

# left : 주어진 문자열에서 좌측에서부터 주어진 개수 만큼 가져온다.
select left('abcdefg' , 3);

# right: 주어진 문자열에서 우측에서 주어진 개수 만큼 가져온다.
select right('abcdefg', 3);

# mid : 주어진 문자열에서 주어진 시작위치(1부터)에서 주어진 개수만큼 가져온다
select mid('abcdefg', 2, 3);

# substring: 주어진 문자열에서 주어진 시작위치(1부터)에서 주어진 개수만큼 가져온다
select substring('abcdefg', 2, 3); 
select substr('abcdefg', 2, 3); 

select concat('[', '            문자열        ' ,']') ; 

# ltrim : 좌측의 공백을 제거한다
select concat('[', ltrim('         문자열            '), ']');

# rtrim : 우측의 공백을 제거한다
select concat('[', rtrim('         문자열            '), ']');

# trim : 좌우 공백을 제거한다.
select concat('[', trim('         문자열            '), ']');

# lcase, lower : 문자열의 모든 글자들을 소문자로 변경한다.
select lcase('abcDEf'), lower('abCDEF'); 

# ucase, upper : 문자열의 모든 글자들을 대문자로 변경한다.
select ucase('aBCedrf'), upper('aVDSewfs');

# reverse : 문자열을 반대로 뒤집어서 가져온다.
select reverse('abcde');