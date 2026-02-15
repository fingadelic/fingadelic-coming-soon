# Use the lightweight Nginx image
FROM nginx:alpine

# Copy your HTML files to the web server
COPY . /usr/share/nginx/html

# FORCE Nginx to listen on port 3000 instead of 80
RUN sed -i 's/listen       80;/listen       3000;/' /etc/nginx/conf.d/default.conf

# Tell Docker we are using port 3000
EXPOSE 3000
