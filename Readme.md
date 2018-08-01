# init

Initializes a new computer for standard developer tasks. To install, simply run `init.sh` (`init.bat` on Windows, run as administrator).

## Installed Tools

After initialization, your system should have the following tools available, whether or not they already existed:

### Shell Productivity

- Bash, configured with a descriptive prompt and a few useful aliases
- Git, configured with your name/email, sane defaults, fancy diffs, and a global .gitignore
- SSH, with a public+private key for your email address
- Tmux

### Programming languages

- Python 2
- Java
- NodeJS via NVM

### GUI applications

- Visual Studio Code, configured to be as unobtrusive as possible
- Google Chrome
- Mozilla Firefox
- VLC Media Player
- SourceTree
- LibreOffice

## Options

The following environment variables will affect the installation:

- INIT_REPO=[path to init repository]; Default: `$(dirname "$0")` - Controls where the scripts in this repository are located. May be required if invoked in some unusual situations.
- INIT_FORUSER=[ALL|CURRENT|ROOT]; Default: ALL - Controls whether to install things for the entire system or just for the current user. Note that user-specific components are always installed only for the current user. Note: To install only for the root user, you *must* specify `INIT_FORUSER=ROOT` and run as root.
- INIT_GITNAME="name"; Default: `$(git config --global user.name)` if exists, otherwise `$(id -un)` - Controls the configured username for Git.
- INIT_GITEMAIL="address@domain"; Default: `$(git config --global user.email)` if exists, otherwise `$(read -p)` - Controls the configured email address for Git and SSH keys.
- INIT_GUI=[ON|OFF]; Default: ON - Controls whether to install things that are only useful in a GUI environment.
- INIT_SSHCOPY=[GITHUB]; Default: GITHUB - Wait for you to copy your public key to certain accounts; set to empty to not even bother.

The following environment variables will be used for the installation and their current value will be saved for future shells:

- BENCH="path"; Default: `$HOME/bench` - This script creates and adds things into this directory to avoid cluttering `$HOME`.
- HOME="path"; Default: `~$USER` - The installing user's "home" directory; persisted for consistency in environments (like Windows) that don't already track this.

## Unattended Installation

In order to run unattended, ensure the following:

- Run the script as sudo/administrator - this may not be necessary, but it is supported and will spare you entering your password for a few steps
- Set the INIT_USEREMAIL environment variable
- Unset or empty the INIT_SSHCOPY environment variable

## Supported Systems

- Windows 7, 10
- OS X 10.11+

## Contributing

To pull local changes to certain copied files back into this project, run `update.sh`.
