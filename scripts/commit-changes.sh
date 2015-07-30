#!/bin/sh
RELEASE_VERSION=`ruby /Users/antonio.nascimento/_dev/_projects/go_poc/scripts/ruby/get-release-version-from.rb $1`
mvn -Dmessage="Update commons version to $RELEASE_VERSION" scm:checkin