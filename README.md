This repository is a collection of posix compliant shell scripts. The library management script *libmgmt.sh* provides a convenient method to load shell libraries. It assures that a library gets loaded only once also if it gets included multiple times. Therefore it is possible that two librarys can depend on each other without creating an endless loading loop.

# Usage
1. Install the libraries you want to use from the *lib* folder to the system on which you want to run the script or bundle them directly with your script. At the moment the following locations are valid:
    -- ./lib/
    -- ../lib/
    -- ~/.local/lib
    -- /usr/local/lib/
 Make sure to also install the dependencies of the libraries you want to use, because some libraries depend on other libraries.
1. Bundle the library management script and source it with `. libmgmt.sh` or include the code from *libmgmt.sh* directly within your script.
1. Now you can load the libraries you want to use with `libmgmt__load <lib_name>`

# Contributing
If you want to contribute please use the [Google Shelle Style Guide](https://google.github.io/styleguide/shell.xml) as a coding standard with the following modifications:
- Functions should be prefixed by the library name separated by `__` from the function name
- Global variables should be prefixed by the library name written all upper case and separated by `_` from the variable name
- Variables used locally in functions should be prefixed by the library library name written all lower case and separated by `_` from the variable name
- Variables used locally in a function should be unset before returning

