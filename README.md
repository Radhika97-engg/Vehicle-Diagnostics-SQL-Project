# Vehicle Diagnostics SQL Project

This project simulates real-world vehicle diagnostics using SQL. It focuses on analyzing mock CAN bus logs collected from multiple ECUs (like ECM, TCM, and BCM) to detect signal anomalies, simulate alerts, and analyze ECU behavior patterns, similar to validation process in the automotive industry.

---

## Project Structure

```
├── dataset/                → CSV logs with simulated vehicle telemetry
├── queries/                → Organized SQL query files
├── screenshots/            → Captures of query results (to be added)
├── README.md               → Project overview (this file)
├── project_pitch.md        → summary (to be added)
```

---

## Dataset Overview

The dataset `vehicle_logs_mock.csv` includes 200 entries with the following fields:

| Field         | Description                              |
|---------------|------------------------------------------|
| Timestamp     | Time of CAN message capture              |
| CAN_ID        | Unique identifier for a CAN signal       |
| ECU           | Electronic Control Unit (ECM, TCM, BCM)  |
| RPM           | Engine speed (rev/min)                   |
| Speed         | Vehicle speed (km/h)                     |
| Engine_Temp   | Engine temperature (°C)                  |
| Fuel_Level    | Remaining fuel (%)                       |

---

## Project Objectives

- Detect abnormal signal patterns (e.g., Speed > 120 km/h)
- Analyze ECU activity and signal frequency
- Simulate diagnostic alerts (e.g., high engine temp + low fuel)
- Practice core SQL operations: SELECT, WHERE, GROUP BY, COUNT, HAVING

---

## Tools Used

- SQLite (for running SQL queries)
- Google Sheets (for dataset preparation)
- GitHub (for version control and documentation)

---

## Status

- [x] Dataset generated and uploaded
- [ ] Anomaly detection queries
- [ ] ECU behavior queries
- [ ] Alert logic simulations
- [ ] Screenshots and result analysis
- [ ] Final project pitch and documentation
