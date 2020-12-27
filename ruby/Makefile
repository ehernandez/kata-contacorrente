.PHONY: install-dependencies

install-dependencies:
	bundle -V

lint: install-dependencies
	bundle exec rubocop *.rb

lint_autocorrect: install-dependencies
	bundle exec rubocop -A *.rb

test: install-dependencies
	bundle exec rspec
