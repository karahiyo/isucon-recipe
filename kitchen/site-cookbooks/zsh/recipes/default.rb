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

bash "Set vagrant's shell to zsh" do
  code <<-EOT
    chsh -s /bin/zsh vagrant
  EOT
  not_if 'test "/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end

bash "Set root's shell to zsh" do
  code <<-EOT
    chsh -s /bin/zsh root
  EOT
  not_if 'test "/bin/zsh" = "$(grep root /etc/passwd | cut -d: -f7)"'
end


# set conf

## for vagrant
cookbook_file '/home/vagrant/.zshrc' do
	source "zshrc4vagrant"
	mode "644"
	user "vagrant"
	group "vagrant"
end

cookbook_file '/home/vagrant/.zshenv' do
	source "zshenv4vagrant"
	mode "644"
	user "vagrant"
	group "vagrant"
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


