FROM wordpress:4.9.2-apache

# Install the AWS CLI
RUN apt-get update && \
    apt-get install -y postgresql-client-9.6 && \
    apt-get -y install python curl unzip && cd /tmp && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" \
    -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && rm -rf awscli-bundle

COPY ./Scripts/secrets-entrypoint.sh /secrets-entrypoint.sh

ENTRYPOINT ["/secrets-entrypoint.sh"]
