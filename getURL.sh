#!/bin/bash
publicURL=$(aws cloudformation describe-stacks --stack-name udagram --query "Stacks[0].Outputs" --output text | awk -F"\t" '{ print $4 }')
sed -i "s|Click to test: .*|Click to test: ${publicURL}|" README.md
echo ${publicURL}
