FROM python:3-slim

# 2. Copy your local index.html into the container
COPY index.html ./

# 3. Start the server on port 8080 (Hyperlift default)
CMD ["python3", "-m", "http.server", "8080"]