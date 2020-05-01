FROM openjdk:11.0.6-jdk-slim

ENV JAVA_OPTS=""
ENV SPRING_PROFILES_ACTIVE=docker
ARG APP_VERSION="0.0.1-SNAPSHOT"

RUN addgroup --system spring && adduser --system spring
USER spring:spring
VOLUME /tmp
WORKDIR /home/spring
ADD build/libs/codex-catalog-${APP_VERSION}.jar /home/spring/app.jar
ADD src/main/resources/* /home/spring/
ADD script/* /home/spring/
ENTRYPOINT [ "sh", "-c", "exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /home/spring/app.jar --spring.profiles.active=$SPRING_PROFILES $SPRING_ARGS"  ]