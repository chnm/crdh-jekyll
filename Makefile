gulp = ./node_modules/gulp/bin/gulp.js
preview :
	$(gulp)

deploy :
	@echo "Building site ..."
	$(gulp) clean
	$(gulp) build
	@echo "Deploying to server ..."
	rsync --checksum --delete --exclude appendices/ -avz \
		_site/* athena:/websites/crdh/www/

appendices :
	rsync --checksum -avz ../crdh-appendices/* \
	 athena:/websites/crdh/www/appendices 

.PHONY: preview deploy appendices
