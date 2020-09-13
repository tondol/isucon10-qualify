cd `dirname $0`
if [ $(id -u) != 0 ]; then
  echo "need to run with sudo"
  exit 1
fi

cp nginx-isuumo.conf /etc/nginx/sites-available/isuumo.conf
cp nginx.conf /etc/nginx/nginx.conf
cp my.cnf /etc/mysql/conf.d/my.cnf
cp mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
