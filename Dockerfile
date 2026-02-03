# Use the official NGINX Alpine image
FROM nginx:alpine

# Use WORKDIR to set the context properly
WORKDIR /usr/share/nginx/html

# Delete the default NGINX index page first to avoid conflicts
RUN rm -rf ./*

# Copy EVERYTHING from your local folder into the container
# This ensures that your 'index.html' is exactly where it needs to be
COPY . .

# Adjust the port to 8080 for Spaceship Hyperlift compatibility
RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# No EXPOSE command needed for Hyperlift