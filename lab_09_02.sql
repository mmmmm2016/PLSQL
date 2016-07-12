SET SERVEROUT ON;

DECLARE
  e_childrecord_exists EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_childrecord_exists, -02292);
BEGIN
  DELETE FROM DEPARTMENTS Where department_id=40;
  EXCEPTION
    When e_childrecord_exists THEN
      DBMS_OUTPUT.PUT_LINE('Deleting department 40 ... \n Cannot delete this department.There are employees in this department (child records exists.)');
END;