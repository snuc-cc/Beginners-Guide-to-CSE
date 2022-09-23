# Linux Command Cheat Sheet
## The *very very useful ones*
### `man`
- `man <command name>`
- The main command returns a helpful help page that gives you a brief description of what exactly a command does and how to use it.
- In case that man doesn't work, make sure that you have `mandocs` or `man` installed.
- The manual entries can also be accessed via a browser.

### `--help` or `-h` flag
 - Sometimes a command is too niche to warrant a page in the manual. In such cases you can use the help flags. There is no set standard but they're usually one of the two
 - `<command> --help` or `<command> -h`
 - If one doesn't work, try the other.
 
### `sudo` and `su` 
- `su` opens the current shell as root while `sudo` runs a specified command as root.
- In Linux root priviliges are very similiar to Adminstrator priviliges in Windows
- Be very careful when running anything as root. It can break your system.--
- It also requires the current user to know the root password as well be a part of the sudoers list

## The Essentials
### `cd`
- `cd` is used to traverse the filesystem from the terminal
- `cd <path>` will move the terminal to the defined path
- `cd ..` will move the terminal to the parent directory if it exists
- `cd /` will move the terminal to the root directory
- `cd ~` or just `cd` will move the terminal to the home directory 
### `ls`
    - `ls` shows all the visible files and folders in directory. 
    - `ls -a` shows all the hidden and visible files and folders in the directory.
    - `ls -A` shows **almost** all the hidden and visible files and folders in the directory(It excludes the `.` which loops back to the current directory and the `..` which points to the parent directory)
    - `ls -l` displays all the visible files and folders and lists them in tabular form with some extra information(like size, author, date modified, etc)
### touch
    - makes an empty file

### mkdir
    - makes a folder
    - -p to make their parents if they dont exist
### mv
    - moves a file to a specified location
    - can also be used to rename a file
    - mv source destination
### cp 
    - copies files from source tp dest
    - very similiar syntax wise to mv
### pwd
   - prints the path where the curerent terminal is open
### rm 
   - removes the files mentioned 
   - -f to force 
   - -r to recursively delete
   
### grep
    - searches for patterns in a file or even a folder
    - grep <flags> 'search' files
    - -i ignores case
    - -r recursively searches the directory
### cat
   - lets you see the contests of a file and append to it 
   - cat file to see
   - cat >> file to append 
