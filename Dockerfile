FROM ruby:3.1
ENV BUNDLE_PATH /usr/local/bundle

RUN RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

WORKDIR /usr/src/your_application

COPY Gemfile .
COPY Gemfile.lock .
 
RUN bundle install

COPY . .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
