.PHONY: build
build:
	npm install build/
	grunt --gruntfile build/Gruntfile.coffee -d --stacktrace
