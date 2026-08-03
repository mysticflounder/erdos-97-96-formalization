#!/usr/bin/env python3
"""Staged QF_NRA encoder for a replay-PASS crossed-arm v4/v5/v7/v8/v9 witness.

Self-check and smoke modes never solve the 17-point target.  Target solving is
available only through the explicit ``--solve`` action.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
AUDIT_ROOT = HERE.parent / "crossed-arm-audit"
DEFAULT_WITNESS = (
    AUDIT_ROOT
    / "source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s"
    / "witness.json"
)
SOURCE_SCHEMAS = {
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v4",
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v5",
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v7",
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v8",
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v9",
}
RESULT_SCHEMA = "crossed-arm-full-radius-qf-nra-v7"
CONVEX_FIVE_POINT_FAMILY = "convex_five_point_core"
STAGES = ("metric", "adjacent-turns", "supporting-edges", "all-triples")
REPLAY_FIELDS = (
    "cap_block_position_replay",
    "cap_crossing_kalmanson_replay",
    "crossed_arm_replay",
    "full_shared_pair_separation_replay",
    "geometric_incidence_replay",
)


@dataclass(frozen=True)
class Atom:
    name: str
    family: str
    term: Any


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_witness(path: Path) -> tuple[dict[str, Any], dict[str, Any]]:
    """Validate supported provenance, replay markers, and full radius partitions."""
    path = path.resolve()
    require(path.is_file(), f"witness does not exist: {path}")
    result_path = path.with_name("result.json")
    require(result_path.is_file(), f"missing sibling CEGAR result: {result_path}")
    data = json.loads(path.read_text())
    source_result = json.loads(result_path.read_text())

    source_schema = source_result.get("schema")
    require(
        source_schema in SOURCE_SCHEMAS,
        "source result schema is not supported v4/v5/v7/v8/v9",
    )
    full_bank_schema = source_schema.endswith(("-v8", "-v9"))
    require(source_result.get("status") == "SAT", "source result is not SAT")
    require(source_result.get("n") == 17, "source result is not n=17")
    require(
        source_result.get("crossed_complementary_omissions_encoded") is True,
        "source result lacks crossed complementary omissions",
    )
    require(
        source_result.get("all_registered_selected_row_and_raw_equality_theorem_families_encoded")
        is True,
        "source result lacks the registered theorem-bank marker",
    )
    if source_schema.endswith(("-v5", "-v7", "-v8", "-v9")):
        require(
            source_result.get("all_raw_btw_sep_cyclic_cuts_encoded") is True,
            f"{source_schema.rsplit('-', 1)[-1]} source result lacks the raw btw_sep cyclic-cut marker",
        )
    if source_schema.endswith(("-v7", "-v8", "-v9")):
        require(
            source_result.get("global_undirected_edge_equality_closure_encoded") is True,
            f"{source_schema.rsplit('-', 1)[-1]} source result lacks the global edge-equality marker",
        )
    if full_bank_schema:
        schema_version = source_schema.rsplit("-", 1)[-1]
        require(
            source_result.get("collision_deletion_packet_encoded") is True,
            f"{schema_version} source result lacks the collision-deletion marker",
        )
        require(
            source_result.get("mutual_bisector_transport_cegar_enabled") is True,
            f"{schema_version} source result lacks the mutual-bisector-transport marker",
        )
        if source_schema.endswith("-v8"):
            require(
                source_result.get("forced_shared_fourth") is True,
                "v8 source result lacks the forced-shared-fourth marker",
            )
        else:
            require(
                isinstance(source_result.get("forced_shared_fourth"), bool),
                "v9 source result lacks an explicit forced-shared-fourth flag",
            )
        learned_cuts = source_result.get("learned_cuts")
        require(
            isinstance(learned_cuts, dict),
            f"{schema_version} source result lacks a learned-cut manifest",
        )
        theorem_families = learned_cuts.get("theorem_families")
        require(
            isinstance(theorem_families, list)
            and len(theorem_families) == len(set(theorem_families))
            and CONVEX_FIVE_POINT_FAMILY in theorem_families,
            f"{schema_version} source result lacks the full theorem-bank/convex-family manifest",
        )
        theorem_family_set = set(theorem_families)
        for field in ("theorem_cut_counts", "theorem_matches_seen"):
            counts = source_result.get(field)
            require(
                isinstance(counts, dict) and set(counts) == theorem_family_set,
                f"{schema_version} source result {field} does not cover the full theorem bank",
            )
    require(data.get("semantic_replay") == "PASS", "semantic replay is not PASS")
    for field in REPLAY_FIELDS:
        require(data.get(field, {}).get("status") == "PASS", f"{field} is not PASS")
    if full_bank_schema:
        schema_version = source_schema.rsplit("-", 1)[-1]
        crossed_replay = data.get("crossed_arm_replay")
        require(
            isinstance(crossed_replay, dict),
            f"{schema_version} witness lacks crossed-arm replay",
        )
        require(
            crossed_replay.get(
                "all_registered_selected_row_and_raw_equality_theorem_families_replayed"
            ) is True,
            f"{schema_version} witness lacks the full theorem-bank replay marker",
        )
        if source_result.get("forced_shared_fourth") is True:
            require(
                crossed_replay.get("forced_shared_fourth") is True
                and crossed_replay.get("shared_fourth_replayed") is True,
                f"{schema_version} witness lacks the shared-fourth replay markers",
            )
        active_counts = crossed_replay.get("full_theorem_bank_active_match_counts")
        require(
            isinstance(active_counts, dict) and set(active_counts) == theorem_family_set,
            f"{schema_version} witness replay does not cover the full theorem bank/convex family",
        )

    order = data.get("existential_cyclic_order")
    require(isinstance(order, list), "cyclic order is not a list")
    require(len(order) == 17 and len(set(order)) == 17, "cyclic order is not 17 distinct points")
    points = set(order)
    rows = data.get("rows")
    blockers = data.get("blockers")
    radius_classes = data.get("radius_classes")
    require(isinstance(rows, dict) and set(rows) == points, "rows do not cover the carrier")
    require(isinstance(blockers, dict) and set(blockers) == points, "blockers do not cover the carrier")
    require(
        isinstance(radius_classes, dict) and set(radius_classes) == points,
        "radius_classes do not cover every center",
    )

    class_index: dict[tuple[str, str], int] = {}
    class_counts: dict[str, int] = {}
    for center in order:
        classes = radius_classes[center]
        require(isinstance(classes, list) and classes, f"empty radius partition at {center}")
        seen: set[str] = set()
        for index, members in enumerate(classes):
            require(isinstance(members, list) and members, f"empty radius class at {center}:{index}")
            member_set = set(members)
            require(len(member_set) == len(members), f"duplicate member at {center}:{index}")
            require(center not in member_set, f"center occurs in its radius class at {center}:{index}")
            require(member_set <= points, f"unknown point in radius class at {center}:{index}")
            require(not (seen & member_set), f"overlapping radius classes at {center}:{index}")
            for point in members:
                class_index[center, point] = index
            seen.update(member_set)
        require(seen == points - {center}, f"radius partition is incomplete at {center}")
        class_counts[center] = len(classes)

        row = rows[center]
        require(isinstance(row, list) and len(row) == 4 and len(set(row)) == 4,
                f"selected row at {center} is not a four-set")
        require(center not in row and set(row) <= points, f"invalid selected row at {center}")
        matches = [members for members in classes if set(members) == set(row)]
        require(len(matches) == 1, f"selected row is not one serialized radius class at {center}")

    for source, center in blockers.items():
        require(center in points and center != source, f"invalid blocker for {source}")
        require(source in rows[center], f"blocker row does not contain source {source}")

    mapping = data.get("live_Lean_mapping", {})
    arm = mapping.get("forced_crossed_arm")
    require(arm in {"source-at-common", "other-at-common"}, "unknown crossed arm")
    require(source_result.get("arm") == arm, "result/witness arm mismatch")
    q_source = mapping.get("Q.source")
    q_other = mapping.get("Q.otherOutsidePoint")
    bq = mapping.get("common_source_row_center_bq")
    br = mapping.get("opposite_collision_blocker_row_center_br")
    require({q_source, q_other, bq, br} <= points, "crossed mapping names leave the carrier")
    expected_common = q_source if arm == "source-at-common" else q_other
    expected_opposite = q_other if arm == "source-at-common" else q_source
    require(expected_common in rows[bq] and expected_opposite not in rows[bq],
            "common-row crossed polarity does not replay")
    require(expected_opposite in rows[br] and expected_common not in rows[br],
            "opposite-row crossed polarity does not replay")

    a1_matches = [members for members in radius_classes["a1"] if set(members) == set(rows["a1"])]
    require(len(a1_matches) == 1, "a1 selected row is not exactly one serialized class")
    check = {
        "status": "SELF_CHECK_OK",
        "source_schema": source_result["schema"],
        "source_status": source_result["status"],
        "source_arm": arm,
        "carrier_cardinality": len(order),
        "radius_partition_center_count": len(radius_classes),
        "radius_partition_target_count_per_center": len(order) - 1,
        "radius_class_counts": class_counts,
        "a1_serialized_class_count": len(radius_classes["a1"]),
        "a1_selected_row_role": "one existing serialized radius class; no synthetic class added",
        "replay_fields_checked": ["semantic_replay", *REPLAY_FIELDS],
        "witness_sha256": sha256(path),
        "source_result_sha256": sha256(result_path),
    }
    return data, check


def sqdist(coords: dict[str, tuple[Any, Any]], left: str, right: str):
    lx, ly = coords[left]
    rx, ry = coords[right]
    return (lx - rx) ** 2 + (ly - ry) ** 2


def sqdist_difference(coords: dict[str, tuple[Any, Any]], center: str,
                      left: str, right: str):
    """Expanded ``d(center,left)^2 - d(center,right)^2``.

    Cancelling the center-square monomials before handing the polynomial to an
    NRA solver is exact and materially reduces the generated expression.
    """
    cx, cy = coords[center]
    lx, ly = coords[left]
    rx, ry = coords[right]
    return (
        lx * lx + ly * ly - rx * rx - ry * ry
        - 2 * cx * (lx - rx) - 2 * cy * (ly - ry)
    )


def orient(coords: dict[str, tuple[Any, Any]], a: str, b: str, c: str):
    ax, ay = coords[a]
    bx, by = coords[b]
    cx, cy = coords[c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def build_atoms(data: dict[str, Any], stage: str, *, substitute_gauge: bool = False):
    import z3

    require(stage in STAGES, f"unknown stage: {stage}")
    order = data["existential_cyclic_order"]
    radius_classes = data["radius_classes"]
    coords = {point: z3.Reals(f"{point}_x {point}_y") for point in order}
    atoms: list[Atom] = []

    def add(name: str, family: str, term: Any) -> None:
        atoms.append(Atom(name, family, term))

    # Orientation-preserving similarity gauge, justified by global distinctness.
    origin, unit = order[0], order[1]
    if substitute_gauge:
        coords[origin] = (z3.RealVal(0), z3.RealVal(0))
        coords[unit] = (z3.RealVal(1), z3.RealVal(0))
    add(f"gauge_{origin}_x", "gauge", coords[origin][0] == 0)
    add(f"gauge_{origin}_y", "gauge", coords[origin][1] == 0)
    add(f"gauge_{unit}_x", "gauge", coords[unit][0] == 1)
    add(f"gauge_{unit}_y", "gauge", coords[unit][1] == 0)

    for left, right in itertools.combinations(order, 2):
        add(f"distinct_{left}_{right}", "pairwise-distinctness",
            sqdist(coords, left, right) > 0)

    # Encode every pair in every serialized partition.  This deliberately uses
    # no packet-derived classes, including at a1.
    for center in order:
        targets = [point for point in order if point != center]
        class_index = {
            point: index
            for index, members in enumerate(radius_classes[center])
            for point in members
        }
        for left, right in itertools.combinations(targets, 2):
            radius_difference = sqdist_difference(coords, center, left, right)
            if class_index[left] == class_index[right]:
                add(f"radius_eq_{center}_{left}_{right}", "radius-within-class-equality",
                    radius_difference == 0)
            else:
                add(f"radius_ne_{center}_{left}_{right}", "radius-cross-class-disequality",
                    radius_difference != 0)

    if stage == "adjacent-turns":
        for index in range(len(order)):
            a, b, c = (order[index], order[(index + 1) % len(order)], order[(index + 2) % len(order)])
            add(f"adjacent_turn_{index}_{a}_{b}_{c}", "adjacent-turn", orient(coords, a, b, c) > 0)
    elif stage == "supporting-edges":
        for index in range(len(order)):
            a, b = order[index], order[(index + 1) % len(order)]
            for point in order:
                if point not in {a, b}:
                    add(f"supporting_edge_{index}_{a}_{b}_{point}", "supporting-edge-order",
                        orient(coords, a, b, point) > 0)
    elif stage == "all-triples":
        for i, j, k in itertools.combinations(range(len(order)), 3):
            a, b, c = order[i], order[j], order[k]
            add(f"ordered_triple_{i}_{j}_{k}_{a}_{b}_{c}", "all-triples-order",
                orient(coords, a, b, c) > 0)

    return z3, coords, atoms


def fidelity(stage: str) -> dict[str, Any]:
    encoded = [
        "one shared real-coordinate assignment for all 17 named points",
        "orientation-preserving similarity gauge on the first two cyclic-order points",
        "all 136 pairwise point-distinctness inequalities",
        "the full serialized radius partition at every center: every within-class target pair is equal and every cross-class target pair is unequal",
        "a1 uses its serialized radius_classes verbatim; its selected row is not promoted to a new disjoint class",
    ]
    omitted = [
        "MEC and nonobtuse-apex hypotheses",
        "CounterexampleData.noM44 and the arbitrary-n reduction",
        "re-execution of the source Boolean CEGAR/theorem-bank search",
        "Lean proof objects, transitive axiom audit, and kernel verification",
    ]
    if stage == "metric":
        omitted.append("all cyclic-order and convexity inequalities")
    elif stage == "adjacent-turns":
        encoded.append("all 17 positive adjacent cyclic turns")
        omitted.append("global strict-convex order; adjacent turns alone are only a relaxation")
    elif stage == "supporting-edges":
        encoded.append("exact strict-convex cyclic order via every directed boundary edge supporting all other points on its left")
    elif stage == "all-triples":
        encoded.append("exact strict-convex cyclic order via all 680 increasing-triple positive orientations")
    else:
        raise ValueError(stage)
    return {
        "ENCODED": encoded,
        "OMITTED": omitted,
        "trust_boundary": {
            "source": "v4/v5/v7/v8/v9 JSON replay markers and structural checks are artifact evidence, not a rerun of the CEGAR producer",
            "solver": "Z3 QF_NRA is trusted external computation; SAT is accepted only after exact model replay of every encoded atom and the full radius partition",
            "unsat": "a Z3 UNSAT has no independently checkable certificate and is not Lean/kernel closure",
            "unknown": "UNKNOWN or timeout is no evidence for SAT or UNSAT",
        },
    }


def atom_counts(atoms: list[Atom]) -> dict[str, int]:
    return dict(sorted(Counter(atom.family for atom in atoms).items()))


def _btw(index: dict[str, int], left: str, right: str, point: str) -> bool:
    """Executable form of `SurplusCOMPGBank.btw` for the serialized cut."""
    return (
        index[left] < index[point] < index[right]
        or index[right] < index[point] < index[left]
    )


def common_bisector_cores(data: dict[str, Any], atoms: list[Atom]) -> dict[str, Any]:
    """Find every four-point instance immediately killed by `btw_sep`.

    This is a source-artifact replay, not an SMT core extractor.  It checks two
    raw radius equalities and cyclic non-alternation directly in the serialized
    partitions/order, then names the corresponding original QF_NRA atoms.
    """
    order = data["existential_cyclic_order"]
    index = {point: position for position, point in enumerate(order)}
    class_index = {
        (center, point): class_number
        for center in order
        for class_number, members in enumerate(data["radius_classes"][center])
        for point in members
    }
    atom_names = {atom.name for atom in atoms}

    def equality_atom(center: str, left: str, right: str) -> str:
        if index[left] > index[right]:
            left, right = right, left
        name = f"radius_eq_{center}_{left}_{right}"
        require(name in atom_names, f"missing original equality atom: {name}")
        return name

    cores: list[dict[str, Any]] = []
    for endpoint_left, endpoint_right in itertools.combinations(order, 2):
        possible_centers = [
            point for point in order if point not in {endpoint_left, endpoint_right}
        ]
        for center_a, center_b in itertools.combinations(possible_centers, 2):
            equal_a = (
                class_index[center_a, endpoint_left]
                == class_index[center_a, endpoint_right]
            )
            equal_b = (
                class_index[center_b, endpoint_left]
                == class_index[center_b, endpoint_right]
            )
            if not (equal_a and equal_b):
                continue
            btw_a = _btw(index, endpoint_left, endpoint_right, center_a)
            btw_b = _btw(index, endpoint_left, endpoint_right, center_b)
            if btw_a != btw_b:
                continue
            points = [endpoint_left, endpoint_right, center_a, center_b]
            linear_order = sorted(points, key=index.__getitem__)
            role = {
                endpoint_left: "endpoint",
                endpoint_right: "endpoint",
                center_a: "center",
                center_b: "center",
            }
            cores.append({
                "endpoints": [endpoint_left, endpoint_right],
                "centers": [center_a, center_b],
                "original_named_atoms": [
                    {
                        "name": equality_atom(center_a, endpoint_left, endpoint_right),
                        "relation": "eq",
                        "center": center_a,
                        "point_pair": [endpoint_left, endpoint_right],
                    },
                    {
                        "name": equality_atom(center_b, endpoint_left, endpoint_right),
                        "relation": "eq",
                        "center": center_b,
                        "point_pair": [endpoint_left, endpoint_right],
                    },
                ],
                "linear_cut_order": linear_order,
                "linear_cut_indices": [index[point] for point in linear_order],
                "cyclic_role_word": [role[point] for point in linear_order],
                "btw_values": {center_a: btw_a, center_b: btw_b},
                "theorem_instance": {
                    "declaration": "Problem97.SurplusCOMPGBank.btw_sep",
                    "i": endpoint_left,
                    "j": endpoint_right,
                    "a": center_a,
                    "b": center_b,
                    "violated_conclusion": "btw i j a iff not (btw i j b)",
                },
            })

    preferred = next(
        (
            core for core in cores
            if set(core["endpoints"]) == {"r1", "r2"}
            and "a1" in core["centers"]
        ),
        cores[0] if cores else None,
    )
    return {
        "status": "REPLAY_PASS",
        "kind": "two-center-common-bisector-cyclic-separation",
        "core_count": len(cores),
        "preferred_actionable_core": preferred,
        "all_cores": cores,
        "radius_equality_atom_count_per_core": 2,
        "minimality_claim": "NONE; this is theorem-pattern replay, not SMT core minimization",
        "scope": "fixed serialized n=17 witness instances of a universal Lean theorem",
        "ambient_hypotheses_not_metric_atoms": [
            "strict convex CCW enumeration",
            "injectivity/pairwise distinctness",
        ],
        "soundness_note": (
            "The two equality atoms alone are not QF_NRA-UNSAT.  Contradiction "
            "uses the ambient strict-convex cyclic order through btw_sep."
        ),
        "target_solver_invoked": False,
    }


def exact_model_replay(z3: Any, model: Any, data: dict[str, Any], coords, atoms) -> dict[str, Any]:
    failed = [atom.name for atom in atoms if not z3.is_true(model.eval(atom.term, model_completion=True))]
    require(not failed, f"exact atom replay failed: {failed[:8]}")

    order = data["existential_cyclic_order"]
    partition_pairs = 0
    for center in order:
        expected = {
            point: index
            for index, members in enumerate(data["radius_classes"][center])
            for point in members
        }
        targets = [point for point in order if point != center]
        for left, right in itertools.combinations(targets, 2):
            actual_equal = z3.is_true(model.eval(
                sqdist(coords, center, left) == sqdist(coords, center, right),
                model_completion=True,
            ))
            require(actual_equal == (expected[left] == expected[right]),
                    f"radius partition replay failed at {center}:{left}:{right}")
            partition_pairs += 1
    return {
        "status": "PASS",
        "atoms_checked": len(atoms),
        "radius_partition_pairs_checked": partition_pairs,
    }


def solver_smoke() -> dict[str, Any]:
    """Known tiny QF_NRA SAT/UNSAT checks; never loads the 17-point target solver."""
    import z3

    x, y = z3.Reals("smoke_x smoke_y")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set(timeout=1_000)
    sat_solver.add(x == 0, y == 1, x * x + y * y == 1)
    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set(timeout=1_000)
    unsat_solver.add(x * x + y * y == 0, x > 0)
    sat_status = sat_solver.check()
    unsat_status = unsat_solver.check()
    require(sat_status == z3.sat, f"known SAT smoke returned {sat_status}")
    require(unsat_status == z3.unsat, f"known UNSAT smoke returned {unsat_status}")
    return {
        "status": "SMOKE_OK",
        "known_sat": str(sat_status).upper(),
        "known_unsat": str(unsat_status).upper(),
        "target_solver_invoked": False,
        "solver": f"Z3 {z3.get_version_string()} QF_NRA",
    }


def base_result(path: Path, data: dict[str, Any], check: dict[str, Any], stage: str, atoms) -> dict[str, Any]:
    return {
        "schema": RESULT_SCHEMA,
        "stage": stage,
        "input_witness": str(path.resolve()),
        "source_validation": check,
        "constraint_counts": atom_counts(atoms),
        "constraint_total": len(atoms),
        **fidelity(stage),
    }


def solve_target(path: Path, data: dict[str, Any], check: dict[str, Any], stage: str,
                 timeout_ms: int) -> dict[str, Any]:
    z3, coords, atoms = build_atoms(data, stage)
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    solver.add(*(atom.term for atom in atoms))
    result = base_result(path, data, check, stage, atoms)
    result.update({
        "solver": f"Z3 {z3.get_version_string()} QF_NRA",
        "timeout_ms": timeout_ms,
        "action": "TARGET_SOLVE",
    })
    started = time.monotonic()
    status = solver.check()
    result["elapsed_ms"] = int((time.monotonic() - started) * 1_000)
    result["verdict"] = str(status).upper()
    if status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    elif status == z3.sat:
        model = solver.model()
        result["model_replay"] = exact_model_replay(z3, model, data, coords, atoms)
        result["coordinates"] = {
            point: [
                str(model.eval(coords[point][0], model_completion=True)),
                str(model.eval(coords[point][1], model_completion=True)),
            ]
            for point in data["existential_cyclic_order"]
        }
    else:
        result["unsat_certificate"] = None
    return result


def solve_metric_lazy(path: Path, data: dict[str, Any], check: dict[str, Any],
                      timeout_ms: int, max_iterations: int,
                      batch_size: int) -> dict[str, Any]:
    """Solve the full metric formula by lazily asserting violated relations.

    The hard core retains only the gauge.  Three monotone lazy phases use the
    global quotient of undirected squared-distance variables: a spanning
    forest for all radius equalities, one positivity atom per quotient class
    except the gauge class, and one representative disequality per unordered
    pair of quotient classes.  These bases imply all omitted pairwise metric
    relations.  A SAT verdict is still returned only after exact replay of
    every original atom, so this is equisatisfiable with
    ``solve_target(..., stage="metric")``.
    """
    z3, coords, atoms = build_atoms(data, "metric", substitute_gauge=True)
    atom_by_name = {atom.name: atom for atom in atoms}
    require(len(atom_by_name) == len(atoms), "duplicate metric atom name")
    order = data["existential_cyclic_order"]
    position = {point: index for index, point in enumerate(order)}

    def radius_name(prefix: str, center: str, left: str, right: str) -> str:
        if position[left] > position[right]:
            left, right = right, left
        return f"radius_{prefix}_{center}_{left}_{right}"

    def edge(left: str, right: str) -> tuple[str, str]:
        if position[left] > position[right]:
            left, right = right, left
        return left, right

    edges = [edge(left, right) for left, right in itertools.combinations(order, 2)]
    parent = {item: item for item in edges}

    def find(item: tuple[str, str]) -> tuple[str, str]:
        while parent[item] != item:
            parent[item] = parent[parent[item]]
            item = parent[item]
        return item

    def union(left: tuple[str, str], right: tuple[str, str]) -> bool:
        left_root, right_root = find(left), find(right)
        if left_root == right_root:
            return False
        parent[right_root] = left_root
        return True

    equality_basis_names: set[str] = set()
    for center in order:
        classes = [sorted(members, key=position.__getitem__)
                   for members in data["radius_classes"][center]]
        for members in classes:
            for left, right in itertools.combinations(members, 2):
                name = radius_name("eq", center, left, right)
                if union(edge(center, left), edge(center, right)):
                    equality_basis_names.add(name)

    edge_rank = {item: index for index, item in enumerate(edges)}
    quotient_classes: dict[tuple[str, str], list[tuple[str, str]]] = {}
    for item in edges:
        quotient_classes.setdefault(find(item), []).append(item)
    ordered_classes = sorted(
        quotient_classes.values(),
        key=lambda members: min(edge_rank[item] for item in members),
    )
    class_id = {
        item: index
        for index, members in enumerate(ordered_classes)
        for item in members
    }
    require(
        len(equality_basis_names) == len(edges) - len(ordered_classes),
        "global equality basis is not a spanning forest",
    )

    gauge_class = class_id[edge(order[0], order[1])]
    positivity_basis_names: set[str] = set()
    seen_positive_classes: set[int] = {gauge_class}
    for left, right in edges:
        quotient_class = class_id[(left, right)]
        if quotient_class not in seen_positive_classes:
            positivity_basis_names.add(f"distinct_{left}_{right}")
            seen_positive_classes.add(quotient_class)
    require(
        seen_positive_classes == set(range(len(ordered_classes))),
        "positivity basis does not cover every distance quotient class",
    )
    require(
        len(positivity_basis_names) == len(ordered_classes) - 1,
        "positivity basis must omit exactly the gauge distance class",
    )

    disequality_by_class_pair: dict[tuple[int, int], str] = {}
    for center in order:
        targets = [point for point in order if point != center]
        radius_class = {
            point: index
            for index, members in enumerate(data["radius_classes"][center])
            for point in members
        }
        for left, right in itertools.combinations(targets, 2):
            if radius_class[left] == radius_class[right]:
                continue
            left_class = class_id[edge(center, left)]
            right_class = class_id[edge(center, right)]
            class_pair = tuple(sorted((left_class, right_class)))
            disequality_by_class_pair.setdefault(
                class_pair, radius_name("ne", center, left, right))
    disequality_basis_names = set(disequality_by_class_pair.values())
    require(
        len(disequality_basis_names) == len(disequality_by_class_pair),
        "one radius disequality atom was reused for distinct quotient pairs",
    )
    quotient_internal_disequalities = sum(
        left == right for left, right in disequality_by_class_pair
    )
    if check["source_schema"].endswith("-v7"):
        require(
            quotient_internal_disequalities == 0,
            "v7 global-edge-closed witness has an internal quotient disequality",
        )

    missing_basis = (equality_basis_names | positivity_basis_names |
                     disequality_basis_names) - atom_by_name.keys()
    require(not missing_basis, f"missing compact radius atoms: {sorted(missing_basis)[:8]}")
    declared_gauge = [atom for atom in atoms if atom.family == "gauge"]
    hard = [atom for atom in declared_gauge
            if not z3.is_true(z3.simplify(atom.term))]
    lazy_groups = {
        "radius-equality": [atom_by_name[name]
                            for name in sorted(equality_basis_names)],
        "point-distinctness": [atom_by_name[name]
                               for name in sorted(positivity_basis_names)],
        "radius-disequality": [atom_by_name[name]
                               for name in sorted(disequality_basis_names)],
    }
    lazy = [atom for group in lazy_groups.values() for atom in group]
    phase_batch_sizes = {
        "radius-equality": min(batch_size, 8),
        "point-distinctness": min(batch_size, 16),
        "radius-disequality": min(batch_size, 32),
    }
    active: set[str] = set()
    iterations: list[dict[str, Any]] = []
    started = time.monotonic()
    result = base_result(path, data, check, "metric", atoms)
    result.update({
        "solver": f"Z3 {z3.get_version_string()} QF_NRA",
        "timeout_ms": timeout_ms,
        "max_iterations": max_iterations,
        "batch_size": batch_size,
        "action": "STAGED_COMPACT_BASIS_LAZY_METRIC_RELATION_CEGAR",
        "gauge_substituted": True,
        "hard_constraint_count": len(hard),
        "declared_gauge_atom_count": len(declared_gauge),
        "lazy_constraint_count": len(lazy),
        "full_within_class_equality_count": sum(
            atom.family == "radius-within-class-equality" for atom in atoms),
        "basis_within_class_equality_count": len(equality_basis_names),
        "global_distance_class_count": len(ordered_classes),
        "gauge_distance_class": gauge_class,
        "full_cross_class_disequality_count": sum(
            atom.family == "radius-cross-class-disequality" for atom in atoms),
        "basis_cross_class_disequality_count": len(disequality_basis_names),
        "quotient_internal_disequality_count": quotient_internal_disequalities,
        "lazy_point_distinctness_count": sum(
            atom.family == "pairwise-distinctness" for atom in lazy),
        "phase_batch_sizes": phase_batch_sizes,
        "fidelity_note": (
            "a global undirected-distance spanning forest, one positivity atom "
            "per non-gauge quotient class, and one representative disequality "
            "per quotient-class pair observed in an original cross-radius atom "
            "imply the full metric partition; every "
            "basis atom remains in a monotone lazy phase; SAT is accepted only "
            "after exact replay of every original atom"
        ),
    })

    for iteration in range(max_iterations):
        elapsed_ms = int((time.monotonic() - started) * 1_000)
        remaining_ms = timeout_ms - elapsed_ms
        if remaining_ms <= 0:
            result.update({
                "elapsed_ms": elapsed_ms,
                "verdict": "UNKNOWN",
                "reason_unknown": "total timeout before next lazy-metric check",
                "iterations": iterations,
                "active_lazy_constraint_count": len(active),
            })
            return result
        solver = z3.SolverFor("QF_NRA")
        solver.add(*(atom.term for atom in hard))
        solver.add(*(atom_by_name[name].term for name in sorted(active)))
        solver.set(timeout=remaining_ms)
        check_started = time.monotonic()
        status = solver.check()
        check_ms = int((time.monotonic() - check_started) * 1_000)
        entry: dict[str, Any] = {
            "iteration": iteration,
            "check_ms": check_ms,
            "active_lazy_constraint_count": len(active),
            "result": str(status).upper(),
        }
        if status == z3.unknown:
            entry["reason_unknown"] = solver.reason_unknown()
            iterations.append(entry)
            result.update({
                "elapsed_ms": int((time.monotonic() - started) * 1_000),
                "verdict": "UNKNOWN",
                "reason_unknown": solver.reason_unknown(),
                "iterations": iterations,
                "active_lazy_constraint_count": len(active),
            })
            return result
        if status == z3.unsat:
            iterations.append(entry)
            result.update({
                "elapsed_ms": int((time.monotonic() - started) * 1_000),
                "verdict": "UNSAT",
                "iterations": iterations,
                "active_lazy_constraint_count": len(active),
                "active_lazy_constraints": sorted(active),
                "unsat_certificate": None,
            })
            return result

        model = solver.model()
        violated_by_phase = {
            phase: [
                atom for atom in group
                if atom.name not in active
                and not z3.is_true(model.eval(atom.term, model_completion=True))
            ]
            for phase, group in lazy_groups.items()
        }
        entry["fresh_violated_lazy_constraint_counts"] = {
            phase: len(violated)
            for phase, violated in violated_by_phase.items()
        }
        chosen_phase = next(
            (phase for phase in lazy_groups if violated_by_phase[phase]), None)
        if chosen_phase is None:
            iterations.append(entry)
            result.update({
                "elapsed_ms": int((time.monotonic() - started) * 1_000),
                "verdict": "SAT",
                "iterations": iterations,
                "active_lazy_constraint_count": len(active),
                "model_replay": exact_model_replay(z3, model, data, coords, atoms),
                "coordinates": {
                    point: [
                        str(model.eval(coords[point][0], model_completion=True)),
                        str(model.eval(coords[point][1], model_completion=True)),
                    ]
                    for point in data["existential_cyclic_order"]
                },
            })
            return result

        chosen = violated_by_phase[chosen_phase][:phase_batch_sizes[chosen_phase]]
        active.update(atom.name for atom in chosen)
        entry["added_lazy_phase"] = chosen_phase
        entry["added_lazy_constraint_count"] = len(chosen)
        entry["added_lazy_constraints"] = [atom.name for atom in chosen]
        iterations.append(entry)

    result.update({
        "elapsed_ms": int((time.monotonic() - started) * 1_000),
        "verdict": "UNKNOWN",
        "reason_unknown": "lazy-metric iteration limit",
        "iterations": iterations,
        "active_lazy_constraint_count": len(active),
    })
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--witness", type=Path, default=DEFAULT_WITNESS)
    parser.add_argument("--stage", choices=STAGES, default="metric")
    actions = parser.add_mutually_exclusive_group(required=True)
    actions.add_argument("--self-check", action="store_true")
    actions.add_argument("--smoke", action="store_true")
    actions.add_argument("--replay-common-bisector-cores", action="store_true")
    actions.add_argument("--solve", action="store_true")
    actions.add_argument("--lazy-metric-cegar", action="store_true")
    actions.add_argument("--emit-smt2", type=Path)
    actions.add_argument("--emit-active-prefix-smt2", type=Path)
    actions.add_argument("--emit-active-prefix-singular", type=Path)
    parser.add_argument("--prefix-result", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--max-iterations", type=int, default=64)
    parser.add_argument("--batch-size", type=int, default=64)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    require(0 < args.timeout_ms <= 300_000, "--timeout-ms must be in 1..300000")
    require(args.max_iterations > 0, "--max-iterations must be positive")
    require(args.batch_size > 0, "--batch-size must be positive")

    data, check = load_witness(args.witness)
    z3, _coords, atoms = build_atoms(data, args.stage)
    if args.self_check:
        result = base_result(args.witness, data, check, args.stage, atoms)
        core_replay = common_bisector_cores(data, atoms)
        result.update({
            "status": "SELF_CHECK_OK",
            "common_bisector_core_count": core_replay["core_count"],
            "target_solver_invoked": False,
        })
    elif args.smoke:
        result = base_result(args.witness, data, check, args.stage, atoms)
        result.update(solver_smoke())
    elif args.replay_common_bisector_cores:
        result = base_result(args.witness, data, check, args.stage, atoms)
        result.update({
            "action": "COMMON_BISECTOR_CORE_REPLAY",
            "core_replay": common_bisector_cores(data, atoms),
        })
    elif args.lazy_metric_cegar:
        require(args.stage == "metric", "--lazy-metric-cegar requires --stage metric")
        result = solve_metric_lazy(
            args.witness, data, check, args.timeout_ms,
            args.max_iterations, args.batch_size,
        )
    elif args.emit_smt2 is not None:
        solver = z3.SolverFor("QF_NRA")
        solver.set(timeout=args.timeout_ms)
        solver.add(*(atom.term for atom in atoms))
        args.emit_smt2.write_text(
            "(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n"
        )
        result = base_result(args.witness, data, check, args.stage, atoms)
        result.update({
            "status": "SMT2_WRITTEN",
            "smt2": str(args.emit_smt2.resolve()),
            "target_solver_invoked": False,
        })
    elif args.emit_active_prefix_smt2 is not None:
        require(args.stage == "metric", "active-prefix emission requires metric stage")
        require(args.prefix_result is not None, "active-prefix emission requires --prefix-result")
        prefix = json.loads(args.prefix_result.read_text())
        active_names = {
            name
            for iteration in prefix.get("iterations", [])
            for name in iteration.get("added_lazy_constraints", [])
        }
        atom_by_name = {atom.name: atom for atom in atoms}
        missing = active_names - atom_by_name.keys()
        require(not missing, f"prefix names absent from current encoding: {sorted(missing)[:8]}")
        prefix_atoms = [atom for atom in atoms if atom.family == "gauge"] + [
            atom_by_name[name] for name in sorted(active_names)
        ]
        solver = z3.SolverFor("QF_NRA")
        solver.add(*(atom.term for atom in prefix_atoms))
        args.emit_active_prefix_smt2.write_text(
            "(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n"
        )
        result = base_result(args.witness, data, check, args.stage, atoms)
        result.update({
            "status": "ACTIVE_PREFIX_SMT2_WRITTEN",
            "smt2": str(args.emit_active_prefix_smt2.resolve()),
            "prefix_result": str(args.prefix_result.resolve()),
            "active_constraint_count": len(active_names),
            "prefix_constraint_count": len(prefix_atoms),
            "target_solver_invoked": False,
        })
    elif args.emit_active_prefix_singular is not None:
        require(args.stage == "metric", "active-prefix emission requires metric stage")
        require(args.prefix_result is not None, "active-prefix emission requires --prefix-result")
        prefix = json.loads(args.prefix_result.read_text())
        active_names = {
            name
            for iteration in prefix.get("iterations", [])
            for name in iteration.get("added_lazy_constraints", [])
        }
        require(all(name.startswith("radius_eq_") for name in active_names),
                "Singular prefix emission currently supports equality-only prefixes")
        order = data["existential_cyclic_order"]
        origin, unit = order[0], order[1]
        variables = [
            f"{point}_{axis}"
            for point in order if point not in {origin, unit}
            for axis in ("x", "y")
        ]

        def coordinate(point: str, axis: str) -> str:
            if point == origin:
                return "0"
            if point == unit:
                return "1" if axis == "x" else "0"
            return f"{point}_{axis}"

        def radius_polynomial(name: str) -> str:
            _, _, center, left, right = name.split("_")
            cx, cy = coordinate(center, "x"), coordinate(center, "y")
            lx, ly = coordinate(left, "x"), coordinate(left, "y")
            rx, ry = coordinate(right, "x"), coordinate(right, "y")
            return (
                f"(({lx})^2+({ly})^2-({rx})^2-({ry})^2"
                f"-2*({cx})*(({lx})-({rx}))-2*({cy})*(({ly})-({ry})))"
            )

        polynomials = [radius_polynomial(name) for name in sorted(active_names)]
        require(polynomials, "active prefix has no equality polynomials")
        args.emit_active_prefix_singular.write_text(
            "ring r = 0,(" + ",".join(variables) + "),dp;\n"
            "ideal I =\n  " + ",\n  ".join(polynomials) + ";\n"
            "option(redSB);\n"
            "ideal G = std(I);\n"
            "if (reduce(1,G) == 0) { print(\"UNIT_IDEAL\"); } "
            "else { print(\"NON_UNIT_IDEAL\"); }\n"
            "print(\"GROEBNER_BASIS_SIZE\");\n"
            "size(G);\n"
        )
        result = base_result(args.witness, data, check, args.stage, atoms)
        result.update({
            "status": "ACTIVE_PREFIX_SINGULAR_WRITTEN",
            "singular": str(args.emit_active_prefix_singular.resolve()),
            "prefix_result": str(args.prefix_result.resolve()),
            "active_equality_count": len(active_names),
            "coordinate_variable_count_after_gauge_substitution": len(variables),
            "target_solver_invoked": False,
        })
    else:
        result = solve_target(args.witness, data, check, args.stage, args.timeout_ms)

    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered)
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
