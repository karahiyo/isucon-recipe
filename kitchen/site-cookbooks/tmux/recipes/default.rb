#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#package "tmux" do
#	action :install
#end

package "tmux" do
	action :install
end

cookbook_file "/home/#{node['user']}/.tmux.conf" do
	source "tmux.conf"
	mode "644"
	user "#{node['user']}"
	group "#{node['user']}"
end

cookbook_file '/root/.tmux.conf' do
	source "tmux.conf"
	mode "644"
	user "root"
	group "root"
end

