#!/bin/sh 


clientid='YOUR_CLIENT_ID'
clientsecret='YOUR_CLIENT_SECRET'
while read LINE; do
  echo $LINE
  message=$LINE
done
phonenumber=$1
accesstoken=`curl https://api.att.com/oauth/token -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=$clientid&client_secret=$clientsecret&grant_type=client_credentials&scope=SMS" | grep "access_token" | sed 's/^.*:"//' | sed 's/".*$//'`

payload="{ \"outboundSMSRequest\": { \"address\":  \"tel:$phonenumber\" , \"message\":\"$message\" }}"
echo "sending SMS"
echo $payload
curl https://api.att.com/sms/v3/messaging/outbox -X POST -H "Authorization: Bearer $accesstoken" -d "$payload" -H "Content-Type: application/json"
