select * from employees;
select * from departments;
--����Ա�������������ϼ�������
select first_name || last_name, t.a 
  from employees
  join (select first_name || last_name a, manager_id from employees) t
  on (employees.manager_id=t.manager_id);
--��ְ����������ֱ���ϼ�������Ա��
select first_name || last_name where hire_date<(select hiredate from()
--���в������Ƽ�Ա��
select department_name, employees.first_name || employees.last_name
  from departments
  join employees
    on (departments.department_id = employees.department_id);
--���С�IT_PROG��������Ա�����������䲿������
select first_name || last_name, departments.department_name
  from employees
  join departments
    on (employees.department_id = departments.department_id)
  join jobs
    on(employees.job_id=jobs.job_id)
  where jobs.job_title = 'it_prog';
--���¡�SA_REP�������۴���������Ա��������
select first_name || last_name
  from employees
  join department
    on (departments.department_name = SA_REP);
--���й�Ա��Ա�����ơ��������ƺ�нˮ
select first_name || last_name, salary, departments.department_name
  from employees
  join departments
    on (employees.department_id = departments.department_id);
--���ʴ���2000Ԫ�ģ�Ա�����������ţ�����������
select first_name || last_name,
       departments.department_name,
       jobs.job_title,
       salary
  from employees
  join departments
    on (employees.department_id = departments.department_id)
  join jobs
    on (employees.job_id=jobs.job_id);
--ÿ�������µ�Ա������������
--select first_name || last_name, salary, departments.department_name
--  from employees
 -- join departments
 --   on (employees.department_id = departments.department_id) 
--  group by departments.department_name;


--ÿ�����Ź����Ĺ�Ա�������Լ�������Ϣ
select count(*) (select department from departments)
--�ӡ�software���ҵ���f����λ�ã�ȥ�����еġ�a��
select instr('software','f',1,1) as loc from dual;
select substr('software',0,8) as time from dual;
--����ƽ�����ʣ��������룬������λС��
select round(avg(salary),2) from employees;
--��ѯ2001����ְ��Ա��
select first_name || last_name
  from employees
 where hire_date < to_date('2012-01-01', 'yyyy-mm-dd')
   and hire_date > to_date('2010-12-31', 'yyyy-mm-dd');
--��û���ϼ���Ա������manager���ֶ���Ϣ���Ϊ "boss"
update employees set manager_id='boss' where manager_id is null;
--Ϊ�������ǹ��ʣ���׼�ǣ�10���ų�10%��20���ų�15%��30���ų�20%����
select first_name
 case when department_id = 10 then salary * 1.1 
   when department_id = 20 then salary * 1.2
      when department_id = 30 then salary * 1.3 
        end from employees;;
--����ƽ��нˮ
select avg(salary) from employees group by department_id;
--������������ʴ���1300����Ա���ű�š�ƽ�����ʡ���С��ɡ�������,����ƽ�����ʴ���100
select department_id, avg(salary), min(commission_pct), max(commission_pct)
  from employees
 group by department_id
having avg(salary) > 100;
--ͳ������С��4�Ĳ���
select department_id from employees group by department_id having count(*)<4;
