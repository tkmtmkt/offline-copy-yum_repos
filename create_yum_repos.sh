#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

# パッケージ情報設定
#PACKAGE_NAME=etckeeper
PACKAGE_NAME=supervisor
REPO_NAME=repo_${PACKAGE_NAME}
ARCH_NAME=${SCRIPT_DIR}/${REPO_NAME}.tar.gz

# パッケージダウンロード
yum -y install epel-release
yum -y install ${PACKAGE_NAME} --downloadonly --downloaddir=/tmp/${REPO_NAME}
yum -y install createrepo

# リポジトリ作成
createrepo --simple-md-filenames /tmp/${REPO_NAME}

# アーカイブ作成
tar czf ${ARCH_NAME} -C /tmp ${REPO_NAME}
chmod a+w ${ARCH_NAME}
