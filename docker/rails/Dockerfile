FROM ruby:3.4.5-trixie


ARG APP_HOME='/rails'


RUN apt-get update; \
    apt-get install -y \
            less \
            vim \
        ;

WORKDIR $APP_HOME
COPY [ \
    "${APP_HOME}/Gemfile", \
    "${APP_HOME}/Gemfile.lock", \
    "./" \
]


RUN bundle config set without 'production'; \
    bundle install;
