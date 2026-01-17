# Snowflake Data Pipeline

This directory contains the SQL scripts used to configure Snowflake, ingest data from AWS S3, and transform it for Power BI consumption.

## Files Overview

### 1. `creating_integration.sql`

**Purpose**: Sets up the secure connection between Snowflake and AWS S3.

- Creates a `STORAGE INTEGRATION` object pointing to the S3 bucket.
- Defines the `EXTERNAL_STAGE` to access files.
- **Key Action**: You must retrieve the `STORAGE_AWS_IAM_USER_ARN` and `STORAGE_AWS_EXTERNAL_ID` from the integration description in Snowflake to update the Trust Policy in AWS IAM.

### 2. `loading_data.sql`

**Purpose**: Handles the ingestion of raw data.

- Creates the `raw_data` table schema.
- Uses the `COPY INTO` command to load CSV/JSON files from the S3 stage into the raw table.
- Handles file format options (skipping headers, handling nulls, etc.).

### 3. `data_transformation.sql`

**Purpose**: Cleans and models the data.

- Creates 'curated' or 'analytics' tables.
- Performs SQL transformations (casting types, handling duplicates, joining tables).
- Prepares views specifically for Power BI to consume.

## Usage Workflow

1. Run `creating_integration.sql` first.
2. Update AWS IAM Trust Policy with the generated credentials.
3. Run `loading_data.sql` to ingest initial data.
4. Run `data_transformation.sql` to prepare the final dataset.
