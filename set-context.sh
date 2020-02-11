#!/bin/bash

THIS_SCRIPT=`basename "$0"`

usage () {
    echo "usage: ${THIS_SCRIPT} <project-name>"
}

if [[ ${1} == "--help" ]]; then
    usage
    exit 1
fi

PROJECT=$1
REGION=asia-northeast1
CLUSTER=article-pubsub-cluster
gcloud config set project ${PROJECT}
gcloud container clusters get-credentials --project ${PROJECT} --region ${REGION} ${CLUSTER}
kubectl config set-context $(kubectl config current-context)
