FROM maven:3.8.5-openjdk-21 AS builder
WORKDIR /app
COPY clinica_veterinaria/pom.xml .
COPY clinica_veterinaria/src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/clinica_veterinaria-0.0.1.jar app_veterinaria.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app_veterinaria.jar"]