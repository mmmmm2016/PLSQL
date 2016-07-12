SET SERVEROUTPUT ON;


variable b_basic_percent NUMBER
variable b_pf_percent NUMBER
declare
  v_today date :=sysdate;
  v_tomorrow v_today%type;
BEGIN
  :b_basic_percent:=45;
  :b_pf_percent:=12;
  --v_tomorrow := v_today+1;
  --DBMS_OUTPUT.PUT_LINE('Hello World' || v_today || ' Ngay mai ' || v_tomorrow);

END;
/
  print b_basic_percent
print b_pf_percent



variable b_emp_salary number
set autoprint on
declare
  v_empno number(6):=&empno;
begin
  select salary into :b_emp_salary from employees where employee_id=v_empno;
end;
/

select salary  from employees where employee_id=178;




declare
  v_customer varchar2(50):='Womansport';
  v_credit_rating varchar2(50):='EXCELLENT';
begin
 declare
  v_customer number(7):=201;
  v_name VARCHAR2(25):='Unisports';
  begin
    v_credit_rating:='GOOD';
    
  end;
  DBMS_OUTPUT.PUT_LINE('Ket qua ' || v_credit_rating);
end;
