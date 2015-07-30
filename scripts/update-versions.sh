#!/bin/sh
set -eu
: ${SCRIPTS_HOME:?}
set -x

echo "about to update versions:: SCRIPTS_HOME=$SCRIPTS_HOME"

RELEASE_VERSION=`ruby $SCRIPTS_HOME/ruby/get-release-version-from.rb $1`
POM_FILE="pom.xml"
APP_NAME=$2

ruby $SCRIPTS_HOME/ruby/update-app-version.rb $POM_FILE $RELEASE_VERSION $APP_NAME