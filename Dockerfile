FROM fedora:23

MAINTAINER Kenjiro Nakayama <nakayamakenjiro@gmail.com>

LABEL io.k8s.description="apt-cacher-ng is xxxxxxxxxxxxxxxxxxx" \
      io.k8s.display-name="apt-cacher-ng" \
      io.openshift.expose-services="3142:apt-cacher-ng" \
      io.openshift.tags="infrastructure,apt-cacher-ng"

# TODO for epel
#RUN dnf install -y apt-cacher-ng && \
#    mkdir -p /var/lib/apt-cacher-ng/data && chmod 777 -R /var/cache/apt-cacher-ng/
RUN dnf install -y apt-cacher-ng

RUN mkdir -p /var/cache/apt-cacher-ng/ && chmod 777 -R /var/cache/apt-cacher-ng/
RUN mkdir -p /var/log/apt-cacher-ng/ && chmod 777 -R /var/log/apt-cacher-ng/
# Debug
RUN dnf install -y procps-ng iproute net-tools bind-utils telnet iputils vim-enhanced tree

EXPOSE 3142

ADD root /

VOLUME ["/var/cache/apt-cacher-ng/"]

USER 1000

CMD ["run-apt-cacher-ng"]
