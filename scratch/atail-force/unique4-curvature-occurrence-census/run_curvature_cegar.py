#!/usr/bin/env python3
"""Bounded curvature CEGAR for the current n=11 exact-four projection.

The outer model is imported read-only from ``exact_four_outer.py``.  A SAT
selected-row assignment is checked against the exact rational scalar-turn
ledger exported by shell curvature.  If that ledger is UNSAT, only exact rows
supporting a checked ``STRICT_OPEN_WINDOW`` or ``FULL_COVER`` terminal are
blocked, together with their cyclic/reflected copies.  An UNSAT ledger with no
checked terminal stops fail-closed without installing a cut.  The loop stops
at Boolean UNSAT, a curvature-SAT survivor, or the explicit round cap.

This is finite n=11 projection evidence, not a Lean proof and not an
arbitrary-cardinality coverage claim.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import re
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "unique-arm-whole-carrier-source-audit"
ENCODER_PATH = SOURCE_DIR / "exact_four_outer.py"
VERIFIER_PATH = SOURCE_DIR / "verify_exact_four_outer.py"
PLANAR_BANK = (
    HERE.parent / "whole-carrier-planar-rank-cegar" / "planar_schema_bank.json"
)
FULL_KALMANSON_BANK = SOURCE_DIR / "kalmanson_schema_bank.json"
KERNEL_KALMANSON_BANK = HERE / "kalmanson_schema_bank.kernel_only.json"
U5_BANK = SOURCE_DIR / "u5_signed_schema_bank.json"
STORED_CURVATURE = HERE.parent / "unique4-exact-two-core-port" / "all_rounds.curvature.json"
SOURCE_TERMINAL = (
    HERE.parent
    / "unique4-turn-disjoint-source-occurrence"
    / "UniqueFourTurnDisjointSourceOccurrence.lean"
)
AGGREGATE_TERMINAL = (
    HERE.parent
    / "unique4-turn-disjoint-curvature-terminal"
    / "TurnDisjointCurvatureTerminal.lean"
)

CORE_ROW_RE = re.compile(r"^center_(\d+)_(left|right)_quarter_turn$")


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


ENCODER = load_module("unique4_curvature_outer", ENCODER_PATH)
VERIFIER = load_module("unique4_curvature_outer_verifier", VERIFIER_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_hash_bindings(kalmanson_bank: Path) -> dict[str, dict[str, str]]:
    sources = {
        "driver": Path(__file__).resolve(),
        "outer_encoder": ENCODER_PATH,
        "semantic_verifier": VERIFIER_PATH,
        "planar_bank": PLANAR_BANK,
        "kalmanson_kernel_only_bank": kalmanson_bank,
        "kalmanson_full_diagnostic_bank": FULL_KALMANSON_BANK,
        "u5_bank": U5_BANK,
        "stored_curvature_seed_registry": STORED_CURVATURE,
        "source_terminal_consumers": SOURCE_TERMINAL,
        "aggregate_curvature_consumers": AGGREGATE_TERMINAL,
    }
    return {
        name: {
            "path": str(path.resolve().relative_to(ROOT.resolve())),
            "sha256": sha256(path),
        }
        for name, path in sources.items()
    }


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary.replace(path)


def dimacs_header(path: Path) -> tuple[int, int]:
    with path.open(encoding="utf-8") as handle:
        for line in handle:
            if line.startswith("p cnf "):
                _p, _cnf, variables, clauses = line.split()
                return int(variables), int(clauses)
    raise ValueError(f"missing DIMACS header: {path}")


def prepare_fresh_output_dir(path: Path) -> None:
    if path.exists():
        if any(path.iterdir()):
            raise FileExistsError(f"refusing nonempty output directory: {path}")
    else:
        path.mkdir(parents=True)


def finalize_cnf_checkpoint(
    cnf: Any, metadata: dict[str, Any], cnf_path: Path, *, rewrite: bool,
) -> dict[str, Any]:
    """Publish and replay the exact final CNF/count checkpoint."""

    if rewrite:
        metadata["checked_curvature_terminal_orbit_cut_count"] = (
            cnf.block_counts.get("checked_curvature_terminal_orbit_cut", 0)
        )
        metadata["clause_count"] = len(cnf.clauses)
        metadata["clause_block_counts"] = dict(sorted(cnf.block_counts.items()))
        cnf.write_dimacs(cnf_path, metadata)
    header_variables, header_clauses = dimacs_header(cnf_path)
    if header_clauses != len(cnf.clauses):
        raise AssertionError("final DIMACS clause count does not match in-memory CNF")
    if metadata.get("clause_count") != len(cnf.clauses):
        raise AssertionError("final metadata clause count does not match in-memory CNF")
    expected_cuts = cnf.block_counts.get("checked_curvature_terminal_orbit_cut", 0)
    if metadata.get("checked_curvature_terminal_orbit_cut_count") != expected_cuts:
        raise AssertionError("final metadata checked-terminal cut count drifted")
    return {
        "rewritten_after_last_refinement": rewrite,
        "variable_count": header_variables,
        "clause_count": header_clauses,
        "checked_curvature_terminal_orbit_cut_count": expected_cuts,
        "clause_block_counts": dict(sorted(cnf.block_counts.items())),
        "cnf_sha256": sha256(cnf_path),
        "all_final_cnf_counts_replayed": True,
    }


def prepare_kernel_kalmanson_bank() -> dict[str, Any]:
    """Filter out exact-Farkas schemas that have not been ported to Lean."""

    source = json.loads(FULL_KALMANSON_BANK.read_text(encoding="utf-8"))
    if source.get("schema") != "p97-exact-four-kalmanson-order-schema-bank-v1":
        raise ValueError("unexpected full Kalmanson bank schema")
    records = [
        record for record in source["schemas"]
        if record.get("verification_status") == "KERNEL_CHECKED"
    ]
    if len(records) != int(source.get("kernel_checked_schema_count", -1)):
        raise ValueError("kernel-checked Kalmanson count drift")
    filtered = {
        "schema": source["schema"],
        "epistemic_status": "KERNEL_CHECKED_ONLY_FILTER",
        "kernel_checked_schema_count": len(records),
        "exact_farkas_verified_pending_port_schema_count": 0,
        "schema_count": len(records),
        "source_full_bank": str(FULL_KALMANSON_BANK.relative_to(ROOT)),
        "source_full_bank_sha256": sha256(FULL_KALMANSON_BANK),
        "schemas": records,
    }
    write_json(KERNEL_KALMANSON_BANK, filtered)
    return filtered


def rat(value: Fraction) -> z3.RatNumRef:
    return z3.RatVal(value.numerator, value.denominator)


def as_fraction(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def scalar_curvature_oracle(rows: dict[int, set[int]], n: int) -> dict[str, Any]:
    """Decide the exact scalar shell-curvature ledger for fixed rows."""

    turns = [z3.Real(f"turn_{index}") for index in range(n)]
    fixed_constraints: list[tuple[str, z3.BoolRef]] = [
        ("full_turn_sum", z3.Sum(*turns) == rat(Fraction(4)))
    ]
    for index, turn in enumerate(turns):
        fixed_constraints.append((f"turn_{index}_positive", turn > 0))
        fixed_constraints.append((f"turn_{index}_lt_pi", turn < 2))

    row_ledger: list[dict[str, Any]] = []
    row_constraints: list[tuple[str, z3.BoolRef]] = []
    for center, support in sorted(rows.items()):
        offsets = sorted((center - point) % n for point in support)
        if len(offsets) != 4 or offsets[0] == 0:
            raise ValueError((center, support, offsets))
        global_start = (-center) % n
        left_turns = [
            (global_start + offset) % n for offset in range(offsets[1] - 1)
        ]
        right_turns = [
            (global_start + offset) % n
            for offset in range(offsets[2], n - 1)
        ]
        row_constraints.append(
            (f"center_{center}_left_quarter_turn",
             z3.Sum(*(turns[index] for index in left_turns)) > 1)
        )
        row_constraints.append(
            (f"center_{center}_right_quarter_turn",
             z3.Sum(*(turns[index] for index in right_turns)) > 1)
        )
        row_ledger.append(
            {
                "center": center,
                "support": sorted(support),
                "centered_reverse_offsets": offsets,
                "left_arc_start": global_start,
                "left_arc_finish": global_start + offsets[1],
                "right_arc_start": global_start + offsets[2],
                "right_arc_finish": global_start + n,
                "left_turn_indices": left_turns,
                "right_turn_indices": right_turns,
            }
        )

    by_label = dict(row_constraints)
    solver = z3.SolverFor("QF_LRA")
    solver.add(*(constraint for _label, constraint in fixed_constraints))
    solver.add(*(constraint for _label, constraint in row_constraints))
    status = solver.check()
    result: dict[str, Any] = {
        "schema": "p97-shell-curvature-scalar-ledger-cegar-oracle-v1",
        "epistemic_status": "EXACT_QF_LRA_FOR_FIXED_SELECTED_ROWS",
        "solver_status": str(status).upper(),
        "normalized_constants": {"pi_over_two": "1", "pi": "2", "two_pi": "4"},
        "minimization_contract": (
            "full turn sum, every turn positivity atom, and every turn<pi atom "
            "remain fixed; deletion minimizes row inequalities only"
        ),
        "row_ledger": row_ledger,
    }
    if status == z3.unsat:
        minimized = [label for label, _constraint in row_constraints]
        changed = True
        while changed:
            changed = False
            for label in minimized[:]:
                trial = [item for item in minimized if item != label]
                replay = z3.SolverFor("QF_LRA")
                replay.add(*(constraint for _name, constraint in fixed_constraints))
                replay.add(*(by_label[item] for item in trial))
                if replay.check() == z3.unsat:
                    minimized = trial
                    changed = True
                    break
        replay = z3.SolverFor("QF_LRA")
        replay.add(*(constraint for _name, constraint in fixed_constraints))
        replay.add(*(by_label[item] for item in minimized))
        if replay.check() != z3.unsat:
            raise AssertionError("stored deletion-minimal curvature core did not replay")
        sides: list[dict[str, Any]] = []
        for label in minimized:
            match = CORE_ROW_RE.match(label)
            if match:
                sides.append({"center": int(match.group(1)), "side": match.group(2)})
        result.update(
            {
                "deletion_minimal_unsat_core": minimized,
                "core_row_sides": sides,
                "core_centers": sorted({entry["center"] for entry in sides}),
                "core_requires_more_than_four_arcs": len(sides) > 4,
            }
        )
    elif status == z3.sat:
        model = solver.model()
        values = [
            as_fraction(model.eval(turn, model_completion=True)) for turn in turns
        ]
        result["turn_model"] = [str(value) for value in values]
        result["turn_sum"] = str(sum(values))
        result["all_turns_positive_and_lt_pi"] = all(0 < value < 2 for value in values)
        margins = []
        for entry in row_ledger:
            left = sum(values[index] for index in entry["left_turn_indices"])
            right = sum(values[index] for index in entry["right_turn_indices"])
            margins.append(
                {
                    "center": entry["center"],
                    "left": str(left),
                    "right": str(right),
                    "left_margin": str(left - 1),
                    "right_margin": str(right - 1),
                }
            )
        result["row_margins"] = margins
        result["all_row_margins_positive"] = all(
            Fraction(entry["left_margin"]) > 0
            and Fraction(entry["right_margin"]) > 0
            for entry in margins
        )
    else:
        raise RuntimeError(f"unexpected QF_LRA status {status}")
    return result


def four_checked_terminal_witnesses(
    oracle: dict[str, Any], n: int,
) -> list[list[dict[str, Any]]]:
    """Enumerate the exact common-lift contracts of both checked terminals.

    Pairwise-disjoint cyclic masks are insufficient: four masks can cover a
    whole period.  This enumerator translates each actual outer arc by integer
    periods and classifies only:

    * ``STRICT_OPEN_WINDOW``: ordered gaps and final used turn strictly before
      ``windowStart+n``; or
    * ``FULL_COVER``: every adjacent support meets exactly and the last used
      turn is exactly ``windowStart+n``.

    Anything else is rejected rather than banked.
    """

    base_arcs: list[dict[str, Any]] = []
    for entry in oracle["row_ledger"]:
        for side, key, start_key, finish_key in (
            ("left", "left_turn_indices", "left_arc_start", "left_arc_finish"),
            ("right", "right_turn_indices", "right_arc_start", "right_arc_finish"),
        ):
            turn_indices = frozenset(map(int, entry[key]))
            if not turn_indices:
                raise AssertionError("quarter-turn arc has empty turn support")
            base_arcs.append(
                {
                    "center": int(entry["center"]),
                    "side": side,
                    "start": int(entry[start_key]),
                    "finish": int(entry[finish_key]),
                    "turn_indices": sorted(turn_indices),
                }
            )

    return lifted_four_arc_terminal_witnesses(base_arcs, n)


def lifted_four_arc_terminal_witnesses(
    base_arcs: list[dict[str, Any]], n: int,
) -> list[list[dict[str, Any]]]:
    """Place four abstract cyclic outer arcs in one checked terminal lift."""

    shifted = [
        {
            **arc,
            "lifted_start": int(arc["start"]) + shift * n,
            "lifted_finish": int(arc["finish"]) + shift * n,
        }
        for arc in base_arcs
        for shift in range(-2, 3)
    ]
    witnesses: list[list[dict[str, Any]]] = []
    seen: set[tuple[str, tuple[tuple[int, str, int, int], ...]]] = set()
    for chosen in itertools.combinations(shifted, 4):
        if len({(int(arc["center"]), str(arc["side"])) for arc in chosen}) != 4:
            continue
        turn_sets = [set(map(int, arc["turn_indices"])) for arc in chosen]
        if any(
            turn_sets[i] & turn_sets[j]
            for i in range(4) for j in range(i + 1, 4)
        ):
            continue
        exact_full_cover = set().union(*turn_sets) == set(range(n))
        ordered = sorted(
            chosen,
            key=lambda arc: (int(arc["lifted_start"]), int(arc["lifted_finish"])),
        )
        has_ordered_gaps = not any(
            int(ordered[index]["lifted_finish"]) - 1
            > int(ordered[index + 1]["lifted_start"])
            for index in range(3)
        )
        if not has_ordered_gaps:
            continue
        window_start = int(ordered[0]["lifted_start"])
        last_turn = int(ordered[-1]["lifted_finish"]) - 1
        exact_meets = all(
            int(ordered[index]["lifted_finish"]) - 1
            == int(ordered[index + 1]["lifted_start"])
            for index in range(3)
        )
        if last_turn < window_start + n and not exact_full_cover:
            terminal_kind = "STRICT_OPEN_WINDOW"
        elif last_turn == window_start + n and exact_meets and exact_full_cover:
            terminal_kind = "FULL_COVER"
        else:
            continue
        arc_key = tuple(
            (
                int(arc["center"]),
                str(arc["side"]),
                int(arc["lifted_start"]) - window_start,
                int(arc["lifted_finish"]) - window_start,
            )
            for arc in ordered
        )
        key = (terminal_kind, arc_key)
        if key in seen:
            continue
        seen.add(key)
        witnesses.append(
            [
                {
                    "center": int(arc["center"]),
                    "side": str(arc["side"]),
                    "turn_indices": list(map(int, arc["turn_indices"])),
                    "lifted_start": int(arc["lifted_start"]) - window_start,
                    "lifted_finish": int(arc["lifted_finish"]) - window_start,
                    "window_start_mod_n": window_start % n,
                    "terminal_kind": terminal_kind,
                    "terminal_span": last_turn - window_start,
                }
                for arc in ordered
            ]
        )
    return witnesses


def inclusion_minimal_witness_center_sets(
    witnesses: list[list[dict[str, Any]]],
) -> list[dict[str, Any]]:
    """Keep one witness for every inclusion-minimal supporting row set.

    Fixing the selected row at each center fixes both transported outer arcs
    used by a witness.  Hence a cut on a smaller supporting center set
    subsumes any cut on a strict superset of it.
    """

    representative: dict[frozenset[int], list[dict[str, Any]]] = {}
    for witness in witnesses:
        centers = frozenset(int(arc["center"]) for arc in witness)
        representative.setdefault(centers, witness)
    minimal = [
        centers for centers in representative
        if not any(other < centers for other in representative)
    ]
    return [
        {
            "centers": sorted(centers),
            "terminal_kind": representative[centers][0]["terminal_kind"],
            "representative_witness": representative[centers],
        }
        for centers in sorted(minimal, key=lambda item: (len(item), sorted(item)))
    ]


def transformed_memberships(
    rows: dict[int, set[int]], centers: list[int], n: int,
    shift: int, reflected: bool,
) -> tuple[tuple[int, int], ...]:
    def transform(point: int) -> int:
        return ((-point if reflected else point) + shift) % n

    return tuple(sorted(
        (transform(center), transform(point))
        for center in centers
        for point in rows[center]
    ))


def add_core_orbit_cuts(
    cnf: Any,
    rows: dict[int, set[int]],
    centers: list[int],
    n: int,
    installed: set[tuple[tuple[int, int], ...]],
) -> list[tuple[tuple[int, int], ...]]:
    added: list[tuple[tuple[int, int], ...]] = []
    for reflected in (False, True):
        for shift in range(n):
            memberships = transformed_memberships(
                rows, centers, n, shift, reflected
            )
            if memberships in installed:
                continue
            installed.add(memberships)
            cnf.add(
                "checked_curvature_terminal_orbit_cut",
                [-cnf.ids[f"m_{center}_{point}"] for center, point in memberships],
            )
            added.append(memberships)
    return added


def seed_stored_cores(
    cnf: Any, n: int, installed: set[tuple[tuple[int, int], ...]]
) -> dict[str, Any]:
    summary = json.loads(STORED_CURVATURE.read_text(encoding="utf-8"))
    seeds = []
    for record in summary["records"]:
        source = ROOT / record["source"]
        payload = json.loads(source.read_text(encoding="utf-8"))
        rows = {
            int(center): set(map(int, support))
            for center, support in payload["rows"].items()
        }
        oracle = scalar_curvature_oracle(rows, n)
        if oracle["solver_status"] != "UNSAT":
            raise ValueError(f"stored seed is not curvature-UNSAT: {source}")
        witnesses = four_checked_terminal_witnesses(oracle, n)
        if not witnesses:
            raise ValueError(
                f"stored seed lacks a checked four-arc terminal witness: {source}"
            )
        minimal_center_sets = inclusion_minimal_witness_center_sets(witnesses)
        batch_records = []
        for support in minimal_center_sets:
            centers = list(map(int, support["centers"]))
            added = add_core_orbit_cuts(cnf, rows, centers, n, installed)
            batch_records.append(
                {
                    "centers": centers,
                    "terminal_kind": support["terminal_kind"],
                    "orbit_cuts_added": len(added),
                    "canonical_memberships": (
                        [list(pair) for pair in min(added)] if added else None
                    ),
                }
            )
        center_sets_digest = hashlib.sha256(json.dumps(
            [batch["centers"] for batch in batch_records],
            separators=(",", ":"),
        ).encode("utf-8")).hexdigest()
        seeds.append(
            {
                "source": record["source"],
                "source_sha256": sha256(source),
                "cut_source": (
                    "all_inclusion_minimal_four_checked_terminal_witness_center_sets"
                ),
                "raw_four_checked_terminal_witness_count": len(witnesses),
                "terminal_kind_counts": {
                    kind: sum(
                        witness[0]["terminal_kind"] == kind for witness in witnesses
                    )
                    for kind in ("STRICT_OPEN_WINDOW", "FULL_COVER")
                },
                "unique_supporting_center_set_count": len({
                    tuple(sorted({int(arc["center"]) for arc in witness}))
                    for witness in witnesses
                }),
                "inclusion_minimal_supporting_center_set_count": len(
                    minimal_center_sets
                ),
                "installed_center_sets_sha256": center_sets_digest,
                "installed_cut_batches": batch_records,
                "distinct_new_orbit_cut_count": sum(
                    batch["orbit_cuts_added"] for batch in batch_records
                ),
            }
        )
    return {
        "source": str(STORED_CURVATURE.relative_to(ROOT)),
        "source_sha256": sha256(STORED_CURVATURE),
        "seed_count": len(seeds),
        "distinct_orbit_cut_count": len(installed),
        "seeds": seeds,
    }


def seed_previous_run(
    cnf: Any, n: int, installed: set[tuple[tuple[int, int], ...]],
    run_dir: Path, mode: str, opp1_card: int,
) -> dict[str, Any]:
    """Replay every theorem-backed SAT refinement from an earlier run."""

    manifest_path = run_dir / "manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest.get("mode") != mode or int(manifest.get("opp1_card", -1)) != opp1_card:
        raise ValueError(f"continuation seed scope mismatch: {manifest_path}")
    replayed_rounds = []
    for round_record in manifest["rounds"]:
        if round_record.get("boolean_status") != "SAT":
            continue
        round_number = int(round_record["round"])
        source = run_dir / f"round_{round_number:03d}" / "result.json"
        payload = json.loads(source.read_text(encoding="utf-8"))
        rows = {
            int(center): set(map(int, support))
            for center, support in payload["rows"].items()
        }
        oracle = scalar_curvature_oracle(rows, n)
        if oracle["solver_status"] != "UNSAT":
            raise ValueError(f"continuation seed is not curvature-UNSAT: {source}")
        witnesses = four_checked_terminal_witnesses(oracle, n)
        if not witnesses:
            raise ValueError(
                f"continuation seed lacks theorem-backed four-arc terminal: {source}"
            )
        minimal_center_sets = inclusion_minimal_witness_center_sets(witnesses)
        batches = []
        for support in minimal_center_sets:
            centers = list(map(int, support["centers"]))
            added = add_core_orbit_cuts(cnf, rows, centers, n, installed)
            batches.append(
                {
                    "centers": centers,
                    "terminal_kind": support["terminal_kind"],
                    "orbit_cuts_added": len(added),
                }
            )
        replayed_rounds.append(
            {
                "round": round_number,
                "source": str(source.resolve().relative_to(ROOT.resolve())),
                "source_sha256": sha256(source),
                "raw_four_checked_terminal_witness_count": len(witnesses),
                "terminal_kind_counts": {
                    kind: sum(
                        witness[0]["terminal_kind"] == kind for witness in witnesses
                    )
                    for kind in ("STRICT_OPEN_WINDOW", "FULL_COVER")
                },
                "inclusion_minimal_supporting_center_set_count": len(
                    minimal_center_sets
                ),
                "distinct_new_orbit_cut_count": sum(
                    batch["orbit_cuts_added"] for batch in batches
                ),
                "installed_cut_batches": batches,
            }
        )
    return {
        "source_manifest": str(manifest_path.resolve().relative_to(ROOT.resolve())),
        "source_manifest_sha256": sha256(manifest_path),
        "source_terminal_status": manifest.get("terminal_status"),
        "replayed_round_count": len(replayed_rounds),
        "distinct_new_orbit_cut_count": sum(
            record["distinct_new_orbit_cut_count"] for record in replayed_rounds
        ),
        "rounds": replayed_rounds,
    }


def configure_mode(cnf: Any, metadata: dict[str, Any], mode: str) -> None:
    if mode == "exact_two":
        return
    if mode != "aligned_ge3":
        raise ValueError(mode)
    if int(metadata["opp1_card"]) != 5:
        raise ValueError("aligned_ge3 is possible only for opp1-card=5 at n=11")
    strict = list(map(int, metadata["first_opposite_strict"]))
    if len(strict) != 3:
        raise AssertionError(strict)
    for point in strict:
        cnf.add("aligned_ge3_strict_hit_overlay", [cnf.ids[f"class_{point}"]])
    # The source arm rebases the retained frontier to a strict-interior pair
    # whose simultaneous deletion preserves the second-apex row.  The outer
    # keeps retained and strict pairs separate, so identify their unordered
    # two-point sets explicitly here.
    for role in ("q", "w"):
        for point in range(int(metadata["n"])):
            if point not in strict:
                cnf.add(
                    "aligned_frontier_pair_in_strict_cap",
                    [-cnf.ids[f"retained_{role}_{point}"]],
                )
            cnf.add(
                "aligned_frontier_pair_eq_strict_pair",
                [
                    -cnf.ids[f"retained_{role}_{point}"],
                    cnf.ids[f"interior_q_{point}"],
                    cnf.ids[f"interior_w_{point}"],
                ],
            )
    metadata["aligned_ge3_strict_hit_overlay"] = True
    metadata["aligned_ge3_source_scope"] = (
        "n=11 opp1-card=5 projection of the >=3 strict-hit arm; all three strict "
        "cap points lie in the exact four-class"
    )


def replay_sat_result(
    result: dict[str, Any], result_path: Path, cnf_path: Path, output: Path,
    mode: str, kalmanson_bank: Path,
) -> dict[str, Any]:
    replay = VERIFIER.verify(
        result, PLANAR_BANK, kalmanson_bank, U5_BANK, cnf_path
    )
    expected_flags = {
        "status": "VERIFIED_SAT_PROJECTION",
        "all_encoded_semantic_constraints_replayed": True,
        "strict_cap_minimality_overlay_replayed": False,
        "pair_minimality_overlay_replayed": True,
        "exact_two_strict_hit_overlay_replayed": mode == "exact_two",
    }
    for key, expected in expected_flags.items():
        if replay.get(key) != expected:
            raise AssertionError(
                f"semantic SAT replay flag {key}={replay.get(key)!r}, expected {expected!r}"
            )
    if mode == "aligned_ge3":
        strict = set(map(int, result["first_opposite_strict"]))
        exact_class = set(map(int, result["first_apex_exact_class"]))
        if len(strict & exact_class) < 3:
            raise AssertionError("aligned >=3 overlay did not replay")
        retained = set(map(int, result["retained_frontier_pair"].values()))
        interior = set(map(int, result["strict_cap_pair"].values()))
        if retained != interior or not retained <= strict:
            raise AssertionError("aligned rebased frontier pair did not replay")
        replay["aligned_ge3_strict_hit_overlay_replayed"] = True
        replay["aligned_frontier_pair_rebase_replayed"] = True
    replay["source_result"] = str(result_path.resolve().relative_to(ROOT.resolve()))
    replay["source_result_file_sha256"] = sha256(result_path)
    replay["all_recorded_replay_flags_asserted"] = True
    write_json(output, replay)
    return replay


def assert_curvature_oracle_replay(oracle: dict[str, Any]) -> None:
    status = oracle["solver_status"]
    if status == "SAT":
        if oracle.get("turn_sum") != "4":
            raise AssertionError("curvature SAT turn sum did not replay to 4")
        if not oracle.get("all_turns_positive_and_lt_pi"):
            raise AssertionError("curvature SAT turn bounds did not replay")
        if not oracle.get("all_row_margins_positive"):
            raise AssertionError("curvature SAT row margins did not replay")
    elif status == "UNSAT":
        if not oracle.get("deletion_minimal_unsat_core"):
            raise AssertionError("curvature UNSAT core is missing")
        if "remain fixed" not in str(oracle.get("minimization_contract")):
            raise AssertionError("curvature UNSAT fixed-background contract is missing")
    else:
        raise AssertionError(f"unexpected curvature status {status}")
    oracle["all_recorded_curvature_replay_flags_asserted"] = True


def assert_checked_terminal_witness(witness: list[dict[str, Any]], n: int) -> None:
    if len(witness) != 4:
        raise AssertionError("checked terminal witness does not have four arcs")
    kinds = {str(arc["terminal_kind"]) for arc in witness}
    if len(kinds) != 1:
        raise AssertionError("checked terminal witness mixes terminal kinds")
    if len({(int(arc["center"]), str(arc["side"])) for arc in witness}) != 4:
        raise AssertionError("checked terminal witness repeats an arc identity")
    turn_sets = [set(map(int, arc["turn_indices"])) for arc in witness]
    if any(turn_sets[i] & turn_sets[j] for i in range(4) for j in range(i + 1, 4)):
        raise AssertionError("checked terminal turn supports overlap")
    starts = [int(arc["lifted_start"]) for arc in witness]
    finishes = [int(arc["lifted_finish"]) for arc in witness]
    if starts != sorted(starts):
        raise AssertionError("checked terminal lift is not ordered")
    kind = next(iter(kinds))
    full_union = set().union(*turn_sets) == set(range(n))
    if kind == "STRICT_OPEN_WINDOW":
        if not all(finishes[index] - 1 <= starts[index + 1] for index in range(3)):
            raise AssertionError("strict-window witness violates an ordered gap")
        if finishes[-1] - 1 >= starts[0] + n or full_union:
            raise AssertionError("strict-window witness does not leave an unused turn")
    elif kind == "FULL_COVER":
        if not all(finishes[index] - 1 == starts[index + 1] for index in range(3)):
            raise AssertionError("full-cover witness supports do not meet exactly")
        if finishes[-1] - 1 != starts[0] + n or not full_union:
            raise AssertionError("full-cover witness does not cover exactly one period")
    else:
        raise AssertionError(f"unknown checked terminal kind {kind}")


def curvature_refinement_decision(
    oracle: dict[str, Any], checked_terminals: list[list[dict[str, Any]]],
) -> dict[str, Any]:
    """Choose a cut only when a named checked Lean terminal supports it."""

    if oracle["solver_status"] == "SAT":
        if checked_terminals:
            raise AssertionError(
                "curvature-SAT ledger contains a checked four-arc terminal witness"
            )
        return {"status": "CURVATURE_SAT_SURVIVOR", "install_cut": False}
    if oracle["solver_status"] != "UNSAT":
        raise AssertionError(f"unexpected curvature status {oracle['solver_status']}")
    if not checked_terminals:
        return {
            "status": "UNPROVED_CURVATURE_CORE_NO_CHECKED_TERMINAL",
            "install_cut": False,
        }
    return {"status": "REFINE_WITH_CHECKED_TERMINAL", "install_cut": True}


def proof_check_unsat(cnf_path: Path, out_dir: Path, timeout: int) -> dict[str, Any]:
    proof = out_dir / "terminal.drat"
    cadical_log = out_dir / "terminal.proof.cadical.log"
    command = [
        "cadical", "--binary=false", "--checkproof=3", "-t", str(timeout),
        str(cnf_path), str(proof),
    ]
    completed = subprocess.run(command, capture_output=True, text=True, check=False)
    cadical_log.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    result: dict[str, Any] = {
        "cadical_command": command,
        "cadical_returncode": completed.returncode,
        "cadical_log_sha256": sha256(cadical_log),
        "proof_exists": proof.exists(),
    }
    if completed.returncode != 20 or not proof.exists():
        result["status"] = "UNSAT_PROOF_GENERATION_FAILED"
        return result
    trim_log = out_dir / "terminal.drat-trim.log"
    trimmed = subprocess.run(
        ["drat-trim", str(cnf_path), str(proof)],
        capture_output=True, text=True, check=False,
    )
    trim_log.write_text(trimmed.stdout + trimmed.stderr, encoding="utf-8")
    result.update(
        {
            "drat_trim_returncode": trimmed.returncode,
            "drat_trim_log_sha256": sha256(trim_log),
            "proof_sha256": sha256(proof),
            "status": (
                "VERIFIED_DRAT_UNSAT" if trimmed.returncode == 0
                else "DRAT_REPLAY_FAILED"
            ),
        }
    )
    return result


def run(args: argparse.Namespace) -> dict[str, Any]:
    out_dir = args.output_dir
    prepare_fresh_output_dir(out_dir)
    filtered_bank = prepare_kernel_kalmanson_bank()
    kalmanson_bank = KERNEL_KALMANSON_BANK
    exact_two = args.mode == "exact_two"
    cnf, metadata = ENCODER.encode(
        11,
        args.opp1_card,
        PLANAR_BANK,
        kalmanson_bank,
        U5_BANK,
        False,
        True,
        exact_two,
    )
    configure_mode(cnf, metadata, args.mode)
    installed: set[tuple[tuple[int, int], ...]] = set()
    seed = seed_stored_cores(cnf, 11, installed)
    continuation_seeds = [
        seed_previous_run(
            cnf, 11, installed, run_dir, args.mode, args.opp1_card
        )
        for run_dir in args.seed_run_dir
    ]
    manifest: dict[str, Any] = {
        "schema": "p97-unique4-curvature-core-cegar-v1",
        "epistemic_status": "RUNNING_FAIL_CLOSED",
        "claim_scope": (
            "Fixed n=11 finite projection only; neither a Euclidean realization nor "
            "arbitrary-cardinality Lean coverage"
        ),
        "mode": args.mode,
        "opp1_card": args.opp1_card,
        "driver_source": str(Path(__file__).resolve().relative_to(ROOT.resolve())),
        "driver_source_sha256": sha256(Path(__file__).resolve()),
        "outer_encoder": str(ENCODER_PATH.relative_to(ROOT)),
        "outer_encoder_sha256": sha256(ENCODER_PATH),
        "semantic_verifier": str(VERIFIER_PATH.relative_to(ROOT)),
        "semantic_verifier_sha256": sha256(VERIFIER_PATH),
        "stored_curvature_seed_registry": str(STORED_CURVATURE.relative_to(ROOT)),
        "stored_curvature_seed_registry_sha256": sha256(STORED_CURVATURE),
        "source_hash_bindings": source_hash_bindings(kalmanson_bank),
        "bank_sha256": {
            "planar": sha256(PLANAR_BANK),
            "kalmanson_kernel_only": sha256(kalmanson_bank),
            "kalmanson_full_diagnostic_source": sha256(FULL_KALMANSON_BANK),
            "u5": sha256(U5_BANK),
        },
        "checked_terminal_consumers": {
            "STRICT_OPEN_WINDOW": {
                "consumer": (
                    "Problem97.ATailUniqueFourTurnDisjointOccurrenceScratch."
                    "false_of_fourTurnDisjointSelectedRowArcs"
                ),
                "aggregate_consumer": (
                    "Problem97.ShellCurvature."
                    "false_of_four_turnDisjoint_quarter_turn_arcs"
                ),
                "source": str(SOURCE_TERMINAL.relative_to(ROOT)),
                "source_sha256": sha256(SOURCE_TERMINAL),
                "aggregate_source": str(AGGREGATE_TERMINAL.relative_to(ROOT)),
                "aggregate_source_sha256": sha256(AGGREGATE_TERMINAL),
            },
            "FULL_COVER": {
                "consumer": (
                    "Problem97.ATailUniqueFourTurnDisjointOccurrenceScratch."
                    "false_of_fourTurnCoveringSelectedRowArcs"
                ),
                "aggregate_consumer": (
                    "Problem97.ShellCurvature."
                    "false_of_four_turnCovering_quarter_turn_arcs"
                ),
                "source": str(SOURCE_TERMINAL.relative_to(ROOT)),
                "source_sha256": sha256(SOURCE_TERMINAL),
                "aggregate_source": str(AGGREGATE_TERMINAL.relative_to(ROOT)),
                "aggregate_source_sha256": sha256(AGGREGATE_TERMINAL),
            },
        },
        "kalmanson_bank_policy": {
            "primary": "KERNEL_CHECKED_ONLY",
            "kernel_schema_count": len(filtered_bank["schemas"]),
            "pending_farkas_schemas_excluded": (
                int(json.loads(FULL_KALMANSON_BANK.read_text(encoding="utf-8"))[
                    "schema_count"
                ]) - len(filtered_bank["schemas"])
            ),
        },
        "overlays": {
            "pair_minimality": True,
            "exact_two_strict_hit": exact_two,
            "aligned_ge3_strict_hit": not exact_two,
            "strict_cap_minimality": False,
        },
        "unproved_curvature_core_policy": (
            "FAIL_CLOSED_WITHOUT_CUT: UNPROVED_CURVATURE_CORE_NO_CHECKED_TERMINAL"
        ),
        "seeded_curvature_cores": seed,
        "additional_seed_runs": continuation_seeds,
        "round_cap": args.max_rounds,
        "rounds": [],
        "terminal_status": None,
    }
    manifest_path = out_dir / "manifest.json"
    write_json(manifest_path, manifest)

    cnf_path = out_dir / "current.cnf"
    for round_number in range(1, args.max_rounds + 1):
        metadata["checked_curvature_terminal_orbit_cut_count"] = cnf.block_counts.get(
            "checked_curvature_terminal_orbit_cut", 0
        )
        metadata["clause_count"] = len(cnf.clauses)
        metadata["clause_block_counts"] = dict(sorted(cnf.block_counts.items()))
        cnf.write_dimacs(cnf_path, metadata)
        solved, solver_log = ENCODER.solve(
            cnf, cnf_path, metadata, args.timeout_seconds, "cadical"
        )
        round_dir = out_dir / f"round_{round_number:03d}"
        round_dir.mkdir(parents=True, exist_ok=True)
        (round_dir / "cadical.log").write_text(solver_log, encoding="utf-8")
        result = {
            **metadata,
            "cnf_path": str(cnf_path),
            "cnf_sha256": sha256(cnf_path),
            **solved,
        }
        result_path = round_dir / "result.json"
        write_json(result_path, result)
        round_record: dict[str, Any] = {
            "round": round_number,
            "boolean_status": solved["solver_status"],
            "solver_elapsed_seconds": solved["solver_elapsed_seconds"],
            "cnf_sha256": result["cnf_sha256"],
            "checked_curvature_terminal_orbit_cut_count": metadata[
                "checked_curvature_terminal_orbit_cut_count"
            ],
        }
        if solved["solver_status"] == "UNKNOWN":
            manifest["terminal_status"] = "FAIL_CLOSED_BOOLEAN_UNKNOWN"
            manifest["rounds"].append(round_record)
            break
        if solved["solver_status"] == "UNSAT":
            manifest["terminal_status"] = "BOOLEAN_UNSAT_PENDING_PROOF_REPLAY"
            manifest["rounds"].append(round_record)
            proof_result = proof_check_unsat(cnf_path, out_dir, args.timeout_seconds)
            manifest["unsat_proof"] = proof_result
            if proof_result["status"] == "VERIFIED_DRAT_UNSAT":
                manifest["terminal_status"] = "VERIFIED_BOOLEAN_UNSAT"
            break

        semantic_replay_path = round_dir / "semantic_replay.json"
        semantic_replay = replay_sat_result(
            result, result_path, cnf_path, semantic_replay_path, args.mode,
            kalmanson_bank,
        )
        round_record.update(
            {
                "semantic_replay_status": semantic_replay["status"],
                "semantic_replay_sha256": sha256(semantic_replay_path),
                "all_recorded_replay_flags_asserted": semantic_replay[
                    "all_recorded_replay_flags_asserted"
                ],
            }
        )
        rows = {
            int(center): set(map(int, support))
            for center, support in result["rows"].items()
        }
        oracle = scalar_curvature_oracle(rows, 11)
        assert_curvature_oracle_replay(oracle)
        checked_terminals = four_checked_terminal_witnesses(oracle, 11)
        for witness in checked_terminals:
            assert_checked_terminal_witness(witness, 11)
        oracle["all_checked_terminal_witnesses_replayed"] = True
        distinct_center_checked = [
            witness for witness in checked_terminals
            if len({int(arc["center"]) for arc in witness}) == 4
        ]
        oracle["four_checked_terminal_witness_count"] = len(checked_terminals)
        oracle["terminal_kind_counts"] = {
            kind: sum(
                witness[0]["terminal_kind"] == kind
                for witness in checked_terminals
            )
            for kind in ("STRICT_OPEN_WINDOW", "FULL_COVER")
        }
        oracle["first_four_checked_terminal_witness"] = (
            checked_terminals[0] if checked_terminals else None
        )
        oracle["four_distinct_center_checked_terminal_witness_count"] = len(
            distinct_center_checked
        )
        oracle["first_four_distinct_center_checked_terminal_witness"] = (
            distinct_center_checked[0] if distinct_center_checked else None
        )
        minimal_center_sets = inclusion_minimal_witness_center_sets(checked_terminals)
        oracle["four_checked_terminal_unique_center_set_count"] = len({
            tuple(sorted({int(arc["center"]) for arc in witness}))
            for witness in checked_terminals
        })
        oracle["four_checked_terminal_inclusion_minimal_center_sets"] = (
            minimal_center_sets
        )
        refinement_decision = curvature_refinement_decision(
            oracle, checked_terminals
        )
        oracle["refinement_decision"] = refinement_decision
        write_json(round_dir / "curvature.json", oracle)
        round_record["curvature_status"] = oracle["solver_status"]
        if refinement_decision["status"] == "CURVATURE_SAT_SURVIVOR":
            terminal_result = out_dir / "terminal.result.json"
            write_json(terminal_result, result)
            write_json(out_dir / "terminal.replay.json", semantic_replay)
            write_json(out_dir / "terminal.curvature.json", oracle)
            manifest["terminal_status"] = "VERIFIED_CURVATURE_SAT_SURVIVOR"
            manifest["rounds"].append(round_record)
            break

        if not refinement_decision["install_cut"]:
            manifest["terminal_status"] = refinement_decision["status"]
            round_record.update(
                {
                    "curvature_core_row_sides_diagnostic_only": oracle[
                        "core_row_sides"
                    ],
                    "curvature_core_centers_diagnostic_only": oracle[
                        "core_centers"
                    ],
                    "cut_installed": False,
                }
            )
            manifest["rounds"].append(round_record)
            break

        installed_batches: list[dict[str, Any]] = []
        cut_source = (
            "all_inclusion_minimal_four_checked_terminal_witness_center_sets"
        )
        for support in minimal_center_sets:
            centers = list(map(int, support["centers"]))
            added = add_core_orbit_cuts(cnf, rows, centers, 11, installed)
            installed_batches.append(
                {
                    "centers": centers,
                    "terminal_kind": support["terminal_kind"],
                    "representative_witness": support["representative_witness"],
                    "orbit_cuts_added": len(added),
                    "canonical_memberships": (
                        [list(pair) for pair in min(added)] if added else None
                    ),
                }
            )
        total_added = sum(batch["orbit_cuts_added"] for batch in installed_batches)
        if total_added == 0:
            manifest["terminal_status"] = "FAIL_CLOSED_DUPLICATE_CURVATURE_CORE"
            round_record["attempted_cut_batches"] = installed_batches
            manifest["rounds"].append(round_record)
            break
        center_sets_digest = hashlib.sha256(json.dumps(
            [batch["centers"] for batch in installed_batches],
            separators=(",", ":"),
        ).encode("utf-8")).hexdigest()
        core_record = {
            "round": round_number,
            "result_sha256": sha256(round_dir / "result.json"),
            "curvature_sha256": sha256(round_dir / "curvature.json"),
            "core_row_sides": oracle["core_row_sides"],
            "core_centers": oracle["core_centers"],
            "core_requires_more_than_four_arcs": oracle[
                "core_requires_more_than_four_arcs"
            ],
            "four_checked_terminal_witness_count": len(checked_terminals),
            "terminal_kind_counts": oracle["terminal_kind_counts"],
            "four_distinct_center_checked_terminal_witness_count": len(
                distinct_center_checked
            ),
            "cut_source": cut_source,
            "unique_supporting_center_set_count": oracle[
                "four_checked_terminal_unique_center_set_count"
            ],
            "inclusion_minimal_supporting_center_set_count": len(installed_batches),
            "installed_cut_batches": installed_batches,
            "installed_center_sets_sha256": center_sets_digest,
            "orbit_cuts_added": total_added,
        }
        write_json(round_dir / "installed_core.json", core_record)
        round_record.update(core_record)
        manifest["rounds"].append(round_record)
        write_json(manifest_path, manifest)
    else:
        manifest["terminal_status"] = "ROUND_CAP_REACHED_UNRESOLVED"

    final_cnf = finalize_cnf_checkpoint(
        cnf, metadata, cnf_path,
        rewrite=manifest["terminal_status"] == "ROUND_CAP_REACHED_UNRESOLVED",
    )
    manifest["finished_unix"] = time.time()
    manifest["final_cnf_checkpoint"] = final_cnf
    write_json(manifest_path, manifest)
    return manifest


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mode", choices=("exact_two", "aligned_ge3"), required=True)
    parser.add_argument("--opp1-card", type=int, choices=(4, 5), required=True)
    parser.add_argument("--max-rounds", type=int, default=20)
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument(
        "--seed-run-dir", type=Path, action="append", default=[],
        help="replay theorem-backed refinement cuts from an earlier matching run",
    )
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    if args.mode == "aligned_ge3" and args.opp1_card != 5:
        parser.error("aligned_ge3 requires --opp1-card 5")
    if args.max_rounds <= 0:
        parser.error("--max-rounds must be positive")
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    result = run(args)
    print(json.dumps({
        "terminal_status": result["terminal_status"],
        "round_count": len(result["rounds"]),
        "manifest": str(args.output_dir / "manifest.json"),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
