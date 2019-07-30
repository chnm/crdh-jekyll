gulp = ./node_modules/gulp/bin/gulp.js
# Creating the CSS needs to be run through Gulp

clean :
	rm -rf _site/*

preview : clean
	bundle exec jekyll serve --watch --drafts

build : clean
	@echo "Building site ..."
	bundle exec jekyll build

deploy : build
	@echo "Deploying to dev server ..."
	rsync --checksum --delete --exclude appendices/ -avz \
		_site/* athena:/websites/crdh/www/dev/

deploy-production : build
	@echo "Deploying to server ..."
	rsync --checksum --delete --exclude appendices/ -avz \
		_site/* athena:/websites/crdh/www/

appendices :
	rsync --checksum -avz ../crdh-appendices/* \
	 athena:/websites/crdh/www/appendices 

.PHONY: preview deploy appendices
