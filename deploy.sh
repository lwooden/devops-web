#!/usr/bin/env bash

set -e

echo "Syncing S3 Bucket w/ Local Directory"

# anything that exist in the S3 bucket but not in the local 
# /build directory of the container will be deleted
aws s3 sync build/ s3://$AWS_S3_BUCKET --delete 

echo "Invalidating Cloudfront Distribution"

# force the CloudFront distributions to update their cache
aws cloudfront create-invalidation --distribution-id $AWS_CLOUDFRONT_DIST_ID --paths '/*'