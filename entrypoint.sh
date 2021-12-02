#!/bin/sh -l
set -eu
cf_opts= 
if [ "x${INPUT_VALIDATE}" = "xfalse" ]; then
  cf_opts="--skip-ssl-validation"
fi
#/home/runner/work/cf_python_test_app/cf_python_test_app
echo ${INPUT_WORKDIR}

if [ -z ${INPUT_WORKDIR+x} ]; then 
  echo "WORKDIR is not set. Staying in Root Dir"; else 
    echo ${INPUT_WORKDIR}
    cd ${INPUT_WORKDIR}
fi
#change dir to push only this app
#cd {INPUT_WORKINGDIR}

# cf api ${INPUT_API} ${cf_opts}
# CF_USERNAME=${INPUT_USERNAME} CF_PASSWORD=${INPUT_PASSWORD} cf auth
# cf target -o ${INPUT_ORG} -s ${INPUT_SPACE}
# cf push -f ${INPUT_MANIFEST}
