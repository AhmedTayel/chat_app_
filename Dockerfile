FROM ruby:2.6.6

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . /app
EXPOSE 3000
CMD ["rails", "server"]

FROM ruby:2.7-alpine
# install rails dependencies
ENV BUNDLER_VERSION=2.0.2
RUN apk update && apk upgrade && apk add ruby ruby-json ruby-io-console ruby-bundler ruby-irb ruby-bigdecimal tzdata && apk add nodejs && apk add curl-dev ruby-dev build-base libffi-dev && apk add build-base libxslt-dev libxml2-dev ruby-rdoc mysql-dev sqlite-dev redis

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN  bundle check || bundle install




COPY . ./

ENTRYPOINT ["sh", "./config/docker/startup.sh"]