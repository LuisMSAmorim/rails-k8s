FROM ruby:3.2.2-slim

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev git libyaml-dev

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
