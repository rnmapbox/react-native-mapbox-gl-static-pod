
version = ARGV[0]
puts "Version:#{version}"

unless version =~ /^\d\.\d\.\d$/
  STDERR.puts "Expected version as argument instead got: #{version}"
  exit 1
end

path = File.join(File.dirname(__FILE__), '@react-native-mapbox-gl-mapbox-static.template.podspec.json')

lines = []
File.readlines(path).each do |line|
  line = line.gsub(/\_\.\_\.\_/,version)
  lines.push(line)
end

File.write(File.join(File.dirname(__FILE__), "@react-native-mapbox-gl-mapbox-static.podspec.json"), lines.join(""))


puts "Please execute: `pod trunk push \"@react-native-mapbox-gl-mapbox-static.podspec.json\" --skip-import-validation --allow-warnings`"