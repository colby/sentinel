package %w(redis-server htop)

slave = node['hostname'].include? 'slave'

if slave
    priority = node['hostname'][-1].to_i * 100
else
    priority = 100
end

template '/etc/redis/redis.conf' do
    source 'redis.conf.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables ({
        :slave => slave,
        :priority => priority
    })
    notifies :restart, 'service[redis-server]', :delayed
end

service 'redis-server' do
  action [:enable, :start]
end
