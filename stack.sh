#!/bin/bash

usagehelp() {
  echo
  echo 'Usage:'
  echo './stack.sh {network|udagram} {create|update|delete}'
  echo
  exit 1
}

defaultRegion=us-east-1

case "$1" in
network)
  stackName=$1
  ;;
udagram)
  stackName=$1
  ;;
*)
  usagehelp
  ;;
esac

case "$2" in
create)
  aws cloudformation create-stack \
    --stack-name ${stackName} \
    --template-body file://${stackName}.yml \
    --parameters file://${stackName}-parameters.json \
    --capabilities "CAPABILITY_NAMED_IAM" \
    --region=${defaultRegion}
  ;;
update)
  aws cloudformation update-stack \
    --stack-name ${stackName} \
    --template-body file://${stackName}.yml \
    --parameters file://${stackName}-parameters.json \
    --capabilities "CAPABILITY_NAMED_IAM" \
    --region=${defaultRegion}
  ;;
delete)
  aws cloudformation delete-stack \
    --stack-name ${stackName} \
    --region=${defaultRegion}
  ;;
*)
  usagehelp
  ;;
esac
