"""Replayable positive-incidence coverage of the 48 exact-12 source orders.

The source ingress supplies one boundary order, but does not choose which of
the 24 direct or 24 mirror orders it is.  A certificate from this module is a
row-pattern nogood only when every one of those 48 orders is covered by a
positive-incidence obstruction already represented by a Lean consumer.

The diagnostic detector is broader than the production proof-backed registry.
Only exact cubes whose replay has a checked `SourceOrderPositiveNogood` Lean
value may be admitted by CEGAR; the current registry contains the frozen V8
cube and mixed-v3 cell 8.  This module does not prove schedule coverage, a
universal lift, or closure of a live sorry.
"""

from __future__ import annotations

import copy
import hashlib
import itertools
import json
from collections.abc import Collection, Mapping, Sequence
from typing import Any

from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric

from .sat_encoding import CoverInstance

N = 12
SCHEMA = "p97_rigid221_exact12_source_order_positive_coverage.v3"
SOURCE_ORDER_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenRoleLabeling.exists_frozenBoundaryOrder_with_forced_secondCap"
)
COMMON_FIVE_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.false_of_convexFivePointCore"
)
KALMANSON_SOURCE_THEOREMS = (
    (
        "Problem97.CapCrossingKalmansonBridge."
        "complementary_dist_add_dist_lt_diagonal_sum_of_ccw"
    ),
    ("Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw"),
)
SHARED_LATE_SOURCE_THEOREMS = (
    ("Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw"),
)
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.SourceOrderPositiveNogood"
)
LEAN_TERMINAL_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.false_of_terminalSourceOrderPositiveBank"
)
FROZEN_V8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "frozenV8PositiveNogood"
)
FROZEN_V8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.sourceOrderCoverage_frozenV8"
)
FROZEN_V8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221FrozenV8PositiveCut.lean"
)
FROZEN_V8_LEAN_SOURCE_BYTES = 10405
FROZEN_V8_LEAN_SOURCE_SHA256 = (
    "09a0034bbfc50c188abd4355a458e7b78222fdc923ea84b7f9c21d7a9b94459a"
)
FROZEN_V8_LEAN_COVERAGE_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SourceOrderCoverage.lean"
)
FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES = 6545
FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256 = (
    "3353d47ab72e2fa044b6c168900e2ce55933cd65bb1b47278c19b7d6646a5d26"
)
FROZEN_V8_LEAN_CONSUMER_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SourceOrderTerminalBankConsumer.lean"
)
FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES = 6885
FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256 = (
    "74d8689d33b912e85f71714d33eed843b58c4fdbd59251b934c3adb8832f0250"
)
MIXED_V3_CELL8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV3Cell8PositiveNogood"
)
MIXED_V3_CELL8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_0_9_2_3_1"
)
MIXED_V3_CELL8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV3Cell8PositiveCut.lean"
)
MIXED_V3_CELL8_LEAN_SOURCE_BYTES = 3712
MIXED_V3_CELL8_LEAN_SOURCE_SHA256 = (
    "c6311578addcd9bee044ab9d5c607c74d684b66fcc64544545cfed7eb64c1e58"
)
REQUIRED_SOURCE_HYPOTHESES = (
    "Realizes",
    "FrozenBoundaryOrder",
    "FrozenForcedSecondCapOrder",
    "ConvexIndep",
)

MembershipKey = tuple[tuple[int, tuple[int, ...]], ...]


class Exact12V14OrderedCoverageError(ValueError):
    """The cube or ordered-coverage certificate is malformed."""


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def source_boundary_orders() -> tuple[tuple[str, tuple[int, ...]], ...]:
    """Enumerate exactly the source-entitled 24 direct and 24 mirror orders."""

    direct = {
        (0, *second, 2, *surplus, 1, *first)
        for first in itertools.permutations((10, 11))
        for surplus in itertools.permutations((3, 4, 5))
        for second in ((6, 7, 8, 9), (9, 8, 7, 6))
    }
    mirror = {
        (0, *first, 1, *surplus, 2, *second)
        for first in itertools.permutations((10, 11))
        for surplus in itertools.permutations((3, 4, 5))
        for second in ((6, 7, 8, 9), (9, 8, 7, 6))
    }
    if len(direct) != 24 or len(mirror) != 24 or direct & mirror:
        raise AssertionError("source boundary-order universe is not 24 + 24")
    return tuple(
        [("direct", order) for order in sorted(direct)]
        + [("mirror", order) for order in sorted(mirror)]
    )


SOURCE_ORDERS = source_boundary_orders()
ORDER_UNIVERSE = [
    {"source_orientation": orientation, "order": list(order)}
    for orientation, order in SOURCE_ORDERS
]
ORDER_UNIVERSE_SHA256 = _sha256_json(ORDER_UNIVERSE)

FROZEN_V8_CUBE = {
    "0": [3, 5, 8, 10],
    "1": [0, 2, 6, 8],
    "2": [4, 8, 10, 11],
    "3": [1, 2, 9, 10],
    "4": [0, 1, 3, 9],
    "5": [0, 2, 7, 11],
    "6": [2, 3, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [3, 4, 6, 9],
    "9": [2, 5, 7, 8],
    "10": [1, 5, 6, 7],
    "11": [1, 4, 5, 10],
}
FROZEN_V8_CUBE_SHA256 = _sha256_json(FROZEN_V8_CUBE)
FROZEN_V8_LEAN_CHOICES = [
    {"center": center, "support": list(FROZEN_V8_CUBE[str(center)])}
    for center in (0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11)
]
FROZEN_V8_LEAN_BINDING = {
    "cube_sha256": FROZEN_V8_CUBE_SHA256,
    "nogood_declaration": FROZEN_V8_LEAN_NOGOOD,
    "coverage_declaration": FROZEN_V8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": FROZEN_V8_LEAN_CHOICES,
    "source_path": FROZEN_V8_LEAN_SOURCE,
    "source_bytes": FROZEN_V8_LEAN_SOURCE_BYTES,
    "source_sha256": FROZEN_V8_LEAN_SOURCE_SHA256,
    "coverage_source_path": FROZEN_V8_LEAN_COVERAGE_SOURCE,
    "coverage_source_bytes": FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES,
    "coverage_source_sha256": FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V3_CELL8_CUBE = {
    "0": [3, 4, 6, 10],
    "1": [0, 2, 6, 8],
    "2": [5, 6, 10, 11],
    "3": [1, 2, 9, 11],
    "4": [1, 2, 3, 5],
    "5": [0, 4, 7, 9],
    "6": [0, 4, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [0, 2, 7, 10],
    "10": [2, 3, 4, 8],
    "11": [3, 5, 7, 10],
}
MIXED_V3_CELL8_CUBE_SHA256 = _sha256_json(MIXED_V3_CELL8_CUBE)
MIXED_V3_CELL8_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V3_CELL8_CUBE[str(center)])}
    for center in (1, 3, 9)
]
MIXED_V3_CELL8_LEAN_BINDING = {
    "cube_sha256": MIXED_V3_CELL8_CUBE_SHA256,
    "nogood_declaration": MIXED_V3_CELL8_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V3_CELL8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V3_CELL8_LEAN_CHOICES,
    "source_path": MIXED_V3_CELL8_LEAN_SOURCE,
    "source_bytes": MIXED_V3_CELL8_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V3_CELL8_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V3_CELL8_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V3_CELL8_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V3_CELL8_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

PROOF_BACKED_CUBE_BINDINGS = (
    (FROZEN_V8_CUBE, FROZEN_V8_LEAN_BINDING, FROZEN_V8_LEAN_CHOICES),
    (
        MIXED_V3_CELL8_CUBE,
        MIXED_V3_CELL8_LEAN_BINDING,
        MIXED_V3_CELL8_LEAN_CHOICES,
    ),
)


def _proof_backed_binding(
    cube: Mapping[str, Sequence[int]],
) -> tuple[dict[str, Any], list[dict[str, Any]]] | None:
    for bound_cube, binding, choices in PROOF_BACKED_CUBE_BINDINGS:
        if cube == bound_cube:
            return binding, choices
    return None


def _cube_payload(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCoverageError("cube is not a mapping")
    integer_keys = set(range(N))
    string_keys = {str(center) for center in range(N)}
    if set(cube) == integer_keys:
        supports = (cube[center] for center in range(N))
    elif set(cube) == string_keys:
        supports = (cube[str(center)] for center in range(N))
    else:
        raise Exact12V14OrderedCoverageError(
            "cube must contain every exact-12 center exactly once"
        )
    payload: dict[str, list[int]] = {}
    for center, support in enumerate(supports):
        if isinstance(support, (str, bytes)):
            raise Exact12V14OrderedCoverageError("cube support is malformed")
        try:
            normalized = sorted(support)
        except TypeError as exc:
            raise Exact12V14OrderedCoverageError("cube support is malformed") from exc
        if len(normalized) != 4 or any(
            type(point) is not int or not 0 <= point < N for point in normalized
        ):
            raise Exact12V14OrderedCoverageError(
                "each selected support must be four distinct other labels"
            )
        if len(set(normalized)) != 4 or center in normalized:
            raise Exact12V14OrderedCoverageError(
                "each selected support must be four distinct other labels"
            )
        payload[str(center)] = normalized
    return payload


def _metric_rows(cube: Mapping[str, Sequence[int]]) -> tuple[metric.MetricRow, ...]:
    # False is essential: selected supports are not complete ambient fibres.
    return tuple(
        metric.MetricRow(center, tuple(cube[str(center)]), False) for center in range(N)
    )


def _cyclic_triple(order: Sequence[int], triple: Sequence[int]) -> bool:
    if len(order) != N or set(order) != set(range(N)) or len(set(triple)) != 3:
        return False
    positions = [order.index(label) for label in triple]
    return any(
        positions[(start + 0) % 3]
        < positions[(start + 1) % 3]
        < positions[(start + 2) % 3]
        for start in range(3)
    )


def _common_five_orientation(
    order: Sequence[int], core: Mapping[str, int]
) -> str | None:
    forward = _cyclic_triple(order, (core["a"], core["x"], core["b"])) and (
        _cyclic_triple(order, (core["b"], core["c"], core["y"]))
    )
    if forward:
        return "forward"
    reverse = _cyclic_triple(order, (core["a"], core["b"], core["x"])) and (
        _cyclic_triple(order, (core["b"], core["y"], core["c"]))
    )
    return "reverse" if reverse else None


def _common_five_point_cores(
    rows: Sequence[metric.MetricRow],
) -> tuple[dict[str, int], ...]:
    closure = metric._row_equality_closure(N, rows)
    roots, _circle_masks = metric._closure_circle_index(closure, N)
    cores: list[dict[str, int]] = []
    for a in range(N):
        for b in range(N):
            if b == a:
                continue
            bisectors = tuple(
                point
                for point in range(N)
                if point not in (a, b) and roots[point][a] == roots[point][b]
            )
            for x in bisectors:
                for y in bisectors:
                    if y == x:
                        continue
                    for c in range(N):
                        if c in (a, x, b, y):
                            continue
                        if roots[c][b] == roots[c][x] == roots[c][y]:
                            cores.append({"a": a, "x": x, "b": b, "c": c, "y": y})
    return tuple(cores)


def _closure_memberships(certificate: Mapping[str, Any]) -> MembershipKey:
    required: dict[int, set[int]] = {}
    paths = certificate.get("closure_paths")
    if not isinstance(paths, list):
        raise Exact12V14OrderedCoverageError("closure paths are malformed")
    for path in paths:
        if not isinstance(path, dict) or not isinstance(path.get("steps"), list):
            raise Exact12V14OrderedCoverageError("closure path is malformed")
        for step in path["steps"]:
            if step.get("kind") == "flip":
                continue
            if step.get("kind") != "row":
                raise Exact12V14OrderedCoverageError(
                    "closure path contains an unsupported step"
                )
            center = int(step["center"])
            required.setdefault(center, set()).update(
                (int(step["first"]), int(step["second"]))
            )
    key = tuple(
        (center, tuple(sorted(points))) for center, points in sorted(required.items())
    )
    if not key:
        raise Exact12V14OrderedCoverageError("closure proof used no row facts")
    return key


def _strict_kalmanson(
    rows: Mapping[int, metric.MetricRow], order: Sequence[int]
) -> tuple[dict[str, Any], MembershipKey] | None:
    """Match the fixed-position exact-12 Kalmanson wrapper, without rotation."""

    for io, ia, iy, ie, ic in itertools.combinations(range(N), 5):
        o, a, y, e, c = (int(order[i]) for i in (io, ia, iy, ie, ic))
        required: MembershipKey = (
            (a, tuple(sorted((c, o)))),
            (o, tuple(sorted((e, c)))),
            (y, tuple(sorted((o, e)))),
        )
        if all(set(points) <= set(rows[center].support) for center, points in required):
            detection = {
                "lean_source_theorems": list(KALMANSON_SOURCE_THEOREMS),
                "labels": {"o": o, "a": a, "y": y, "e": e, "c": c},
                "positions": {"o": io, "a": ia, "y": iy, "e": ie, "c": ic},
            }
            return detection, tuple(sorted(required))
    return None


def _shared_late_pair(
    rows: Mapping[int, metric.MetricRow], order: Sequence[int]
) -> tuple[dict[str, Any], MembershipKey] | None:
    for ia, ib, ic, id_ in itertools.combinations(range(N), 4):
        a, b, c, d = (int(order[i]) for i in (ia, ib, ic, id_))
        required: MembershipKey = (
            (a, tuple(sorted((c, d)))),
            (b, tuple(sorted((c, d)))),
        )
        if all(set(points) <= set(rows[center].support) for center, points in required):
            detection = {
                "lean_source_theorems": list(SHARED_LATE_SOURCE_THEOREMS),
                "labels": {"a": a, "b": b, "c": c, "d": d},
                "positions": {"a": ia, "b": ib, "c": ic, "d": id_},
            }
            return detection, tuple(sorted(required))
    return None


def _merge_memberships(keys: Sequence[MembershipKey]) -> MembershipKey:
    required: dict[int, set[int]] = {}
    for key in keys:
        for center, points in key:
            required.setdefault(center, set()).update(points)
    return tuple(
        (center, tuple(sorted(points))) for center, points in sorted(required.items())
    )


def _build_body(cube: Mapping[str, Sequence[int]]) -> dict[str, Any] | None:
    rows = _metric_rows(cube)
    rows_by_center = {row.center: row for row in rows}
    cores = _common_five_point_cores(rows)
    closures: dict[str, dict[str, Any]] = {}
    membership_keys: list[MembershipKey] = []
    coverage: list[dict[str, Any]] = []

    for index, (source_orientation, order) in enumerate(SOURCE_ORDERS):
        prefix = {
            "order_id": f"source-order-{index:02d}",
            "source_orientation": source_orientation,
            "order": list(order),
        }
        common = next(
            (
                (core, orientation)
                for core in cores
                if (orientation := _common_five_orientation(order, core)) is not None
            ),
            None,
        )
        if common is not None:
            core, orientation = common
            stage = (
                "equality-convex-five-point"
                if orientation == "forward"
                else "equality-convex-five-point-reverse"
            )
            detection = {"stage": stage, "core": dict(core)}
            certificate = certificates._certificate_for_detection(rows, N, detection)
            if certificates._validate_certificate(certificate, n=N) is not True:
                raise Exact12V14OrderedCoverageError(
                    "common-five certificate failed equality replay"
                )
            proof_sha256 = certificate.get("proof_sha256")
            if not isinstance(proof_sha256, str):
                raise Exact12V14OrderedCoverageError(
                    "common-five certificate has no proof hash"
                )
            previous = closures.get(proof_sha256)
            if previous is not None and previous != certificate:
                raise Exact12V14OrderedCoverageError("closure proof-hash collision")
            closures[proof_sha256] = certificate
            key = _closure_memberships(certificate)
            membership_keys.append(key)
            coverage.append(
                {
                    **prefix,
                    "rule": "convex-five-point-common-orientation",
                    "lean_theorem": COMMON_FIVE_THEOREM,
                    "orientation": orientation,
                    "core": dict(core),
                    "closure_proof_sha256": proof_sha256,
                }
            )
            continue

        strict = _strict_kalmanson(rows_by_center, order)
        if strict is not None:
            detection, key = strict
            membership_keys.append(key)
            coverage.append(
                {**prefix, "rule": "selected-rows-kalmanson", "detection": detection}
            )
            continue

        shared = _shared_late_pair(rows_by_center, order)
        if shared is None:
            return None
        detection, key = shared
        membership_keys.append(key)
        coverage.append(
            {**prefix, "rule": "two-rows-shared-late-pair", "detection": detection}
        )

    merged = _merge_memberships(membership_keys)
    selected_rows = [
        {"center": center, "support": list(cube[str(center)]), "exact": False}
        for center, _points in merged
    ]
    body = {
        "schema": SCHEMA,
        "scope": (
            "one exact-12 selected row pattern; all 48 source-entitled boundary "
            "orders; positive incidence only; finite nogood, not universal closure"
        ),
        "source_order_theorem": SOURCE_ORDER_THEOREM,
        "lean_consumer": LEAN_CONSUMER,
        "required_source_hypotheses": list(REQUIRED_SOURCE_HYPOTHESES),
        "order_universe_sha256": ORDER_UNIVERSE_SHA256,
        "order_universe": ORDER_UNIVERSE,
        "cube": dict(cube),
        "closure_certificates": [closures[key] for key in sorted(closures)],
        "coverage": coverage,
        "selected_memberships": [
            {"center": center, "required": list(points)} for center, points in merged
        ],
        "selected_rows": selected_rows,
    }
    proof_backed = _proof_backed_binding(cube)
    if proof_backed is not None:
        binding, _choices = proof_backed
        body["generated_lean_nogood"] = copy.deepcopy(binding)
    return body


def detect_ordered_coverage(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, Any] | None:
    """Return a certificate only when all 48 source orders are covered."""

    payload = _cube_payload(cube)
    body = _build_body(payload)
    if body is None:
        return None
    return {**body, "certificate_sha256": _sha256_json(body)}


def detect_proof_backed_ordered_coverage(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, Any] | None:
    """Return producer metadata only for an exact generated Lean nogood.

    Runtime source authentication belongs to ``exact12_v14_source_order_bank``.
    """

    certificate = detect_ordered_coverage(cube)
    if certificate is None or "generated_lean_nogood" not in certificate:
        return None
    return certificate


def replay_ordered_coverage(certificate: Mapping[str, Any]) -> MembershipKey:
    """Regenerate and compare every order, detector result, and equality proof."""

    if not isinstance(certificate, Mapping):
        raise Exact12V14OrderedCoverageError("certificate is not a mapping")
    cube = certificate.get("cube")
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCoverageError("certificate cube is malformed")
    expected = detect_ordered_coverage(cube)
    if expected is None:
        raise Exact12V14OrderedCoverageError("certificate cube lacks 48-order coverage")
    if dict(certificate) != expected:
        raise Exact12V14OrderedCoverageError("ordered coverage failed exact replay")
    selected = expected["selected_memberships"]
    return tuple(
        (int(row["center"]), tuple(int(point) for point in row["required"]))
        for row in selected
    )


def learned_clause_for_ordered_coverage(
    instance: CoverInstance, certificate: Mapping[str, Any]
) -> tuple[int, ...]:
    """Compile a replayed positive-row nogood to selected-row choice literals."""

    key = replay_ordered_coverage(certificate)
    if instance.model.cardinality != N:
        raise Exact12V14OrderedCoverageError("ordered coverage requires cardinality 12")
    rows = certificate["cube"]
    literals: list[int] = []
    for center, _required in key:
        support = tuple(int(point) for point in rows[str(center)])
        try:
            candidate_index = instance.candidate_index(center, support)
            variable = instance.choice_variables[(center, candidate_index)]
        except (KeyError, ValueError) as exc:
            raise Exact12V14OrderedCoverageError(
                f"selected row {center} is outside the bound model"
            ) from exc
        literals.append(-variable)
    clause = tuple(literals)
    if not clause or len(clause) != len(set(clause)):
        raise Exact12V14OrderedCoverageError("ordered learned clause is malformed")
    return clause


def learned_clause_for_proof_backed_ordered_coverage(
    instance: CoverInstance, certificate: Mapping[str, Any]
) -> tuple[int, ...]:
    """Compile a clause only after exact replay of a generated Lean binding."""

    clause = learned_clause_for_ordered_coverage(instance, certificate)
    cube = certificate.get("cube")
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCoverageError("ordered coverage cube is malformed")
    proof_backed = _proof_backed_binding(cube)
    if proof_backed is None:
        raise Exact12V14OrderedCoverageError(
            "ordered coverage has no generated Lean nogood binding"
        )
    binding, choices = proof_backed
    if certificate.get("generated_lean_nogood") != binding:
        raise Exact12V14OrderedCoverageError(
            "ordered coverage generated Lean nogood binding drifted"
        )
    expected_rows = [
        {"center": row["center"], "support": row["support"], "exact": False}
        for row in choices
    ]
    if certificate.get("selected_rows") != expected_rows:
        raise Exact12V14OrderedCoverageError(
            "ordered coverage rows differ from generated Lean choices"
        )
    if len(clause) != len(choices):
        raise Exact12V14OrderedCoverageError(
            "ordered learned clause differs from generated Lean choices"
        )
    return clause
