#
# Cookbook Name:: idm
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
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
# default tomcat attributes



default['nmas']['nmas_build_loc'] = "/home/vagrant/IDM402AE/test/install/utilities"
default['nmas']['jre_loc']="/root/idm/jre"
default['nmas']['admin_name']="admin.servers.system"
default['nmas']['edirectory_port']="524"
default['nmas']['idm_password']="n"
default['nmas']['simple_password'] = "/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/SimplePassword/config.txt"
default['nmas']['cert'] = "/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/CertMutual/config.txt"
default['nmas']['direct'] = "/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/DigestMD5/config.txt"
default['nmas']['tree_name'] = "VAGRANT"