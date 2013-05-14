#
# Cookbook Name:: jetty
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


default['reporting']['reporting_build_loc'] = "/home/vagrant/IDM402AE/test/products/Reporting/IDMReport.bin"
default['reporting']['jre_loc'] = "/root/idm/jre"
default['reporting']['reporting_install_loc'] = "/opt/novell/idm/rbpm/IDMReporting/"
default['reporting']['reporting_log_loc'] = "/opt/novell/idm/rbpm/IDMReporting//RPT_Install.log"

default['reporting']['db_port'] = "15432"
default['reporting']['db_password'] = "n"

default['reporting']['ldap_port'] = "389"
default['reporting']['ldaps_port'] = "636"

default['reporting']['user_container'] = "o=data"
default['reporting']['dn_admin_name'] = "cn=admin,ou=servers,o=system"
default['reporting']['ldaps_port'] = "636"