CREATE OR REPLACE FUNCTION GET_JOB (
  v_jobId jobs.job_id%TYPE)
  RETURN VARCHAR2 
IS
  b_title jobs.job_title%TYPE:='';
BEGIN
  Select job_title into b_title from jobs where job_id=v_jobId;
    Return b_title;
END get_job;
/
CREATE OR REPLACE FUNCTION GET_ANNUAL_COMP (
  v_employeeId employees.employee_id%TYPE)
  RETURN NUMBER 
IS
  v_salary employees.salary%TYPE;
  v_commissionPct employees.commission_pct%TYPE;
  r_annual_comp NUMBER;
BEGIN
  Select nvl(salary,0), nvl(commission_pct,0) into v_salary, v_commissionPct from employees where employee_id=v_employeeId;
  r_annual_comp:=(v_salary*12) + (v_commissionPct*v_salary*12);
  Return r_annual_comp;
END GET_ANNUAL_COMP;
/



CREATE OR REPLACE PROCEDURE ADD_EMPLOYEE (
  v_firstName IN employees.first_name%TYPE,
  v_lastName IN employees.last_name%TYPE,
  v_email IN employees.email%TYPE,
  v_jobId IN employees.job_id%TYPE DEFAULT 'SA_REP',
  v_mgrId IN employees.manager_id%TYPE DEFAULT 145,
  v_sal IN employees.salary%TYPE DEFAULT 1000,
  v_comm IN employees.commission_pct%TYPE DEFAULT 0,
  v_deptId IN employees.department_id%TYPE DEFAULT 30)
IS
  v_salary employees.salary%TYPE;
  v_commissionPct employees.commission_pct%TYPE;
  r_annual_comp NUMBER;
BEGIN
  If (VALD_DEPTID(v_deptId)) THEN
    INSERT INTO EMPLOYEES(employee_id, first_name, last_name, email, hire_date,job_id, salary, commission_pct, manager_id,department_id)
    VALUES (EMPLOYEES_SEQ.NEXTVAL, v_firstName, v_lastName, v_email, trunc(sysdate), v_jobId, v_sal, v_comm, v_mgrId, v_deptId);
  END IF;
END ADD_EMPLOYEE;
/

CREATE OR REPLACE FUNCTION VALD_DEPTID (
  v_departmentId departments.department_id%TYPE
  ) RETURN BOOLEAN
  IS
  v_result BOOLEAN:=TRUE;
  v_num NUMBER:=1;
BEGIN
  select count(*) into v_num from departments where department_id=v_departmentId;
  IF (v_num=0) then
    v_result:=FALSE;
  END IF;
  RETURN v_result;
END VALD_DEPTID;

declare
  v_result jobs.job_title%TYPE;
begin
  --v_result:=get_job('AD_PRES');
  ADD_EMPLOYEE(v_firstName=>'Joe', v_lastName=>'Harris', v_email=>'joe.harris@abc.com', v_deptId=>80);
  --DBMS_OUTPUT.PUT_LINE('KET QUA TRA VE :' ||v_result);
end;

select * from employees

describe employees