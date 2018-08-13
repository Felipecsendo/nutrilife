FROM ruby:2.5.1
MAINTAINER Felipe Endo

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN apt-get update \
    && apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
    && apt-get install -y --no-install-recommends \
    postgresql-client vim nodejs locales \
    && mkdir /nutrilife \
    && gem install bundler \
    && gem install bundler \
    && bundle config build.nokogiri --use-system-libraries \
    && bundle install && gem install bundler-audit \ 
    && apt-get clean

RUN git config --global user.name "Felipe Docker" \
    && git config --global user.email "felipecs.endo@gmail.com"


EXPOSE 3000
EXPOSE 80
WORKDIR /nutrilife
ADD . /nutrilife
VOLUME ./nutrilife
ENTRYPOINT ["/bin/bash"]


    



