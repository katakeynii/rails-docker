# FROM phusion/passenger-ruby25
FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential postgresql-plpython postgresql-client libpq-dev imagemagick curl

RUN apt-get update \
    && apt-get install -y xvfb qt5-default libqt5webkit5-dev \
                          gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x


RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

# Configuring main directory
ENV BUNDLE_PATH /bundle_cache
ENV APP /app
RUN mkdir -p $APP
WORKDIR $APP

# Setting env up
ENV RAILS_ENV='production'
ENV RAKE_ENV='production'


# Adding project files
COPY Gemfile $APP/Gemfile
COPY Gemfile.lock $APP/Gemfile.lock

RUN set -ex && bundle --retry 3
RUN bundle install --jobs 20 --retry 5 --without development test

COPY . $APP


EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
# CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
