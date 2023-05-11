-- 创建存储函数 get_mgr_name，返回 employees 表中某员工名字的领导的名字

DELIMITER $
CREATE function get_mgr_name(inout name varchar(20))
returns varchar(20)
begin
   return (
      select first_name 
      from northwind.employees
      where employee_id = (
         select manager_id
         from northwind.employees
         where first_name = name
      )
   );
end $
delimiter;

set @name = 'Lex';
CALL get_mgr_name(@name);
SELECT @name;
