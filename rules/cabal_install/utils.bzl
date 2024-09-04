
def normalise_legacy_unit(unit):
  if "components" in unit:
    components = unit["components"]

    depends = []
    exe_depends = []
    for n, c in components.items():
      if n != "setup":
        depends += c["depends"]
        exe_depends += c["exe-depends"]

    setup_depends = components["setup"]["depends"] if "setup" in components else []

    unit.update({
      "depends": depends,
      "exe-depends": exe_depends,
      "setup-depends": setup_depends,
      "component-name": "lib:{}".format(unit["pkg-name"]),
    })

  return unit
