# Module

You can define your own modules in addition to the ones the admin puts in by default.
```
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
```

To use custom modules, add the path to the module files to your `MODULEPATH` e.g.
`export MODULEPATH=~pyang/soft/modulefiles:$MODULEPATH`

## Modules collections
Save the state of your modules for a given project and restore it easily without making a new module file.
Try setting up some modules and doing:
```
module save test
module purge 
module restore test
module list
```
You'll see its returned you to the state you were before.
```
module saverm test
``` 
will get rid of the saved state (which is in `${HOME}/.module` by the way).
