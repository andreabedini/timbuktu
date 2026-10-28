"""
Tests that compare what a target makes with what is expected.
"""

def expected_test(name: str, actual: str, expected: str):
    """A test that the output of `actual` is the file `expected`.

    Args:
      name: the name of the test
      actual: a target with one output
      expected: a file of the package
    """
    native.export_file(name = name + "-expected", src = expected)
    native.sh_test(
        name = name,
        args = [
            "$(location :{}-expected)".format(name),
            "$(location {})".format(actual),
        ],
        test = "timbuktu//rules/haskell/tests:compare.sh",
    )
