pystr = "results/{struct}_{mftype}_{xc}_c{latc}_b{basis}_s{size}_x{exxdiv}_spin{spin,.}/"
rule scfcalc_defect:
  output:
    chk  = pystr+"scfcalc.chk",
    gdf  = pystr+"scfcalc_gdf.h5",
  params:
    pyloc = pystr,
    json = pystr+"scfcalc.in.json",
  run:
    sourcestr = "structfiles/{struct}.{size}.cif" if "nv" in wildcards.struct\
        else    "structfiles/{struct}.{size}x{size}.cif"
    jsondump(dict(
        struct_source=relpath(sourcestr.format(struct=wildcards.struct,size=wildcards.size),params['pyloc']),
        structargs=dict(
          latc=float(wildcards.latc),
          basis=wildcards.basis,
          spin=int(wildcards.spin),
        ),
        mfargs=dict(
          mftype=wildcards.mftype,
          xc = wildcards.xc,
          exxdiv = wildcards.exxdiv,
          kpts = [1,1,1],
        ),
      ),params['json'])

    subscript("scfcalc.py",params['pyloc'],time='7-0',wait=True,**PYSUB)

mcstr = "{pyloc}/mcscf_{castype}_si{state}_st{statekey}/"
rule mcscfcalc_energy:
  input:
    chk = "{pyloc}/scfcalc.chk",
    gdf = "{pyloc}/scfcalc_gdf.h5",
  output:
    chk  = mcstr+"mcscfcalc.chk",
    hdf  = mcstr+"casinfo.h5",
  params:
    loc = mcstr,
    json = mcstr+"mcscfcalc.in.json",
  run:
    jsondump(dict(
          chkfile = relpath(f"{wildcards.pyloc}/scfcalc.chk", params['loc']),
          gdf     = relpath(f"{wildcards.pyloc}/scfcalc_gdf.h5", params['loc']),
          castype = wildcards.castype,
          state_specific = False if wildcards.statekey=='avg' else True,
          state = int(wildcards.state),
      ),params['json'])

    time = {'casci': '0-1', 'casscf': '7-0', 'sciscf': '7-0'}[wildcards.castype]

    subscript("mcscfcalc.py",params['loc'],time=time,wait=True,**PYSUB)
