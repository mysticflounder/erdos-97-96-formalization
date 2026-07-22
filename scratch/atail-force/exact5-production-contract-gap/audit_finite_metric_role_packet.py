#!/usr/bin/env python3
"""Audit the first-apex role packet against the finite-metric regression.

This is a finite-set audit, not a Euclidean realization checker. It records
which incidence-level fields of ``FirstApexShellRolePacket`` the stored metric
regression can satisfy and isolates the first field that it cannot satisfy.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
REGRESSION = (
    ROOT
    / "scratch"
    / "atail-force"
    / "exact5-all-one-finite-metric-regression"
    / "verify.py"
)


def load_regression():
    spec = importlib.util.spec_from_file_location("exact5_metric_regression", REGRESSION)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> None:
    r = load_regression()

    # In the stored (5,6,5) abstract cap profile, C1 is the cap opposite O1.
    # Its endpoints are O2 and the third support vertex 10.
    strict_first_opposite_cap = r.C1 - {r.O2, 10}
    first_class = r.ROWS[r.O1]
    double_carrier = r.A - {r.q, r.w}
    double_class = first_class & double_carrier

    # A retained four-subrow preserving q,w and two strict hits exists.
    retained_row = frozenset({r.q, r.w, 6, 7})
    assert retained_row <= first_class
    assert {r.q, r.w} <= retained_row
    assert len(retained_row - {r.q, r.w}) == 2
    assert len(retained_row & strict_first_opposite_cap) >= 2

    # The regression has a unique K4 class at O1. After deleting q,w it has
    # exactly four points, so every selected double-deletion row is this set.
    large_classes = [
        xs for xs in r.classes_at(r.O1).values() if len(xs) >= 4
    ]
    assert large_classes == [first_class]
    assert len(double_class) == 4
    assert r.has_k4(double_carrier, r.O1)

    double_interior = double_class & strict_first_opposite_cap
    assert double_interior == {6}
    assert len(double_interior) == 1

    print("PASS finite-metric role-packet audit")
    print(f"strict first-opposite interior = {sorted(strict_first_opposite_cap)}")
    print(f"ambient first-apex class       = {sorted(first_class)}")
    print(f"one valid retained four-row    = {sorted(retained_row)}")
    print(f"forced double-deletion row     = {sorted(double_class)}")
    print(f"double-row strict hits         = {sorted(double_interior)}")
    print("RESULT: doubleInterior1/2 is not realizable in this regression")


if __name__ == "__main__":
    main()
