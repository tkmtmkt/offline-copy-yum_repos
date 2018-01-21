#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

PACKAGE_NAME=etckeeper
REPO_NAME=repo_${PACKAGE_NAME}

yum -y install epel-release
yum -y install ${PACKAGE_NAME} --downloadonly --downloaddir=/tmp/${REPO_NAME}
yum -y install createrepo
createrepo --simple-md-filenames /tmp/${REPO_NAME}
tar czf ${SCRIPT_DIR}/${REPO_NAME}.tar.gz ${REPO_NAME} -C /tmp
