/*
CREATE OR REPLACE PROCEDURE ADD_JOB (
  v_jobId IN jobs.job_id%TYPE,
  v_jobTitle IN jobs.job_title%TYPE,
  v_minSalary IN jobs.min_salary%TYPE,
  v_maxSalary IN jobs.max_salary%TYPE)
IS
BEGIN
  INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
  VALUES (v_jobId, v_jobTitle, v_minSalary, v_maxSalary);
  commit;
END;
/
*/

declare
  v_jobId jobs.job_id%TYPE := 'TEST';
  v_jobTitle jobs.job_title%TYPE := 'TONG GIAM DOC';
  v_minSalary jobs.min_salary%TYPE := 1000;
  v_maxSalary jobs.max_salary%TYPE := 4000;
begin
  add_job(v_jobId, v_jobTitle, v_minSalary, v_maxSalary);
end;
/