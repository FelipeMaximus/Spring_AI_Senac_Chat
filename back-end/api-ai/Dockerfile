# Imagem  Java 23
FROM eclipse-temurin:23-jdk

# Diretório da aplicação
WORKDIR /app

# Copia o JAR gerado pelo Maven
COPY target/api-ai-0.0.1-SNAPSHOT.jar app.jar

# Porta do Spring Boot
EXPOSE 8080

# Aplicação
ENTRYPOINT ["java","-jar","app.jar"]