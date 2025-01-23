FROM openjdk:17

WORKDIR /MyProj

RUN mkdir /demo
COPY /home/ec2-user/esb-common-util-1.0.0.jar.jar  /demo/esb-common-util-1.0.0.jar
# Copy only the project directory (replace 'myproject' with your actual project directory name)
COPY ./target/*.jar myproj-demo.jar

RUN ls
RUN ls -al /MyProj && ls -al /demo


ENTRYPOINT ["java", "-jar", "myproj-demo.jar"]

EXPOSE 8090
