#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {dev|pro}"
    exit 1
fi

ENV=$1
VALUES_FILE="values-$ENV.yml"

if [ ! -f $VALUES_FILE ]; then
    echo "Values file for environment '$ENV' not found!"
    exit 1
fi

# Load the values
NAMESPACE=$(yq eval '.namespace' $VALUES_FILE)
MYALIAS=$(yq eval '.myalias' $VALUES_FILE)

# Replace variables in CRD_template.yml
sed -e "s/{{namespace}}/$NAMESPACE/g" \
    -e "s/{{myalias}}/$MYALIAS/g" \
    CRD_template.yml > CRD.yml

# Apply the CRD
kubectl apply -f CRD.yml
