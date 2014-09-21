#
# Cookbook Name:: update
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'yum update' do 
  user 'root'
  code <<-EOC
  yum upgrade -y
  yum update -y
  EOC
end
