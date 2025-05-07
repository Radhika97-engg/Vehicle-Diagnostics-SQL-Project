# Vehicle Diagnostics SQL Project

This project simulates real-world vehicle diagnostics using SQL. It focuses on analyzing mock CAN bus logs collected from multiple ECUs (like **ECM**, **TCM**, and **BCM**) to detect signal anomalies, simulate alerts, and analyze ECU behavior patterns, closely reflecting validation practices in the automotive industry.

---

## Project Structure

```
Vehicle-Diagnostic-SQL-Analyzer/
│
├── dataset/                
│   ├── vehicle_logs_mock.csv          # 200-row telemetry dataset
│   ├── ECU_Registry.csv               # Static ECU references
│   └── faulty_logs_sample.csv         # Alert test inputs
│
├── queries/
│   ├── anomaly_detection.sql          # Speed vs RPM, Temp vs Fuel, Idle mismatch
│   ├── ecu_behavior_analysis.sql      # ECU frequency, drops, wildcard filters
│   ├── alert_logic_simulation.sql     # CASE-based alert logic 
│   ├── timestamp_analysis.sql         # Delay, gap, duplicate checks 
│   └── summary_views.sql              # Summary dashboards 
│
├── screenshots/
│   ├── speed_rpm_mismatch.png
│   ├── high_temp_low_fuel.png
│   ├── idling_rpm_anomaly.png
│   ├── canid_pattern_highspeed.png
│   ├── ecu_message_count.png
│   ├── ecu_low_activity_filter.png
│   ├── unique_canids_per_ecu.png
│   └── ... (more to be added)
│
├── README.md                  
├── project_pitch.md          
└── LICENSE (optional)
```

---

## Dataset Overview

Primary file: `vehicle_logs_mock.csv`  
Total entries: **200**

| Column         | Description                          |
|----------------|--------------------------------------|
| `Timestamp`    | Time of CAN message capture          |
| `CAN_ID`       | Unique identifier for CAN signal     |
| `ECU`          | Source control unit (e.g., ECM)      |
| `RPM`          | Engine speed (rev/min)               |
| `Speed`        | Vehicle speed (km/h)                 |
| `Engine_Temp`  | Engine temperature (°C)              |
| `Fuel_Level`   | Remaining fuel (%)                   |

---

## Project Objectives

- Detect abnormal signal patterns (e.g., Speed > 120 km/h while RPM < 2000)
- Analyze ECU message patterns, frequency, and unique IDs
- Identify logging gaps, drops, and inconsistencies
- Simulate alert logic for overheat, idle errors, fuel loss
- Build time-based dashboards from CAN logs

---

## SQL Concepts Practiced

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- `COUNT`, `DISTINCT`, `HAVING`, `LIKE`, `CASE`
- Basic time manipulation with `STRFTIME`
- Commenting, annotation, modular query building

---

## Tools Used

- **SQLiteStudio 3.4.17** – Query execution
- **Google Sheets** – CSV generation
- **GitHub** – Version control, documentation

---

## Current Status

- [x] Dataset generated and uploaded
- [x] Anomaly detection queries
- [x] ECU behavior analysis queries
- [ ] Alert logic simulation (in progress)
- [ ] Timestamp-based diagnostics (in progress)
- [ ] Final pitch, project wrap-up

---

> _This project aims to bridge embedded diagnostics with data analytics using foundational SQL queries._  
