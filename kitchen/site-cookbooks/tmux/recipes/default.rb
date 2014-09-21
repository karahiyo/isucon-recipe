#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#package "tmux" do
#	action :install
#end

package "libevent-devel" do
	action :install
end

bash "install libevent" do
	user "root"
	cwd "/usr/local/src"
	code <<-EOH
		cd /usr/local/src
		wget --no-check-certificate https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
		tar xvf libevent-2.0.21-stable.tar.gz
		cd libevent-2.0.21-stable
		./configure
		make
		make install
	EOH
	not_if "which tmux && test -e /usr/local/src/tmux-1.9"
end

#----------------------------------------------------------------------
#Libraries have been installed in:
#   /usr/local/lib
#
#If you ever happen to want to link against installed libraries
#in a given directory, LIBDIR, you must either use libtool, and
#specify the full pathname of the library, or use the `-LLIBDIR'
#flag during linking and do at least one of the following:
#   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
#     during execution
#   - add LIBDIR to the `LD_RUN_PATH' environment variable
#     during linking
#   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
#   - have your system administrator add LIBDIR to `/etc/ld.so.conf'
#
#See any operating system documentation about shared libraries for
#more information, such as the ld(1) and ld.so(8) manual pages.
#----------------------------------------------------------------------

bash "install tmux 1.8" do
	user "root"
	cwd "/usr/local/src"
	code <<-EOH
	cd /usr/local/src
	wget --no-check-certificate http://downloads.sourceforge.net/tmux/tmux-1.9.tar.gz
	tar -xvf tmux-1.9.tar.gz
	cd tmux-1.9
	./configure && make
	make install
	EOH
	not_if "which tmux && test -e /usr/local/src/tmux-1.9"
end

cookbook_file '/home/vagrant/.tmux.conf' do
	source "tmux.conf"
	mode "644"
	user "vagrant"
	group "vagrant"
end

cookbook_file '/root/.tmux.conf' do
	source "tmux.conf"
	mode "644"
	user "root"
	group "root"
end

