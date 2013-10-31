raise 'No localhost entries found for node.' unless node['localhost']
raise 'No hosts entries found for node.' unless node['hosts']
raise 'No hosts configured for this node.' if node['hosts'].empty?

localhost = node['localhost']
hostsfile_entry localhost['ip'] do
  hostname localhost['name']
  aliases localhost['aliases'] if localhost['aliases']
  comment localhost['comment'] if localhost['comment']
  priority localhost['priority'] if localhost['priority']
end

node['hosts'].each do |host|
  hostsfile_entry host['ip'] do
    hostname host['name']

    aliases host['aliases'] if host['aliases']
    comment host['comment'] if host['comment']
    priority host['priority'] if host['priority']
  end
end
