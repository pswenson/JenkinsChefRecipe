ENV['http_proxy']= "http://httpprox.hq.sag:8080"
ENV['https_proxy']="http://httpprox.hq.sag:443"
 
ENV['HTTP_PROXY']="http://httpprox.hq.sag:8080"
ENV['HTTPS_PROXY']="http://httpprox.hq.sag:443"
puts "HI PHIL HI PHIL"
package "git-core"
include_recipe "java::default"


# node[:java][:jdk_version] = '7'
# node[:java][:oracle][:accept_oracle_download_terms] = true
# node[:java][:install_flavor] = "oracle"


include_recipe "jenkins::master"