#
# Cookbook Name:: post-setup
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
directory "/home/#{node['user']}/.zsh" do
  owner "#{node['user']}"
  group "#{node['user']}"
  recursive true
  mode 0755
  action :create
  not_if { File.directory? "/home/#{node['user']}/.zsh" }
end

cookbook_file "/home/#{node['user']}/.zsh/z.sh" do
  source "z.sh"
  mode "644"
  user "#{node['user']}"
  group "#{node['user']}"
end

directory "/root/.zsh" do
  owner "root"
  group "root"
  recursive true
  mode 0755
  action :create
  not_if { File.directory? "/root/.zsh" }
end

cookbook_file "/root/.zsh/z.sh" do
  source "z.sh"
  mode "644"
  owner "root"
  group "root"
end

