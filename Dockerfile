# Use lightweight Nginx
FROM nginx:alpine

# Copy your HTML file
COPY . /usr/share/nginx/html

# Create a config that listens on BOTH Port 80 and 3000
# This stops the Easypanel crash loop guaranteed.
RUN echo 'server { \
    listen 80; \
    listen 3000; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose both ports
EXPOSE 80
EXPOSE 3000

# Start Server
CMD ["nginx", "-g", "daemon off;"]
