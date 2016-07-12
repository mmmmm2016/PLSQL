SET SERVEROUTPUT ON;

DECLARE
  type rec_countries is record ( v_country_record countries%ROWTYPE);
  
  v_countryid VARCHAR(10):= 'CA';
  v_country rec_countries;
BEGIN
  For s in (select * from countries) LOOP
    v_country.v_country_record := s;
    v_countryid := v_country.v_country_record.country_id;
    DBMS_OUTPUT.PUT_LINE('Country ID: ' || v_countryid || ' Country Name : ' || v_country.v_country_record.country_name || ' Region : ' || v_country.v_country_record.region_id);
  END LOOP;
END;
/


