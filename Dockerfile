FROM postgres:16.4-alpine3.20

RUN apk add --no-cache build-base git clang15 llvm15 && \
    git clone --branch v0.7.4 --depth 1 https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install && \
    cd .. && \
    rm -rf pgvector && \
    apk del build-base git clang15 llvm15