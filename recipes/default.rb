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
  command "iptables -I INPUT -p tcp --dport 1723 -j ACCEPT"
  command "iptables -I INPUT -p gre -j ACCEPT"
  command "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE"
  command "iptables -A FORWARD -i ppp+ -o eth0 -j ACCEPT"
  command "iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT"
  command "iptables-save"
  command "sysctl -p"
end

service "pptpd" do
  action :restart
end

service "rc.local" do
  action :start
end
