# Debuggers

Also check out "test-driven development." Good debugging often starts with good testing!

# Python

[Python `trace` library](https://docs.python.org/3/library/trace.html). 
You'll probably need to use `--ignore-module` or `--ignore-dir` options to avoid traversing `numpy` or the like.

`pydb` or `pdb` allows `gdb`-like stepping through scripts. I personally find print statements more useful.

# C++

`gdb` and `gdb --tui` are standard, basic options. I haven't used these in a long time.

VSCode (?)

Total view for parallel debugging. Proprietary. 
