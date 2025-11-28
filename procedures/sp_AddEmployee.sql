create or replace PROCEDURE sp_Addemployee(
	p_lname Varchar,
	p_mname Varchar,
	p_fname Varchar,
	p_emp_id Int,
	p_dob Date,
	p_address Varchar,
	p_gender Char,
	p_salary Decimal,
	p_supervisor_id Int,
	p_dept_id Int
)
Language plpgsql 
AS $$
Declare 
v_supervisor_salary Decimal;
Begin 
	if Exists (Select 1 from Employee Where emp_id = p_emp_id) Then 
	Raise Notice 'Loi: ma nhan vien % da ton tai', p_emp_id;
	Return;
End if;
if p_supervisor_id is not null then
	Select salary Into v_supervisor_salary From Employee Where emp_id = p_supervisor_id;

	if v_supervisor_salary is not null and p_salary > v_supervisor_salary then 
	RAISE NOTICE 'Lỗi: Lương nhân viên không được cao hơn lương người giám sát (% > %).', p_salary, v_supervisor_salary;
		Return;
	End if;

End if;
INSERT INTO Employee (last_name, middle_name, first_name, emp_id, dob, address, gender, salary, supervisor_id, dept_id)
    VALUES (p_lname, p_mname, p_fname, p_emp_id, p_dob, p_address, p_gender, p_salary, p_supervisor_id, p_dept_id);
	Raise notice 'Them nhan vien thanh cong';
end;
$$;