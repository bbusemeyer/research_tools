# Data storage

## YAML
Does anyone know a parser for C++ that works well? (header only)

Pros:
- Very readable (for pythonic eyes), easily editable.
- Clean look
- Supports objects and refereces.

Cons:
- Not very compact on disk.
- Not as widely implemented as others (although still pretty wide)
- Some security concerns (can YAML-bomb)

Good for:
- Input files
- record keeping e.g. storing meta data or small data sets

## JSON

Using the `indent='  '` (or similar) argument to Python's `json` library make it look much nicer!

Pros:
- Human readable, easily editable.
- Widely implemented.
- Nested.

Cons:
- Not very compact on disk
- Doesn't support arbitrary objects.

Good for:
- Input files
- record keeping e.g. storing meta data or small data sets

## CSV

Pros:
- Enforces columnar format, which is best for data analysis.
- Widely implemented.
- Kinda human readable (not really)

Cons:
- Restrictive format: nested data is awkward, matrices are awkward.
- More compact than some formats, not as compact as others.

Good for:
- Processed data.

## HDF5

We're also looking for lightweight C++ interface (header only) libraries for hdf5.

`h5dump -n` gives all data sets. Also similar is `h5ls`.

`h5dump -d <data name>` will give the data labeled by 'data name'. 

Compression tools available, even from command line.

`h5edit` for command-line edits.

Supports slicing on disk and in RAM. 
Also parallelizable. There's an `hdf5p` library. 

Pros:
- Compact on disk
- Fast IO
- Nested
- Supports meta-data internally.
- Implemented in a lot of places.

Cons:
- Not human readable, except using `h5dump` or `h5ls` or the like.
- Must be modified with a program (not by hand with vim).

Good for:
- Storing large arrays.
- Storing raw data, or hard-to-interpret data.
- Can store meta data along side large arrays (e.g. tags for describing the data).

## XML

Verbose, but generic.
