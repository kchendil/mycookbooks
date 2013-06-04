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

#def eas_password()
if File.exist?("/etc/opt/novell/sentinel_eas/config/activemqusers.properties")
file = File.open("/etc/opt/novell/sentinel_eas/config/activemqusers.properties", "rb")
if file
contents = file.read
password= contents.lines.first.split('=')[1]
file.close
else
   puts "Unable to open file!"
end

end
  # return password
#end

template "/tmp/idmreporting_configure.properties" do
  source "idmreporting_configure.properties.erb"
  owner "root" 
  mode "0644"  
 # variables :eas_system_password => 0c2eedeb79f4623b25253fe9e51682a4  
  variables({
     :eas_system_password => password
  })
end


execute "Configure Reporting Module" do
  command " \"#{reporting_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -i silent -f \"/tmp/idmreporting_configure.properties\" "
  creates "/opt/novell/idm/rbpm/IDMReporting//RPT_Install2.log"
  action :run
  
end




