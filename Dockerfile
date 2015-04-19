# Dockerfile for testing ansible-sbt-extras.
# docker build --force-rm -t lykathia/ansible-sbt-extras .

FROM ansibleshipyard/ansible-scala
MAINTAINER lykathia

WORKDIR /tmp/ansible

ADD ./test.yml /tmp/ansible/test.yml
ADD ./tasks /tmp/ansible/tasks
ADD ./files /tmp/ansible/files
ADD ./vars /tmp/ansible/vars
ADD ./meta /tmp/ansible/meta
ADD ./example /tmp/ansible/inventory

RUN ansible-playbook -i inventory test.yml -c local -vvvv
