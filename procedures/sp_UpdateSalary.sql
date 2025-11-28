create or replace Procedure sp_UpdateSalary(
	p_emp_id Int,
	p_new_salary Decimal
	

)
language plpgsql 
AS $$ 
Declare 
	v_supervisor_id Int;
	v_supervisor_salary Decimal;
Begin 
	if not exists (select 1 from Employee where emp_id = p_emp_id ) then
		Raise Notice 'Loi: nhan vien khong ton tai.';
		Return;
	End if;
	select supervisor_id into v_supervisor_id from Employee Where emp_id = p_emp_id;
	if v_supervisor_id is not null then
	select salary into v_supervisor_salary from Employee where emp_id = v_supervisor_id;
	if p_new_salary > v_supervisor_salary then
	Raise notice 'Loi luong vuot qua muc cua nguoi giam sat.';
	return;
	End if;
end if;
update Employee 
Set salary = p_new_salary
where emp_id = p_emp_id;
 Raise notice 'Cap nhat luong thanh cong';
 end;
 $$;