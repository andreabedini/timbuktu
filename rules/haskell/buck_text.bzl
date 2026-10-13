"""
Writing BUCK files: the text of a call to a rule, formatted the way
buildifier would format it. Used by the generators (cabal/generate.bzl,
cabal_install/plan_targets.bzl).
"""

def expr(text: str) -> struct:
    """An expression, to be written as it is rather than as a value."""
    return struct(expr = text)

def value(v: typing.Any, indent: str = "") -> str:
    """A value as Starlark text, at the given indentation."""
    inner = indent + "    "
    if type(v) == "list":
        if len(v) == 0:
            return "[]"
        if len(v) == 1:
            return "[{}]".format(value(v[0], indent))
        return "[\n" + "".join(["{}{},\n".format(inner, value(x, inner)) for x in v]) + indent + "]"
    if type(v) == "dict":
        if len(v) == 0:
            return "{}"
        return "{\n" + "".join(["{}{}: {},\n".format(inner, repr(k), value(x, inner)) for k, x in v.items()]) + indent + "}"
    if type(v) == "struct":
        return v.expr
    return repr(v)

def call(rule: str, attrs: list[(str, typing.Any)]) -> str:
    """A call to a rule, with the attributes in order; None ones are left out."""
    return "{}(\n".format(rule) + "".join([
        "    {} = {},\n".format(name, value(v, "    "))
        for name, v in attrs
        if v != None
    ]) + ")\n"

def load_order(modules: list[str]) -> list[str]:
    """Modules in the order buildifier puts their loads in: by package, then
    by file."""
    return sorted(modules, key = lambda m: m.split(":"))
