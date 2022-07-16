#!/bin/bash

#
#  NOTE: this file is intended as a representation of aws configurations made to the account hosting this website. It should not be run as a script.
#


################
#    Groups    #
################

#EC2 admin
aws iam create-group --group-name EC2-Admin
aws iam attach-group-policy --group-name EC2-Admin --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess

#S3 admin
aws iam create-group --group-name S3-Admin
aws iam attach-group-policy --group-name S3-Admin --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

###############
#    Users    #
###############
aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json

#Non-root Primary User
aws iam create-user --user-name Admin-1
aws iam create-login-profile --cli-input-json Admin-1-profile.json --user-name Admin-1
