#!/usr/bin/env python3
"""Numerical real-feasibility scout for a hash-bound saved (6,5,4) shadow.

This wraps ``p97_counterexample_numerical_654.py`` without weakening its
trust boundary.  A numerical witness still requires exact replay, and failure
to find one is not an infeasibility result.
"""

from __future__ import annotations

import argparse
import contextlib
import importlib.util
import io
from pathlib import Path
import sys
from typing import Any


HERE = Path(__file__).resolve().parent
BASE_EXACT = HERE / "p97_counterexample_realizability_654.py"
BASE_SCOUT = HERE / "p97_counterexample_numerical_654.py"
SAVED_PROBE = HERE / "probe_saved_source_indexed_patterns.py"

EXPECTED_EQUALITY_SHA256 = {
    "offset5-first-full":
        "e7d6b00bc6bfcc0f3ce4a4719a5b7cf40c620915d40f8dbe2b452dcaa203a98e",
    "offset6-first-full":
        "87148e18e3979d266f8a61fbe26797ab38c7d122b6abc933f2ec70319b67729b",
    "offset5-postunit36-full":
        "63586daa98ea7e6f72ea724410d35dc74f88e934d7b3ca03c798016238c769d4",
    "offset11-postunit46-full":
        "098e2fa47325de3d5230d97e94e4c9bcd430794e383286af7aaffaf23d73ae58",
    "offset14-postunit18-full":
        "e53f8a834cd6c687d47c8fd782a4cac5edebfc1b1cf6fd69c086168e639e56c7",
}


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise AssertionError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def main() -> None:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--pattern", choices=sorted(EXPECTED_EQUALITY_SHA256), required=True)
    parser.add_argument("--output", type=Path)
    args, remaining = parser.parse_known_args()

    saved = load_module("p97_saved_pattern_registry", SAVED_PROBE)
    exact = load_module("p97_saved_pattern_exact_surface", BASE_EXACT)
    exact.ROWS = tuple(sorted(saved.PATTERNS[args.pattern].items()))
    oracle = exact.load_metric_oracle()
    metric_rows = tuple(
        oracle.MetricRow(center, support, exact=False)
        for center, support in exact.ROWS
    )
    canonical_digest = oracle.canonical_sha256(
        list(oracle.serialized_system(exact.N, metric_rows))
    )
    if canonical_digest != EXPECTED_EQUALITY_SHA256[args.pattern]:
        raise AssertionError("saved equality-system hash drift")
    # The exact wrapper intentionally serializes the distinguished row first;
    # bind that second ordering after the canonical saved-pattern check.
    exact.EXPECTED_EQUALITY_SHA256 = exact.equality_digest(oracle)

    scout = load_module("p97_saved_pattern_numerical_base", BASE_SCOUT)
    scout.load_exact_probe = lambda: exact
    old_argv = sys.argv
    stream = io.StringIO()
    try:
        sys.argv = [old_argv[0], *remaining]
        with contextlib.redirect_stdout(stream):
            scout.main()
    finally:
        sys.argv = old_argv
    payload = stream.getvalue()
    if args.output is not None:
        args.output.write_text(payload, encoding="utf-8")
    print(payload, end="")


if __name__ == "__main__":
    main()
