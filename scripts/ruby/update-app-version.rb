# Copyright © 2011-2012, Esko Luontola <www.orfjackal.net>
# This software is released under the Apache License 2.0.
# The license text is at http://www.apache.org/licenses/LICENSE-2.0

require 'date'

unless ARGV.length == 3
  puts "Usage: #{$0} POM_FILE NEW_VERSION APP_NAME"
  exit 1
end
POM_FILE = ARGV.shift
NEW_VERSION = ARGV.shift
APP_NAME = ARGV.shift

old_pom = IO.read(POM_FILE)
commons_version = old_pom.scan(/<#{APP_NAME}.version>(.*)<\/#{APP_NAME}.version>/)[0]
puts "Old version =#{commons_version}"
puts "New version =#{NEW_VERSION}"
new_pom = old_pom.sub(/<#{APP_NAME}.version>(.*)<\/#{APP_NAME}.version>/,"<#{APP_NAME}.version>"+NEW_VERSION+"<\/#{APP_NAME}.version>")

File.open(POM_FILE, 'wb') { |file|
  file.write(new_pom)
}
