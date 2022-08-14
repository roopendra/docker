FROM centos:7
LABEL maintainer="Roopendra Vishwakarma"
RUN yum -y update && \
    yum -y install httpd-tools && \
    yum clean all
CMD ["ab"]