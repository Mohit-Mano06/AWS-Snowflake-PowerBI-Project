# AWS–Snowflake–Power BI Analytics Project

## Overview

This project demonstrates an end-to-end data analytics pipeline using cloud storage, a data warehouse, and business intelligence tools.

## Tech Stack

- AWS S3 (data storage)
- AWS IAM (role-based access)
- Snowflake (data warehousing & SQL)
- Power BI (data visualization)

## Architecture

S3 → Snowflake (Storage Integration & IAM Role) → Power BI

## Pipeline Flow

1. Raw data files are uploaded to Amazon S3.
2. Secure access is configured using an IAM role and trust policy.
3. Snowflake uses a storage integration to load data from S3.
4. Data is transformed using SQL inside Snowflake.
5. Power BI connects to Snowflake for dashboard creation.

## Status

🚧 Project in progress – Snowflake transformations and Power BI dashboards under development.
