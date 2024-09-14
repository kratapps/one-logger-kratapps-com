serve:
	python3 -m mkdocs serve
	
build:
	python3 -m mkdocs build

docker-build-image:
	docker build -t py .

docker-build:
	docker run -p 8000:8000 -v "$(PWD):/app" -t py mkdocs build --site-dir docs/
