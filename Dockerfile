FROM ruby:3.1.2
WORKDIR /app
COPY . /app/
ENV BUNDLE_PATH = /gems
RUN gem install bundler:2.4.12
RUN bundle install
RUN  apt-get update -y && apt install libvips -y

