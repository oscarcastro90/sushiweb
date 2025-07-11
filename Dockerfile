FROM registry.access.redhat.com/ubi8/ubi:latest

RUN dnf update -y && \
    dnf install -y httpd telnet net-tools iproute && \
    dnf clean all && \
    rm -rf /var/cache/dnf

COPY website/ /var/www/html

RUN ARCH=$(uname -m) \
	&& sed s/_ARCHITECTURE_/$ARCH/ /var/www/html/index_template.html > /var/www/html/index.html
