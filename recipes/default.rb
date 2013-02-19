#
# Cookbook Name:: chef-jboss4
# Recipe:: default
#
# Copyright (C) 2013 Erik Nelson
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"
include_recipe "user"

jboss_home = node['jboss']['home']

ruby_block  "set-env-jboss-home" do
  block do
    ENV["JBOSS_HOME"] = jboss_home
  end
  not_if { ENV["JBOSS_HOME"] == jboss_home }
end

file "/etc/profile.d/jboss.sh" do
  content "export JBOSS_HOME=#{node['jboss']['home']}"
  mode 0755
end

user_account node['jboss']['user'] do 
	comment "JBoss application server user"
	action :create
end

ark 'jboss' do
	url node['jboss']['url']
	checksum node['jboss']['checksum']
	version node['jboss']['version']
	owner node['jboss']['user']
	group node['jboss']['user']
	action :install
end

template '/etc/init.d/jboss' do
	source 'jboss_init_redhat.sh.erb'
	mode '0755'
	owner 'root'
	group 'root'
end

service 'jboss' do
	action :start
end
