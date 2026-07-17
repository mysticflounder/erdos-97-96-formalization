#!/usr/bin/env python3
"""Continue the corrected robust DFS with universal Kalmanson prefix pruning.

This is an overlay, not a patch to the authoritative CEGAR script.  It loads
the exact `b307...` checkpoint and its 524 formalized-consumer cuts, rejects
every partial row assignment whose equality quotient already has a strict
Kalmanson cycle, and then resumes the same bank scan/MARCO loop.  All output
stays in this scratch directory.

The Kalmanson filter is theorem-discovery code until its convex-order bridge
and generic strict-cycle consumer are formalized in Lean.  Accordingly, even
an exhaustive finite UNSAT result here is not a proof-spine closure.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import time
from typing import Any, Mapping, Sequence

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
BASE_CHECKPOINT = (
    ROOT
    / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)
BANK_SCRIPT = (
    ROOT / "scratch/atail-force/robust-all-center-marco/bank_cegar.py"
)
DEFAULT_OUTPUT = HERE / "continuation_checkpoint.json"
EXPECTED_BASE_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)

if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from prefix_filter import has_ordinal_contradiction  # noqa: E402


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


bank = load_module(BANK_SCRIPT, "p97_kalmanson_overlay_bank")
robust = bank.robust
shadow = bank.shadow


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def atomic_write(path: Path, value: Mapping[str, object]) -> None:
    rendered = json.dumps(value, indent=2, sort_keys=True) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


def write_state(path: Path, state: Mapping[str, object]) -> None:
    """Persist overlay results without copying the 524-cut base checkpoint."""

    snapshot = dict(state)
    cuts = snapshot.pop("bank_cuts", ())
    snapshot["effective_bank_cut_count"] = len(cuts)
    snapshot["bank_cuts_stored_by_reference"] = (
        "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
    )
    atomic_write(path, snapshot)


class DfsMapUnknown(RuntimeError):
    pass


def dfs_candidate_kalmanson(
    surface: Any,
    bank_cuts: Sequence[Mapping[str, object]],
    *,
    max_nodes: int,
    prune_stats: dict[str, int],
) -> dict[str, object]:
    """The authoritative DFS map plus one prefix-monotone Kalmanson gate."""

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
    cyclic_order = tuple(shadow.hull_order(surface.frame))
    fixed_actual = (ambient, *(row for row in fixed_rows if row.center != o))
    if has_ordinal_contradiction(cyclic_order, fixed_actual):
        raise AssertionError("fixed robust prefix is already Kalmanson-inconsistent")
    singleton_domain_audit = []
    for variable in variable_rows:
        killed = sum(
            has_ordinal_contradiction(
                cyclic_order,
                (*fixed_actual, shadow.ClassRow(
                    variable.name,
                    variable.center,
                    support,
                    variable.exact,
                )),
            )
            for support in variable.candidates
        )
        singleton_domain_audit.append({
            "center": surface.by_label[variable.center],
            "center_id": variable.center,
            "candidate_count": len(variable.candidates),
            "candidate_supports_sha256": canonical_sha256(
                sorted([sorted(support) for support in variable.candidates])
            ),
            "kalmanson_killed_with_fixed_prefix": killed,
            "kalmanson_survives_with_fixed_prefix": len(variable.candidates) - killed,
        })

    def prefix_compatible(rows: Sequence[Any]) -> bool:
        prune_stats["prefix_calls"] += 1
        by_center = {row.center: row for row in rows}
        if any(
            not shadow.rows_compatible(surface.frame, ambient, row)
            for row in rows
            if row.center != o
        ):
            prune_stats["legacy_incompatible"] += 1
            return False
        actual = (ambient, *(row for row in rows if row.center != o))
        if has_ordinal_contradiction(cyclic_order, actual):
            prune_stats["kalmanson_cycle"] += 1
            return False
        for first in range(surface.frame.n):
            for second in range(first + 1, surface.frame.n):
                centers = {
                    row.center
                    for row in actual
                    if first in row.support and second in row.support
                }
                if len(centers) > 2:
                    prune_stats["pair_center_capacity"] += 1
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
                prune_stats["formal_bank_cut"] += 1
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
            solver.add(bank.clause_for_bank_cut(surface, cut))
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
        if has_ordinal_contradiction(cyclic_order, (ambient, *decoded)):
            raise AssertionError("complete assignment escaped the prefix filter")
        found.update({
            "rows": decoded,
            "blockers": blockers,
            "choices": surface.row_choice_indices(model),
        })
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
        return {"status": "UNKNOWN_FAIL_CLOSED", "reason": str(error), "nodes": None}
    if result["status"] == "INDETERMINATE":
        return {
            "status": "NODE_BUDGET_FAIL_CLOSED",
            "nodes": result["nodes"],
            "singleton_domain_audit": singleton_domain_audit,
        }
    if result["status"] == "UNSAT":
        zero_centers = sorted(
            record["center"]
            for record in singleton_domain_audit
            if record["kalmanson_survives_with_fixed_prefix"] == 0
        )
        if not zero_centers:
            raise AssertionError(
                "DFS returned pre-node UNSAT without a singleton-domain certificate"
            )
        return {
            "status": "UNSAT_EXHAUSTIVE_FINITE_DFS",
            "nodes": result["nodes"],
            "fixed_prefix_kalmanson_contradiction": False,
            "zero_singleton_domain_centers": zero_centers,
            "singleton_domain_audit": singleton_domain_audit,
        }
    if result["status"] != "SAT" or not found:
        raise RuntimeError(f"unexpected DFS result: {result}")
    return {
        "status": "SAT",
        "nodes": result["nodes"],
        "singleton_domain_audit": singleton_domain_audit,
        **found,
    }


def initial_state(base: Mapping[str, object], args: argparse.Namespace) -> dict[str, object]:
    return {
        "schema": "p97-atail-kalmanson-overlay-continuation-v1",
        "status": "RUNNING_FAIL_CLOSED",
        "epistemic_status": (
            "FINITE_STRUCTURAL_CONTINUATION_CONDITIONAL_ON_UNFORMALIZED_"
            "STRICT_KALMANSON_CONSUMER"
        ),
        "base_checkpoint_sha256": EXPECTED_BASE_SHA256,
        "base_status": base["status"],
        "base_iterations": base["iterations"],
        "base_survivor_prefix_count": len(base["structural_survivors"]),
        "base_bank_cut_count": len(base["bank_cuts"]),
        "bank_cuts": list(base["bank_cuts"]),
        "new_bank_witnesses_rejected": 0,
        "new_survivors": [],
        "rounds": 0,
        "prune_stats": {
            "prefix_calls": 0,
            "legacy_incompatible": 0,
            "kalmanson_cycle": 0,
            "pair_center_capacity": 0,
            "formal_bank_cut": 0,
        },
        "budgets": {
            "max_rounds": args.max_rounds,
            "max_nodes_per_round": args.max_nodes,
            "wall_seconds": args.wall_seconds,
            "marco_max_calls": args.marco_max_calls,
            "marco_max_cores": args.marco_max_cores,
        },
        "source_sha256": {
            str(Path(__file__).relative_to(ROOT)): file_sha256(Path(__file__)),
            str((HERE / "prefix_filter.py").relative_to(ROOT)): file_sha256(
                HERE / "prefix_filter.py"
            ),
            str(BANK_SCRIPT.relative_to(ROOT)): file_sha256(BANK_SCRIPT),
        },
        "last_event": "initialized from exact corrected prefix",
    }


def run(args: argparse.Namespace) -> dict[str, object]:
    if file_sha256(args.base_checkpoint) != EXPECTED_BASE_SHA256:
        raise RuntimeError("base checkpoint SHA drift")
    base = json.loads(args.base_checkpoint.read_text(encoding="utf-8"))
    state = initial_state(base, args)
    surface = robust.Surface()
    started = time.monotonic()

    for round_number in range(1, args.max_rounds + 1):
        state["rounds"] = round_number
        if time.monotonic() - started > args.wall_seconds:
            state["status"] = "WALL_BUDGET_FAIL_CLOSED"
            state["last_event"] = "wall budget before DFS round"
            write_state(args.output, state)
            return state
        candidate = dfs_candidate_kalmanson(
            surface,
            state["bank_cuts"],
            max_nodes=args.max_nodes,
            prune_stats=state["prune_stats"],
        )
        if candidate["status"] != "SAT":
            state["status"] = candidate["status"]
            state["last_event"] = candidate
            write_state(args.output, state)
            return state

        rows = tuple(candidate["rows"])
        blockers = dict(candidate["blockers"])
        choices = dict(candidate["choices"])
        selected_matches = bank.scan(surface, rows, exact_centers=frozenset())
        exact_centers = frozenset(blockers.values())
        exact_matches = bank.scan(surface, rows, exact_centers=exact_centers)
        serialized_rows = bank.named_rows(surface, rows, choices)
        serialized_blockers = bank.named_blockers(surface, blockers)
        record = {
            "round": round_number,
            "dfs_nodes": candidate["nodes"],
            "rows": serialized_rows,
            "blockers": serialized_blockers,
            "row_assignment_sha256": bank.canonical_sha256(serialized_rows),
            "blocker_assignment_sha256": bank.canonical_sha256(serialized_blockers),
            "selected_row_bank_match_count": len(selected_matches),
            "blocker_exact_bank_match_count": len(exact_matches),
        }
        state["new_survivors"].append(record)

        matches = selected_matches or exact_matches
        if not matches:
            state["status"] = "SAT_KALMANSON_AND_PRODUCER_BANK_CLEAN_SHADOW"
            state["last_event"] = {
                "kind": "new bank-clean ordinal-consistent shadow",
                "record": record,
            }
            state["witness"] = record
            write_state(args.output, state)
            return state

        scan_exact_centers = frozenset() if selected_matches else exact_centers
        marco = bank.marco_row_cores(
            surface,
            rows,
            exact_centers=scan_exact_centers,
            max_calls=args.marco_max_calls,
            max_cores=args.marco_max_cores,
        )
        added = bank.add_core_cuts(
            surface,
            None,
            state,
            rows,
            choices,
            marco,
            exact_centers=scan_exact_centers,
            iteration=int(base["iterations"]) + round_number,
        )
        if added == 0 and selected_matches:
            o = surface.by_name[robust.FIRST_APEX]
            full_centers = tuple(row.center for row in rows if row.center != o)
            state["bank_cuts"].append({
                "iteration": int(base["iterations"]) + round_number,
                "row_pattern": {
                    str(center): choices[center] for center in full_centers
                },
                "row_pattern_named": serialized_rows,
                "required_exact_centers": [],
                "required_exact_center_names": [],
                "fallback_full_assignment": True,
                "matches": list(selected_matches),
            })
            added = 1
        if added == 0:
            state["status"] = "MARCO_NO_PROGRESS_FAIL_CLOSED"
            state["last_event"] = {"record": record, "marco": marco}
            write_state(args.output, state)
            return state
        state["new_bank_witnesses_rejected"] += 1
        state["last_event"] = {
            "kind": "formal bank cuts",
            "round": round_number,
            "added": added,
            "marco_status": marco["status"],
        }
        write_state(args.output, state)
        print(
            f"round {round_number}: {added} bank cuts; "
            f"nodes={candidate['nodes']}; "
            f"kalmanson_prunes={state['prune_stats']['kalmanson_cycle']}",
            flush=True,
        )

    state["status"] = "ROUND_BUDGET_FAIL_CLOSED"
    state["last_event"] = "round budget"
    write_state(args.output, state)
    return state


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-checkpoint", type=Path, default=BASE_CHECKPOINT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--max-rounds", type=int, default=25)
    parser.add_argument("--max-nodes", type=int, default=5_000_000)
    parser.add_argument("--wall-seconds", type=float, default=600.0)
    parser.add_argument("--marco-max-calls", type=int, default=160)
    parser.add_argument("--marco-max-cores", type=int, default=12)
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()
    args.base_checkpoint = args.base_checkpoint.resolve()
    args.output = args.output.resolve()
    result = run(args)
    if args.summary:
        result = {
            key: value
            for key, value in result.items()
            if key not in {"bank_cuts", "new_survivors"}
        }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
