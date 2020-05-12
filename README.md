# Running Shiny app on Google App Engine

```
PROJECTID=$(gcloud config get-value project)
```

```
docker build . -t gcr.io/$PROJECTID/shinyapp
```

Test locally
```
docker run --rm -it -p 8080:8080 gcr.io/$PROJECTID/shinyapp:latest
```

Push image to Google Registry
```
gcloud auth configure-docker
docker push gcr.io/$PROJECTID/shinyapp
```

Alternatively, ultilize Googld Builds to build image
```
gcloud builds submit --tag gcr.io/$PROJECTID/shinyapp
```

Deploy to Google Cloud Run
```
gcloud app deploy --image-url gcr.io/$PROJECTID/shinyapp
```
