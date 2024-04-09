serve:
	python3 -m mkdocs serve
	
build:
	python3 -m mkdocs build
	
deploy:
	git pull
	echo "one-logger.com" > docs/CNAME
	python3 -m mkdocs gh-deploy -r origin
	echo "logger.kratapps.com" > docs/CNAME
	python3 -m mkdocs gh-deploy -r tmp