# FROM frolvlad/alpine-glibc:alpine-3.8
FROM alpine

ENV JAVA_VERSION=8 \
    JAVA_UPDATE=192 \
    JAVA_BUILD=12 \
    JAVA_PATH=750e1c8617c5452694857ad95c3ee230 \
    JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip && \
    cd "/tmp" && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jre-8u192-linux-x64.tar.gz" && \

    tar -xzf "jre-8u192-linux-x64.tar.gz" && \
    mkdir -p "/usr/lib/jvm/java-8-oracle" && \
    mv "/tmp/jre1.8.0_192" "/usr/lib/jvm/java-8-oracle/jre" && \
    ln -s "java-8-oracle" "/usr/lib/jvm/default-jvm" && \
    ln -s "$JAVA_HOME/jre/bin/"* "/usr/bin/" && \
