This repository is a collection of posix compliant shell scripts which can be loaded using a library management script. The management script assures that a library gets loaded only once also if *libmgmt_load* get called multiple times with the same library names. Therefore it is possible that two librarys can depend on each other without creating an endless loading loop.

# Usage
1. Install the libraries you want to use from the *lib* folder to the system on which you want to run the script or bundle them directly with your script. At the moment the following locations are valid:
    -- ./lib/
    -- ../lib/
    -- ~/.local/lib
    -- /usr/local/lib/
1. Bundle the library management script and source it with `. libmgmt.sh` or include the code from *libmgmt.sh* directly within your script.
1. Now you can load the libraries you want to use with `libmgmt__load <lib_name>`

# Contributing
## TODO
### Tests
- [ ] Write test for *io.sh*
- [ ] Add test for *wsl.sh*
### libmgmt
- [ ] Add second parameter to *libmgmt__loadlib* for specifying a library path
- [ ] Add function *libmgmt__install()* which fetches a remote library e.g. from github and installs it local
### wsl
- [ ] Find a fix for the *wslupath* workaround in *wsl__is_win_admin()*
### language
- [ ] Add *language.sh* for multilangugage scripts like *wsl-onboarding*
