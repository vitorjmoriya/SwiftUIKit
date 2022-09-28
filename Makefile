lint:
	bundle exec fastlane lint

build:
	bundle exec fastlane build

test:
	@bundle exec fastlane test

install:
	@sudo gem install bundler
	@bundle install
	@sudo ./scripts/install-hook.sh
