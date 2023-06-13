# shortcutter
create shortcuts to cd to from anywhere with a single command 

# Installation
1. Click green <> Code button
2. Click Download zip and Unzip zip 
4. put shortcutter.sh in your home folder
5. open your .bashrc
6. put "source shortcutter.sh" at the end of it


# Usage
there are only three commands so this is pretty basic stuff

cdsa (shortcut) (directory)
^ cd shortcut add 
^ Example: 
^ if i am in Downloads/project/version3 right now and i want a shortcut to the src folder under version 3 then 
^^^^ cdsa srcv3 src
^ or if i am in Downloads and i want a shortcut to project
^ cdsa proj project
^ fairly simple
^ if given no directory argument will use the current directory
^^^^ Example:
^^^^ if i am in Downloads/project and i want a shortcut to project i can 
^^^^^^^^^ cdsa proj

cdsl (string)
^ cd shortcut list (string)
^ searches through the list of things youve shortcutted to see if any of them contain whatever string you pass to it
^ lists them out to you 
^ if given no argument will list all shortcuts


cds (shortcut) 
^ takes you to wherever the shortcut was supposed to take you
^ if i cds proj ( we made it in the previous examples ) i will be taken to Downloads/project.

