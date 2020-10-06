#!/bin/sh
set -eu
cf api ${INPUT_API}
CF_USERNAME=${INPUT_USERNAME} CF_PASSWORD=${INPUT_PASSWORD} cf auth
cf target -o ${INPUT_ORG} -s ${INPUT_SPACE}
cf push -f ${INPUT_MANIFEST}
