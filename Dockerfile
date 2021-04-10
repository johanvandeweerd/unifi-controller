FROM ubuntu:bionic

EXPOSE 8080 8443 8843 8880

RUN apt-get update && \
    apt-get install -y binutils jsvc libcap2 logrotate openjdk-8-jre-headless wget curl && \
    curl -o /tmp/unifi.deb -L "https://dl.ui.com/unifi/6.1.71/unifi_sysvinit_all.deb" && \
    dpkg --force-all -i /tmp/unifi.deb && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

CMD ["java", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
