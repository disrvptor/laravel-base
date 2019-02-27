FROM php:7.3.2-fpm

# this image adds additional extensions to default php image :
# zip pdo_mysql mysqli bcmath

LABEL maintainer="Guy Pascarella <guy.pascarella@gmail.com>"

RUN apt-get update -yqq \
&&  apt-get install -y \
		git-core \
		libzip-dev \
		zip \
		unzip \
		bzip2 \
		--no-install-recommends \
&&  rm -r /var/lib/apt/lists/* \
&& docker-php-ext-configure zip --with-libzip \
&&  docker-php-ext-install -j$(nproc) zip pdo_mysql mysqli bcmath \
&&  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
