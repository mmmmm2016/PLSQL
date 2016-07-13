CREATE OR REPLACE PROCEDURE UPD_JOB (
  v_jobId IN jobs.job_id%TYPE,
  v_jobTitle IN jobs.job_title%TYPE
  )
IS
  v_jTitle JOBS.JOB_TITLE%TYPE;
BEGIN
  select job_title into v_jTitle from jobs where job_id=v_jobId;
  UPDATE JOBS SET job_title=v_jobTitle where job_id=v_jobId;
  commit;
  EXCEPTION
    --WHEN exp THEN
    --  DBMS_OUTPUT.PUT_LINE('No job update. Error: ' || SQLERRM);
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20202, 'My Message: No data found');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Other errors. Error: ' || SQLERRM);
  
END;
/
SET SERVEROUTPUT ON;
begin
  upd_job('TEST11', 'TOIKHONGROX');
end;
