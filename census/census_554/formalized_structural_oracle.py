"""Proof-traceable structural refinements for the Census-554 CEGAR loop.

The SAT cover encodes selected four-member rows and compatible convex boundary
orders.  This module recognizes the already-formalized metric obstruction
families on a decoded cube, emits deterministic row/flip equality-closure
paths, and keeps the hypotheses that live outside bare row equality explicit.

In particular, exact-off-circle is catalogued but deliberately ineligible:
the cover cube does not say that a selected four-member row is an exact metric
circle.  The two cyclic families are order-sensitive and therefore must not be
turned into unconditional pattern clauses by a caller.
"""

from __future__ import annotations

from collections import deque
from dataclasses import asdict, dataclass
import hashlib
import json
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

from census.census_554 import combinatorics, separation_encoding
from census.global_confinement import metric_realizability_probe as metric


SCHEMA = "census554_formalized_structural_oracle.v1"
ORDERING_POLICY = "eligible-family-precedence-then-profile-orbit-v1"
REPO_ROOT = Path(__file__).resolve().parents[2]
BUILD_TARGET = "Erdos9796Proof.P97.Census554.GeneralCarrierBridge"
BUILD_COMMAND = f"lake-build {BUILD_TARGET}"
AXIOM_AUDIT_THEOREM = (
    "Problem97.Census554.GeneralCarrierBridge.false_of_metricCoreAlternative"
)
AXIOM_AUDIT_COMMAND = (
    "proof-blueprint axioms " + AXIOM_AUDIT_THEOREM + " --memory-mb 16384"
)
EXPECTED_AXIOMS = ("propext", "Classical.choice", "Quot.sound")
VALIDATED_UTC = "2026-07-13T04:03:40Z"
PROOF_BLUEPRINT_BUILD_FINGERPRINT = "bd78491c38fd"
AGGREGATE_OLEAN = (
    "lean/.lake/build/lib/lean/Erdos9796Proof/P97/Census554/"
    "GeneralCarrierBridge.olean"
)
BUILD_ARTIFACT_SHA256 = {
    AGGREGATE_OLEAN:
        "b4a37e979bc93b843d5f3c5d8822c6563e924b0252b73910f085ed2b610958fb",
}

# The focused aggregate build and live kernel axiom query passed on 2026-07-13
# against the exact theorem-source hashes below.
BUILD_STATUS = "passed"

THEOREM_SOURCE_SHA256 = {
    "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean":
        "d69d734942d6dfcfd7341a5d84c254f388e7be7be4fccf26926caf47100c4d82",
    "lean/Erdos9796Proof/P97/Census554/FivePointCollision.lean":
        "4324a776d90ee729e5666ac31c65b6f20dbee2d248fc89a34534f087a595e36c",
    "lean/Erdos9796Proof/P97/Census554/ThreeTriadCollision.lean":
        "df0f862273992da09c988cd8b7c19646b8e7b97ae8e04b496f44e2efa93f10c0",
    "lean/Erdos9796Proof/P97/Census554/SurplusSourceCollision.lean":
        "b27066440f9f83889b22614d995b03173496537f4172107934fcc935f7623053",
    "lean/Erdos9796Proof/P97/Census554/SixRowAnchorCollision.lean":
        "2214db347504aafbaf408ba994f00cac10f3794e5bb2c5e21869594748a08250",
    "lean/Erdos9796Proof/P97/Census554/SixPointTwoPairCollision.lean":
        "4b1b0165e487885edfb31a0b6a08e848b129116ea0b8a8cd26181b05212467f1",
    "lean/Erdos9796Proof/P97/Census554/SevenPointOrbitCollision.lean":
        "db880406ab8ebd62a71f9df27784145af7c08569603357cb43b0efcfcdb3e8b8",
    "lean/Erdos9796Proof/P97/Census554/SevenPointCircleNetworkCollision.lean":
        "3bcff770c0e720673f41b628f679514e3aa8a95d7d078cacad6afbfe4ad6f13e",
    "lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean":
        "c48c09543f96ca1fbef4c4e1bcb1869151aa726b43e9cacd71f462606ba9580c",
    "lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean":
        "eb31b3cf6b7294aff42f4a56cb16ae70b765e5bff2a883ef2ac37e41aec91047",
    "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean":
        "279fec0f8cd84bf2808c7f0bd40dcf0e857107190c6cf9461ab73bf52bc98443",
}


class StructuralOracleError(ValueError):
    """The oracle input, proof trace, or theorem contract is invalid."""


@dataclass(frozen=True, slots=True)
class Family:
    stage: str
    theorem_id: str
    theorem_source: str
    semantic_scope: str
    order_sensitive: bool = False
    eligible: bool = True
    ineligible_reason: str | None = None

    @property
    def family_id(self) -> str:
        return self.stage + ".v1"


FAMILIES = (
    Family(
        "equality-duplicate-center",
        "Problem97.Census554.EqualityCore.not_realizes_of_duplicateCenterCore",
        "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-exact-off-circle",
        "Problem97.Census554.EqualityCore.false_of_exactAt_of_exactOffCircleCore",
        "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
        "requires ExactAt for the selected row",
        eligible=False,
        ineligible_reason=(
            "raw Census-554 cover cubes encode selected equal-distance subsets, "
            "not exact metric circles"
        ),
    ),
    Family(
        "equality-equal-k4",
        "Problem97.Census554.EqualityCore.not_realizes_of_equalK4Core",
        "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-equilateral-bisector-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/FivePointCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-three-triad-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_threeTriadCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/ThreeTriadCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-surplus-source-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_surplusSourceCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/SurplusSourceCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-six-row-anchor-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_sixRowAnchorCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/SixRowAnchorCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-six-point-two-pair-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_sixPointTwoPairCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/SixPointTwoPairCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-seven-point-orbit-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_sevenPointOrbitCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/SevenPointOrbitCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-seven-point-circle-network-collision",
        "Problem97.Census554.EqualityCore.not_realizes_of_sevenPointCircleNetworkCollisionCore",
        "lean/Erdos9796Proof/P97/Census554/SevenPointCircleNetworkCollision.lean",
        "no injective planar realization",
    ),
    Family(
        "equality-perpendicular-bisector-convex",
        "Problem97.Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore",
        "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
        "requires every realized label to lie in one convex-independent carrier",
    ),
    Family(
        "equality-convex-five-point",
        "Problem97.Census554.ConvexFivePointCore.false_of_core_of_neg",
        "lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean",
        "requires the recorded compatible convex cyclic order",
        order_sensitive=True,
    ),
    Family(
        "equality-convex-rhombus-equilateral",
        "Problem97.Census554.ConvexRhombusCore.false_of_core_of_neg",
        "lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean",
        "requires the recorded compatible convex cyclic order",
        order_sensitive=True,
    ),
)

FAMILY_BY_STAGE = {family.stage: family for family in FAMILIES}
REVERSE_ORDER_VARIANTS = {
    "equality-convex-five-point-reverse": (
        FAMILY_BY_STAGE["equality-convex-five-point"],
        "Problem97.Census554.ConvexFivePointCore.false_of_core",
    ),
    "equality-convex-rhombus-equilateral-reverse": (
        FAMILY_BY_STAGE["equality-convex-rhombus-equilateral"],
        "Problem97.Census554.ConvexRhombusCore.false_of_core",
    ),
}
for _stage, (_family, _theorem) in REVERSE_ORDER_VARIANTS.items():
    FAMILY_BY_STAGE[_stage] = _family
ELIGIBLE_FAMILIES = tuple(family for family in FAMILIES if family.eligible)
UNORDERED_FAMILIES = tuple(
    family for family in ELIGIBLE_FAMILIES if not family.order_sensitive
)
ORDERED_FAMILIES = tuple(
    family for family in ELIGIBLE_FAMILIES if family.order_sensitive
)
ORDERED_STAGE_VARIANTS = (
    "equality-convex-five-point",
    "equality-convex-rhombus-equilateral",
    "equality-convex-five-point-reverse",
    "equality-convex-rhombus-equilateral-reverse",
)


@dataclass(frozen=True, slots=True)
class StructuralScan:
    """A sufficient priority scan, not an enumeration of every matching core.

    An unordered detection excludes the cube independently of boundary order,
    so the ordered scan is unnecessary in that case.  Otherwise each valid
    order retains the first matching theorem in ``ORDERED_STAGE_VARIANTS``;
    one theorem is sufficient to exclude that order.  ``exhaustive`` means
    that every still-relevant order was decided by this priority scan.
    """

    pattern: dict[int, frozenset[int]]
    unordered_detection: dict[str, Any] | None
    valid_orders: tuple[separation_encoding.BoundaryOrder, ...]
    ordered_detections: tuple[dict[str, Any], ...]
    exhaustive: bool = True


def _sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, indent=2, allow_nan=False
    ).encode("utf-8") + b"\n"


def _json_pattern(pattern: Mapping[int, Iterable[int]]) -> dict[str, list[int]]:
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def normalize_pattern(
    pattern: Mapping[int | str, Iterable[int]], *, require_full_cube: bool = False,
) -> dict[int, frozenset[int]]:
    if not isinstance(pattern, Mapping):
        raise StructuralOracleError("pattern is not a mapping")
    normalized: dict[int, frozenset[int]] = {}
    for raw_center, raw_members in pattern.items():
        if isinstance(raw_center, bool):
            raise StructuralOracleError("pattern center is Boolean")
        try:
            center = int(raw_center)
        except (TypeError, ValueError) as exc:
            raise StructuralOracleError("pattern center is not integer-valued") from exc
        if not 0 <= center < combinatorics.N:
            raise StructuralOracleError("pattern center is out of range")
        members = tuple(raw_members)
        if any(not isinstance(member, int) or isinstance(member, bool)
               for member in members):
            raise StructuralOracleError("pattern member is not an integer")
        frozen = frozenset(members)
        if len(frozen) != len(members):
            raise StructuralOracleError("pattern row repeats a member")
        if center in frozen:
            raise StructuralOracleError("pattern row contains its center")
        if any(not 0 <= member < combinatorics.N for member in frozen):
            raise StructuralOracleError("pattern member is out of range")
        if len(frozen) < 2:
            raise StructuralOracleError("structural rows need at least two members")
        if require_full_cube and len(frozen) != 4:
            raise StructuralOracleError("full cube row does not have four members")
        normalized[center] = frozen
    if require_full_cube and set(normalized) != set(range(combinatorics.N)):
        raise StructuralOracleError("full cube must contain all eleven centers")
    if not normalized:
        raise StructuralOracleError("pattern is empty")
    return normalized


def pattern_rows(pattern: Mapping[int | str, Iterable[int]]) -> tuple[metric.MetricRow, ...]:
    normalized = normalize_pattern(pattern)
    return tuple(
        metric.MetricRow(center, tuple(sorted(members)), False)
        for center, members in sorted(normalized.items())
    )


def _order_record(order: separation_encoding.BoundaryOrder) -> dict[str, Any]:
    return {
        "orientation": order.orientation,
        "python_internal_index": order.internal_index,
        "labels": list(order.labels),
        "row_scope": separation_encoding.DIRECT_ROW_SCOPE,
    }


def order_from_record(value: Mapping[str, Any]) -> separation_encoding.BoundaryOrder:
    if not isinstance(value, Mapping) or set(value) != {
        "orientation", "python_internal_index", "labels", "row_scope",
    }:
        raise StructuralOracleError("order record has an unexpected schema")
    if value["row_scope"] != separation_encoding.DIRECT_ROW_SCOPE:
        raise StructuralOracleError("order record has the wrong row scope")
    matches = [
        order for order in separation_encoding.all_orders()
        if _order_record(order) == value
    ]
    if len(matches) != 1:
        raise StructuralOracleError("order record does not identify one boundary order")
    return matches[0]


def map_order(
    order: separation_encoding.BoundaryOrder,
    mapping: Mapping[int, int] | tuple[int, ...],
) -> separation_encoding.BoundaryOrder:
    labels = tuple(mapping[label] for label in order.labels)
    matches = [candidate for candidate in separation_encoding.all_orders()
               if candidate.labels == labels]
    if len(matches) != 1:
        raise StructuralOracleError("profile map does not preserve the order surface")
    return matches[0]


def _finder(stage: str, closure: metric._EdgeClosure, n: int, order):
    index = metric._closure_circle_index(closure, n)
    finders = {
        "equality-duplicate-center":
            metric._duplicate_center_core_from_closure,
        "equality-equal-k4": metric._equal_k4_core_from_closure,
        "equality-equilateral-bisector-collision":
            metric._equilateral_bisector_collision_core_from_closure,
        "equality-three-triad-collision":
            metric._three_triad_collision_core_from_closure,
        "equality-surplus-source-collision":
            metric._surplus_source_collision_core_from_closure,
        "equality-six-row-anchor-collision":
            metric._six_row_anchor_collision_core_from_closure,
        "equality-six-point-two-pair-collision":
            metric._six_point_two_pair_collision_core_from_closure,
        "equality-seven-point-orbit-collision":
            metric._seven_point_orbit_collision_core_from_closure,
        "equality-seven-point-circle-network-collision":
            metric._seven_point_circle_network_collision_core_from_closure,
        "equality-perpendicular-bisector-convex":
            metric._perpendicular_bisector_core_from_closure,
    }
    if stage in finders:
        return finders[stage](closure, n, index=index)
    if order is None:
        raise StructuralOracleError(f"ordered stage {stage} has no order")
    if stage == "equality-convex-five-point":
        return metric._five_point_bisector_circle_core_from_closure(
            closure, n, order.labels, index=index
        )
    if stage == "equality-convex-rhombus-equilateral":
        return metric._convex_rhombus_equilateral_core_from_closure(
            closure, n, order.labels, index=index
        )
    reverse_labels = tuple(reversed(order.labels))
    if stage == "equality-convex-five-point-reverse":
        return metric._five_point_bisector_circle_core_from_closure(
            closure, n, reverse_labels, index=index
        )
    if stage == "equality-convex-rhombus-equilateral-reverse":
        return metric._convex_rhombus_equilateral_core_from_closure(
            closure, n, reverse_labels, index=index
        )
    raise StructuralOracleError(f"stage is not eligible for raw cube scanning: {stage}")


def detect_stage(
    pattern: Mapping[int | str, Iterable[int]], stage: str,
    order: separation_encoding.BoundaryOrder | None = None,
) -> dict[str, Any] | None:
    family = FAMILY_BY_STAGE.get(stage)
    if family is None or not family.eligible:
        raise StructuralOracleError(f"stage is not eligible: {stage}")
    order_sensitive = family.order_sensitive or stage in REVERSE_ORDER_VARIANTS
    if order_sensitive != (order is not None):
        raise StructuralOracleError("stage/order sensitivity mismatch")
    rows = pattern_rows(pattern)
    closure = metric._row_equality_closure(combinatorics.N, rows)
    return _finder(stage, closure, combinatorics.N, order)


def _obligations(stage: str, core: Mapping[str, Any]):
    edge = lambda a, b: (int(a), int(b))
    if stage == "equality-duplicate-center":
        p, q, r = core["triple"]
        a, b = core["centers"]
        return (
            ("ap_aq", edge(a, p), edge(a, q)),
            ("ap_ar", edge(a, p), edge(a, r)),
            ("bp_bq", edge(b, p), edge(b, q)),
            ("bp_br", edge(b, p), edge(b, r)),
        )
    if stage == "equality-equal-k4":
        p, t1, t2, t3 = core["points"]
        base = edge(p, t1)
        return (
            ("hp1p2", base, edge(p, t2)),
            ("hp1p3", base, edge(p, t3)),
            ("hp112", base, edge(t1, t2)),
            ("hp113", base, edge(t1, t3)),
            ("hp123", base, edge(t2, t3)),
        )
    if stage == "equality-equilateral-bisector-collision":
        p, a, b, c, x = (core[key] for key in ("p", "a", "b", "c", "x"))
        base = edge(p, a)
        return (
            ("pa_pb", base, edge(p, b)), ("pa_pc", base, edge(p, c)),
            ("pa_ab", base, edge(a, b)), ("pa_ax", base, edge(a, x)),
            ("pa_bx", base, edge(b, x)),
            ("cx_ca", edge(c, x), edge(c, a)),
        )
    if stage == "equality-three-triad-collision":
        a, b, c, d, e = (core[key] for key in ("a", "b", "c", "d", "e"))
        return (
            ("BC_BD", edge(b, c), edge(b, d)),
            ("BD_DA", edge(b, d), edge(d, a)),
            ("CA_CD", edge(c, a), edge(c, d)),
            ("CD_CE", edge(c, d), edge(c, e)),
            ("EA_EB", edge(e, a), edge(e, b)),
            ("EB_ED", edge(e, b), edge(e, d)),
        )
    if stage == "equality-surplus-source-collision":
        o, a, b, c, u, v, w = (
            core[key] for key in ("o", "a", "b", "c", "u", "v", "w")
        )
        return (
            ("OA_OB", edge(o, a), edge(o, b)),
            ("OB_OC", edge(o, b), edge(o, c)),
            ("CA_CO", edge(c, a), edge(c, o)),
            ("UA_UB", edge(u, a), edge(u, b)),
            ("BU_BA", edge(b, u), edge(b, a)),
            ("BC_BA", edge(b, c), edge(b, a)),
            ("CV_CO", edge(c, v), edge(c, o)),
            ("VB_VO", edge(v, b), edge(v, o)),
            ("WU_WO", edge(w, u), edge(w, o)),
            ("WC_WO", edge(w, c), edge(w, o)),
            ("WV_WO", edge(w, v), edge(w, o)),
        )
    if stage == "equality-six-row-anchor-collision":
        o, a, b, c, u, v = (
            core[key] for key in ("o", "a", "b", "c", "u", "v")
        )
        return (
            ("OB_OC", edge(o, b), edge(o, c)),
            ("AB_AO", edge(a, b), edge(a, o)),
            ("AU_AO", edge(a, u), edge(a, o)),
            ("BC_BA", edge(b, c), edge(b, a)),
            ("UV_UO", edge(u, v), edge(u, o)),
            ("CU_CA", edge(c, u), edge(c, a)),
            ("CV_CA", edge(c, v), edge(c, a)),
            ("VB_VA", edge(v, b), edge(v, a)),
            ("VC_VA", edge(v, c), edge(v, a)),
        )
    if stage == "equality-six-point-two-pair-collision":
        a, b, c, d, e, f = (
            core[key] for key in ("a", "b", "c", "d", "e", "f")
        )
        return (
            ("AB_AC", edge(a, b), edge(a, c)),
            ("AB_AE", edge(a, b), edge(a, e)),
            ("FA_FC", edge(f, a), edge(f, c)),
            ("FA_FD", edge(f, a), edge(f, d)),
            ("FA_FE", edge(f, a), edge(f, e)),
            ("BD_BF", edge(b, d), edge(b, f)),
            ("CB_CD", edge(c, b), edge(c, d)),
            ("EB_EC", edge(e, b), edge(e, c)),
            ("EB_ED", edge(e, b), edge(e, d)),
        )
    if stage == "equality-seven-point-orbit-collision":
        o, a, b, c, u, v, w = (
            core[key] for key in ("o", "a", "b", "c", "u", "v", "w")
        )
        return (
            ("OA_OB", edge(o, a), edge(o, b)),
            ("OA_OC", edge(o, a), edge(o, c)),
            ("AO_AB", edge(a, o), edge(a, b)),
            ("AO_AV", edge(a, o), edge(a, v)),
            ("AO_AW", edge(a, o), edge(a, w)),
            ("BC_BU", edge(b, c), edge(b, u)),
            ("BC_BV", edge(b, c), edge(b, v)),
            ("CA_CV", edge(c, a), edge(c, v)),
            ("UC_UW", edge(u, c), edge(u, w)),
            ("VA_VU", edge(v, a), edge(v, u)),
            ("VA_VW", edge(v, a), edge(v, w)),
            ("WO_WB", edge(w, o), edge(w, b)),
            ("WO_WU", edge(w, o), edge(w, u)),
        )
    if stage == "equality-seven-point-circle-network-collision":
        o, a, b, c, u, v, w = (
            core[key] for key in ("o", "a", "b", "c", "u", "v", "w")
        )
        return (
            ("OA_OB", edge(o, a), edge(o, b)),
            ("OA_OU", edge(o, a), edge(o, u)),
            ("AO_AV", edge(a, o), edge(a, v)),
            ("BO_BC", edge(b, o), edge(b, c)),
            ("BO_BW", edge(b, o), edge(b, w)),
            ("CA_CU", edge(c, a), edge(c, u)),
            ("CA_CW", edge(c, a), edge(c, w)),
            ("UB_UV", edge(u, b), edge(u, v)),
            ("UB_UW", edge(u, b), edge(u, w)),
            ("VB_VW", edge(v, b), edge(v, w)),
            ("WO_WU", edge(w, o), edge(w, u)),
        )
    if stage == "equality-perpendicular-bisector-convex":
        a, b = core["foci"]
        p, q, r = core["points"]
        return tuple(
            (name, edge(point, a), edge(point, b))
            for name, point in (("pa_pb", p), ("qa_qb", q), ("ra_rb", r))
        )
    if stage in ("equality-convex-five-point", "equality-convex-five-point-reverse"):
        a, x, b, c, y = (core[key] for key in ("a", "x", "b", "c", "y"))
        return (
            ("xa_xb", edge(x, a), edge(x, b)),
            ("ya_yb", edge(y, a), edge(y, b)),
            ("cb_cx", edge(c, b), edge(c, x)),
            ("cb_cy", edge(c, b), edge(c, y)),
        )
    if stage in (
        "equality-convex-rhombus-equilateral",
        "equality-convex-rhombus-equilateral-reverse",
    ):
        a, b, c, x, y, d = (
            core[key] for key in ("a", "b", "c", "x", "y", "d")
        )
        base = edge(a, b)
        return (
            ("ab_bc", base, edge(b, c)), ("ab_cd", base, edge(c, d)),
            ("ab_da", base, edge(d, a)), ("ab_by", base, edge(b, y)),
            ("ab_cy", base, edge(c, y)), ("ab_xd", base, edge(x, d)),
            ("ab_xa", base, edge(x, a)),
        )
    raise StructuralOracleError(f"no closure obligations registered for {stage}")


def _step_endpoints(step: Mapping[str, Any]):
    if set(step) == {"kind", "center", "first", "second"} and step.get("kind") == "row":
        return (
            (int(step["center"]), int(step["first"])),
            (int(step["center"]), int(step["second"])),
        )
    if set(step) == {"kind", "first", "second"} and step.get("kind") == "flip":
        return (
            (int(step["first"]), int(step["second"])),
            (int(step["second"]), int(step["first"])),
        )
    raise StructuralOracleError("closure step has an unexpected schema")


def _closure_graph(pattern: Mapping[int, frozenset[int]]):
    graph: dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]] = {
        (a, b): [] for a in range(combinatorics.N) for b in range(combinatorics.N)
    }
    for center, members in sorted(pattern.items()):
        ordered = sorted(members)
        for first in ordered:
            for second in ordered:
                if first == second:
                    continue
                step = {"kind": "row", "center": center,
                        "first": first, "second": second}
                graph[(center, first)].append(((center, second), step))
    for first in range(combinatorics.N):
        for second in range(combinatorics.N):
            if first == second:
                continue
            step = {"kind": "flip", "first": first, "second": second}
            graph[(first, second)].append(((second, first), step))
    for node in graph:
        graph[node].sort(key=lambda item: (
            item[0], json.dumps(item[1], sort_keys=True, separators=(",", ":"))
        ))
    return graph


def closure_path(
    pattern: Mapping[int | str, Iterable[int]],
    first: tuple[int, int], last: tuple[int, int],
) -> dict[str, Any]:
    normalized = normalize_pattern(pattern)
    if first == last:
        return {"first": list(first), "last": list(last), "steps": []}
    graph = _closure_graph(normalized)
    queue = deque([first])
    previous: dict[tuple[int, int], tuple[tuple[int, int], dict[str, Any]]] = {}
    visited = {first}
    while queue:
        node = queue.popleft()
        for next_node, step in graph[node]:
            if next_node in visited:
                continue
            visited.add(next_node)
            previous[next_node] = (node, step)
            if next_node == last:
                queue.clear()
                break
            queue.append(next_node)
    if last not in visited:
        raise StructuralOracleError(f"no closure path from {first} to {last}")
    steps = []
    node = last
    while node != first:
        node, step = previous[node]
        steps.append(step)
    steps.reverse()
    return {"first": list(first), "last": list(last), "steps": steps}


def validate_closure_path(
    pattern: Mapping[int | str, Iterable[int]], path: Mapping[str, Any],
) -> None:
    normalized = normalize_pattern(pattern)
    if not isinstance(path, Mapping) or set(path) != {"first", "last", "steps"}:
        raise StructuralOracleError("closure path has an unexpected schema")
    first = tuple(path["first"])
    last = tuple(path["last"])
    if len(first) != 2 or len(last) != 2 or not isinstance(path["steps"], list):
        raise StructuralOracleError("closure path endpoints or steps are malformed")
    current = first
    for step in path["steps"]:
        left, right = _step_endpoints(step)
        if left != current:
            raise StructuralOracleError("closure path steps do not chain")
        if step["kind"] == "row":
            center = int(step["center"])
            if int(step["first"]) not in normalized.get(center, frozenset()) or (
                int(step["second"]) not in normalized.get(center, frozenset())
            ):
                raise StructuralOracleError("closure row step is not supported by pattern")
        current = right
    if current != last:
        raise StructuralOracleError("closure path has the wrong final edge")


def build_detection(
    pattern: Mapping[int | str, Iterable[int]], stage: str,
    order: separation_encoding.BoundaryOrder | None = None,
) -> dict[str, Any]:
    normalized = normalize_pattern(pattern)
    core = detect_stage(normalized, stage, order)
    if core is None:
        raise StructuralOracleError(f"pattern does not contain the claimed {stage} core")
    family = FAMILY_BY_STAGE[stage]
    theorem_id = (
        REVERSE_ORDER_VARIANTS[stage][1]
        if stage in REVERSE_ORDER_VARIANTS
        else family.theorem_id
    )
    semantic_scope = family.semantic_scope
    if stage in REVERSE_ORDER_VARIANTS:
        semantic_scope += "; theorem roles follow the reverse cyclic orientation"
    paths = []
    for field, first, last in _obligations(stage, core):
        path = closure_path(normalized, first, last)
        paths.append({"field": field, **path})
    return {
        "family_id": family.family_id,
        "stage": stage,
        "theorem_id": theorem_id,
        "theorem_source": family.theorem_source,
        "theorem_source_sha256": THEOREM_SOURCE_SHA256[family.theorem_source],
        "semantic_scope": semantic_scope,
        "order": None if order is None else _order_record(order),
        "core": core,
        "closure_paths": paths,
    }


def validate_detection(
    pattern: Mapping[int | str, Iterable[int]], detection: Mapping[str, Any],
) -> dict[str, Any]:
    if not isinstance(detection, Mapping):
        raise StructuralOracleError("detection is not an object")
    required = {
        "family_id", "stage", "theorem_id", "theorem_source",
        "theorem_source_sha256", "semantic_scope", "order", "core",
        "closure_paths",
    }
    if set(detection) != required:
        raise StructuralOracleError("detection has an unexpected schema")
    order = None if detection["order"] is None else order_from_record(detection["order"])
    expected = build_detection(pattern, str(detection["stage"]), order)
    if dict(detection) != expected:
        raise StructuralOracleError("detection does not exactly replay")
    for path in detection["closure_paths"]:
        path_only = {key: path[key] for key in ("first", "last", "steps")}
        validate_closure_path(pattern, path_only)
    return expected


def minimize_unordered_pattern(
    pattern: Mapping[int | str, Iterable[int]], stage: str,
) -> dict[int, frozenset[int]]:
    family = FAMILY_BY_STAGE.get(stage)
    if family is None or not family.eligible or family.order_sensitive:
        raise StructuralOracleError("only eligible unordered stages can be minimized")
    current = normalize_pattern(pattern)
    if detect_stage(current, stage) is None:
        raise StructuralOracleError("input pattern does not contain the requested core")
    changed = True
    while changed:
        changed = False
        for center in sorted(tuple(current)):
            for member in sorted(tuple(current[center])):
                trial = {key: set(value) for key, value in current.items()}
                trial[center].remove(member)
                if len(trial[center]) < 2:
                    del trial[center]
                if not trial:
                    continue
                if detect_stage(trial, stage) is not None:
                    current = {key: frozenset(value) for key, value in trial.items()}
                    changed = True
                    break
            if changed:
                break
    return current


def scan_structural_cores(
    cube: Mapping[int | str, Iterable[int]],
) -> StructuralScan:
    pattern = normalize_pattern(cube, require_full_cube=True)
    for family in UNORDERED_FAMILIES:
        if detect_stage(pattern, family.stage) is not None:
            minimized = minimize_unordered_pattern(pattern, family.stage)
            detection = build_detection(minimized, family.stage)
            return StructuralScan(minimized, detection, (), ())
    valid_orders = separation_encoding.valid_orders(pattern)
    ordered_detections = []
    for order in valid_orders:
        for stage in ORDERED_STAGE_VARIANTS:
            if detect_stage(pattern, stage, order) is not None:
                ordered_detections.append(build_detection(pattern, stage, order))
                break
    return StructuralScan(pattern, None, valid_orders, tuple(ordered_detections))


def profile_orbit_unordered(
    pattern: Mapping[int | str, Iterable[int]], stage: str,
) -> tuple[dict[str, Any], ...]:
    normalized = normalize_pattern(pattern)
    output = []
    for image, mapping in combinatorics.orbit_with_maps(normalized):
        # The support map certifies only the pattern orbit image.  Re-detect
        # theorem roles and closure paths on the image so the emitted
        # detection has exact, independently replayable provenance.
        output.append({
            "pattern": _json_pattern(image),
            "support_map": [[point, mapping[point]] for point in sorted(mapping)],
            "detection": build_detection(image, stage),
        })
    return tuple(output)


def profile_orbit_ordered(
    pattern: Mapping[int | str, Iterable[int]],
    detections: Sequence[Mapping[str, Any]],
) -> tuple[dict[str, Any], ...]:
    normalized = normalize_pattern(pattern, require_full_cube=True)
    checked = [validate_detection(normalized, detection) for detection in detections]
    output = []
    for image, mapping in combinatorics.orbit_with_maps(normalized):
        mapped = []
        for detection in checked:
            order = order_from_record(detection["order"])
            mapped_order = map_order(order, mapping)
            # As above, the support map is pattern provenance.  The theorem
            # roles and paths are re-derived and validated on the image.
            mapped.append(build_detection(image, detection["stage"], mapped_order))
        mapped.sort(key=lambda item: (
            item["order"]["orientation"],
            item["order"]["python_internal_index"], item["stage"],
        ))
        output.append({
            "pattern": _json_pattern(image),
            "support_map": [[point, mapping[point]] for point in sorted(mapping)],
            "detections": mapped,
        })
    return tuple(output)


def catalog_manifest() -> dict[str, Any]:
    observed = {}
    for source, expected in sorted(THEOREM_SOURCE_SHA256.items()):
        path = REPO_ROOT / source
        actual = _sha256_file(path)
        if actual != expected:
            raise StructuralOracleError(
                f"theorem source hash drifted for {source}: {actual} != {expected}"
            )
        observed[source] = expected
    observed_build_artifacts = {}
    for artifact, expected in sorted(BUILD_ARTIFACT_SHA256.items()):
        actual = _sha256_file(REPO_ROOT / artifact)
        if actual != expected:
            raise StructuralOracleError(
                f"validated structural build artifact drifted for {artifact}"
            )
        observed_build_artifacts[artifact] = expected
    families = [asdict(family) | {"family_id": family.family_id}
                for family in FAMILIES]
    contract = {
        "schema": SCHEMA,
        "ordering_policy": ORDERING_POLICY,
        "build": {
            "status": BUILD_STATUS,
            "target": BUILD_TARGET,
            "command": BUILD_COMMAND,
            "axiom_audit_theorem": AXIOM_AUDIT_THEOREM,
            "axiom_audit_command": AXIOM_AUDIT_COMMAND,
            "expected_axioms": list(EXPECTED_AXIOMS),
            "axiom_audit_result": list(EXPECTED_AXIOMS),
            "validated_utc": VALIDATED_UTC,
            "proof_blueprint_build_fingerprint": (
                PROOF_BLUEPRINT_BUILD_FINGERPRINT
            ),
        },
        "families": families,
        "eligible_family_ids": [family.family_id for family in ELIGIBLE_FAMILIES],
        "ineligible_family_ids": [family.family_id for family in FAMILIES
                                  if not family.eligible],
        "ordered_detector_variants": [
            {
                "stage": stage,
                "family_id": FAMILY_BY_STAGE[stage].family_id,
                "theorem_id": (
                    REVERSE_ORDER_VARIANTS[stage][1]
                    if stage in REVERSE_ORDER_VARIANTS
                    else FAMILY_BY_STAGE[stage].theorem_id
                ),
            }
            for stage in ORDERED_STAGE_VARIANTS
        ],
        "theorem_sources": observed,
        "build_artifacts": observed_build_artifacts,
        "trust": (
            "Python detections carry replayable finite equality paths and exact "
            "theorem/source provenance, but are not themselves Lean proof terms. "
            "Final mixed-source publication still requires checked Lean replay."
        ),
    }
    contract["contract_sha256"] = _sha256_bytes(_canonical_json_bytes(contract))
    return contract


def catalog_bytes() -> bytes:
    return _canonical_json_bytes(catalog_manifest())


def validate_catalog_manifest(
    value: Mapping[str, Any], *, require_passed: bool = True,
) -> dict[str, Any]:
    validate_catalog_snapshot(value, require_passed=require_passed)
    expected = catalog_manifest()
    if not isinstance(value, Mapping) or dict(value) != expected:
        raise StructuralOracleError("structural oracle catalog does not exactly match")
    return expected


def validate_catalog_snapshot(
    value: Mapping[str, Any], *,
    source_bytes: Mapping[str, bytes] | None = None,
    build_artifact_bytes: Mapping[str, bytes] | None = None,
    require_passed: bool = True,
) -> dict[str, Any]:
    """Validate a self-contained historical catalog without reading live sources."""

    required = {
        "schema", "ordering_policy", "build", "families",
        "eligible_family_ids", "ineligible_family_ids",
        "ordered_detector_variants", "theorem_sources", "trust",
        "build_artifacts", "contract_sha256",
    }
    if not isinstance(value, Mapping) or set(value) != required:
        raise StructuralOracleError("structural oracle snapshot has an unexpected schema")
    if value["schema"] != SCHEMA or not isinstance(value["build"], Mapping):
        raise StructuralOracleError("structural oracle snapshot schema is unsupported")
    unsigned = dict(value)
    recorded_contract = unsigned.pop("contract_sha256")
    if _sha256_bytes(_canonical_json_bytes(unsigned)) != recorded_contract:
        raise StructuralOracleError("structural oracle contract hash mismatch")
    if require_passed and value["build"].get("status") != "passed":
        raise StructuralOracleError("structural oracle theorem build is not passed")
    families = value["families"]
    if not isinstance(families, list) or not families:
        raise StructuralOracleError("structural oracle family catalog is empty")
    family_ids = [family.get("family_id") for family in families
                  if isinstance(family, Mapping)]
    if len(family_ids) != len(families) or len(set(family_ids)) != len(family_ids):
        raise StructuralOracleError("structural oracle family IDs are malformed")
    eligible = value["eligible_family_ids"]
    ineligible = value["ineligible_family_ids"]
    if (
        not isinstance(eligible, list) or not isinstance(ineligible, list)
        or set(eligible) & set(ineligible)
        or set(eligible) | set(ineligible) != set(family_ids)
    ):
        raise StructuralOracleError("structural oracle eligibility partition is invalid")
    sources = value["theorem_sources"]
    if not isinstance(sources, Mapping) or not sources:
        raise StructuralOracleError("structural oracle theorem sources are absent")
    if source_bytes is not None:
        if set(source_bytes) != set(sources):
            raise StructuralOracleError("structural theorem snapshot set drifted")
        for source, expected in sources.items():
            if _sha256_bytes(source_bytes[source]) != expected:
                raise StructuralOracleError(
                    f"structural theorem snapshot hash mismatch: {source}"
                )
    build_artifacts = value["build_artifacts"]
    if not isinstance(build_artifacts, Mapping) or not build_artifacts:
        raise StructuralOracleError("structural oracle build artifacts are absent")
    if build_artifact_bytes is not None:
        if set(build_artifact_bytes) != set(build_artifacts):
            raise StructuralOracleError("structural build artifact set drifted")
        for artifact, expected in build_artifacts.items():
            if _sha256_bytes(build_artifact_bytes[artifact]) != expected:
                raise StructuralOracleError(
                    f"structural build artifact hash mismatch: {artifact}"
                )
    return dict(value)
