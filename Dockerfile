FROM python:3-alpine

RUN apk add --no-cache --virtual .build-deps \
      tar \
      gzip \
      make \
      gcc \
      libc-dev && \
    apk add --no-cache \
      git \
      bash \
      bash-completion

RUN wget 'https://ja.osdn.net/frs/redir.php?m=jaist&f=nkf%2F64158%2Fnkf-2.1.4.tar.gz' -O nkf-2.1.4.tar.gz && \
    tar zxvf nkf-2.1.4.tar.gz && \
    cd nkf-2.1.4 && \
    make && make install && \
    apk del .build-deps && \
    cd 

RUN pip install mkdocs && \
    pip install mkdocs-material && \
    pip install fontawesome_markdown
