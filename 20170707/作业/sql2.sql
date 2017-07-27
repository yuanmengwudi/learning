insert into clazz
  (class_id, class_name, start_date, end_date)
values
  (1,
   'yiban',
   to_date('20017-01-01', 'yyyy-mm-dd'),
   to_date('20021-01-01', 'yyyy-mm-dd'));
   
insert into clazz
  (class_id, class_name, start_date, end_date)
values
  (2,
   'erban',
   to_date('20017-01-01', 'yyyy-mm-dd'),
   to_date('20021-01-01', 'yyyy-mm-dd'));

insert into clazz
  (class_id, class_name, start_date, end_date)
values
  (3,
   'sanban',
   to_date('20017-01-01', 'yyyy-mm-dd'),
   to_date('20021-01-01', 'yyyy-mm-dd'));

insert into clazz
  (class_id, class_name, start_date, end_date)
values
  (4,
   'siban',
   to_date('20017-01-01', 'yyyy-mm-dd'),
   to_date('20021-01-01', 'yyyy-mm-dd'));

insert into clazz
  (class_id, class_name, start_date, end_date)
values
  (5,
   'wuban',
   to_date('20017-01-01', 'yyyy-mm-dd'),
   to_date('20021-01-01', 'yyyy-mm-dd'));

update clazz set class_name='linyunban' where class_id=3;
delete from clazz join on stu on (clazz.class_id != stu.class_id);
