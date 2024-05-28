#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {dev|pre|pro}"
    exit 1
fi

ENV=$1
VALUES_FILE="values-$ENV.yml"

if [ ! -f "$VALUES_FILE" ]; then
    echo "Values file for environment '$ENV' not found!"
    exit 1
fi

# Load the values using yq and trim any extra spaces
ENVIROMENT=$(yq eval '.enviroment' "$VALUES_FILE" | xargs)
MYALIAS=$(yq eval '.myalias' "$VALUES_FILE" | xargs)
APPDEFINITION=$(yq eval '.appdefinition' "$VALUES_FILE" | xargs)

# Print the values to debug
echo "ENVIROMENT: $ENVIROMENT"
echo "MYALIAS: $MYALIAS"
echo "APPDEFINITION: $APPDEFINITION"

# Export variables for envsubst
export ENVIROMENT
export MYALIAS
export APPDEFINITION

# Replace variables in CRD_template.yml using envsubst
envsubst < CRD_template.yml > CRD.yml

# Apply the CRD
kubectl apply -f CRD.yml
