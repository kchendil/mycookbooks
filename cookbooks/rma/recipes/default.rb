#
# Cookbook Name:: nags
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

rma_install_loc=node['rma']['rma_install_loc']
rma_build_loc=node['rma']['rma_build_loc']
jre_loc=node['rma']['jre_loc']


execute "Install RMA" do
  command "#{jre_loc}/bin/java -jar #{rma_build_loc} -s -i #{rma_install_loc} -l /tmp"
  creates "/tmp/rma-install.log"
  action :run
end


execute "Configure RMA for Audit" do
  command "#{jre_loc}/bin/java -jar #{rma_install_loc}/rma/rmaConfig.jar  +N"  
  creates "#{rma_install_loc}/rma/rma-config.log"  
  action :run
end





