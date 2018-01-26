#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

PACKAGE_NAME=etckeeper
REPO_NAME=repo_${PACKAGE_NAME}
ARCH_NAME=${SCRIPT_DIR}/${REPO_NAME}.tar.gz

yum -y install epel-release
yum -y install ${PACKAGE_NAME} --downloadonly --downloaddir=/tmp/${REPO_NAME}
yum -y install createrepo
createrepo --simple-md-filenames /tmp/${REPO_NAME}
tar czf ${ARCH_NAME} -C /tmp ${REPO_NAME}
chmod a+w ${ARCH_NAME}
