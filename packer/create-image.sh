#!/bin/bash -e

# Set AWS API keys to blank strings if not
# set in the environment
# (passed to Packer)
AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID:-""}
AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY:-""}

# Default VPC for building
PACKER_VPC=${PACKER_VPC:-vpc-f399e097}
# Default VPC subnet for building
PACKER_SUBNET=${PACKER_SUBNET:-subnet-d68818eb}

# Validate that the ZAP Packer template is conformant
packer validate ./zap-ami-packer.json

# Launch the Packer build of the ZAP AMI
#export PACKER_LOG=1
packer build -var aws_access_key=${AWS_ACCESS_KEY_ID} \
             -var aws_secret_key=${AWS_SECRET_ACCESS_KEY} \
             -var vpc_id_to_build_ami_in=${PACKER_VPC} \
             -var subnet_id_to_build_ami_in=${PACKER_SUBNET} \
             ./zap-ami-packer.json
