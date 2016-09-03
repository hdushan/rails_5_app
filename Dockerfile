FROM ruby:2.2.3-slim

ARG DEBIAN_FRONTEND=noninteractive
ENV RAILS_ENV=test

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      libmysqlclient-dev \
      mysql-client &&\
    echo mysql-server mysql-server/root_password password '' | debconf-set-selections &&\
    echo mysql-server mysql-server/root_password_again password '' | debconf-set-selections &&\
    apt-get install -y mysql-server --no-install-recommends &&\
    sed -ie "s/^bind-address\s*=\s*127\.0\.0\.1$/bind-address = 0.0.0.0/" /etc/mysql/my.cnf &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists &&\
    gem install bundler

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /app
COPY . /app

RUN service mysql restart &&\
    bundle exec rake db:create &&\
    bundle exec rake db:migrate &&\
    bundle exec rake db:seed

EXPOSE 3306
EXPOSE 3000

CMD ["/bin/bash", "-c", "service mysql restart; bundle exec rails server -b 0.0.0.0"]