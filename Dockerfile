FROM ruby:2.5.0-slim

RUN apt-get update && \
    apt-get install -y build-essential nodejs libpq-dev postgresql-client

WORKDIR /app

COPY Gemfile* ./

ENV \
  BUNDLE_GEMFILE=./Gemfile \
  BUNDLE_JOBS=2

RUN bundle install

COPY . ./
