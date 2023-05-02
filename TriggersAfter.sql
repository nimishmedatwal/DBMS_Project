CREATE TRIGGER CITY_TRIGGER
AFTER INSERT ON CITY
FOR EACH ROW
BEGIN
  IF STATE IN ('Alabama', 'Alaska', 'Arizona', ..., 'Wyoming') THEN
    UPDATE CITY SET COUNTRY = 'United States' WHERE CNAME = :NEW.CNAME;
  END IF;
END;

CREATE TRIGGER TICKET1_TRIGGER
AFTER INSERT ON TICKET1
FOR EACH ROW
BEGIN
  INSERT INTO TICKET3 (DATE_OF_CANCELLATION, SURCHARGE) VALUES (SYSDATE, 0);
END;

