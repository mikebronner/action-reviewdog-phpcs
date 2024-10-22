FROM php:8.3-alpine

ENV REVIEWDOG_VERSION=

RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -c https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && mv phpcs.phar /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
