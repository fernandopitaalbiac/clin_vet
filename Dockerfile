FROM maven:3.9.6-eclipse-temurin:21-jdk-alpine as build
WORKDIR /app
COPY clinica_veterinaria/pom.xml .
COPY clinica_veterinaria/src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/clinica_veterinaria-0.0.1.jar app_veterinaria.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app_veterinaria.jar"]
