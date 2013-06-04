#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

build_loc=node['reporting_misc']['build_loc']
edirectory_port=node['reporting_misc']['edirectory_port']
ldap_port=node['reporting_misc']['ldap_port']
ldaps_port=node['reporting_misc']['ldaps_port']
admin_name=node['reporting_misc']['admin_name']
dn_admin_name=node['reporting_misc']['dn_admin_name']
idm_password=node['reporting_misc']['idm_password']
jre_loc=node['reporting_misc']['jre_loc']
simple_password=node['reporting_misc']['simple_password']
cert=node['reporting_misc']['cert']
direct=node['reporting_misc']['direct']

 


  execute "ReSync DCS Driver" do
   command " LD_LIBRARY_PATH=\"#{build_loc}\" \"#{jre_loc}/bin/java\" -cp \"#{build_loc}/dirxml_misc.jar\":\"#{build_loc}/nxsl.jar\":\"#{build_loc}/xp.jar\":\"#{build_loc}/ldap.jar\":\"#{build_loc}/uainstaller.jar\" com.novell.nds.dirxml.util.DxCommand -user \"#{admin_name}\" -host localhost -password #{idm_password} -port 524 -resyncdriver \"Data Collection Service Driver.driverset1.system\" > \"/var/opt/novell/resync_dcs_driver.log\" 2>&1  " 
   creates "/var/opt/novell/resync_dcs_driver.log"
   action :run
  
 end

 
 

