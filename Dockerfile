FROM httpd:2.4
RUN \
  sed -i'' -e 's/Listen 80$/Listen 8080/' /usr/local/apache2/conf/httpd.conf && \
  echo "Include conf/extra/git-server.conf" >> /usr/local/apache2/conf/httpd.conf && \
  apt update && \
  apt install -y git gitweb && \
  apt clean all
COPY httpd.conf /usr/local/apache2/conf/extra/git-server.conf
