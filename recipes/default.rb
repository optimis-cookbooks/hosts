raise 'No hosts entries found for node.' unless node['hosts']
raise 'No hosts configured for this node.' if node['hosts'].empty?

include_recipe 'hostsfile'

node['hosts'].each do |host|
  hostsfile_entry host['ip'] do
    hostname host['name']

    if host['aliases']
      aliases host['aliases']
    end

    if host['comment']
      comment host['comment']
    end

    if host['priority']
      priority host['priority']
    end
  end
end
