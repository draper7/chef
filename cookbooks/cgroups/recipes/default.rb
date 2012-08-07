#
# Cookbook Name:: cgroups
# Recipe:: default
#
# Copyright 2011, Dusty Hall
#
# All rights reserved - Do Not Redistribute
#
#

%w{libcgroup1 libcgroup-dev cgroup-bin}.each do |pkg|
  package pkg do
    action :install
  end
end

service "cgconfig"

cookbook_file "/etc/cgsnapshot_blacklist.conf" do
  source "cgsnapshot_blacklist.conf"
  owner "root"
  group "root"
  mode "0750"
end

cookbook_file "/etc/cgsnapshot_whitelist.conf" do
  source "cgsnapshot_whitelist.conf"
  owner "root"
  group "root"
  mode "0750"
end

cookbook_file "/etc/default/cgconfig" do
  source "cgconfig"
  owner "root"
  group "root"
  mode "0750"
end

template "/etc/cgconfig.conf" do
  source "cgconfig.conf.erb"
  mode "0750"
  owner "root"
  group "root"
  action :create
  notifies :restart, "service[cgconfig]", :immediately
end

template "/etc/cron.daily/cgsnapshot" do
  source "cgsnapshot.erb"
  mode "0755"
  owner "root"
  group "root"
  action :create
end
