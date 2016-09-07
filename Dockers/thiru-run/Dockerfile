FROM thiru:ubuntu-trusty
MAINTAINER Thirumalai Veerasamy <techy@thiru.in>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install mysql-client-5.6 vim
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

VOLUME  ["/sites", "/data"]

CMD ["/bin/bash"]
