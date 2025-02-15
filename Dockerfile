# Stage 1: Build stage
FROM maven:3.9.5-eclipse-temurin-17 AS builder

# Set the working directory inside the container
WORKDIR /MyProj

# Create a directory for dependencies
RUN mkdir /demo

# Copy the custom JAR file into the container
COPY ./esb-common-util-1.0.0.jar /demo/

# Debug: Verify the file is in the correct location
RUN ls -al /demo

# Install the custom JAR into the local Maven repository
RUN mvn install:install-file \
    -Dfile=/demo/esb-common-util-1.0.0.jar \
    -DgroupId=com.bandhanbank \
    -DartifactId=esb-common-util \
    -Dversion=1.0.0 \
    -Dpackaging=jar \
    -DgeneratePom=true

RUN ls
# Copy the project source code into the container (adjust the path if needed)
COPY ./ /MyProj/

RUN ls
# Build the project (skipping tests for faster builds)
RUN mvn clean install -DskipTests=true

# Stage 2: Runtime stage
FROM openjdk:17

# Copy the built JAR file from the builder stage
COPY --from=builder /MyProj/target/*.jar myproj-demo.jar

# Debug: Verify the JAR file was copied
RUN ls -al

# Set the entry point to run the JAR
ENTRYPOINT ["java", "-jar", "myproj-demo.jar"]

# Expose the application port
EXPOSE 8090
