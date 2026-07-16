#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Continue the corrected robust all-center CEGAR with the checked 15-core.

The predecessor checkpoint and its 524 cuts remain immutable.  This driver
pins and fully replays that checkpoint, adds the equality-closure consumer
``BankCleanFifteenCollisionCore`` through an independent graph replay, and
continues the same fixed fourteen-label, target-negated structural map.

The outer result is theorem-discovery evidence.  A terminal residual is
independently valid only inside the corrected finite shadow; map UNSAT is
exhaustive only for that fixed abstraction.  The bank-clean fifteen-core cut
itself is proof-backed by the separately kernel-checked Lean consumer named
below.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import runpy
import sys
import time
from typing import Any, Iterable, Mapping, Sequence

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PRIOR_DRIVER = HERE.parent / "robust-all-center-marco" / "bank_cegar.py"
PRIOR_CHECKPOINT = (
    HERE.parent / "robust-all-center-marco" / "bank_cegar_checkpoint.json"
)
MATCHER_SOURCE = HERE.parent / "bank-clean-pattern-matcher" / "check.py"
CORE_SOURCE = (
    HERE.parent
    / "bank-clean-lean-certificate"
    / "compact-fallback"
    / "BankCleanFifteenCollisionCore.lean"
)
CHECKPOINT = HERE / "checkpoint.json"

EXPECTED_PINS = {
    PRIOR_DRIVER: "35b911ccde42691fee1f9d425634f626154cc0621ff8802b8f7f1d2547a8ea16",
    PRIOR_CHECKPOINT: "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9",
    MATCHER_SOURCE: "b5326e5a758879b199643ed59d2940fbc13dc0a881d1a97e7b005e3b7e16195f",
    CORE_SOURCE: "de2830912528734a710c3bc6e5e6ffaf7db2842a017a57925647ae586f11ecbf",
}

SCHEMA = "p97-atail-robust-all-center-15core-continuation-v1"
FIFTEEN_STAGE = "bank-clean-fifteen-equality-collision"
FIFTEEN_CONSUMER = (
    "Problem97.Census554.EqualityCore."
    "not_realizes_of_bankCleanFifteenCollisionCore"
)

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force.producer_mus import MarcoEnumerator  # noqa: E402
from census.global_confinement import shadow  # noqa: E402


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


prior = load_module(PRIOR_DRIVER, "p97_robust_all_center_prior_bank")
matcher_namespace = runpy.run_path(
    str(MATCHER_SOURCE), run_name="p97_robust_all_center_fifteen_matcher"
)
bank_clean_15_core = matcher_namespace["bank_clean_15_core"]
bank_clean_15_core_z3_direct = matcher_namespace[
    "bank_clean_15_core_z3_direct"
]


def assert_pins() -> None:
    for path, expected in EXPECTED_PINS.items():
        actual = file_sha256(path)
        if actual != expected:
            raise RuntimeError(
                f"pinned source drift for {path.relative_to(ROOT)}: "
                f"expected {expected}, got {actual}"
            )


def source_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        PRIOR_DRIVER,
        PRIOR_CHECKPOINT,
        MATCHER_SOURCE,
        CORE_SOURCE,
        ROOT / "census/atail_force/producer_mus.py",
    )
    return {
        str(path.relative_to(ROOT)): file_sha256(path)
        for path in paths
    }


def atomic_write(path: Path, value: Mapping[str, object]) -> None:
    rendered = json.dumps(value, indent=2, sort_keys=True) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


def selected_rows_from_record(
    surface: Any, record: Mapping[str, object]
) -> tuple[Any, ...]:
    rows = []
    for named in record["rows"]:
        center = surface.by_name[str(named["center"])]
        support = frozenset(
            surface.by_name[str(name)] for name in named["support"]
        )
        index = int(named["candidate_index"])
        if support != surface.candidates[center][index]:
            raise RuntimeError("stored survivor candidate/support drift")
        rows.append(
            shadow.ClassRow(
                f"continuation:{center}", center, support, exact=False
            )
        )
    if {row.center for row in rows} != set(range(surface.frame.n)):
        raise RuntimeError("stored survivor does not have one row per center")
    return tuple(sorted(rows, key=lambda row: row.center))


def blockers_from_record(
    surface: Any, record: Mapping[str, object]
) -> dict[int, int]:
    return {
        surface.by_name[str(source)]: surface.by_name[str(center)]
        for source, center in record["blockers"].items()
    }


FIFTEEN_EQUALITIES = (
    ("A", "O", "A", "G"),
    ("A", "O", "A", "K"),
    ("F", "A", "F", "Z"),
    ("F", "A", "F", "K"),
    ("G", "X", "G", "E"),
    ("G", "X", "G", "K"),
    ("K", "O", "K", "Y"),
    ("K", "O", "K", "G"),
    ("O", "A", "O", "E"),
    ("X", "Z", "X", "G"),
    ("X", "Z", "X", "F"),
    ("Y", "O", "Y", "X"),
    ("Y", "O", "Y", "Z"),
    ("Z", "A", "Z", "Y"),
    ("Z", "A", "Z", "G"),
)


def independently_replay_edge_closure(
    rows: Sequence[Any], n: int, mapping: Mapping[str, int]
) -> dict[str, object]:
    """Replay Lean's finite ``EdgeClosure`` as an independent union graph."""

    parent = list(range(n * n))

    def find(item: int) -> int:
        while parent[item] != item:
            parent[item] = parent[parent[item]]
            item = parent[item]
        return item

    def union(left: int, right: int) -> None:
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    def edge(a: int, b: int) -> int:
        return a * n + b

    for a in range(n):
        for b in range(n):
            union(edge(a, b), edge(b, a))
    for row in rows:
        support = tuple(row.support)
        if not support:
            continue
        anchor = edge(row.center, support[0])
        for point in support[1:]:
            union(anchor, edge(row.center, point))

    if int(mapping["O"]) == int(mapping["A"]):
        raise RuntimeError("fifteen-core matcher violated O != A")
    failed = []
    for left_center, left_point, right_center, right_point in FIFTEEN_EQUALITIES:
        left = edge(int(mapping[left_center]), int(mapping[left_point]))
        right = edge(int(mapping[right_center]), int(mapping[right_point]))
        if find(left) != find(right):
            failed.append(
                [left_center, left_point, right_center, right_point]
            )
    if failed:
        raise RuntimeError(f"independent EdgeClosure replay failed: {failed}")
    return {
        "status": "PASS",
        "edge_universe": n * n,
        "row_count": len(rows),
        "equalities_checked": len(FIFTEEN_EQUALITIES),
        "O_ne_A": True,
    }


def fifteen_scan(
    surface: Any,
    rows: Sequence[Any],
    *,
    included_centers: frozenset[int] | None = None,
) -> dict[str, object] | None:
    """Run the pinned matcher with the corrected ambient-O semantics."""

    metric_rows = prior.metric_rows(
        surface,
        rows,
        included_centers=included_centers,
        exact_centers=frozenset(),
    )
    mapping = bank_clean_15_core(metric_rows, surface.frame.n)
    if mapping is None:
        return None
    mapping = {str(role): int(label) for role, label in mapping.items()}
    replay = independently_replay_edge_closure(
        metric_rows, surface.frame.n, mapping
    )
    direct = bank_clean_15_core_z3_direct(metric_rows, surface.frame.n)
    return {
        "stage": FIFTEEN_STAGE,
        "core": {"mapping": mapping},
        "orientation": "abstract-equality-closure",
        "lean_consumer": FIFTEEN_CONSUMER,
        "lean_source": str(CORE_SOURCE.relative_to(ROOT)),
        "lean_source_sha256": file_sha256(CORE_SOURCE),
        "requires_selected_row_exactness": False,
        "independent_edge_closure_replay": replay,
        "independent_direct_row_z3_has_some_embedding": direct is not None,
    }


def r_target_audit(surface: Any, rows: Sequence[Any]) -> dict[str, object]:
    """Audit the concrete represented erased pair q,w at strict-surplus rows."""

    by_center = {row.center: row for row in rows}
    q = surface.by_name[prior.robust.Q]
    w = surface.by_name[prior.robust.W]
    strict_names = prior.robust.SURPLUS_CAP - {
        prior.robust.FIRST_APEX,
        prior.robust.SECOND_APEX,
    }
    strict_centers = frozenset(surface.by_name[name] for name in strict_names)
    witnesses = []
    for center in sorted(strict_centers):
        row = by_center[center]
        if q in row.support and w in row.support:
            witnesses.append(
                {
                    "center": surface.by_label[center],
                    "support": sorted(
                        surface.by_label[point] for point in row.support
                    ),
                }
            )
    return {
        "represented_erased_coradial_pair": [
            prior.robust.Q,
            prior.robust.W,
        ],
        "strict_surplus_centers": sorted(strict_names),
        "holds": bool(witnesses),
        "witnesses": witnesses,
        "exactness_used": False,
        "map_contract": (
            "the corrected outer map explicitly searches the negation of "
            "this represented-pair capture target"
        ),
    }


def named_row_pattern(
    surface: Any,
    rows: Sequence[Any],
    centers: Iterable[int],
    choices: Mapping[int, int],
) -> list[dict[str, object]]:
    by_center = {row.center: row for row in rows}
    return [
        {
            "center": surface.by_label[center],
            "support": sorted(
                surface.by_label[point] for point in by_center[center].support
            ),
            "candidate_index": int(choices[center]),
        }
        for center in sorted(centers)
    ]


def fifteen_marco(
    surface: Any,
    rows: tuple[Any, ...],
    choices: Mapping[int, int],
    *,
    max_calls: int,
    max_cores: int,
    origin: Mapping[str, object],
) -> dict[str, object]:
    """Enumerate row-minimal fifteen-core cuts with fail-closed MARCO."""

    first_apex = surface.by_name[prior.robust.FIRST_APEX]
    universe = tuple(
        row.center
        for row in sorted(rows, key=lambda row: row.center)
        if row.center != first_apex
    )
    memo: dict[frozenset[int], tuple[str, dict[str, object] | None]] = {}

    def oracle(subset: frozenset[int]) -> str:
        try:
            match = fifteen_scan(
                surface, rows, included_centers=subset
            )
        except Exception:
            memo[subset] = ("UNKNOWN", None)
            return "UNKNOWN"
        verdict = "UNSAT" if match is not None else "SAT"
        memo[subset] = (verdict, match)
        return verdict

    result = MarcoEnumerator(
        universe,
        oracle,
        max_oracle_calls=max_calls,
        max_minimal_cores=max_cores,
        max_map_iterations=max_calls,
    ).run()
    if result.status == "UNKNOWN_FAIL_CLOSED":
        raise RuntimeError(
            f"fifteen-core MARCO oracle returned UNKNOWN: {result.unknown_subset}"
        )

    cuts = []
    deletion_count = 0
    for core in result.minimal_cores:
        centers = frozenset(int(center) for center in core.atoms)
        match = fifteen_scan(
            surface, rows, included_centers=centers
        )
        if match is None:
            raise RuntimeError("fifteen-core MARCO result failed rescan")
        deletion_scans = []
        for removed in sorted(centers):
            remaining = centers - {removed}
            deletion_match = fifteen_scan(
                surface, rows, included_centers=remaining
            )
            deletion_scans.append(
                {
                    "removed_center": surface.by_label[removed],
                    "match": deletion_match is not None,
                }
            )
            deletion_count += 1
        if any(item["match"] for item in deletion_scans):
            raise RuntimeError("fifteen-core MARCO cut is not row-minimal")
        cuts.append(
            {
                "cut_family": FIFTEEN_STAGE,
                "origin": dict(origin),
                "row_pattern": {
                    str(center): int(choices[center])
                    for center in sorted(centers)
                },
                "row_pattern_named": named_row_pattern(
                    surface, rows, centers, choices
                ),
                "required_exact_centers": [],
                "required_exact_center_names": [],
                "lean_consumer": FIFTEEN_CONSUMER,
                "match": match,
                "marco": {
                    "discovery_index": core.discovery_index,
                    "center_ids": sorted(centers),
                    "center_labels": [
                        surface.by_label[center] for center in sorted(centers)
                    ],
                    "single_row_deletion_scans": deletion_scans,
                },
            }
        )
    return {
        "status": result.status,
        "oracle_calls": result.oracle_calls,
        "cache_hits": result.cache_hits,
        "map_iterations": result.map_iterations,
        "minimal_core_count": len(cuts),
        "single_row_deletions": deletion_count,
        "cuts": cuts,
    }


def cut_key(record: Mapping[str, object]) -> str:
    return canonical_sha256(
        {
            "family": record.get("cut_family", "legacy-formalized-bank"),
            "row_pattern": record["row_pattern"],
            "required_exact_centers": record.get(
                "required_exact_centers", []
            ),
        }
    )


def append_new_cuts(
    state: dict[str, object], records: Iterable[Mapping[str, object]]
) -> int:
    seen = {cut_key(record) for record in state["new_bank_cuts"]}
    added = 0
    for record in records:
        normalized = dict(record)
        key = cut_key(normalized)
        if key in seen:
            continue
        normalized["cut_sha256"] = key
        state["new_bank_cuts"].append(normalized)
        seen.add(key)
        added += 1
    return added


def preflight() -> dict[str, object]:
    """Reconstruct the predecessor and the new matcher before any search."""

    assert_pins()
    prior_audit = prior.check_checkpoint(PRIOR_CHECKPOINT)
    expected_prior = {
        "checked_bank_cuts": 524,
        "checked_single_row_deletions": 1799,
        "checked_structural_survivors": 101,
        "survivors_satisfying_sharpened_target": 0,
        "survivors_avoiding_sharpened_target": 101,
    }
    if prior_audit != expected_prior:
        raise RuntimeError(f"predecessor replay drift: {prior_audit}")

    payload = json.loads(PRIOR_CHECKPOINT.read_text(encoding="utf-8"))
    surface = prior.robust.Surface()
    ambient_hits = []
    direct_hits = []
    target_hits = []
    exact_only_matches = 0
    for index, record in enumerate(payload["structural_survivors"]):
        rows = selected_rows_from_record(surface, record)
        blockers = blockers_from_record(surface, record)
        decoded = surface.rows_with_blocker_exactness(rows, blockers)
        ok, reason = surface.verify_model(decoded, blockers)
        if not ok:
            raise RuntimeError(
                f"predecessor survivor {index} failed structural replay: {reason}"
            )
        exact_names = sorted(
            surface.by_label[center] for center in set(blockers.values())
        )
        if exact_names != sorted(record["exact_center_names"]):
            raise RuntimeError("blocker-image exactness semantics drift")
        exact_only_matches += len(record["blocker_exact_only_matches"])
        match = fifteen_scan(surface, decoded)
        if match is not None:
            ambient_hits.append(index)
        metric_rows = prior.metric_rows(
            surface, decoded, exact_centers=frozenset()
        )
        if bank_clean_15_core_z3_direct(metric_rows, surface.frame.n) is not None:
            direct_hits.append(index)
        if r_target_audit(surface, decoded)["holds"]:
            target_hits.append(index)

    expected_ambient_hits = [13, 14, 15, 18, 47, 61, 62, 98, 100]
    if ambient_hits != expected_ambient_hits:
        raise RuntimeError(f"ambient fifteen-core hit drift: {ambient_hits}")
    if direct_hits != [98, 100]:
        raise RuntimeError(f"direct-row fifteen-core hit drift: {direct_hits}")
    if target_hits:
        raise RuntimeError(
            f"target-negated predecessor contains target hits: {target_hits}"
        )
    terminal = payload["structural_survivors"][-1]
    if terminal["row_assignment_sha256"] != (
        "f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66"
    ):
        raise RuntimeError("terminal predecessor row identity drift")
    return {
        "prior_checkpoint_sha256": file_sha256(PRIOR_CHECKPOINT),
        "prior_checkpoint_replay": prior_audit,
        "ambient_exact_first_apex_class": sorted(
            prior.robust.FIRST_APEX_CLASS
        ),
        "arbitrary_global_rows_exact": False,
        "blocker_image_exact_only_match_records": exact_only_matches,
        "fifteen_core_ambient_semantics_hit_indices": ambient_hits,
        "fifteen_core_direct_row_hit_indices": direct_hits,
        "terminal_100_independent_edge_closure_replay": "PASS",
        "represented_R_target_hit_indices": target_hits,
        "lean_consumer": {
            "name": FIFTEEN_CONSUMER,
            "source": str(CORE_SOURCE.relative_to(ROOT)),
            "source_sha256": file_sha256(CORE_SOURCE),
            "kernel_status": "KERNEL_CHECKED_UPSTREAM_GATE",
            "axiom_status": "STANDARD_AXIOMS_ONLY_UPSTREAM_GATE",
        },
    }


def initial_state(args: argparse.Namespace) -> dict[str, object]:
    return {
        "schema": SCHEMA,
        "status": "RUNNING_FAIL_CLOSED",
        "source_sha256": source_hashes(),
        "budgets": {
            "max_iterations": args.max_iterations,
            "wall_seconds": args.wall_seconds,
            "marco_max_calls": args.marco_max_calls,
            "marco_max_cores": args.marco_max_cores,
            "max_nodes_per_iteration": args.max_nodes_per_iteration,
        },
        "preflight": preflight(),
        "prior_bank_cut_count": 524,
        "prior_structural_survivor_count": 101,
        "iterations": 0,
        "new_bank_cuts": [],
        "new_structural_survivors": [],
        "events": [],
        "epistemic_status": {
            "fifteen_core_cut": (
                "KERNEL_CHECKED_LEAN_CONSUMER_PLUS_INDEPENDENT_FINITE_"
                "EDGECLOSURE_REPLAY"
            ),
            "map": "FIXED_14_LABEL_TARGET_NEGATED_STRUCTURAL_ABSTRACTION",
            "outer_unsat": "EXACT_ONLY_WITHIN_FIXED_FINITE_ABSTRACTION",
            "outer_sat": "INDEPENDENTLY_VERIFIED_STRUCTURAL_RESIDUAL_ONLY",
            "R_target": (
                "REPRESENTED_PAIR_CAPTURE_IS_EXPLICITLY_NEGATED_BY_MAP_"
                "CONTRACT"
            ),
        },
    }


def combined_cuts(
    prior_payload: Mapping[str, object], state: Mapping[str, object]
) -> list[Mapping[str, object]]:
    return [*prior_payload["bank_cuts"], *state["new_bank_cuts"]]


def add_legacy_cuts(
    surface: Any,
    state: dict[str, object],
    rows: tuple[Any, ...],
    choices: Mapping[int, int],
    blockers: Mapping[int, int],
    *,
    selected_matches: Sequence[Mapping[str, object]],
    exact_matches: Sequence[Mapping[str, object]],
    iteration: int,
    args: argparse.Namespace,
) -> int:
    if selected_matches:
        exact_centers = frozenset()
        matches = selected_matches
    elif exact_matches:
        exact_centers = frozenset(blockers.values())
        matches = exact_matches
    else:
        return 0
    marco = prior.marco_row_cores(
        surface,
        rows,
        exact_centers=exact_centers,
        max_calls=args.marco_max_calls,
        max_cores=args.marco_max_cores,
    )
    holder: dict[str, object] = {"bank_cuts": []}
    prior.add_core_cuts(
        surface,
        None,
        holder,
        rows,
        choices,
        marco,
        exact_centers=exact_centers,
        iteration=iteration,
    )
    records = []
    for record in holder["bank_cuts"]:
        copy = dict(record)
        copy["cut_family"] = "legacy-formalized-producer-bank"
        copy["origin"] = {"continuation_iteration": iteration}
        records.append(copy)
    added = append_new_cuts(state, records)
    if added:
        state["events"].append(
            {
                "iteration": iteration,
                "kind": "legacy_formalized_bank_refinement",
                "cuts_added": added,
                "full_match_count": len(matches),
                "marco_status": marco["status"],
            }
        )
    return added


def full_assignment_fallback(
    surface: Any,
    rows: tuple[Any, ...],
    choices: Mapping[int, int],
    *,
    iteration: int,
    matches: Sequence[Mapping[str, object]],
) -> dict[str, object]:
    first_apex = surface.by_name[prior.robust.FIRST_APEX]
    centers = tuple(row.center for row in rows if row.center != first_apex)
    return {
        "cut_family": "sound-full-assignment-fallback",
        "origin": {"continuation_iteration": iteration},
        "row_pattern": {
            str(center): int(choices[center]) for center in centers
        },
        "row_pattern_named": named_row_pattern(
            surface, rows, centers, choices
        ),
        "required_exact_centers": [],
        "required_exact_center_names": [],
        "fallback_full_assignment": True,
        "matches": list(matches),
    }


def run(args: argparse.Namespace) -> dict[str, object]:
    if args.output.exists() and not args.resume:
        raise RuntimeError(
            f"refusing to overwrite {args.output}; pass --resume or choose --output"
        )
    assert_pins()
    prior_payload = json.loads(PRIOR_CHECKPOINT.read_text(encoding="utf-8"))
    surface = prior.robust.Surface()
    if args.resume:
        state = json.loads(args.output.read_text(encoding="utf-8"))
        if state.get("schema") != SCHEMA:
            raise RuntimeError("continuation checkpoint schema drift")
        if state.get("source_sha256") != source_hashes():
            raise RuntimeError("continuation checkpoint source drift")
        if state.get("budgets") != initial_state(args)["budgets"]:
            raise RuntimeError("continuation checkpoint budget drift")
        if state["status"] != "RUNNING_FAIL_CLOSED":
            return state
    else:
        state = initial_state(args)
        terminal = prior_payload["structural_survivors"][-1]
        terminal_rows = selected_rows_from_record(surface, terminal)
        terminal_choices = {
            surface.by_name[str(named["center"])]: int(named["candidate_index"])
            for named in terminal["rows"]
        }
        seed = fifteen_marco(
            surface,
            terminal_rows,
            terminal_choices,
            max_calls=args.marco_max_calls,
            max_cores=args.marco_max_cores,
            origin={"prior_survivor_index": 100, "prior_iteration": 101},
        )
        if not seed["cuts"]:
            raise RuntimeError(
                f"fifteen-core seed MARCO made no progress: {seed['status']}"
            )
        added = append_new_cuts(state, seed["cuts"])
        state["seed_fifteen_core_marco"] = {
            key: value for key, value in seed.items() if key != "cuts"
        }
        state["events"].append(
            {
                "kind": "seed_terminal_100_fifteen_core",
                "cuts_added": added,
                "marco_status": seed["status"],
            }
        )
        atomic_write(args.output, state)

    started = time.monotonic()
    start_iteration = int(state["iterations"]) + 1
    for iteration in range(start_iteration, args.max_iterations + 1):
        state["iterations"] = iteration
        if time.monotonic() - started > args.wall_seconds:
            state["status"] = "WALL_BUDGET_FAIL_CLOSED"
            state["events"].append(
                {"iteration": iteration, "kind": "wall_budget"}
            )
            atomic_write(args.output, state)
            return state

        cuts = combined_cuts(prior_payload, state)
        candidate = prior.dfs_candidate(
            surface,
            cuts,
            max_nodes=args.max_nodes_per_iteration,
        )
        if candidate["status"] == "UNSAT_EXHAUSTIVE_FINITE_DFS":
            state["status"] = "MAP_UNSAT_EXHAUSTIVE_FIXED_TARGET_NEGATED_DFS"
            state["terminal"] = candidate
            atomic_write(args.output, state)
            return state
        if candidate["status"] != "SAT":
            state["status"] = f"MAP_{candidate['status']}"
            state["terminal"] = candidate
            atomic_write(args.output, state)
            return state

        rows = tuple(candidate["rows"])
        blockers = dict(candidate["blockers"])
        choices = dict(candidate["choices"])
        ok, reason = surface.verify_model(rows, blockers)
        if not ok:
            raise RuntimeError(f"continuation candidate failed verifier: {reason}")
        selected_matches = prior.scan(
            surface, rows, exact_centers=frozenset()
        )
        exact_centers = frozenset(blockers.values())
        exact_matches = prior.scan(
            surface, rows, exact_centers=exact_centers
        )
        fifteen_match = fifteen_scan(surface, rows)
        target = r_target_audit(surface, rows)
        if target["holds"]:
            state["status"] = "SAT_CONCRETE_R_TARGET_ENCODING_DRIFT"
            state["terminal"] = {
                "reason": "target-negated map returned a target witness",
                "target": target,
            }
            atomic_write(args.output, state)
            return state

        serialized_rows = prior.named_rows(surface, rows, choices)
        serialized_blockers = prior.named_blockers(surface, blockers)
        survivor = {
            "continuation_iteration": iteration,
            "dfs_nodes": candidate["nodes"],
            "rows": serialized_rows,
            "blockers": serialized_blockers,
            "exact_center_names": sorted(
                surface.by_label[center] for center in exact_centers
            ),
            "row_assignment_sha256": canonical_sha256(serialized_rows),
            "blocker_assignment_sha256": canonical_sha256(serialized_blockers),
            "selected_row_bank_matches": list(selected_matches),
            "blocker_exact_bank_matches": list(exact_matches),
            "fifteen_core_match": fifteen_match,
            "represented_R_target": target,
        }
        state["new_structural_survivors"].append(survivor)

        added = add_legacy_cuts(
            surface,
            state,
            rows,
            choices,
            blockers,
            selected_matches=selected_matches,
            exact_matches=exact_matches,
            iteration=iteration,
            args=args,
        )
        if fifteen_match is not None:
            fifteen = fifteen_marco(
                surface,
                rows,
                choices,
                max_calls=args.marco_max_calls,
                max_cores=args.marco_max_cores,
                origin={"continuation_iteration": iteration},
            )
            fifteen_added = append_new_cuts(state, fifteen["cuts"])
            added += fifteen_added
            state["events"].append(
                {
                    "iteration": iteration,
                    "kind": "fifteen_core_refinement",
                    "cuts_added": fifteen_added,
                    "marco_status": fifteen["status"],
                    "oracle_calls": fifteen["oracle_calls"],
                    "single_row_deletions": fifteen["single_row_deletions"],
                }
            )

        all_matches: list[Mapping[str, object]] = [
            *selected_matches,
            *exact_matches,
        ]
        if fifteen_match is not None:
            all_matches.append(fifteen_match)
        if all_matches and added == 0:
            fallback = full_assignment_fallback(
                surface,
                rows,
                choices,
                iteration=iteration,
                matches=all_matches,
            )
            added += append_new_cuts(state, [fallback])
        if all_matches and added == 0:
            state["status"] = "PROGRESS_INVARIANT_FAILURE"
            state["terminal"] = {"iteration": iteration}
            atomic_write(args.output, state)
            return state

        if all_matches:
            state["events"].append(
                {
                    "iteration": iteration,
                    "kind": "banked_candidate",
                    "cuts_added": added,
                    "selected_match_count": len(selected_matches),
                    "exact_match_count": len(exact_matches),
                    "fifteen_match": fifteen_match is not None,
                    "dfs_nodes": candidate["nodes"],
                    "represented_R_target": False,
                }
            )
            atomic_write(args.output, state)
            print(
                f"iteration {iteration}: cuts={added} nodes={candidate['nodes']} "
                f"old={len(selected_matches)}/{len(exact_matches)} "
                f"fifteen={fifteen_match is not None} R-target=false",
                flush=True,
            )
            continue

        state["status"] = "SAT_NEXT_INDEPENDENTLY_VERIFIED_BANK_CLEAN_RESIDUAL"
        state["terminal"] = {
            "continuation_iteration": iteration,
            "dfs_nodes": candidate["nodes"],
            "row_assignment_sha256": canonical_sha256(serialized_rows),
            "blocker_assignment_sha256": canonical_sha256(serialized_blockers),
            "independent_structural_verifier": "PASS",
            "selected_row_bank_scan": [],
            "blocker_exact_bank_scan": [],
            "fifteen_core_scan": None,
            "represented_R_target": target,
            "rows": serialized_rows,
            "blockers": serialized_blockers,
        }
        atomic_write(args.output, state)
        return state

    state["status"] = "MAP_ITERATION_BUDGET_FAIL_CLOSED"
    atomic_write(args.output, state)
    return state


def check_checkpoint(path: Path, args: argparse.Namespace) -> dict[str, object]:
    assert_pins()
    checkpoint = json.loads(path.read_text(encoding="utf-8"))
    if checkpoint.get("schema") != SCHEMA:
        raise RuntimeError("continuation checkpoint schema drift")
    if checkpoint.get("source_sha256") != source_hashes():
        raise RuntimeError("continuation checkpoint source drift")
    prior_payload = json.loads(PRIOR_CHECKPOINT.read_text(encoding="utf-8"))
    surface = prior.robust.Surface()

    checked_cuts = 0
    checked_deletions = 0
    for record in checkpoint["new_bank_cuts"]:
        pattern = {
            int(center): int(index)
            for center, index in record["row_pattern"].items()
        }
        rows = []
        for named in record["row_pattern_named"]:
            center = surface.by_name[str(named["center"])]
            support = frozenset(
                surface.by_name[str(name)] for name in named["support"]
            )
            if support != surface.candidates[center][pattern[center]]:
                raise RuntimeError("new bank cut row/support drift")
            rows.append(
                shadow.ClassRow(f"check:{center}", center, support, False)
            )
        rows_tuple = tuple(rows)
        family = record["cut_family"]
        if family == FIFTEEN_STAGE:
            match = fifteen_scan(
                surface,
                rows_tuple,
                included_centers=frozenset(pattern),
            )
            if match is None:
                raise RuntimeError("stored fifteen-core cut failed rescan")
            for removed in pattern:
                remaining = tuple(
                    row for row in rows_tuple if row.center != removed
                )
                if fifteen_scan(
                    surface,
                    remaining,
                    included_centers=frozenset(pattern) - {removed},
                ) is not None:
                    raise RuntimeError("stored fifteen-core cut lost minimality")
                checked_deletions += 1
        elif family == "legacy-formalized-producer-bank":
            exact = frozenset(
                int(center)
                for center in record.get("required_exact_centers", [])
            )
            if not prior.scan(surface, rows_tuple, exact_centers=exact):
                raise RuntimeError("stored legacy continuation cut failed rescan")
            if "marco_core" in record:
                for removed in pattern:
                    remaining = tuple(
                        row for row in rows_tuple if row.center != removed
                    )
                    if prior.scan(
                        surface,
                        remaining,
                        exact_centers=exact - {removed},
                    ):
                        raise RuntimeError(
                            "stored legacy continuation cut lost minimality"
                        )
                    checked_deletions += 1
        elif family == "sound-full-assignment-fallback":
            if not record.get("matches"):
                raise RuntimeError("fallback cut lost its sound match")
        else:
            raise RuntimeError(f"unknown continuation cut family: {family}")
        checked_cuts += 1

    checked_survivors = 0
    target_hits = 0
    for record in checkpoint["new_structural_survivors"]:
        rows = selected_rows_from_record(surface, record)
        blockers = blockers_from_record(surface, record)
        decoded = surface.rows_with_blocker_exactness(rows, blockers)
        ok, reason = surface.verify_model(decoded, blockers)
        if not ok:
            raise RuntimeError(f"new survivor failed verifier: {reason}")
        selected = prior.scan(surface, decoded, exact_centers=frozenset())
        exact = prior.scan(
            surface,
            decoded,
            exact_centers=frozenset(blockers.values()),
        )
        if list(selected) != record["selected_row_bank_matches"]:
            raise RuntimeError("new survivor selected bank scan drift")
        if list(exact) != record["blocker_exact_bank_matches"]:
            raise RuntimeError("new survivor exact bank scan drift")
        fifteen = fifteen_scan(surface, decoded)
        if (fifteen is None) != (record["fifteen_core_match"] is None):
            raise RuntimeError("new survivor fifteen-core scan drift")
        target = r_target_audit(surface, decoded)
        if target != record["represented_R_target"]:
            raise RuntimeError("new survivor R-target audit drift")
        target_hits += int(bool(target["holds"]))
        checked_survivors += 1

    terminal = checkpoint.get("terminal", {})
    if checkpoint["status"] == (
        "SAT_NEXT_INDEPENDENTLY_VERIFIED_BANK_CLEAN_RESIDUAL"
    ):
        if terminal.get("selected_row_bank_scan") != []:
            raise RuntimeError("terminal selected-row scan is not empty")
        if terminal.get("blocker_exact_bank_scan") != []:
            raise RuntimeError("terminal exact-row scan is not empty")
        if terminal.get("fifteen_core_scan") is not None:
            raise RuntimeError("terminal fifteen-core scan is not empty")
    elif checkpoint["status"] == (
        "MAP_UNSAT_EXHAUSTIVE_FIXED_TARGET_NEGATED_DFS"
    ):
        replay = prior.dfs_candidate(
            surface,
            combined_cuts(prior_payload, checkpoint),
            max_nodes=args.max_nodes_per_iteration,
        )
        if replay["status"] != "UNSAT_EXHAUSTIVE_FINITE_DFS":
            raise RuntimeError(f"terminal map-UNSAT replay drift: {replay}")

    return {
        "prior_checkpoint_replay": preflight()["prior_checkpoint_replay"],
        "checked_new_bank_cuts": checked_cuts,
        "checked_new_cut_single_row_deletions": checked_deletions,
        "checked_new_structural_survivors": checked_survivors,
        "represented_R_target_hits": target_hits,
        "terminal_status": checkpoint["status"],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=CHECKPOINT)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--max-iterations", type=int, default=128)
    parser.add_argument("--wall-seconds", type=float, default=300.0)
    parser.add_argument("--marco-max-calls", type=int, default=160)
    parser.add_argument("--marco-max-cores", type=int, default=12)
    parser.add_argument("--max-nodes-per-iteration", type=int, default=5_000_000)
    args = parser.parse_args()
    if min(
        args.max_iterations,
        args.wall_seconds,
        args.marco_max_calls,
        args.marco_max_cores,
        args.max_nodes_per_iteration,
    ) <= 0:
        raise SystemExit("all budgets must be positive")
    try:
        if args.check:
            audit = check_checkpoint(args.output, args)
            print(
                "PASS: replayed corrected predecessor, extended cuts, "
                f"survivors, and terminal: {json.dumps(audit, sort_keys=True)}"
            )
            return 0
        state = run(args)
    except RuntimeError as error:
        raise SystemExit(str(error)) from error
    print(
        f"{state['status']}: continuation_iterations={state['iterations']} "
        f"new_cuts={len(state['new_bank_cuts'])} "
        f"new_survivors={len(state['new_structural_survivors'])}",
        flush=True,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
