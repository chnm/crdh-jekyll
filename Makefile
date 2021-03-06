gulp = ./node_modules/gulp/bin/gulp.js
# Creating the CSS needs to be run through Gulp

preview : clean
	bundle exec jekyll serve --watch --drafts --config _config.yml,_config-preview.yml

clean :
	rm -rf _site/*

deploy : clean 
	@echo "Building development site ..."
	bundle exec jekyll build --config _config.yml,_config-dev.yml
	@echo "Deploying to dev server ..."
	rsync --checksum --delete --exclude appendices/ -avz --no-perms \
		_site/* kaizen:/websites/crdh/www/dev/

deploy-production : clean
	@echo "Building site ..."
	bundle exec jekyll build --config _config.yml,_config-production.yml
	@echo "Deploying to server ..."
	rsync --checksum --delete --exclude appendices/ --exclude dev/ -avz --no-perms \
		_site/* kaizen:/websites/crdh/www/

.PHONY: preview deploy deploy-production clean 
