"""
The unit-ids of the units buck2 builds: the cabal_simple rules, and the
units of a plan, which leaves choosing them to whoever builds it.

A unit-id has to tell a unit from every other unit that can end up in the
same package db. cabal-install gets there by hashing what goes into the
build; here buck2 already tells builds apart, and the label of the
configured target (the target and the configuration it is built in) is what
identifies one. A target that builds several units (dynamic_plan) adds a
scope of its own for each.
"""

def make_unit_id(label: Label, name: str, version: str, component: str | None, scope: str | None = None) -> str:
    """Make up the unit-id of a component.

    Args:
      label: the configured target that builds it
      name: the name of the package
      version: its version
      component: the name of the component, None for the main library (or
        for a whole package)
      scope: what tells the unit apart from the others of the same target,
        if there are others
    Returns:
      <package>-<version>[-<component>]-<hash>
    """
    key = str(label) if scope == None else "{}/{}".format(label, scope)
    parts = [name, version] + ([component] if component else [])
    return "-".join(parts + [sha256(key)[:8]])
