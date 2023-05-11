delimiter $
create procedure cs.raise_salary2(emp_id int)
begin
  declare emp_sal double;   # 员工工资
  declare hire_year double; # 员工入职年头

  select
    salary,
    datediff(curdate(), hire_date)/365
    into emp_sal, hire_year
  from cs.employees
  where employee_id = emp_id;

  if emp_sal < 8000 and hire_year >= 5 then
    update cs.employees set salary = salary + 500 where employee_id = emp_id;
  end if;
end $
delimiter ;
#}

