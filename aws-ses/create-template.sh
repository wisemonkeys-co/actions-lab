#!/bin/bash
sed 's/"/\\\"/g' htmlPart.html | tr -d "\n" > f.html
html=$(cat f.html)
#sed "s/nome/$1/" base.json | sed "s/html/$html/"

echo "{\"Template\": {\"TemplateName\": \""$1"\", \
\"SubjectPart\": \"Wise Billing {{version}}\",
\"HtmlPart\": \""$html"\",
\"TextPart\": \"Versão {{version}}\" }}"  > template.json

aws ses create-template --cli-input-json file://template.json
# aws ses delete-template --template-name "Lab01"
