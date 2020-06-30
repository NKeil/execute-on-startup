# execute-on-startup
Purpose: To execute an arbituary number of files on startup of a Debian based system

## This projct is currently a work in progress

## Usage
1. Place all the files you want to run in the 'run' folder with 'run_all.sh' in its parent directory. 

2. Edit 'run_all.sh' to include the **full** path to the run folder.

3. Setup the file 'run_all.sh' to run on startup. There are many ways to do this.
   * The most up to date method is through systemd (detailed below).
   * Placing the script in rc.local may work but is [not reccomended](https://unix.stackexchange.com/questions/332938/rc-local-not-working-debian-8/333003#333003).
   * Hijacking the end of another script known to execute on startup is also plausible but is messy and not as easily extendable.

4. Additional notes
   * Make sure that all files are in fact executable. This can be done in the terminal with `chmod +x filename` for each file involved.
   * Each execuatable should include a [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) as its first line to insure the correct interpreter is loaded.
   
## Systemd
1. Install systemd if you haven't done so already.

1. Modify the file 'startup.service' to include the **full** path to the file 'run_all.sh'. 

2. Add the correct permissions to the file with `sudo chmod 644 /etc/systemd/system/startup.service`. 

3. Copy the file to the folder '/etc/systemd/system'.

4. Test the service with the following commands. Ensure the service did not fail. If you have trouble locating the problem, follow [this](https://community.chakralinux.org/t/how-to-investigate-systemd-errors/7024) guide to investigate it.
   * `sudo systemctl start startup`
   * `sudo systemctl status startup`

5. Enable the service.
   * `sudo systemctl enable startup`
   

#### Modifying the startup execution
* If it is necessary for your files to be executed after a network connection is established, add the line `After=network.target` following the description. This can also be replaced by any other '.service' file that must be run before execution.
* More information on '.service' files can be found [here](https://www.freedesktop.org/software/systemd/man/systemd.service.html#).

## Further Reference
* [Primary Reference](https://www.linode.com/docs/quick-answers/linux/start-service-at-boot/)
* [Linux Mint 19](https://forums.linuxmint.com/viewtopic.php?t=275464)
