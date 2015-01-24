# These commands get executed on every vagrant reload.
date
cd /
rm -rf /DATA_nginx
git clone --depth 1 https://github.com/frca1958/DATA_nginx.git
docker run --name nginx1 -v /DATA_nginx/etc:/etc/nginx:ro -v /DATA_nginx/html:/usr/share/nginx/html:ro -p 80:80 -d nginx

