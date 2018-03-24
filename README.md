offline-copy-yum_repos
======================

### 利用方法

以下のファイルを編集して、yumコマンドでインストールするパッケージを指定する。

```sh
$ vi create_yum_repos.sh
```

以下のコマンドで、OS毎のrpmパッケージをダウンロードしたアーカイブを作成する。


```sh
$ run_centos6.sh
$ run_centos7.sh
```

以下のコマンドは、作業ディレクトリのアーカイブを作成する。

```sh
$ make-archive.sh
```
