-- ECU BEHAVIOR ANALYSIS - MESSAGE PATTERNS;
-- Project: Vehicle Telemetry Diagnostics
-- File: ecu_behavior_analysis.sql
-- Description: Analyze message patterns per ECU to detect dropouts, load, and frequency shifts
-- Table: vehicle_logs1
-- Columns: Timestamp, CAN_ID, ECU, RPM, Speed, Engine_Temp, Fuel_Level

--QUERY 1 : Count of messages per ECU
--This query is to verify that each ECU is actively transmitting logs, drop in count means ECU reset, communication failure or power loss

SELECT ECU,
       COUNT (*) AS Messages_per_ECU
FROM vehicle_logs1
GROUP BY ECU 
ORDER BY messages_per_ECU DESC;

--QUERY 2 : Identifying ECU with message drop
--This query flags ECUs with suspiciously low message counts. 
--A low count might indicate dropouts due to power failure, poor wiring, or bus noise issues in a real vehicle environment.

SELECT ECU,
       COUNT (*) AS Messages_per_ECU
FROM vehicle_logs1
GROUP BY ECU 
HAVING Messages_per_ECU < 60
ORDER BY messages_per_ECU DESC;

--QUERY 3 : Compare message count between 2 ECU'S (ie ECM AND TCM)
--ECM typically logs more frequently than TCM.
--If TCM has higher count or ECM count is unexpectedly low, it could indicate a logging issue or message loss.

SELECT ECU,
       COUNT (*) AS Messages_per_ECU
FROM vehicle_logs1
WHERE ECU IN ('ECM','TCM')
GROUP BY ECU
ORDER BY messages_per_ECU DESC;

--QUERY 4: Identify ECUs using limited unique CAN_IDs
--This helps detect ECUs with possible missing signals, config errors, or silent CAN IDs.
--ECUs sending < 3 unique CAN IDs may indicate inactive or underutilized communication.

SELECT ECU,
       COUNT (DISTINCT CAN_ID) AS Unique_messages_per_ECU
FROM vehicle_logs1
GROUP BY ECU
ORDER BY Unique_messages_per_ECU ASC;
