#!/bin/bash -e

packer validate ./zap-ami-packer.json

#export PACKER_LOG=1
packer build -var aws_access_key=${AWS_ACCESS_KEY_ID} \
             -var aws_secret_key=${AWS_SECRET_ACCESS_KEY} \
             ./zap-ami-packer.json
