FROM debian:jessie
RUN yum -y update && \
    yum install --fix-missing -y \
      curl \
      git \
      python-httplib2 \
      python-jinja2 \
      python-keyczar \
      python-paramiko \
      python-pkg-resources \
      python-pip \
      python-setuptools \
      python-yaml
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost ansible_connection=local\n' > /etc/ansible/hosts
RUN pip install ansible
ENV PATH /usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library
