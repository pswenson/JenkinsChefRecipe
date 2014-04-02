ENV['http_proxy']= "http://httpprox.hq.sag:8080"
ENV['https_proxy']="http://httpprox.hq.sag:443"

ENV['HTTP_PROXY']="http://httpprox.hq.sag:8080"
ENV['HTTPS_PROXY']="http://httpprox.hq.sag:443"
package "git-core"
package "vsftpd"
include_recipe "java::default"



include_recipe "jenkins::master"

# puts "JAVA HOME = #{ENV['JAVA_HOME']}"
node.override[:jenkins][:java_home] = "/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
puts "OUTPUT===========> #{node[:jenkins][:java_home]}"

# jenkins_plugin "scm-api"
# jenkins_plugin "git-client"
# jenkins_plugin "git"
# jenkins_plugin "ansicolor"

service "iptables" do
  action :disable
end

jenkins_command 'safe-restart'
# jenkins_command 'reload-configuration'
