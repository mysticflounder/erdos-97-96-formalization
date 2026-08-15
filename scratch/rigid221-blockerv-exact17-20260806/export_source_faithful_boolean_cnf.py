#!/usr/bin/env python3
"""Export one exact-17 source-faithful CEGAR case to direct DIMACS.

The output contains only the Boolean source abstraction and the row-pattern
nogoods recorded by authenticated CEGAR artifacts.  It is a candidate coverage
certificate input, not by itself a Lean proof: every imported nogood must also
be replayed through a checked geometric consumer.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
sys.path.insert(0, str(HERE))


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


source = load_module(
    "exact17_source_faithful_export_source", HERE / "exact17_source_faithful_cegar.py"
)
legacy = source.legacy
base_cnf = load_module(
    "exact17_source_faithful_export_base_cnf", HERE / "export_exact17_boolean_cnf.py"
)
shared_late_pair = load_module(
    "exact17_source_faithful_shared_late_pair",
    HERE / "exact17_two_rows_shared_late_pair.py",
)
direct_row_consumers = load_module(
    "exact17_source_faithful_direct_row_consumers",
    HERE / "exact17_committed_direct_row_consumers.py",
)

Literal = int
Clause = tuple[Literal, ...]
DISTANCE_LABEL_BITS = 8
REAUTHENTICATED_ARTIFACT_SCHEMA = (
    "p97-rigid221-exact17-cap9-source-faithful-exact-core-reauth-v1"
)
STATIC_SCHEMA_LEAN_FILE = (
    REPO / "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean"
)
STATIC_SCHEMA_LEAN_CONSUMERS = {
    f"six_point_schema_{label.lower()}": tuple(
        "Problem97.CapCrossingKalmansonBridge."
        f"false_of_four_selected_rows_in_six_ccw_order_{label}{suffix}"
        for suffix in (
            "",
            "_of_decreasing",
            "_cyclicShift",
            "_cyclicShift_of_decreasing",
        )
    )
    for label in ("G", "H", "I", "J")
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_dependency_paths() -> dict[str, Path]:
    return {
        "source_runner": HERE / "exact17_source_faithful_cegar.py",
        "direct_exporter": HERE / "export_source_faithful_boolean_cnf.py",
        "base_cnf_exporter": HERE / "export_exact17_boolean_cnf.py",
        "fullcover": HERE / "exact17_fullcover_cegar.py",
        "order_base": HERE / "exact17_kalmanson.py",
        "producer_bank": REPO / "census/atail_force/producer_bank.py",
        "shared_late_pair": HERE / "exact17_two_rows_shared_late_pair.py",
        "direct_row_consumers": HERE / "exact17_committed_direct_row_consumers.py",
        "static_schema_lean_consumers": STATIC_SCHEMA_LEAN_FILE,
    }


def verify_static_schema_lean_consumers() -> None:
    """Fail closed if a compiled static schema has no named Lean consumer."""

    source_text = STATIC_SCHEMA_LEAN_FILE.read_text()
    for consumers in STATIC_SCHEMA_LEAN_CONSUMERS.values():
        for qualified_name in consumers:
            short_name = qualified_name.rsplit(".", 1)[-1]
            if f"theorem {short_name}" not in source_text:
                raise RuntimeError(
                    f"missing required static-schema Lean consumer: {qualified_name}"
                )


def source_hash_snapshot() -> dict[str, str]:
    return {name: sha256(path) for name, path in source_dependency_paths().items()}


def selected_variables() -> dict[tuple[int, int], int]:
    return {
        (center, point): index
        for index, (center, point) in enumerate(
            (
                (center, point)
                for center in source.POINTS
                for point in source.POINTS
                if center != point
            ),
            start=1,
        )
    }


def exactly_k(variables: list[int], k: int) -> list[Clause]:
    """Direct CNF for exactly ``k`` true variables."""

    if not 0 <= k <= len(variables):
        raise ValueError("invalid exact-cardinality bound")
    at_most = [tuple(-var for var in subset) for subset in combinations(variables, k + 1)]
    at_least = [
        tuple(subset)
        for subset in combinations(variables, len(variables) - k + 1)
    ]
    return at_most + at_least


def distance_edge(left: int, right: int) -> tuple[int, int]:
    """Canonical unordered carrier edge for a squared-distance label."""

    return (left, right) if left < right else (right, left)


def transitive_two_circle_clauses(
    selected: dict[tuple[int, int], int],
    order: tuple[int, ...],
    first_variable: int,
) -> tuple[
    list[Clause],
    list[Clause],
    list[Clause],
    list[Clause],
    dict[tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]],
    int,
    dict[str, int],
]:
    """Compile selected-row equality closure into direct CNF.

    The 136 carrier edges receive arbitrary 8-bit labels. Selected pairs in
    one row force equality of their incident edge labels. XOR helpers are
    available for every pair of carrier edges, including disjoint edges, so a
    generic Kalmanson cancellation can be compiled directly from its four
    equality-path endpoints. Each cyclic four-point instance of
    ``FourPointTwoCircleBisectorOrderCore`` then forces at least one of its two
    centered comparisons to have different labels.

    An actual realization extends this abstraction by assigning a distinct
    bit pattern to every distinct squared distance; 136 < 2^8. Thus the label
    layer does not assert that carrier distances themselves are distinct.
    """

    next_variable = first_variable
    label_variables: dict[tuple[tuple[int, int], int], int] = {}
    for edge in combinations(source.POINTS, 2):
        for bit in range(DISTANCE_LABEL_BITS):
            label_variables[edge, bit] = next_variable
            next_variable += 1

    comparison_variables: dict[
        tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]
    ] = {}
    xor_definitions: list[Clause] = []
    edges = tuple(combinations(source.POINTS, 2))
    for comparison in combinations(edges, 2):
        xor_bits: list[int] = []
        for bit in range(DISTANCE_LABEL_BITS):
            left_bit = label_variables[comparison[0], bit]
            right_bit = label_variables[comparison[1], bit]
            xor_bit = next_variable
            next_variable += 1
            xor_bits.append(xor_bit)

            # xor_bit ↔ (left_bit XOR right_bit).
            xor_definitions.extend((
                (-xor_bit, left_bit, right_bit),
                (-xor_bit, -left_bit, -right_bit),
                (xor_bit, left_bit, -right_bit),
                (xor_bit, -left_bit, right_bit),
            ))
        comparison_variables[comparison] = tuple(xor_bits)

    selected_equalities: list[Clause] = []
    for center in source.POINTS:
        endpoints = tuple(point for point in source.POINTS if point != center)
        for left, right in combinations(endpoints, 2):
            comparison = tuple(sorted((
                distance_edge(center, left),
                distance_edge(center, right),
            )))
            for bit in range(DISTANCE_LABEL_BITS):
                left_bit = label_variables[comparison[0], bit]
                right_bit = label_variables[comparison[1], bit]
                # Selecting both endpoints in this center's row forces the
                # corresponding distance-label bits to agree.
                selected_equalities.extend((
                    (
                        -selected[center, left],
                        -selected[center, right],
                        -left_bit,
                        right_bit,
                    ),
                    (
                        -selected[center, left],
                        -selected[center, right],
                        left_bit,
                        -right_bit,
                    ),
                ))

    forbidden: set[
        tuple[
            tuple[tuple[int, int], tuple[int, int]],
            tuple[tuple[int, int], tuple[int, int]],
        ]
    ] = set()
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

    obstruction_clauses = [
        tuple(
            xor_bit
            for comparison in obstruction
            for xor_bit in comparison_variables[comparison]
        )
        for obstruction in sorted(forbidden)
    ]

    five_point_forbidden: set[
        tuple[tuple[tuple[int, int], tuple[int, int]], ...]
    ] = set()
    for cyclic_order in (order, tuple(reversed(order))):
        for start in range(len(cyclic_order)):
            rotated = cyclic_order[start:] + cyclic_order[:start]
            point_a = rotated[0]
            for positions in combinations(range(1, len(rotated)), 4):
                point_x, point_b, point_c, point_y = (
                    rotated[position] for position in positions
                )
                five_point_forbidden.add(tuple(sorted((
                    tuple(sorted((
                        distance_edge(point_x, point_a),
                        distance_edge(point_x, point_b),
                    ))),
                    tuple(sorted((
                        distance_edge(point_y, point_a),
                        distance_edge(point_y, point_b),
                    ))),
                    tuple(sorted((
                        distance_edge(point_c, point_b),
                        distance_edge(point_c, point_x),
                    ))),
                    tuple(sorted((
                        distance_edge(point_c, point_b),
                        distance_edge(point_c, point_y),
                    ))),
                ))))
    five_point_clauses = [
        tuple(
            xor_bit
            for comparison in obstruction
            for xor_bit in comparison_variables[comparison]
        )
        for obstruction in sorted(five_point_forbidden)
    ]
    metadata = {
        "distance_label_bits": DISTANCE_LABEL_BITS,
        "distance_label_variables": len(label_variables),
        "comparison_xor_variables": sum(
            len(bits) for bits in comparison_variables.values()
        ),
        "edge_pair_comparisons": len(comparison_variables),
        "forbidden_cores": len(forbidden),
        "five_point_forbidden_cores": len(five_point_forbidden),
    }
    expected = {
        "distance_label_bits": 8,
        "distance_label_variables": 1_088,
        "comparison_xor_variables": 73_440,
        "edge_pair_comparisons": 9_180,
        "forbidden_cores": 9_520,
        "five_point_forbidden_cores": 61_880,
    }
    if metadata != expected:
        raise AssertionError(
            f"unexpected transitive two-circle dimensions: {metadata}"
        )
    if len(selected_equalities) != 32_640:
        raise AssertionError("unexpected selected-equality clause count")
    if len(xor_definitions) != 293_760:
        raise AssertionError("unexpected xor-definition clause count")
    return (
        selected_equalities,
        xor_definitions,
        obstruction_clauses,
        five_point_clauses,
        comparison_variables,
        next_variable,
        metadata,
    )


def read_artifact(
    path: Path,
    order_index: int,
    positions: tuple[int, int],
    expected_schema: str = source.SCHEMA,
) -> dict:
    payload = json.loads(path.read_text())
    schema = payload.get("schema")
    if schema not in (expected_schema, REAUTHENTICATED_ARTIFACT_SCHEMA):
        raise ValueError(f"schema mismatch: {path}")
    if payload.get("order_index") != order_index:
        raise ValueError(f"order mismatch: {path}")
    if tuple(payload.get("anonymous_positions", ())) != positions:
        raise ValueError(f"position mismatch: {path}")
    expected_order = source.normalized_order(order_index, positions)
    if tuple(payload.get("order", ())) != expected_order:
        raise ValueError(f"cyclic-order payload mismatch: {path}")
    expected_hashes = {
        "runner": sha256(HERE / "exact17_source_faithful_cegar.py"),
        "fullcover": sha256(HERE / "exact17_fullcover_cegar.py"),
        "order_base": sha256(HERE / "exact17_kalmanson.py"),
        "producer_bank": sha256(REPO / "census/atail_force/producer_bank.py"),
    }
    recorded = payload.get("source_hashes", {})
    for key, expected in expected_hashes.items():
        if recorded.get(key) != expected:
            raise ValueError(f"dependency hash mismatch for {key}: {path}")
    if schema == REAUTHENTICATED_ARTIFACT_SCHEMA:
        migration = HERE / "reauthenticate_two_kalmanson_artifacts.py"
        if recorded.get("migration") != sha256(migration):
            raise ValueError(f"migration hash mismatch: {path}")
        parents = payload.get("reauthenticated_parents")
        if not isinstance(parents, list) or not parents:
            raise ValueError(f"reauthenticated artifact has no parents: {path}")
        for parent in parents:
            if not isinstance(parent, dict):
                raise TypeError(f"invalid reauthenticated parent: {path}")
            parent_path = REPO / str(parent.get("path", ""))
            if not parent_path.is_file():
                raise ValueError(f"reauthenticated parent missing: {parent_path}")
            if sha256(parent_path) != parent.get("sha256"):
                raise ValueError(f"reauthenticated parent hash mismatch: {parent_path}")
    return payload


def read_analysis(
    path: Path,
    order_index: int,
    positions: tuple[int, int],
) -> dict:
    """Reauthenticate one source-model theorem-bank rejection as a learned cut."""

    payload = json.loads(path.read_text())
    if payload.get("schema") != (
        "p97-rigid221-exact17-source-faithful-model-analysis-v1"
    ):
        raise ValueError(f"analysis schema mismatch: {path}")
    if payload.get("order_index") != order_index:
        raise ValueError(f"analysis order mismatch: {path}")
    if tuple(payload.get("anonymous_positions", ())) != positions:
        raise ValueError(f"analysis position mismatch: {path}")
    expected_order = source.normalized_order(order_index, positions)
    if tuple(payload.get("order", ())) != expected_order:
        raise ValueError(f"analysis cyclic-order payload mismatch: {path}")
    required_checks = (
        "cnf_assignment_verified",
        "source_z3_assignment_verified",
        "source_independent_model_checker_verified",
        "static_bank_assignment_verified_via_direct_cnf",
    )
    failed_checks = [name for name in required_checks if payload.get(name) is not True]
    if failed_checks:
        raise ValueError(f"analysis checks failed {failed_checks}: {path}")
    hits = payload.get("bank_hits")
    if not isinstance(hits, list) or not hits or not isinstance(hits[0], dict):
        raise ValueError(f"analysis has no theorem-bank hit: {path}")
    if not all(isinstance(hit, dict) for hit in hits):
        raise ValueError(f"analysis has malformed theorem-bank hits: {path}")

    minimized_witnesses = payload.get("minimized_bank_witnesses")
    if minimized_witnesses is not None:
        if not isinstance(minimized_witnesses, list) or len(
            minimized_witnesses
        ) != len(hits):
            raise ValueError(
                f"analysis has incomplete minimized theorem-bank witnesses: {path}"
            )
        learned = []
        for index, (hit, witness) in enumerate(
            zip(hits, minimized_witnesses, strict=True)
        ):
            if not isinstance(witness, dict) or witness.get("record") != hit:
                raise ValueError(
                    f"analysis minimized witness {index} does not match its hit: {path}"
                )
            rows = witness.get("rows")
            if not isinstance(rows, list) or not rows:
                raise ValueError(
                    f"analysis minimized witness {index} has no rows: {path}"
                )
            learned.append(
                {
                    "kind": "formalized-bank",
                    "record": hit,
                    "rows": rows,
                }
            )
        # These are still proposal records.  ``learned_clauses`` independently
        # replays every exact hit against its minimized rows before translating
        # it to a Boolean nogood.
        return {"learned": learned}

    minimized_rows = payload.get("minimized_first_bank_rows")
    first_hit = hits[0]
    if first_hit.get("stage") == "equality-convex-two-kalmanson-cancellation":
        # Historical analyses minimized by theorem family, so their four-row
        # payload can authenticate a different cancellation than the serialized
        # core.  Replay the exact core against the complete verified source model
        # instead.  Enumerate every exact cancellation in that model: the legacy
        # first-hit matcher discarded many distinct endpoint-comparison cuts.
        rows = payload.get("rows")
    else:
        rows = (
            minimized_rows
            if isinstance(minimized_rows, list) and minimized_rows
            else payload.get("rows")
        )
    if not isinstance(rows, list) or not rows:
        raise ValueError(f"analysis has no witness rows: {path}")
    records = [first_hit]
    if first_hit.get("stage") == "equality-convex-two-kalmanson-cancellation":
        metric_rows = legacy.rows_from_payload(rows)
        checked_first = (
            legacy.producer_bank.certify_two_kalmanson_cancellation(
                metric_rows, 17, expected_order, first_hit.get("core", {})
            )
        )
        if checked_first != first_hit:
            raise ValueError(
                f"recorded two-Kalmanson core did not exactly reauthenticate: {path}"
            )
        records = list(
            legacy.producer_bank.enumerate_two_kalmanson_cancellations(
                metric_rows, 17, expected_order
            )
        )
    # The analysis report is only a proposal carrier.  ``learned_clauses``
    # replays every recorded or freshly enumerated exact core against the current
    # theorem bank before admitting a clause, so neither the report's verdict nor
    # its historical family-level minimization is trusted for soundness.
    return {
        "learned": [
            {
                "kind": "formalized-bank",
                "record": record,
                "rows": rows,
            }
            for record in records
        ]
    }


def read_weighted_certificate(
    path: Path,
    order_index: int,
    positions: tuple[int, int],
) -> dict:
    """Recheck an exact weighted Kalmanson certificate as one learned cut."""

    payload = json.loads(path.read_text())
    if payload.get("schema") != "p97-exact17-strict-linear-certificate-v1":
        raise ValueError(f"weighted-certificate schema mismatch: {path}")
    if payload.get("verdict") != "unsat":
        raise ValueError(f"weighted certificate is not UNSAT: {path}")
    expected_order = source.normalized_order(order_index, positions)
    if tuple(payload.get("order", ())) != expected_order:
        raise ValueError(f"weighted-certificate cyclic-order mismatch: {path}")
    rows_payload = payload.get("rows")
    if not isinstance(rows_payload, list) or not rows_payload:
        raise ValueError(f"weighted certificate has no rows: {path}")
    metric_rows = legacy.rows_from_payload(rows_payload)
    recorded = payload.get("weighted_certificate")
    if not isinstance(recorded, dict):
        raise ValueError(f"weighted certificate has no exact record: {path}")
    terms = payload.get("weighted_terms")
    if not isinstance(terms, list) or not terms:
        raise ValueError(f"weighted certificate has no terms: {path}")
    checked = legacy.producer_bank.certify_weighted_kalmanson_cancellation(
        metric_rows, 17, expected_order, terms
    )
    if checked != recorded:
        raise ValueError(f"weighted certificate did not exactly replay: {path}")
    return {
        "learned": [
            {
                "kind": "weighted-kalmanson",
                "record": checked,
                "rows": rows_payload,
                "terms": terms,
            }
        ]
    }


def learned_clauses(
    artifacts: list[dict],
    var: dict[tuple[int, int], int],
    order: tuple[int, ...],
    linear_timeout_ms: int,
    replay: bool,
    comparison_variables: dict[
        tuple[tuple[int, int], tuple[int, int]], tuple[int, ...]
    ] | None = None,
) -> tuple[list[Clause], list[Clause], dict[str, int]]:
    """Replay and translate every imported geometric row-pattern nogood."""

    legacy.ORDER = order
    clauses: set[Clause] = set()
    equality_label_clauses: set[Clause] = set()
    kinds: dict[str, int] = {}
    # Parallel CEGAR shards share a long authenticated resume prefix.  Replay
    # each canonically identical certificate record once: duplicate records
    # generate the same clause and checking them again changes neither the
    # accepted theorem family nor the emitted CNF.
    seen_records: set[str] = set()
    for payload in artifacts:
        for index, record in enumerate(payload.get("learned", ())):
            fingerprint = json.dumps(record, sort_keys=True, separators=(",", ":"))
            if fingerprint in seen_records:
                continue
            seen_records.add(fingerprint)
            kind = record.get("kind")
            rows = legacy.rows_from_payload(record.get("rows", ()))
            if not rows:
                raise ValueError(f"empty learned row pattern at record {index}")

            if kind == "formalized-bank":
                recorded = record.get("record")
                if replay:
                    if isinstance(recorded, dict):
                        valid = legacy.bank_stage_present(rows, recorded)
                    else:
                        # Reauthenticated resume artifacts deliberately retain
                        # the minimized row pattern but may omit the redundant
                        # bank witness.  Reconstruct the witness from the
                        # current theorem bank instead of trusting the tag.
                        valid = bool(
                            legacy.producer_bank.scan_all_formalized_cores(
                                rows, 17, order
                            )
                        )
                    if not valid:
                        raise ValueError(
                            f"formalized-bank record {index} no longer matches"
                        )
                if (
                    comparison_variables is not None
                    and isinstance(recorded, dict)
                    and recorded.get("stage")
                    == "equality-convex-two-kalmanson-cancellation"
                ):
                    path_literals: set[int] = set()
                    core = recorded.get("core", {})
                    boundary_labels = core.get("boundary_labels", ())
                    if sorted(boundary_labels) != list(range(17)):
                        raise ValueError(
                            f"two-Kalmanson record {index} has invalid boundary labels"
                        )
                    paths = core.get("paths", ())
                    if len(paths) != 4:
                        raise ValueError(
                            f"two-Kalmanson record {index} lacks four paths"
                        )
                    for path in paths:
                        first = distance_edge(
                            *(boundary_labels[position] for position in path["first"])
                        )
                        last = distance_edge(
                            *(boundary_labels[position] for position in path["last"])
                        )
                        if first == last:
                            continue
                        comparison = tuple(sorted((first, last)))
                        xor_bits = comparison_variables.get(comparison)
                        if xor_bits is None:
                            raise ValueError(
                                "two-Kalmanson path endpoints are not a "
                                f"centered comparison: {comparison}"
                            )
                        path_literals.update(xor_bits)
                    if not path_literals:
                        raise ValueError(
                            f"two-Kalmanson record {index} has no nontrivial paths"
                        )
                    equality_label_clauses.add(tuple(sorted(path_literals)))
                # The authenticated artifact already stores the witness rows
                # emitted by the CEGAR minimizer.  Rescanning them above is the
                # fail-closed semantic check against the recorded theorem
                # family: a formalized consumer still rejects this exact row
                # pattern.  Re-minimizing here is not needed for soundness and
                # repeats many full theorem-bank scans.
                # Keeping a nonminimal witness would only emit a weaker (longer)
                # but still sound blocking clause.
            elif kind == "weighted-kalmanson":
                if replay:
                    certificate = (
                        legacy.producer_bank.certify_weighted_kalmanson_cancellation(
                            rows, 17, order, record.get("terms", ())
                        )
                    )
                    recorded_certificate = record.get("record")
                    if (
                        recorded_certificate is not None
                        and certificate != recorded_certificate
                    ):
                        raise ValueError(
                            f"weighted certificate drift at record {index}"
                        )
            elif kind == "strict-linear-core":
                if replay:
                    status, core = legacy.linear_replay_core(rows, linear_timeout_ms)
                    if status != "unsat":
                        raise ValueError(
                            f"strict-linear record {index} did not replay UNSAT: {status}"
                        )
                    rows = core
            else:
                raise ValueError(f"unsupported learned record kind: {kind!r}")

            clause = tuple(sorted({-var[row.center, point] for row in rows for point in row.support}))
            if not clause:
                raise ValueError("empty learned clause")
            clauses.add(clause)
            kinds[kind] = kinds.get(kind, 0) + 1
    return sorted(clauses), sorted(equality_label_clauses), kinds


def build_clauses(
    order_index: int,
    positions: tuple[int, int],
    artifacts: list[dict],
    linear_timeout_ms: int,
    replay_learned: bool = True,
    transitive_two_circle: bool = False,
) -> tuple[
    dict[tuple[int, int], int],
    dict[int, int],
    list[Clause],
    dict[str, int],
    dict[str, int],
    int,
    dict[str, int],
]:
    var = selected_variables()
    order = source.normalized_order(order_index, positions)

    # Reuse the audited direct-CNF translation of the common full-cover layer,
    # including every formalized static metric-pattern bank enabled by
    # ``build_case(..., all_static_cuts=True)``.  Its globals are process-local.
    base_cnf.cegar.ORDER = order
    base_cnf.cegar.NAMED_BY_CENTER = {}
    base_var = base_cnf.variable_map()
    if base_var != var:
        raise AssertionError("base/source selected-variable maps disagree")
    clauses, blocks = base_cnf.build_clauses(var, [])

    next_var = max(var.values()) + 1
    fifth_var = {
        center: next_var + offset
        for offset, center in enumerate(source.FIFTH_CENTER_CANDIDATES)
    }
    next_var = max(fifth_var.values()) + 1
    def extend(name: str, block: list[Clause]) -> None:
        clauses.extend(block)
        blocks[name] = len(block)

    shared_late_pair_clauses = [
        tuple(-var[atom] for atom in core)
        for core in shared_late_pair.increasing_cores(order)
    ]
    extend("two_rows_shared_late_pair", shared_late_pair_clauses)
    for family, generator in direct_row_consumers.INSTANCE_GENERATORS.items():
        direct_clauses = [
            tuple(-var[atom] for atom in core)
            for _witness, core in generator(order)
        ]
        extend(f"direct_{family}", direct_clauses)

    old_cap_units: list[Clause] = []
    for center, fixed_hits in source.FIXED_CAP_HITS.items():
        for point in source.SECOND_CAP:
            if point == center:
                continue
            literal = var[center, point]
            old_cap_units.append((literal if point in fixed_hits else -literal,))
    extend("old_row_cap_units", old_cap_units)

    outside_partition: list[Clause] = []
    for point in source.OUTSIDE:
        outside_partition.extend(exactly_k([
            var[center, point] for center in source.OLD_CENTERS
        ], 1))
    extend("old_row_outside_partition", outside_partition)

    fifth_exactly_one = exactly_k(list(fifth_var.values()), 1)
    extend("fifth_center_exactly_one", fifth_exactly_one)

    fifth_implications: list[Clause] = []
    for center, choice in fifth_var.items():
        fifth_implications.append((-choice, var[center, source.DELETED_SOURCE]))
        physical = [
            var[center, point]
            for point in source.PHYSICAL
            if point != center
        ]
        for left, right in combinations(physical, 2):
            fifth_implications.append((-choice, -left, -right))
    extend("fifth_row_source_and_one_hit", fifth_implications)

    transitive_metadata: dict[str, int] = {}
    comparison_variables = None
    if transitive_two_circle:
        (
            selected_equalities,
            xor_definitions,
            obstruction_clauses,
            five_point_clauses,
            comparison_variables,
            next_var,
            transitive_metadata,
        ) = transitive_two_circle_clauses(var, order, next_var)
        extend("transitive_label_selected_equality", selected_equalities)
        extend("transitive_label_xor_definition", xor_definitions)
        extend("transitive_two_circle_bisector", obstruction_clauses)
        extend("transitive_convex_five_point", five_point_clauses)

    learned, equality_label_nogoods, kinds = learned_clauses(
        artifacts,
        var,
        order,
        linear_timeout_ms,
        replay_learned,
        comparison_variables,
    )
    extend("learned_nogoods", learned)
    extend("proposal_two_kalmanson_equality_label", equality_label_nogoods)
    return (
        var,
        fifth_var,
        clauses,
        blocks,
        kinds,
        next_var - 1,
        transitive_metadata,
    )


def write_dimacs(path: Path, variable_count: int, clauses: list[Clause]) -> str:
    digest = hashlib.sha256()
    with path.open("wb") as handle:
        header = f"p cnf {variable_count} {len(clauses)}\n".encode()
        handle.write(header)
        digest.update(header)
        for clause in clauses:
            line = (" ".join(str(literal) for literal in clause) + " 0\n").encode()
            handle.write(line)
            digest.update(line)
    return digest.hexdigest()


def parse_positions(raw: str) -> tuple[int, int]:
    values = tuple(int(value) for value in raw.split(","))
    if len(values) != 2 or not (0 <= values[0] < values[1] < 8):
        raise argparse.ArgumentTypeError("expected increasing i,j in [0,8)")
    return values  # type: ignore[return-value]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument("--positions", type=parse_positions, required=True)
    parser.add_argument("--artifact", type=Path, action="append", required=True)
    parser.add_argument("--analysis", type=Path, action="append", default=[])
    parser.add_argument(
        "--weighted-certificate", type=Path, action="append", default=[]
    )
    parser.add_argument("--linear-timeout-ms", type=int, default=120_000)
    parser.add_argument("--transitive-two-circle", action="store_true")
    parser.add_argument(
        "--proposal-only-skip-learned-replay",
        action="store_true",
        help=(
            "emit a hash-pinned proposal CNF without replaying learned "
            "certificates; never use this mode as closure evidence"
        ),
    )
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()
    verify_static_schema_lean_consumers()
    starting_source_hashes = source_hash_snapshot()

    expected_artifact_schema = (
        source.TRANSITIVE_TWO_CIRCLE_SCHEMA
        if args.transitive_two_circle
        else source.SCHEMA
    )
    payloads = [
        read_artifact(
            path.resolve(),
            args.order,
            args.positions,
            expected_artifact_schema,
        )
        for path in args.artifact
    ]
    payloads.extend(
        read_analysis(path.resolve(), args.order, args.positions)
        for path in args.analysis
    )
    payloads.extend(
        read_weighted_certificate(path.resolve(), args.order, args.positions)
        for path in args.weighted_certificate
    )
    (
        _var,
        _fifth_var,
        clauses,
        blocks,
        kinds,
        variable_count,
        transitive_metadata,
    ) = build_clauses(
        args.order,
        args.positions,
        payloads,
        args.linear_timeout_ms,
        replay_learned=not args.proposal_only_skip_learned_replay,
        transitive_two_circle=args.transitive_two_circle,
    )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    digest = write_dimacs(args.output, variable_count, clauses)
    ending_source_hashes = source_hash_snapshot()
    if ending_source_hashes != starting_source_hashes:
        changed = sorted(
            name
            for name in starting_source_hashes
            if starting_source_hashes[name] != ending_source_hashes[name]
        )
        raise RuntimeError(f"source dependency drift during export: {changed}")
    manifest = {
        "schema": (
            "p97-rigid221-exact17-source-faithful-boolean-cnf-"
            "transitive-two-circle-candidate-v4"
            if args.transitive_two_circle
            else "p97-rigid221-exact17-source-faithful-boolean-cnf-candidate-v2"
        ),
        "scope": "one normalized cap-nine case; nogood soundness and Lean lift remain separate",
        "order_index": args.order,
        "anonymous_positions": list(args.positions),
        "order": list(source.normalized_order(args.order, args.positions)),
        "cnf": str(args.output.resolve().relative_to(REPO)),
        "cnf_sha256": digest,
        "variables": variable_count,
        "clauses": len(clauses),
        "clause_blocks": blocks,
        "learned_record_kinds": kinds,
        "transitive_two_circle": args.transitive_two_circle,
        "transitive_two_circle_metadata": transitive_metadata,
        "cut_admission": {
            **{
                block: {
                    "lean_consumers": list(consumers),
                    "orientation_scope": (
                        "both_cyclic_orientations_and_all_cyclic_shifts"
                    ),
                    "clauses": blocks[block],
                }
                for block, consumers in STATIC_SCHEMA_LEAN_CONSUMERS.items()
            },
            "two_rows_shared_late_pair": {
                "lean_consumer": shared_late_pair.LEAN_CONSUMER,
                "orientation_scope": "increasing_in_frozen_order_only",
                "antecedent": "selected[a,c] and selected[a,d] and selected[b,c] and selected[b,d]",
                "clauses": blocks["two_rows_shared_late_pair"],
            },
            **{
                f"direct_{family}": {
                    "lean_consumer": direct_row_consumers.LEAN_CONSUMERS[family],
                    "orientation_scope": "increasing_in_frozen_order_only",
                    "clauses": blocks[f"direct_{family}"],
                }
                for family in direct_row_consumers.INSTANCE_GENERATORS
            },
        },
        "learned_replay": (
            "skipped_proposal_only"
            if args.proposal_only_skip_learned_replay
            else "verified"
        ),
        "source_hashes": starting_source_hashes,
        "artifacts": [
            {"path": str(path.resolve().relative_to(REPO)), "sha256": sha256(path.resolve())}
            for path in args.artifact
        ],
        "analyses": [
            {"path": str(path.resolve().relative_to(REPO)), "sha256": sha256(path.resolve())}
            for path in args.analysis
        ],
        "weighted_certificates": [
            {"path": str(path.resolve().relative_to(REPO)), "sha256": sha256(path.resolve())}
            for path in args.weighted_certificate
        ],
    }
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "manifest": str(args.manifest),
        "variables": manifest["variables"],
        "clauses": manifest["clauses"],
        "learned_nogoods": blocks["learned_nogoods"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
