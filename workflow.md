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

[Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) start as a simple workflow tool and scale up and a sophisticated one. See the Docs for more examples. [Here's a real-life example.](snakemake_example.smk)
