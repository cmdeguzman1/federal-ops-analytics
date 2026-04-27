# Federal Operations Data Intelligence
### Strategic Data Warehouse Architecture for Federal Contract Management

## Project Overview
This project demonstrates an enterprise-grade transition from fragile, siloed trackers to a resilient Snowflake Data Warehouse architecture. It centralizes operational data from Smartsheet and SharePoint to provide a "Single Version of Truth" for federal staffing, proposal tracking, and CCDF (Child Care and Development Fund) compliance.

## The Architecture: Medallion Design
The pipeline follows the Medallion Architecture (Bronze, Silver, Gold), ensuring data quality and governance at every stage.

* **Source:** Smartsheet API (Workforce Trackers) & SharePoint (Proposal Library)
* **Ingestion:** Python-based Snowpark automation (Managed Landing Zone)
* **Warehouse:** Snowflake (SaaS Cloud Data Warehouse)
* **Transformation:** SQL-native logic for schema enforcement and business rules
* **Visualization:** Power BI via DirectQuery

## Data Ingestion: The "Managed Landing" Strategy
Unlike basic ETL processes, this project utilizes a Dynamic Python Ingestion Loop within Snowflake. Instead of manually mapping individual spreadsheets, the system uses a "mailbox" approach:

* **Landng Zone:** Raw Smartsheet exports are staged in a secure internal Snowflake Stage (LANDING_ZONE).
* **Snowpark Automation:** A custom Python script utilizes iterative logic to scan the stage and automatically generate tables in the BRONZE layer.
* **Schema on Write:** The script dynamically handles naming conventions and data types, allowing for a scalable intake of multiple trackers (Staffing, Tasks, Proposals, etc.) without manual SQL intervention.

## Business Case: Why Snowflake?
In many federal contracting environments, data is "tightly coupled" to the user interface. If a Project Manager renames a column in a Smartsheet tracker, every downstream report breaks.

**This solution solves that "House of Cards" effect by:**
1.  **Logic Abstraction:** Using SQL Views to create a "shield" between the raw data and the dashboard.
2.  **Historical Benchmarking:** Capturing snapshots of staff utilization that Smartsheet cannot natively track over time.
3.  **Audit Readiness:** Providing a centralized, governed environment for federal auditors (CCDF/CCDBG) to verify staff training and clearance compliance.

## Key Technical Achievements
* **Dynamic Ingestion Loop:** Engineered a Snowpark-based Python pipeline that automates the migration of multiple CSV sources into the Snowflake BRONZE layer, eliminating manual table creation.
* **Resilient SQL Views:** Developed a SILVER transformation layer using SQL Views to alias raw source columns into permanent business terms, ensuring 100% dashboard uptime even if source trackers are modified.
* **Automated Unpivoting & Time-Series Prep:** Authored SQL logic to transform "wide" utilization and leave data into "long" formats, enabling trend analysis and historical benchmarking for federal staffing reports.

## Repository Structure
* `ingestion/`: Python Snowpark scripts for dynamic data ingestion from stages.
* `transformations/`: SQL scripts for Silver/Gold layer modeling.
* `docs/`: CCDF Logic models and architecture diagrams.
* `requirements.txt`: Python dependencies for the Snowpark environment.

---
*Note: All data used in this repository is synthetic and designed to demonstrate architectural capabilities without exposing PII or proprietary federal contract details.*
