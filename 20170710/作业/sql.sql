--平均薪水最高的部门的部门编号
select t1.department_id, t1.avg_salary
  from (select t.department_id, avg(salary) as avg_salary
          from employees t
         group by t.department_id
         order by avg_salary desc) t1
 where rownum = 1;
--薪水最高的前5名雇员
select rownum, t1.employee_id,t1.salary
  from (select t.employee_id, t.salary from employees t order by t.salary desc) t1
 where rownum < 6;
--薪水最高的第6到10名雇员

select t2.rw,employee_id, t2.salary
  from (select rownum rw, t1.employee_id, t1.salary
          from (select t.employee_id, t.salary
                  from employees t
                 order by salary desc) t1
         where rownum < 12) t2
 where t2.rw > 5
   and t2.rw < 11;
--员工工资超过部门平均水平的员工数据
select *
  from employees
  join (select department_id, avg(salary) as avg_salary
          from employees
         group by department_id) t
    on employees.department_id = t.department_id
   and employees.salary > t.avg_salary;
--所有比“CLARK”工资高的员工的信息
select *
  from employees
 where salary > (select salary from employees where first_name = 'Lex');
--工资高于平均工资的雇员名字和工资
select first_name || last_name, salary
  from employees
 where salary > (select avg(salary) from employees);
--和SCOTT同一部门且比他工资低的雇员名字和工资
select first_name || last_name, salary
  from employees
 where department_id = (                       
                        select department_id from employees where first_name = 'Lex')
   and salary < (select salary from employees where first_name = 'Lex');
--职务和SCOTT相同，比SCOTT雇佣时间早的雇员信息
select *
  from employees
 where job_id = (select job_id from employees where first_name = 'Lex')
   and hire_date <
       (select hire_date from employees where first_name = 'Lex');
--给薪水分级，小于5000为低，5000到10000为中，大于10000为高
select first_name,
       salary,
       case
         when salary < 5000 then
          '低'
         when salary > 5000 and salary < 10000 then
          '中'
         when salary > 10000 then
          '高'
       end
  from employees;

