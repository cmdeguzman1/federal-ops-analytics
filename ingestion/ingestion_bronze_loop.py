import snowflake.snowpark as snowpark

def main(session: snowpark.Session):
    
    files = session.sql("LS @federal_ops.BRONZE.LANDING_ZONE").collect()
    
    processed_tables = []

    for file in files:
        full_path = file['name']
        
        table_name = full_path.split('/')[-1].replace('.csv', '').upper()
        
        df = session.read.options({"field_delimiter": ",", "parse_header": True}).csv(f"@federal_ops.BRONZE.{full_path}")
        
        full_table_path = f"federal_ops.BRONZE.{table_name}"
        df.write.mode("overwrite").save_as_table(full_table_path)
        
        processed_tables.append(table_name)
    
    return f"Success! Created: {', '.join(processed_tables)}"