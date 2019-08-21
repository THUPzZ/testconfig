#!/bin/sh

if [ -e /root/index.html ]
then
  rm /usr/share/nginx/html/index.html
  cp /root/index.html /usr/share/nginx/html/index.html
else
  cp /usr/share/nginx/html/index.html /root/index.html
fi

sed -i 's_<!-- CONFIG -->_<script>const CONFIG = { "apiUrl": "'$API_URL'" };</script>_g' /usr/share/nginx/html/index.html
exec nginx -g "daemon off;"