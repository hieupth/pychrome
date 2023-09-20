FROM hieupth/mamba

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && apt-get -y --no-install-recommends install google-chrome-stable && \
    apt-get purge --auto-remove -y gnupg && \
    rm -rf /var/lib/apt/lists/* && \
    mamba install -y selenium sqlalchemy sqlite && \
    mamba clean -ay