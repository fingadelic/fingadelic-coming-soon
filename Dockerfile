# 1. Use the standard lightweight Nginx image
FROM nginx:alpine

# 2. Copy your website files to the server
COPY . /usr/share/nginx/html

# 3. OVERWRITE the Nginx config to listen on BOTH Port 80 and 3000
RUN echo 'server { \
    listen 80; \
    listen 3000; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# 4. Expose both ports to be safe
EXPOSE 80
EXPOSE 3000

# 5. Start Nginx
CMD ["nginx", "-g", "daemon off;"]
