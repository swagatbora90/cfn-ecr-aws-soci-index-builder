# AWS SOCI Index Builder

This AWS solution automates the generation of Seekable OCI (SOCI) index artifacts and stores them in Amazon ECR. It provides an easy way for customers to try SOCI technology to lazily load container images.

## Overview

The AWS SOCI Index Builder solution consists of the following components:

1. **EventBridge Rule**: Triggers when an image is pushed to ECR
2. **ECR Image Action Event Filtering Lambda**: Filters ECR image push events based on repository and tag patterns
3. **SOCI Index Generator Lambda**: Generates SOCI index artifacts for the image and pushes them back to ECR

## SOCI Index Versions

The solution supports two versions of SOCI index:

- **V1**: The original SOCI index format
- **V2**: An improved format that provides better performance and reduced storage requirements

## Configuration Parameters

### SociRepositoryImageTagFilters

Comma-separated list of SOCI repository image tag filters. Each filter is a repository name followed by a colon, ":" and followed by a tag. Both repository names and tags may contain wildcards denoted by an asterisk, "*".

Examples:
- `prod*:latest`: Matches all images tagged with "latest" that are pushed to any repositories that start with "prod"
- `dev:*`: Matches all images pushed to the "dev" repository
- `*:*`: Matches all images pushed to all repositories in your private registry

### SociIndexVersion

The version of SOCI index to generate:
- `V1`: The original SOCI index format
- `V2`: Improved format with better performance and reduced storage requirements

## How It Works

1. When an image is pushed to ECR, an EventBridge rule triggers the ECR Image Action Event Filtering Lambda
2. The Lambda checks if the image matches the configured filters
3. If there's a match, it invokes the SOCI Index Generator Lambda
4. The SOCI Index Generator Lambda:
   - Pulls the image from ECR
   - Generates SOCI index artifacts using the specified version (V1 or V2)
   - Pushes the SOCI index artifacts back to ECR

