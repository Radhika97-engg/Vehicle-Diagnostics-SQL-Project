# Vehicle Diagnostic Analyzer (SQL-Based)

This mini-project simulates real-world vehicle diagnostics using SQL, focusing on analyzing CAN-style telemetry logs to detect signal anomalies, simulate alert logic, and assess ECU behavior patterns — just like in automotive validation environments.

---

## Project Purpose
To demonstrate how SQL can be used to:
- Detect abnormal vehicle signals (e.g., low RPM at high speed)
- Simulate diagnostics alerts (overheat, idle mismatch, fuel drop)
- Analyze ECU message frequency and CAN ID patterns

---

## Real-World Relevance
This reflects how engineering support and validation teams handle vehicle data to:
- Investigate field issues
- Perform root cause analysis
- Validate system performance using signal trends

---

## Core Concepts Applied
- `CASE`-based alert simulation
- Frequency and anomaly detection queries
- Time-based diagnostics (e.g., signal delays, overheat timestamps)
- Modular, readable SQL scripts (GROUP BY, HAVING, STRFTIME, etc.)

---

## Tools Used
- SQLiteStudio (3.4)
- Google Sheets (mock data creation)
- GitHub (versioning + documentation)

---

## Outcome
This project bridges embedded diagnostics and data analytics using pure SQL logic. It simulates the thought process of a validation/test engineer working on signal-based diagnostics.


