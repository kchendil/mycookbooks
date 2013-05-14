#
# Cookbook Name:: rbpm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

rbpm_build_loc=node['rbpm']['rbpm_build_loc']
jre_loc=node['rbpm']['jre_loc']



template "/tmp/rbpm_userapp_install.properties" do
  source "rbpm_userapp_install.properties.erb"
  owner "root" 
  mode "0644"  
end

# script "Install RBPM " do
  # interpreter "bash"
  # user "root"
  # cwd "/tmp"
  # code <<-EOH  
  # " \"#{jre_loc}/bin/java\" -jar \"#{rbpm_build_loc}\" -i silent -f \"/tmp/rbpm_userapp_install.properties\"; "  
  # EOH
# end


execute "Install RBPM" do
 user "root" 
 cwd "/tmp"
 command " \"#{jre_loc}/bin/java\" -jar \"#{rbpm_build_loc}\" -i silent -f \"/tmp/rbpm_userapp_install.properties\"; "  
 action :run
end



