cd `dirname $0`
if [ $(id -u) != 0 ]; then
  echo "need to run with sudo"
  exit 1
fi

systemctl restart nginx.service
systemctl restart isuumo.ruby.service
