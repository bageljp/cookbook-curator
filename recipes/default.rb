#
# Cookbook Name:: curator
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

case node['platform']
when "amazon"
  %W(
    python-pip
  ).each do |pkg|
    package "#{pkg}" do
      action :install
    end
  end

  bash "setup curator" do
    user "root"
    group "root"
    cwd "/usr/local/src"
    code <<-EOC
      pip install elasticsearch-curator
    EOC
    creates "#{node['curator']['cmd_path']}"
  end
end

cron "Delete elasticsearch index in curator" do
  user "#{node['curator']['cron']['user']}"
  command "#{node['curator']['cmd_path']} --host #{node['curator']['es']['host']} --prefix #{node['curator']['es']['index']} -b 2 -c #{node['curator']['days']['close']} -d #{node['curator']['days']['delete']}"
  hour "#{node['curator']['cron']['hour']}"
  minute "#{node['curator']['cron']['minute']}"
end

