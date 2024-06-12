#!/bin/bash
sed "s/nome/$1/g" base-mail.json > mail.json
aws ses send-templated-email --cli-input-json file://mail.json