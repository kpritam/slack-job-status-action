FROM curlimages/curl:7.68.0

LABEL "com.github.actions.name"="Post Workflow Status To Slack"
LABEL "com.github.actions.description"="Post workflows Succes/Failure/Cancel jonb status to Slack using bot"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="green"

LABEL version="1.0.0"
LABEL repository="http://github.com/kpritam/slack-job-status-action"
LABEL homepage="http://github.com/kpritam/slack-job-status-action"
LABEL maintainer="Pritam Kadam"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
