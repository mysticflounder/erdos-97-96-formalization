#!/usr/bin/env python3
"""Independent verifier for full-radius SAT models and UNSAT certificates.

This file does not import the encoder.  It consumes only persisted DIMACS,
solver output, and the explicit variable manifest.  SAT assignments are
checked clause-by-clause and against the intended finite semantics.  UNSAT
artifacts are checked by the independent ``drat-trim`` executable.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from pathlib import Path


LABELS = tuple(range(11))
V = 1
W = 2
S = frozenset({1, 2, 3, 4, 5})
O1 = frozenset({0, 2, 6, 7, 8})
O2 = frozenset({0, 1, 9, 10})
Q = 6
WITNESS = 7
BLOCKER = 8


class VerificationError(RuntimeError):
    pass


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def read_dimacs(path: Path) -> tuple[int, list[list[int]]]:
    declared_vars = None
    declared_clauses = None
    clauses: list[list[int]] = []
    pending: list[int] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_number, raw in enumerate(handle, start=1):
            line = raw.strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p "):
                parts = line.split()
                if parts[:2] != ["p", "cnf"] or len(parts) != 4:
                    raise VerificationError(f"bad DIMACS header at line {line_number}")
                declared_vars, declared_clauses = int(parts[2]), int(parts[3])
                continue
            for token in line.split():
                literal = int(token)
                if literal == 0:
                    clauses.append(pending)
                    pending = []
                else:
                    pending.append(literal)
    if pending:
        raise VerificationError("unterminated DIMACS clause")
    if declared_vars is None or declared_clauses is None:
        raise VerificationError("missing DIMACS header")
    if len(clauses) != declared_clauses:
        raise VerificationError(
            f"DIMACS clause mismatch: declared {declared_clauses}, read {len(clauses)}"
        )
    if any(abs(literal) > declared_vars for clause in clauses for literal in clause):
        raise VerificationError("DIMACS literal exceeds declared variable count")
    return declared_vars, clauses


def parse_assignment(path: Path) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise VerificationError(f"conflicting assignment for {variable}")
            assignment[variable] = value
    return assignment


def onehit_ok(center: int, support: set[int]) -> bool:
    if center == V:
        return (
            len(support & (S - {V})) <= 1
            and len(support & (O2 - {V})) <= 1
        )
    if center == W:
        return (
            len(support & (S - {W})) <= 1
            and len(support & (O1 - {W})) <= 1
        )
    return True


def validate_order(cube: dict[int, set[int]], labels: list[int]) -> bool:
    if len(labels) != 11 or set(labels) != set(LABELS):
        return False
    positions = {label: index for index, label in enumerate(labels)}
    for first_center, second_center in itertools.combinations(LABELS, 2):
        common = sorted(cube[first_center] & cube[second_center])
        low, high = sorted((positions[first_center], positions[second_center]))
        for first_point, second_point in itertools.combinations(common, 2):
            first_between = low < positions[first_point] < high
            second_between = low < positions[second_point] < high
            if first_between == second_between:
                return False
    return True


def classes_at(
    center: int,
    eq_vars: dict[tuple[int, int, int], int],
    assignment: dict[int, bool],
) -> list[set[int]]:
    incident = [label for label in LABELS if label != center]
    unseen = set(incident)
    classes = []
    while unseen:
        seed = min(unseen)
        cls = {seed}
        for label in incident:
            if label == seed:
                continue
            key = (center, min(seed, label), max(seed, label))
            if assignment[eq_vars[key]]:
                cls.add(label)
        unseen -= cls
        classes.append(cls)
    return classes


def validate_sat(
    cnf_vars: int,
    clauses: list[list[int]],
    assignment: dict[int, bool],
    manifest: dict,
) -> dict:
    if set(assignment) != set(range(1, cnf_vars + 1)):
        missing = sorted(set(range(1, cnf_vars + 1)) - set(assignment))
        extra = sorted(set(assignment) - set(range(1, cnf_vars + 1)))
        raise VerificationError(f"incomplete assignment (missing={missing[:5]}, extra={extra[:5]})")
    failed = [
        index for index, clause in enumerate(clauses, start=1)
        if not any(assignment[abs(literal)] == (literal > 0) for literal in clause)
    ]
    if failed:
        raise VerificationError(f"assignment fails DIMACS clauses {failed[:10]}")

    rows_by_center: dict[int, list[dict]] = {center: [] for center in LABELS}
    row_by_key = {}
    for row in manifest["selected_rows"]:
        center = int(row["center"])
        rows_by_center[center].append(row)
        row_by_key[(center, int(row["row_index"]))] = row
    cube: dict[int, set[int]] = {}
    selected_indices = {}
    for center in LABELS:
        chosen = [
            row for row in rows_by_center[center]
            if assignment[int(row["variable"])]
        ]
        if len(chosen) != 1:
            raise VerificationError(f"center {center} selects {len(chosen)} rows")
        row = chosen[0]
        support = set(map(int, row["support"]))
        if len(support) != 4 or center in support or not onehit_ok(center, support):
            raise VerificationError(f"center {center} violates C1/one-hit")
        cube[center] = support
        selected_indices[center] = int(row["row_index"])

    pair_counts: dict[tuple[int, int], int] = {}
    triple_counts: dict[tuple[int, int, int], int] = {}
    for center in LABELS:
        for pair in itertools.combinations(sorted(cube[center]), 2):
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
        for triple in itertools.combinations(sorted(cube[center]), 3):
            triple_counts[triple] = triple_counts.get(triple, 0) + 1
    if max(pair_counts.values(), default=0) > 2:
        raise VerificationError("C4 pair capacity exceeds two")
    if max(triple_counts.values(), default=0) > 1:
        raise VerificationError("C2/triple capacity exceeds one")
    for first, second in itertools.combinations(LABELS, 2):
        if len(cube[first] & cube[second]) > 2:
            raise VerificationError("C2 row intersection exceeds two")

    selected_orders = [
        order for order in manifest["order_selectors"]
        if assignment[int(order["variable"])]
    ]
    if not selected_orders:
        raise VerificationError("no order selector is positive")
    if not all(validate_order(cube, list(map(int, order["labels"])))
               for order in selected_orders):
        raise VerificationError("a selected boundary order violates separation")

    shell = manifest.get("shell")
    if shell is not None:
        u5 = set(map(int, shell["u5"]))
        if not ({Q, WITNESS} <= cube[V] <= u5):
            raise VerificationError("first-apex Census shell constraint failed")
        if not ({Q, WITNESS} <= cube[BLOCKER]):
            raise VerificationError("common blocker Census shell constraint failed")
        if pair_counts.get(tuple(sorted((Q, WITNESS))), 0) != 2:
            raise VerificationError("common pair is not saturated at exactly two centers")

    choices_by_source = {source: [] for source in LABELS}
    choices_by_center = {center: [] for center in LABELS}
    for choice in manifest["source_choices"]:
        if assignment[int(choice["variable"])]:
            source_label = int(choice["source"])
            choices_by_source[source_label].append(choice)
            choices_by_center[int(choice["center"])].append(choice)
    selected_choices = {}
    for source_label in LABELS:
        chosen = choices_by_source[source_label]
        if len(chosen) != 1:
            raise VerificationError(
                f"source {source_label} selects {len(chosen)} blocker rows"
            )
        choice = chosen[0]
        center = int(choice["center"])
        row_index = int(choice["row_index"])
        support = set(map(int, row_by_key[(center, row_index)]["support"]))
        if source_label not in support or center in support:
            raise VerificationError("source membership or center exclusion failed")
        if selected_indices[center] != row_index:
            raise VerificationError("source choice does not preserve selected row")
        selected_choices[source_label] = (center, row_index)

    for center in LABELS:
        used_var = int(manifest["used_center_variables"][str(center)])
        if assignment[used_var] != bool(choices_by_center[center]):
            raise VerificationError("used-center variable lacks exact iff semantics")

    eq_vars = {}
    for entry in manifest["equality_variables"]:
        key = (
            int(entry["center"]), int(entry["left"]), int(entry["right"])
        )
        eq_vars[key] = int(entry["variable"])
    expected_eq_keys = {
        (center, left, right)
        for center in LABELS
        for left, right in itertools.combinations(
            [label for label in LABELS if label != center], 2
        )
    }
    if set(eq_vars) != expected_eq_keys:
        raise VerificationError("equality manifest is not the complete local surface")

    local_classes = {}
    for center in LABELS:
        # Exhaustive semantic transitivity audit, independent of the CNF clauses.
        incident = [label for label in LABELS if label != center]
        for a, b, d in itertools.permutations(incident, 3):
            ab = assignment[eq_vars[(center, min(a, b), max(a, b))]]
            bd = assignment[eq_vars[(center, min(b, d), max(b, d))]]
            ad = assignment[eq_vars[(center, min(a, d), max(a, d))]]
            if ab and bd and not ad:
                raise VerificationError("local equality is not transitive")
        classes = classes_at(center, eq_vars, assignment)
        if set().union(*classes) != set(incident):
            raise VerificationError("local classes do not cover all incident edges")
        if sum(len(cls) for cls in classes) != len(incident):
            raise VerificationError("local classes do not form a partition")
        local_classes[center] = classes
        if cube[center] not in classes:
            raise VerificationError("selected exact-four row is not an entire class")

    if shell is not None:
        u5 = set(map(int, shell["u5"]))
        if u5 not in local_classes[V]:
            raise VerificationError("named exact-five first-apex shell is not entire")
        if V in u5:
            raise VerificationError("first-apex shell contains its center")

    no_qfree_checked = 0
    if shell is not None:
        if selected_choices[Q][0] != BLOCKER or selected_choices[WITNESS][0] != BLOCKER:
            raise VerificationError("common sources 6 and 7 do not map to blocker 8")
    for source_label, (center, _) in selected_choices.items():
        remaining = set(LABELS) - {center, source_label}
        remaining_class_sizes = [
            len(cls & remaining) for cls in local_classes[center]
        ]
        if max(remaining_class_sizes, default=0) >= 4:
            raise VerificationError(
                f"no_qfree fails for source {source_label} at center {center}"
            )
        no_qfree_checked += 1

    return {
        "verified": True,
        "mode": "SAT-model",
        "cnf_clause_check": True,
        "all_variables_assigned": True,
        "census_c1_onehit_c2_c4": True,
        "pair_capacity_max": max(pair_counts.values(), default=0),
        "triple_capacity_max": max(triple_counts.values(), default=0),
        "selected_order_count": len(selected_orders),
        "source_map_total_functional_membership_preserved": True,
        "local_equivalence_partitions_checked": len(local_classes),
        "reflexivity_semantics": "implicit for each incident edge",
        "symmetry_semantics": "one canonical unordered-pair variable",
        "transitivity_exhaustively_checked": True,
        "selected_rows_are_entire_classes": True,
        "first_apex_exact_five_entire_class": shell is not None,
        "common_sources_map_to_blocker": shell is not None,
        "no_qfree_source_checks": no_qfree_checked,
    }


def verify_unsat(case_dir: Path, result: dict, timeout: int) -> dict:
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    if not proof_path.exists() or proof_path.stat().st_size == 0:
        raise VerificationError("UNSAT artifact has no proof")
    if result.get("proof_sha256") != sha256_file(proof_path):
        raise VerificationError("proof hash mismatch")
    command = ["drat-trim", str(cnf_path), str(proof_path)]
    completed = subprocess.run(
        command, capture_output=True, text=True, timeout=timeout
    )
    output = completed.stdout + completed.stderr
    exact_verified = "s VERIFIED" in output.splitlines()
    if completed.returncode != 0 or not exact_verified:
        raise VerificationError(
            f"drat-trim rejected proof: returncode={completed.returncode}, tail={output[-500:]!r}"
        )
    return {
        "verified": True,
        "mode": "UNSAT-DRAT",
        "drat_trim_returncode": completed.returncode,
        "drat_exact_verified_line": exact_verified,
        "proof_bytes": proof_path.stat().st_size,
        "proof_sha256": sha256_file(proof_path),
        "command": command,
        "output_tail": output[-1000:],
        "source_to_valuation_trust_gap": (
            "certificate proves only this exact CNF; it does not prove the "
            "geometric-to-labelled source/blocker valuation adapter"
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("case_dir", type=Path)
    parser.add_argument("--timeout", type=int, default=600)
    args = parser.parse_args()
    case_dir = args.case_dir.resolve()
    result = json.loads((case_dir / "result.json").read_text(encoding="utf-8"))
    manifest = json.loads((case_dir / "manifest.json").read_text(encoding="utf-8"))
    cnf_path = case_dir / "input.cnf"
    if result["cnf_sha256"] != sha256_file(cnf_path):
        raise VerificationError("CNF hash mismatch")
    if result["manifest_sha256"] != sha256_file(case_dir / "manifest.json"):
        raise VerificationError("manifest hash mismatch")
    cnf_vars, clauses = read_dimacs(cnf_path)
    if cnf_vars != int(manifest["variables"]) or len(clauses) != int(manifest["clauses"]):
        raise VerificationError("manifest/DIMACS count mismatch")
    if result["verdict"] == "SAT":
        assignment = parse_assignment(case_dir / "cadical.stdout")
        verification = validate_sat(cnf_vars, clauses, assignment, manifest)
    elif result["verdict"] == "UNSAT":
        verification = verify_unsat(case_dir, result, args.timeout)
    else:
        raise VerificationError(f"cannot verify nonterminal verdict {result['verdict']!r}")
    verification["cnf_sha256"] = sha256_file(cnf_path)
    verification["manifest_sha256"] = sha256_file(case_dir / "manifest.json")
    (case_dir / "verification.json").write_text(
        json.dumps(verification, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "verified": verification["verified"],
        "mode": verification["mode"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
