#!/usr/bin/env bash

set -e

echo "Syncing S3 Bucket"

aws s3 sync --delete build/ s3://$AWS_S3_BUCKET

echo "Invalidating Cloudfront Distribution"

# force the CloudFront distributions to update their cache
aws cloudfront create-invalidation --distribution-id $AWS_CLOUDFRONT_DIST_ID --paths '/*'