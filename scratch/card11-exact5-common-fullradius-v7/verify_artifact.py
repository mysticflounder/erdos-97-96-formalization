#!/usr/bin/env python3
"""Independent verifier for v7; imports no encoder."""

from __future__ import annotations

import argparse
import copy
import importlib.util
import itertools
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
V6 = HERE.parent / "card11-exact5-common-fullradius-v6"
_spec = importlib.util.spec_from_file_location("v6_independent_verifier", V6 / "verify_artifact.py")
if _spec is None or _spec.loader is None:
    raise RuntimeError("could not load v6 independent verifier")
base = importlib.util.module_from_spec(_spec)
sys.modules[_spec.name] = base
_spec.loader.exec_module(base)

SCHEMA = "card11_exact5_common_fullradius.v7"
LABELS = tuple(range(11))
EXPECTED = 144 * 4 * len(tuple(itertools.combinations(LABELS, 4)))


def nonalternating(order, a, b, p, q):
    pos = {label: index for index, label in enumerate(order)}
    low, high = sorted((pos[p], pos[q]))
    return ((low < pos[a] < high) == (low < pos[b] < high))


def verify_structure(clauses: list[list[int]], manifest: dict) -> dict:
    if manifest.get("schema") != SCHEMA:
        raise base.VerificationError("unexpected v7 schema")
    prefix = int(manifest["pre_v7_prefix_clauses"])
    if int(manifest["pre_v7_prefix_variables"]) != int(manifest["variables"]):
        raise base.VerificationError("v7 unexpectedly adds variables")
    v6_manifest = copy.deepcopy(manifest)
    v6_manifest["schema"] = base.SCHEMA
    v6_manifest["clauses"] = prefix
    v6_manifest["clause_blocks"] = [
        block for block in manifest["clause_blocks"]
        if block["name"] != "v7-global-two-center-bisector-parity"
    ]
    global_vars = base.parse_global_variables(v6_manifest, int(manifest["variables"]))
    local = base.parse_local_variables(v6_manifest)
    local_four, qpair = base.parse_v6_aux_variables(
        v6_manifest, int(manifest["variables"])
    )
    v6_audit = base.verify_v6_clause_blocks(
        clauses[:prefix], v6_manifest, global_vars, local, local_four, qpair
    )
    orders = manifest["order_selectors"]
    expected = []
    for row in orders:
        selector = int(row["variable"])
        order = tuple(map(int, row["labels"]))
        per_order = 0
        for four in itertools.combinations(LABELS, 4):
            for endpoints in itertools.combinations(four, 2):
                centers = tuple(x for x in four if x not in endpoints)
                a, b = endpoints
                p, q = centers
                if not nonalternating(order, a, b, p, q):
                    continue
                first = global_vars[base.global_key(
                    base.edge_key(p, a), base.edge_key(p, b)
                )]
                second = global_vars[base.global_key(
                    base.edge_key(q, a), base.edge_key(q, b)
                )]
                expected.append([-selector, -first, -second])
                per_order += 1
        if per_order != 1320:
            raise base.VerificationError("nonuniform v7 order clauses")
    if len(expected) != EXPECTED or clauses[prefix:] != expected:
        raise base.VerificationError("v7 clause block differs from reconstruction")
    block = next(
        x for x in manifest["clause_blocks"]
        if x["name"] == "v7-global-two-center-bisector-parity"
    )
    if (
        int(block["first_clause_1based"]) != prefix + 1
        or int(block["last_clause_1based"]) != len(clauses)
        or int(block["clause_count"]) != EXPECTED
        or int(manifest["v7_two_center_bisector_parity_clause_count"]) != EXPECTED
    ):
        raise base.VerificationError("bad v7 clause metadata")
    return {"v6_prefix": v6_audit, "v7_clause_count_exact": EXPECTED}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("case_dir", type=Path)
    parser.add_argument("--timeout", type=int, default=600)
    args = parser.parse_args()
    case_dir = args.case_dir.resolve()
    result = json.loads((case_dir / "result.json").read_text())
    manifest = json.loads((case_dir / "manifest.json").read_text())
    cnf_path = case_dir / "input.cnf"
    if result["cnf_sha256"] != base.sha256_file(cnf_path):
        raise base.VerificationError("CNF hash mismatch")
    if result["manifest_sha256"] != base.sha256_file(case_dir / "manifest.json"):
        raise base.VerificationError("manifest hash mismatch")
    cnf_vars, clauses = base.read_dimacs(cnf_path)
    if cnf_vars != manifest["variables"] or len(clauses) != manifest["clauses"]:
        raise base.VerificationError("manifest/DIMACS count mismatch")
    structural = verify_structure(clauses, manifest)
    if result["verdict"] == "SAT":
        model_path = case_dir / "model.json"
        if result["model_sha256"] != base.sha256_file(model_path):
            raise base.VerificationError("model hash mismatch")
        values = base.parse_model(model_path)
        if values != base.parse_assignment(case_dir / "cadical.stdout"):
            raise base.VerificationError("persisted model differs from solver output")
        verification = base.validate_sat(cnf_vars, clauses, values, manifest)
        verification["model_sha256"] = base.sha256_file(model_path)
    elif result["verdict"] == "UNSAT":
        verification = base.verify_unsat(case_dir, result, args.timeout)
    else:
        raise base.VerificationError("nonterminal result")
    verification["v7_structural_audit"] = structural
    verification["cnf_sha256"] = base.sha256_file(cnf_path)
    verification["manifest_sha256"] = base.sha256_file(case_dir / "manifest.json")
    (case_dir / "verification.json").write_text(
        json.dumps(verification, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({"verified": verification["verified"], "mode": verification["mode"]}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
