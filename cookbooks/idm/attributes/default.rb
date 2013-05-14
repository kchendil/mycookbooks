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


default['idm']['idm_install_loc'] = "/opt/novell/idm"
default['idm']['idm_build_loc'] = "/home/vagrant/IDM402AE/test/products/IDM/linux/setup/idm_linux.bin"
default['idm']['idm_configure_build_loc'] = "/home/vagrant/IDM402AE/test/products/IDM/linux/setup/configuration/idm_configure_linux.bin"
default['idm']['jre_loc']="/root/idm/jre"
default['idm']['admin_name']="cn=admin,ou=servers,o=system"
default['idm']['edirectory_port']="524"
default['idm']['idm_password']="n"

