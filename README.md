# execute-on-startup
Purpose: To execute an arbituary number of files on startup of a Debian based system

## Usage
1. Place all the files you want to run in the 'run' folder with 'run_all.sh' in its parent directory.

2. Setup the file 'run_all.sh' to run on startup. There are many ways to do this.
   * The most up to date method is through systemd (detailed below).
   * Placing the script in rc.local may work but is [not reccomended](https://unix.stackexchange.com/questions/332938/rc-local-not-working-debian-8/333003#333003).
   * Hijacking the end of another script known to execute on startup is also plausible but is messy and not as easily extendable.

3. Additional notes
   * Make sure that all files are in fact executable. This can be done in the terminal with `chmod +x filename` for each file involved.
   * Each execuatable should include a [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) as its first line to insure the correct interpreter is loaded.
   
## Systemd
