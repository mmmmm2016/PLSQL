declare
  c_stars VARCHAR(40);
  v_int NUMBER;
begin
  FOR s in (select * from emp) LOOP
    v_int:=nvl(s.salary/1000,0);
    c_stars := nvl(s.stars, '');
    
    FOR i in 1..v_int LOOP
      c_stars := c_stars || '*';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Luong : ' || c_stars);
    update emp set stars=c_stars where employee_id=s.employee_id;
  end loop;
  commit;
end;
/

