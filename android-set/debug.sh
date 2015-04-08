sudo mkdir -p $1/data/teamcity
sudo chcon -Rt svirt_sandbox_file_t $1/data/teamcity
sudo docker stop teamcity
sudo docker rm teamcity
sudo docker run -it --name teamcity -p 8111:8111 -v $1/data/teamcity:/data/teamcity centos-teamcity /bin/bash
