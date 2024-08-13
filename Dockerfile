#edited by joel
FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat

#download the latest tomcat9 from official site: https://tomcat.apache.org/download-90.cgi

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz

RUN tar -xvzf apache-tomcat-9.0.93.tar.gz

RUN mv apache-tomcat-9.0.93/* /opt/tomcat 

RUN cd /etc/yum.repos.d/ 

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* 

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* 

RUN yum -y install java 

#CMD [/bin/bash] 

EXPOSE 8082

CMD ["/opt/tomcat/bin/catalina.sh", "run"]