serve:
	python3 -m mkdocs serve
	
build:
	python3 -m mkdocs build
	
deploy:
	git pull
	make build
	python3 -m mkdocs gh-deploy