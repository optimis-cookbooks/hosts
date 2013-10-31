
hosts = []
hosts << node['localhost'] if node['localhost']
hosts += node['hosts'] if node['hosts']

raise 'No localhost nor hosts found for node.' if hosts.empty? and node['hosts'].nil?

hosts.each do |host|
  hostsfile_entry host['ip'] do
    hostname host['name']
    aliases host['aliases'] if host['aliases']
    comment host['comment'] if host['comment']
    priority host['priority'] if host['priority']
  end
end
