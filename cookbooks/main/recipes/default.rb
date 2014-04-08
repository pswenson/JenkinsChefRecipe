# ENV['http_proxy']= "http://httpprox.hq.sag:8080"
# ENV['https_proxy']="http://httpprox.hq.sag:443"
#
# ENV['HTTP_PROXY']="http://httpprox.hq.sag:8080"
# ENV['HTTPS_PROXY']="http://httpprox.hq.sag:443"


# http_proxy="http://proxysrv:8080/"
# https_proxy="https://proxysrv:8080/"

package "git-core"
package "vsftpd"
include_recipe "java::default"

 puts "\njenkins => #{node[:jenkins].inspect}"

include_recipe "jenkins::master"

# puts "ENV=>\n#{ENV.inspect}"

jenkins_plugin "scm-api"
jenkins_plugin "git-client"
jenkins_plugin "git"
jenkins_plugin "ansicolor"

service "iptables" do
  action :disable
end

# jenkins_command 'start'
#jenkins_command 'safe-restart'

 job_name = "myfirstjob"

 puts "jenkins file ====> #{node[:jenkins][:master][:home]}"
 job_config = File.join(node[:jenkins][:master][:home], "#{job_name}-config.xml")
#
jenkins_job job_name do
  action :nothing
  config job_config
end
#
template job_config do
  source "job.xml.erb"
  # variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
  notifies :update, resources(:jenkins_job => job_name), :immediately
  notifies :build, resources(:jenkins_job => job_name), :immediately
end

jenkins_command 'reload-configuration'
