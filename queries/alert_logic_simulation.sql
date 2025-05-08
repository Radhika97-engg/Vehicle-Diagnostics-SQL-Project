--QUERY 1 : Consecutive Overheating Detection
--Detects cases where Engine_Temp exceeds 95°C for 3 or more consecutive log entries 
--To monitor sustained overheating to trigger engine stress alerts or diagnostic trouble codes (DTCs).
SELECT  
    a.Timestamp AS Start_time,
    b.Timestamp AS Middle_time,
    c.Timestamp AS End_time,
    a.Engine_Temp AS Temp1,
    b.Engine_Temp AS Temp2,
    c.Engine_Temp AS Temp3, 
 CASE 
    WHEN CAST (a.Engine_Temp AS INTEGER) > 95
    AND CAST (b.Engine_Temp AS INTEGER) > 95
    AND CAST (c.Engine_Temp AS INTEGER) > 95
    THEN 'Critical Overheat'
    ELSE 'OK'
END AS ALERT_FLAG
FROM faulty_logs a
JOIN faulty_logs b ON b.rowid = a.rowid + 1
JOIN faulty_logs c ON c.rowid = a.rowid + 2
WHERE CAST (a.Engine_Temp AS INTEGER) > 95
  AND CAST (b.Engine_Temp AS INTEGER) > 95
  AND CAST (c.Engine_Temp AS INTEGER) > 95
ORDER BY a.Timestamp;

--QUERY 2 -- Alert count by ECU
--Group log entries by ECU and counts how many overheating alerts (Engine_Temp> 95) were associated to each unit
--this will help identify which ECU (ie ECM, TCM,BCM ) is more frequently involved in overheating which indicated unit specific issues like over heating, load issues or faulty reporting
SELECT  
    ECU, 
    COUNT(*) AS Critical_Alert_Control
FROM
(
 SELECT a.ECU,
 CASE 
    WHEN CAST (a.Engine_Temp AS INTEGER) > 95
    AND CAST (b.Engine_Temp AS INTEGER) > 95
    AND CAST (c.Engine_Temp AS INTEGER) > 95
    THEN 'Critical Overheat'
    ELSE 'OK'
END AS ALERT_FLAG
FROM faulty_logs a
JOIN faulty_logs b ON b.rowid = a.rowid + 1
JOIN faulty_logs c ON c.rowid = a.rowid + 2
) AS Alert_logs
WHERE ALert_flag = 'Critical Overheat'
GROUP BY ECU;

--QUERY 3 -- First Critical Alert Timestamp Per ECU
--Finds the earliest timestamp when a 'Critical Overheat' alert was triggered by each ECU.
--Useful for identifying when a heat stress condition first occurred, supporting root-cause analysis 
SELECT  
    MIN(Timestamp) AS FIRST_OVERHEAT_TIMESTAMP,
    ECU
FROM
(
 SELECT a.Timestamp,
        a.ECU,
 CASE 
    WHEN CAST (a.Engine_Temp AS INTEGER) > 95
    AND CAST (b.Engine_Temp AS INTEGER) > 95
    AND CAST (c.Engine_Temp AS INTEGER) > 95
    THEN 'Critical Overheat'
    ELSE 'OK'
END AS ALERT_FLAG
FROM faulty_logs a
JOIN faulty_logs b ON b.rowid = a.rowid + 1
JOIN faulty_logs c ON c.rowid = a.rowid + 2
) AS Alert_logs
WHERE ALert_flag = 'Critical Overheat'
GROUP BY ECU;

-- QUERY 4 -- Sudden RPM Drop Detection
-- Detects cases where RPM drops by more than 3000 units between two consecutive log entries.
-- to simulate abnormal deceleration, clutch disengagement, or engine stop scenarios
SELECT 
     a.RPM AS First_RPM,
     b.RPM AS Second_RPM,
     a.Timestamp AS First_timestamp,
     b.Timestamp AS Second_Timestamp,
     a.RPM - b.RPM AS DROP_VALUE,
  CASE 
    WHEN a.RPM - b.RPM > 3000 
    AND strftime('%s', b.Timestamp) - strftime('%s', a.Timestamp) <= 10
    THEN 'Sudden RPM drop within 10 secs'
    ELSE 'OK'
  END AS RPM_ALERT_FLAG
FROM faulty_logs a
JOIN faulty_logs b ON b.rowid = a.rowid + 1
WHERE a.RPM - b.RPM > 3000;



