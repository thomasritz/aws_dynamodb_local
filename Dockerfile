#
# Dockerfile for AWS DynamoDB Local
#
FROM makuk66/docker-oracle-java7
MAINTAINER Thomas Ritz <thomas.ritz@infopark.de>

RUN mkdir /var/dynamodb
WORKDIR /var/dynamodb

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tgz && \
    tar xzf dynamodb_local_latest.tgz && \
    rm dynamodb_local_latest.tgz

VOLUME ["/var/dynamodb_local", "/var/dynamodb"]

EXPOSE 8000

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]
CMD ["-port", "8000"]
