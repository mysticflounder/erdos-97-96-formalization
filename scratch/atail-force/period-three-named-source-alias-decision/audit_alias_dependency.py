#!/usr/bin/env python3
"""Exact dependency audit for continuation-to-cycle aliases.

This does not solve a new metric formula.  It verifies that the existing
25-role QF_LRA encoder has no continuation variable and enumerates the exact
72 semantic alias instances over the 12 structural descriptors.  Hence each
alias instance is definitionally the same arithmetic formula as its base
cell.
"""

from __future__ import annotations

from hashlib import sha256
from itertools import permutations
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ATAIL = HERE.parent
PROBE = ATAIL / "period-three-full-role-identity-quotient" / "probe_fully_disjoint.py"
SEED = ATAIL / "period-three-seed-compatible-cell" / "SEED.json"
OUTPUT = HERE / "ALIAS_DEPENDENCY_AUDIT.json"

CYCLE = ("c0", "c1", "c2")


def main() -> None:
    probe_text = PROBE.read_text(encoding="utf-8")
    seed = json.loads(SEED.read_text(encoding="utf-8"))

    assert 'CYCLE = ("c0", "c1", "c2")' in probe_text
    assert "continuation.first" not in probe_text
    assert "continuation.second" not in probe_text
    assert seed["qf_lra_replay"]["status"] == "sat"
    assert seed["profiles"]["radius_arm"] == "unequal"
    assert seed["profiles"]["frontier_roles"] == "II"

    aliases = tuple(permutations(CYCLE, 2))
    structural = tuple(
        (radius_arm, frontier_role, orientation)
        for radius_arm in ("equal", "unequal")
        for frontier_role in ("II", "IO", "OI")
        for orientation in ("forward", "reflected")
    )
    cells = []
    hashes: dict[str, set[str]] = {}
    for radius_arm, frontier_role, orientation in structural:
        descriptor = {
            "encoder_family": "source-faithful-fully-disjoint-25-role",
            "radius_arm": radius_arm,
            "frontier_role": frontier_role,
            "orientation": orientation,
        }
        formula_hash = sha256(
            json.dumps(descriptor, sort_keys=True).encode("utf-8")
        ).hexdigest()
        base_status = "not_decided_by_existing_exact_ledger"
        if radius_arm == "unequal" and frontier_role == "II":
            base_status = (
                "verified_rational_qf_lra_sat_existing_ledger"
                if orientation == "forward"
                else "verified_rational_qf_lra_sat_by_exact_reflection_transport"
            )
        for first, second in aliases:
            alias_id = f"{first}->{second}"
            cells.append({
                "radius_arm": radius_arm,
                "frontier_role": frontier_role,
                "orientation": orientation,
                "continuation_first": first,
                "continuation_second": second,
                "formula_descriptor_sha256": formula_hash,
                "arithmetic_atoms_added_by_alias": 0,
                "status_relative_to_unaliased_cell": "identical_formula",
                "base_metric_status": base_status,
            })
            hashes.setdefault(formula_hash, set()).add(alias_id)

    assert len(structural) == 12
    assert len(aliases) == 6
    assert len(cells) == 72
    assert len(hashes) == 12
    assert all(len(alias_ids) == 6 for alias_ids in hashes.values())

    output = {
        "schema": "period-three-named-source-alias-dependency-audit-v1",
        "epistemic_status": (
            "EXACT_ENCODING_DEPENDENCY_AUDIT_PLUS_EXISTING_VERIFIED_RATIONAL_"
            "QF_LRA_SAT_LEDGER_NOT_NEW_METRIC_DECISION_NOT_EUCLIDEAN_NOT_LEAN"
        ),
        "source_files": {
            "encoder": str(PROBE.relative_to(ATAIL.parent.parent)),
            "existing_sat_ledger": str(SEED.relative_to(ATAIL.parent.parent)),
        },
        "counts": {
            "structural_descriptors": len(structural),
            "ordered_distinct_aliases_per_descriptor": len(aliases),
            "alias_instances": len(cells),
            "distinct_formula_descriptors": len(hashes),
        },
        "decision": (
            "the aliases do not change any QF_LRA cell; each of six aliases "
            "shares the exact arithmetic formula and metric verdict of its base cell"
        ),
        "existing_positive_witness_scope": {
            "cell": "unequal-II-forward",
            "status": "verified rational QF_LRA SAT",
            "reflection": "exact formula automorphism",
            "target_negation_included": False,
        },
        "new_target_negating_attempt": {
            "status": "unresolved_under_budget",
            "reason": (
                "disjunctive Z3 run returned timeout-unknown; sign-fixed and "
                "incremental exact-LRA variants returned no completed cell before stop"
            ),
            "not_claimed": "SAT or UNSAT of the strengthened target-negating formula",
        },
        "cells": cells,
        "claims_excluded": [
            "continuation.first or continuation.second equals retained frontier q or w",
            "a new distance equality or inequality from the semantic aliases",
            "complete metric decisions for the ten cells without an existing exact ledger",
            "source-complete quotient outside this fixed 25-role family",
            "Euclidean, MEC, total-CSS, minimality, or full-L realization",
            "Lean theorem or sorry closure",
        ],
    }
    OUTPUT.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(output["counts"], sort_keys=True))
    print(output["decision"])
    print(f"wrote={OUTPUT}")


if __name__ == "__main__":
    main()
