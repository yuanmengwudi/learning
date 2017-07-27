--ƽ��нˮ��ߵĲ��ŵĲ��ű��
select t1.department_id, t1.avg_salary
  from (select t.department_id, avg(salary) as avg_salary
          from employees t
         group by t.department_id
         order by avg_salary desc) t1
 where rownum = 1;
--нˮ��ߵ�ǰ5����Ա
select rownum, t1.employee_id,t1.salary
  from (select t.employee_id, t.salary from employees t order by t.salary desc) t1
 where rownum < 6;
--нˮ��ߵĵ�6��10����Ա

select t2.rw,employee_id, t2.salary
  from (select rownum rw, t1.employee_id, t1.salary
          from (select t.employee_id, t.salary
                  from employees t
                 order by salary desc) t1
         where rownum < 12) t2
 where t2.rw > 5
   and t2.rw < 11;
--Ա�����ʳ�������ƽ��ˮƽ��Ա������
select *
  from employees
  join (select department_id, avg(salary) as avg_salary
          from employees
         group by department_id) t
    on employees.department_id = t.department_id
   and employees.salary > t.avg_salary;
--���бȡ�CLARK�����ʸߵ�Ա������Ϣ
select *
  from employees
 where salary > (select salary from employees where first_name = 'Lex');
--���ʸ���ƽ�����ʵĹ�Ա���ֺ͹���
select first_name || last_name, salary
  from employees
 where salary > (select avg(salary) from employees);
--��SCOTTͬһ�����ұ������ʵ͵Ĺ�Ա���ֺ͹���
select first_name || last_name, salary
  from employees
 where department_id = (                       
                        select department_id from employees where first_name = 'Lex')
   and salary < (select salary from employees where first_name = 'Lex');
--ְ���SCOTT��ͬ����SCOTT��Ӷʱ����Ĺ�Ա��Ϣ
select *
  from employees
 where job_id = (select job_id from employees where first_name = 'Lex')
   and hire_date <
       (select hire_date from employees where first_name = 'Lex');
--��нˮ�ּ���С��5000Ϊ�ͣ�5000��10000Ϊ�У�����10000Ϊ��
select first_name,
       salary,
       case
         when salary < 5000 then
          '��'
         when salary > 5000 and salary < 10000 then
          '��'
         when salary > 10000 then
          '��'
       end
  from employees;

