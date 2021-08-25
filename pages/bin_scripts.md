Put scripts (bash, python) in `~/bin`.

This is most useful when you have simple, self-contained scripts that you often use (like for analyzing results) and/or want to use the script regardless of the shell you are using (bash,csh,tcsh,vsh,etc.). Steps for doing this:

- Write or find a script in `~/some/dir/` ( replace with some directory) called ‘script.sh’ (choose your favorite scripting language, even python)
- Add a shebang to the first line of your script to specify what kind of script it is:
- for bash, use: `#!/usr/bin/env bash`
- for csh, use: `#!/usr/bin/env csh`
- for python, use: `#!/usr/bin/env python`
- ‘$ cd ~/bin’ (may have to use `mkdir ~/bin` first in some cases)
make a soft link to the script: `$ ln -s ~/some/dir/script.sh script` (yes, I meant to leave the `.sh` off the end in second argument)
add execute permission for yourself: `$ chmod u+x script`
- Go to any directory and run with `$ script` (no need to source any config files or to preface with `bash`,`csh`, or `python`)
