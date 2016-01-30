FROM fedora:23

MAINTAINER Kenjiro Nakayama <nakayamakenjiro@gmail.com>

LABEL io.k8s.description="Cockroach DB is xxxxxxxxxxxxxxxxxxx" \
      io.k8s.display-name="Cockroach DB" \
      io.openshift.expose-services="26257:cockroachdb" \
      io.openshift.tags="database,cockroachdb"

# TODO for epel
#RUN dnf install -y apt-cacher-ng && \
#    mkdir -p /var/lib/apt-cacher-ng/data && chmod 777 -R /var/cache/apt-cacher-ng/
RUN dnf install -y apt-cacher-ng

RUN mkdir -p /var/lib/apt-cacher-ng/data && chmod 777 -R /var/cache/apt-cacher-ng/
# Debug
RUN dnf install -y procps-ng iproute net-tools bind-utils telnet iputils vim-enhanced tree

EXPOSE 3142

ADD root /

VOLUME ["/var/cache/apt-cacher-ng/"]

USER 1000

CMD ["run-apt-cacher-ng"]
