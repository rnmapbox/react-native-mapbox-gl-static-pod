
version = ARGV[0]
puts "Version:#{version}"

unless version =~ /^\d\.\d\.\d$/
  STDERR.puts "Expected version as argument instead got: #{version}"
  exit 1
end

path = File.join(File.dirname(__FILE__), 
  if version.split('.')[0] == "5"
    '@react-native-mapbox-gl-mapbox-static.5.template.podspec.json'
  else
    '@react-native-mapbox-gl-mapbox-static.template.podspec.json'
  end
)

lines = []
File.readlines(path).each do |line|
  line = line.gsub(/\_\.\_\.\_/,version)
  lines.push(line)
end

File.write(File.join(File.dirname(__FILE__), "@react-native-mapbox-gl-mapbox-static.podspec.json"), lines.join(""))

if ARGV[1] == "publish"
  system("pod trunk push \"@react-native-mapbox-gl-mapbox-static.podspec.json\" --skip-import-validation --allow-warnings")
else
  puts "Please execute: `pod trunk push \"@react-native-mapbox-gl-mapbox-static.podspec.json\" --skip-import-validation --allow-warnings`"
end