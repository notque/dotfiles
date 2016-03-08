set -x http_proxy http://proxy.wdf.sap.corp:8080
set -x https_proxy http://proxy.wdf.sap.corp:8080
set -x ftp_proxy http://proxy.wdf.sap.corp:8080
set -x all_proxy http://proxy.wdf.sap.corp:8080
set -x no_proxy sap.corp,localhost,127.0.0.1,192.168.1.100,192.168.40.17,192.168.40.18,192.168.40.19,10.44.10.16,10.44.10.17,10.44.10.18,10.44.9.1,147.204.8.60

set PATH /Applications/Postgres.app/Contents/Versions/9.3/bin/ $PATH
set PATH /usr/local/Cellar/qt5/5.3.2/bin/ $PATH
