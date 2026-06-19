# linux-automation-scripts

Production-tested Bash scripts for AWS infrastructure management, Linux server administration, and automation. Built from real day-to-day DevOps work across production environments at BizmerlinHR (ClayHR) and E-Soft Communication.

> These scripts solve real problems encountered in production — not written for demo purposes.

---

## 📁 Repository structure

```
linux-automation-scripts/
├── production-scripts/
│   ├── aws-ami-snapshots/
│   │   ├── delete-old-ami-snapshots.sh     # Delete AMIs older than N days + deregister
│   │   ├── deregister-ami.sh               # Deregister a specific AMI and its snapshots
│   │   ├── deregister-ec2-instance.sh      # Safely deregister a static EC2 instance
│   │   └── delete-old-launch-template.sh   # Clean up old EC2 launch template versions
│   ├── aws-s3/
│   │   ├── copy-local-to-s3.sh             # Copy local files/directories to S3 bucket
│   │   ├── download-s3-attachment.sh       # Download S3 objects to local path
│   │   ├── remove-s3-recursive.sh          # Recursively remove objects from S3 path
│   │   ├── s3-attachment-migration.sh      # Migrate attachments between S3 buckets
│   │   └── s3-images-migration.sh          # Migrate images between S3 buckets/prefixes
│   ├── aws-rds/
│   │   └── validate-rds-backup.sh          # Verify RDS automated backup exists and is recent
│   ├── deployments/
│   │   ├── angular-deployment.sh           # Build and deploy Angular app to server/S3
│   │   └── app-update.sh                   # Pull latest code and restart application
│   └── system/
│       ├── disk-usage-alert.sh             # Alert if disk usage crosses threshold (default 80%)
│       ├── disk-usage-report.sh            # Generate disk usage report across all mount points
│       ├── cpu-load-monitor.sh             # Monitor CPU load and log/alert on high usage
│       ├── create-user.sh                  # Create Linux user with SSH key and sudo access
│       ├── service-nrpe-check.sh           # NRPE service check for Nagios monitoring
│       └── realdata-export.sh              # Export real application data to file/S3
└── bash-fundamentals/
    ├── argument-script.sh                  # Working with $1 $2 arguments in scripts
    ├── basic-operator.sh                   # Arithmetic and comparison operators
    ├── simple-var.sh                       # Variable declaration and usage
    ├── variable-script.sh                  # Advanced variable patterns
    ├── if-else.sh                          # Conditional logic examples
    ├── for-loop2-simple.sh                 # Simple for loop patterns
    ├── for-looping-script.sh               # For loop with real use cases
    ├── while-loop.sh                       # While loop patterns
    ├── infinite-loop.sh                    # Infinite loop with break condition
    ├── input-output.sh                     # read input and echo output
    └── exit-status.sh                      # Exit codes and error handling
```

---

## 🔍 Script highlights

### delete-old-ami-snapshots.sh
Cleans up old AMIs and their associated EBS snapshots automatically.
Used in production to prevent AWS snapshot costs from accumulating over time.

```bash
# Usage
./delete-old-ami-snapshots.sh --days 30 --region ap-south-1
```

---

### validate-rds-backup.sh
Verifies that an RDS automated backup exists and was taken within the expected window.
Used as a daily cron job to catch backup failures before they become a recovery problem.

```bash
# Usage
./validate-rds-backup.sh --db-instance myapp-db --region ap-south-1
```

---

### s3-attachment-migration.sh + s3-images-migration.sh
Migrate objects between S3 buckets or prefixes — used during application infrastructure moves.
Handles large datasets by processing in batches with progress logging.

```bash
# Usage
./s3-attachment-migration.sh \
  --source s3://old-bucket/attachments/ \
  --dest s3://new-bucket/attachments/
```

---

### disk-usage-alert.sh
Monitors disk usage across all mount points and sends an alert if any crosses the threshold.
Sends notification via webhook (Slack/Teams) or email.

```bash
# Usage — run as cron every 15 minutes
*/15 * * * * /opt/scripts/disk-usage-alert.sh --threshold 80
```

---

### angular-deployment.sh
Automates Angular application build and deployment — pulls latest code, runs `npm build`, and deploys the dist folder to the target server or S3 bucket.

---

### create-user.sh
Creates a Linux user with configurable home directory, SSH public key injection, and optional sudo access. Used for onboarding new team members to production servers.

---

## 🖥️ Tested on

- RHEL 7 / 8 / 9
- Ubuntu 20.04 / 22.04
- AWS CLI v2 (required for all AWS scripts)

---

## ⚙️ Prerequisites

For AWS scripts:
```bash
# AWS CLI must be configured
aws configure

# Required IAM permissions vary by script:
# AMI scripts     → ec2:DescribeImages, ec2:DeregisterImage, ec2:DeleteSnapshot
# S3 scripts      → s3:GetObject, s3:PutObject, s3:DeleteObject, s3:ListBucket
# RDS scripts     → rds:DescribeDBInstanceAutomatedBackups
```

---

## 📌 Related repos

- [aws-cloudformation-templates](https://github.com/aniketchanna/aws-cloudformation-templates) — CloudFormation templates for VPC, EC2, RDS, Lambda, S3
- [docker-compose-stacks](https://github.com/aniketchanna/docker-compose-stacks) — Docker Compose setups for monitoring, logging, Rails
- [cicd-pipeline-examples](https://github.com/aniketchanna/cicd-pipeline-examples) — Jenkins and GitHub Actions pipelines

---

## 👤 Author

**Aniket Channa** — Senior DevOps Engineer  
8 years experience · AWS (70%) · Azure/GCP (30%) · Open to remote worldwide  
[LinkedIn](https://linkedin.com/in/aniketchanna) · [GitHub](https://github.com/aniketchanna) · IST (UTC+5:30)
