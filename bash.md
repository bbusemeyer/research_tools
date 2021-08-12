# Bash/command line

You should know about .bashrc, .bash_profile. The .bash_profile is loaded only on non-interactive sessions. You can customize everything, people have examples online.

`!py` will run last command starting with ‘py’.

`<ctrl -r>` reverse search of previous commands.

How to change history size (TODO)

Exporting bash functions is better than alias, as it is accessible outside of the bash command line. 

`.ssh/config` lets you avoid entering in addresses, i.e. `ssh rusty` will work. See `Host` keyword.
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

[Custom command line scripts](path_commands.md)

PATH, PYTHONPATH, LD_MODULE_PATH are useful environment variables. `module` is probably the best tool to edit these. Be very careful messing with these, it can cause compilation problems, if the wrong libraries are being used. Robert in SCC is setting up `spack`, a newer way of handling it. See Slack.

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
# ZSH

Bash superset. ‘Oh my ZSH’ on github, package manager. Grep automatically at the shell.

# TCSHRC
