FROM ruby:3.4.3

WORKDIR /app
COPY . .
RUN bundle install

CMD ["./bin/run"]

