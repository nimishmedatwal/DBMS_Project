CREATE OR REPLACE PROCEDURE FLIGHTSBYSTATUS 
(
  IN_STATUS IN VARCHAR2
) AS 
 
CURSOR fSTATUS is
select  distinct f.FLIGHT_CODE ,al.AL_NAME ,f.ARRIVAL,f.departure,f.SOURCE,f.DESTINATION,f.STATUS,f.FLIGHTTYPE from Airline al ,Airport ap,flight f
where al.AIRLINEID=f.AIRLINEID
and  f.STATUS =IN_STATUS;
 
FlightStatus fSTATUS%rowtype;
  
BEGIN
  Open fSTATUS ;
   LOOP
    fetch fSTATUS into FlightStatus;
     EXIT WHEN fSTATUS%NOTFOUND;
   dbms_output.put_line (FlightStatus.FLIGHT_CODE || '  ' || FlightStatus.AL_NAME || '  ' || FlightStatus.ARRIVAL || '  ' || FlightStatus.departure|| '  ' ||FlightStatus.Source || '  ' || FlightStatus.DESTINATION || '  ' || FlightStatus.STATUS || '  ' || FlightStatus.FLIGHTTYPE);
   
    END LOOP;
     close fSTATUS;
END FLIGHTSBYSTATUS;

-- SET SERVEROUTPUT ON 
-- exec FLIGHTSBYSTATUS('Delayed');
-- or--
-- SET SERVEROUTPUT ON 
-- exec FLIGHTSBYSTATUS('On-time');
