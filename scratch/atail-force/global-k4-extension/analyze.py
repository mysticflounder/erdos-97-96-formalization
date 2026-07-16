#!/usr/bin/env python3
"""Audit the first global extensions of the exact 14-point ATAIL model.

The script keeps three logically different claims separate:

* exact facts about the pinned 14-point Euclidean carrier;
* satisfiability of a row-incidence completion inside the existing finite
  convex-class shadow; and
* exact-CAS infeasibility of one concrete metric realization of that row
  completion.

None of the latter two claims is a Lean proof or a live K-A-PAIR producer.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
LOCAL_DIR = HERE.parent / "cap-local-transport-model"
LOCAL_CHECKER = LOCAL_DIR / "check.py"
LOCAL_CHECKPOINT = LOCAL_DIR / "checkpoint.json"
CURRENT_SURVIVORS = (
    HERE.parent
    / "second_center_query"
    / "formalized_core_shards_after_seven_point_six_circle_checkpoint.json"
)
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
CHECKPOINT = HERE / "checkpoint.json"

PINNED_SHA256 = {
    str(LOCAL_CHECKER.relative_to(ROOT)): (
        "7819cdc85946a931879fc1a530ac64cdb0c62af56b3a0ded2663c0bf033cae16"
    ),
    str(LOCAL_CHECKPOINT.relative_to(ROOT)): (
        "19824ef888d2a4fd29ac994eee9ed7aa9238b294aecacd43beb7e3315e03ee36"
    ),
    str(CURRENT_SURVIVORS.relative_to(ROOT)): (
        "199236b660b11bbc80e673de47d035ecd5ce8b7cd112aa8e0929a4f0c7516787"
    ),
}

for path in (ROOT, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

from census.global_confinement import shadow  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _closure_circle_index,
    _row_equality_closure,
)
from census.multi_center import multi_center_census as mc  # noqa: E402

import oracle  # noqa: E402


HULL_NAMES = (
    "O",
    "t1",
    "I",
    "F",
    "A",
    "X",
    "Y",
    "Z",
    "D",
    "J",
    "E",
    "C",
    "G",
    "K",
)

# Frame profile/order corresponding to the exact hull above.  In the census
# convention S is the A--C cap, O1 the C--O cap, and O2 the O--A cap.
PROFILE = (8, 4, 5)

# One finite-shadow completion.  The O-centered full class has cardinality
# five; ``global:O`` is merely a selected four-subset and is therefore not
# marked exact.  Every other row is an exact four-class in this abstraction.
COMPLETION_SUPPORTS = {
    "O": ("A", "C", "D", "E"),
    "A": ("O", "C", "G", "K"),
    "C": ("O", "X", "t1", "I"),
    "X": ("A", "Z", "J", "K"),
    "Y": ("C", "X", "Z", "F"),
    "Z": ("C", "Y", "J", "I"),
    "D": ("A", "E", "I", "F"),
    "J": ("A", "Y", "G", "t1"),
    "E": ("O", "Y", "J", "F"),
    "G": ("C", "K", "t1", "F"),
    "K": ("O", "Z", "E", "G"),
    "t1": ("X", "Y", "Z", "D"),
    "I": ("O", "X", "J", "E"),
    "F": ("A", "X", "G", "I"),
}

# The two prescribed arrows retain the cap-local blockers E -> D and D -> t1.
# O is deliberately never used as a blocker: its ambient class has size five,
# so deleting one support point would leave a K4 witness.
BLOCKER_MAP = {
    "O": "A",
    "A": "D",
    "C": "A",
    "X": "C",
    "Y": "E",
    "Z": "X",
    "D": "t1",
    "J": "E",
    "E": "D",
    "G": "A",
    "K": "A",
    "t1": "C",
    "I": "D",
    "F": "D",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def check_sources() -> dict[str, str]:
    actual = {name: sha256(ROOT / name) for name in PINNED_SHA256}
    if actual != PINNED_SHA256:
        raise RuntimeError(
            f"pinned source drift: expected {PINNED_SHA256}, found {actual}"
        )
    return actual


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def exact_local_audit() -> dict[str, object]:
    local = load_module(LOCAL_CHECKER, "p97_cap_local_transport_model")
    expected = json.loads(LOCAL_CHECKPOINT.read_text(encoding="utf-8"))
    report = local.check_model()
    if report != expected:
        raise RuntimeError("pinned exact local model no longer matches checkpoint")

    points = local.build_points()
    profiles = {
        center: local.B.radius_profile(points, center) for center in sorted(points)
    }
    max_cards = {
        center: max(map(len, profile.values()), default=0)
        for center, profile in profiles.items()
    }
    blocker_candidates = {
        source: local.exact_blocker_candidates(profiles, source)
        for source in sorted(points)
    }
    centers_without_k4 = sorted(
        center for center, card in max_cards.items() if card < 4
    )
    sources_without_blocker = sorted(
        source for source, candidates in blocker_candidates.items() if not candidates
    )
    if centers_without_k4 != expected["centers_without_k4"]:
        raise RuntimeError("independent all-center K4 audit disagrees with checkpoint")
    if sources_without_blocker != expected["sources_without_exact_deletion_blocker"]:
        raise RuntimeError("independent critical-source audit disagrees with checkpoint")

    return {
        "carrier_card": len(points),
        "all_center_k4": not centers_without_k4,
        "centers_without_k4": centers_without_k4,
        "total_exact_deletion_blocker_map": not sources_without_blocker,
        "sources_without_exact_deletion_blocker": sources_without_blocker,
        "relevant_pair": expected["pair"],
        "relevant_blockers": expected["blockers"],
        "relevant_directed_cross_hits": expected["directed_cross_hits"],
        "independent_profile_reconstruction_matches": True,
        "exact_local_checkpoint_replay_matches": True,
    }


def frame_and_labels() -> tuple[mc.Frame, dict[str, int], dict[int, str]]:
    frame, candidates = mc.cached_candidate_lists(PROFILE, set(mc.PROVEN_ROWS))
    if candidates is None:
        raise RuntimeError("profile unexpectedly has no candidate rows")
    order = shadow.hull_order(frame)
    if len(order) != len(HULL_NAMES):
        raise RuntimeError("frame/hull cardinality drift")
    by_name = {name: label for label, name in zip(order, HULL_NAMES)}
    by_label = {label: name for name, label in by_name.items()}
    return frame, by_name, by_label


def completion_rows() -> tuple[shadow.ClassRow, ...]:
    _frame, by_name, _by_label = frame_and_labels()
    return tuple(
        shadow.ClassRow(
            f"global:{center_name}",
            by_name[center_name],
            frozenset(by_name[name] for name in COMPLETION_SUPPORTS[center_name]),
            exact=center_name != "O",
        )
        for center_name in sorted(COMPLETION_SUPPORTS, key=lambda name: by_name[name])
    )


def finite_shadow_audit() -> dict[str, object]:
    frame, by_name, by_label = frame_and_labels()
    rows = completion_rows()
    ok, reason = shadow.verify_assignment(frame, set(mc.PROVEN_ROWS), rows)
    if not ok:
        raise RuntimeError(f"completion failed independent shadow verifier: {reason}")
    by_center = {row.center: row for row in rows}
    if set(by_center) != set(range(frame.n)):
        raise RuntimeError("completion does not provide exactly one row per center")

    blocker_records = []
    for source_name, center_name in BLOCKER_MAP.items():
        source = by_name[source_name]
        center = by_name[center_name]
        row = by_center[center]
        if center_name == "O" or not row.exact or source not in row.support:
            raise RuntimeError(f"invalid abstract blocker arrow {source_name}->{center_name}")
        blocker_records.append(
            {
                "source": source_name,
                "blocker": center_name,
                "support": sorted(by_label[label] for label in row.support),
            }
        )

    # Semantic smoke gates for the exact-row compatibility rule.  The SAT
    # smoke uses two checked rows of the completion.  The UNSAT smoke changes
    # one exact row at the same center while retaining a shared point.
    row_a = by_center[by_name["A"]]
    row_d = by_center[by_name["D"]]
    if not shadow.rows_compatible(frame, row_a, row_d):
        raise RuntimeError("known compatible row smoke unexpectedly failed")
    bad_same_center = shadow.ClassRow(
        "smoke:bad-same-center",
        row_a.center,
        frozenset((by_name["O"], by_name["D"], by_name["E"], by_name["F"])),
        exact=True,
    )
    if shadow.rows_compatible(frame, row_a, bad_same_center):
        raise RuntimeError("known exact-overlap UNSAT smoke unexpectedly passed")

    completion_json = [
        {
            "center": by_label[row.center],
            "support": sorted(by_label[label] for label in row.support),
            "exact": row.exact,
        }
        for row in rows
    ]
    return {
        "status": "SAT_FINITE_SHADOW_ONLY",
        "profile": list(PROFILE),
        "cyclic_order": list(HULL_NAMES),
        "one_row_at_every_center": True,
        "abstract_total_critical_map": True,
        "relevant_arrows": {"E": "D", "D": "t1"},
        "relevant_cross_nonmemberships_retained": {
            "D_not_in_D_centered_E_shell": True,
            "E_not_in_t1_centered_D_shell": True,
        },
        "rows": completion_json,
        "blocker_map": blocker_records,
        "completion_sha256": canonical_sha256(completion_json),
        "independent_shadow_verifier": "PASS",
        "smoke_known_compatible": "PASS",
        "smoke_known_exact_overlap_incompatible": "PASS",
    }


def metric_rows() -> tuple[MetricRow, ...]:
    _frame, by_name, _by_label = frame_and_labels()
    rows = []
    for center_name, support_names in COMPLETION_SUPPORTS.items():
        # Restore the exact ambient five-point O class rather than the chosen
        # four-subset used by the incidence shadow.
        if center_name == "O":
            support_names = ("A", "C", "D", "J", "E")
        rows.append(
            MetricRow(
                by_name[center_name],
                tuple(sorted(by_name[name] for name in support_names)),
                exact=center_name != "O",
            )
        )
    return tuple(sorted(rows, key=lambda row: row.center))


def result_dict(result: Any) -> dict[str, object]:
    answer: dict[str, object] = {"verdict": result.verdict}
    if result.detail is not None:
        answer["detail"] = result.detail
    return answer


def cas_crosscheck(rows: Iterable[MetricRow]) -> dict[str, object]:
    rows = tuple(rows)
    variables = tuple(str(variable) for variable in oracle.variable_symbols(14))
    polynomials = oracle.serialized_system(14, rows)
    singular = oracle.run_singular(variables, polynomials, timeout_s=30.0)
    msolve_forward = oracle.run_msolve(variables, polynomials, timeout_s=30.0)
    msolve_reverse = oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=30.0
    )
    verdicts = (
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    )
    status = (
        "CROSSCHECKED_UNIT"
        if verdicts == ("UNIT", "UNIT", "UNIT")
        else "UNDECIDED_FAIL_CLOSED"
    )
    return {
        "status": status,
        "row_count": len(rows),
        "equality_count": len(polynomials),
        "rows": [
            {"center": row.center, "support": list(row.support)} for row in rows
        ],
        "expanded_polynomial_sha256": canonical_sha256(list(polynomials)),
        "singular_qq": result_dict(singular),
        "msolve_qq_forward_variables": result_dict(msolve_forward),
        "msolve_qq_reverse_variables": result_dict(msolve_reverse),
    }


def metric_audit() -> dict[str, object]:
    rows = metric_rows()
    by_center = {row.center: row for row in rows}
    # A deletion pass found this five-row UNIT subsystem.  It is cross-checked
    # here, but deliberately not called globally minimal or irredundant.
    core_centers = (0, 6, 8, 12, 13)  # O, D, E, I, F in frame labels.
    core = tuple(by_center[center] for center in core_centers)
    smoke = oracle.smoke_gates()
    full = cas_crosscheck(rows)
    retained = cas_crosscheck(core)
    if full["status"] != "CROSSCHECKED_UNIT":
        raise RuntimeError("full metric completion was not cross-checked UNIT")
    if retained["status"] != "CROSSCHECKED_UNIT":
        raise RuntimeError("retained five-row subsystem was not cross-checked UNIT")
    return {
        "coordinate_gauge": {"O": [0, 0], "A": [1, 0]},
        "solver_smoke_gates": smoke,
        "full_completion": full,
        "retained_unit_subsystem": {
            **retained,
            "center_names": ["O", "D", "E", "I", "F"],
            "minimality_claimed": False,
            "nullstellensatz_certificate_replayed": False,
        },
        "interpretation": (
            "no normalized complex realization of this one concrete row "
            "completion; therefore no normalized real realization"
        ),
    }


def equality_roots(rows: tuple[MetricRow, ...], n: int) -> tuple[tuple[int, ...], ...]:
    roots, _circle_masks = _closure_circle_index(_row_equality_closure(n, rows), n)
    return roots


def best_u1_match(rows: tuple[MetricRow, ...], n: int) -> dict[str, object]:
    roots = equality_roots(rows, n)

    def same(center: int, left: int, right: int) -> bool:
        return roots[center][left] == roots[center][right]

    def fields(a: int, c: int, d: int, e: int, f: int) -> tuple[bool, ...]:
        return (
            same(c, a, d),
            same(c, a, f),
            same(d, c, e),
            same(d, c, f),
            same(f, a, d),
            same(f, a, e),
            same(e, a, c),
        )

    minimum_size = 8
    first_assignment_by_missing: dict[tuple[int, ...], tuple[int, ...]] = {}
    for assignment in itertools.permutations(range(n), 5):
        missing = tuple(
            index + 1
            for index, present in enumerate(fields(*assignment))
            if not present
        )
        if len(missing) < minimum_size:
            minimum_size = len(missing)
            first_assignment_by_missing = {}
        if len(missing) == minimum_size:
            first_assignment_by_missing.setdefault(missing, assignment)
    if not first_assignment_by_missing:
        raise RuntimeError("empty U1 match domain")
    # Prefer the one-edge exact-row extensions before the irregular h7 arm.
    # This is a reporting choice among equally small matches, not a claim that
    # h5 is logically stronger than h4 or h7.
    preferred_order = ((5,), (4,), (5, 7))
    preferred = next(
        (missing for missing in preferred_order if missing in first_assignment_by_missing),
        min(first_assignment_by_missing),
    )
    return {
        "minimum_missing_hypothesis_count": minimum_size,
        "preferred_missing_hypotheses": list(preferred),
        "preferred_assignment_a_c_d_e_f": list(
            first_assignment_by_missing[preferred]
        ),
        "all_minimum_missing_sets": [
            list(missing) for missing in sorted(first_assignment_by_missing)
        ],
    }


def current_u1_near_match_audit() -> dict[str, object]:
    checkpoint = json.loads(CURRENT_SURVIVORS.read_text(encoding="utf-8"))
    cases = []
    for record in checkpoint["cases"]:
        survivor = record.get("survivor")
        if survivor is None:
            continue
        rows = tuple(
            MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                bool(row["exact"]),
            )
            for row in survivor["distinct_metric_rows"]
        )
        n = int(survivor["frame"]["n"])
        match = best_u1_match(rows, n)
        a, c, d, e, f = match["preferred_assignment_a_c_d_e_f"]
        by_center = {row.center: set(row.support) for row in rows}
        role_fields = {
            4: (d, c, f),
            5: (f, a, d),
            7: (e, a, c),
        }
        missing_details = []
        for hypothesis in match["preferred_missing_hypotheses"]:
            if hypothesis not in role_fields:
                raise RuntimeError(f"unexpected current near-miss h{hypothesis}")
            center, left, right = role_fields[hypothesis]
            support = by_center[center]
            missing_details.append(
                {
                    "hypothesis": hypothesis,
                    "center": center,
                    "left": left,
                    "right": right,
                    "left_in_global_row": left in support,
                    "right_in_global_row": right in support,
                    "global_row_support": sorted(support),
                    "blocker_alignment_that_forces_edge": (
                        f"centerAt({right}) = {center}"
                        if left in support and right not in support
                        else None
                    ),
                }
            )
        cases.append(
            {
                "shard_index": int(record["partition"]["shard_index"]),
                **match,
                "missing_role_details": missing_details,
            }
        )
    cases.sort(key=lambda case: case["shard_index"])
    histogram = Counter(
        tuple(case["preferred_missing_hypotheses"]) for case in cases
    )
    return {
        "case_count": len(cases),
        "missing_set_histogram": {
            ",".join(map(str, key)): value for key, value in sorted(histogram.items())
        },
        "h4_only_row_d_contains_c_omits_f_count": sum(
            case["preferred_missing_hypotheses"] == [4]
            and case["missing_role_details"][0]["left_in_global_row"]
            and not case["missing_role_details"][0]["right_in_global_row"]
            for case in cases
        ),
        "h5_only_row_f_contains_a_omits_d_count": sum(
            case["preferred_missing_hypotheses"] == [5]
            and case["missing_role_details"][0]["left_in_global_row"]
            and not case["missing_role_details"][0]["right_in_global_row"]
            for case in cases
        ),
        "h5_h7_h5_is_exact_row_extension_count": sum(
            case["preferred_missing_hypotheses"] == [5, 7]
            and case["missing_role_details"][0]["left_in_global_row"]
            and not case["missing_role_details"][0]["right_in_global_row"]
            for case in cases
        ),
        "role_map": {
            "h4": "c and f lie in one equality class centered at d",
            "h5": "a and d lie in one equality class centered at f",
            "h7": "a and c lie in one equality class centered at e",
        },
        "first_alignment_layer": {
            "h4": "centerAt(f) = d forces f into the exact row at d",
            "h5": "centerAt(d) = f forces d into the exact row at f",
            "h7": (
                "irregular: an alignment alone helps only when the other endpoint "
                "is already in the exact row at e"
            ),
        },
        "forced_by_all_center_k4_or_total_criticality": False,
        "cases": cases,
    }


def build_report() -> dict[str, object]:
    source_sha256 = check_sources()
    return {
        "schema": "p97-atail-global-k4-extension-audit-v1",
        "epistemic_status": {
            "fixed_carrier": "EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL",
            "row_completion": "SAT_FINITE_SHADOW_ONLY",
            "metric_completion": "TRUSTED_EXACT_CAS_CROSSCHECK_NOT_CERTIFICATE_REPLAY",
            "live_producer": "OPEN",
        },
        "source_sha256": source_sha256,
        "fixed_carrier": exact_local_audit(),
        "row_incidence_extension": finite_shadow_audit(),
        "metric_realizability_of_one_completion": metric_audit(),
        "current_u1_bank_near_matches": current_u1_near_match_audit(),
        "encoded_omitted_ledger": {
            "encoded": [
                "the exact 14-point local Euclidean/MEC/cap/no-M44 model",
                "one candidate selected row at every one of the 14 centers",
                "one abstract exact critical row covering every source",
                "the prescribed E->D and D->t1 blocker arrows",
                "current proven local cap-row and two-circle compatibility filters",
                "all squared-distance equalities of the concrete row completion",
            ],
            "omitted": [
                "Euclidean realizability of arbitrary alternative global-row choices",
                "a proof that the finite row completion is exhaustive",
                "ambient exactness/no-q-free for unencoded radius classes",
                "a replayed Nullstellensatz certificate in Lean",
                "a live row producer selecting the retained O,D,E,I,F subsystem",
            ],
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=CHECKPOINT)
    args = parser.parse_args()
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print("PASS: exact local replay, shadow smokes, and dual-CAS checks match checkpoint")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
