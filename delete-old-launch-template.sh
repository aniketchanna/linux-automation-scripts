
# Define the Launch Template ID or name
LAUNCH_TEMPLATE_ID=lt-0f3ee511dc54d6040

# Get all version numbers
VERSION_LIST=$(aws ec2 describe-launch-template-versions --launch-template-id $LAUNCH_TEMPLATE_ID --query "LaunchTemplateVersions[*].VersionNumber" --output text)

# Identify versions to delete, keeping only the last 10
TO_DELETE=$(echo $VERSION_LIST | tr ' ' '\n' | sort -n | head -n -10)

# Delete the identified versions
for version in $TO_DELETE; do
    aws ec2 delete-launch-template-versions --launch-template-id $LAUNCH_TEMPLATE_ID --versions $version
done
