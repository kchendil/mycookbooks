#
# Cookbook Name:: rbpm
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

default['rbpm']['rbpm_install_loc'] = "/opt/novell/idm/rbpm/UserApplication"
default['rbpm']['rbpm_war_install_loc'] = "/home/vagrant/IDM402AE/test/products/RBPM/user_app_install/IDMProv.war"
default['rbpm']['rbpm_jboss_install_loc'] = "/opt/novell/idm/rbpm/jboss"
default['rbpm']['rbpm_build_loc'] = "/home/vagrant/IDM402AE/test/products/RBPM/user_app_install/IdmUserApp.jar"
default['rbpm']['jre_loc'] = "/root/idm/jre"
default['rbpm']['dn_admin_name']="cn=admin,ou=servers,o=system"
default['rbpm']['edirectory_port']="524"
default['rbpm']['ldap_port']="389"
default['rbpm']['ldaps_port']="636"
default['rbpm']['idm_password']="n"
