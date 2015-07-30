#!/bin/sh
set -eu
: ${SCRIPTS_HOME:?}
set -x

echo "about to commit changes:: SCRIPTS_HOME=$SCRIPTS_HOME"

RELEASE_VERSION=`ruby $SCRIPTS_HOME/ruby/get-release-version-from.rb $1`
mvn -Dmessage="Update commons version to $RELEASE_VERSION" scm:checkin