# Use the official Apache image
FROM httpd:2.4

# Copy your local HTML files to Apache's document root
COPY ./index.html /usr/local/apache2/htdocs/

