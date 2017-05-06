FROM ruby:2.1-alpine

ENV BUILD_PACKAGES build-base
# Update and install base packages
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /app

COPY Gemfile Gemfile.lock /app/

WORKDIR /app

RUN echo 'gem: --no-document' > ~/.gemrc
RUN bundle install --clean --jobs=4
RUN gem clean

COPY web.rb Procfile config.ru /app/

#default url for ms2
ENV MS_URL=http://master-ms2:4567

EXPOSE 4567

CMD rackup --host 0.0.0.0 -p 4567