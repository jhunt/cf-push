#!/bin/sh
set -eu
cf_opts= 
if [ "x${INPUT_VALIDATE}" = "xfalse" ]; then
  cf_opts="--skip-ssl-validation"
fi

if [ "x${INPUT_DEBUG}" = "xtrue" ]; then
  echo "Your selected APPDIR : ${INPUT_APPDIR}"
  ls -R
fi

if [ -z ${INPUT_APPDIR+x} ]; then 
  echo "WORKDIR is not set. Staying in Root Dir"; else 
    echo ${INPUT_APPDIR}
    cd ${INPUT_APPDIR}
fi

cf api ${INPUT_API} ${cf_opts}
CF_USERNAME=${INPUT_USERNAME} CF_PASSWORD=${INPUT_PASSWORD} cf auth
cf target -o ${INPUT_ORG} -s ${INPUT_SPACE}
cf push -f ${INPUT_MANIFEST}
