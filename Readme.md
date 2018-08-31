# init

Initializes a new computer for standard developer tasks. To install, simply run one of the scripts in `alias` from inside the `init` directory.

Note: On Windows, all scripts must be run as administrator.

## Installed Tools

After initialization, your system should have the following tools available, whether or not they already existed:

### Shell Productivity [INIT_CLI]

- Bash, configured with a descriptive prompt, several useful aliases, and a `shellrc.d` directory for addition alias files [INIT_CLI_SHELL]
- Git, configured with your name/email, sane defaults, fancy diffs, and a global .gitignore [INIT_CLI_GIT]
- SSH, with a public+private key for your email address [INIT_CLI_SSH]
- Tmux [INIT_CLI_TMUX]

### Programming languages [INIT_LANG]

- Python 2 [INIT_LANG_PYTHON]
- Java [INIT_LANG_JAVA]
- NodeJS via NVM [INIT_LANG_NODEJS]

### GUI applications [INIT_GUI]

- A multi-clipboard [INIT_GUI_MULTICLIPBOARD]
- Visual Studio Code, configured to be as unobtrusive as possible [INIT_GUI_VSCODE]
- Google Chrome [INIT_GUI_CHROME]
- Mozilla Firefox [INIT_GUI_FIREFOX]
- VLC Media Player [INIT_GUI_VLC]
- SourceTree [INIT_GUI_SOURCETREE]
- LibreOffice [INIT_GUI_LIBREOFFICE]

## Options

The following environment variables will affect the installation:

- INIT_REPO=[path to init repository]; Default: `$(dirname "$0")` - Controls where the scripts in this repository are located. May be required if invoked in some unusual situations.
- INIT_FORUSER=[ALL|CURRENT|ROOT]; Default: ALL - Controls whether to install things for the entire system or just for the current user. Note that user-specific components are always installed only for the current user. Note: To install only for the root user, you *must* specify `INIT_FORUSER=ROOT` and run as root.
- INIT_GITNAME="name"; Default: `$(git config --global user.name)` if exists, otherwise `$(id -un)` - Controls the configured username for Git.
- INIT_GITEMAIL="address@domain"; Default: `$(git config --global user.email)` if exists, otherwise `$(read -p)` - Controls the configured email address for Git and SSH keys.
- INIT_SSHCOPY=[GITHUB|OFF]; Default: GITHUB - Wait for you to copy your public key to certain accounts; set to OFF to not even bother.

Most components do not install by default. You must specify which components you want to install. There are a few methods available:

1. To install *all* components, set `INIT_ALL=ON` before running. Then you can disable specific *categories* of components or *individual* components by setting their associated environment variables to `OFF`.
2. You can also enable individual *categories* of components, by setting their associated environment variable to `ON` before running. Then you can disable specific components *within* that category by setting their associated environment variables to `OFF`.
3. You can also enable just the specific components you want by setting their associated environment variable to `ON` before running.

The following environment variables will be used for the installation and their current value will be saved for future shells:

- BENCH="path"; Default: `$HOME/bench` - This script creates and adds things into this directory to avoid cluttering `$HOME`.
- HOME="path"; Default: `~$USER` - The installing user's "home" directory; persisted for consistency in environments (like Windows) that don't already track this.

See the `alias` directory for example installation profiles.

## Unattended Installation

In order to run unattended, ensure the following:

- Run the script as sudo/administrator - this may not be necessary, but it is supported and should spare you entering your password
- Set the INIT_USEREMAIL environment variable
- Set the INIT_SSHCOPY environment variable to OFF

## Supported Systems

- Windows 7, 10
- OS X 10.11+

## Contributing

To pull local changes to certain copied files back into this project, run `update.sh`.
