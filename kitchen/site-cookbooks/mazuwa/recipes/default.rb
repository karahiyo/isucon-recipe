#
# Cookbook Name:: mazuwa
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{ncurses ncurses-devel rpm-build gcc gdbm gdbm-devel htop mosh vim tree }.each do |pkg|
  package pkg do
    action :install
  end
end

bash "developmenttools" do
	user "root"
	code <<-EOH
	yum groupinstall 'Development tools' -y
	EOH
end

cookbook_file "/home/#{node['user']}/.gemrc" do
	source "gemrc"
	mode "644"
	user "#{node['user']}"
	group "#{node['user']}"
end

cookbook_file '/root/.gemrc' do
	source "gemrc"
	mode "644"
	user "root"
	group "root"
end


