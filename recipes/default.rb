#
# Cookbook Name:: pptpd
# Recipe:: default
#
# Copyright 2014, Suraj Shirvankar
#
#
package "pptpd" do
  action :install 
end

# setup pptp config file
template "/etc/pptpd.conf" do
  source "pptpd.conf.erb"
  owner "root"
  group "root"
  mode "0664"
end

#Setup users and passowrd
template "/etc/ppp/chap-secrets" do
  source "chap-secrets.erb"
  owner "root"
  group "root"
  mode "0600"
end

#set up default dns
template "/etc/ppp/pptpd-options" do
  source "pptpd-options.erb"
  owner "root"
  group "root"
  mode "0600"
end

#setup ip forwarding
template "/etc/sysctl.conf" do
  source "sysctl.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

#iptable rules every runtime
template "/etc/rc.local" do
  source "rc.local.erb"
  owner "root"
  group "root"
  mode "0755"
end

#save iptable & sysctl && restart
execute "Save and restart" do
  command "iptables-save"
  command "sysctl -p"
  command "/etc/init.d/pptpd restart"
end