serve:
	python3 -m mkdocs serve
	
build:
	python3 -m mkdocs build
	
deploy:
	make build
	python3 -m mkdocs gh-deploy