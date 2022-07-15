TAGS ?= all

all: provision

install: install-xcode install-ansible install-repo install-dirs

install-ansible: upgrade-pip pip-install-ansible

install-xcode:
	xcode-select -p 2>&1 >/dev/null || xcode-select --install
	if [ "`xcode-select -p`" != "/Library/Developer/CommandLineTools" ]; then sudo xcode-select -switch /Library/Developer/CommandLineTools; fi

install-repo: ./roles ./geerlingguy.mac-dev-playbook/main.yml

install-dirs:
	mkdir -p ~/.config/nvim/

provision:
	ansible-playbook main.yml -i geerlingguy.mac-dev-playbook/inventory -K --tags="$(TAGS)"

clean:
	rm -rf ./roles

.PHONY: all install install-ansible install-xcode install-repo install-dirs provision clean

./geerlingguy.mac-dev-playbook/main.yml:
	git submodule update --init --recursive

upgrade-pip:
	python3 -m pip install --upgrade pip
	python3 -m ensurepip --upgrade

pip-install-ansible: upgrade-pip
	pip3 install ansible

./roles:
	ansible-galaxy install -r requirements.yml
