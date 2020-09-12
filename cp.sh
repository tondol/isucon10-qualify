cd `dirname $0`
if [ $(id -u) != 0 ]; then
  echo "need to run with sudo"
  exit 1
fi

cp nginx-isuumo.conf /etc/nginx/sites-available/isuumo.conf
