sudo docker run -dt --name teamcity_agent --link teamcity_server:teamcity_server -p 9090:9090 -e AGENT_NAME=CentAgent centos-teamcity-agent
