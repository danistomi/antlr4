FROM openjdk:8-jdk-alpine

COPY antlr-4.7.1-complete.jar /usr/local/lib/antlr-4.7.1-complete.jar
RUN chmod +r /usr/local/lib/antlr-4.7.1-complete.jar

ENV CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"

RUN echo -e '#!/bin/sh\njava -Xmx500M -cp /usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH org.antlr.v4.Tool "$@"' > /usr/bin/antlr4 && \
    chmod +x /usr/bin/antlr4
