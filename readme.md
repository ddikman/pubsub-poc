# pubsub ruby poc

To showcase how to connect up third party software using a gateway function which accepts a call, formats it, adds a message to a topic which then is subscribed to and handled by a different component. Allowing highly composable components.

## set up pub/sub

First up, [enable pubsub on your gcp project](https://cloud.google.com/pubsub/docs/quickstart-client-libraries#pubsub-client-libraries-ruby).

The topics and subscriptions will be created using the google deployments in `deployment/base.yaml`.

Once this is done you also need to get the service account json and store it in this local folder as `service-account.json`. These secrets would normally be injected using KMS or similar secret stores but it's outside the scope of what I'm trying to do here so.

## cloud deployment

Run the deployment (or preview by adding `--preview` at the end).

```shell script
gcloud deployment-manager deployments create article-pubsub-poc --config deployment/base.yaml
```

or to update if it is already created:

```shell script
gcloud deployment-manager deployments update article-pubsub-poc --config deployment/base.yaml
```

Templates to use can be found [here](https://cloud.google.com/deployment-manager/docs/reference/cloud-foundation-toolkit).


## skaffold

To deploy the app using helm + skaffold:

```shell script
export GCP_PROJECT=david-266106
./set-context.sh ${GCP_PROJECT}
skaffold run --default-repo gcr.io/${GCP_PROJECT}
```

## testing it

You should now be able to see both pods running under:
```shell script
kubectl get pods
stern -l app=pubsub-poc
```

Then you can try putting something on the topic:

```shell script
curl <your-public-ip>/test
```

## cleaning up

After playing with this, it's advisable to clean up, simply remove the entire deployment:

```shell script
gcloud deployment-manager deployments delete article-pubsub-poc
```
