#!/usr/bin/env python3
"""Exact premise and arithmetic check for the finite K4-extension bound."""

from importlib.util import module_from_spec, spec_from_file_location
from math import comb
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = spec_from_file_location("full_local_model", HERE / "check_model.py")
assert SPEC is not None and SPEC.loader is not None
MODEL = module_from_spec(SPEC)
SPEC.loader.exec_module(MODEL)


def main() -> None:
    generic = {
        center
        for center in MODEL.HULL
        if MODEL.pinned_multiplicity(center) == 1
    }
    assert generic == {"e", "f", "a", "u", "b", "v", "j", "k", "l", "i", "g", "h"}
    assert len(generic) == 12
    assert comb(5, 3) == 10 < len(generic)
    assert len(generic) <= comb(6, 3) == 20

    print("PASS: exact finite K4-extension premise and arithmetic")
    print("distance-generic old centers:", " ".join(name for name in MODEL.HULL if name in generic))
    print("generic centers = 12")
    print("C(5,3) = 10 < 12 <= 20 = C(6,3)")
    print("therefore every K4 supercarrier adds at least 6 points")


if __name__ == "__main__":
    main()
