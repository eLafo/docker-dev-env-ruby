FROM elafo/dev-env-base

RUN sudo apt-get update && \
  sudo apt-get install -qq -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    ssh \
    git \
    ruby-dev\

    postgresql \
    postgresql-contrib\

  && sudo rm -rf /var/lib/apt/lists*

ENV USER_NAME dev
ENV USER_HOME /home/$USER_NAME
ENV APP_HOME=$USER_HOME/app

ENV GEM_HOME=$APP_HOME/vendor/bundle
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_BIN $BUNDLE_PATH/bin
ENV BUNDLE_APP_CONFIG $APP_HOME/.bundle
ENV PATH $BUNDLE_BIN:$PATH
ENV SSH_PATH $USER_HOME/.ssh

RUN sudo gem install bundler

WORKDIR /${APP_HOME}
WORKDIR /home/dev/app

