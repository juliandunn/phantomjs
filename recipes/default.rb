#
# Cookbook Name:: phantomjs
# Recipe:: default
#
# Copyright 2012, CustomInk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Packages
case node['platform_family']
when 'debian'
  %w(fontconfig libfreetype6).each do |package|
    package package
  end
when 'fedora','rhel'
  %w(fontconfig freetype).each do |package|
    package package
  end
end

basename = "phantomjs-#{node['phantomjs']['version']}-linux-#{node['kernel']['machine']}"

ark "phantomjs" do
  url "https://phantomjs.googlecode.com/files/#{basename}.tar.bz2"
  action :install
  path "/opt"
end
