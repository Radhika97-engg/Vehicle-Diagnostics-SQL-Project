--ANOMALY DETECTION -VEHICLE DIAGNOSTIC LOGS
--Project: Vehicle Telemetry Diagnostics
--File: anomaly_detection.sql
--Description: Detects abnormal patterns from CAN signal logs
--Table: vehicle_logs1
--Columns: Timestamp, CAN_ID, ECU, RPM, Speed, Engine_Temp, Fuel_Level


-- Anomaly 1. Speed > 120 km/hr and RPM < 2000
-- This case may indicate inconsistent engine behavior, causes may include sensor malfunction,gear slippage, incorrect ECU reporting

SELECT *
FROM vehicle_logs1
WHERE CAST (Speed AS INTEGER) > 120
AND CAST (RPM AS INTEGER) <2000
ORDER BY RPM DESC;

-- Anomaly 2. Engine Temp > 100 and Fuel Level < 10%
-- This case indicates high engine temperature with dangerously low fuel, which suggests vehicle stress condition or poor calibration
-- Useful to simulate real Diagnostic Trouble Code flags or test case triggers

SELECT *
FROM vehicle_logs1
WHERE CAST (Engine_Temp AS INTEGER) > 100
AND CAST (Fuel_Level AS INTEGER) < 10
ORDER BY Fuel_Level DESC;

-- Anomaly 3. Speed = 0 and RPM > 2000 
-- This case may indicate vehicle is stationary with high engine RPM, possibly due to throttle issue, clutch slippage, or data error

SELECT *
FROM vehicle_logs1
WHERE CAST ( Speed AS INTEGER) = 0
AND CAST (RPM AS INTEGER) > 2000
ORDER BY RPM DESC;

--Anomaly 4.Pattern-based anomaly detection using wildcards 
--This case will be targeting only messages that begin with '0x2' to target high speed events filtered by message ID group with speed > 120

SELECT CAN_ID,
       Speed
FROM vehicle_logs1
WHERE CAN_ID LIKE '0x2%' 
AND  CAST ( Speed AS INTEGER) > 120
ORDER BY SPEED DESC;




