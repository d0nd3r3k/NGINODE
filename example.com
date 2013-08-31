# Node Express on Port 8080
upstream example{
    server 127.0.0.1:8080;
}

# NGINX Server Instance
server {
    listen 0.0.0.0:80;
    server_name example.com www.example.com;
    access_log /var/log/nginx/example.log;

    # Gzip Compression
    gzip on;
    gzip_comp_level 6;
    gzip_vary on;
    gzip_min_length  1000;
    gzip_proxied any;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
    gzip_buffers 16 8k;

    # Proxy to the Node instance
    location / {
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header Host $http_host;
      proxy_set_header X-NginX-Proxy true;
      proxy_pass http://example.com;
      proxy_redirect off;
    }
 }
