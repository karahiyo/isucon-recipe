#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{python-devel ruby-devel perl-devel lua-devel}.each do |pkg|
	package pkg do
		action :install
	end
end
