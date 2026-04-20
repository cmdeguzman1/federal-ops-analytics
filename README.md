# Federal Operations Data Intelligence
### Strategic Data Warehouse Architecture for Federal Contract Management

## Project Overview
This project demonstrates an enterprise-grade transition from fragile, siloed trackers to a resilient **Snowflake Data Warehouse** architecture. It centralizes operational data from Smartsheet and SharePoint to provide a "Single Version of Truth" for federal staffing, proposal tracking, and CCDBG compliance.

## The Architecture
The pipeline is built on a **Decoupled Data Strategy**, ensuring that executive reporting remains stable even when source trackers are modified by end-users.

* **Source:** Smartsheet API (Workforce Trackers) & SharePoint (Proposal Library)
* **Ingestion:** Python (Pandas) automated ETL bridge
* **Warehouse:** Snowflake (SaaS Cloud Data Warehouse)
* **Transformation:** SQL-based "Silver Layer" for aliasing and logic abstraction
* **Visualization:** Power BI via DirectQuery

## Business Case: Why Snowflake?
In many federal contracting environments, data is "tightly coupled" to the user interface. If a Project Manager renames a column in a Smartsheet tracker, every downstream report breaks.

**This solution solves that "House of Cards" effect by:**
1.  **Logic Abstraction:** Using SQL Views to create a "shield" between the raw data and the dashboard.
2.  **Historical Benchmarking:** Capturing snapshots of staff utilization that Smartsheet cannot natively track over time.
3.  **Audit Readiness:** Providing a centralized, governed environment for federal auditors (CCDF/CCDBG) to verify staff training and clearance compliance.

## Key Technical Achievements
* **Resilient SQL Views:** Engineered a transformation layer that aliases raw source columns to permanent business terms, ensuring 100% dashboard uptime.
* **Automated Unpivoting:** Developed SQL logic to transform wide-format leave and utilization data into long-format time-series data for trend analysis.
* **Python ETL Bridge:** Scripted a secure ingestion process using the Smartsheet Python SDK to automate data movement without the high cost of third-party connectors.

## Repository Structure
* `scripts/`: Python ETL scripts for data ingestion.
* `sql_models/`: DDL and DML scripts for Snowflake table and view creation.
* `documentation/`: Architecture diagrams and Business Case documentation.
* `bi_exports/`: Power BI templates and dashboard screenshots.

---
*Note: All data used in this repository is synthetic and designed to demonstrate architectural capabilities without exposing PII or proprietary federal contract details.*
