FROM openjdk:8-jdk-alpine

RUN apk add curl

RUN curl -O https://www.antlr.org/download/antlr-4.7.1-complete.jar && \
    mv antlr-4.7.1-complete.jar /usr/local/lib/antlr-4.7.1-complete.jar && \
    chmod +r /usr/local/lib/antlr-4.7.1-complete.jar

ENV CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"

RUN echo -e '#!/bin/sh\njava -Xmx500M -cp /usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH org.antlr.v4.Tool "$@"' > /usr/bin/antlr4 && \
    chmod +x /usr/bin/antlr4
    
RUN echo -e '#!/bin/sh\njava -Xmx500M -cp /usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH org.antlr.v4.gui.TestRig "$@"' > /usr/bin/grun && \
    chmod +x /usr/bin/grun
