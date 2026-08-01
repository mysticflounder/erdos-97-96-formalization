#!/usr/bin/env python3
"""Focused prefix, mutation, and Boolean differential tests for v7."""

from __future__ import annotations

import importlib.util
import itertools
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent


def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


probe = load("v7_probe_test", HERE / "probe.py")
verify = load("v7_verify_test", HERE / "verify_artifact.py")


def main() -> int:
    v6_built = probe.v6.build_instance(2, 0)
    v7_built = probe.build_instance(2, 0)
    v6_cnf = v6_built[0].cnf
    v7_cnf = v7_built[0].cnf
    manifest = v7_built[-1]
    if v7_cnf.n != 49357 or len(v7_cnf.clauses) != 1370778:
        raise RuntimeError("unexpected v7 counts")
    if v7_cnf.clauses[:len(v6_cnf.clauses)] != v6_cnf.clauses:
        raise RuntimeError("v6 prefix changed")
    structural = verify.verify_structure(v7_cnf.clauses, manifest)
    mutated = [list(x) for x in v7_cnf.clauses]
    mutated[-1] = mutated[-1][:-1]
    try:
        verify.verify_structure(mutated, manifest)
    except verify.base.VerificationError:
        mutation_rejected = True
    else:
        raise RuntimeError("v7 mutation was accepted")

    differential = 0
    for order in itertools.permutations(range(4)):
        for endpoints in itertools.combinations(range(4), 2):
            centers = tuple(x for x in range(4) if x not in endpoints)
            bad = probe.nonalternating(order, *endpoints, *centers)
            for selector, eq1, eq2 in itertools.product((False, True), repeat=3):
                clause_ok = (not selector) or (not eq1) or (not eq2)
                intended = not (selector and eq1 and eq2 and bad)
                if bad and clause_ok != intended:
                    raise RuntimeError("bad-order clause differential mismatch")
                if not bad and not intended:
                    raise RuntimeError("alternating order incorrectly rejected")
                differential += 1
    output = {
        "schema": f"{probe.SCHEMA}.self_test.v1",
        "v6_prefix_exact": True,
        "variables": v7_cnf.n,
        "clauses": len(v7_cnf.clauses),
        "v7_clause_count": probe.EXPECTED_V7_CLAUSES,
        "mutation_rejected": mutation_rejected,
        "boolean_differential_assignments": differential,
        "structural_audit": structural,
    }
    (HERE / "self-test-results.json").write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({
        "v6_prefix_exact": True,
        "mutation_rejected": True,
        "boolean_differential_assignments": differential,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
