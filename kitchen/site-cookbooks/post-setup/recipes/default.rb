#
# Cookbook Name:: post-setup
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "run make setup of dotfile" do
	user "vagrant"
	command <<-EOH
	if [ -e ~/dotfiles ]; then
		make -C ~/dotfiles setup
	fi
	EOH
end
