#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

rbpm_build_loc=node['rbpm']['rbpm_build_loc']
jre_loc=node['rbpm']['jre_loc']


template "/tmp/rbpm_userapp_configure.properties" do
  source "rbpm_userapp_configure.properties.erb"
  owner "root" 
  mode "0644"  
end

 # template "/tmp/rbpm_userapp_configure.properties" do
   # source "uasilent.properties.erb"
   # owner "root" 
   # mode "0644"  
 # end

execute "Configure RBPM" do
  command " \"#{jre_loc}/bin/java\" -jar #{rbpm_build_loc} -i silent -f \"/tmp/rbpm_userapp_configure.properties\" " 
  creates "/opt/novell/idm/rbpm/UserApplication/Identity_Manager_User_Application_InstallLog2.log"
  action :run
  end