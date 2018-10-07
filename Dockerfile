FROM ruby:2.5.1
LABEL maintainer='Nutrilife'

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN apt-get update \
    && apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
    && apt-get install -y --no-install-recommends \
    postgresql-client vim nodejs locales \
    && apt-get install -y xvfb \
    && mkdir /nutrilife \
    && gem install bundler \
    && gem install bundler \
    && bundle config build.nokogiri --use-system-libraries \
    && bundle install && gem install bundler-audit \ 
    && apt-get clean \
    && alias xrspec='xvfb-run -a bundle exec rspec'


EXPOSE 3000
EXPOSE 80
WORKDIR /nutrilife
ADD . /nutrilife

