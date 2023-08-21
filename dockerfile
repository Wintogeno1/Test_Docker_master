FROM ruby:2.7.1

# RUN mkdir /myapp

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /myapp

COPY Gemfile ./

COPY Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE  3000

CMD ["rails","server" , "-b" ,"0.0.0.0"]
