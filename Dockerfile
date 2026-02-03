# Use a lightweight NGINX image
FROM nginx:alpine

# Copy your HTML file into the NGINX folder
COPY index.html /usr/share/nginx/html/index.html

# IMPORTANT: Configure NGINX to listen on port 8080 instead of 80
# Hyperlift expects the app to run on 8080 by default.
RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# NOTE: Do NOT use the EXPOSE command as per Hyperlift requirements.