# AWS S3 & IAM Role Configuration

## Objective

To securely allow Snowflake and Power BI to access data stored in Amazon S3.

---

## S3 Setup

- Created an Amazon S3 bucket to store raw data files (CSV format).
- Organized data using a folder-based structure for easier ingestion.

Example structure:

```text
s3://powerbi-project.1/
├── data_season.csv
```

---

## IAM Role Configuration

- Created an IAM role named `powerbi.role`.
- Attached **AmazonS3FullAccess** policy to allow read/write access to the S3 bucket.
- The role is assumed by analytics services for secure access without hardcoding credentials.

---

## Snowflake Integration & Trust Policy

### Purpose

To allow Snowflake to securely access data stored in Amazon S3 using IAM role-based access.

---

### Storage Integration in Snowflake

- Created a **STORAGE INTEGRATION** object in Snowflake.
- This integration defines the trusted IAM role and allowed S3 locations.
- Snowflake uses this integration to access S3 without storing AWS credentials.

---

### IAM Trust Policy Update

- Updated the trust relationship of the IAM role (`powerbi.role`) to allow Snowflake to assume the role.
- Added the Snowflake-generated **External ID** to prevent the confused deputy problem.

---

### Example Trust Policy (Sanitized)

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "<SNOWFLAKE-IAM_USER_ARN>"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "sts:ExternalId": "<SNOWFLAKE-EXTERNAL_ID>"
                }
            }
        }
    ]
}
```

### Security Best Practices

- Role assumption is restricted using an external ID.
- No long-term AWS credentials are shared.
- Access is controlled via IAM trust relationships.

---

### Pipeline Usage

- Snowflake assumes the IAM role using the storage integration.
- Data is securely loaded from S3 into Snowflake tables.
- Power BI connects to Snowflake for analytics and visualization.
