#!/usr/bin/env python3
"""v7: complete global two-center bisector-parity exclusions."""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import subprocess
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
V6_DIR = REPO_ROOT / "scratch/card11-exact5-common-fullradius-v6"
_spec = importlib.util.spec_from_file_location("fullradius_v6_for_v7", V6_DIR / "probe.py")
if _spec is None or _spec.loader is None:
    raise RuntimeError("could not load v6 encoder")
v6 = importlib.util.module_from_spec(_spec)
sys.modules[_spec.name] = v6
_spec.loader.exec_module(v6)

SCHEMA = "card11_exact5_common_fullradius.v7"
LABELS = tuple(range(11))
EXPECTED_V7_CLAUSES_PER_ORDER = 4 * len(tuple(itertools.combinations(LABELS, 4)))
EXPECTED_V7_CLAUSES = 144 * EXPECTED_V7_CLAUSES_PER_ORDER


def edge(a: int, b: int) -> tuple[int, int]:
    return min(a, b), max(a, b)


def gkey(first, second):
    return tuple(sorted((edge(*first), edge(*second))))


def nonalternating(order, a: int, b: int, p: int, q: int) -> bool:
    pos = {label: index for index, label in enumerate(order)}
    low, high = sorted((pos[p], pos[q]))
    return ((low < pos[a] < high) == (low < pos[b] < high))


def add_two_center_bisector_parity(instance, manifest: dict) -> int:
    global_eq = {
        gkey(tuple(row["first_edge"]), tuple(row["second_edge"])):
            int(row["variable"])
        for row in manifest["global_edge_equality_variables"]
    }
    added = 0
    for selector_row in manifest["order_selectors"]:
        selector = int(selector_row["variable"])
        order = tuple(map(int, selector_row["labels"]))
        per_order = 0
        for four in itertools.combinations(LABELS, 4):
            for endpoints in itertools.combinations(four, 2):
                centers = tuple(x for x in four if x not in endpoints)
                a, b = endpoints
                p, q = centers
                if not nonalternating(order, a, b, p, q):
                    continue
                instance.cnf.add([
                    -selector,
                    -global_eq[gkey(edge(p, a), edge(p, b))],
                    -global_eq[gkey(edge(q, a), edge(q, b))],
                ])
                added += 1
                per_order += 1
        if per_order != EXPECTED_V7_CLAUSES_PER_ORDER:
            raise v6.ProbeError("nonuniform v7 order surface")
    if added != EXPECTED_V7_CLAUSES:
        raise v6.ProbeError("unexpected v7 clause count")
    return added


def build_instance(surplus_shell=None, other_shell=None):
    instance, separation, shell, indexed, layer, manifest = v6.build_instance(
        surplus_shell, other_shell
    )
    prefix_variables = instance.cnf.n
    prefix_clauses = len(instance.cnf.clauses)
    added = add_two_center_bisector_parity(instance, manifest)
    manifest["schema"] = SCHEMA
    manifest["pre_v7_prefix_variables"] = prefix_variables
    manifest["pre_v7_prefix_clauses"] = prefix_clauses
    manifest["v7_two_center_bisector_parity_clause_count"] = added
    manifest["variables"] = instance.cnf.n
    manifest["clauses"] = len(instance.cnf.clauses)
    manifest["clause_blocks"].append({
        "name": "v7-global-two-center-bisector-parity",
        "first_clause_1based": prefix_clauses + 1,
        "last_clause_1based": len(instance.cnf.clauses),
        "clause_count": added,
    })
    manifest["two_center_bisector_parity_semantics"] = (
        "Under each selected boundary order, two distinct centers cannot both "
        "be globally equidistant from the same endpoint pair unless the four "
        "labels strictly alternate in that cyclic order."
    )
    return instance, separation, shell, indexed, layer, manifest


def source_provenance() -> dict:
    result = v6.source_provenance()
    path = REPO_ROOT / "lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean"
    result["two_center_bisector_parity_theorems"] = {
        "path": str(path), "sha256": v6.sha256_file(path)
    }
    result["v6_encoder"] = {
        "path": str(V6_DIR / "probe.py"),
        "sha256": v6.sha256_file(V6_DIR / "probe.py"),
    }
    return result


def run_verifier(case_dir: Path, timeout: int) -> dict:
    command = [
        sys.executable, str(HERE / "verify_artifact.py"), str(case_dir),
        "--timeout", str(timeout),
    ]
    completed = subprocess.run(
        command, capture_output=True, text=True, timeout=timeout + 30
    )
    if completed.returncode:
        raise v6.ProbeError(
            f"v7 verifier failed: {completed.stdout[-400:]} {completed.stderr[-400:]}"
        )
    return json.loads((case_dir / "verification.json").read_text())


def run_case(s: int, o: int, timeout: int, output_root: Path) -> dict:
    case_dir = output_root / "runs" / v6.source.common_shell_name(s, o)
    case_dir.mkdir(parents=True, exist_ok=True)
    instance, _, _, _, _, manifest = build_instance(s, o)
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    v6.write_text(cnf_path, instance.dimacs())
    v6.write_json(case_dir / "manifest.json", manifest)
    result, command = v6.run_cadical(cnf_path, proof_path, timeout)
    v6.write_text(case_dir / "cadical.stdout", result.stdout)
    v6.write_text(case_dir / "cadical.stderr", result.stderr)
    if result.verdict == "SAT":
        v6.write_model_artifact(case_dir / "model.json", v6.parse_assignment(result.stdout))
    record = {
        "schema": SCHEMA,
        "case": {"s": s, "o": o},
        "verdict": result.verdict,
        "returncode": result.returncode,
        "wall_seconds": result.wall_seconds,
        "command": command,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "cnf_sha256": v6.sha256_file(cnf_path),
        "manifest_sha256": v6.sha256_file(case_dir / "manifest.json"),
        "proof_sha256": v6.sha256_file(proof_path) if proof_path.exists() else None,
        "proof_bytes": proof_path.stat().st_size if proof_path.exists() else 0,
        "model_sha256": (
            v6.sha256_file(case_dir / "model.json")
            if (case_dir / "model.json").exists() else None
        ),
    }
    v6.write_json(case_dir / "result.json", record)
    record["independent_verification"] = run_verifier(case_dir, timeout)
    v6.write_json(case_dir / "result.json", record)
    v6.write_json(case_dir / "provenance.json", {
        "schema": SCHEMA,
        "source_provenance": source_provenance(),
        "artifact_hashes": {
            name: v6.sha256_file(case_dir / name)
            for name in (
                "input.cnf", "manifest.json", "cadical.stdout",
                "cadical.stderr", "verification.json",
            )
        },
    })
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument(
        "--case", action="append",
        choices=[
            v6.source.common_shell_name(s, o)
            for s, o in v6.source.base.SHELL_CASES
        ],
    )
    args = parser.parse_args()
    if not 1 <= args.timeout <= 1800:
        raise SystemExit("--timeout must be in [1, 1800]")
    selected = [
        pair for pair in v6.source.base.SHELL_CASES
        if not args.case or v6.source.common_shell_name(*pair) in args.case
    ]
    records = [run_case(s, o, args.timeout, HERE) for s, o in selected]
    summary = {
        "schema": SCHEMA,
        "timeout_per_case_seconds": args.timeout,
        "serial": True,
        "maximum_concurrent_cadical_processes": 1,
        "results": records,
        "terminal": all(x["verdict"] in {"SAT", "UNSAT"} for x in records),
        "all_independently_verified": all(
            x["independent_verification"]["verified"] for x in records
        ),
        "trust_boundary": (
            "The exact CNF/model or CNF/DRAT pair is independently checked. "
            "The v7 clauses are justified by the four exhaustive non-alternating "
            "order kernels in TwoCenterBisectorParity.lean. Translation from a "
            "geometric counterexample to this fixed labelled Census surface "
            "still requires the source-to-valuation adapter."
        ),
    }
    v6.write_json(HERE / "summary.json", summary)
    print(json.dumps({
        "verdicts": [x["verdict"] for x in records],
        "all_independently_verified": summary["all_independently_verified"],
    }, sort_keys=True))
    return 0 if summary["terminal"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
