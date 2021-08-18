# Workflow

## Pattern
After each computation that takes more than roughly a second, write to disk.
For example,
- Run simulation, write raw data to disk.
- Gather statistics, write averages, covariances to disk.
- Plot trends, write plots to disk.

A workflow is the directed graph codifying this process.
