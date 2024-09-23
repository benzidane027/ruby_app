FROM ruby:3.0.5
WORKDIR /app
COPY . /app/
ENV BUNDLE_PATH = /gems
RUN gem install bundler:2.4.12
RUN bundle install
EXPOSE 3000
