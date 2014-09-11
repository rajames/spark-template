# Spark
Spark projects depend on the ```core-common```, ```core-communication-lib``` 
and the ```core-firmware``` projects.

This project contains these projects as 
[git submodules](http://git-scm.com/docs/git-submodule) to allow one to setup
a development environment a bit quicker.

## Setup
The assumption is made that your environment has been setup correctly. In case
of doubt or problems consult the [Spark README](https://github.com/spark/core-firmware/blob/master/README.md)
for the instructions on setting up the development environment.

After cloning, initialize the submodules using

    git submodules init

And possibly update your submodules to reflect the changes required by the
project by running

    git submodules update

You could also combine both steps by just running 
```git submodules update --init``` :wink:.

After setting up the project try to build the project.

## Compilation
Compile the Spark project by running ```make compile``` or simply ```make``` 
(which will take the liberty of cleaning your build directory as well).
