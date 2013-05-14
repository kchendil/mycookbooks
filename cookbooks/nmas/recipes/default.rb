#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

nmas_build_loc=node['nmas']['nmas_build_loc']
edirectory_port=node['nmas']['edirectory_port']
admin_name=node['nmas']['admin_name']
idm_password=node['nmas']['idm_password']
jre_loc=node['nmas']['jre_loc']
simple_password=node['nmas']['simple_password']
cert=node['nmas']['cert']
direct=node['nmas']['direct']


# execute "Install Simple NMAS Methods" do
  # command " LD_LIBRARY_PATH=\"#{nmas_build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{nmas_build_loc}/instutil.jar\":\"#{nmas_build_loc}/uainstaller.jar\" -Djava.library.path=\"#{nmas_build_loc}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{edirectory_port} \"#{admin_name}\" #{idm_password} /opt/novell/eDirectory/bin/nmasinst \"#{simple_password}\" /var/opt/novell/nmas_simplepassword.log \"cn=Simple Password.cn=Authorized_Login_Methods.cn=Security\" " 
   # creates "/var/opt/novell/nmas_simplepassword.log"
  # action :run
  
# end

# execute "Install Certifcate NMAS Methods" do
  # command " LD_LIBRARY_PATH=\"#{nmas_build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{nmas_build_loc}/instutil.jar\":\"#{nmas_build_loc}/uainstaller.jar\" -Djava.library.path=\"#{nmas_build_loc}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{edirectory_port} \"#{admin_name}\" #{idm_password} /opt/novell/eDirectory/bin/nmasinst \"#{cert}\" /var/opt/novell/nmas_cert.log \"cn=CertMutual.cn=Authorized_Login_Methods.cn=Security\" " 
   # creates "/var/opt/novell/nmas_simplepassword.log"
  # action :run
  
# end

nmas_install "cert" do
  enable true
end

nmas_install "simple" do
  enable true
end

nmas_install "saml" do
  enable true
end

nmas_install "digest" do
  enable true
end



# execute "Install Direct NMAS Methods" do
  # command " LD_LIBRARY_PATH=\"#{nmas_build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{nmas_build_loc}/instutil.jar\":\"#{nmas_build_loc}/uainstaller.jar\" -Djava.library.path=\"#{nmas_build_loc}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{edirectory_port} \"#{admin_name}\" #{idm_password} /opt/novell/eDirectory/bin/nmasinst \"#{direct}\" /var/opt/novell/nmas_direct.log \"cn=DIGEST-MD5.cn=Authorized_Login_Methods.cn=Security\" " 
   # creates "/var/opt/novell/nmas_simplepassword.log"
  # action :run
  
# end


# nmas_install "Simple" do
# end

# " LD_LIBRARY_PATH=\"#{nmas_build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{nmas_build_loc}/instutil.jar\":\"#{nmas_build_loc}/uainstaller.jar\" -Djava.library.path=\"#{nmas_build_loc}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{edirectory_port} \"#{admin_name}\" #{idm_password} /opt/novell/eDirectory/bin/nmasinst \"#{simple_password}\" /var/opt/novell/nmas_simplepassword.log \"cn=Simple Password.cn=Authorized_Login_Methods.cn=Security\" "


