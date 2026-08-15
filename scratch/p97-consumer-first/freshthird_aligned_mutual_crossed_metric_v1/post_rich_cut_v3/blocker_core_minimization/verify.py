"""Verify the frozen blocker-core minimization without rerunning solvers."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

import minimize

HERE = Path(__file__).resolve().parent
EXPECTED_CORE = [
    "k4_equal_1_3",
    "k4_equal_1_7",
    "k4_equal_3_8",
    "k4_equal_7_1",
    "k4_equal_7_13",
    "k4_equal_8_3",
    "k4_equal_13_7",
    "k4_equal_13_8",
    "blocker_exact_8_13",
]
EXPECTED_GROUPS = [
    "k4_witness_equalities::D.K4 four-witness common radius",
    "blocker_exactness::unique-four at an actual blocker-image center",
]


def artifact_queries(
    results: dict[str, object],
) -> dict[str, list[minimize.metric.Clause]]:
    """Reconstruct every one-check replay query deterministically."""
    encoding = minimize.load_encoding()
    clauses = minimize.canonical_clauses(encoding)
    by_name = {clause.name: clause for clause in clauses}
    core = [by_name[name] for name in EXPECTED_CORE]
    queries: dict[str, list[minimize.metric.Clause]] = {
        "canonical_blocker_exactness": clauses,
        "clause_core": core,
    }
    for index, dropped in enumerate(core):
        candidate = [clause for clause in core if clause.name != dropped.name]
        queries[f"clause_core_drop_{index:02d}_{dropped.name}"] = (
            minimize.exact_substituted_clauses(
                encoding, candidate, minimize.DROP_WITNESSES[dropped.name]
            )
        )
    queries.update(minimize.tiny_controls(encoding))
    queries.update(
        {
            "parent_" + name: members
            for name, members in minimize.metric.malformed_controls(encoding).items()
        }
    )
    replay_names = {item["name"] for item in results["replays"]}  # type: ignore[index]
    expected_names = set(queries) - {"canonical_blocker_exactness"}
    if expected_names != replay_names:
        raise AssertionError(
            f"reconstructed query names differ: {expected_names ^ replay_names}"
        )
    return queries


def verify_manifest() -> None:
    for line in (HERE / "SHA256SUMS").read_text().splitlines():
        digest, label = line.split(None, 1)
        path = (HERE / label).resolve()
        actual = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual != digest:
            raise AssertionError(f"SHA-256 mismatch: {label}")


def verify() -> None:
    results = json.loads((HERE / "results.json").read_text())
    if results["canonical_clause_count"] != minimize.EXPECTED_CLAUSE_COUNT:
        raise AssertionError("wrong canonical clause count")
    canonical_statuses = {
        record["status"] for record in results["canonical_replay"]["solvers"].values()
    }
    if canonical_statuses != {"UNSAT"}:
        raise AssertionError(f"canonical query mismatch: {canonical_statuses}")
    row_identity = minimize.selected_row_identity_audit(minimize.load_encoding())
    if row_identity != results["selected_row_identity"]:
        raise AssertionError("selected-row/K4 identity audit changed")
    if row_identity["source_count"] != 17 or row_identity["mismatch_count"] != 0:
        raise AssertionError("selected-row/K4 identity is not 17/17")
    if results["direct_syntactic_opposites"]:
        raise AssertionError("canonical query contains a direct syntactic opposite")
    if results["core_direct_syntactic_opposites"]:
        raise AssertionError("core is a direct syntactic contradiction")
    if [item["name"] for item in results["clause_core"]] != EXPECTED_CORE:
        raise AssertionError("clause core changed")
    if [item["group"] for item in results["core_source_groups"]] != EXPECTED_GROUPS:
        raise AssertionError("core source groups changed")
    if results["derived_distance_chain"]["status"] != "PASS":
        raise AssertionError("derived distance chain did not validate")
    tracked = results["tracked_clause_seed"]
    if tracked["universe_clause_count"] != 1070 or tracked["seed_clause_count"] != 9:
        raise AssertionError("global tracked seed scope changed")

    queries = artifact_queries(results)
    replay_by_name = {item["name"]: item for item in results["replays"]}
    canonical = results["canonical_replay"]
    replay_by_name[canonical["name"]] = canonical
    unsat_names = {
        "canonical_blocker_exactness",
        "clause_core",
        "known_malformed_unsat",
        "parent_malformed_reversed_boundary",
        "parent_malformed_break_k4_equality",
        "parent_malformed_equal_rich_radii",
        "parent_malformed_break_singleton",
    }
    for name, clauses in queries.items():
        replay = replay_by_name[name]
        expected = "UNSAT" if name in unsat_names else "SAT"
        statuses = {record["status"] for record in replay["solvers"].values()}
        if statuses != {expected}:
            raise AssertionError(f"solver mismatch for {name}: {statuses}")
        for solver_name, record in replay["solvers"].items():
            log = HERE / "logs" / f"{name}_{solver_name}.log"
            log_status = minimize.parse_solver_status(log.read_text())
            if log_status != record["status"]:
                raise AssertionError(
                    f"solver log mismatch for {name}/{solver_name}: {log_status}"
                )
        if name.startswith("clause_core_drop_"):
            exact = replay["exact_model_validation"]
            if exact["exact_z3_substitution"] != "PASS":
                raise AssertionError(f"exact substitution failed for {name}")
            expected_fraction = (
                "PASS" if exact["coordinate_field"] == "Q" else "SKIP_ALGEBRAIC"
            )
            if exact["fraction_replay"] != expected_fraction:
                raise AssertionError(f"Fraction status wrong for {name}")
        if name == "known_sat":
            exact = replay["exact_model_validation"]
            if exact["exact_z3_substitution"] != "PASS":
                raise AssertionError("known-SAT exact substitution failed")
            if exact["fraction_replay"] != "PASS":
                raise AssertionError("known-SAT Fraction replay failed")
            if replay["internal_z3"]["status"] != "SAT":
                raise AssertionError("known-SAT internal Z3 check failed")
        artifact = HERE / replay["artifact"]
        expected_text = minimize.metric.one_check_smt2(clauses)
        if artifact.read_text() != expected_text:
            raise AssertionError(f"nondeterministic SMT artifact: {name}")
        if expected_text.count("(check-sat)") != 1:
            raise AssertionError(f"not one-check-sat: {name}")

    tracked_artifact = HERE / tracked["artifact"]
    if tracked_artifact.read_text().count("(check-sat)") != 1:
        raise AssertionError("tracked seed artifact is not one-check-sat")
    tracked_log = HERE / "logs/tracked_global_seed_z3.log"
    if minimize.parse_solver_status(tracked_log.read_text()) != "UNSAT":
        raise AssertionError("tracked global seed log is not UNSAT")
    tracked_labels = set(re.findall(r"clause_track_[0-9]{4}", tracked_log.read_text()))
    if len(tracked_labels) != tracked["seed_clause_count"]:
        raise AssertionError("tracked global seed log has the wrong core size")
    verify_manifest()


def main() -> None:
    verify()
    print("PASS: 9-clause MUS, 9 exact drop witnesses, row identity, SMT/SHA")


if __name__ == "__main__":
    main()
