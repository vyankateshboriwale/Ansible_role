#!/bin/bash

PROJECT=$(gcloud config get-value project)
PROJECT="cicdpipeline"
SERVICE_ACCOUNT_NAME="gcp-terraformtest"
STORAGE="NEARLINE"
LOCATION="us-central1-a"
GCP_BUCKET="cards"

#Create service account
gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME --display-name "gcp terraform service-accounts"

#Check service account is create or not with given name
gcloud iam service-accounts list --filter $SERVICE_ACCOUNT_NAME

#Create key file, default extension is .json
gcloud iam service-accounts keys create --iam-account $SERVICE_ACCOUNT_NAME@$PROJECT.iam.gserviceaccount.com $SERVICE_ACCOUNT_NAME".json"

#assign role to newly created service account
gcloud projects add-iam-policy-binding cicdpipeline --member "serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT.iam.gserviceaccount.com" --role "roles/storage.admin"
gcloud projects add-iam-policy-binding cicdpipeline --member "serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT.iam.gserviceaccount.com" --role "roles/storage.object.admin"
#Activate service account for use 
#gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_NAME".json"

#Set new serivice account as default to perform action
#gcloud config set account $SERVICE_ACCOUNT_NAME@$PROJECT.iam.gserviceaccount.com

#gsutil mb -p $PROJECT -c $storage_class -l $location -b on gs://$GCP_BUCKET/
gsutil mb -p $PROJECT -l us-east1 gs://hsbccards/
gsutil cp $SERVICE_ACCOUNT_NAME".json" gs://hsbccards
gsutil ls gs://bucket

echo "################### New service account details as below ####################"
echo "service account name : "$SERVICE_ACCOUNT_NAME
echo "service account key name :"$SERVICE_ACCOUNT_NAME

