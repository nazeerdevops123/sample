FROM nginx:alpine

# Remove all default NGINX files
RUN rm -rf /usr/share/nginx/html/*

# Copy your local index.html directly to the web root
# Ensure index.html is in the same folder as this Dockerfile in your 'sample' repo
COPY index.html /usr/share/nginx/html/index.html

# Force NGINX to listen on 8080 (Hyperlift requirement)
RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Set permissions to ensure NGINX can read the file
RUN chmod 644 /usr/share/nginx/html/index.html