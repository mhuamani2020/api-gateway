# syntax=docker/dockerfile:1
# ============================================================================
# api-gateway — imagen Docker (Parte II: API gateway con Spring Cloud Gateway).
# Build multi-etapa. No depende de bank-resilience-commons.
#
# El contexto de build es la RAÍZ del proyecto (ver docker-compose.yml):
#   docker build -f api-gateway/Dockerfile -t api-gateway .
# ============================================================================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /workspace

COPY api-gateway/pom.xml api-gateway/pom.xml
COPY api-gateway/src api-gateway/src
RUN mvn -q -B -f api-gateway/pom.xml -DskipTests package

# ---------- Etapa de ejecución ----------
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /workspace/api-gateway/target/*.jar app.jar
EXPOSE 8089
HEALTHCHECK --interval=10s --timeout=5s --start-period=45s --retries=12 \
  CMD bash -c 'exec 3<>/dev/tcp/127.0.0.1/8089'
ENTRYPOINT ["java","-jar","/app/app.jar"]
