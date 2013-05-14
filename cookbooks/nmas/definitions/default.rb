define :nmas_install,  :enable => true  do
  
   if params[:name]=="cert"
  execute "Install Certifcate NMAS Methods" do
  command " LD_LIBRARY_PATH=\"#{node[:nmas][:nmas_build_loc]}\" \"#{node[:nmas][:jre_loc]}/bin/java\" -classpath \"#{node[:nmas][:nmas_build_loc]}/instutil.jar\":\"#{node[:nmas][:nmas_build_loc]}/uainstaller.jar\" -Djava.library.path=\"#{node[:nmas][:nmas_build_loc]}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{node[:nmas][:edirectory_port]} \"#{node[:nmas][:admin_name]}\" #{node[:nmas][:idm_password]} /opt/novell/eDirectory/bin/nmasinst \"#{node[:nmas][:cert]}\" /var/opt/novell/nmas_cert.log \"cn=CertMutual.cn=Authorized_Login_Methods.cn=Security\" " 
   creates "/var/opt/novell/nmas_cert.log"
  action :run
  
end
end
 if params[:name]=="simple"
  execute "Install Simple NMAS Methods" do
  command " LD_LIBRARY_PATH=\"#{node[:nmas][:nmas_build_loc]}\" \"#{node[:nmas][:jre_loc]}/bin/java\" -classpath \"#{node[:nmas][:nmas_build_loc]}/instutil.jar\":\"#{node[:nmas][:nmas_build_loc]}/uainstaller.jar\" -Djava.library.path=\"#{node[:nmas][:nmas_build_loc]}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{node[:nmas][:edirectory_port]} \"#{node[:nmas][:admin_name]}\" #{node[:nmas][:idm_password]} /opt/novell/eDirectory/bin/nmasinst \"#{node[:nmas][:simple_password]}\" /var/opt/novell/nmas_simple.log \"cn=Simple Password.cn=Authorized_Login_Methods.cn=Security\" " 
   creates "/var/opt/novell/nmas_simple.log"
  action :run
  
end
end

 if params[:name]=="digest"
execute "Install Digest NMAS Methods" do
  command " LD_LIBRARY_PATH=\"#{node[:nmas][:nmas_build_loc]}\" \"#{node[:nmas][:jre_loc]}/bin/java\" -classpath \"#{node[:nmas][:nmas_build_loc]}/instutil.jar\":\"#{node[:nmas][:nmas_build_loc]}/uainstaller.jar\" -Djava.library.path=\"#{node[:nmas][:nmas_build_loc]}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost 524 \"admin.servers.system\" n /opt/novell/eDirectory/bin/nmasinst \"/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/DigestMD5/config.txt\" /var/opt/novell/nmas_direct.log \"cn=DIGEST-MD5.cn=Authorized_Login_Methods.cn=Security\" " 
   creates "/var/opt/novell/nmas_simplepassword.log"
  action :run
  
end
end

 if params[:name]=="saml"
 
  execute "Unzip SAML from RBPM" do
  command " unzip -o \"/home/vagrant/IDM402AE/test/products/RBPM/SAML/nmassaml.zip\" -d \"/tmp\" " 
   creates "/tmp/SAML/config.txt"
  action :run
  
end

  execute "Install SAML NMAS Methods" do
  command " LD_LIBRARY_PATH=\"#{node[:nmas][:nmas_build_loc]}\" \"#{node[:nmas][:jre_loc]}/bin/java\" -classpath \"#{node[:nmas][:nmas_build_loc]}/instutil.jar\":\"#{node[:nmas][:nmas_build_loc]}/uainstaller.jar\" -Djava.library.path=\"#{node[:nmas][:nmas_build_loc]}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{node[:nmas][:edirectory_port]} \"#{node[:nmas][:admin_name]}\" #{node[:nmas][:idm_password]} /opt/novell/eDirectory/bin/nmasinst \"/tmp/SAML/config.txt\" /var/opt/novell/nmas_saml.log \"cn=SAML Assertion.cn=Authorized_Login_Methods.cn=Security\" " 
   creates "/var/opt/novell/nmas_saml.log"
  action :run
  
end

 execute "Extend SAML schema" do
  command " /opt/novell/eDirectory/bin/ndssch -h \"localhost:#{node[:nmas][:edirectory_port]}\" -t \"#{node[:nmas][:tree_name]}\" -F \"/var/opt/novell/nmas_authsaml.log\" \"#{node[:nmas][:admin_name]}\" \"/tmp/SAML/authsaml.sch\" -p #{node[:nmas][:idm_password]} " 
   creates "/var/opt/novell/nmas_saml.log"
  action :run
  
end


end


end