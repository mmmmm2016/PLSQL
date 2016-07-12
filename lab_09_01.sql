SET SERVEROUTPUT ON;
DECLARE
  v_ename employees.last_name%TYPE;
  v_emp_sal employees.salary%TYPE :=2000;
BEGIN
  select last_name into v_ename from employees where salary=v_emp_sal;
  insert into messages (results) values ('Name : ' || v_ename || ' -- salary : ' || v_emp_sal);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employee with a salary of ' || v_emp_sal);
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('More than one employee with a salary of ' || v_emp_sal);
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Some other error occurred');
END;
/


