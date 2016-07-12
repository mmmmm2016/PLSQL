DECLARE
  CURSOR c_dept_cursor is select department_id, department_name from departments where department_id<100 order by department_id asc;
  CURSOR c_emp_cursor(v_deptno NUMBER) is select last_name, job_id, hire_date, salary from employees where employee_id<120;
  v_departmentId departments.department_id%TYPE;
  v_departmentName departments.department_name%TYPE;
  v_lastname employees.last_name%TYPE;
  v_salary employees.salary%TYPE;
  v_managerId employees.manager_id%TYPE;
  v_jobId employees.job_id%TYPE;
  v_hireDate employees.hire_date%TYPE;
BEGIN
    FOR dept IN c_dept_cursor LOOP    
      --FETCH dept INTO v_departmentId, v_departmentName;
      For emp In c_emp_cursor(dept.department_id) LOOP
        --FETCH emp INTO v_lastname, v_jobId, v_hireDate, v_salary;
        DBMS_OUTPUT.PUT_LINE('Result : ' || emp.last_name);
      END LOOP;
    END LOOP;
END;
/

select * from departments
