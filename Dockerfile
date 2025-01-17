FROM ruby:3.1.2-bullseye

RUN apt update -qq && apt upgrade -y
RUN apt-get install -y shared-mime-info build-essential

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

RUN bundle install
COPY . /app

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8096

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8096"]