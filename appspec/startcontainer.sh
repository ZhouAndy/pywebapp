#!/bin/bash
$(aws ecr get-login --no-include-email --region us-east-1)
docker pull 376180697510.dkr.ecr.us-east-1.amazonaws.com/zhouandy/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 376180697510.dkr.ecr.us-east-1.amazonaws.com/zhouandy/pywebapp:latest
