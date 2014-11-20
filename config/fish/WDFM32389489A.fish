set -x http_proxy http://proxy.wdf.sap.corp:8080
set -x https_proxy http://proxy.wdf.sap.corp:8080
set -x ftp_proxy http://proxy.wdf.sap.corp:8080
set -x all_proxy http://proxy.wdf.sap.corp:8080
set -x no_proxy "sap.corp,localhost"

set PATH /Applications/Postgres.app/Contents/Versions/9.3/bin/ $PATH
set PATH /usr/local/Cellar/qt5/5.3.2/bin/ $PATH
