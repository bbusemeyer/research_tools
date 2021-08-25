# Concept:
It’s not my intent to provide details on every tool here, rather to jog your memory as to what the tool’s name was so you can do a quick online search to find more.
Tips on editing this document:
You can use ctrl-alt <number> to make a header at level <number>, and then the left side of the doc will automatically generate a clickable outline!
Programming environment
Bash/command line
You should know about .bashrc, .bash_profile. The .bash_profile is loaded only on non-interactive sessions. You can customize everything, people have examples online.

`!py` will run last command starting with ‘py’.

`<ctrl -r>` reverse search of previous commands.

How to change history size (TODO)

Exporting bash functions is better than alias, as it is accessible outside of the bash command line. 

.ssh/config lets you avoid entering in addresses, i.e. ‘ssh rusty’ will work. See ‘Host’ keyword.
What the lines do (TODO)

Proxy-jump to iterate login commands (a la Bryan)
Host flatiron
  Hostname gateway.flatironinstitute.org
  Port 61022
Host rusty rustyvflatiron
  Hostname rusty.flatironinstitute.org
Host rustyvflatiron
  ProxyJump flatiron



ssh-keygen will allow you to generate keys, for passwordless login (if the admin allows it).

‘rsync’ is faster than scp in most cases, and has a bit more control (exclude file patterns, …). Sometimes I use it instead of cp for local!
`-a` option is super useful.

Put scripts (bash, python) in ~/bin.
This is most useful when you have simple, self-contained scripts that you often use (like for analyzing results) and/or want to use the script regardless of the shell you are using (bash,csh,tcsh,vsh,etc.). Steps for doing this:
Write or find a script in ~/some/dir/’ ( replace with some directory) called ‘script.sh’ (choose your favorite scripting language, even python)
Add a shebang to the first line of your script to specify what kind of script it is:
for bash, use: ‘#!/usr/bin/env bash’
for csh, use: ‘#!/usr/bin/env csh’
for python, use: ‘#!/usr/bin/env python’
‘$ cd ~/bin’ (may have to use ‘mkdir ~/bin’ first in some cases)
make a soft link to the script: ‘$ ln -s ~/some/dir/script.sh script’ (yes, I meant to leave the ‘.sh’ off the end in second argument)
add execute permission for yourself: ‘$ chmod u+x script’
Go to any directory and run with ‘$ script’ (no need to source any config files or to preface with ‘bash’,’csh’, or ‘python’)


PATH, PYTHONPATH, LD_MODULE_PATH are useful environment variables. `module` is probably the best tool to edit these. Be very careful messing with these, it can cause compilation problems, if the wrong libraries are being used. Robert in SCC is setting up `spack`, a newer way of handling it. See Slack.

Piping (`|`):
ls -1 scripts_sweep/*.slurm.sh | xargs -L 1 sbatch

Using ticks (OR $(...) ) to save the results.
all_py_files=`ls */*py`          # OR  all_py_files=$(ls */*py)
echo $all_py_files

Bash alias/functions. E.g. show git branch on prompt (PS1)
parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) / '
}
PS1='[\u@\h \W]$(parse_git_branch)\$ '
ZSH
Bash superset. ‘Oh my ZSH’ on github, package manager. Grep automatically at the shell.
TCSHRC
Module

You can define your own modules in addition to the ones the admin puts in by default.

$ cat ~pyang/soft/modulefiles/afqmclab/rome-20210525
#%Module
set 	pkg     	afqmclab
set 	version 	2021-05-25
set 	root    	/mnt/home/pyang/soft/afqmclab
 
proc ModulesHelp { } {
	puts stderr "Sets the environment for $pkg-$version"
}
 
module-whatis   "Sets the environment for $pkg-$version"
 
conflict $pkg intel/mpi intel/compiler
 
module                  load  gcc/7.4.0 openmpi4/4.0.5 lib/gmp/6.1.2 cmake/3.19.1 
module                  load  intel/mkl/2020-4 lib/fftw3/3.3.8-openmpi4
module                  load  lib/hdf5/1.8.21 sprng/2.0 googletest/1.11.0
setenv         AFQMCLAB_BASE  $root
prepend-path      PYTHONPATH  $root/scripts
set 	                 dist  $root/rome_dist
setenv          AFQMCLAB_DIR  $dist
prepend-path            PATH  $dist/bin
prepend-path           CPATH  $dist/include
setenv     CMAKE_PREFIX_PATH  $dist/cmake
prepend-path LD_LIBRARY_PATH  $dist/lib

To use custom modules, add the path to the module files to your MODULEPATH e.g.
export MODULEPATH=~pyang/soft/modulefiles:$MODULEPATH

Modules collections: save the state of your modules. module save, restore. Can use when you only need the module loads. 
Editing code
Vim
The essentials
.vimrc for setting up default options and addons, etc. Look for examples online
Folding: hide code based on ident or manually.
Shell commands with ! and read.
q<letter> for macros, @<letter> to execute. Use for compilation, execution of scripts, etc.
m<letter> for bookmarks, use `<letter> to move there.
:split <filename> for simultaneous editing. :vsplit for another option. ctrl-J etc, for moving these around.
ctrl-v for block code selection. Combine with ‘I’ to insert a column of characters. 
; : searching in line
Ctrl-n for autocomplete suggestions based on other words in the file. 
`

Vundle and vim-addons
Syntastic for automatic syntax checking
Others are out there, autocompletion, argument suggestion, basically make vim into an IDE. I haven’t explored it yet!
Debugging tools.
Python
Python trace library
PDB
IDEs
GDB
Version control (e.g. Git)
Can be used for everything! Code, papers, projects, etc.
Continuous integration
Slurm commands
seff <jobid> will print information about efficiency and memory usage. 

scontrol allows editing of job characteristics.

sacct gives more information about jobs (lots of options). I use it to print all jobs that finished on a certain day.




Workflow tools.
Organization.
Input to Raw data.
Raw data to processed data.
Processed data to plots.
Write results to disk at each step. Maintain documentation for the code that takes each step.
Snakemake
Define a workflow through directed graphs. Executes a multi-step process with dependencies and is self-documenting.
Fireworks
Nexus
ASE (to some extent)
Organizing data and exploring data.
Python + Pandas
Pandas is good for:
Database manipulation (group operations like averaging, joining databases, etc.)
DIsk IO to many data formats.
Pretty printing of data sets.
Interface with Jupyter
Data file formats.
CSV
Good for columnar data. Most data should be stored as columnar.
JSON
Better if your data has nested structure. Looks a lot like a nested python dict. Use “indent=’  ‘“ to make it more human readable.
HDF5
Excellent overall, and especially for large arrays. Fast to store and read large amounts of data. Allows for metadata and nesting. Also efficient disk storage, as it makes it binary. Disadvantages include that it’s not human readable. 
YAML
A large class of data formats, but very human readable. Disadvantages include that it struggles with nonstandard data types, link numpy int (last I checked).

Plotting data.
Python + Matplotlib
Widget library
Seaborn
GNUplot simple, command-line interface.
Plotly (does anyone like it?)
Making illustrations.
Visualizing > 2-D data.
Seaborn library for data analysis.
Pairplot is useful for visual inspection of correlations
Making presentations.
Libreoffice + texmath
Texmath is easy to use, it creates either an EPS or PNG of the formula which can be edited later, and allows you to load headers and latex libraries. The downside is that is occasionally will crash Libreoffice, and the creator no longer maintains it.
Multithreading
When are things easy to multithread or not? How to make sure multithreading is efficient.
Matrix operations


