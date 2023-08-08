FROM ruby:3.0.5-alpine

# libpq-dev this lib for postgress  not test it yet
RUN apk add --update --virtual \
    libpq-dev \
    runtime-deps \
    postgresql-client \
    build-base \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    yarn \
    libffi-dev \
    readline \
    build-base \
    postgresql-dev \
    libc-dev \
    linux-headers \
    readline-dev \
    file \
    imagemagick \
    git \
    tzdata  \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/
ENV BUNDLE_PATH = /gems
RUN yarn install
RUN gem install bundler:2.4.12
RUN bundle install
RUN bundle exec rake db:migrate

ENTRYPOINT [ "bin/rails" ]
CMD ["s","-b","0.0.0.0"]
EXPOSE 3000

