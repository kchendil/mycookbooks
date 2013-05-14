#
# Cookbook Name:: reporting
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

reporting_install_loc=node['reporting']['reporting_install_loc']
reporting_build_loc=node['reporting']['reporting_build_loc']
jre_loc=node['reporting']['jre_loc']


template "/tmp/idmreporting_install.properties" do
  source "idmreporting_install.properties.erb"
  owner "root" 
  mode "0644"  
end


execute "Install Reporting Module" do
  command " \"#{reporting_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -i silent -f \"/tmp/idmreporting_install.properties\" "
  creates "/opt/novell/sentinel_eas/EASInstall.log"
  action :run
  
end




