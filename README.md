This is a frindly fork of [jhunt/cf-push](https://github.com/jhunt/cf-push)

cf push Github Action
=====================

This is a work in progress.


## Options

You can now pass the ``appdir`` parameter to define what directory should be used for your CF APP. This can be usefull if you have multiple cf apps in one repository

If you're not sure about the used directoy that is created in the docker container you can make use of the ``debug`` parameter to list all directories

### Example

Create you github action file and only listen to the events in a given folder

``yml

name: Deploy to Cloud Foundry
on:
  push:
    paths:
    - 'BTP/cf_python/**'
    
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name : CF PUSH
        uses: rangulvers/cf-push@main
        with:
          appdir:   './BTP/cf_python/testapp'
          api:      ${{ secrets.CF_API }}
          org:      ${{ secrets.CF_ORG }}
          space:    ${{ secrets.CF_SPACE }}
          username: ${{ secrets.CF_USERNAME }}
          password: ${{ secrets.CF_PASSWORD }}
          manifest: manifest.yml
          validate: true          
``


