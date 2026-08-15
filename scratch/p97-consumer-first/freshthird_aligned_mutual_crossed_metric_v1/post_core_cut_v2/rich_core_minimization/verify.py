"""Verify the frozen rich-core minimization artifacts without rerunning CLIs."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import minimize

HERE = Path(__file__).resolve().parent
EXPECTED_CORE = [
    "k4_equal_12_7",
    "rich_equal_2_0_7",
    "rich_equal_2_1_3",
    "rich_distinct_2",
]
EXPECTED_PACKETS = [
    "k4_witness_equalities::D.K4 four-witness common radius",
    "rich_radius_pattern::strict-cap rich slice on a common apex radius",
    "rich_radius_pattern::D44 distinct radii",
]


def artifact_queries(
    results: dict[str, object],
) -> dict[str, list[minimize.metric.Clause]]:
    """Reconstruct every SMT query from the canonical assignment and generator."""
    encoding = minimize.load_encoding()
    clauses = minimize.canonical_clauses(encoding)
    by_name = {clause.name: clause for clause in clauses}
    core = [by_name[name] for name in EXPECTED_CORE]
    packets = minimize.semantic_packets(clauses)

    queries: dict[str, list[minimize.metric.Clause]] = {"clause_core": core}
    for index, dropped in enumerate(core):
        queries[f"clause_core_drop_{index:02d}_{dropped.name}"] = [
            clause for clause in core if clause.name != dropped.name
        ]

    packet_core = [
        clause for packet in EXPECTED_PACKETS for clause in packets[packet]
    ]
    queries["packet_core"] = packet_core
    for index, dropped in enumerate(EXPECTED_PACKETS):
        queries[f"packet_core_drop_{index:02d}"] = [
            clause
            for packet in EXPECTED_PACKETS
            if packet != dropped
            for clause in packets[packet]
        ]

    queries.update(minimize.tiny_controls(encoding))
    queries.update(
        {
            "parent_" + name: members
            for name, members in minimize.metric.malformed_controls(encoding).items()
        }
    )
    replay_names = {item["name"] for item in results["replays"]}  # type: ignore[index]
    if set(queries) != replay_names:
        raise AssertionError(
            f"reconstructed query names differ: {set(queries) ^ replay_names}"
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
    if results["canonical_z3_status"] != "UNSAT":
        raise AssertionError("canonical query did not record UNSAT")
    if results["direct_syntactic_opposites"]:
        raise AssertionError("unexpected direct syntactic opposite")
    if [item["name"] for item in results["clause_core"]] != EXPECTED_CORE:
        raise AssertionError("clause core changed")
    if [item["packet"] for item in results["packet_core"]] != EXPECTED_PACKETS:
        raise AssertionError("packet core changed")

    assignment = json.loads(minimize.ASSIGNMENT.read_text())
    if assignment["n"] != 17 or assignment["roles"]["apex2"] != 12:
        raise AssertionError("frozen assignment identity changed")
    if assignment["point_k4_rows"][12] != [3, 4, 7, 9]:
        raise AssertionError("third-apex K4 row changed")
    if assignment["rich_slices"][2] != [[7, 9], [3, 4]]:
        raise AssertionError("third-cap D44 slices changed")
    if not assignment["rich_two_arm"][2]:
        raise AssertionError("third apex is no longer D44")

    queries = artifact_queries(results)
    replay_by_name = {item["name"]: item for item in results["replays"]}
    unsat_names = {
        "clause_core",
        "packet_core",
        "known_malformed_unsat",
        "parent_malformed_reversed_boundary",
        "parent_malformed_break_k4_equality",
        "parent_malformed_equal_rich_radii",
        "parent_malformed_break_singleton",
    }
    for name, clauses in queries.items():
        replay = replay_by_name[name]
        expected = "UNSAT" if name in unsat_names else "SAT"
        statuses = {
            replay["internal_z3"]["status"],
            replay["solvers"]["z3"]["status"],
            replay["solvers"]["cvc5"]["status"],
        }
        if statuses != {expected}:
            raise AssertionError(f"solver mismatch for {name}: {statuses}")
        if expected == "SAT":
            exact = replay["exact_model_validation"]
            if exact["exact_z3_substitution"] != "PASS":
                raise AssertionError(f"exact substitution failed for {name}")
            if exact["fraction_replay"] != "PASS":
                raise AssertionError(f"Fraction replay failed for {name}")
            if not exact["all_values_rational"]:
                raise AssertionError(f"non-rational model for {name}")
        artifact = HERE / replay["artifact"]
        expected_text = minimize.metric.one_check_smt2(clauses)
        if artifact.read_text() != expected_text:
            raise AssertionError(f"nondeterministic SMT artifact: {name}")
        if expected_text.count("(check-sat)") != 1:
            raise AssertionError(f"not one-check-sat: {name}")

    verify_manifest()


def main() -> None:
    verify()
    print("PASS: frozen core, replay statuses, exact SAT checks, SMT bytes, SHA-256")


if __name__ == "__main__":
    main()
