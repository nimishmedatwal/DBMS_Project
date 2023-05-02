CREATE OR REPLACE PROCEDURE ADD_AIRPORT(
    ap_name_in AIRPORT.AP_NAME%TYPE,
    state_in AIRPORT.STATE%TYPE,
    country_in AIRPORT.COUNTRY%TYPE,
    cname_in CITY.CNAME%TYPE
)
AS
  cname_exists NUMBER;
BEGIN
  -- check if the city already exists
  SELECT COUNT(*) INTO cname_exists FROM CITY WHERE CNAME=cname_in;

  -- if city does not exist, insert it first
  IF cname_exists = 0 THEN
    INSERT INTO CITY (CNAME, STATE, COUNTRY) VALUES (cname_in, state_in, country_in);
  END IF;

  -- insert the airport
  INSERT INTO AIRPORT (AP_NAME, STATE, COUNTRY, CNAME) VALUES (ap_name_in, state_in, country_in, cname_in);

  DBMS_OUTPUT.PUT_LINE('Airport ' || ap_name_in || ' added successfully.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error while adding airport: ' || SQLERRM);
END ADD_AIRPORT;
