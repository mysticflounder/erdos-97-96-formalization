#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Producer-bank CEGAR on the corrected fixed 14-role robust surface.

The ambient five-point first-apex class is always present and exact.  A
global K4 row is only a selected equal-distance class.  It is marked exact
only when its center lies in the image of the decoded blocker map.  This
distinction is load-bearing for ``equality-exact-off-circle`` and is recorded
in every cut.

The map is structural Z3 plus an independent finite-shadow verifier.  A
verified structural witness is scanned against every currently formalized
producer-bank matcher.  MARCO enumerates several row-minimal bank hits from
that witness, and only matcher hits with named Lean consumers become cuts.
Every refinement is written atomically.  Any timeout, scan failure, budget,
or source drift stops fail-closed.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import sys
import time
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ROBUST_SEARCH = HERE.parent / "robust-all-center-cegar" / "search.py"
CHECKPOINT = HERE / "bank_cegar_checkpoint.json"

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank  # noqa: E402
from census.atail_force.producer_mus import MarcoEnumerator  # noqa: E402
from census.global_confinement import shadow  # noqa: E402


SCHEMA = "p97-atail-robust-all-center-bank-cegar-v1"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


robust = load_module(ROBUST_SEARCH, "p97_robust_all_center_corrected")


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def source_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        ROBUST_SEARCH,
        ROOT / "census/atail_force/producer_bank.py",
        ROOT / "census/atail_force/producer_mus.py",
        ROOT / "census/global_confinement/shadow.py",
        ROOT / "census/multi_center/multi_center_census.py",
        ROOT / "scratch/atail-force/common_system_metric_probe.py",
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


def semantic_match_key(match: Mapping[str, object]) -> str:
    return json.dumps(
        {
            "stage": match["stage"],
            "core": match["core"],
            "orientation": match["orientation"],
            "lean_consumer": match["lean_consumer"],
        },
        sort_keys=True,
        separators=(",", ":"),
    )


def named_rows(
    surface: Any,
    rows: Iterable[Any],
    choices: Mapping[int, int],
) -> list[dict[str, object]]:
    return [
        {
            "center": surface.by_label[row.center],
            "support": sorted(surface.by_label[point] for point in row.support),
            "candidate_index": choices[row.center],
            "exact_from_blocker_image": row.exact,
        }
        for row in sorted(rows, key=lambda item: surface.by_label[item.center])
    ]


def named_blockers(surface: Any, blockers: Mapping[int, int]) -> dict[str, str]:
    return {
        surface.by_label[source]: surface.by_label[center]
        for source, center in sorted(
            blockers.items(), key=lambda item: surface.by_label[item[0]]
        )
    }


def sharpened_live_target_audit(
    surface: Any, rows: Iterable[Any]
) -> dict[str, object]:
    """Audit the one-row outside-pair route without any ambient exactness."""

    by_center = {row.center: row for row in rows}
    q = surface.by_name[robust.Q]
    q_blocker = surface.by_name["D"]
    marginal = frozenset(surface.by_name[name] for name in robust.MARGINAL)
    strict_surplus_names = robust.SURPLUS_CAP - {
        robust.FIRST_APEX,
        robust.SECOND_APEX,
    }
    strict_surplus = frozenset(
        surface.by_name[name] for name in strict_surplus_names
    )
    eligible = by_center[q_blocker].support & strict_surplus
    witnesses = []
    for center in sorted(eligible):
        row = by_center[center]
        marginal_hits = row.support & marginal
        fresh = marginal_hits - {q}
        if q in row.support and len(marginal_hits) >= 2:
            witnesses.append(
                {
                    "center": surface.by_label[center],
                    "fresh_marginal_points": sorted(
                        surface.by_label[point] for point in fresh
                    ),
                    "row_support": sorted(
                        surface.by_label[point] for point in row.support
                    ),
                }
            )
    return {
        "q": robust.Q,
        "w": robust.W,
        "fresh_role_J_distinct_from_w": robust.W != "J",
        "marginal": sorted(robust.MARGINAL),
        "strict_surplus": sorted(strict_surplus_names),
        "eligible_q_blocker_support_centers": sorted(
            surface.by_label[center] for center in eligible
        ),
        "holds": bool(witnesses),
        "witnesses": witnesses,
        "exactness_used": False,
    }


def metric_rows(
    surface: Any,
    rows: Iterable[Any],
    *,
    included_centers: frozenset[int] | None = None,
    exact_centers: frozenset[int] = frozenset(),
) -> tuple[producer_bank.MetricRow, ...]:
    """Use the ambient O class plus any requested selected global rows."""

    ambient = surface.ambient_first_apex_row()
    o = surface.by_name[robust.FIRST_APEX]
    answer = [
        producer_bank.MetricRow(
            ambient.center, tuple(sorted(ambient.support)), exact=True
        )
    ]
    for row in sorted(rows, key=lambda item: item.center):
        if row.center == o:
            continue
        if included_centers is not None and row.center not in included_centers:
            continue
        answer.append(
            producer_bank.MetricRow(
                row.center,
                tuple(sorted(row.support)),
                exact=row.center in exact_centers,
            )
        )
    return tuple(answer)


def scan(
    surface: Any,
    rows: Iterable[Any],
    *,
    included_centers: frozenset[int] | None = None,
    exact_centers: frozenset[int] = frozenset(),
) -> tuple[dict[str, object], ...]:
    found = producer_bank.scan_all_formalized_cores(
        metric_rows(
            surface,
            rows,
            included_centers=included_centers,
            exact_centers=exact_centers,
        ),
        surface.frame.n,
        shadow.hull_order(surface.frame),
    )
    for match in found:
        consumer = match.get("lean_consumer")
        if not isinstance(consumer, str) or not consumer:
            raise RuntimeError("producer-bank matcher returned no Lean consumer")
    return tuple(dict(match) for match in found)


def marco_row_cores(
    surface: Any,
    rows: tuple[Any, ...],
    *,
    exact_centers: frozenset[int],
    max_calls: int,
    max_cores: int,
) -> dict[str, object]:
    o = surface.by_name[robust.FIRST_APEX]
    universe = tuple(
        row.center for row in sorted(rows, key=lambda item: item.center)
        if row.center != o
    )
    call_ledger: list[dict[str, object]] = []

    def oracle(subset: frozenset[int]) -> str:
        try:
            matches = scan(
                surface,
                rows,
                included_centers=subset,
                exact_centers=exact_centers & subset,
            )
        except Exception as error:  # fail closed at the matcher boundary
            call_ledger.append(
                {
                    "centers": [surface.by_label[center] for center in sorted(subset)],
                    "classification": "UNKNOWN",
                    "error": f"{type(error).__name__}: {error}",
                }
            )
            return "UNKNOWN"
        call_ledger.append(
            {
                "centers": [surface.by_label[center] for center in sorted(subset)],
                "classification": "UNSAT" if matches else "SAT",
                "match_count": len(matches),
                "match_sha256": canonical_sha256(list(matches)),
            }
        )
        return "UNSAT" if matches else "SAT"

    result = MarcoEnumerator(
        universe,
        oracle,
        max_oracle_calls=max_calls,
        max_minimal_cores=max_cores,
        max_map_iterations=max_calls,
    ).run()
    cores = []
    for core in result.minimal_cores:
        centers = frozenset(core.atoms)
        matches = scan(
            surface,
            rows,
            included_centers=centers,
            exact_centers=exact_centers & centers,
        )
        if not matches:
            raise RuntimeError("MARCO core failed independent bank rescan")
        deletion_scans = []
        for removed in core.atoms:
            remaining = centers - {removed}
            deletion_matches = scan(
                surface,
                rows,
                included_centers=remaining,
                exact_centers=exact_centers & remaining,
            )
            deletion_scans.append(
                {
                    "removed_center": surface.by_label[removed],
                    "bank_match_count": len(deletion_matches),
                }
            )
        if any(item["bank_match_count"] for item in deletion_scans):
            raise RuntimeError("MARCO core failed row-minimality rescan")
        cores.append(
            {
                "discovery_index": core.discovery_index,
                "center_labels": [surface.by_label[center] for center in core.atoms],
                "center_ids": list(core.atoms),
                "matches": list(matches),
                "single_row_deletion_scans": deletion_scans,
            }
        )
    return {
        "status": result.status,
        "minimal_cores": cores,
        "oracle_calls": result.oracle_calls,
        "cache_hits": result.cache_hits,
        "map_iterations": result.map_iterations,
        "unknown_subset": (
            [surface.by_label[center] for center in result.unknown_subset]
            if result.unknown_subset is not None
            else None
        ),
        "oracle_call_ledger": call_ledger,
    }


def clause_for_structural_refinement(
    surface: Any,
    record: Mapping[str, object],
) -> z3.BoolRef:
    choices = {int(center): int(index) for center, index in record["choices"].items()}
    return z3.Or(
        *(surface.choice[center] != index for center, index in choices.items())
    )


def clause_for_bank_cut(surface: Any, record: Mapping[str, object]) -> z3.BoolRef:
    row_pattern = {
        int(center): int(index) for center, index in record["row_pattern"].items()
    }
    disjuncts: list[z3.BoolRef] = [
        surface.choice[center] != index for center, index in row_pattern.items()
    ]
    for center in record.get("required_exact_centers", []):
        center = int(center)
        disjuncts.append(
            z3.And(
                *(variable != center for variable in surface.blocker.values())
            )
        )
    return z3.Or(*disjuncts)


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
        "iterations": 0,
        "structural_refinements": [],
        "bank_cuts": [],
        "bank_witnesses_rejected": 0,
        "structural_survivors": [],
        "last_event": "initialized",
        "epistemic_status": {
            "map": "FINITE_STRUCTURAL_Z3_WITH_INDEPENDENT_VERIFIER",
            "bank_cuts": "FORMALIZED_CONSUMER_MATCHES_DISCOVERED_BY_PYTHON_MATCHERS",
            "exactness": "AMBIENT_O_PLUS_ACTUAL_BLOCKER_IMAGE_ONLY",
            "terminal_unsat": "UNTRUSTED_Z3_UNSAT_UNLESS_INDEPENDENTLY_EXHAUSTED",
        },
    }


class DfsMapUnknown(RuntimeError):
    pass


def dfs_candidate(
    surface: Any,
    bank_cuts: Sequence[Mapping[str, object]],
    *,
    max_nodes: int,
) -> dict[str, object]:
    """Find one structural assignment avoiding all previously banked cuts."""

    o = surface.by_name[robust.FIRST_APEX]
    q = surface.by_name[robust.Q]
    w = surface.by_name[robust.W]
    ambient = surface.ambient_first_apex_row()
    fixed_rows = []
    variable_rows = []
    for center in range(surface.frame.n):
        name = surface.by_label[center]
        if name in robust.FIXED_LOCAL_ROWS:
            fixed_rows.append(
                shadow.ClassRow(
                    f"global:{center}",
                    center,
                    surface.candidates[center][0],
                    exact=False,
                )
            )
            continue
        candidates = tuple(
            support
            for support in surface.candidates[center]
            if (
                name not in robust.ROBUST_SUPPORT_CENTERS
                or not ({q, w} <= set(support))
            )
            and shadow.rows_compatible(
                surface.frame,
                ambient,
                shadow.ClassRow(
                    f"candidate:{center}", center, support, exact=False
                ),
            )
        )
        variable_rows.append(
            shadow.VariableRow(
                f"global:{center}", center, candidates, exact=False
            )
        )

    selected_cuts = [
        record for record in bank_cuts if not record.get("required_exact_centers")
    ]
    found: dict[str, object] = {}

    def prefix_compatible(rows: Sequence[Any]) -> bool:
        by_center = {row.center: row for row in rows}
        if any(
            not shadow.rows_compatible(surface.frame, ambient, row)
            for row in rows
            if row.center != o
        ):
            return False
        actual = (ambient, *(row for row in rows if row.center != o))
        for first in range(surface.frame.n):
            for second in range(first + 1, surface.frame.n):
                centers = {
                    row.center
                    for row in actual
                    if first in row.support and second in row.support
                }
                if len(centers) > 2:
                    return False
        for cut in selected_cuts:
            pattern = {
                int(center): int(index)
                for center, index in cut["row_pattern"].items()
            }
            if not set(pattern) <= set(by_center):
                continue
            if all(
                by_center[center].support
                == surface.candidates[center][index]
                for center, index in pattern.items()
            ):
                return False
        return True

    def complete_compatible(rows: Sequence[Any]) -> bool:
        covered = set().union(
            *(set(row.support) for row in rows if row.center != o)
        )
        if not set(range(surface.frame.n)) <= covered:
            return False
        by_center = {row.center: row for row in rows}
        choices = {
            center: surface.candidates[center].index(row.support)
            for center, row in by_center.items()
        }
        solver = surface.base_solver()
        for center, index in choices.items():
            solver.add(surface.choice[center] == index)
        for cut in bank_cuts:
            solver.add(clause_for_bank_cut(surface, cut))
        verdict = solver.check()
        if verdict == z3.unknown:
            raise DfsMapUnknown(solver.reason_unknown())
        if verdict == z3.unsat:
            return False
        model = solver.model()
        blockers = surface.blockers_from_model(model)
        decoded = surface.rows_with_blocker_exactness(
            surface.rows_from_model(model), blockers
        )
        ok, reason = surface.verify_model(decoded, blockers)
        if not ok:
            raise RuntimeError(f"forced DFS assignment failed verifier: {reason}")
        found.update(
            {
                "rows": decoded,
                "blockers": blockers,
                "choices": surface.row_choice_indices(model),
            }
        )
        return True

    try:
        result = shadow.solve_rows(
            surface.frame,
            set(robust.mc.PROVEN_ROWS),
            fixed_rows=fixed_rows,
            variable_rows=variable_rows,
            max_nodes=max_nodes,
            want_assignment=False,
            prefix_compatible=prefix_compatible,
            complete_compatible=complete_compatible,
        )
    except DfsMapUnknown as error:
        return {
            "status": "UNKNOWN_FAIL_CLOSED",
            "reason": str(error),
            "nodes": None,
        }
    if result["status"] == "INDETERMINATE":
        return {
            "status": "NODE_BUDGET_FAIL_CLOSED",
            "nodes": result["nodes"],
        }
    if result["status"] == "UNSAT":
        return {
            "status": "UNSAT_EXHAUSTIVE_FINITE_DFS",
            "nodes": result["nodes"],
        }
    if result["status"] != "SAT" or not found:
        raise RuntimeError(f"unexpected DFS result: {result}")
    return {"status": "SAT", "nodes": result["nodes"], **found}


def load_or_initialize(args: argparse.Namespace) -> dict[str, object]:
    if not args.resume or not args.output.exists():
        state = initial_state(args)
        if args.seed_checkpoint is not None:
            seed = json.loads(args.seed_checkpoint.read_text(encoding="utf-8"))
            if seed.get("schema") != SCHEMA:
                raise RuntimeError("seed checkpoint schema mismatch")
            state["bank_cuts"] = list(seed.get("bank_cuts", []))
            state["structural_survivors"] = list(
                seed.get("structural_survivors", [])
            )
            state["bank_witnesses_rejected"] = int(
                seed.get("bank_witnesses_rejected", 0)
            )
            state["prior_round"] = {
                "checkpoint_sha256": file_sha256(args.seed_checkpoint),
                "terminal_status": seed.get("status"),
                "iterations": seed.get("iterations"),
                "bank_cut_count": len(seed.get("bank_cuts", [])),
                "structural_survivor_count": len(
                    seed.get("structural_survivors", [])
                ),
            }
        return state
    state = json.loads(args.output.read_text(encoding="utf-8"))
    if state.get("schema") != SCHEMA:
        raise RuntimeError("checkpoint schema mismatch")
    if state.get("source_sha256") != source_hashes():
        raise RuntimeError("checkpoint source drift")
    if state.get("budgets") != initial_state(args)["budgets"]:
        raise RuntimeError("checkpoint budget drift")
    if state.get("status") != "RUNNING_FAIL_CLOSED":
        return state
    return state


INCOMPATIBLE_RE = re.compile(r"incompatible rows global:(\d+), global:(\d+)")
INVALID_RE = re.compile(r"global:(\d+): invalid local class")
AMBIENT_RE = re.compile(r"ambient:firstApexClass incompatible with global:(\d+)")


def structural_refinement(
    surface: Any,
    reason: str,
    choices: Mapping[int, int],
) -> dict[str, object]:
    incompatible = INCOMPATIBLE_RE.fullmatch(reason)
    invalid = INVALID_RE.fullmatch(reason)
    ambient = AMBIENT_RE.fullmatch(reason)
    if incompatible is not None:
        centers = tuple(map(int, incompatible.groups()))
        kind = "incompatible_row_pair"
    elif invalid is not None:
        centers = (int(invalid.group(1)),)
        kind = "invalid_local_row"
    elif ambient is not None:
        centers = (int(ambient.group(1)),)
        kind = "ambient_first_apex_incompatible_row"
    else:
        centers = tuple(sorted(choices))
        kind = "full_rejected_assignment"
    return {
        "kind": kind,
        "reason": reason,
        "choices": {str(center): choices[center] for center in centers},
    }


def add_core_cuts(
    surface: Any,
    solver: z3.Solver | None,
    state: dict[str, object],
    rows: tuple[Any, ...],
    choices: Mapping[int, int],
    marco: Mapping[str, object],
    *,
    exact_centers: frozenset[int],
    iteration: int,
) -> int:
    added = 0
    for core in marco["minimal_cores"]:
        centers = tuple(int(center) for center in core["center_ids"])
        required_exact = tuple(
            center for center in centers if center in exact_centers
        )
        record = {
            "iteration": iteration,
            "row_pattern": {str(center): choices[center] for center in centers},
            "row_pattern_named": [
                {
                    "center": surface.by_label[center],
                    "support": sorted(
                        surface.by_label[point]
                        for point in next(
                            row.support for row in rows if row.center == center
                        )
                    ),
                }
                for center in centers
            ],
            "required_exact_centers": list(required_exact),
            "required_exact_center_names": [
                surface.by_label[center] for center in required_exact
            ],
            "marco_core": core,
        }
        # Exact flags are irrelevant to all currently returned stages except
        # equality-exact-off-circle.  Require only the centers actually named
        # as exact by such a match, never every blocker-image center in the core.
        exact_from_matches = {
            int(match["core"]["center"])
            for match in core["matches"]
            if match["stage"] == "equality-exact-off-circle"
            and int(match["core"]["center"])
            != surface.by_name[robust.FIRST_APEX]
        }
        record["required_exact_centers"] = sorted(exact_from_matches)
        record["required_exact_center_names"] = [
            surface.by_label[center] for center in sorted(exact_from_matches)
        ]
        if solver is not None:
            solver.add(clause_for_bank_cut(surface, record))
        state["bank_cuts"].append(record)
        added += 1
    return added


def run(args: argparse.Namespace) -> dict[str, object]:
    surface = robust.Surface()
    state = load_or_initialize(args)
    if state["status"] != "RUNNING_FAIL_CLOSED":
        return state
    smokes = robust.smoke_gates(surface)
    ambient_only = scan(surface, (), exact_centers=frozenset())
    if ambient_only:
        raise RuntimeError("ambient first-apex row alone unexpectedly hits bank")
    if not (
        robust.Q == "E"
        and robust.W == "D"
        and "J" in robust.FIRST_APEX_CLASS
        and "J" != robust.W
    ):
        raise RuntimeError("live role mapping drifted: q=E, w=D, fresh J required")
    state["smoke_gates"] = {
        **smokes,
        "ambient_first_apex_alone_bank_clean": "PASS",
        "live_roles_q_E_w_D_fresh_J_distinct": "PASS",
    }

    started = time.monotonic()
    start_iteration = int(state["iterations"]) + 1
    for iteration in range(start_iteration, args.max_iterations + 1):
        state["iterations"] = iteration
        if time.monotonic() - started > args.wall_seconds:
            state["status"] = "WALL_BUDGET_FAIL_CLOSED"
            state["last_event"] = "wall budget before map call"
            atomic_write(args.output, state)
            return state

        candidate = dfs_candidate(
            surface,
            state["bank_cuts"],
            max_nodes=args.max_nodes_per_iteration,
        )
        if candidate["status"] == "UNKNOWN_FAIL_CLOSED":
            state["status"] = "MAP_UNKNOWN_FAIL_CLOSED"
            state["last_event"] = candidate
            atomic_write(args.output, state)
            return state
        if candidate["status"] == "NODE_BUDGET_FAIL_CLOSED":
            state["status"] = "MAP_NODE_BUDGET_FAIL_CLOSED"
            state["last_event"] = candidate
            atomic_write(args.output, state)
            return state
        if candidate["status"] == "UNSAT_EXHAUSTIVE_FINITE_DFS":
            state["status"] = "MAP_UNSAT_EXHAUSTIVE_FINITE_DFS"
            state["last_event"] = candidate
            atomic_write(args.output, state)
            return state
        if candidate["status"] != "SAT":
            raise RuntimeError(f"unexpected DFS candidate status: {candidate}")

        rows = tuple(candidate["rows"])
        blockers = dict(candidate["blockers"])
        choices = dict(candidate["choices"])
        ok, reason = surface.verify_model(rows, blockers)
        if not ok:
            raise RuntimeError(f"DFS candidate failed verifier: {reason}")

        selected_matches = scan(
            surface, rows, exact_centers=frozenset()
        )
        exact_centers = frozenset(blockers.values())
        exact_matches = scan(
            surface, rows, exact_centers=exact_centers
        )
        serialized_rows = named_rows(surface, rows, choices)
        serialized_blockers = named_blockers(surface, blockers)
        target_audit = sharpened_live_target_audit(surface, rows)
        survivor_record = {
            "iteration": iteration,
            "dfs_nodes": candidate["nodes"],
            "rows": serialized_rows,
            "blockers": serialized_blockers,
            "exact_center_names": sorted(
                surface.by_label[center] for center in exact_centers
            ),
            "row_assignment_sha256": canonical_sha256(serialized_rows),
            "blocker_assignment_sha256": canonical_sha256(serialized_blockers),
            "selected_row_bank_match_count": len(selected_matches),
            "selected_row_bank_matches": list(selected_matches),
            "blocker_exact_bank_match_count": len(exact_matches),
            "blocker_exact_only_matches": [
                match
                for match in exact_matches
                if semantic_match_key(match)
                not in {semantic_match_key(item) for item in selected_matches}
            ],
            "sharpened_live_target": target_audit,
        }
        state["structural_survivors"].append(survivor_record)

        if selected_matches:
            marco = marco_row_cores(
                surface,
                rows,
                exact_centers=frozenset(),
                max_calls=args.marco_max_calls,
                max_cores=args.marco_max_cores,
            )
            added = add_core_cuts(
                surface,
                None,
                state,
                rows,
                choices,
                marco,
                exact_centers=frozenset(),
                iteration=iteration,
            )
            if added == 0:
                # The full selected-row scan is itself a formalized-consumer
                # witness, so a full assignment cut remains sound and restores
                # progress even if the bounded MARCO layer found no MUS.
                full_centers = tuple(
                    row.center
                    for row in rows
                    if row.center != surface.by_name[robust.FIRST_APEX]
                )
                fallback = {
                    "iteration": iteration,
                    "row_pattern": {
                        str(center): choices[center] for center in full_centers
                    },
                    "row_pattern_named": named_rows(surface, rows, choices),
                    "required_exact_centers": [],
                    "required_exact_center_names": [],
                    "fallback_full_assignment": True,
                    "matches": list(selected_matches),
                }
                state["bank_cuts"].append(fallback)
                added = 1
            state["bank_witnesses_rejected"] += 1
            state["last_event"] = {
                "kind": "selected_row_bank_cuts",
                "iteration": iteration,
                "cut_count": added,
                "marco_status": marco["status"],
                "full_match_count": len(selected_matches),
            }
            atomic_write(args.output, state)
            print(
                f"iteration {iteration}: {added} selected-row bank cuts "
                f"({len(selected_matches)} full matches, {marco['status']}, "
                f"nodes={candidate['nodes']}, target={target_audit['holds']})",
                flush=True,
            )
            continue

        if exact_matches:
            marco = marco_row_cores(
                surface,
                rows,
                exact_centers=exact_centers,
                max_calls=args.marco_max_calls,
                max_cores=args.marco_max_cores,
            )
            added = add_core_cuts(
                surface,
                None,
                state,
                rows,
                choices,
                marco,
                exact_centers=exact_centers,
                iteration=iteration,
            )
            if added == 0:
                state["status"] = "EXACTNESS_MARCO_NO_PROGRESS_FAIL_CLOSED"
                state["last_event"] = {
                    "iteration": iteration,
                    "matches": list(exact_matches),
                    "marco": marco,
                }
                atomic_write(args.output, state)
                return state
            state["bank_witnesses_rejected"] += 1
            state["last_event"] = {
                "kind": "blocker_exact_bank_cuts",
                "iteration": iteration,
                "cut_count": added,
                "marco_status": marco["status"],
                "full_match_count": len(exact_matches),
            }
            atomic_write(args.output, state)
            print(
                f"iteration {iteration}: {added} blocker-exact bank cuts "
                f"({len(exact_matches)} full matches, {marco['status']}, "
                f"nodes={candidate['nodes']}, target={target_audit['holds']})",
                flush=True,
            )
            continue

        state["status"] = "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW"
        state["last_event"] = "verified bank-clean witness"
        state["witness"] = {
            "rows": serialized_rows,
            "blockers": serialized_blockers,
            "exact_center_names": sorted(
                surface.by_label[center] for center in exact_centers
            ),
            "selected_row_bank_scan": [],
            "blocker_exact_bank_scan": [],
            "row_assignment_sha256": canonical_sha256(serialized_rows),
            "blocker_assignment_sha256": canonical_sha256(serialized_blockers),
            "independent_structural_verifier": "PASS",
            "dfs_nodes": candidate["nodes"],
            "sharpened_live_target": target_audit,
        }
        atomic_write(args.output, state)
        return state

    state["status"] = "MAP_ITERATION_BUDGET_FAIL_CLOSED"
    state["last_event"] = "iteration budget"
    atomic_write(args.output, state)
    return state


def check_checkpoint(path: Path) -> dict[str, object]:
    """Reconstruct every stored cut and survivor against current code."""

    checkpoint = json.loads(path.read_text(encoding="utf-8"))
    if checkpoint.get("schema") != SCHEMA:
        raise RuntimeError("checkpoint schema mismatch")
    if checkpoint.get("source_sha256") != source_hashes():
        raise RuntimeError("stale checkpoint source hashes")
    surface = robust.Surface()
    o = surface.by_name[robust.FIRST_APEX]

    checked_cuts = 0
    checked_deletions = 0
    for record in checkpoint.get("bank_cuts", []):
        pattern = {
            int(center): int(index)
            for center, index in record["row_pattern"].items()
        }
        rows = []
        for named in record["row_pattern_named"]:
            center = surface.by_name[named["center"]]
            if center == o:
                continue
            support = frozenset(surface.by_name[name] for name in named["support"])
            if center not in pattern:
                continue
            if support != surface.candidates[center][pattern[center]]:
                raise RuntimeError("stored bank-cut candidate/support drift")
            rows.append(
                shadow.ClassRow(
                    f"check:{center}", center, support, exact=False
                )
            )
        if {row.center for row in rows} != set(pattern):
            raise RuntimeError("stored bank-cut row pattern is incomplete")
        exact_centers = frozenset(int(center) for center in record.get(
            "required_exact_centers", []
        ))
        rescanned = scan(
            surface,
            tuple(rows),
            exact_centers=exact_centers,
        )
        if not rescanned:
            raise RuntimeError("stored bank cut no longer matches any consumer")
        stored_matches = record.get("marco_core", {}).get(
            "matches", record.get("matches", [])
        )
        rescanned_keys = {semantic_match_key(match) for match in rescanned}
        if not stored_matches or any(
            semantic_match_key(match) not in rescanned_keys
            for match in stored_matches
        ):
            raise RuntimeError("stored bank-cut semantic match drift")
        if "marco_core" in record:
            for removed in pattern:
                remaining_rows = tuple(row for row in rows if row.center != removed)
                remaining_exact = exact_centers - {removed}
                if scan(
                    surface,
                    remaining_rows,
                    exact_centers=remaining_exact,
                ):
                    raise RuntimeError("stored MARCO cut is no longer row-minimal")
                checked_deletions += 1
        checked_cuts += 1

    checked_survivors = 0
    target_true = 0
    for record in checkpoint.get("structural_survivors", []):
        blockers = {
            surface.by_name[source]: surface.by_name[center]
            for source, center in record["blockers"].items()
        }
        exact_centers = set(blockers.values())
        rows = []
        choices = {}
        for named in record["rows"]:
            center = surface.by_name[named["center"]]
            support = frozenset(surface.by_name[name] for name in named["support"])
            index = int(named["candidate_index"])
            if support != surface.candidates[center][index]:
                raise RuntimeError("stored survivor candidate/support drift")
            choices[center] = index
            rows.append(
                shadow.ClassRow(
                    f"global:{center}",
                    center,
                    support,
                    exact=center in exact_centers,
                )
            )
        if set(choices) != set(range(surface.frame.n)):
            raise RuntimeError("stored survivor does not have one row per center")
        ok, reason = surface.verify_model(tuple(rows), blockers)
        if not ok:
            raise RuntimeError(f"stored survivor failed verifier: {reason}")
        selected = scan(surface, tuple(rows), exact_centers=frozenset())
        actual = scan(
            surface, tuple(rows), exact_centers=frozenset(exact_centers)
        )
        if [semantic_match_key(match) for match in selected] != [
            semantic_match_key(match)
            for match in record["selected_row_bank_matches"]
        ]:
            raise RuntimeError("stored survivor selected-row scan drift")
        actual_only = [
            match
            for match in actual
            if semantic_match_key(match)
            not in {semantic_match_key(item) for item in selected}
        ]
        if [semantic_match_key(match) for match in actual_only] != [
            semantic_match_key(match)
            for match in record["blocker_exact_only_matches"]
        ]:
            raise RuntimeError("stored survivor blocker-exact scan drift")
        target = sharpened_live_target_audit(surface, tuple(rows))
        if target != record["sharpened_live_target"]:
            raise RuntimeError("stored survivor sharpened-target audit drift")
        target_true += int(bool(target["holds"]))
        checked_survivors += 1

    return {
        "checked_bank_cuts": checked_cuts,
        "checked_single_row_deletions": checked_deletions,
        "checked_structural_survivors": checked_survivors,
        "survivors_satisfying_sharpened_target": target_true,
        "survivors_avoiding_sharpened_target": checked_survivors - target_true,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=CHECKPOINT)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--seed-checkpoint", type=Path)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--max-iterations", type=int, default=1024)
    parser.add_argument("--wall-seconds", type=float, default=180.0)
    parser.add_argument("--marco-max-calls", type=int, default=160)
    parser.add_argument("--marco-max-cores", type=int, default=12)
    parser.add_argument("--max-nodes-per-iteration", type=int, default=5000000)
    args = parser.parse_args()
    if min(
        args.max_iterations,
        args.wall_seconds,
        args.marco_max_calls,
        args.marco_max_cores,
        args.max_nodes_per_iteration,
    ) <= 0:
        raise SystemExit("all budgets must be positive")
    if args.check:
        if not args.output.exists():
            raise SystemExit(f"missing checkpoint: {args.output}")
        try:
            audit = check_checkpoint(args.output)
        except RuntimeError as error:
            raise SystemExit(str(error)) from error
        print(
            "PASS: reconstructed bank cuts, MARCO deletions, structural "
            f"survivors, and target audits: {json.dumps(audit, sort_keys=True)}"
        )
        return 0
    state = run(args)
    print(
        f"{state['status']}: iterations={state['iterations']} "
        f"structural={len(state['structural_refinements'])} "
        f"bank_cuts={len(state['bank_cuts'])}",
        flush=True,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
