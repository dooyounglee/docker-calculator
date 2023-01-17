FROM openjdk:11-jre
RUN apt-get update && apt-get -y install sudo
RUN sudo groupadd docker
RUN sudo usermod -a -G docker doo
COPY build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]