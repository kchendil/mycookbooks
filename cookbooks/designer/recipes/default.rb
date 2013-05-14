#
# Cookbook Name:: nags
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

designer_install_loc=node['designer']['designer_install_loc']
designer_locale=node['designer']['designer_locale']
designer_build_loc=node['designer']['designer_build_loc']
jre_loc=node['designer']['jre_loc']



template "/tmp/designer_install.properties" do
  source "designer_install.properties.erb"
  owner "root" 
  mode "0644"  
end

script "Install Designer " do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH  
  \"#{designer_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -i silent -f \"/tmp/designer_install.properties\";
  EOH
end




