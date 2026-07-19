#!/usr/bin/env python3
"""Exact Problem 97 realizability query for the source-indexed survivor.

The row system is the independently replayed SAT assignment with one K4 row
at every center.  Four of those global rows are also the exact source shells
for sources 0, 7, 8, and 9.  This wrapper binds that row system to the audited
two-engine QF_NRA query in ``p97_counterexample_realizability_654.py``.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys
from typing import Any


HERE = Path(__file__).resolve().parent
BASE_PROBE = HERE / "p97_counterexample_realizability_654.py"
ROWS = (
    (0, (4, 5, 8, 10)),
    (1, (0, 2, 7, 8, 9)),
    (2, (0, 1, 10, 11)),
    (3, (1, 4, 6, 7)),
    (4, (2, 3, 5, 10)),
    (5, (4, 6, 8, 11)),
    (6, (1, 3, 5, 8)),
    (7, (2, 6, 8, 10)),
    (8, (3, 7, 9, 11)),
    (9, (0, 2, 3, 4)),
    (10, (5, 6, 9, 11)),
    (11, (1, 4, 9, 10)),
)
EXPECTED_EQUALITY_SHA256 = (
    "8bd0b3bc69181488231d58874ccac6945c044619135dcf3e39bb28ead0b86407"
)


def load_base_probe() -> Any:
    spec = importlib.util.spec_from_file_location(
        "p97_654_source_indexed_survivor_base", BASE_PROBE
    )
    if spec is None or spec.loader is None:
        raise AssertionError("base exact probe import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    module.ROWS = ROWS
    module.EXPECTED_EQUALITY_SHA256 = EXPECTED_EQUALITY_SHA256
    return module


_BASE = load_base_probe()

# Re-export the surface used by the numerical and exact-CAS companion probes.
N = _BASE.N
PROFILE = _BASE.PROFILE
CYCLIC_ORDER = _BASE.CYCLIC_ORDER
load_metric_oracle = _BASE.load_metric_oracle
equality_digest = _BASE.equality_digest


def main() -> None:
    _BASE.main()


if __name__ == "__main__":
    main()
