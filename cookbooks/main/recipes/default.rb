ENV['http_proxy']= "http://httpprox.hq.sag:8080"
ENV['https_proxy']="http://httpprox.hq.sag:443"

ENV['HTTP_PROXY']="http://httpprox.hq.sag:8080"
ENV['HTTPS_PROXY']="http://httpprox.hq.sag:443"
package "git-core"
package "vsftpd"
include_recipe "java::default"



# java_ark "jdk" do
#     url 'http://download.oracle.com/otn-pub/java/jdk/6u29-b11/jdk-6u29-linux-x64.bin'
#     checksum  'a8603fa62045ce2164b26f7c04859cd548ffe0e33bfc979d9fa73df42e3b3365'
#     app_home '/usr/local/java/default'
#     bin_cmds ["java", "javac"]
#     action :install
# end
#
# node.override[:java][:jdk_version] = '7'
# # node.override[:java][:oracle][:accept_oracle_download_terms] = true
# node.override['java']['install_flavor'] = 'openjdk'
# # node.override['java']['jdk']['7']['x86_64']['url'] = 'https://drive.google.com/file/d/0B_ONfa6Rb77MSmVWMDB5QWVmX0U/edit?usp=sharing'
#
#
include_recipe "jenkins::master"

# puts "JAVA HOME = #{ENV['JAVA_HOME']}"
node.override[:jenkins][:java_home] = "/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
# jenkins[:http_proxy][:host_name]="httpprox.hq.sag"
# jenkins_plugin "scm-api"
# jenkins_plugin "git-client"
# jenkins_plugin "git"
# jenkins_plugin "ansicolor"

service "iptables" do
  action :disable
end

# jenkins_command 'safe-restart'
# jenkins_command 'reload-configuration'
