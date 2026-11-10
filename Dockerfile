FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package

FROM tomcat:10.1.61-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/* \
    && sed -i 's/<Server port="8005"/<Server port="-1"/' /usr/local/tomcat/conf/server.xml

COPY --from=build /app/target/ex4.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]