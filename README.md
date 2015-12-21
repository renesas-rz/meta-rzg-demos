# meta-rzg-demos-private

This is the private version of the public repository meta-rzg-demos. This is a working area where all collaborators can commit features and fixes. Tested and stable updates will be periodically pushed to the public meta-rzg-demos repository.

INSTRUCTIONS:

The recipes and scripts in this layer refer to the name of the public repository, which is meta-rgz-demos. 
To make them work correctly with the private repository, either create a symlink to the cloned private repository or rename it during cloning.


Option 1 - Clone the repository using the original name and create a symbolic link to it named meta-rzg-demos:

$ git clone https://github.com/renesas-rz/meta-rzg-demos-private<br>
$ ln -s ./meta-rzg-demos-private ./meta-rzg-demos

Option 2 - rename the repository during cloning:

$ git clone https://github.com/renesas-rz/meta-rzg-demos-private meta-rzg-demos

