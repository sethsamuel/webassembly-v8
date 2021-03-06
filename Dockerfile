FROM alpine

RUN apk add --no-cache bash

#Currently we need a beta version of node

WORKDIR /

RUN apk add --no-cache git && \
    apk add --no-cache cmake make gcc g++  && \
    apk add --no-cache python linux-headers openssl && \
    git clone https://github.com/nodejs/node.git && \
    cd /node && \
    git checkout v7.x-staging && \
    ./configure && make && \
    make install && \
    apk del git && \
    apk del cmake make gcc g++  && \
    apk del python linux-headers openssl && \
    rm -rf /node

# END BETA NODE

CMD ["bash"]
