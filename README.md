# Ubuntu18 - Apache2 Singularity

Ubuntu Linux 18.04 (Bionic) にApache2をインストールしたSingularityコンテナ

Apache2はソースコードからインストールする。

ポイントはhttpd.confで以下のようにすることで、最終的にroot権限なしでApache2をsingularityコンテナで起動できるということ。

- ポート番号を1024より大きくする。
- error_log, access_logをユーザーのホームディレクトリに書き出す。
- PidFileをユーザーのホームディレクトリに書き出す。



## 前提

- Singularityがインストールされていること。
    - [Singularityのインストール方法（Official Document)](https://www.sylabs.io/guides/2.6/user-guide/installation.html) 
    

Ubuntu Linuxにインストールする場合

    sudo apt update
    sudo apt upgrade
    sudo apt install build-essential libtool automake libarchive-dev debootstrap git emacs
    
    
    
    

## 使い方

    # sandboxコンテナのビルド
    git clone http://gitlab.ddbj.nig.ac.jp/oogasawa/ubuntu18-apache2-singularity
    sudo singularity build --sandbox your-container-name ubuntu18-apache2-singularity/ubuntu18-apache2.txt
    
    # sandboxコンテナ内での作業
    sudo singularity shell --writable your-container-name
    
    # simgファイルに固める。
    sudo singularity build your-container-name.simg your-container-name
    
### apache用singularityコンテナの起動と停止 (execコマンドによる)

    # run your container as a service.
    singularity instance.start your-container.simg  web1
    
    # start apache2 server
    singularity exec instance://web1 apache_start.sh
    
    # stop apache2 server
    singularity exec instance://web1 apache_stop.sh
    
    # instance.stop 
    singularity instance.start web1
    
## References

- https://www.sylabs.io/guides/2.6/user-guide/running_services.html




    
    
