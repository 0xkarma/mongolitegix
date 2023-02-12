# Use the official MongoDB image
FROM mongo

# Set the working directory to /app
WORKDIR /app

# Copy the files to the working directory
COPY . /app

# Set the environment variables
ENV MONGO_INITDB_DATABASE Litegix_Backend

# Expose port 27017
EXPOSE 27017
