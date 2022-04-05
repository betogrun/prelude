FROM ruby:3.1.1-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \ 
    git \
    libpq-dev \
    postgresql-client-common \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install bundler --no-document

WORKDIR /usr/src/app

ENTRYPOINT ["./entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
