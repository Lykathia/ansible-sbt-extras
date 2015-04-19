# Dockerfile for testing ansible-sbt-extras.
# docker build --force-rm -t lykathia/ansible-sbt-extras .

FROM ansibleshipyard/ansible-scala
MAINTAINER lykathia

WORKDIR /tmp/ansible

ADD ./tests /tmp/ansible/tests
ADD ./tasks /tmp/ansible/tasks
ADD ./files /tmp/ansible/files
ADD ./vars /tmp/ansible/vars
ADD ./meta /tmp/ansible/meta

RUN ansible-playbook -i tests/inventory tests/test.yml -c local -vvvv
