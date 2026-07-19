#!/usr/bin/env python3
"""Exact-CAS distinctness saturation for the source-indexed survivor."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys
from typing import Any


HERE = Path(__file__).resolve().parent
BASE_PROBE = HERE / "p97_counterexample_distinct_saturation_654.py"
EXACT_PROBE = HERE / "source_indexed_survivor_counterexample_realizability_654.py"


def load_base_probe() -> Any:
    spec = importlib.util.spec_from_file_location(
        "p97_654_source_indexed_survivor_saturation_base", BASE_PROBE
    )
    if spec is None or spec.loader is None:
        raise AssertionError("base saturation probe import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    module.EXACT_PROBE = EXACT_PROBE
    return module


def main() -> None:
    load_base_probe().main()


if __name__ == "__main__":
    main()
