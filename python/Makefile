PYTHON_VERSION?=python3
PYTHON_BINARY=./env/bin/python
PIP_BINARY=./env/bin/pip

all: virtualenv requirements

virtualenv:
	test -x $(PYTHON_BINARY) || virtualenv --python $(PYTHON_VERSION) env/

requirements:
	$(PIP_BINARY) install -r requirements.txt --upgrade

server: virtualenv requirements
	$(PYTHON_BINARY) server.py


.PHONY: clean
clean:
	rm -rf env
