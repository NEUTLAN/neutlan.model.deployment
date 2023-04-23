
deploy:
	$(MAKE) cnn;
	$(MAKE) recommend;
cnn:
	cd classification && sudo docker-compose up -d;

recommend:
	cd paraphrase && \
	pwd && \
	test ! -f venv && python3 -m venv venv && \
	cd .. && \
	$(MAKE) setup;

server:
	test ! -f venv && virtualenv -p python3.8 venv;
	$(MAKE) setup

setup:
	cd paraphrase && \
	pwd && \
	. venv/bin/activate && \
	python3 -m pip install --upgrade pip && \
	pip3 install -r requirements.txt && \
	nohup uvicorn main:paraphraser --host 0.0.0.0 --port 8000 &

clean:
	rm -rf venv
	pkill uvicorn 
	docker container stop classification-tfserving_cnn-1
	docker container rm classification-tfserving_cnn-1

windows:
	python3 -m venv venv
	venv\Scripts\Activate
	python.exe -m pip install --upgrade pip
	pip3 install -r requirements.txt