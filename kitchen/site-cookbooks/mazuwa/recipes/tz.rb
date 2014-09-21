#
# Cookbook Name:: update
# Recipe:: tz
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'setup timezone' do 
  user 'root'
  code <<-EOC
  cp -p  /usr/share/zoneinfo/Japan /etc/localtime
  EOC
end

