# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Download the works database converter
RUN wget https://minio.mbd-inc.io/wdb-excel-conversion/WorksDatabaseConverter.jar

# Set environment variables
ENV SOURCE_DIR=/app/source
ENV OUTPUT_DIR=/app/output
ENV CONVERTER_PATH=/app/WorksDatabaseConverter.jar
ENV LIBREOFFICE_PATH=/usr/bin/libreoffice

# Install LibreOffice
RUN apt-get update && apt-get install -y libreoffice

# Install Java
RUN apt-get update && apt-get install -y default-jre

# Setup volumes
VOLUME /source
VOLUME /output

# Run the command to convert WorksDatabase files to Excel
CMD ["python", "main.py"]
