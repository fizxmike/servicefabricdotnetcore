#see here: https://stackoverflow.com/questions/19872591/how-to-use-vagrant-in-a-proxy-environment
$env:http_proxy="http://proxy.swmed.org:3128"
$env:https_proxy="http://proxy.swmed.org:3128"
$env:no_proxy="localhost,127.0.0.1"
vagrant plugin install vagrant-proxyconf
vagrant up
