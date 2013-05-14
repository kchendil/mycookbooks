#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

idm_install_loc=node['idm']['idm_install_loc']
idm_build_loc=node['idm']['idm_build_loc']
jre_loc=node['idm']['jre_loc']


template "/tmp/idm_install.properties" do
  source "idm_install.properties.erb"
  owner "root" 
  mode "0644"  
end


execute "Install IDM" do
  command " \"#{idm_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -DINSTALL_ONLY=true -i silent -f \"/tmp/idm_install.properties\" "  
   creates "/tmp/idmInstall.log"
  action :run
  
end




