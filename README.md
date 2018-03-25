yum_repos-maker
===============

利用方法
--------

### リポジトリアーカイブ作成

以下のファイルを編集して、yumコマンドでインストールするパッケージを指定する。

```sh
$ vi centos6/share/make-yum_repos.sh
```

OS毎のrpmパッケージをダウンロードしたアーカイブを作成する。


```sh
$ make-centos6.sh

# 作成するアーカイブは以下の通り。
centos6/share/yum_repos-{リポジトリ名}-centos6-YYYYmmdd.tar.gz
```


### リポジトリ登録／パッケージインストール

インストール対象のサーバでアーカイブを解凍する。

```sh
$ sudo tar -xzf yum_repos-{リポジトリ名}-centos6-YYYYmmdd.tar.gz -C /media
```

yumリポジトリとして登録する。

```sh
$ sudo ln -sf /media/yum_repos-{リポジトリ名}/{リポジトリ名}.repo /etc/yum.repos.d/

# リポジトリに登録されていることを確認する
$ sudo yum repolist
```

パッケージをインストールする。

```sh
$ sudo yum --disablerepo=* --enablerepo={リポジトリ名} install {パッケージ名}
```
