# The path to the project firmware to be compiled.
# In many cases you may want keep the project path unaltered and alter the
# APP variables instead.
FIRMWARE_PATH=core-firmware

# The app within the applications directory of the firmware project to be 
# compiled unless otherwise specified.
#
# With the new updates one is allowed to create application folders in the
# applications directory. The default application is tinker, but multiple 
# applications may be hosted in the applications directory as well. Just make
# sure to add application code inside the application.cpp file within the app
# directory created.
#
# core-firmware/applications
# └── tinker
#     └── application.cpp
DEFAULT_APP=serial

BUILD_PATH=$(PWD)/build/

# The APPLICATIONS_PATH variable contains the name of the directory which 
# contains the applications. Instead of throwing your application source code
# inside the core-firmware directory you can use the APPLICATIONS_PATH 
# directory to store all your application files.
# 
# Before an attempt to compile, all projects marked with the APPLICATIONS 
# variable are symlinked into the core-firmware directory. After the attempt to
# compile these symlinks are subsequently removed.
#
# With APPLICATIONS_PATH=apps we set the apps directory within our project root
# as the directory to contain all Spark apps.
APPLICATIONS_PATH=applications

# The APPLICATIONS variable contains a space-delimited list of all applications
# within the APPLICATIONS_PATH that are eligible for compilation. Simply 
# stated, the APPLICATIONS variable allows one to mark the subdirectories of 
# APPLICATIONS_PATH that represent Spark applications.
# APPLICATIONS_PATH=serial tinker another_project
APPLICATIONS=serial
