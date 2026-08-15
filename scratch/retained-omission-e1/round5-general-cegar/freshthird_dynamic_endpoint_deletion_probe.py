#!/usr/bin/env python3
"""Probe the dynamic endpoint-deletion producer for FreshThird.

The cardinality-free Lean consumer
``false_of_freshThird_canonicalDifferentCap_of_orderSelectedEndpointDeletionObstructions``
closes the exceptional canonical-source/different-fresh-cap packet if, at the
endpoint selected by the boundary order, both of these deletions block K4:

* delete the canonical C source; and
* delete the other Q endpoint.

The proved order producer has two possible identifications of
``qOutside/qBetween`` with ``Q.source1/Q.source2`` and four linear order arms.
Arms 1 and 3 select ``qBetween``; arms 2 and 4 select ``qOutside``.  Every run
is indexed by one of those eight source-level cases, and the selected endpoint
is derived rather than supplied independently.

Lean now proves the stronger cardinality-free ingress
``freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow``:
the obstruction pair is discharged by the checked Kalmanson consumer, so every
live canonical-different-cap instance supplies a surviving exact four-row.
Accordingly the production use of this probe is no longer to rediscover that
dichotomy.  It is to classify the returned row in the live equal-center,
common-radius, dual-different-cap branch.  SAT artifacts record both a
deterministic exact four-point support and its complete radius class so that a
later census can distinguish forced properties from arbitrary trimming.

The incidence model deliberately does not re-encode a cyclic permutation.
The order case is supplied by the source-proved Lean case split.  Schema 7
does, however, consume its source-proved equality-only Kalmanson consequence:
the arm-specific pair of radius equalities is forbidden.  Thus each query
remains a fail-closed relaxation of that source arm: SAT may be spurious, while
UNSAT in all eight arms would establish the bounded incidence consequence.

This script deliberately does *not* use ``no_named_ingress`` and does not turn
on the older cyclic-metric layer, whose targeted Kalmanson clause names fixed
literal slots rather than the dynamic Q selectors.  SAT/UNSAT here is bounded
external evidence only: it is neither Euclidean realizability nor a lift to
arbitrary carrier cardinality.

By default the script only prints its query contract.  Pass ``--run`` to start
Z3; this makes it safe to syntax-check and inspect while a production CEGAR
round is intentionally paused.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from dataclasses import dataclass
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import n17_freshthird_incidence_probe as base  # noqa: E402
import n19_freshthird_global_ingress_probe as ingress  # noqa: E402


OPP_INDEX1 = 1
DISTINCT_CAP_TAG = "distinctBlockersDifferentCaps"
VALID_SLOTS = {
    "firstNonHit": (1,),
    "secondNonHit": (0,),
    "equalCrossRowCenters": (0, 1),
}
SCHEMA_VERSION = 7
SURFACE_SCOPES = ("generic-single", "live-equal-common-dual")


@dataclass(frozen=True)
class SourceOrderCase:
    mapping: str
    arm: int
    selected_endpoint: str


def _selected_endpoint(mapping: str, arm: int) -> str:
    if mapping not in ("q1-outside", "q2-outside"):
        raise ValueError(f"unknown endpoint mapping: {mapping}")
    if arm not in (1, 2, 3, 4):
        raise ValueError(f"order arm must be 1..4, got {arm}")
    outside = "q1" if mapping == "q1-outside" else "q2"
    between = "q2" if outside == "q1" else "q1"
    return between if arm in (1, 3) else outside


def source_order_case(mapping: str, arm: int) -> SourceOrderCase:
    return SourceOrderCase(mapping, arm, _selected_endpoint(mapping, arm))


ORDER_CASES = tuple(
    source_order_case(mapping, arm)
    for mapping in ("q1-outside", "q2-outside")
    for arm in (1, 2, 3, 4)
)
ORDER_CASES_BY_ENDPOINT = {
    endpoint: tuple(
        f"{case.mapping}/arm-{case.arm}"
        for case in ORDER_CASES
        if case.selected_endpoint == endpoint
    )
    for endpoint in ("q1", "q2")
}


def solver_formula_class(case: SourceOrderCase, query: str) -> str:
    """Canonical key for source cases that build the same solver formula."""
    return f"{case.mapping}/arm-{case.arm}/{query}"


def configure(n: int) -> None:
    if n == 17:
        ingress.configure_n17()
    elif n == 19:
        ingress.configure_n19()
    else:
        raise ValueError("the audited bounded ingress currently supports n=17 or n=19")


def has_k4_after_deletion(
    probe: ingress.FreshThirdN19Global,
    center: int,
    deleted: int,
) -> z3.BoolRef:
    """Encode ``HasNEquidistantPointsAt 4 (A.erase deleted) center``.

    A positive-radius class excludes ``center``.  If four surviving points
    have one radius, one of them can serve as the finite anchor, so enumerating
    anchors is exact for the Boolean radius partition represented by ``E``.
    """
    surviving = [
        point for point in base.ALL if point not in (center, deleted)
    ]
    if len(surviving) < 4:
        return z3.BoolVal(False)
    return z3.Or(*(
        z3.PbGe(
            [(probe.E(center, anchor, point), 1) for point in surviving],
            4,
        )
        for anchor in surviving
    ))


def dynamic_has_k4_after_deletion(
    probe: ingress.FreshThirdN19Global,
    center_selector: dict[int, z3.BoolRef],
    deleted_selector: dict[int, z3.BoolRef],
) -> z3.BoolRef:
    """Select both named points dynamically, then test the exact finite K4."""
    return z3.Or(*(
        z3.And(
            center_selector[center],
            deleted_selector[deleted],
            has_k4_after_deletion(probe, center, deleted),
        )
        for center in base.ALL
        for deleted in base.ALL
    ))


def selected_endpoint_radius_class_cap_bound(
    probe: ingress.FreshThirdN19Global,
    center_selector: dict[int, z3.BoolRef],
) -> z3.BoolRef:
    """Encode the source-proved closed-cap bound for every selected radius.

    If the dynamically selected endpoint is ``center`` and lies in cap ``i``,
    then every positive-radius class centered there meets that closed cap in at
    most two points.  Enumerating ``anchor != center`` ranges over all positive
    radius classes represented by ``E``.  This full-class bound is stronger
    than, and therefore sound for, either endpoint-deletion survivor class.
    """
    return z3.And(*(
        z3.Implies(
            z3.And(center_selector[center], probe.cap[cap_index, center]),
            z3.PbLe(
                [
                    (
                        z3.And(
                            probe.E(center, anchor, point),
                            probe.cap[cap_index, point],
                        ),
                        1,
                    )
                    for point in base.ALL
                    if point != center
                ],
                2,
            ),
        )
        for center in base.ALL
        for anchor in base.ALL
        if anchor != center
        for cap_index in range(3)
    ))


def selected_point(
    selector: dict[int, z3.BoolRef],
) -> z3.ArithRef:
    """The carrier index selected by an exact-one Boolean selector."""
    return z3.Sum(*(z3.If(selector[point], point, 0) for point in base.ALL))


def value_selector(value: z3.ArithRef) -> dict[int, z3.BoolRef]:
    """Turn an in-range carrier-valued integer into a point selector."""
    return {point: value == point for point in base.ALL}


def dynamic_radius_equality(
    probe: ingress.FreshThirdN19Global,
    center_selector: dict[int, z3.BoolRef],
    left_selector: dict[int, z3.BoolRef],
    right_selector: dict[int, z3.BoolRef],
) -> z3.BoolRef:
    """Select all three roles dynamically and ask for one radius equality."""
    return z3.Or(*(
        z3.And(
            center_selector[center],
            left_selector[left],
            right_selector[right],
            probe.E(center, left, right),
        )
        for center in base.ALL
        for left in base.ALL
        for right in base.ALL
    ))


def freshthird_order_arm_kalmanson_cut(
    probe: ingress.FreshThirdN19Global,
    slot: int,
    order_case: SourceOrderCase,
) -> z3.BoolRef:
    """Equality-only consequence of the source-proved five-point order arm.

    This is the direct finite translation of
    ``CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms``.
    The boundary inequalities are carried by ``order_case`` at ingress, so the
    incidence quotient needs only the corresponding forbidden equality pair.
    """
    q_outside = probe.q1_is if order_case.mapping == "q1-outside" else probe.q2_is
    q_between = probe.q2_is if order_case.mapping == "q1-outside" else probe.q1_is
    fresh_center = value_selector(probe.q1_center)
    source_center = value_selector(probe.c_center[slot])
    canonical = {
        point: probe.c_source_is[slot, point] for point in base.ALL
    }

    role_distinctness = z3.Distinct(
        selected_point(q_outside),
        probe.q1_center,
        selected_point(q_between),
        probe.c_center[slot],
        selected_point(canonical),
    )
    if order_case.arm == 1:
        forbidden = z3.And(
            dynamic_radius_equality(probe, q_between, q_outside, canonical),
            dynamic_radius_equality(probe, source_center, q_outside, canonical),
        )
    elif order_case.arm == 2:
        forbidden = z3.And(
            dynamic_radius_equality(probe, q_outside, q_between, canonical),
            dynamic_radius_equality(probe, source_center, q_between, canonical),
        )
    elif order_case.arm == 3:
        forbidden = z3.And(
            dynamic_radius_equality(probe, source_center, canonical, q_outside),
            dynamic_radius_equality(probe, q_between, canonical, q_outside),
        )
    else:
        forbidden = z3.And(
            dynamic_radius_equality(probe, source_center, canonical, q_between),
            dynamic_radius_equality(probe, q_outside, canonical, q_between),
        )
    return z3.And(role_distinctness, z3.Not(forbidden))


def exceptional_packet(
    probe: ingress.FreshThirdN19Global,
    slot: int,
) -> z3.BoolRef:
    """The exact cap packet used by the cardinality-free Lean order producer."""
    return z3.And(
        probe.interaction[slot, DISTINCT_CAP_TAG],
        probe.c_cap[slot] == OPP_INDEX1,
        probe.q1_cap != OPP_INDEX1,
        *(
            z3.Implies(probe.q1_is[point], z3.Not(probe.cap[OPP_INDEX1, point]))
            for point in base.ALL
        ),
        *(
            z3.Implies(probe.q2_is[point], z3.Not(probe.cap[OPP_INDEX1, point]))
            for point in base.ALL
        ),
    )


def equal_center_exact_named_four_rows(
    probe: ingress.FreshThirdN19Global,
) -> z3.BoolRef:
    """Checked exact support of both C rows in the equal-center hit branch.

    This is the finite translation of
    ``freshThirdEqualCenterExactFourRow_of_hits``.  Naming it explicitly avoids
    making the solver recover the four-source support equality through the
    lower-level row-center and radius-equivalence clauses.
    """
    clauses = []
    for slot in (0, 1):
        for point in base.ALL:
            named = z3.Or(
                probe.c_source_is[0, point],
                probe.c_source_is[1, point],
                probe.q1_is[point],
                probe.q2_is[point],
            )
            clauses.append(probe.c_source_row[slot, point] == named)
    return z3.And(*clauses)


@dataclass(frozen=True)
class QueryTerms:
    canonical_survives: z3.BoolRef
    other_endpoint_survives: z3.BoolRef
    good_obstruction_pair: z3.BoolRef


def endpoint_query_terms(
    probe: ingress.FreshThirdN19Global,
    slot: int,
    selected_endpoint: str,
) -> QueryTerms:
    canonical = {
        point: probe.c_source_is[slot, point] for point in base.ALL
    }
    if selected_endpoint == "q1":
        selected, other = probe.q1_is, probe.q2_is
    elif selected_endpoint == "q2":
        selected, other = probe.q2_is, probe.q1_is
    else:
        raise ValueError(f"selected endpoint must be q1 or q2, got {selected_endpoint}")

    canonical_survives = dynamic_has_k4_after_deletion(
        probe, selected, canonical
    )
    other_survives = dynamic_has_k4_after_deletion(probe, selected, other)
    return QueryTerms(
        canonical_survives=canonical_survives,
        other_endpoint_survives=other_survives,
        good_obstruction_pair=z3.And(
            z3.Not(canonical_survives), z3.Not(other_survives)
        ),
    )


def add_source_branch(
    probe: ingress.FreshThirdN19Global,
    arm: str,
    radius_mode: str,
    slot: int,
    surface_scope: str,
) -> None:
    if slot not in VALID_SLOTS[arm]:
        raise ValueError(
            f"slot {slot} cannot carry the different-cap interaction in {arm}; "
            f"valid slots are {VALID_SLOTS[arm]}"
        )
    if surface_scope not in SURFACE_SCOPES:
        raise ValueError(f"unknown surface scope: {surface_scope}")
    if surface_scope == "live-equal-common-dual":
        if (arm, radius_mode, slot) != ("equalCrossRowCenters", "common", 0):
            raise ValueError(
                "the live dual scope requires --arm equalCrossRowCenters "
                "--radius-mode common --slot 0"
            )
    probe.add("selected_residual_arm", probe.residual[arm])
    if radius_mode == "aligned":
        probe.add("selected_radius_mode", probe.aligned_radii())
        probe.add(
            "aligned_C_source_first_apex_singletons",
            probe.aligned_canonical_source_first_apex_singletons(),
        )
        probe.add(
            "retained_first_apex_deletion_core",
            probe.retained_first_apex_deletion_core(),
        )
    elif radius_mode == "common":
        probe.add("selected_radius_mode", probe.common_new_radius())
    else:
        raise ValueError(f"unknown radius mode: {radius_mode}")
    probe.add("exceptional_canonical_different_cap_packet", exceptional_packet(probe, slot))
    if surface_scope == "live-equal-common-dual":
        other_slot = 1 - slot
        probe.add(
            "second_exceptional_canonical_different_cap_packet",
            exceptional_packet(probe, other_slot),
        )
        probe.add(
            "dual_equal_source_centers",
            probe.c_center[slot] == probe.c_center[other_slot],
        )
        probe.add(
            "equal_center_exact_named_four_rows",
            equal_center_exact_named_four_rows(probe),
        )


def query_formula(terms: QueryTerms, query: str) -> z3.BoolRef:
    if query == "good":
        return terms.good_obstruction_pair
    if query == "negated-good":
        return z3.Not(terms.good_obstruction_pair)
    if query == "canonical-survives":
        return terms.canonical_survives
    if query == "other-survives":
        return terms.other_endpoint_survives
    raise ValueError(f"unknown query: {query}")


def selected_value(model: z3.ModelRef, selector: dict[int, z3.BoolRef]) -> int:
    return next(
        point for point in base.ALL
        if z3.is_true(model.eval(selector[point], model_completion=True))
    )


def selected_four_row_witness(
    probe: ingress.FreshThirdN19Global,
    model: z3.ModelRef,
    center: int,
    deleted: int,
    roles: dict[str, int],
) -> dict[str, object] | None:
    """Extract the exact four-row promised by the Lean complement theorem."""
    surviving = [
        point for point in base.ALL if point not in (center, deleted)
    ]
    for anchor in surviving:
        radius_class = [
            point for point in surviving
            if z3.is_true(
                model.eval(probe.E(center, anchor, point), model_completion=True)
            )
        ]
        if len(radius_class) >= 4:
            support = radius_class[:4]
            assert len(support) == 4
            assert center not in support
            assert deleted not in support
            return {
                "radius_anchor": base.NAMES[anchor],
                "selected_four_support": [base.NAMES[point] for point in support],
                "full_radius_class": [base.NAMES[point] for point in radius_class],
                "full_radius_class_card": len(radius_class),
                "support_card": 4,
                "deleted_point": base.NAMES[deleted],
                "deleted_avoided": True,
                "support_role_membership": {
                    role: point in support for role, point in roles.items()
                },
                "full_class_role_membership": {
                    role: point in radius_class for role, point in roles.items()
                },
                "support_cap_membership_counts": [
                    sum(
                        z3.is_true(
                            model.eval(
                                probe.cap[cap_index, point],
                                model_completion=True,
                            )
                        )
                        for point in support
                    )
                    for cap_index in range(3)
                ],
                "full_class_cap_membership_counts": [
                    sum(
                        z3.is_true(
                            model.eval(
                                probe.cap[cap_index, point],
                                model_completion=True,
                            )
                        )
                        for point in radius_class
                    )
                    for cap_index in range(3)
                ],
            }
    return None


def build_query(
    args: argparse.Namespace,
) -> tuple[ingress.FreshThirdN19Global, QueryTerms, SourceOrderCase]:
    if args.slot not in VALID_SLOTS[args.arm]:
        raise ValueError(
            f"slot {args.slot} cannot carry the different-cap interaction in "
            f"{args.arm}; valid slots are {VALID_SLOTS[args.arm]}"
        )
    configure(args.n)
    probe = ingress.FreshThirdN19Global(
        args.timeout_ms, cyclic_metric=False
    )
    order_case = source_order_case(args.endpoint_mapping, args.order_arm)
    add_source_branch(
        probe, args.arm, args.radius_mode, args.slot, args.surface_scope
    )
    selected = probe.q1_is if order_case.selected_endpoint == "q1" else probe.q2_is
    probe.add(
        "selected_endpoint_radius_class_cap_bound",
        selected_endpoint_radius_class_cap_bound(probe, selected),
    )
    probe.add(
        "freshthird_order_arm_kalmanson_cut",
        freshthird_order_arm_kalmanson_cut(probe, args.slot, order_case),
    )
    terms = endpoint_query_terms(probe, args.slot, order_case.selected_endpoint)
    probe.add("dynamic_endpoint_deletion_query", query_formula(terms, args.query))
    return probe, terms, order_case


def build_only(args: argparse.Namespace) -> dict[str, object]:
    probe, _, order_case = build_query(args)
    return {
        "schema_version": SCHEMA_VERSION,
        "status": "BUILT_NOT_SOLVED",
        "n": args.n,
        "arm": args.arm,
        "radius_mode": args.radius_mode,
        "canonical_slot": args.slot,
        "surface_scope": args.surface_scope,
        "source_order_case": {
            "endpoint_mapping": order_case.mapping,
            "order_arm": order_case.arm,
            "lean_disjunct": order_case.arm,
            "selected_endpoint": order_case.selected_endpoint,
        },
        "solver_formula_class": solver_formula_class(order_case, args.query),
        "query": args.query,
        "assertion_count": len(probe.solver.assertions()),
        "constraint_counts": probe.counts,
        "solver_check_called": False,
        "contract": contract(),
    }


def run(args: argparse.Namespace) -> dict[str, object]:
    probe, terms, order_case = build_query(args)

    started = time.monotonic()
    status = probe.solver.check()
    result: dict[str, object] = {
        "schema_version": SCHEMA_VERSION,
        "n": args.n,
        "cap_profile": list(base.PROFILE),
        "arm": args.arm,
        "radius_mode": args.radius_mode,
        "canonical_slot": args.slot,
        "surface_scope": args.surface_scope,
        "source_order_case": {
            "endpoint_mapping": order_case.mapping,
            "order_arm": order_case.arm,
            "lean_disjunct": order_case.arm,
            "selected_endpoint": order_case.selected_endpoint,
        },
        "solver_formula_class": solver_formula_class(order_case, args.query),
        "query": args.query,
        "status": ingress.status_name(status),
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "timeout_ms": args.timeout_ms,
        "constraint_counts": probe.counts,
        "trust_boundary": (
            "bounded external Z3 incidence/radius-partition evidence for one "
            "source-proved order arm and its equality-only Kalmanson cut; no "
            "cyclic permutation, Euclidean realizability, arbitrary-cardinality "
            "lift, or Lean closure"
        ),
    }
    if status == z3.sat:
        model = probe.solver.model()
        canonical = selected_value(
            model,
            {point: probe.c_source_is[args.slot, point] for point in base.ALL},
        )
        q1 = selected_value(model, probe.q1_is)
        q2 = selected_value(model, probe.q2_is)
        selected = q1 if order_case.selected_endpoint == "q1" else q2
        other = q2 if order_case.selected_endpoint == "q1" else q1
        c_sources = {
            f"c_source_{slot + 1}": selected_value(
                model,
                {
                    point: probe.c_source_is[slot, point]
                    for point in base.ALL
                },
            )
            for slot in (0, 1)
        }
        roles = {
            "canonical_source": canonical,
            "selected_endpoint": selected,
            "other_endpoint": other,
            "source_center": model.eval(
                probe.c_center[args.slot], model_completion=True
            ).as_long(),
            "fresh_center": model.eval(
                probe.q1_center, model_completion=True
            ).as_long(),
            **c_sources,
        }
        canonical_survives = z3.is_true(
            model.eval(terms.canonical_survives, model_completion=True)
        )
        other_survives = z3.is_true(
            model.eval(terms.other_endpoint_survives, model_completion=True)
        )
        canonical_row = (
            selected_four_row_witness(
                probe, model, selected, canonical, roles
            )
            if canonical_survives else None
        )
        other_row = (
            selected_four_row_witness(
                probe, model, selected, other, roles
            )
            if other_survives else None
        )
        assert not canonical_survives or canonical_row is not None
        assert not other_survives or other_row is not None
        if args.query == "negated-good":
            assert canonical_survives or other_survives
        result["binding"] = {
            "canonical_source": base.NAMES[canonical],
            "q1": base.NAMES[q1],
            "q2": base.NAMES[q2],
            "selected_endpoint_point": base.NAMES[selected],
            "other_endpoint_point": base.NAMES[other],
            "role_points": {
                role: base.NAMES[point] for role, point in roles.items()
            },
            "canonical_deletion_survives": canonical_survives,
            "other_endpoint_deletion_survives": other_survives,
            "canonical_deletion_surviving_row": canonical_row,
            "other_deletion_surviving_row": other_row,
        }
    elif status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def contract() -> dict[str, object]:
    return {
        "schema_version": SCHEMA_VERSION,
        "surface_scopes": list(SURFACE_SCOPES),
        "valid_slots": {key: list(value) for key, value in VALID_SLOTS.items()},
        "order_cases_by_selected_endpoint": {
            key: list(value) for key, value in ORDER_CASES_BY_ENDPOINT.items()
        },
        "production_case_matrix": [
            {
                "endpoint_mapping": case.mapping,
                "order_arm": case.arm,
                "lean_disjunct": case.arm,
                "selected_endpoint": case.selected_endpoint,
            }
            for case in ORDER_CASES
        ],
        "production_solver_formula_classes": sorted({
            solver_formula_class(case, query)
            for case in ORDER_CASES
            for query in ("canonical-survives", "other-survives")
        }),
        "order_contract": (
            "the source-proved Lean order arm is an external case index; the "
            "probe derives its selected endpoint and consumes exactly the "
            "arm-specific equality exclusion proved by "
            "false_of_freshThird_four_order_arms"
        ),
        "producer_query": (
            "Lean already forces the row-valued complement. Production runs "
            "use canonical-survives and other-survives under the live dual "
            "scope to classify exact supports and full radius classes; "
            "negated-good remains only the union control"
        ),
        "lean_ingress": [
            "deletion_survives_iff_exists_selectedFourClass_avoiding",
            "freshThird_orderSelectedEndpointDeletionObstructions_or_survivingRow",
            "freshThird_canonicalDifferentCap_orderSelectedEndpointDeletionOutcome",
            "freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow",
            "freshThird_canonicalDifferentCap_fivePointKalmansonOrder",
            "CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms",
            "selectedClass_inter_capByIndex_card_le_two",
            "freshThirdEqualCenterExactFourRow_of_hits",
            "firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned",
            "freshThird_acyclic_canonical_consumerPacket",
        ],
        "source_constraints": [
            "selected_endpoint_radius_class_cap_bound",
            "freshthird_order_arm_kalmanson_cut",
        ],
        "sat_followups": ["canonical-survives", "other-survives"],
        "run_required": True,
    }


def self_check() -> dict[str, object]:
    current_contract = contract()
    assert current_contract["schema_version"] == 7
    assert (
        "firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned"
        in current_contract["lean_ingress"]
    )
    assert (
        "freshThirdEqualCenterExactFourRow_of_hits"
        in current_contract["lean_ingress"]
    )
    assert (
        "freshThird_acyclic_canonical_consumerPacket"
        in current_contract["lean_ingress"]
    )
    assert (
        "freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow"
        in current_contract["lean_ingress"]
    )
    assert (
        "selectedClass_inter_capByIndex_card_le_two"
        in current_contract["lean_ingress"]
    )
    assert (
        "selected_endpoint_radius_class_cap_bound"
        in current_contract["source_constraints"]
    )
    assert (
        "freshthird_order_arm_kalmanson_cut"
        in current_contract["source_constraints"]
    )
    assert len(ORDER_CASES) == 8
    assert len(set(ORDER_CASES)) == 8
    assert set(ORDER_CASES_BY_ENDPOINT) == {"q1", "q2"}
    assert all(len(cases) == 4 for cases in ORDER_CASES_BY_ENDPOINT.values())
    assert len(current_contract["production_solver_formula_classes"]) == 16
    assert _selected_endpoint("q1-outside", 1) == "q2"
    assert _selected_endpoint("q1-outside", 2) == "q1"
    assert _selected_endpoint("q2-outside", 3) == "q1"
    assert _selected_endpoint("q2-outside", 4) == "q2"
    return {"status": "PASS", **current_contract}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, choices=(17, 19), default=17)
    parser.add_argument(
        "--arm", choices=base.FreshThirdN17.RESIDUALS,
        default="firstNonHit",
    )
    parser.add_argument("--radius-mode", choices=("aligned", "common"), default="aligned")
    parser.add_argument("--slot", type=int, choices=(0, 1), default=1)
    parser.add_argument(
        "--surface-scope", choices=SURFACE_SCOPES,
        default="generic-single",
    )
    parser.add_argument(
        "--endpoint-mapping",
        choices=("q1-outside", "q2-outside"),
        default="q1-outside",
    )
    parser.add_argument("--order-arm", type=int, choices=(1, 2, 3, 4), default=1)
    parser.add_argument(
        "--query",
        choices=("good", "negated-good", "canonical-survives", "other-survives"),
        default="negated-good",
    )
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--build-only", action="store_true")
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    if args.self_check:
        result = self_check()
    elif args.build_only:
        result = build_only(args)
    elif args.run:
        result = run(args)
    else:
        result = contract()

    payload = json.dumps(result, indent=2, sort_keys=True)
    if args.out is not None:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(payload + "\n")
        print(json.dumps({
            "out": str(args.out),
            "status": result.get("status", "DESCRIBE"),
            "query": result.get("query"),
        }, sort_keys=True))
    else:
        print(payload)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
