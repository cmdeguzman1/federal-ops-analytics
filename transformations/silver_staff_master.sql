create or replace view staff_master as
select
    nullif(trim("Staff_ID"), '') as "staff_id",
    split_part(trim("Full_Name"), ' ', 1) as "first_name",
    split_part(trim("Full_Name"), ' ', 2) as "last_name",
    nullif(trim("Full_Name"), '') as "full_name",
    nullif(trim("Project_Name"), '') as "project_name",
    nullif(trim("Department"), '') as "department",
    nullif(trim("Job_Title"), '') as "job_title",
    nullif(trim("Employee_Type"), '') as "employee_type",
    nullif(trim("Employment_Status"), '') as "employment_status",
    lower(nullif(trim("Email"), '')) as "email_address",
    datediff('day', to_date(nullif(trim("Hire_Date"), '')), to_date(nullif(trim("Date_Left"), ''))) as "total_days_employed",
    round(datediff('day', to_date(nullif(trim("Hire_Date"), '')), to_date(nullif(trim("Date_Left"), ''))) / 30, 1) as "approx_months_employed"

from federal_ops.bronze.smartsheet_staff_master_v4;