#!/bin/sh

RELEASE_VERSION=`ruby /Users/antonio.nascimento/_dev/_projects/go_poc/scripts/ruby/get-release-version-from.rb $1`
POM_FILE="pom.xml"
APP_NAME=$2

ruby /Users/antonio.nascimento/_dev/_projects/go_poc/scripts/ruby/update-app-version.rb $POM_FILE $RELEASE_VERSION $APP_NAME