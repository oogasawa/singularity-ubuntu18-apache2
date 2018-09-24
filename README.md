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

    # コンテナのビルド
    git clone http://gitlab.ddbj.nig.ac.jp/oogasawa/ubuntu18-apache2-singularity
    sudo singularity build --sandbox your-container-name ubuntu18-apache2-singularity/ubuntu18-apache2.txt
    
    # コンテナ内での作業
    sudo singularity shell --writable your-container-name
    
    # simgファイルに固める。
    sudo singularity build your-container-name.simg your-container-name
    
    
    
    
