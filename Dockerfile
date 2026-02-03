FROM nginx:alpine

# 1. Clean out the directory
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy your file (Ensure it is named index.html in your repo)
COPY index.html /usr/share/nginx/html/index.html

# 3. Fix Port 8080 (Crucial for Hyperlift)
RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# 4. Ensure permissions are wide open for the web server
RUN chmod -R 755 /usr/share/nginx/html