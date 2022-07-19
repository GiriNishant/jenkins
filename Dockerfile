#base image 
FROM openjdk:8
COPY ./HelloWorld.java /src/java/HelloWorld.java
WORKDIR /src/java
RUN ["javac","HelloWorld.java"]
ENTRYPOINT ["java","HelloWorld"]
