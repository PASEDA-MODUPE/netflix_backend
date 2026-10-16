
FROM ubuntu

# Install necessary packages
RUN apt-get update && apt-get install -y openjdk-17-jre-headless maven

# Set the working directory
WORKDIR /app

# Copy source files and pom.xml
COPY ./src /app/src
COPY ./pom.xml /app/pom.xml

# Build the application
RUN mvn -f /app/pom.xml clean package
RUN cp /app/target/*.jar /app/app.jar

# Expose the Spring Boot port
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
