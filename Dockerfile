#
# Dockerfile for AWS DynamoDB Local
#
FROM makuk66/docker-oracle-java7
LABEL maintainer="Thomas Ritz <thomas.ritz@infopark.de>"

RUN mkdir /var/dynamodb
WORKDIR /var/dynamodb

ENV DYNAMODB_LOCAL_VERSION 2017-04-13
RUN wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar xzf dynamodb_local_latest.tar.gz && \
    rm dynamodb_local_latest.tar.gz

VOLUME "/var/dynamodb_local"

EXPOSE 8000

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]
CMD ["-port", "8000"]
