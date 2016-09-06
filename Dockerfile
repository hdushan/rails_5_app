FROM ruby:2.2.3-slim

ENV RAILS_ENV=development

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      libmysqlclient-dev \
      mysql-client &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists &&\
    gem install bundler

WORKDIR /tmp
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /app
COPY . /app

EXPOSE 3000

RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]