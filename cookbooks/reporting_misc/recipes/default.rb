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

 

template "/opt/novell/idm/Designer//NOVLIDMDCSB.properties" do
  source "NOVLIDMDCSB.properties.erb"
  owner "root" 
  mode "0644"  
end


template "/opt/novell/idm/Designer//NOVLIDMMSGWB.properties" do
  source "NOVLIDMMSGWB.properties.erb"
  owner "root" 
  mode "0644"  
end

 
 
    execute "Create Reporting Drivers" do
    command " /bin/sh -c 'ulimit -n 4096; LD_LIBRARY_PATH=\"#{build_loc}\" \"/opt/novell/idm/Designer//Designer\" -nosplash -nl en -application com.novell.idm.rcp.DesignerHeadless -command deployDriver -p \"/opt/novell/idm/Designer//packages/eclipse/plugins\" -a \"#{admin_name}\" -w #{idm_password} -s 127.0.0.1:524 -c \"driverset1.system\" -b 3 -l \"/var/opt/novell/reporting_drivers_configure.log\" ' " 
    creates "/var/opt/novell/reporting_drivers_configure.log"
    action :run
  
 end
 
  # execute "ReSync DCS Driver" do
   # command " LD_LIBRARY_PATH=\"#{build_loc}\" \"#{jre_loc}/bin/java\" -cp \"#{build_loc}/dirxml_misc.jar\":\"#{build_loc}/nxsl.jar\":\"#{build_loc}/xp.jar\":\"#{build_loc}/ldap.jar\":\"#{build_loc}/uainstaller.jar\" com.novell.nds.dirxml.util.DxCommand -user \"#{admin_name}\" -host localhost -password #{idm_password} -port 524 -resyncdriver \"Data Collection Service Driver.driverset1.system\" > \"/var/opt/novell/resync_dcs_driver.log\" 2>&1  " 
   # creates "/var/opt/novell/resync_dcs_driver.log"
   # action :run
  
 # end
#LD_LIBRARY_PATH="/home/vagrant/IDM402AE/test/install/utilities" "/root/idm/jre/bin/java" -cp "/home/vagrant/IDM402AE/test/install/utilities/dirxml_misc.jar":"/home/vagrant/IDM402AE/test/install/utilities/nxsl.jar":"/home/vagrant/IDM402AE/test/install/utilities/xp.jar":"/home/vagrant/IDM402AE/test/install/utilities/ldap.jar":"/home/vagrant/IDM402AE/test/install/utilities/uainstaller.jar" com.novell.nds.dirxml.util.DxCommand -user "admin.servers.system" -host localhost -password n -port 524 -resyncdriver "Data Collection Service Driver.driverset1.system" > "/var/opt/novell/resync_dcs_driver.log" 2>&1
 
 

