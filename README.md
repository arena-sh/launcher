## ArenaSH Launcher

You can use ArenaSH launcher without need of any admin rights. Tested to be working with Firefox and Chrome for Windows/MacOS/Linux.

If you want to build installers by yourself, please follow the build instructions below. Each build should be done in the particular platform.

[Download Page](https://arena.sh/launcher/)

### Installation:
#### Windows
Run the installer and follow the steps.

#### MacOS
When the installation dmg is mounted, just drag & drop Arena app to `Applications/` directory as shown.

#### Linux
Double click on .run file, and choose "Open with Terminal" to execute setup. Alternatively, you can call `$ sh <installer>.run` from the terminal.

### Usage
Visit any server page and click JOIN at "Launcher" tab.


### FAQ

#### How it works?
For each platform, `arena://` url protocol is registered with the app. When the player clicks the JOIN link, it passes server address and hash of the launch command at the join page. Then, launcher requests the command again, compares the hash, and runs it.

#### How are the games installed when not found in expected locations?
If the universal zip of the game is available for the user's platform, launcher asks for confirmation, showing the size of the download first. Zip is only requested from official links published by the game's development team. After downloading, files are automatically extracted to `~/games` for Linux, `/Applications/games` for OSX and `c:\games` for Windows. No further action is taken after the extraction. In case you want to backup the downloaded zip, you can refer to the `/tmp/` (may vary for Windows) directory.


#### What are the "installation notes" shown after extraction?
Installations notes are mostly for Linux users where dependencies should also be installed in order to run the game properly. It suggests few apt-get hints about how to make it work as expected. Second run will always attempt to run the game.

#### I already have the game. Can I keep my game directory somewhere else than the expected locations?
While there is no option to choose specific paths for games, you can still have a workaround and create a symlink on an expected location, that would make it work.

#### Is this launcher secure?
ArenaSH launcher is completely open-source and requires no admin rights. It actually consists of 300 lines of Python. Launch commands are hash checked when requested from server, so users always run what they see. All games listed in the platform are also open-source. For private servers, passwords are replaced by launcher utilizing the `TOKEN_HERE` placeholder, so it never reaches to the platform. 

#### I'm getting warnings by my anti-virus software on Windows
Those are false positives as the windows installer is built by NSIS. We will continue to submit the launcher to particular anti-virus company to validate with them further. Also remember that you can always build the launcher yourself without downloading (see build instructions below).


### Build Instructions
#### Windows
Requirements:
- python 2.7.16+
- cx_freeze
- nsis

After installing above, just run `build_win.bat`. Installation file will be created in `release/win` directory.

#### MacOS
Requirements:
- xcode command line tools
- actual xcode is not required

Run `./build_osx.sh`. Both `.app` and `.dmg` releases will be created at`release/linux` directory. You only need to move the `.app` file around (preferably to `Applications/`) to make Finder detect the custom url protocol.

#### Linux
Requirements:
- apt packages: python-pip python-tk zlib1g-dev
- cx_freeze (using pip install)

Run `./build_linux.sh`. Self extracting `run` file will be created at `release/linux` directory

### Contribution

Please report any bugs related to the launcher at [issues](https://github.com/arena-sh/launcher/issues) page.

While developing at OSX (preferred dev platform) you can use `--dev` parameter during build so dmg won't be created but the app will be bundled only. To force the system to detect updates, you should delete your existing launcher in `/Applications` directory, and select/rename the one in `release/` to make Finder aware of it.

### License
GPLv2

Build tools included:  
create-dmg - MIT  
dmg-license - MIT  
makeself - GPLv2  

Images:  
Crosshair & Right Arrow  
Icons made by [Freepik](https://www.freepik.com) from www.flaticon.com  

