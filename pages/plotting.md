# Plotting data.

## Matplotlib. 

`fig, ax = subplots(2,1)` is a useful starting point. Then work with `ax.plot(...)` and so on.

## Building on Matplotlib.

I have a tool built on Matplotlib and Pandas that I can use for basically everything [here](https://github.com/bbusemeyer/busempyer/blob/master/busempyer/plot_tools.py).

Paul has [some scripts](https://github.com/Paul-St-Young/harvest_qmcpack/blob/master/qharv/field/kyrt.py).

## Quick ASCII Plots for "Previews" of Results:

I have a [simple script](https://github.com/bkesk/AFQMC_ascii_plots) which uses GNUplot to make ascii plots. Currently, it is set up just for afqmclab results. Feel free to copy/reuse any code from it.
