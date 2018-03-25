#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

# ダウンロードするパッケージ（スペース区切りで記入する）
REPO_NAME=etckeeper
PACKAGES=etckeeper

# 変数定義
WORK_DIR=${SCRIPT_DIR}
REPO_DIR=${WORK_DIR}/yum_repos-${REPO_NAME}
ARCH_NAME=${REPO_DIR}-centos7-$(date +%Y%m%d).tar.gz

# パッケージダウンロード
rm -rf ${REPO_DIR}
yum -y install epel-release
yum -y install ${PACKAGES} --downloadonly --downloaddir=${REPO_DIR}/RPMS
yum -y install createrepo

# リポジトリ作成
createrepo --simple-md-filenames ${REPO_DIR}/RPMS

cat > ${REPO_DIR}/${REPO_NAME}.repo <<EOS
[${REPO_NAME}]
name=CentOS-\${releasever} - ${REPO_NAME}
baseurl=file:///media/$(basename ${REPO_DIR})/RPMS/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOS

# アーカイブ作成
tar czf ${ARCH_NAME} -C $(dirname ${REPO_DIR}) $(basename ${REPO_DIR})
chmod a+w ${ARCH_NAME}
