cookbook_file '/etc/init.d/redis-sentinel' do
    source 'init'
    owner 'root'
    group 'root'
    mode 0755
end

cookbook_file '/etc/redis/redis-sentinel.conf' do
    source 'sentinel.conf'
    owner 'root'
    group 'root'
    mode 0755
end

service 'redis-sentinel' do
   action [:enable, :start]
end
