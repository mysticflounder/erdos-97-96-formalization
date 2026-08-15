#!/usr/bin/env python3
"""Source-faithful CEGAR for one normalized exact-17 cap-nine hard case.

This schema deliberately omits the old probe's unsupported assertion that the
fifth row meets the *whole* second cap in at most two points.  The live Lean
ingress supplies only a one-hit bound against the selected physical class.

The Boolean abstraction has one four-point row at every carrier centre.  The
four old blocker rows are full exact classes, their outside pairs partition the
eight outside points, and an existential fifth exact row contains the deleted
source while meeting the physical class at most once.  Other rows are merely
chosen K4 subsets.  A terminal result concerns only the displayed normalized
case; the 56-case order normalization and its Lean lift remain separate proof
obligations.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from itertools import combinations
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SCHEMA = "p97-rigid221-exact17-cap9-source-faithful-v1"
TRANSITIVE_TWO_CIRCLE_SCHEMA = (
    "p97-rigid221-exact17-cap9-source-faithful-transitive-two-circle-v2"
)
CACHE_SCHEMA = (
    "p97-rigid221-exact17-source-faithful-weighted-kalmanson-replay-v1"
)
MODEL_ANALYSIS_SCHEMA = (
    "p97-rigid221-exact17-source-faithful-model-analysis-v1"
)
OUTPUT_ROOT = HERE / "source-faithful-cap9-v1"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


legacy = load_module("exact17_fullcover_cegar_source_faithful", HERE / "exact17_fullcover_cegar.py")
order_base = legacy.base

POINTS = tuple(range(17))
OLD_CENTERS = (8, 9, 10, 11)
FIXED_CAP_HITS = {
    8: frozenset((6, 9)),
    9: frozenset((6, 7)),
    10: frozenset((8, 9)),
    11: frozenset((8, 10)),
}
OUTSIDE = frozenset((1, 3, 4, 5, 13, 14, 15, 16))
PHYSICAL = frozenset((6, 7, 8, 9, 10))
SECOND_CAP = frozenset((0, 2, 6, 7, 8, 9, 10, 11, 12))
DELETED_SOURCE = 11
FIFTH_CENTER_CANDIDATES = tuple(
    point
    for point in POINTS
    if point != DELETED_SOURCE and point not in OLD_CENTERS
)

REPRESENTATIVE_EXACT_ROWS = {
    8: frozenset((6, 9, 1, 3)),
    9: frozenset((6, 7, 4, 5)),
    10: frozenset((8, 9, 13, 14)),
    11: frozenset((8, 10, 15, 16)),
    0: frozenset((11, 1, 2, 15)),
}

DISTANCE_LABEL_BITS = 8


def distance_edge(left: int, right: int) -> tuple[int, int]:
    """Canonical unordered carrier edge used by the equality abstraction."""

    return (left, right) if left < right else (right, left)


def add_transitive_two_circle_bisector_exclusions(
    solver,
    selected,
    order: tuple[int, ...],
) -> int:
    """Compile equality closure into the checked two-circle obstruction.

    Eight Boolean label bits suffice to give distinct labels to all 136
    carrier edges.  Every selected row forces its four incident edges to have
    one label.  The forbidden comparisons are exactly the hypotheses consumed
    by ``FourPointTwoCircleBisectorOrderCore`` (in either cyclic orientation).
    An actual Euclidean realization supplies a satisfying label assignment by
    assigning a distinct bit pattern to every distinct distance, so this is a
    sound abstraction rather than a distinct-distance assumption.
    """

    labels = {
        edge: tuple(
            z3.Bool(f"distance_label_{edge[0]}_{edge[1]}_{bit}")
            for bit in range(DISTANCE_LABEL_BITS)
        )
        for edge in combinations(POINTS, 2)
    }

    for center in POINTS:
        endpoints = tuple(point for point in POINTS if point != center)
        for left, right in combinations(endpoints, 2):
            left_bits = labels[distance_edge(center, left)]
            right_bits = labels[distance_edge(center, right)]
            for left_bit, right_bit in zip(left_bits, right_bits, strict=True):
                solver.add(z3.Or(
                    z3.Not(selected[center, left]),
                    z3.Not(selected[center, right]),
                    left_bit == right_bit,
                ))

    forbidden = set()
    for cyclic_order in (order, tuple(reversed(order))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            point_q = rotated[0]
            for positions in combinations(range(1, len(rotated)), 3):
                point_u, point_y, point_v = (
                    rotated[position] for position in positions
                )
                first = tuple(sorted((
                    distance_edge(point_q, point_u),
                    distance_edge(point_q, point_y),
                )))
                second = tuple(sorted((
                    distance_edge(point_v, point_u),
                    distance_edge(point_v, point_y),
                )))
                forbidden.add(tuple(sorted((first, second))))

    for first, second in forbidden:
        solver.add(z3.Or(*(
            left_bit != right_bit
            for comparison in (first, second)
            for left_bit, right_bit in zip(
                labels[comparison[0]],
                labels[comparison[1]],
                strict=True,
            )
        )))
    return len(forbidden)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def normalized_order(order_index: int, positions: tuple[int, int]) -> tuple[int, ...]:
    if order_index not in (0, 1):
        raise ValueError("order_index must be 0 or 1")
    if len(positions) != 2 or not (0 <= positions[0] < positions[1] < 8):
        raise ValueError("positions must be two increasing integers in [0, 8)")
    return tuple(order_base.exact17_order(order_index, positions))


def add_source_constraints(solver, selected):
    """Add exactly the cap-nine hard-branch facts present at Lean ingress."""

    for center, fixed_hits in FIXED_CAP_HITS.items():
        for point in fixed_hits:
            solver.add(selected[center, point])
        for point in SECOND_CAP:
            if point != center and point not in fixed_hits:
                solver.add(z3.Not(selected[center, point]))

    # In the hard branch, deleting any outside point must destroy an old row.
    # Since every old row already has two cap hits, the four outside pairs form
    # an exact partition of the eight outside points.
    for point in OUTSIDE:
        solver.add(z3.PbEq(
            [(selected[center, point], 1) for center in OLD_CENTERS],
            1,
        ))

    fifth_choice = {
        center: z3.Bool(f"fifth_center_{center}")
        for center in FIFTH_CENTER_CANDIDATES
    }
    solver.add(z3.PbEq([(literal, 1) for literal in fifth_choice.values()], 1))
    for center, chosen in fifth_choice.items():
        physical_literals = [
            selected[center, point]
            for point in PHYSICAL
            if point != center
        ]
        solver.add(z3.Implies(chosen, selected[center, DELETED_SOURCE]))
        solver.add(z3.Implies(
            chosen,
            z3.PbLe([(literal, 1) for literal in physical_literals], 1),
        ))
    return fifth_choice


def build_case(
    order: tuple[int, ...],
    *,
    all_static_cuts: bool,
    transitive_two_circle: bool = False,
):
    # The imported module is source-frozen; reset only its process-local
    # normalization globals before asking it for the common full-cover layer.
    legacy.ORDER = order
    legacy.NAMED_BY_CENTER = {}
    built = legacy.build_cover_solver(
        forbid_kalmanson=all_static_cuts,
        forbid_two_circle_bisector=all_static_cuts,
        forbid_three_shell_301_415_205=all_static_cuts,
        forbid_three_shell_bank=all_static_cuts,
        forbid_seven_point_schema_c=all_static_cuts,
        forbid_seven_point_schema_f=all_static_cuts,
        forbid_six_point_schema_de=all_static_cuts,
    )
    solver, selected, *cut_counts = built
    transitive_two_circle_count = (
        add_transitive_two_circle_bisector_exclusions(solver, selected, order)
        if transitive_two_circle else 0
    )
    fifth_choice = add_source_constraints(solver, selected)
    return (
        solver,
        selected,
        fifth_choice,
        (*cut_counts, transitive_two_circle_count),
    )


def supports_from_model(model, selected) -> dict[int, frozenset[int]]:
    return {
        center: frozenset(
            point
            for point in POINTS
            if point != center
            and z3.is_true(model.eval(selected[center, point], model_completion=True))
        )
        for center in POINTS
    }


def fifth_center_from_model(model, fifth_choice) -> int:
    chosen = [
        center
        for center, literal in fifth_choice.items()
        if z3.is_true(model.eval(literal, model_completion=True))
    ]
    if len(chosen) != 1:
        raise AssertionError(f"expected one fifth centre, got {chosen}")
    return chosen[0]


def verify_model(
    supports: dict[int, frozenset[int]],
    fifth_center: int,
) -> None:
    """Independent combinatorial checker for every asserted source clause."""

    if set(supports) != set(POINTS):
        raise AssertionError("support map does not cover all centres")
    for center, support in supports.items():
        if len(support) != 4 or center in support:
            raise AssertionError(f"bad four-row at centre {center}: {sorted(support)}")
    uncovered = set(POINTS) - set().union(*supports.values())
    if uncovered:
        raise AssertionError(f"uncovered deleted sources: {sorted(uncovered)}")
    for left, right in combinations(POINTS, 2):
        common = supports[left] & supports[right]
        if len(common) > 2:
            raise AssertionError(
                f"centres {left},{right} have {len(common)} common hits"
            )
    for center, fixed_hits in FIXED_CAP_HITS.items():
        if supports[center] & SECOND_CAP != fixed_hits:
            raise AssertionError(
                f"old centre {center} has wrong cap slice: "
                f"{sorted(supports[center] & SECOND_CAP)}"
            )
    for point in OUTSIDE:
        multiplicity = sum(point in supports[center] for center in OLD_CENTERS)
        if multiplicity != 1:
            raise AssertionError(
                f"outside point {point} has old-row multiplicity {multiplicity}"
            )
    if fifth_center not in FIFTH_CENTER_CANDIDATES:
        raise AssertionError(f"illegal fifth centre {fifth_center}")
    fifth_support = supports[fifth_center]
    if DELETED_SOURCE not in fifth_support:
        raise AssertionError("fifth row does not contain the deleted source")
    if len(fifth_support & PHYSICAL) > 1:
        raise AssertionError("fifth row exceeds the physical-class one-hit bound")


def metric_rows(supports, fifth_center):
    return tuple(
        legacy.MetricRow(
            center,
            tuple(sorted(support)),
            center in OLD_CENTERS or center == fifth_center,
        )
        for center, support in sorted(supports.items())
    )


def row_payload(rows):
    return [
        {
            "center": row.center,
            "support": list(row.support),
            "exact": row.exact,
        }
        for row in rows
    ]


def rows_key(rows):
    return tuple(sorted(
        (
            int(row.center),
            tuple(sorted(int(point) for point in row.support)),
            bool(row.exact),
        )
        for row in rows
    ))


def load_weighted_certificate_cache(path: Path | None, order):
    if path is None:
        return {}, None
    resolved = path.resolve()
    raw = resolved.read_bytes()
    payload = json.loads(raw)
    if payload.get("schema") != CACHE_SCHEMA or payload.get("status") != "complete":
        raise ValueError(f"unsupported weighted certificate cache: {resolved}")
    cache = {}
    for entry in payload.get("results", ()):
        if tuple(entry.get("order", ())) != tuple(order):
            continue
        rows = legacy.rows_from_payload(entry.get("rows", ()))
        key = rows_key(rows)
        previous = cache.setdefault(key, entry)
        if previous != entry:
            raise ValueError(f"duplicate weighted cache key: {resolved}")
    return cache, {
        "artifact": str(resolved.relative_to(REPO)),
        "sha256": hashlib.sha256(raw).hexdigest(),
        "matching_records": len(cache),
    }


def active_schema(transitive_two_circle: bool) -> str:
    return TRANSITIVE_TWO_CIRCLE_SCHEMA if transitive_two_circle else SCHEMA


def revalidate_resume_artifact(args, order, solver, selected):
    """Replay every learned clause before using a predecessor artifact.

    This deliberately does not trust a JSON row pattern merely because it was
    written by an earlier run.  Linear cores are rechecked by exact QF_LRA and
    formalized-bank records are rescanned against the current theorem bank.
    """
    if args.resume_artifact is None:
        return [], None

    path = args.resume_artifact.resolve()
    payload = json.loads(path.read_text())
    expected_schema = active_schema(args.transitive_two_circle)
    if payload.get("schema") != expected_schema:
        raise ValueError(f"resume schema mismatch: {path}")
    if payload.get("order_index") != args.order:
        raise ValueError(f"resume order-index mismatch: {path}")
    if tuple(payload.get("anonymous_positions", ())) != args.positions:
        raise ValueError(f"resume anonymous-position mismatch: {path}")
    if tuple(payload.get("order", ())) != order:
        raise ValueError(f"resume cyclic-order mismatch: {path}")

    expected_dependencies = {
        "fullcover": sha256(HERE / "exact17_fullcover_cegar.py"),
        "order_base": sha256(HERE / "exact17_kalmanson.py"),
        "producer_bank": sha256(REPO / "census/atail_force/producer_bank.py"),
    }
    recorded_hashes = payload.get("source_hashes", {})
    if args.resume_artifact_runner_sha256 is not None:
        recorded_runner = recorded_hashes.get("runner")
        if recorded_runner != args.resume_artifact_runner_sha256:
            raise ValueError(
                "resume runner hash mismatch: "
                f"expected {args.resume_artifact_runner_sha256}, "
                f"found {recorded_runner}: {path}"
            )
    dependency_mismatches = {}
    for key, expected in expected_dependencies.items():
        recorded = recorded_hashes.get(key)
        if recorded != expected:
            dependency_mismatches[key] = {
                "recorded": recorded,
                "current": expected,
            }
    if dependency_mismatches and not args.reauthenticate_resume_dependencies:
        mismatched = ", ".join(sorted(dependency_mismatches))
        raise ValueError(
            f"resume dependency hash mismatch for {mismatched}: {path}"
        )

    legacy.ORDER = order
    weighted_cache, cache_evidence = load_weighted_certificate_cache(
        args.resume_certificate_cache, order
    )
    if args.resume_certificate_cache_sha256 is not None:
        if cache_evidence is None:
            raise ValueError("a pinned cache hash requires a resume certificate cache")
        actual_cache_sha256 = cache_evidence["sha256"]
        if actual_cache_sha256 != args.resume_certificate_cache_sha256:
            raise ValueError(
                "resume certificate cache hash mismatch: "
                f"expected {args.resume_certificate_cache_sha256}, "
                f"found {actual_cache_sha256}"
            )
    if args.fast_resume_weighted_cache:
        if args.resume_artifact_runner_sha256 is None:
            raise ValueError(
                "fast weighted-cache resume requires a pinned predecessor runner hash"
            )
        if args.resume_certificate_cache_sha256 is None:
            raise ValueError(
                "fast weighted-cache resume requires a pinned certificate cache hash"
            )
    revalidated = []
    kind_counts = {
        "strict-linear-core": 0,
        "formalized-bank": 0,
        "weighted-kalmanson": 0,
    }
    for index, record in enumerate(payload.get("learned", ())):
        kind = record.get("kind")
        bank_record = None
        rows = legacy.rows_from_payload(record.get("rows", ()))
        if not rows:
            raise ValueError(f"empty resume clause {index}: {path}")
        if kind == "strict-linear-core":
            cached = weighted_cache.get(rows_key(rows))
            if cached is not None:
                if args.fast_resume_weighted_cache:
                    certificate = cached["certificate"]
                else:
                    certificate = (
                        legacy.producer_bank.certify_weighted_kalmanson_cancellation(
                            rows, 17, order, cached["terms"]
                        )
                    )
                    if certificate != cached["certificate"]:
                        raise ValueError(
                            f"weighted cache certificate drift at clause {index}: {path}"
                        )
                kind = "weighted-kalmanson"
                record = {
                    "kind": kind,
                    "rows": row_payload(rows),
                    "terms": cached["terms"],
                    "record": certificate,
                }
            else:
                hits = legacy.producer_bank.scan_all_formalized_cores(rows, 17, order)
                if hits:
                    kind = "formalized-bank"
                    bank_record = hits[0]
                    rows = legacy.minimize_bank_witness(rows, bank_record)
                else:
                    status, core = legacy.linear_replay_core(
                        rows, args.resume_timeout_ms
                    )
                    if status != "unsat":
                        raise ValueError(
                            f"resume linear clause {index} did not replay UNSAT: {status}"
                        )
                    rows = core
        elif kind == "formalized-bank":
            hits = legacy.producer_bank.scan_all_formalized_cores(rows, 17, order)
            if not hits:
                raise ValueError(f"resume bank clause {index} no longer matches: {path}")
            bank_record = hits[0]
            rows = legacy.minimize_bank_witness(rows, bank_record)
        elif kind == "weighted-kalmanson":
            if args.fast_resume_weighted_cache:
                cached = weighted_cache.get(rows_key(rows))
                if cached is None:
                    raise ValueError(
                        f"resume weighted clause {index} is absent from pinned cache: {path}"
                    )
                if record.get("terms", ()) != cached["terms"]:
                    raise ValueError(
                        f"resume weighted terms differ from pinned cache at clause {index}: {path}"
                    )
                certificate = cached["certificate"]
                if record.get("record") is not None and record["record"] != certificate:
                    raise ValueError(
                        f"resume weighted record differs from pinned cache at clause {index}: {path}"
                    )
                record = {
                    "kind": kind,
                    "rows": row_payload(rows),
                    "terms": cached["terms"],
                    "record": certificate,
                }
            else:
                certificate = legacy.producer_bank.certify_weighted_kalmanson_cancellation(
                    rows, 17, order, record.get("terms", ())
                )
                if record.get("record") is not None and certificate != record["record"]:
                    raise ValueError(
                        f"resume weighted certificate drift at clause {index}: {path}"
                    )
        else:
            raise ValueError(f"unsupported resume clause kind {kind!r}: {path}")
        legacy.block_row_pattern(solver, selected, rows)
        kind_counts[kind] += 1
        if kind == "weighted-kalmanson":
            revalidated.append(record)
        elif kind == "formalized-bank":
            if bank_record is None:
                raise AssertionError("formalized-bank replay lacks a bank witness")
            revalidated.append({
                "kind": kind,
                "record": bank_record,
                "rows": row_payload(rows),
            })
        else:
            revalidated.append({"kind": kind, "rows": row_payload(rows)})

    return revalidated, {
        "artifact": str(path.relative_to(REPO)),
        "sha256": sha256(path),
        "terminal": payload.get("terminal"),
        "clause_counts": kind_counts,
        "weighted_certificate_cache": cache_evidence,
        "fast_weighted_cache_resume": args.fast_resume_weighted_cache,
        "dependency_mismatches_reauthenticated": dependency_mismatches,
    }


def pin_exact_support(solver, selected, center: int, support: frozenset[int]):
    for point in POINTS:
        if point != center:
            solver.add(selected[center, point] == (point in support))


def validate_pinned_analysis_payload(
    payload: dict,
    order_index: int,
    positions: tuple[int, int],
    order: tuple[int, ...],
) -> tuple[dict[int, frozenset[int]], int]:
    """Recover one independently checked direct-CNF assignment.

    The analysis file is only an ingress format: every structural fact used to
    pin the source solver is checked again here, and the current theorem bank is
    rescanned later by ``run_case``.
    """

    if payload.get("schema") != MODEL_ANALYSIS_SCHEMA:
        raise ValueError("pinned analysis schema mismatch")
    if payload.get("order_index") != order_index:
        raise ValueError("pinned analysis order-index mismatch")
    if tuple(payload.get("anonymous_positions", ())) != positions:
        raise ValueError("pinned analysis anonymous-position mismatch")
    if tuple(payload.get("order", ())) != order:
        raise ValueError("pinned analysis cyclic-order mismatch")

    required_checks = (
        "cnf_assignment_verified",
        "source_z3_assignment_verified",
        "source_independent_model_checker_verified",
        "static_bank_assignment_verified_via_direct_cnf",
        "first_bank_hit_replayed",
    )
    failed_checks = [name for name in required_checks if payload.get(name) is not True]
    if failed_checks:
        raise ValueError(f"pinned analysis failed checks: {failed_checks}")

    rows = legacy.rows_from_payload(payload.get("rows", ()))
    if len(rows) != len(POINTS):
        raise ValueError(f"pinned analysis has {len(rows)} rows, expected 17")
    if {row.center for row in rows} != set(POINTS):
        raise ValueError("pinned analysis does not have exactly one row per centre")
    supports = {
        row.center: frozenset(row.support)
        for row in rows
    }
    if len(supports) != len(rows):
        raise ValueError("pinned analysis repeats a row centre")

    raw_fifth_center = payload.get("fifth_center")
    if not isinstance(raw_fifth_center, int):
        raise TypeError("pinned analysis fifth centre is not an integer")
    fifth_center = raw_fifth_center
    verify_model(supports, fifth_center)
    expected_rows = metric_rows(supports, fifth_center)
    if rows_key(rows) != rows_key(expected_rows):
        raise ValueError("pinned analysis exact-row flags do not match source semantics")
    return supports, fifth_center


def pin_analysis_model(args, order, solver, selected, fifth_choice):
    if args.pin_analysis is None:
        return None

    path = args.pin_analysis.resolve()
    payload = json.loads(path.read_text())
    supports, fifth_center = validate_pinned_analysis_payload(
        payload, args.order, args.positions, order
    )
    for center, support in supports.items():
        pin_exact_support(solver, selected, center, support)
    for center, literal in fifth_choice.items():
        solver.add(literal == (center == fifth_center))
    return {
        "artifact": str(path.relative_to(REPO)),
        "sha256": sha256(path),
        "fifth_center": fifth_center,
        "rows": len(supports),
    }


def run_smoke() -> dict:
    if active_schema(False) != SCHEMA:
        raise AssertionError("base source schema selection drifted")
    if active_schema(True) != TRANSITIVE_TWO_CIRCLE_SCHEMA:
        raise AssertionError("transitive source schema selection drifted")

    order = normalized_order(0, (0, 1))

    solver, selected, fifth_choice, _ = build_case(order, all_static_cuts=False)
    positive = solver.check()
    if positive != z3.sat:
        raise AssertionError(f"source-only smoke should be SAT, got {positive}")
    supports = supports_from_model(solver.model(), selected)
    fifth_center = fifth_center_from_model(solver.model(), fifth_choice)
    verify_model(supports, fifth_center)

    representative, rep_selected, rep_choice, _ = build_case(
        order, all_static_cuts=False
    )
    for center, support in REPRESENTATIVE_EXACT_ROWS.items():
        pin_exact_support(representative, rep_selected, center, support)
    representative.add(rep_choice[0])
    representative_status = representative.check()
    if representative_status != z3.sat:
        raise AssertionError(
            f"known representative should remain SAT, got {representative_status}"
        )
    rep_supports = supports_from_model(representative.model(), rep_selected)
    rep_fifth = fifth_center_from_model(representative.model(), rep_choice)
    verify_model(rep_supports, rep_fifth)

    pinned_payload = {
        "schema": MODEL_ANALYSIS_SCHEMA,
        "order_index": 0,
        "anonymous_positions": [0, 1],
        "order": list(order),
        "fifth_center": rep_fifth,
        "rows": row_payload(metric_rows(rep_supports, rep_fifth)),
        "cnf_assignment_verified": True,
        "source_z3_assignment_verified": True,
        "source_independent_model_checker_verified": True,
        "static_bank_assignment_verified_via_direct_cnf": True,
        "first_bank_hit_replayed": True,
    }
    pinned_supports, pinned_fifth = validate_pinned_analysis_payload(
        pinned_payload, 0, (0, 1), order
    )
    if pinned_supports != rep_supports or pinned_fifth != rep_fifth:
        raise AssertionError("pinned-analysis smoke changed the representative model")

    impossible, imp_selected, _, _ = build_case(order, all_static_cuts=False)
    impossible.add(imp_selected[8, 1], imp_selected[9, 1])
    negative = impossible.check()
    if negative != z3.unsat:
        raise AssertionError(f"partition-negative smoke should be UNSAT, got {negative}")

    metric = order_base.smoke()
    if metric != {"base": "sat", "known_schema": "unsat"}:
        raise AssertionError(f"unexpected metric smoke result: {metric}")

    closure_solver = z3.Solver()
    closure_selected = {
        (center, point): z3.Bool(f"smoke_selected_{center}_{point}")
        for center in POINTS
        for point in POINTS
        if center != point
    }
    closure_count = add_transitive_two_circle_bisector_exclusions(
        closure_solver, closure_selected, order
    )
    transitive_atoms = {
        (5, 6), (5, 12),
        (6, 3), (6, 12),
        (12, 3), (12, 6),
    }
    for atom, literal in closure_selected.items():
        closure_solver.add(literal == (atom in transitive_atoms))
    if closure_solver.check() != z3.unsat:
        raise AssertionError("transitive two-circle smoke should be UNSAT")

    negative_solver = z3.Solver()
    negative_selected = {
        (center, point): z3.Bool(f"negative_selected_{center}_{point}")
        for center in POINTS
        for point in POINTS
        if center != point
    }
    add_transitive_two_circle_bisector_exclusions(
        negative_solver, negative_selected, order
    )
    for atom, literal in negative_selected.items():
        negative_solver.add(literal == (atom in {(5, 6), (5, 12)}))
    if negative_solver.check() != z3.sat:
        raise AssertionError("one-row equality smoke should remain SAT")

    return {
        "schema": SCHEMA,
        "transitive_two_circle_schema": TRANSITIVE_TWO_CIRCLE_SCHEMA,
        "source_only": str(positive),
        "representative": str(representative_status),
        "partition_negative": str(negative),
        "metric": metric,
        "transitive_two_circle": {
            "forbidden_cores": closure_count,
            "positive": "unsat",
            "negative": "sat",
        },
        "representative_fifth_center": rep_fifth,
    }


def run_case(args, order: tuple[int, ...]) -> dict:
    started = time.monotonic()
    solver, selected, fifth_choice, cut_counts = build_case(
        order,
        all_static_cuts=args.all_static_cuts,
        transitive_two_circle=args.transitive_two_circle,
    )
    solver.set(random_seed=args.seed)
    counts = {
        "boolean_models": 0,
        "bank_unsat": 0,
        "linear_unsat": 0,
    }
    learned, resumed_from = revalidate_resume_artifact(
        args, order, solver, selected
    )
    pinned_analysis = pin_analysis_model(
        args, order, solver, selected, fifth_choice
    )
    terminal = "MODEL_LIMIT"
    witness = None

    while counts["boolean_models"] < args.models:
        boolean_status = solver.check()
        if boolean_status == z3.unsat:
            terminal = "BOOLEAN_CEGAR_UNSAT"
            break
        if boolean_status == z3.unknown:
            terminal = "BOOLEAN_UNKNOWN"
            break

        model = solver.model()
        supports = supports_from_model(model, selected)
        fifth_center = fifth_center_from_model(model, fifth_choice)
        verify_model(supports, fifth_center)
        rows = metric_rows(supports, fifth_center)
        counts["boolean_models"] += 1

        legacy.ORDER = order
        if not args.skip_bank:
            bank_hits = legacy.producer_bank.scan_all_formalized_cores(
                rows, 17, order
            )
            if bank_hits:
                core = legacy.minimize_bank_witness(rows, bank_hits[0])
                legacy.block_row_pattern(solver, selected, core)
                counts["bank_unsat"] += 1
                learned.append({
                    "kind": "formalized-bank",
                    "record": bank_hits[0],
                    "rows": row_payload(core),
                })
                continue

        metric_status, core = legacy.linear_replay_core(rows, args.timeout_ms)
        if metric_status == "unsat":
            legacy.block_row_pattern(solver, selected, core)
            counts["linear_unsat"] += 1
            learned.append({
                "kind": "strict-linear-core",
                "rows": row_payload(core),
            })
            continue

        if metric_status == "unknown":
            witness = {
                "fifth_center": fifth_center,
                "rows": row_payload(rows),
                "metric_status": metric_status,
            }
            terminal = "METRIC_UNKNOWN"
            # An unknown replay is never blocked on a path to UNSAT.
            break

        if args.skip_bank:
            witness = {
                "fifth_center": fifth_center,
                "rows": row_payload(rows),
                "metric_status": metric_status,
            }
            terminal = "LINEAR_SAT_SURVIVOR_UNBANKED"
            # Discovery mode records the first linearly feasible model without
            # claiming that the stronger formalized theorem bank accepts it.
            break

        witness = {
            "fifth_center": fifth_center,
            "rows": row_payload(rows),
            "metric_status": metric_status,
        }
        terminal = "SAT_SURVIVOR"
        # A survivor is never blocked on a path to UNSAT.
        break

    return {
        "schema": active_schema(args.transitive_two_circle),
        "order_index": args.order,
        "anonymous_positions": list(args.positions),
        "order": list(order),
        "options": {
            "all_static_cuts": args.all_static_cuts,
            "transitive_two_circle": args.transitive_two_circle,
            "skip_bank": args.skip_bank,
            "models": args.models,
            "seed": args.seed,
            "timeout_ms": args.timeout_ms,
            "resume_certificate_cache": (
                str(args.resume_certificate_cache.resolve().relative_to(REPO))
                if args.resume_certificate_cache is not None
                else None
            ),
            "resume_artifact_runner_sha256": args.resume_artifact_runner_sha256,
            "resume_certificate_cache_sha256": (
                args.resume_certificate_cache_sha256
            ),
            "fast_resume_weighted_cache": args.fast_resume_weighted_cache,
            "pin_analysis": (
                str(args.pin_analysis.resolve().relative_to(REPO))
                if args.pin_analysis is not None
                else None
            ),
            "filter_order": (
                "linear-only" if args.skip_bank
                else "formalized-bank-then-linear"
            ),
        },
        "counts": counts,
        "cut_counts": list(cut_counts),
        "learned": learned,
        "resumed_from": resumed_from,
        "pinned_analysis": pinned_analysis,
        "terminal": terminal,
        "witness": witness,
        "elapsed_seconds": time.monotonic() - started,
        "scope": (
            "one normalized exact-17 cap-nine hard case; not a Lean coverage "
            "theorem and not a full exact-cardinality closure"
        ),
        "source_hashes": {
            "runner": sha256(Path(__file__)),
            "fullcover": sha256(HERE / "exact17_fullcover_cegar.py"),
            "order_base": sha256(HERE / "exact17_kalmanson.py"),
            "producer_bank": sha256(REPO / "census/atail_force/producer_bank.py"),
        },
    }


def parse_positions(raw: str) -> tuple[int, int]:
    values = tuple(int(value) for value in raw.split(","))
    if len(values) != 2:
        raise argparse.ArgumentTypeError("expected i,j")
    return values


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--order", type=int, choices=(0, 1), default=0)
    parser.add_argument("--positions", type=parse_positions, default=(0, 1))
    parser.add_argument("--models", type=int, default=100)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--resume-timeout-ms", type=int, default=120_000)
    parser.add_argument("--resume-artifact", type=Path)
    parser.add_argument("--resume-certificate-cache", type=Path)
    parser.add_argument("--resume-artifact-runner-sha256")
    parser.add_argument("--resume-certificate-cache-sha256")
    parser.add_argument("--fast-resume-weighted-cache", action="store_true")
    parser.add_argument(
        "--reauthenticate-resume-dependencies",
        action="store_true",
        help=(
            "accept predecessor dependency-hash drift only while replaying every "
            "learned clause against the current theorem bank or pinned exact cache"
        ),
    )
    parser.add_argument("--pin-analysis", type=Path)
    parser.add_argument("--all-static-cuts", action="store_true")
    parser.add_argument("--transitive-two-circle", action="store_true")
    parser.add_argument("--skip-bank", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.smoke:
        report = run_smoke()
        print(json.dumps(report, sort_keys=True))
        return 0

    order = normalized_order(args.order, args.positions)
    report = run_case(args, order)
    output = args.output or (
        OUTPUT_ROOT
        / f"o{args.order}-p{args.positions[0]}-{args.positions[1]}-s{args.seed}.json"
    )
    output = output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "artifact": str(output.relative_to(REPO)),
        "terminal": report["terminal"],
        "boolean_models": report["counts"]["boolean_models"],
        "elapsed_seconds": round(report["elapsed_seconds"], 3),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
