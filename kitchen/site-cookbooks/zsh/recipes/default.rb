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


