# pubsub ruby poc

To showcase how to connect up third party software using a gateway function which accepts a call, formats it, adds a message to a topic which then is subscribed to and handled by a different component. Allowing highly composable components.

## set up pub/sub

First up, [enable pubsub on your gcp project](https://cloud.google.com/pubsub/docs/quickstart-client-libraries#pubsub-client-libraries-ruby).

Assign your project name to an env variable, this will be used in the ruby scripts as well. You will also need to specify the filepath to the service account credentials to use:

```shell script
PUBSUB_PROJ_NAME=<your-project-name>
GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/service-account.json
```

Enable the topic and subscriber:

```shell script
gcloud config set project $PUBSUB_PROJ_NAME
gcloud pubsub topics create article-updates-topic
gcloud pubsub subscriptions create article-updates-sub --topic article-updates-topic
```