# Spark
Spark projects depend on the ```core-common```, ```core-communication-lib``` 
and the ```core-firmware``` projects.

This project contains these projects as 
[git submodules](http://git-scm.com/docs/git-submodule) to allow one to setup
a development environment a bit quicker.

Because this project is set-up using git submodules, the advantage of locking 
the active revision of each submodule is now yours.

We use this approach to ensure that every one of our developers' environments 
are working with the right dependencies.
When we decide to use newer revisions of submodules, we can make these changes
and allow our developers to get up to speed by simply updating the git 
submodules in one go. The nice thing is that we will not run into merge 
conflicts since we do not to touch the codebase written by the Spark team.

## Usage
We have a simple makefile ready for you to get started ASAP, so I would 
recommend you take a peek. For those who don't want to

### Compile
Build your application named ```tinker```.

    make compile APP=tinker

Build the ```DEFAULT_APP``` as specified in the ```settings.mk``` file

    make compile

Please note that the compile task creates the symlinks, attempts the 
compilation and removes the symlinks prior to calling it quits.

### Clean-up
Remove all project symlinks and clean up the build directories

    make clean

### Information
View which application is the to be compiled with the given CLI variables and
settings

    make which

View which applications is currently available for compilation, upload or
something else given the current system variables and project settings

    make apps

Upload the your application to a Spark core through USB

    make upload

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

## Compilation
Compile by running 

    make compile
    
or simply 

    make

which will take the liberty of cleaning your build directory as well.

Multiple applications may be contained within the applications directory. You 
may select the application to compile by appending ```APP=APPLICATION_NAME``` 
to the make command, replacing ```APPLICATION_NAME``` for the application you 
really want to compile.

Unless ```APP``` is specified, the makefiles will regard the ```DEFAULT_APP``` 
specified in the ```settings.mk``` file as the application to be built,
effectively changing ```make``` to ```make APP=WHATEVER_THE_DEFAULT_APP_IS```.

With the ```BUILD_PATH``` buildfiles are stored in a directory of your 
choosing. We would recommend you use the default directory which is simply the
```build``` directory inside this project's root.

## Structure
In order to allow development without increased risk of merge conflicts as the
Spark team keeps polishing the codebases, some effort has been invested in 
keeping all project-specific code out of the Spark repositories.

Instead of integrating all source code within the core-firmware project one may
now use the ```core-firmware/applications``` directory to store user files.
The chances of source files running into merge conflicts with new Spark updates
are smaller when using the ```core-firmware/applications``` directory because 
the Spark team and you will no longer be touching the same files in the 
pursuit of greatness.

Instead of working inside ```core-firmware/applications``` we decided to take
it one step further, by trying not to touch the ```core-firmware``` project at
all in our development efforts.

Inside the root directory one may specify an ```APPLICATIONS_PATH```. This is
where your _user applications_, as Spark calls them, are stored.

Within the ```APPLICATIONS_PATH``` one may have several applications stored in
appropriately named subdirectories. Spark has documented the use of User 
applications in their [README on Building a User Application](https://github.com/spark/core-firmware/blob/master/build/readme.md#building-a-user-application).

A simple example of the new project structure is presented below. This time you
only ever touch the applications and build subdirectories. The rest it Spark's
territory.

    your_project
    ├── core-common-lib
    ├── core-communications-lib
    ├── core-firmware/applications
    ├── build
    │   ├── serial.bin
    │   ├── serial.elf
    │   ├── serial.hex
    │   ├── serial.map
    │   ├── tinker.bin
    │   ├── tinker.elf
    │   ├── tinker.hex
    │   └── tinker.map
    └── applications
        ├── tinker
        │   └── application.cpp
        └── serial
            ├── printsomething.cpp
            ├── helpers.cpp
            └── header.h
