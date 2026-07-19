#!/usr/bin/env python3
"""Numerical real-feasibility scout for the source-indexed survivor."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys
from typing import Any


HERE = Path(__file__).resolve().parent
BASE_SCOUT = HERE / "p97_counterexample_numerical_654.py"
EXACT_PROBE = HERE / "source_indexed_survivor_counterexample_realizability_654.py"


def load_base_scout() -> Any:
    spec = importlib.util.spec_from_file_location(
        "p97_654_source_indexed_survivor_numerical_base", BASE_SCOUT
    )
    if spec is None or spec.loader is None:
        raise AssertionError("base numerical scout import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    module.EXACT_PROBE = EXACT_PROBE
    return module


def main() -> None:
    load_base_scout().main()


if __name__ == "__main__":
    main()
