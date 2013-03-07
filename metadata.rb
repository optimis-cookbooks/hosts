maintainer        'OptimisCorp., Inc.'
maintainer_email  'ops+cookbooks@optimiscorp.com'

license           'Apache 2.0'

description       'Configures /etc/hosts entries using node attributes.'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version           '0.0.1'

recipe            'chef-hostsfile::default', 'Configures /etc/hosts entries.'

%w{redhat centos scientific fedora debian ubuntu arch freebsd amazon}.each do |os|
  supports os
end

depends 'hostsfile'

attribute 'hosts',
  :display_name => 'Hosts',
  :description => 'An array of /etc/hosts entries.',
  :type => 'array'
