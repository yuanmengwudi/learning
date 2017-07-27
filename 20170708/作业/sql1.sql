select * from employees;
select * from departments;
--所有员工的姓名及其上级的姓名
select first_name || last_name, t.a 
  from employees
  join (select first_name || last_name a, manager_id from employees) t
  on (employees.manager_id=t.manager_id);
--入职日期早于其直接上级的所有员工
select first_name || last_name where hire_date<(select hiredate from()
--所有部门名称及员工
select department_name, employees.first_name || employees.last_name
  from departments
  join employees
    on (departments.department_id = employees.department_id);
--所有“IT_PROG”（程序员）的姓名及其部门名称
select first_name || last_name, departments.department_name
  from employees
  join departments
    on (employees.department_id = departments.department_id)
  join jobs
    on(employees.job_id=jobs.job_id)
  where jobs.job_title = 'it_prog';
--从事“SA_REP”（销售代表）工作的员工的姓名
select first_name || last_name
  from employees
  join department
    on (departments.department_name = SA_REP);
--所有雇员的员工名称、部门名称和薪水
select first_name || last_name, salary, departments.department_name
  from employees
  join departments
    on (employees.department_id = departments.department_id);
--工资大于2000元的，员工姓名，部门，工作，工资
select first_name || last_name,
       departments.department_name,
       jobs.job_title,
       salary
  from employees
  join departments
    on (employees.department_id = departments.department_id)
  join jobs
    on (employees.job_id=jobs.job_id);
--每个部门下的员工姓名，工资
--select first_name || last_name, salary, departments.department_name
--  from employees
 -- join departments
 --   on (employees.department_id = departments.department_id) 
--  group by departments.department_name;


--每个部门工作的雇员的数量以及其他信息
select count(*) (select department from departments)
--从“software”找到‘f’的位置，去除其中的‘a’
select instr('software','f',1,1) as loc from dual;
select substr('software',0,8) as time from dual;
--计算平均工资，四舍五入，保留两位小数
select round(avg(salary),2) from employees;
--查询2001年入职的员工
select first_name || last_name
  from employees
 where hire_date < to_date('2012-01-01', 'yyyy-mm-dd')
   and hire_date > to_date('2010-12-31', 'yyyy-mm-dd');
--找没有上级的员工，把manager的字段信息输出为 "boss"
update employees set manager_id='boss' where manager_id is null;
--为所有人涨工资，标准是：10部门长10%；20部门长15%；30部门长20%其他
select first_name
 case when department_id = 10 then salary * 1.1 
   when department_id = 20 then salary * 1.2
      when department_id = 30 then salary * 1.3 
        end from employees;;
--部门平均薪水
select avg(salary) from employees group by department_id;
--按部门求出工资大于1300的人员部门编号、平均工资、最小提成、最大提成,并且平均工资大于100
select department_id, avg(salary), min(commission_pct), max(commission_pct)
  from employees
 group by department_id
having avg(salary) > 100;
--统计人数小于4的部门
select department_id from employees group by department_id having count(*)<4;
