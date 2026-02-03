FROM nginx:alpine

# 1. Clean the default directory
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy your file
# IMPORTANT: Ensure your file is named 'index.html' (all lowercase)
COPY index.html /usr/share/nginx/html/index.html

# 3. Set the correct permissions so NGINX can read the file
RUN chmod 644 /usr/share/nginx/html/index.html && \
    chown nginx:nginx /usr/share/nginx/html/index.html

# 4. Update NGINX config for Port 8080 (Hyperlift requirement)
RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# 5. Switch to a non-root user (Best practice for Hyperlift/Cloud)
USER nginx