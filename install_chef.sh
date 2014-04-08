#usage:
#ssh root@redrock 'bash -s' < install_chef.sh
export http_proxy=http://httpprox.hq.sag:8080
export https_proxy=http://httpprox.hq.sag:443
export HTTP_PROXY=http://httpprox.hq.sag:8080
export HTTPS_PROXY=http://httpprox.hq.sag:443
curl -L https://www.opscode.com/chef/install.sh | bash
