sudo mkdir -p ~/data/teamcity
sudo chcon -Rt svirt_sandbox_file_t ~/data/teamcity
sudo docker run -dt --name teamcity_server -p 8111:8111 -v ~/data/teamcity:/data/teamcity centos-teamcity-server
