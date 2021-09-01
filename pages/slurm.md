# Slurm tricks

`seff` will give you information about job performance.

A script to print the status of all jobs that were run on a certain date.
```
sacct --starttime $date --format 'WorkDir%200,JobName,JobId,State,End' | grep -v "batch\|extern\|orted"
```

`scontrol` another useful command.
