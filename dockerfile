# Use the official Python base image
FROM python:3.9-slim-buster

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jre-headless \
    libreoffice \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir openpyxl

# Set the working directory
WORKDIR /app

# Download the converter jar file into the container
RUN curl -o /app/WorksDatabaseConverter.jar https://minio.mbd-inc.io/wdb-excel-conversion/WorksDatabaseConverter.jar

# Copy your Python script into the container
COPY ./main.py /app/main.py

# Set environment variables
ENV LIBREOFFICE_PATH=/usr/bin/soffice
ENV CONVERTER_PATH=/app/WorksDatabaseConverter.jar
ENV DOCKER_ENV=1

# Set the entrypoint to run your script
ENTRYPOINT ["python", "/app/main.py"]
