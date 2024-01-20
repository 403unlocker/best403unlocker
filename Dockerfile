FROM ubuntu:20.04

env file_url="https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-16.8.0-ce.0.el7.x86_64.rpm/download.rpm"
env dns="178.22.122.100 185.51.200.2 10.202.10.202 185.55.226.26 185.55.225.25 1.1.1.1 8.8.8.8"
env timeout="10s"

run apt-get update && apt-get -y install wget 
ADD bash.sh . 
entrypoint ["bash","bash.sh"]
