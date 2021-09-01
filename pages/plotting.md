# Plotting data.

Most everyone at the meeting either always wraps around `Matplotlib` or else, does that but uses GNUplot for quick, anonymous plots. 

## Matplotlib. 

`fig, ax = subplots(2,1)` is a useful starting point. Then work with `ax.plot(...)` and so on.

Great addons:
* [Seaborn](https://seaborn.pydata.org/) for visualizing statistical data, and actually just fixing up the defaults of Matplotlib. Check out `set_style`.
* [Widget library](https://matplotlib.org/stable/api/widgets_api.html#gui-neutral-widgets) for interactive plots. 
* [3D plotting library](https://matplotlib.org/2.0.2/mpl_toolkits/mplot3d/tutorial.html) works pretty ok.

## Building on Matplotlib.

I have a tool built on Matplotlib and Pandas that I can use for basically everything [here](https://github.com/bbusemeyer/busempyer/blob/master/busempyer/plot_tools.py).

Paul has [some scripts](https://github.com/Paul-St-Young/harvest_qmcpack/blob/master/qharv/field/kyrt.py).

## Quick ASCII Plots for "Previews" of Results:

I have a [simple script](https://github.com/bkesk/AFQMC_ascii_plots) which uses GNUplot to make ascii plots. Currently, it is set up just for afqmclab results. Feel free to copy/reuse any code from it.

## High-dimensional data.
