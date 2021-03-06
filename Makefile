SHELL = /bin/bash

.PHONY: test install test-install prune clean minor
JSHINT := $(shell command -v jshint)
YARN := $(shell command -v yarn)

yarn-install:
ifndef YARN
	curl -o- -L https://yarnpkg.com/install.sh | bash
endif

install: yarn-install
	yarn install

test-install:
	yarn add mocha

test: lint
	@echo "there are no tests. Roll forward."

lint:
ifndef JSHINT
	yarn global add jshint
endif
	jshint --config=jshint.cfg *.js


prune:
	yarn install --production --ignore-scripts --prefer-offline

clean:
	rm -rf node_modules

minor:
	npm version minor

build:
	version="$$(node -e "console.log(require('./package.json').version);" | cut -d 'v' -f2)"; \
		docker build -t segment/billing-to-redshift:$$version -t segment/billing-to-redshift:latest . && \
		docker push segment/billing-to-redshift:latest && docker push segment/billing-to-redshift:$$version

build-latest:
	docker build -t segment/billing-to-redshift:latest . && docker push segment/billing-to-redshift:latest
