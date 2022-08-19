FROM openjdk
COPY target/*.jar /
EXPOSE 8080
ENTRYPOINT ["java","-jar","/devops-app-1.0-SNAPSHOT.jar"]
