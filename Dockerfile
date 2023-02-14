# Use the official MongoDB image
FROM mongo

# Set the working directory to /app
WORKDIR /app

# Copy the files to the working directory
COPY . /app

# Set the environment variables
ENV MONGO_INITDB_DATABASE Litegix_Backend
ENV MONGO_INITDB_ROOT_USERNAME mongo
ENV MONGO_INITDB_ROOT_PASSWORD wearegodbro

# Expose port 27017
EXPOSE 27017

# Add entrypoint script to initialize authentication
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

