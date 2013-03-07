raise 'No hosts entries found for node.' unless node['hosts']
raise 'No hosts configured for this node.' if node['hosts'].empty?

node['hosts'].each do |host|
  hostsfile_entry host['ip'] do
    ip_address host['ip']
    hostname host['name']

    aliases host['aliases'] if host['aliases']
    comment host['comment'] if host['comment']
    priority host['priority'] if host['priority']
  end
end
