FROM php:7.2.2-fpm

# this image adds additional extensions to default php image :
# zip pdo_mysql mysqli bcmath

MAINTAINER Guy Pascarella <guy.pascarella@gmail.com>

RUN apt-get update -yqq \
&&  apt-get install -y \
		git-core \
		zlib1g-dev \
		zip \
		bzip2 \
		--no-install-recommends \
&&  rm -r /var/lib/apt/lists/* \
&&  docker-php-ext-install -j$(nproc) zip pdo_mysql mysqli bcmath \
&&  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
