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
- INIT_FORUSER=[ALL|CURRENT]; Default: ALL - Controls whether to install things for the entire system or just for the current user. Note that user-specific components are always installed only for the current user.

## Supported Systems

- Windows 7, 10
- OS X 10.11+
