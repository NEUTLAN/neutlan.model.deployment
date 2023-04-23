
deploy:
	$(MAKE) cnn

cnn:
	cd paraphrase && \
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
	uvicorn main:paraphraser --host 0.0.0.0 --port 8000 &

clean:
	rm -rf venv

windows:
	python3 -m venv venv
	venv\Scripts\Activate
	python.exe -m pip install --upgrade pip
	pip3 install -r requirements.txt