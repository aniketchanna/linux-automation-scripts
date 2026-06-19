#!/bin/bash

# Define the RDS instance identifier
RDS_INSTANCE_ID="districtnex-sqlserver-std19-instance"

# Get the latest automated snapshot for the RDS instance
latest_snapshot=$(aws rds describe-db-snapshots \
    --db-instance-identifier "$RDS_INSTANCE_ID" \
    --snapshot-type automated \
    --query 'reverse(sort_by(DBSnapshots, &SnapshotCreateTime))[:1]' \
    --output json)

# Check if the latest snapshot exists
if [[ -z "$latest_snapshot" ]]; then
    echo "Snapshot validation failed: No automated snapshots found for the RDS instance."
    exit 1
fi

# Check if the latest snapshot is complete
snapshot_status=$(echo "$latest_snapshot" | jq -r '.[0].Status')

if [[ "$snapshot_status" == "available" ]]; then
    echo "Snapshot validation successful: The latest snapshot is complete."
else
    echo "Snapshot validation failed: The latest snapshot is not complete."
    echo "Snapshot Status: $snapshot_status"
fi
