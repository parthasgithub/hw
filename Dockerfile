FROM roboxes/centos8

LABEL <partha.dey> <partha.dey@linoop.us>

ENV PORT 8080

WORKDIR '/app'

EXPOSE 8080

#USER root

#RUN touch /var/lib/rpm/*
#RUN rpm -i https://centos.pkgs.org/8/centos-baseos-aarch64/dnf-4.7.0-4.el8.noarch.rpm.html
RUN yum update -y  
RUN yum install -y httpd 
RUN yum clean all

RUN yum install wget -y
RUN yum install unzip -y

#RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page282/boocic.zip 
#RUN unzip boocic.zip -d /var/www/html/

#RUN systemctl enable httpd --now
#COPY ./httpd.conf /etc/httpd/conf/httpd.conf
#RUN chmod 777 /etc/httpd/conf/httpd.conf
USER root
COPY ./httpd.conf /etc/httpd/conf/httpd.conf
RUN chown apache:apache /etc/httpd/logs /run/httpd

#RUN $sed /etc/httpd/conf/httpd.conf 's/Listen 80/Listen 8080'
#RUN $sed 's/Listen 80/Listen 8080' /etc/httpd/conf/httpd.conf 
#RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page282/boocic.zip && \ unzip boocic.zip -d /var/www/html/

#RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page282/boocic.zip 
#RUN unzip boocic.zip -d /var/www/html/
COPY ./boocic-html /var/www/html/ 
#RUN chown apache:apache /etc/httpd/logs /run/httpd

#RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page282/boocic.zip && \ unzip boocic.zip -d /var/www/html/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
