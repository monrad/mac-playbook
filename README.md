# Mac Development Ansible Playbook

Almost all of this comes from oxyc ['oxyc/mac-playbook'](https://github.com/oxyc/mac-playbook).
The playbook contained in this repo does nothing except delegate all functionality to [`geerlingguy/mac-dev-playbook`](https://github.com/geerlingguy/mac-dev-playbook)'s playbook.

*Note: Do NOT install anything you haven't looked through–this is a highly opinionated set of configurations. Running the playbook will affect pretty much every aspect of your environment so for others than me, this is mostly a reference point.*

*See also*:

- [`geerlingguy/mac-dev-playbook`](https://github.com/geerlingguy/mac-dev-playbook) (the actual playbook used to provision)

## Installation

    # Pre tasks
    Log into Mac App Store (App Store in Spotlight)

    # Create git repo dir
    mkdir -p ~/git/bootstrap
    cd ~/git/bootstrap

    # Clone this repository to your local drive.
    git clone --recursive https://github.com/monrad/mac-playbook.git
    cd mac-playbook

    # Install dependencies.
    make install

    # Run the playbook.
    make provision

    # Addtional tasks
    Open up the `Mac Playbook - Bootstrap` note and follow it.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook`'s `--tags` flag. The tags available are `dotfiles`, `homebrew`, `mas` and `osx`.

    ansible-playbook main.yml -i geerlingguy.mac-dev-playbook/inventory -K --tags "dotfiles,homebrew"

## Future additions

### Things that still need to be done manually

1. Setup Divvy shortcuts and license.
1. Allow `Divy` Accessibility control under _Security & Privacy_ preferences.

