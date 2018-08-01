FROM gradle:4.9-alpine

USER root

RUN apk add --no-cache git nodejs nodejs-npm
RUN apk add --no-cache --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers \
  make python curl autoconf automake \
  file nasm zlib-dev && \
  npm install --quiet gulp-cli -g && \
  npm install --quiet gulp -g && \
  npm install --quiet gulp-clean-css -g && \
  npm install --quiet gulp-compress -g && \
  npm install --quiet gulp-minify -g && \
  npm install --quiet gulp-concat -g && \
  apk del native-deps
  
USER gradle
  
CMD ["gradle"]
