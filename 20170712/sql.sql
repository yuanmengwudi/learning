create table stu(
stu_id number(4) primary key,
stu_name varchar2(20) not null,
stu_age number(3) check(stu_age>0),
sex char(4) check(sex in('男','女')), 
cls_id number(2) references clazz(cls_id)
)
alter table stu add constraint ck check(stu_age>0);

create sequence seq_a start with 1 increment by 1;
create sequence seq_b start with 1 increment by 1;

create table clazz(
cls_id number(2) primary key,
cls_name varchar2(10) unique
)

insert into clazz values(seq_a.nextval,'一班');
insert into clazz values(seq_a.nextval,'二班');
insert into clazz values(seq_a.nextval,'三班');

insert into stu values(seq_b.nextval,'小李',20,'男',1);
insert into stu values(seq_b.nextval,'小武',20,'男',1);
insert into stu values(seq_b.nextval,'小明',20,'男',3);
insert into stu values(seq_b.nextval,'小张',20,'男',2);
insert into stu values(seq_b.nextval,'小赵',20,'男',1);
insert into stu values(seq_b.nextval,'小吴',20,'男',2);
insert into stu values(seq_b.nextval,'小郭',20,'男',3);

create view vw_a as 
(select employee_id,first_name||last_name as 姓名,departments.department_name,jobs.job_title from employees 
left join departments on(employees.department_id=departments.department_id)
left join jobs on (employees.job_id=jobs.job_id));

create index idx_stu on stu(stu_name);

drop table stu;
select * from vw_a;
select * from stu;
drop sequence seq_b;
