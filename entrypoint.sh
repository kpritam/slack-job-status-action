#!/bin/sh

set -eu

JOB_STATUS=$1
SLACK_BOT_TOKEN=$2
CHANNEL=$3

REPO_NAME=${GITHUB_REPOSITORY##*/}
REPOSITORY=$GITHUB_REPOSITORY
WORKFLOW=$GITHUB_WORKFLOW
BRANCH=${GITHUB_REF##*/}
RUN_ID=$GITHUB_RUN_ID

slackMsg() {
  title=$1
  color=$2
  msg="{\"channel\":\"$CHANNEL\", \"attachments\": [ { \"title\":\"$title\", \"text\": \"[ $REPO_NAME ] : [ $WORKFLOW ] : [ $BRANCH ] \n https://github.com/$REPOSITORY/actions/runs/$RUN_ID\", \"color\": \"$color\" } ]}"
}

if [ "$JOB_STATUS" = 'Success' ]; then
  slackMsg "SUCCESS" "#00FF00"
elif [ "$JOB_STATUS" = 'Cancelled' ]; then
  slackMsg "CANCELLED" "#EE6F47"
else
  slackMsg "FAILURE" "#FF0000"
fi

curl -X POST \
     -H "Content-type: application/json" \
     -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
     -d "$msg" \
     https://slack.com/api/chat.postMessage
