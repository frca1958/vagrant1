

if File.exists?('user-data.yml') && ARGV[0].eql?('up')
  require 'open-uri'
  require 'yaml'
 
  token = open('https://discovery.etcd.io/new').read
 
  data = YAML.load(IO.readlines('user-data.yml')[1..-1].join)
  data['coreos']['etcd']['discovery'] = token
 
  yaml = YAML.dump(data)
  File.open('user-data.tmp', 'w') { |file| file.write("#cloud-config\n\n#{yaml}") }
end
