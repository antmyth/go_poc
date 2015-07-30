require 'rexml/document'

def get_release_version(snapshot_version)
  snapshot_suffix = /-SNAPSHOT$/
  unless snapshot_version =~ snapshot_suffix
    raise "Not a snapshot version: #{snapshot_version}"
  end
  snapshot_version.gsub(snapshot_suffix, "")
end

unless ARGV.length == 1
  puts "Usage: #{$0} POM_FILE_TO_READ"
  exit 1
end
POM_FILE_TO_READ = ARGV.shift

pom = REXML::Document.new(File.new(POM_FILE_TO_READ))
old_version = pom.elements["/project/version"].text
new_version = get_release_version(old_version)

puts new_version
