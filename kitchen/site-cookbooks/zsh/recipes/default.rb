#
# Cookbook Name:: zshrc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install zsh
package "zsh" do
	action :install
end

## for user
cookbook_file "/home/#{node['user']}/.zshrc_yu_ke" do
	source "zshrc4user"
	mode "644"
	user "#{node['user']}"
	group "#{node['user']}"
end

cookbook_file "/home/#{node['user']}/.zshenv_yu_ke" do
	source "zshenv4user"
	mode "644"
	user "#{node['user']}"
	group "#{node['user']}"
end

## for root
cookbook_file '/root/.zshrc' do
	source "zshrc4root"
	mode "644"
	user "root"
	group "root"
end

cookbook_file '/root/.zshenv' do
	source "zshenv4root"
	mode "644"
	user "root"
	group "root"
end


