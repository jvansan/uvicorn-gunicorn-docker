build:
	cd python3 && \
	for version in 3.9 3.8 3.7 3.6; do \
		docker build --build-arg PYTHONVERSION=$$version -t jvansan/uvicorn-gunicorn:$$version .; \
	done

push:
	for version in 3.9 3.8 3.7 3.6; do \
		docker push jvansan/uvicorn-gunicorn:$$version ; \
	done