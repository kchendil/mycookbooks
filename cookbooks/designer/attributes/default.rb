#
# Cookbook Name:: designer
# Attributes:: default
#
# Copyright 2013, NetIQ.
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

default['designer']['designer_install_loc'] = "/opt/novell/idm/Designer/"
default['designer']['designer_locale'] = "en"
default['designer']['designer_build_loc'] = "/home/vagrant/IDM402AE/test/products/Designer/install"
default['designer']['jre_loc'] = "/root/idm/jre"
