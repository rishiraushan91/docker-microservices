#!/bin/bash


set -e
echo "################################"
echo "Initializing local infra"
echo "################################"
sleep 5

# dummy AWS credentials
export AWS_ACCESS_KEY_ID=local
export AWS_SECRET_ACCESS_KEY=local
export AWS_DEFAULT_REGION=local

# AUTH CONFIG - create S3 bucket for local auth and cp file
echo "Setting up auth bucket"
aws s3 --endpoint-url='http://localstack:4572' mb s3://auth > /dev/null
echo -n "user:password" > local-auth.txt
aws s3 --endpoint-url='http://localstack:4572' cp local-auth.txt s3://auth/xdr-query-svc.txt > /dev/null
aws s3 --endpoint-url='http://localstack:4572' cp local-auth.txt s3://auth/mockserver.txt > /dev/null

echo "################################"
echo "Done! Initialized local infra"
echo "################################"

java -jar /docker-microservices.jar
