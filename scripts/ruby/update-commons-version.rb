# Copyright © 2011-2012, Esko Luontola <www.orfjackal.net>
# This software is released under the Apache License 2.0.
# The license text is at http://www.apache.org/licenses/LICENSE-2.0

require 'date'

unless ARGV.length == 2
  puts "Usage: #{$0} POM_FILE NEW_VERSION"
  exit 1
end
POM_FILE = ARGV.shift
NEW_VERSION = ARGV.shift

old_pom = IO.read(POM_FILE)
commons_version = old_pom.scan(/<commons.version>(.*)<\/commons.version>/)[0]
puts commons_version
new_pom = old_pom.sub(/<commons.version>(.*)<\/commons.version>/,"<commons.version>"+NEW_VERSION+"<\/commons.version>")

File.open(POM_FILE, 'wb') { |file|
  file.write(new_pom)
}
