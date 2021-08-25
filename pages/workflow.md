# Workflow

## Pattern
After each computation that takes more than roughly a second, write to disk.
For example,
- Run simulation, write raw data to disk.
- Gather statistics, write averages, covariances to disk.
- Plot trends, write plots to disk.

A workflow is the directed graph codifying this process.

# Workflow tools
The point of these tools is to codify the workflow for a given project or calculation, automate it, and make it self-documenting and reproducible.

## Snakemake

[Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) start as a simple workflow tool and scale up to a sophisticated one. See the Docs for more examples. You can think of Snakemake as documentation of scripts that is functional.

_If you do things with bash/python scripts_ you can still use those! You just call those scripts from the `run:` section of the Snakemake file.

[Here's a real-life example.](../snippets/snakemake_example.smk). In that example, using
```
snakemake results/nv_ROKS_{lda,pbe,pbe0}_c-1_bccpv{d,t}z_s{63,127}_xewald_spin{0,2}/mcscf_casscf_si{0,1}_stspec/mcscfcalc.chk -j100
```
would run an SCF caluclation with a set of options and then run several MCSCF calculations on each one. 

Usinging the `-n` option is useful for checking before you launch 1000 jobs.

There's also support for cloud computing, and its customizable. You can specify the range of valid options, or name a set of options in the `Snakefile`.

[You can also visualize your workflow](https://snakemake.readthedocs.io/en/stable/tutorial/basics.html#step-4-indexing-read-alignments-and-visualizing-the-dag-of-jobs), which is useful for informal presentations (or perhaps formal one, with some modification?).

Possible extensions:
- Snakemake directly interacts with a queuing system like Slurm
- Cloud computing.
- Modularization.

## Others? 

No one else used other workflows at our meeting.

Others that I know of:
- [Fireworks](https://materialsproject.github.io/fireworks/), I tried it, but found it a bit too complicated for my taste. 
- [Nexus](https://qmcpack.org/nexus) specialized for QMCPACK workflows.
