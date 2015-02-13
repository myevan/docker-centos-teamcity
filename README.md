Docker: CentOS+Teamcity
=======================

Requirements
------------
* CentOS-7.0 (JRE8)
* TeamCity-9.0.2

Usage
-----

#### Build

	$ sudo docker build --tag centos-teamcity .

#### Start

	$ sudo mkdir -p ~/data/teamcity
	$ sudo chcon -Rt svirt_sandbox_file_t ~/data/teamcity
	$ sudo docker run -dt --name teamcity -p 8111:8111 -v ~/data/teamcity:/data/teamcity centos-teamcity

#### Clean 

	$ sudo docker stop teamcity
	$ sudo docker rm teamcity

#### Debug

	$ sudo docker run -it --name teamcity -p 8111:8111 -v ~/data/teamcity:/data/teamcity centos-teamcity /bin/bash


References
----------
* <https://bitbucket.org/ariya/docker-centos>
* <https://github.com/sameersbn/docker-gitlab>
