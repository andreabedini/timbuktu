
def normalise_legacy_unit(unit):
  if "components" in unit:
    components = unit["components"]
    depends = [ c["depends"] for n, c in components.items() if n != "setup" ]
    exe_depends = [ c["exe-depends"] for n, c in components.items() if n == "setup" ]
    setup_depends = components["setup"]["depends"] if "setup" in components else []
    return dict(depends = depends, exe_depends = exe_depends, setup_depends = setup_depends, **unit)
  else:
    return unit
