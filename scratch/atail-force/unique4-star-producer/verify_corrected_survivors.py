#!/usr/bin/env python3
"""Independently replay the corrected unique-four SAT assignments.

The compact replay checks only serialized data and exact arithmetic.  An
optional first run may additionally replay the original 150 MB DIMACS through
the independent outer semantic verifier; the resulting digest-bound evidence
is retained in the compact JSON and is not needed by later ``--check`` runs.

This is an audit of two fixed finite projections.  It is not a Euclidean
realization and it does not prove or refute the cardinality-uniform Lean
producer.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OUTER_VERIFIER_PATH = (
    HERE.parent
    / "unique-arm-whole-carrier-source-audit"
    / "verify_exact_four_outer.py"
)
FULL_LINEAR_PATH = (
    HERE.parent / "whole-carrier-ordinal-coverage" / "full_linear_replay.py"
)
CEGAR_PATH = (
    HERE.parent / "generic-biapex-kalmanson-search" / "cegar.py"
)
DIRECT_OVERLAY_PATH = (
    HERE.parent / "unique4-curvature-direct-overlay" / "direct_curvature_overlay.py"
)
OUTER_ENCODER_PATH = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "exact_four_outer.py"
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


FULL_LINEAR = load_module("unique4_star_full_linear", FULL_LINEAR_PATH)
OUTER_VERIFIER = load_module("unique4_star_outer_verifier", OUTER_VERIFIER_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def arc_masks(
    n: int, center: int, support: tuple[int, ...]
) -> tuple[tuple[str, int], tuple[str, int]]:
    """Reconstruct the two outer turn intervals without using the encoder."""

    offsets = sorted((center - point) % n for point in support)
    require(len(offsets) == 4 and offsets[0] != 0, "malformed selected row")
    global_start = (-center) % n
    left_turns = tuple(
        (global_start + offset) % n for offset in range(offsets[1] - 1)
    )
    right_turns = tuple(
        (global_start + offset) % n for offset in range(offsets[2], n - 1)
    )
    require(bool(left_turns) and bool(right_turns), "empty outer turn interval")
    return (
        ("left", sum(1 << turn for turn in left_turns)),
        ("right", sum(1 << turn for turn in right_turns)),
    )


def disjoint(masks: tuple[int, ...]) -> bool:
    used = 0
    for mask in masks:
        if used & mask:
            return False
        used |= mask
    return True


def scalar_curvature(rows: dict[int, tuple[int, ...]], n: int) -> dict[str, Any]:
    """Exact QF_LRA replay of the complete scalar shell-curvature ledger."""

    turns = [z3.Real(f"turn_{index}") for index in range(n)]
    solver = z3.SolverFor("QF_LRA")
    solver.add(z3.Sum(*turns) == 4)
    solver.add(*(z3.And(turn > 0, turn < 2) for turn in turns))
    ledger: list[dict[str, Any]] = []
    for center, support in sorted(rows.items()):
        offsets = sorted((center - point) % n for point in support)
        require(len(offsets) == 4 and offsets[0] != 0, "malformed curvature row")
        global_start = (-center) % n
        left = tuple(
            (global_start + offset) % n for offset in range(offsets[1] - 1)
        )
        right = tuple(
            (global_start + offset) % n for offset in range(offsets[2], n - 1)
        )
        solver.add(z3.Sum(*(turns[index] for index in left)) > 1)
        solver.add(z3.Sum(*(turns[index] for index in right)) > 1)
        ledger.append(
            {
                "center": center,
                "left_turn_indices": list(left),
                "right_turn_indices": list(right),
            }
        )
    status = solver.check()
    result: dict[str, Any] = {
        "solver_status": str(status).upper(),
        "constraint_scope": (
            "sum turns = 4; every turn in (0,2); both outer row arcs have sum > 1"
        ),
        "row_ledger": ledger,
    }
    if status == z3.sat:
        model = solver.model()
        values = [rational(model.eval(turn, model_completion=True)) for turn in turns]
        require(sum(values) == 4, "curvature model has wrong full-turn sum")
        require(all(0 < value < 2 for value in values), "invalid turn model")
        for entry in ledger:
            require(
                sum(values[index] for index in entry["left_turn_indices"]) > 1,
                "left curvature inequality failed replay",
            )
            require(
                sum(values[index] for index in entry["right_turn_indices"]) > 1,
                "right curvature inequality failed replay",
            )
        result["turn_model"] = [str(value) for value in values]
        result["exact_model_replayed"] = True
    elif status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    return result


def replay_full_linear(rows: dict[int, tuple[int, ...]], n: int) -> dict[str, Any]:
    """Run the tracked exact full Kalmanson/triangle LRA checker."""

    timeout_ms = 120_000
    status, centers, names, details = FULL_LINEAR.CEGAR.metric_check(
        rows, n, timeout_ms, time.monotonic() + timeout_ms / 1000
    )
    result: dict[str, Any] = {"solver_status": str(status).upper()}
    if status == z3.unsat:
        result.update(
            {
                "dependency_centers": list(centers),
                "metric_core": list(names),
                "required_memberships": [
                    list(pair) for pair in details["required_memberships"]
                ],
                "core_vertices": list(details["core_vertices"]),
                "constraint_kinds": list(details["constraint_kinds"]),
            }
        )
    elif status == z3.sat:
        result["distance_model"] = details
    else:
        result["reason_unknown"] = str(details)
    return result


def resolve_recorded(path_text: str) -> Path:
    path = Path(path_text)
    return path if path.is_absolute() else ROOT / path


def repo_relative(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT.resolve()))


def replay_artifact(path: Path) -> dict[str, Any]:
    artifact = json.loads(path.read_text(encoding="utf-8"))
    require(artifact.get("solver_status") == "SAT", "artifact is not SAT")
    require(
        artifact.get("semantic_replay_status")
        == "VERIFIED_SAT_NO_FOUR_ARC_TERMINAL_WITH_OWN_CAP_BOUNDS",
        "artifact lacks the expected encoder-side semantic replay",
    )
    require(int(artifact["n"]) == 11, "current audit expects n=11")
    require(int(artifact["opp1_card"]) in {4, 5}, "unexpected profile")

    runner = resolve_recorded(str(artifact["runner_source"]))
    require(
        artifact["runner_source_sha256"] == sha256(runner),
        "runner source hash drift",
    )
    for key in ("planar_bank", "kalmanson_bank", "u5_bank"):
        bank = resolve_recorded(str(artifact[key]))
        require(artifact[f"{key}_sha256"] == sha256(bank), f"{key} hash drift")

    n = int(artifact["n"])
    decoded = artifact["decoded"]
    rows = {
        int(center): tuple(sorted(map(int, support)))
        for center, support in decoded["rows"].items()
    }
    require(set(rows) == set(range(n)), "selected rows do not cover the carrier")
    for center, support in rows.items():
        require(len(support) == 4, f"row {center} is not a four-set")
        require(len(set(support)) == 4, f"row {center} repeats a point")
        require(center not in support, f"row {center} contains its center")
        require(all(0 <= point < n for point in support), "row point out of range")

    first_apex = int(artifact["first_apex"])
    second_apex = int(artifact["second_apex"])
    surplus_vertex = int(artifact["surplus_vertex"])
    endpoints = {
        "surplus": {first_apex, second_apex},
        "first_opposite": {second_apex, surplus_vertex},
        "second_opposite": {surplus_vertex, first_apex},
    }
    own_cap_ledger: list[dict[str, Any]] = []
    for cap_name, cap_data in artifact["closed_caps"].items():
        cap = set(map(int, cap_data))
        for center in sorted(cap):
            hits = sorted(cap & set(rows[center]))
            require(len(hits) <= 2, f"own-cap bound fails at {cap_name}/{center}")
            if center in endpoints[cap_name]:
                require(
                    len(hits) <= 1,
                    f"endpoint own-cap bound fails at {cap_name}/{center}",
                )
            own_cap_ledger.append(
                {
                    "cap": cap_name,
                    "center": center,
                    "hits": hits,
                    "endpoint": center in endpoints[cap_name],
                }
            )

    arcs: list[dict[str, Any]] = []
    for center, support in sorted(rows.items()):
        for side, mask in arc_masks(n, center, support):
            arcs.append({"center": center, "side": side, "mask": mask})
    disjoint_packings = []
    for chosen in itertools.combinations(arcs, 4):
        if disjoint(tuple(int(arc["mask"]) for arc in chosen)):
            disjoint_packings.append(chosen)
    require(not disjoint_packings, "artifact contains a four-arc terminal")

    # The direct overlay introduces one variable per exact row pattern and one
    # per outer arc type.  Each pattern contributes four membership directions,
    # one converse direction, and two arc directions; each arc contributes one
    # converse clause.  This independently reconstructs the final DIMACS
    # header counts without retaining the 150 MB DIMACS file.
    final_variable_count = (
        int(artifact["variable_count"])
        + int(artifact["row_pattern_count"])
        + int(artifact["outer_arc_type_count"])
    )
    final_clause_count = (
        int(artifact["clause_count"])
        + int(artifact["own_cap_at_most_two_clause_count"])
        + int(artifact["endpoint_own_cap_at_most_one_clause_count"])
        + 7 * int(artifact["row_pattern_count"])
        + int(artifact["outer_arc_type_count"])
        + int(artifact["turn_disjoint_four_arc_packing_count"])
    )

    return {
        "artifact": repo_relative(path),
        "artifact_sha256": sha256(path),
        "opp1_card": int(artifact["opp1_card"]),
        "rows": {str(center): list(support) for center, support in sorted(rows.items())},
        "own_cap_endpoint_replay": {
            "status": "PASS",
            "checked_center_cap_incidence_count": len(own_cap_ledger),
            "ledger": own_cap_ledger,
        },
        "outer_arc_replay": {
            "status": "PASS_NO_PAIRWISE_DISJOINT_FOUR_PACKING",
            "selected_arc_count": len(arcs),
            "pairwise_disjoint_four_packing_count": 0,
            "arcs": arcs,
        },
        "derived_final_dimacs_counts": {
            "variable_count": final_variable_count,
            "clause_count": final_clause_count,
        },
        "scalar_curvature_replay": scalar_curvature(rows, n),
        "full_linear_kalmanson_replay": replay_full_linear(rows, n),
    }


def source_hashes(artifacts: list[Path]) -> dict[str, str]:
    paths = {
        Path(__file__).resolve(),
        OUTER_VERIFIER_PATH,
        FULL_LINEAR_PATH,
        CEGAR_PATH,
        DIRECT_OVERLAY_PATH,
        OUTER_ENCODER_PATH,
    }
    for artifact_path in artifacts:
        artifact = json.loads(artifact_path.read_text(encoding="utf-8"))
        paths.add(resolve_recorded(str(artifact["runner_source"])))
        for key in ("planar_bank", "kalmanson_bank", "u5_bank"):
            paths.add(resolve_recorded(str(artifact[key])))
    return {
        repo_relative(path): sha256(path)
        for path in sorted(paths, key=str)
    }


def outer_replay(artifact_path: Path, cnf_path: Path) -> dict[str, Any]:
    artifact = json.loads(artifact_path.read_text(encoding="utf-8"))
    require(artifact["cnf_sha256"] == sha256(cnf_path), "DIMACS hash drift")
    flattened = {**artifact, **artifact["decoded"]}
    replay = OUTER_VERIFIER.verify(
        flattened,
        resolve_recorded(str(artifact["planar_bank"])),
        resolve_recorded(str(artifact["kalmanson_bank"])),
        resolve_recorded(str(artifact["u5_bank"])),
        cnf_path,
    )
    return {
        "artifact": repo_relative(artifact_path),
        "artifact_sha256": sha256(artifact_path),
        "cnf_sha256": sha256(cnf_path),
        "status": replay["status"],
        "all_encoded_semantic_constraints_replayed": replay[
            "all_encoded_semantic_constraints_replayed"
        ],
        "checked_planar_injection_count": replay["checked_planar_injection_count"],
        "checked_kalmanson_embedding_count": replay[
            "checked_kalmanson_embedding_count"
        ],
        "checked_u5_embedding_count": replay["checked_u5_embedding_count"],
    }


def compact_payload(artifacts: list[Path]) -> dict[str, Any]:
    return {
        "schema": "p97-unique4-corrected-survivor-independent-replay-v1",
        "epistemic_status": (
            "EXACT FIXED-ARTIFACT REPLAY; NOT A EUCLIDEAN MODEL OR LEAN PROOF"
        ),
        "source_hashes": source_hashes(artifacts),
        "records": [replay_artifact(path) for path in artifacts],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifacts", nargs=2, type=Path)
    parser.add_argument("--cnf", action="append", type=Path, default=[])
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    payload = compact_payload(args.artifacts)
    if args.check:
        require(args.output.exists(), "--check requires an existing output")
        expected = json.loads(args.output.read_text(encoding="utf-8"))
        expected_compact = {
            key: value for key, value in expected.items()
            if key != "initial_outer_semantic_replay"
        }
        require(payload == expected_compact, "stored compact replay drifted")
        for evidence in expected.get("initial_outer_semantic_replay", []):
            artifact = ROOT / evidence["artifact"]
            require(
                evidence["artifact_sha256"] == sha256(artifact),
                "outer replay artifact hash drift",
            )
            recorded = json.loads(artifact.read_text(encoding="utf-8"))
            require(
                evidence["cnf_sha256"] == recorded["cnf_sha256"],
                "outer replay DIMACS binding drift",
            )
        print("PASS: corrected survivor compact replay matches stored artifact")
        return 0

    if args.cnf:
        require(len(args.cnf) == len(args.artifacts), "supply one --cnf per artifact")
        payload["initial_outer_semantic_replay"] = [
            outer_replay(artifact, cnf)
            for artifact, cnf in zip(args.artifacts, args.cnf, strict=True)
        ]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            [
                {
                    "opp1_card": record["opp1_card"],
                    "scalar_curvature": record["scalar_curvature_replay"][
                        "solver_status"
                    ],
                    "full_linear_kalmanson": record[
                        "full_linear_kalmanson_replay"
                    ]["solver_status"],
                }
                for record in payload["records"]
            ],
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
