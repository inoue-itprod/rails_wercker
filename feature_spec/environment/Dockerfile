FROM ruby:2.5-slim
RUN apt-get update -qq && apt-get install -y build-essential curl
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN apt-get -y install unzip libnss3-tools
RUN mkdir -p /usr/share/fonts/noto && \
    curl -o /tmp/NotoSansCJKjp-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    unzip /tmp/NotoSansCJKjp-hinted.zip -d /usr/share/fonts/noto/
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && apt-get -y install google-chrome-stable
RUN curl -o /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$(curl -fsSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver_linux64.zip -d /usr/local/bin
ADD feature_spec/environment/Gemfile ./Gemfile
ADD feature_spec/environment/Gemfile.lock ./Gemfile.lock
ADD feature_spec ./feature_spec
RUN gem install bundler && bundle ins
CMD bundle exec rspec ./feature_spec "$@"
