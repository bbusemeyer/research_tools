# Bash/command line

You should know about .bashrc, .bash_profile. The .bash_profile is loaded only on non-interactive sessions. You can customize everything, people have examples online.

`!py` will run last command starting with ‘py’.

`<ctrl -r>` reverse search of previous commands.

How to change history size (TODO)

Exporting bash functions is better than alias, as it is accessible outside of the bash command line. 

`.ssh/config` lets you avoid entering in addresses, i.e. `ssh rusty` will work. See `Host` keyword.
```
 Host flatiron
   Hostname gateway.flatironinstitute.org
   Port 61022
   User your_username
   ForwardX11 yes 
   ForwardX11Trusted yes 
   DynamicForward 127.0.0.1:61080   # (I think) this allows other SSH sessions to use this one, so you don't have to log in again.
   ControlPath ~/.ssh/.%r@%h:%p
   ControlMaster auto
   ServerAliveInterval 100          # stop the connection from closing automatically.
```

Proxy-jump to iterate login commands (a la Bryan)
```
Host flatiron
  Hostname gateway.flatironinstitute.org
  Port 61022
Host rusty rustyvflatiron
  Hostname rusty.flatironinstitute.org
Host rustyvflatiron
  ProxyJump flatiron
```


ssh-keygen will allow you to generate keys, for passwordless login (if the admin allows it).

‘rsync’ is faster than scp in most cases, and has a bit more control (exclude file patterns, …). Sometimes I use it instead of cp for local!
`-a` option is super useful.

[Custom command line scripts](bin_scripts.md)

PATH, PYTHONPATH, LD_MODULE_PATH are useful environment variables. `module` (see [module notes](module.md)) is probably the best tool to edit these. Be very careful messing with these, it can cause compilation problems, if the wrong libraries are being used. Robert in SCC is setting up `spack`, a newer way of handling it. See Slack.

Piping (`|`):
ls -1 scripts_sweep/*.slurm.sh | xargs -L 1 sbatch

Using ticks (OR `$(...)` ) to save the results.
```
all_py_files=`ls */*py`          # OR  all_py_files=$(ls */*py)
echo $all_py_files
```

Bash alias/functions. E.g. show git branch on prompt (PS1)
```
parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) / '
}
PS1='[\u@\h \W]$(parse_git_branch)\$ '
```

Iteration over values in bash.
```
ls {this, that, the_other}.out   # will try to ls three files in that order. 
ls runs{0..9}.out                # will try to ls 10 files from 0 to 9 (I think inclusive)
```

# ZSH

Bash superset. ‘Oh my ZSH’ on github, package manager. Grep automatically at the shell.

# TCSHRC
