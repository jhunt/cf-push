cf push Github Action
=====================

This is a work in progress.

## How to use

Create a github action that will listen to a new deployment and then push your cf app

```yml

name: Deploy to Cloud Foundry
on: push
    
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name : CF PUSH
        uses: jhunt/cf-push@main
        with:
          api:      ${{ secrets.CF_API }}
          org:      ${{ secrets.CF_ORG }}
          space:    ${{ secrets.CF_SPACE }}
          username: ${{ secrets.CF_USERNAME }}
          password: ${{ secrets.CF_PASSWORD }}
          manifest: manifest.yml
          validate: true          # set to false if you don't want to validate ssl
```

## Further Options

By passing the  ``appdir`` parameter you can define what directory should be used for your CF APP. This can be usefull if you have multiple cf apps in one repository.

If you're not sure about the used directoy that is created in the docker container you can make use of the ``debug`` parameter to list all directories in the output of the actions log

```yml

name: Deploy to Cloud Foundry
on:
  push:
    paths:
    - 'PATH/TO/YOUR/CF_APP/**'
    
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name : CF PUSH
        uses: jhunt/cf-push@main
        with:
          appdir:   './PATH/TO/YOUR/CF_APP'       # use the appdir option to select a specif folder where the cf app is stored
          api:      ${{ secrets.CF_API }}
          org:      ${{ secrets.CF_ORG }}
          space:    ${{ secrets.CF_SPACE }}
          username: ${{ secrets.CF_USERNAME }}
          password: ${{ secrets.CF_PASSWORD }}
          manifest: manifest.yml
          validate: true          
```


