FROM quay.io/drsylent/cubix/block2/optional-base:ubuntu22
ARG IMAGE_BUILDER

LABEL image.builder="${IMAGE_BUILDER}"

USER root

RUN apt-get -y update \
    && apt-get -y install openjdk-21-jre-headless \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app
COPY --chown=1001 frontend/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT exec java $JAVA_OPTS -jar app.jar $JAR_ARGS