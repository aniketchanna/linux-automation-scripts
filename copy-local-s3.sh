#!/bin/bash

# Source and destination S3 buckets
SOURCE_BUCKET="s3://bizmerlin_images"
DESTINATION_BUCKET="s3://bizmerlin-attachment"

# Text file containing the list of PDF files
PDF_LIST_FILE="/root/s3_ids.txt"

# Check if the file exists
if [[ ! -f "$PDF_LIST_FILE" ]]; then
  echo "File $PDF_LIST_FILE not found!"
  exit 1
fi

# Loop through each line in the text file and copy the file to the destination bucket
while IFS= read -r FILE; do
  echo "Transferring $FILE from $SOURCE_BUCKET to $DESTINATION_BUCKET"
  aws s3 cp "$SOURCE_BUCKET/$FILE" "$DESTINATION_BUCKET/"
  if [ $? -eq 0 ]; then
    echo "$FILE successfully transferred."
  else
    echo "Failed to transfer $FILE."
  fi
done < "$PDF_LIST_FILE"

echo "All files processed."
