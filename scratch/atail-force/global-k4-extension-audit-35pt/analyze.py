"""Replay the first all-center-K4 obligations of the exact 35-point model.

This is a scratch theorem-discovery audit.  It pins the total-CSS Euclidean
regression, computes every squared-distance class exactly in the multiquadratic
field Q(sqrt(2), sqrt(3), sqrt(13)), and asks two deliberately separate
questions:

* which carrier centers already have a four-point radius class; and
* after forgetting the fixed coordinates, can one arbitrary selected row at a
  relevant deficient center avoid the current formalized producer bank?

The second question is only a bounded incidence relaxation.  A bank-clean row
is not a Euclidean completion, while a fixed-coordinate profile with no K4 is
an exact obstruction only for this pinned 35-point carrier.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from types import ModuleType
from typing import Any, Iterable, Mapping, Sequence

import sympy as sp

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank  # noqa: E402


MODEL_PATH = (
    HERE.parent
    / "global-critical-continuation"
    / "verify_total_css_completion.py"
)
EXPECTED_MODEL_SHA256 = (
    "adbc3583b5bfefc0d2cf80af45b3a09a2a0d47ede836168d9bb61683083e1ff7"
)
EXPECTED_COORDINATE_SHA256 = (
    "c5289a5ded63bca9c2c56b40211c2ec53009a83df66f9594815b9c5681db7dce"
)
CHECKPOINT = HERE / "checkpoint.json"

# The centers are chosen for route relevance, not because the other twenty
# deficient centers cease to be global-K4 obligations.
SEARCH_CENTERS = ("G", "K")
DEFAULT_SCAN_LIMIT = 500


def load_pinned_model() -> ModuleType:
    digest = hashlib.sha256(MODEL_PATH.read_bytes()).hexdigest()
    assert digest == EXPECTED_MODEL_SHA256, (MODEL_PATH, digest)
    spec = importlib.util.spec_from_file_location("atail_total_css_35", MODEL_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def multiquadratic_key(value: sp.Expr) -> tuple[sp.Rational, ...]:
    """Canonical coefficients in the basis 1,z,y,yz,x,xz,xy,xyz.

    Here x^2=2, y^2=3, and z^2=13.  The source coordinates use only
    rational numbers and sqrt(2), sqrt(3), sqrt(26), so every squared
    distance belongs to this eight-dimensional field.  Reducing a polynomial
    in formal x,y,z is much faster than pairwise ``sympy.simplify`` and is an
    exact equality key, not a floating comparison.
    """

    x, y, z = sp.symbols("_sqrt2 _sqrt3 _sqrt13")
    replacements = {
        sp.sqrt(2): x,
        sp.sqrt(3): y,
        sp.sqrt(13): z,
        sp.sqrt(6): x * y,
        sp.sqrt(26): x * z,
        sp.sqrt(39): y * z,
        sp.sqrt(78): x * y * z,
    }
    polynomial = sp.Poly(
        sp.expand(value).xreplace(replacements), x, y, z, domain=sp.QQ
    )
    coefficients = [sp.Rational(0) for _ in range(8)]
    for (x_power, y_power, z_power), coefficient in polynomial.terms():
        basis_index = (
            (x_power % 2) * 4 + (y_power % 2) * 2 + (z_power % 2)
        )
        coefficients[basis_index] += sp.Rational(coefficient) * (
            2 ** (x_power // 2)
        ) * (3 ** (y_power // 2)) * (13 ** (z_power // 2))
    return tuple(coefficients)


def exact_profiles(
    model: ModuleType, points: Mapping[str, Any]
) -> dict[str, list[tuple[tuple[sp.Rational, ...], tuple[str, ...]]]]:
    profiles: dict[
        str, dict[tuple[sp.Rational, ...], list[str]]
    ] = {}
    for center in points:
        groups: dict[tuple[sp.Rational, ...], list[str]] = {}
        for support in points:
            if support == center:
                continue
            radius = multiquadratic_key(
                model.G.squared_distance(points[center], points[support])
            )
            assert any(radius), (center, support)
            groups.setdefault(radius, []).append(support)
        profiles[center] = [
            (radius, tuple(sorted(support)))
            for radius, support in sorted(
                groups.items(), key=lambda item: (-len(item[1]), item[1])
            )
        ]
    return profiles


def row_supports(
    profiles: Mapping[
        str, Sequence[tuple[tuple[sp.Rational, ...], tuple[str, ...]]]
    ],
    *,
    minimum_card: int,
) -> dict[str, list[tuple[str, ...]]]:
    return {
        center: [support for _radius, support in profile if len(support) >= minimum_card]
        for center, profile in profiles.items()
    }


def pair_center_counts(
    rows: Iterable[tuple[str, Sequence[str]]]
) -> dict[tuple[str, str], set[str]]:
    result: dict[tuple[str, str], set[str]] = {}
    for center, support in rows:
        for pair in itertools.combinations(sorted(support), 2):
            result.setdefault(pair, set()).add(center)
    return result


def candidate_rows(
    *,
    center: str,
    labels: Sequence[str],
    order: Sequence[str],
    own_cap: set[str],
    baseline_supports: Sequence[tuple[str, Sequence[str]]],
) -> list[tuple[str, ...]]:
    """Enumerate current-label selected-row shadows passing cheap sound gates."""

    counts = pair_center_counts(baseline_supports)
    baseline_sets = [set(support) for _other_center, support in baseline_supports]
    positions = {label: index for index, label in enumerate(order)}

    def centers_and_shared_pair_alternate(
        other_center: str, shared_pair: set[str]
    ) -> bool:
        first, second = sorted(shared_pair, key=positions.__getitem__)
        size = len(order)
        first_offset = (positions[first] - positions[center]) % size
        second_offset = (positions[second] - positions[center]) % size
        other_offset = (positions[other_center] - positions[center]) % size
        return min(first_offset, second_offset) < other_offset < max(
            first_offset, second_offset
        )

    candidates: list[tuple[str, ...]] = []
    for support in itertools.combinations((label for label in labels if label != center), 4):
        support_set = set(support)
        # A selected row centered in one ordered cap spends at most two support
        # points in that same cap.
        if len(support_set & own_cap) > 2:
            continue
        # Distinct circles share at most two carrier points.
        if any(len(support_set & old_support) > 2 for old_support in baseline_sets):
            continue
        # A carrier pair has at most two distinct bisector centers.
        if any(
            len(counts.get(tuple(sorted(pair)), set())) >= 2
            for pair in itertools.combinations(support, 2)
        ):
            continue
        # Apply the kernel-checked two-circle same-side order obstruction in
        # both cyclic orientations before the expensive all-family scan.
        order_bad = False
        for other_center, old_support in baseline_supports:
            shared = support_set & set(old_support)
            if len(shared) == 2 and not centers_and_shared_pair_alternate(
                other_center, shared
            ):
                order_bad = True
                break
        if order_bad:
            continue
        candidates.append(tuple(support))
    return candidates


def metric_rows(
    *,
    labels: Sequence[str],
    baseline_supports: Sequence[tuple[str, Sequence[str]]],
    added: Sequence[tuple[str, Sequence[str]]] = (),
) -> tuple[producer_bank.MetricRow, ...]:
    by_label = {label: index for index, label in enumerate(labels)}
    rows = [
        producer_bank.MetricRow(
            center=by_label[center],
            support=tuple(by_label[label] for label in support),
            exact=True,
        )
        for center, support in baseline_supports
    ]
    rows.extend(
        producer_bank.MetricRow(
            center=by_label[center],
            support=tuple(by_label[label] for label in support),
            exact=False,
        )
        for center, support in added
    )
    return tuple(rows)


def match_summary(matches: Sequence[Mapping[str, object]]) -> list[dict[str, object]]:
    return [
        {
            "stage": match["stage"],
            "orientation": match["orientation"],
            "lean_consumer": match["lean_consumer"],
        }
        for match in matches
    ]


def scan_relevant_single_rows(
    *,
    labels: Sequence[str],
    order: Sequence[str],
    baseline_supports: Sequence[tuple[str, Sequence[str]]],
    caps: Mapping[str, set[str]],
    scan_limit: int,
    include_common_system: bool,
) -> dict[str, object]:
    by_label = {label: index for index, label in enumerate(labels)}
    order_indices = tuple(by_label[label] for label in order)
    baseline_rows = metric_rows(
        labels=labels, baseline_supports=baseline_supports
    )
    baseline_matches = producer_bank.scan_all_formalized_cores(
        baseline_rows,
        len(labels),
        order_indices,
        include_common_system=include_common_system,
    )

    results: dict[str, object] = {
        "baseline_bank_matches": match_summary(baseline_matches),
        "bank_scope": (
            "ALL_CURRENT_FORMALIZED_FAMILIES"
            if include_common_system
            else "PRODUCTION_METRIC_BANK_WITHOUT_SCRATCH_COMMON_SYSTEM_MATCHERS"
        ),
        "pre_applied_formalized_gate": (
            "FourPointTwoCircleBisectorOrderCore in both cyclic orientations"
        ),
        "centers": {},
    }
    for center in SEARCH_CENTERS:
        candidates = candidate_rows(
            center=center,
            labels=labels,
            order=order,
            own_cap=caps[center],
            baseline_supports=baseline_supports,
        )
        scanned = 0
        matched = 0
        first_bank_clean: tuple[str, ...] | None = None
        first_match: dict[str, object] | None = None
        for support in candidates[:scan_limit]:
            scanned += 1
            rows = metric_rows(
                labels=labels,
                baseline_supports=baseline_supports,
                added=((center, support),),
            )
            matches = producer_bank.scan_all_formalized_cores(
                rows,
                len(labels),
                order_indices,
                include_common_system=include_common_system,
            )
            if matches:
                matched += 1
                if first_match is None:
                    first_match = {
                        "support": list(support),
                        "matches": match_summary(matches),
                    }
            else:
                first_bank_clean = support
                break
        results["centers"][center] = {
            "candidate_count": len(candidates),
            "scan_limit": scan_limit,
            "scanned_until_first_clean_or_limit": scanned,
            "bank_matched_before_first_clean": matched,
            "first_bank_clean_support": (
                list(first_bank_clean) if first_bank_clean is not None else None
            ),
            "first_bank_match": first_match,
        }
    return results


def analyze(*, scan_limit: int, include_common_system: bool) -> dict[str, object]:
    model = load_pinned_model()
    points = model.build_points()
    assert model.R.coordinate_digest(points) == EXPECTED_COORDINATE_SHA256
    assert len(points) == len(model.HULL_ORDER)
    assert set(points) == set(model.HULL_ORDER)

    profiles = exact_profiles(model, points)
    k4_rows = row_supports(profiles, minimum_card=4)
    deficient = sorted(center for center, rows in k4_rows.items() if not rows)
    assert len(deficient) == 24
    assert all(
        max(len(support) for _radius, support in profiles[center]) == 1
        for center in deficient
    )

    available = {
        center: [list(support) for support in supports]
        for center, supports in sorted(k4_rows.items())
        if supports
    }
    assert available["A"] == [["C", "G", "K", "O"]]
    assert available["O"] == [["A", "C", "D", "E", "J"]]

    old_added = {name for name in model.R.HULL_ORDER if "_k4_" in name}
    j_added = {f"J_css_{index}" for index in range(1, 4)}
    t1_added = {f"t1_css_{index}" for index in range(1, 4)}
    cap_sets = {
        "surplus": {"O", "t1", "I", "F", "A"} | t1_added,
        "opposite_1": {"A", "X", "Y", "Z", "D", "J", "E", "C"} | j_added,
        "opposite_2": {"C", "G", "K", "O"} | old_added,
    }
    center_cap: dict[str, set[str]] = {}
    boundary = {"O", "A", "C"}
    for label in points:
        containing = [cap for cap in cap_sets.values() if label in cap]
        if label in boundary:
            # Boundary centers have two choices; they are not in SEARCH_CENTERS.
            continue
        assert len(containing) == 1, (label, containing)
        center_cap[label] = containing[0]

    strict_opposite_2 = cap_sets["opposite_2"] - boundary
    second_apex_row = set(available["A"][0])
    forced_continuations = sorted(second_apex_row & strict_opposite_2)
    assert forced_continuations == ["G", "K"]
    assert all(center in deficient for center in forced_continuations)

    first_apex_marginal = set(available["O"][0]) - cap_sets["surplus"]
    assert first_apex_marginal == {"C", "D", "E", "J"}
    q_shell = set(available["D"][0])
    assert q_shell == {"A", "E", "F", "I"}
    eligible_target_centers = sorted(
        q_shell & (cap_sets["surplus"] - boundary)
    )
    assert eligible_target_centers == ["F", "I"]
    distinct_marginal = sorted(first_apex_marginal - {"E"})
    prescribed_pair_equalities = {
        center: {
            marginal: (
                multiquadratic_key(
                    model.G.squared_distance(points[center], points["E"])
                )
                == multiquadratic_key(
                    model.G.squared_distance(points[center], points[marginal])
                )
            )
            for marginal in distinct_marginal
        }
        for center in eligible_target_centers
    }
    assert not any(
        equality
        for center_equalities in prescribed_pair_equalities.values()
        for equality in center_equalities.values()
    )

    # All exact classes of cardinality at least four are legitimate equality
    # rows.  The five-point O class is kept whole, since all five equalities are
    # known in the pinned geometry.
    baseline_supports = [
        (center, support)
        for center, supports in sorted(k4_rows.items())
        for support in supports
    ]
    labels = tuple(model.HULL_ORDER)
    scan = scan_relevant_single_rows(
        labels=labels,
        order=model.HULL_ORDER,
        baseline_supports=baseline_supports,
        caps=center_cap,
        scan_limit=scan_limit,
        include_common_system=include_common_system,
    )

    result = {
        "schema": "p97-atail-global-k4-extension-audit-35pt-v1",
        "status": "PASS",
        "trust_boundary": {
            "profiles": "EXACT_MULTIQUADRATIC_ARITHMETIC_NOT_LEAN_KERNEL",
            "bank_scan": "BOUNDED_FINITE_THEOREM_DISCOVERY_USING_NAMED_LEAN_CONSUMERS",
        },
        "pinned_model": {
            "source_sha256": EXPECTED_MODEL_SHA256,
            "coordinate_sha256": EXPECTED_COORDINATE_SHA256,
            "carrier_card": len(points),
        },
        "profile_inventory": {
            "centers_with_k4_count": len(points) - len(deficient),
            "centers_without_k4_count": len(deficient),
            "centers_without_k4": deficient,
            "all_deficient_centers_have_only_singleton_radius_classes": True,
            "available_k4_classes": available,
        },
        "first_full_parent_exclusion": {
            "field": "all-center HasNEquidistantProperty 4",
            "fixed_carrier_statement": (
                "K4 at any one of the 24 deficient centers contradicts its exact "
                "35-point radius profile"
            ),
            "route_relevant_forced_centers": forced_continuations,
            "reason": (
                "the second-apex row {C,G,K,O} contains exactly the two strict-"
                "opposite-cap points G,K; the live cap-count continuation theorem "
                "therefore requests global rows at both"
            ),
            "minimum_new_support_points_per_forced_center": 3,
            "minimum_union_of_new_support_points_for_G_and_K": 4,
            "minimum_union_reason": (
                "each existing profile is singleton, and two distinct centered "
                "circles can share at most two support points"
            ),
        },
        "fixed_coordinate_target_immutability": {
            "q": "E",
            "q_blocker": "D",
            "critical_q_shell": sorted(q_shell),
            "eligible_strict_surplus_centers": eligible_target_centers,
            "distinct_first_apex_marginal_candidates": distinct_marginal,
            "prescribed_pair_equalities": prescribed_pair_equalities,
            "target_can_be_created_by_adding_other_points": False,
            "reason": (
                "adding points does not change the six failed old-point distance "
                "equalities at F,I; adding a new point to D's q-radius would also "
                "destroy deletion-criticality of E at D"
            ),
            "consequence": (
                "a fixed-coordinate extension retaining this critical packet can "
                "only be excluded elsewhere; it cannot repair the one-row sink"
            ),
        },
        "one_row_existing_label_relaxation": scan,
        "epistemic_limits": [
            "no fixed-coordinate K4 extension was found or claimed",
            "bank-clean incidence rows are not Euclidean realizations",
            "the scan permits supports only from the existing 35 labels",
            "future added support points would themselves incur global-K4 obligations",
            "the 35-point model is not a CounterexampleData or K-A counterexample",
        ],
    }
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--scan-limit", type=int, default=DEFAULT_SCAN_LIMIT)
    parser.add_argument("--include-common-system", action="store_true")
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    assert args.scan_limit > 0
    result = analyze(
        scan_limit=args.scan_limit,
        include_common_system=args.include_common_system,
    )
    if args.write:
        CHECKPOINT.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    if args.check:
        stored = json.loads(CHECKPOINT.read_text())
        assert stored == result
        print(
            "PASS: exact 35-point profiles replayed; "
            f"{result['profile_inventory']['centers_without_k4_count']} deficient "
            "centers; bounded bank scan replayed"
        )
    elif not args.write:
        print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
