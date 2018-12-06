# Ubuntu18 - Apache2 Singularity

Ubuntu Linux 18.04 (Bionic) にApache2をインストールしたSingularityコンテナ

Apache2はソースコードからインストールする。

ポイントはhttpd.confで以下のようにすることで、最終的にroot権限なしでApache2をsingularityコンテナで起動できるということ。

- ポート番号を1024より大きくする。
- error_log, access_logをユーザーのホームディレクトリに書き出す。
- PidFileをユーザーのホームディレクトリに書き出す。



## 前提

(1) Singularityがインストールされていること。
    - [Singularityのインストール方法（Official Document)](https://www.sylabs.io/guides/2.6/user-guide/installation.html) 
    

(2) debootstrapがインストールされていること。

Ubuntu Linuxにインストールする場合、以下のようにする。

    sudo apt update
    sudo apt upgrade
    sudo apt install build-essential libtool automake libarchive-dev debootstrap git emacs
    
CentOSでは現時点では試していないが、以下のような記事がある。
- https://linuxconfig.org/how-to-debootstrap-on-centos-linux
    

## 使い方

    # sandboxコンテナのビルド
    git clone http://gitlab.ddbj.nig.ac.jp/oogasawa/singularity-ubuntu18-apache2
    cd singularity-ubuntu18-apache2
    mkdir -f ~/singularity-images
    sudo singularity build --sandbox ~/singularity-images/ubuntu18-apache2 Singularity
    
ディレクトリ名 `~/singularity-images/`, イメージ名ubuntu18-apache2はお好みで変えること。
    
    # sandboxコンテナ内での作業
    sudo singularity shell --writable ~/singularity-images/ubuntu18-apache2
    
    # simgファイルに固める。
    sudo singularity build ~/singularity-images/ubuntu18-apache2.simg ~/singularity-images/ubuntu18-apache2
    
### apache用singularityコンテナの起動と停止 (execコマンドによる)

    # run your container as a service.
    singularity instance.start ~/singulariy-images/ubuntu18-apache2.simg  web1
    
    # start apache2 server
    singularity exec instance://web1 apache_start.sh
    
    # stop apache2 server
    singularity exec instance://web1 apache_stop.sh
    
    # instance.stop 
    singularity instance.start web1
    
## References

- https://www.sylabs.io/guides/2.6/user-guide/running_services.html




    
    
