FROM ruby:2.5.1
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -qq && \
    apt-get install -y apt-utils && \
    apt-get install -y build-essential
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.9.1
RUN git clone https://github.com/creationix/nvm.git $NVM_DIR && \
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    npm install -g yarn
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
# && yarn install
ADD . /myapp
CMD bin/rails s -e production
