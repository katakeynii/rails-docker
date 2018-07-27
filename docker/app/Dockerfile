FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev imagemagick curl

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

RUN gem install rails 

ENV app /rails-base-docker

RUN mkdir $app

ENV BUNDLE_PATH /bundle-box

WORKDIR $app

COPY . $app
ADD . $app

# ENTRYPOINT ["./docker-entrypoint.sh"]


# EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
