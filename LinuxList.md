# Linux Command Cheat Sheet
## The *very very useful ones*
### `man`
    * `man <command name>`
    * The main command returns a helpful help page that gives you a brief description of what exactly a command does and how to use it.
    * In case that man doesn't work, make sure that you have `mandocs` or `man` installed.
    * The manual entries can also be accessed via a browser.

### `--help` or `-h` flag
  * Sometimes a command is too niche to warrant a page in the manual. In such cases you can use the help flags. There is no set standard but they're usually one of the two
  * `<command> --help` or `<command> -h`
  * If one doesn't work, try the other.
  
### `sudo` and `su` 
  * `su` opens the current shell as root while `sudo` runs a specified command as root.
  * In Linux root priviliges are very similiar to Adminstrator priviliges in Windows
  * **Be very careful when running anything as root. It can break your system.**
  * It also requires the current user to know the root password as well be a part of the sudoers list

## Commands
### cd
    * used to move back and forth in the filesystem
    * cd <path>
    * cd .. to go up
    * cd / to go to root
    * cd ~ or cd to go home
### ls
    * lists
    * -a shows all 
    * -A shows almost all minus the dots
    * -l lists the results with additional info
### touch
    * makes an empty file

### mkdir
    * makes a folder
    * -p to make their parents if they dont exist
### mv
    * moves a file to a specified location
    * can also be used to rename a file
    * mv source destination
### cp 
    * copies files from source tp dest
    * very similiar syntax wise to mv
### pwd
   * prints the path where the curerent terminal is open
### rm 
   * removes the files mentioned 
   * -f to force 
   * -r to recursively delete
   
### grep
    * searches for patterns in a file or even a folder
    * grep <flags> 'search' files
    * -i ignores case
    * -r recursively searches the directory
### cat
   * lets you see the contests of a file and append to it 
   * cat file to see
   * cat >> file to append 
