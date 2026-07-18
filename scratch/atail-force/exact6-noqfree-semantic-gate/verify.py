#!/usr/bin/env python3
"""Fail-closed replay of the committed named no-qfree gate."""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
RESULTS = HERE / "results.json"


def load_gate():
    path = HERE / "noqfree_gate.py"
    spec = importlib.util.spec_from_file_location("exact6_noqfree_gate", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> None:
    gate = load_gate()
    replayed = gate.replay()
    committed = json.loads(RESULTS.read_text())
    if replayed != committed:
        raise AssertionError("committed results.json differs from exact replay")
    if committed["status"] != "EXACT_NAMED_NO_QFREE_GATE_COMPLETE":
        raise AssertionError("nonterminal gate status")
    if committed["orbit_count"] != 7:
        raise AssertionError("role-orbit count drift")
    if committed["eliminated_orbit_count"] != 0:
        raise AssertionError("unexpected eliminated orbit")
    if committed["surviving_orbit_count"] != 7:
        raise AssertionError("survivor count drift")
    for result in committed["results"]:
        if result["verdict"] != "EXACT_NAMED_NO_QFREE_PROJECTION_WITNESS":
            raise AssertionError((result["orbit"], result["verdict"]))
        if len(result["named_blocker_ledgers"]) != 3:
            raise AssertionError((result["orbit"], "named blocker row count"))
        for ledger in result["named_blocker_ledgers"]:
            if ledger["maximum_positive_radius_class_cardinality"] != 3:
                raise AssertionError((result["orbit"], ledger["row"], "radius maximum"))
            if not all(ledger["checks"].values()):
                raise AssertionError((result["orbit"], ledger["row"], "semantic check"))
        diagnostic = result["omitted_global_K4_diagnostic"]
        if diagnostic["global_K4_holds"]:
            raise AssertionError((result["orbit"], "projection unexpectedly has global K4"))
    print("EXACT6_NAMED_NO_QFREE_GATE_REPLAY_PASS")
    print("orbits = 7; eliminated = 0; survived = 7")
    print("named blockers per orbit = 3; maximum deleted radius class = 3")
    print("global K4 remains omitted and false in the diagnostic witnesses")


if __name__ == "__main__":
    main()
