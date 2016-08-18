FROM scardon/ruby-node-alpine:2.2.3

WORKDIR /app

COPY . /app

RUN apk add --no-cache --update build-base sqlite-dev && \
    gem install bundler && bundle install


EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]