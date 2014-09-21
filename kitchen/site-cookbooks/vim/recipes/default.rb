#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "install vim 7.4" do
	user "root"
	cwd "/usr/local/src"
	code <<-EOH
		wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
		tar -xjf vim-7.4.tar.bz2
		cd vim74
		./configure \
		--prefix=/usr/local \
		--with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp \
		--enable-pythoninterp \
		--enable-luainterp \
		--enable-gpm \
		--enable-cscope \
		--enable-fontset
		make && make install
	EOH
	not_if "test -e /usr/local/bin/vim"
end

## for user
cookbook_file "/home/#{node['user']}/.vimrc" do
	source "vimrc4user"
	mode "644"
	user "#{node['user']}"
	group "#{node['user']}"
end

## for root
cookbook_file '/root/.vimrc' do
	source "vimrc4root"
	mode "644"
	user "root"
	group "root"
end


