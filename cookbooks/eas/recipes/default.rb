#
# Cookbook Name:: nags
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

eas_install_loc=node['eas']['eas_install_loc']
eas_build_loc=node['eas']['eas_build_loc']
jre_loc=node['eas']['jre_loc']


template "/tmp/eas_install.properties" do
  source "eas_install.properties.erb"
  owner "root" 
  mode "0644"  
end


execute "Install EAS" do
  command " \"#{eas_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -i silent -f \"/tmp/eas_install.properties\" "
  creates "/opt/novell/sentinel_eas/EASInstall.log"
  action :run
end




