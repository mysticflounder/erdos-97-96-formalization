#!/usr/bin/env python3
"""Audit the two provenance-preserving robust arms against shell curvature.

This is an exact n=11 finite projection.  It starts from the current
complete-radius outer encoding, enables the exact-two and strict-cap
minimal-deletion overlays, and then specializes the minimal deletion set to:

* ``collision``: two deleted sources in one complete class of size at least
  five; or
* ``packed``: two deleted sources in distinct exact four-classes, with the
  cap-intersection bound that yields the stored cap-complement packing.

Every four-subset of the collision class, or both exact packed classes, is
made available as a completion row.  Each concrete row keeps its own identity
through a full-linear Kalmanson replay, including multiple rows at one center.
A SAT output is accepted only when that replay and the joint exact rational
curvature ledger are feasible and no checked strict-window or full-cover
four-arc terminal exists among any retained row.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import subprocess
import sys
import time
from fractions import Fraction
from pathlib import Path
from typing import Any, Iterable

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OUTER_PATH = HERE.parent / "unique-arm-whole-carrier-source-audit" / "exact_four_outer.py"
PLANAR_BANK = HERE.parent / "whole-carrier-planar-rank-cegar" / "planar_schema_bank.json"
KALMANSON_BANK = (
    HERE.parent / "unique4-curvature-occurrence-census" / "kalmanson_schema_bank.kernel_only.json"
)
U5_BANK = HERE.parent / "unique-arm-whole-carrier-source-audit" / "u5_signed_schema_bank.json"
LEAN_SOURCE = HERE / "RobustProvenanceCurvature.lean"
FULL_LINEAR_PATH = HERE.parent / "generic-biapex-kalmanson-search" / "cegar.py"


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


OUTER = load_module("robust_provenance_outer", OUTER_PATH)
sys.path.insert(0, str(FULL_LINEAR_PATH.parent))
FULL_LINEAR = load_module("robust_provenance_full_linear", FULL_LINEAR_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def eq_var(cnf: Any, center: int, left: int, right: int) -> int:
    if left == right or center in {left, right}:
        raise ValueError((center, left, right))
    return cnf.ids[f"eq_{center}_{min(left, right)}_{max(left, right)}"]


def class_negated_literal(cnf: Any, center: int, anchor: int, point: int) -> int | None:
    """Negation of ``point`` belonging to the anchor class at center.

    ``None`` represents the always-true anchor membership, so its negation is
    false and can be omitted from a clause.
    """

    if point == anchor:
        return None
    if point == center:
        raise ValueError("the positive-radius class cannot contain its center")
    return -eq_var(cnf, center, anchor, point)


def cap_data(
    n: int, profile: int
) -> tuple[set[int], set[int], list[set[int]], tuple[int, int, int]]:
    first_apex = 0
    second_apex = 4
    surplus_vertex = 4 + (profile - 2) + 1
    triangle = {first_apex, second_apex, surplus_vertex}
    protected_triangle = set(triangle)
    caps = [
        set(range(first_apex, second_apex + 1)),
        set(range(second_apex, surplus_vertex + 1)),
        {surplus_vertex, *range(surplus_vertex + 1, n), first_apex},
    ]
    # cap i is physically opposite opposite_vertices[i].
    opposite_vertices = (surplus_vertex, first_apex, second_apex)
    return triangle, protected_triangle, caps, opposite_vertices


def add_arm_constraints(cnf: Any, n: int, profile: int, mode: str) -> None:
    vertices = tuple(range(n))
    minimum_center = [cnf.ids[f"minimality_center_{point}"] for point in vertices]
    deleted = [cnf.ids[f"minimality_deleted_{point}"] for point in vertices]
    OUTER.add_exactly_k(cnf, tuple(deleted), 2, "robust_arm_deleted_exact_two")

    # Full robustness omits the new center from the fixed critical-map image.
    for center in vertices:
        for source in vertices:
            cnf.add(
                "robust_arm_center_omitted_from_blocker_image",
                [-minimum_center[center], -cnf.ids[f"b_{source}_{center}"]],
            )

    # The two deleted sources either collide in one radius class or index two
    # distinct classes of a minimal deletion core.
    for center in vertices:
        for left, right in itertools.combinations(
            (point for point in vertices if point != center), 2
        ):
            equality = eq_var(cnf, center, left, right)
            tail = equality if mode == "collision" else -equality
            cnf.add(
                f"robust_{mode}_deleted_radius_relation",
                [-minimum_center[center], -deleted[left], -deleted[right], tail],
            )

    # At a strict-cap center every exact four-shell has at most two points in
    # that center's closed physical cap.  On the collision arm this applies to
    # the actual large class; on the packed arm it is the source of
    # 2*|V| <= |A cap-complement| for the disjoint exact shells.
    triangle, _protected_triangle, caps, opposite_vertices = cap_data(n, profile)

    # Checked displayed-cap row geometry omitted by the shared outer encoder:
    # a row centered in a displayed cap meets that cap in at most two points;
    # at a triangle endpoint, either incident cap is one-sided and contributes
    # at most one row point.  These apply to every selected carrier row, hence
    # in particular to both fixed-image rows.
    for center in vertices:
        for cap_index, cap in enumerate(caps):
            if center not in cap:
                continue
            for triple in itertools.combinations(sorted(cap), 3):
                cnf.add(
                    "displayed_cap_selected_row_intersection_at_most_two",
                    [-cnf.ids[f"m_{center}_{point}"] for point in triple],
                )
            if center in triangle and center != opposite_vertices[cap_index]:
                for pair in itertools.combinations(sorted(cap), 2):
                    cnf.add(
                        "displayed_cap_endpoint_row_intersection_at_most_one",
                        [-cnf.ids[f"m_{center}_{point}"] for point in pair],
                    )
    for center in vertices:
        if center in triangle:
            continue
        own_caps = [cap for cap in caps if center in cap and center not in triangle]
        if len(own_caps) != 1:
            raise AssertionError((center, own_caps))
        own_cap = own_caps[0]
        if n - len(own_cap) < 4:
            raise AssertionError("the numerical packed-core bound is unavailable")
        for source in vertices:
            if source == center:
                continue
            for triple in itertools.combinations(sorted(own_cap - {center}), 3):
                literals = [-minimum_center[center], -deleted[source]]
                impossible = False
                for point in triple:
                    if point == source:
                        continue
                    if point == center:
                        impossible = True
                        break
                    literals.append(-eq_var(cnf, center, source, point))
                if not impossible:
                    cnf.add(
                        f"robust_{mode}_class_cap_intersection_at_most_two",
                        literals,
                    )


def assignment_from_true_names(cnf: Any, names: Iterable[str]) -> set[int]:
    true_ids = {cnf.ids[name] for name in names}
    return {
        identifier if identifier in true_ids else -identifier
        for identifier in range(1, len(cnf.names))
    }


def solve_cnf(cnf: Any, path: Path, timeout: int) -> tuple[str, set[int], str]:
    metadata = {"variable_count": len(cnf.names) - 1, "clause_count": len(cnf.clauses)}
    cnf.write_dimacs(path, metadata)
    completed = subprocess.run(
        ["cadical", "-t", str(timeout), str(path)],
        capture_output=True,
        text=True,
        check=False,
        timeout=timeout + 30,
    )
    log = completed.stdout + completed.stderr
    if completed.returncode == 10:
        return "SAT", OUTER.parse_assignment(completed.stdout), log
    if completed.returncode == 20:
        return "UNSAT", set(), log
    return "UNKNOWN", set(), log


def decoded_rows(decoded: dict[str, Any], mode: str) -> list[dict[str, Any]]:
    n = len(decoded["rows"])
    center = int(decoded["strict_cap_minimality_witness"]["center"])
    deleted = list(map(int, decoded["strict_cap_minimality_witness"]["deleted_set"]))
    rows = [
        {
            "key": f"fixed:{row_center}",
            "kind": "fixed-system-or-global-K4-row",
            "center": row_center,
            "support": tuple(map(int, decoded["rows"][str(row_center)])),
        }
        for row_center in range(n)
    ]
    classes = [set(map(int, radius_class)) for radius_class in decoded["radius_classes"][str(center)]]
    if mode == "collision":
        containing = [radius_class for radius_class in classes if set(deleted) <= radius_class]
        if len(containing) != 1 or len(containing[0]) < 5:
            raise AssertionError((deleted, containing))
        full_class = containing[0]
        for support in itertools.combinations(sorted(full_class), 4):
            rows.append(
                {
                    "key": f"collision:{center}:{','.join(map(str, support))}",
                    "kind": "four-subset-of-actual-five-class",
                    "center": center,
                    "support": support,
                    "class_anchor": deleted[0],
                }
            )
    else:
        for source in deleted:
            containing = [radius_class for radius_class in classes if source in radius_class]
            if len(containing) != 1 or len(containing[0]) != 4:
                raise AssertionError((source, containing))
            support = tuple(sorted(containing[0]))
            rows.append(
                {
                    "key": f"packed:{center}:{source}",
                    "kind": "actual-minimal-core-shell",
                    "center": center,
                    "support": support,
                    "class_anchor": source,
                }
            )

    # The same mathematical row can be reached through the global K4 choice
    # and the arm-specific provenance.  Keep one copy with the stronger origin.
    by_geometry: dict[tuple[int, tuple[int, ...]], dict[str, Any]] = {}
    for row in rows:
        key = (int(row["center"]), tuple(row["support"]))
        previous = by_geometry.get(key)
        if previous is None or row["kind"] != "fixed-system-or-global-K4-row":
            by_geometry[key] = row
    return list(by_geometry.values())


def verify_displayed_cap_row_bounds(
    rows: list[dict[str, Any]], n: int, profile: int
) -> None:
    """Replay the checked cap bounds directly on every retained row."""

    triangle, _protected_triangle, caps, opposite_vertices = cap_data(n, profile)
    for row in rows:
        center = int(row["center"])
        support = set(map(int, row["support"]))
        for cap_index, cap in enumerate(caps):
            if center not in cap:
                continue
            if len(support & cap) > 2:
                raise AssertionError(("own-cap-row-bound", row, cap_index))
            if (
                center in triangle
                and center != opposite_vertices[cap_index]
                and len(support & cap) > 1
            ):
                raise AssertionError(("endpoint-one-hit", row, cap_index))


def row_ledger(rows: list[dict[str, Any]], n: int) -> list[dict[str, Any]]:
    answer = []
    for row in rows:
        center = int(row["center"])
        support = set(map(int, row["support"]))
        offsets = sorted((center - point) % n for point in support)
        if len(offsets) != 4 or offsets[0] == 0:
            raise AssertionError((center, support, offsets))
        global_start = (-center) % n
        answer.append(
            {
                **row,
                "left_start": global_start,
                "left_finish": global_start + offsets[1],
                "left_turns": [(global_start + offset) % n for offset in range(offsets[1] - 1)],
                "right_start": global_start + offsets[2],
                "right_finish": global_start + n,
                "right_turns": [
                    (global_start + offset) % n for offset in range(offsets[2], n - 1)
                ],
            }
        )
    return answer


def curvature_oracle(ledger: list[dict[str, Any]], n: int) -> dict[str, Any]:
    turns = [z3.Real(f"turn_{index}") for index in range(n)]
    solver = z3.SolverFor("QF_LRA")
    solver.add(z3.Sum(*turns) == z3.RatVal(4, 1))
    solver.add(*(turn > 0 for turn in turns))
    solver.add(*(turn < 2 for turn in turns))
    for row in ledger:
        solver.add(z3.Sum(*(turns[index] for index in row["left_turns"])) > 1)
        solver.add(z3.Sum(*(turns[index] for index in row["right_turns"])) > 1)
    status = solver.check()
    result: dict[str, Any] = {"solver_status": str(status).upper()}
    if status == z3.sat:
        model = solver.model()
        result["turn_model"] = [
            str(model.eval(turn, model_completion=True)) for turn in turns
        ]
    return result


def full_linear_row_instance_check(
    rows: list[dict[str, Any]], n: int, timeout_ms: int
) -> dict[str, Any]:
    """Tracked full-linear checker with explicit row-instance identities.

    The shared ``metric_check`` takes a map from center to one support and
    therefore cannot represent this lane's collision/packed rows at one
    repeated center.  This is the same positivity, Kalmanson, triangle, and
    selected-row equality system, but every row record gets its own tracked
    identity.
    """

    started = time.monotonic()
    deadline = started + timeout_ms / 1000
    solver = z3.Solver()
    table = FULL_LINEAR.distance_table(n)
    tracked: dict[str, dict[str, Any]] = {}

    def track(
        name: str,
        formula: z3.BoolRef,
        kind: str,
        vertices: tuple[int, ...],
        row_index: int | None = None,
    ) -> None:
        if name in tracked:
            raise RuntimeError(f"duplicate full-linear constraint: {name}")
        tracked[name] = {
            "formula": formula,
            "kind": kind,
            "vertices": vertices,
            "row_index": row_index,
        }
        solver.assert_and_track(formula, z3.Bool(name))

    for (left, right), variable in table.items():
        track(f"pos_{left}_{right}", variable >= 1, "positivity", (left, right))

    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = FULL_LINEAR.dist(table, a, c) + FULL_LINEAR.dist(table, b, d)
        track(
            f"kal1_{a}_{b}_{c}_{d}",
            diagonals
            >= FULL_LINEAR.dist(table, a, b)
            + FULL_LINEAR.dist(table, c, d)
            + 1,
            "kalmanson_diagonals_vs_ab_cd",
            (a, b, c, d),
        )
        track(
            f"kal2_{a}_{b}_{c}_{d}",
            diagonals
            >= FULL_LINEAR.dist(table, a, d)
            + FULL_LINEAR.dist(table, b, c)
            + 1,
            "kalmanson_diagonals_vs_ad_bc",
            (a, b, c, d),
        )

    for a, b, c in itertools.combinations(range(n), 3):
        track(
            f"tri0_{a}_{b}_{c}",
            FULL_LINEAR.dist(table, a, b) + FULL_LINEAR.dist(table, b, c)
            >= FULL_LINEAR.dist(table, a, c),
            "triangle_ab_bc_ac",
            (a, b, c),
        )
        track(
            f"tri1_{a}_{b}_{c}",
            FULL_LINEAR.dist(table, a, c) + FULL_LINEAR.dist(table, b, c)
            >= FULL_LINEAR.dist(table, a, b),
            "triangle_ac_bc_ab",
            (a, b, c),
        )
        track(
            f"tri2_{a}_{b}_{c}",
            FULL_LINEAR.dist(table, a, b) + FULL_LINEAR.dist(table, a, c)
            >= FULL_LINEAR.dist(table, b, c),
            "triangle_ab_ac_bc",
            (a, b, c),
        )

    for row_index, row in enumerate(rows):
        center = int(row["center"])
        support = tuple(map(int, row["support"]))
        anchor = support[0]
        for equality_index, point in enumerate(support[1:]):
            track(
                f"rowinst_{row_index}_{equality_index}_{center}_{anchor}_{point}",
                FULL_LINEAR.dist(table, center, point)
                == FULL_LINEAR.dist(table, center, anchor),
                "row_equality",
                (center, anchor, point),
                row_index,
            )

    remaining_ms = FULL_LINEAR.bounded_timeout_ms(timeout_ms, deadline)
    if remaining_ms is None:
        return {"solver_status": "UNKNOWN", "reason": "wall budget"}
    solver.set(timeout=remaining_ms)
    status = solver.check()
    if status == z3.sat:
        model = solver.model()
        distances = {
            f"{left},{right}": str(model.eval(variable, model_completion=True))
            for (left, right), variable in table.items()
        }
        return {
            "solver_status": "SAT",
            "distances": distances,
            "elapsed_seconds": time.monotonic() - started,
        }
    if status == z3.unknown:
        return {
            "solver_status": "UNKNOWN",
            "reason": solver.reason_unknown(),
            "elapsed_seconds": time.monotonic() - started,
        }

    core_names = [str(item) for item in solver.unsat_core()]
    # Greedy deletion-minimize while the same explicit wall budget remains.
    changed = True
    while changed:
        changed = False
        for name in tuple(core_names):
            remaining_ms = FULL_LINEAR.bounded_timeout_ms(timeout_ms, deadline)
            if remaining_ms is None:
                break
            candidate = [item for item in core_names if item != name]
            minimizer = z3.Solver()
            minimizer.set(timeout=remaining_ms)
            minimizer.add(*(tracked[item]["formula"] for item in candidate))
            if minimizer.check() == z3.unsat:
                core_names = candidate
                changed = True

    row_indices = sorted(
        {
            int(tracked[name]["row_index"])
            for name in core_names
            if tracked[name]["row_index"] is not None
        }
    )
    return {
        "solver_status": "UNSAT",
        "metric_core": core_names,
        "dependency_row_instances": [rows[index] for index in row_indices],
        "dependency_row_indices": row_indices,
        "core_vertices": sorted(
            {
                int(vertex)
                for name in core_names
                for vertex in tracked[name]["vertices"]
            }
        ),
        "constraint_kinds": [tracked[name]["kind"] for name in core_names],
        "elapsed_seconds": time.monotonic() - started,
    }


def checked_terminals(ledger: list[dict[str, Any]], n: int) -> list[list[dict[str, Any]]]:
    arcs = []
    for row in ledger:
        for side in ("left", "right"):
            turns = frozenset(map(int, row[f"{side}_turns"]))
            if not turns:
                raise AssertionError("empty shell-curvature outer arc")
            arcs.append(
                {
                    "row_key": row["key"],
                    "row_kind": row["kind"],
                    "center": int(row["center"]),
                    "support": list(map(int, row["support"])),
                    "class_anchor": row.get("class_anchor"),
                    "side": side,
                    "start": int(row[f"{side}_start"]),
                    "finish": int(row[f"{side}_finish"]),
                    "turns": sorted(turns),
                }
            )
    shifted = [
        {**arc, "lifted_start": arc["start"] + shift * n, "lifted_finish": arc["finish"] + shift * n}
        for arc in arcs
        for shift in range(-2, 3)
    ]
    witnesses = []
    seen = set()
    for chosen in itertools.combinations(shifted, 4):
        if len({(arc["row_key"], arc["side"]) for arc in chosen}) != 4:
            continue
        turn_sets = [set(arc["turns"]) for arc in chosen]
        if any(turn_sets[i] & turn_sets[j] for i in range(4) for j in range(i + 1, 4)):
            continue
        ordered = sorted(chosen, key=lambda arc: (arc["lifted_start"], arc["lifted_finish"]))
        if any(ordered[i]["lifted_finish"] - 1 > ordered[i + 1]["lifted_start"] for i in range(3)):
            continue
        window = ordered[0]["lifted_start"]
        last = ordered[-1]["lifted_finish"] - 1
        full = set().union(*turn_sets) == set(range(n))
        meets = all(ordered[i]["lifted_finish"] - 1 == ordered[i + 1]["lifted_start"] for i in range(3))
        if last < window + n and not full:
            kind = "STRICT_OPEN_WINDOW"
        elif last == window + n and meets and full:
            kind = "FULL_COVER"
        else:
            continue
        key = (kind, tuple((arc["row_key"], arc["side"], arc["lifted_start"] - window) for arc in ordered))
        if key in seen:
            continue
        seen.add(key)
        witnesses.append([{**arc, "terminal_kind": kind} for arc in ordered])
    return witnesses


def witness_cut(cnf: Any, decoded: dict[str, Any], witness: list[dict[str, Any]]) -> list[int]:
    center = int(decoded["strict_cap_minimality_witness"]["center"])
    literals = []
    for arc in witness:
        support = set(map(int, arc["support"]))
        if arc["row_kind"] == "fixed-system-or-global-K4-row":
            row_center = int(arc["center"])
            literals.extend(-cnf.ids[f"m_{row_center}_{point}"] for point in support)
        else:
            literals.append(-cnf.ids[f"minimality_center_{center}"])
            anchor = int(arc["class_anchor"])
            for point in support:
                literal = class_negated_literal(cnf, center, anchor, point)
                if literal is not None:
                    literals.append(literal)
    return list(dict.fromkeys(literals))


def signed_names(cnf: Any, literals: Iterable[int]) -> list[str]:
    return [("+" if literal > 0 else "-") + cnf.names[abs(literal)] for literal in literals]


def add_named_cut(cnf: Any, names: Iterable[str]) -> None:
    literals = []
    for signed in names:
        identifier = cnf.ids[signed[1:]]
        literals.append(identifier if signed[0] == "+" else -identifier)
    cnf.add("checked_robust_curvature_terminal_cut", literals)


def build_base(profile: int, mode: str) -> tuple[Any, dict[str, Any]]:
    cnf, metadata = OUTER.encode(
        11,
        profile,
        PLANAR_BANK,
        KALMANSON_BANK,
        U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )
    add_arm_constraints(cnf, 11, profile, mode)
    return cnf, metadata


def verify_final(cnf: Any, manifest: dict[str, Any]) -> None:
    assignment = assignment_from_true_names(cnf, manifest["true_variable_names"])
    OUTER.check_cnf_model(cnf, assignment)
    decoded = OUTER.decode_sat(cnf, assignment, manifest["outer_metadata"])
    if decoded != manifest["decoded_model"]:
        raise AssertionError("decoded model drift")
    rows = decoded_rows(decoded, manifest["mode"])
    verify_displayed_cap_row_bounds(rows, 11, manifest["profile"])
    full_linear = full_linear_row_instance_check(
        rows, 11, manifest["full_linear_timeout_ms"]
    )
    if full_linear["solver_status"] != "SAT":
        raise AssertionError(("full-linear replay", full_linear["solver_status"]))
    ledger = row_ledger(rows, 11)
    oracle = curvature_oracle(ledger, 11)
    terminals = checked_terminals(ledger, 11)
    if oracle["solver_status"] != "SAT" or terminals:
        raise AssertionError((oracle["solver_status"], len(terminals)))


def run(args: argparse.Namespace) -> dict[str, Any]:
    args.output_dir.mkdir(parents=True, exist_ok=True)
    if any(args.output_dir.iterdir()):
        raise FileExistsError(f"refusing nonempty output directory: {args.output_dir}")
    cnf, metadata = build_base(args.profile, args.mode)
    starting_hashes = {
        "audit": sha256(Path(__file__)),
        "outer": sha256(OUTER_PATH),
        "lean_source": sha256(LEAN_SOURCE),
        "planar_bank": sha256(PLANAR_BANK),
        "kalmanson_bank": sha256(KALMANSON_BANK),
        "u5_bank": sha256(U5_BANK),
        "full_linear_checker": sha256(FULL_LINEAR_PATH),
    }
    base_manifest = {
        "schema": "p97-unique4-robust-provenance-curvature-regression-v2",
        "epistemic_status": "EXACT_FINITE_PROJECTION_SOLVER_EVIDENCE",
        "claim_scope": "fixed n=11 projection only; not a Euclidean realization or Lean counterexample",
        "profile": args.profile,
        "mode": args.mode,
        "source_hashes": starting_hashes,
        "outer_metadata": metadata,
        "base_variable_count": len(cnf.names) - 1,
        "base_clause_count": len(cnf.clauses),
        "full_linear_timeout_ms": args.full_linear_timeout_seconds * 1000,
        "added_source_theorems": [
            "CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two",
            "CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one",
            "CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one",
        ],
    }

    def finish(payload: dict[str, Any]) -> dict[str, Any]:
        current_hashes = {
            "audit": sha256(Path(__file__)),
            "outer": sha256(OUTER_PATH),
            "lean_source": sha256(LEAN_SOURCE),
            "planar_bank": sha256(PLANAR_BANK),
            "kalmanson_bank": sha256(KALMANSON_BANK),
            "u5_bank": sha256(U5_BANK),
            "full_linear_checker": sha256(FULL_LINEAR_PATH),
        }
        if current_hashes != starting_hashes:
            raise AssertionError(("source drift during run", starting_hashes, current_hashes))
        return {**base_manifest, **payload}
    cuts: list[list[str]] = []
    rounds = []
    for round_number in range(1, args.round_cap + 1):
        print(
            f"profile={args.profile} mode={args.mode} round={round_number} "
            f"cuts={len(cuts)} clauses={len(cnf.clauses)}",
            file=sys.stderr,
            flush=True,
        )
        cnf_path = args.output_dir / f"round_{round_number:03d}.cnf"
        status, assignment, log = solve_cnf(cnf, cnf_path, args.timeout_seconds)
        (args.output_dir / f"round_{round_number:03d}.cadical.log").write_text(log)
        record: dict[str, Any] = {"round": round_number, "boolean_status": status}
        rounds.append(record)
        print(
            f"profile={args.profile} mode={args.mode} round={round_number} "
            f"boolean={status}",
            file=sys.stderr,
            flush=True,
        )
        if status != "SAT":
            return finish({"terminal_status": status, "rounds": rounds, "cuts": cuts})
        OUTER.check_cnf_model(cnf, assignment)
        decoded = OUTER.decode_sat(cnf, assignment, metadata)
        rows = decoded_rows(decoded, args.mode)
        verify_displayed_cap_row_bounds(rows, 11, args.profile)
        full_linear = full_linear_row_instance_check(
            rows, 11, args.full_linear_timeout_seconds * 1000
        )
        record["full_linear_status"] = full_linear["solver_status"]
        print(
            f"profile={args.profile} mode={args.mode} round={round_number} "
            f"full-linear={full_linear['solver_status']}",
            file=sys.stderr,
            flush=True,
        )
        if full_linear["solver_status"] != "SAT":
            terminal = (
                "MODEL_KILLED_BY_FULL_LINEAR"
                if full_linear["solver_status"] == "UNSAT"
                else "FULL_LINEAR_UNKNOWN"
            )
            return finish({
                "terminal_status": terminal,
                "rounds": rounds,
                "cuts": cuts,
                "full_linear": full_linear,
            })
        ledger = row_ledger(rows, 11)
        oracle = curvature_oracle(ledger, 11)
        terminals = checked_terminals(ledger, 11)
        record.update(
            {
                "completion_center": decoded["strict_cap_minimality_witness"]["center"],
                "deleted_set": decoded["strict_cap_minimality_witness"]["deleted_set"],
                "retained_row_count": len(rows),
                "curvature_status": oracle["solver_status"],
                "checked_terminal_count": len(terminals),
            }
        )
        print(
            f"profile={args.profile} mode={args.mode} round={round_number} "
            f"curvature={oracle['solver_status']} terminals={len(terminals)}",
            file=sys.stderr,
            flush=True,
        )
        if oracle["solver_status"] == "SAT":
            if terminals:
                raise AssertionError("curvature-SAT ledger has a checked terminal")
            true_names = sorted(cnf.names[literal] for literal in assignment if literal > 0)
            manifest = finish({
                "epistemic_status": "EXACT_FINITE_PROJECTION_COUNTERPATTERN",
                "rounds": rounds,
                "cuts": cuts,
                "decoded_model": decoded,
                "retained_rows": rows,
                "full_linear": full_linear,
                "curvature": oracle,
                "true_variable_names": true_names,
                "terminal_status": "SAT_NO_CHECKED_CURVATURE_TERMINAL",
            })
            verify_final(cnf, manifest)
            return manifest
        if oracle["solver_status"] != "UNSAT" or not terminals:
            return finish({
                "terminal_status": "UNPROVED_CURVATURE_CORE_NO_CHECKED_TERMINAL",
                "rounds": rounds,
                "cuts": cuts,
            })
        if not args.allow_literal_refinement:
            return finish({
                "terminal_status": "MODEL_KILLED_BY_SHELL_CURVATURE",
                "rounds": rounds,
                "cuts": cuts,
                "checked_terminal_count": len(terminals),
                "first_checked_terminal": terminals[0],
            })
        # Every checked witness is an independently sound curvature terminal.
        # Bank all distinct witness cuts from this expensive Boolean model so
        # the next round cannot rediscover another placement of the same
        # row-level obstruction.
        known = {tuple(names) for names in cuts}
        for witness in terminals:
            names = signed_names(cnf, witness_cut(cnf, decoded, witness))
            key = tuple(names)
            if key in known:
                continue
            known.add(key)
            cuts.append(names)
            add_named_cut(cnf, names)
    return finish({"terminal_status": "ROUND_CAP_REACHED", "rounds": rounds, "cuts": cuts})


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", type=int, choices=(4, 5), required=True)
    parser.add_argument("--mode", choices=("collision", "packed"), required=True)
    parser.add_argument("--round-cap", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument("--full-linear-timeout-seconds", type=int, default=120)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument(
        "--allow-literal-refinement",
        action="store_true",
        help="continue by banking literal row cuts; off by default because full-linear schema refinement is preferred",
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    manifest_path = args.output_dir / "manifest.json"
    if args.check:
        manifest = json.loads(manifest_path.read_text())
        if manifest["profile"] != args.profile or manifest["mode"] != args.mode:
            raise AssertionError("argument/manifest mismatch")
        current_hashes = {
            "audit": sha256(Path(__file__)),
            "outer": sha256(OUTER_PATH),
            "lean_source": sha256(LEAN_SOURCE),
            "planar_bank": sha256(PLANAR_BANK),
            "kalmanson_bank": sha256(KALMANSON_BANK),
            "u5_bank": sha256(U5_BANK),
            "full_linear_checker": sha256(FULL_LINEAR_PATH),
        }
        if manifest["source_hashes"] != current_hashes:
            raise AssertionError("source or bank hash drift")
        cnf, _metadata = build_base(args.profile, args.mode)
        if len(cnf.names) - 1 != manifest["base_variable_count"]:
            raise AssertionError("base variable-count drift")
        if len(cnf.clauses) != manifest["base_clause_count"]:
            raise AssertionError("base clause-count drift")
        for names in manifest["cuts"]:
            add_named_cut(cnf, names)
        if manifest["terminal_status"] == "SAT_NO_CHECKED_CURVATURE_TERMINAL":
            verify_final(cnf, manifest)
            print("PASS: robust provenance curvature SAT regression replays exactly")
        else:
            print("PASS: robust provenance curvature terminal checkpoint is hash-bound")
        return
    manifest = run(args)
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "terminal_status": manifest["terminal_status"],
        "rounds": len(manifest["rounds"]),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
