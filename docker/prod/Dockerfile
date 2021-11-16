FROM ruby:3.0.0

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
ARG DEBIAN_FRONTEND=noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && apt-get install -y build-essential \
    xorg \
    libssl-dev \
    libxrender-dev \
    wget \
    gdebi \
    postgresql-plpython \
    postgresql-client \
    libpq-dev \
    imagemagick \
    curl \
    xvfb \
    unzip \
    wkhtmltopdf

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcairo2-dev libjpeg62-turbo-dev libjpeg-dev libpango1.0-dev libgif-dev  build-essential g++
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y xvfb qt5-default libqt5webkit5-dev \
                          gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x


RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.xenial_amd64.deb
#RUN gdebi wkhtmltox_0.12.6-1.xenial_amd64.deb

ENV BUNDLE_PATH /bundle_cache

RUN gem install rails
RUN gem install bundler
RUN gem install foreman
RUN npm install -g foreman


ENV app /app

RUN mkdir $app


WORKDIR $app
COPY . $app

ENV RAILS_ENV production
ENV RACK_ENV production
ENV sonar_scanner_version 4.2.0.1873
RUN bundle config --delete without
RUN bundle config --delete with

RUN echo "Running \"bundle install $bundle_opts\" with environment set to \"production\"..." && \
    bundle check $bundle_opts || bundle install $bundle_opts


# ENTRYPOINT ["./docker-entrypoint.sh"]


# RUN wget -U "scannercli" -q -O /opt/sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${sonar_scanner_version}-linux.zip \
#     && unzip /opt/sonar-scanner-cli.zip -d /opt/ \
#     && rm /opt/sonar-scanner-cli.zip \
#     && mv /opt/sonar-scanner-${sonar_scanner_version}-linux /opt/sonar-scanner \
#     && ln -s  /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner


EXPOSE 3000

# CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
CMD ["./run.sh", "production"]
