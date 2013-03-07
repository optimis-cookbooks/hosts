raise 'No hosts entries found for node.' unless node['hosts']
raise 'No hosts configured for this node.' if node['hosts'].empty?

node['hosts'].each do |host|
  Chef::Log.debug host.inspect

  hostsfile_entry host['ip'] do
    hostname host['name']

    aliases host['aliases'] if host['aliases']
    comment host['comment'] if host['comment']
    priority host['priority'] if host['priority']
  end
end
