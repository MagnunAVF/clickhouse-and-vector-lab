FROM openresty/openresty:1.15.8.3-2-centos

RUN yum -y update

ADD setup.sh /tmp/setup.sh
RUN chmod +rwx /tmp/setup.sh
RUN /tmp/setup.sh