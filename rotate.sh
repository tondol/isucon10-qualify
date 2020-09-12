cd `dirname $0`
if [ $(id -u) != 0 ]; then
  echo "need to run with sudo"
  exit 1
fi

now=`date +%Y%m%d-%H%M%S`
mv /var/log/nginx/access.log /var/log/nginx/access.log.$now
