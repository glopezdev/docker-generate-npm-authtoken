#!/bin/bash

if [ -z "$NPM_USER" ]; then
    echo "NPM_USER is not set!"
    exit 1
fi
if [ -z "$NPM_PASS" ]; then
    echo "NPM_PASS is not set!"
    exit 1
fi
if [ -z "$NPM_EMAIL" ]; then
    echo "NPM_EMAIL is not set!"
    exit 1
fi
if [ -z "$NPM_REGISTRY" ]; then
    NPM_REGISTRY="http://npm.amcstealth.com"
fi
if [ -z "$NPM_SCOPE" ]; then
    NPM_SCOPE_OPTION=""
else
    NPM_SCOPE_OPTION="--scope=$NPM_SCOPE"
fi

npm set registry $NPM_REGISTRY
/usr/local/bin/exp.sh "npm login" $NPM_USER $NPM_PASS $NPM_EMAIL >/dev/null 2>&1

npm set always-auth true

if [ ! -e ~/.npmrc ]; then
    echo "error logging into npm"
    exit 1
else
    echo $(cat ~/.npmrc) | sed 's/[[:blank:]]\+/\n/g'
fi

