# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Promote the authenticated v4 FourPointTwoCircle core candidates.

The source ledger stores all positive selected-row hits.  This generator
authenticates the ledger byte-for-byte, reconstructs deterministic shortest
equality paths for the two selected FourPoint cores, and emits only the hits
used by those paths.  Missing hits are never interpreted as nonmembership.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections import deque
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
LEDGER = (
    REPO / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "refinements-sat-portfolio-v4-20260822/sat-profile-portfolio-v4/artifacts/"
    "candidate-ledger.json"
)
PARENT_BASELINE_CNF = (
    REPO / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "preparer-20260822/preparation-v1/artifacts/cells/"
    "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "next-center-02-physical-none/"
    "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "next-center-02-physical-none.cnf"
)
LEAN_OUTPUT = (
    REPO / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements.lean"
)
LEDGER_SHA256 = "a3f7e3b098e13831684d8c219d0d4e632ff9a1196f5d875e3f1b893f25ffc828"
PARENT_BASELINE_CNF_SHA256 = (
    "24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f"
)
PARENT_BASELINE_CNF_BYTES = 346_288_246
PARENT_BASELINE_NUM_VARIABLES = 308
PARENT_BASELINE_NUM_CLAUSES = 7_409_522
LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "wave-only-candidate-ledger/v2"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "wave-only-candidate/v1"
)
FAMILY = "formalized-core-bank"
EXPECTED_TOTAL_CANDIDATES = 63
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_VALID_FAMILIES = [
    FAMILY,
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
]
PARENT_ROOT_CLAUSES = 7_409_516
EXPECTED_SUFFIX_CLAUSES = 8
EXPECTED_ROOT_CLAUSES = PARENT_ROOT_CLAUSES + EXPECTED_SUFFIX_CLAUSES
EXPECTED_EXACT_DUPLICATE_MULTIPLICITIES = (0, 0, 0, 0, 0, 0, 0, 0)
EXPECTED_STRICT_SUBSUMER_MULTIPLICITIES = (0, 1, 0, 1, 0, 1, 0, 1)
EXPECTED_STRICT_NEW_CLAUSES = 4
EXPECTED_STRICT_NEW_PER_OCCURRENCE = (2, 2)
EXPECTED_LEAN_SHA256 = (
    "9dead632e9531577677700a5cd6d977ac4705e234a2bfdf9303bb5da22b3b4b0"
)
N = 17
ORDER_TABLES = (
    EXPECTED_ORDER,
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)

TOP_KEYS = {
    "candidates",
    "candidates_examined",
    "cnf_sha256",
    "complete_no_candidates",
    "decoded_selectors",
    "family_inventory",
    "job_id",
    "manifest_sha256",
    "model_sha256",
    "portfolio_cell_id",
    "producer_manifest_sha256",
    "scan_complete",
    "scanner",
    "scanner_dependencies",
    "schema",
    "source_valid_family_inventory",
    "source_valid_only",
    "status",
    "variable_map_sha256",
    "wave_manifest_sha256",
}
CANDIDATE_KEYS = {
    "candidate_id",
    "family",
    "lean_consumer",
    "payload",
    "record_sha256",
    "schema",
    "source_valid",
    "support",
}
CORE_PAYLOAD_KEYS = {"canonical_bank_record", "full_selected_row_support_replay"}
CORE_RECORD_KEYS = {
    "core",
    "cyclic_orientation",
    "lean_consumer",
    "orientation",
    "source",
    "stage",
}
EXPECTED_FAMILY_INVENTORY = {
    "complete_equality_component_counts": {
        "candidate_count": 0,
        "component_count": 85,
        "oriented_edge_count": 272,
        "pair_count": 136,
        "row_transition_count": 204,
        "unordered_edge_count": 136,
    },
    "excluded_diagnostic_stage_counts": {
        "equality-convex-two-kalmanson-cancellation": 1
    },
    "family_candidate_counts": {
        FAMILY: 4,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 59,
    },
    "formalized_stage_counts": {
        "equality-convex-eight-point-five-selected-row-kalmanson-m": 1,
        "equality-convex-four-point-two-circle-bisector-order": 1,
        "equality-convex-four-point-two-circle-bisector-order-reverse": 1,
        "equality-convex-two-kalmanson-cancellation": 1,
        "equality-duplicate-center": 1,
    },
    "two_kalmanson_pairing_counts": {
        "forward_record_count": 201,
        "minimal_forward_support_count": 59,
        "minimal_paired_union_count": 59,
        "minimal_reverse_support_count": 59,
        "paired_union_count": 1728,
        "reverse_record_count": 201,
    },
}


class PromotionError(ValueError):
    """The authenticated candidate ledger cannot be promoted."""


@dataclass(frozen=True)
class Step:
    kind: str
    center: int
    first: int
    second: int


@dataclass(frozen=True)
class CandidateSpec:
    tag: str
    consumer: str
    stage: str
    orientation: str
    physical_core: tuple[int, int, int, int]
    canonical_core: tuple[int, int, int, int]
    qu_path: tuple[Step, ...]
    uv_path: tuple[Step, ...]
    hits: tuple[tuple[int, int], ...]
    choices: tuple[tuple[int, tuple[int, ...]], ...]


@dataclass(frozen=True)
class ParentNovelty:
    """Exact duplicate and strict-subsumer multiplicities for a suffix."""

    exact_duplicate_multiplicities: tuple[int, ...]
    strict_subsumer_multiplicities: tuple[int, ...]

    @property
    def strict_new(self) -> tuple[bool, ...]:
        return tuple(
            exact == 0 and strict == 0
            for exact, strict in zip(
                self.exact_duplicate_multiplicities,
                self.strict_subsumer_multiplicities,
                strict=True,
            )
        )


EXPECTED_SPECS = {
    "candidateForward": {
        "candidate_id": (
            "formalized-core-bank:"
            "8fa04a9e5784cd6cfa9173eadf9a2039288f3aed35780c725a679c8b0037e80b"
        ),
        "record_sha256": "9a99862313b8c25feee07c7bf69be5bed637b9465560c955b6782e9b6fe4170b",
        "consumer": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
        "stage": "equality-convex-four-point-two-circle-bisector-order",
        "orientation": "forward",
        "physical_core": (12, 8, 5, 14),
        "canonical_core": (6, 2, 13, 16),
        "qu_path": (
            ("flip", 6, 13, 6),
            ("row", 13, 6, 15),
            ("flip", 13, 15, 13),
            ("row", 15, 13, 0),
            ("flip", 15, 0, 15),
            ("row", 0, 15, 1),
            ("flip", 0, 1, 0),
            ("row", 1, 0, 16),
            ("flip", 1, 16, 1),
            ("row", 16, 1, 6),
            ("flip", 16, 6, 16),
        ),
        "uv_path": (
            ("flip", 13, 2, 13),
            ("row", 2, 13, 16),
            ("flip", 2, 16, 2),
        ),
        "hits": (
            (0, 1),
            (0, 15),
            (1, 0),
            (1, 16),
            (2, 13),
            (2, 16),
            (13, 6),
            (13, 15),
            (15, 0),
            (15, 13),
            (16, 1),
            (16, 6),
        ),
    },
    "candidateReverse": {
        "candidate_id": (
            "formalized-core-bank:"
            "d756b9bcfa4bc70d953b1e8c6c42408aaac4161f3b9b776c3143b666aa271933"
        ),
        "record_sha256": "d393586c02b1c53eb481b3f3ab8917e910ac22e47771361cef134a4f1038c42e",
        "consumer": (
            "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg"
        ),
        "stage": "equality-convex-four-point-two-circle-bisector-order-reverse",
        "orientation": "reverse",
        "physical_core": (7, 2, 11, 4),
        "canonical_core": (7, 8, 3, 12),
        "qu_path": (
            ("row", 7, 3, 5),
            ("flip", 7, 5, 7),
            ("row", 5, 7, 12),
            ("flip", 5, 12, 5),
            ("row", 12, 5, 7),
            ("flip", 12, 7, 12),
        ),
        "uv_path": (
            ("flip", 3, 8, 3),
            ("row", 8, 3, 12),
            ("flip", 8, 12, 8),
        ),
        "hits": (
            (5, 7),
            (5, 12),
            (7, 3),
            (7, 5),
            (8, 3),
            (8, 12),
            (12, 5),
            (12, 7),
        ),
    },
}


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def self_hash(value: Mapping[str, Any], field: str) -> str:
    unsigned = dict(value)
    unsigned.pop(field, None)
    return sha256_bytes(canonical_json_bytes(unsigned))


def _reject_constant(value: str) -> None:
    raise PromotionError(f"non-finite JSON constant: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise PromotionError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json(raw: bytes) -> dict[str, Any]:
    try:
        value = json.loads(
            raw.decode(),
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PromotionError("candidate ledger is not strict UTF-8 JSON") from exc
    if type(value) is not dict:
        raise PromotionError("candidate ledger is not a JSON object")
    return value


def require_exact_keys(value: Any, expected: set[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != expected:
        raise PromotionError(f"{label} schema drifted")
    return value


def candidate_identity_material(candidate: Mapping[str, Any]) -> dict[str, Any]:
    return {
        key: candidate.get(key)
        for key in (
            "schema",
            "family",
            "source_valid",
            "lean_consumer",
            "support",
            "payload",
        )
    }


def candidate_id(candidate: Mapping[str, Any]) -> str:
    digest = sha256_bytes(canonical_json_bytes(candidate_identity_material(candidate)))
    return f"{candidate.get('family')}:{digest}"


def load_authenticated_ledger(path: Path = LEDGER) -> dict[str, Any]:
    if path.resolve() != LEDGER.resolve():
        raise PromotionError("candidate ledger path drifted")
    raw = path.read_bytes()
    if sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger hash drifted")
    return strict_json(raw)


def _decoded_rows(
    ledger: Mapping[str, Any],
) -> tuple[dict[int, tuple[int, ...]], dict[int, int]]:
    decoded = ledger.get("decoded_selectors")
    if (
        type(decoded) is not dict
        or decoded.get("NamedOrder") != 0
        or decoded.get("nextCenter") != 2
    ):
        raise PromotionError("decoded selector binding drifted")
    order = tuple(decoded.get("order", ()))
    if order != EXPECTED_ORDER:
        raise PromotionError("decoded named order drifted")
    raw_rows = decoded.get("rows")
    if type(raw_rows) is not dict or set(raw_rows) != {str(i) for i in range(N)}:
        raise PromotionError("decoded row universe drifted")
    physical: dict[int, tuple[int, ...]] = {}
    for center in range(N):
        support = raw_rows[str(center)]
        if (
            type(support) is not list
            or len(support) != 4
            or any(type(x) is not int for x in support)
            or support != sorted(set(support))
            or any(x < 0 or x >= N for x in support)
        ):
            raise PromotionError("decoded row support drifted")
        physical[center] = tuple(support)
    inverse = {label: position for position, label in enumerate(order)}
    canonical = {
        inverse[center]: tuple(sorted(inverse[point] for point in support))
        for center, support in physical.items()
    }
    return canonical, inverse


def _neighbors(
    edge: tuple[int, int], rows: Mapping[int, tuple[int, ...]]
) -> list[tuple[tuple[int, int], Step]]:
    first, second = edge
    result: list[tuple[tuple[int, int], Step]] = []
    if second in rows[first]:
        for point in rows[first]:
            if point != second:
                result.append(((first, point), Step("row", first, second, point)))
    result.append(((second, first), Step("flip", first, second, first)))
    return result


def shortest_path(
    rows: Mapping[int, tuple[int, ...]], start: tuple[int, int], target: tuple[int, int]
) -> tuple[Step, ...]:
    queue = deque([start])
    previous: dict[tuple[int, int], tuple[int, int] | None] = {start: None}
    action: dict[tuple[int, int], Step] = {}
    while queue:
        edge = queue.popleft()
        if edge == target:
            break
        for successor, step in _neighbors(edge, rows):
            if successor not in previous:
                previous[successor] = edge
                action[successor] = step
                queue.append(successor)
    if target not in previous:
        raise PromotionError("core equality path is unreachable")
    path: list[Step] = []
    cursor = target
    while previous[cursor] is not None:
        path.append(action[cursor])
        cursor = previous[cursor]  # type: ignore[assignment]
    path.reverse()
    return tuple(path)


def path_hits(*paths: tuple[Step, ...]) -> tuple[tuple[int, int], ...]:
    hits = {
        (step.center, point)
        for path in paths
        for step in path
        if step.kind == "row"
        for point in (step.first, step.second)
    }
    return tuple(sorted(hits))


def choices_from_hits(
    hits: tuple[tuple[int, int], ...],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    centers: dict[int, set[int]] = {}
    for center, point in hits:
        centers.setdefault(center, set()).add(point)
    return tuple(
        (center, tuple(sorted(points))) for center, points in sorted(centers.items())
    )


def _step_tuples(steps: tuple[Step, ...]) -> tuple[tuple[str, int, int, int], ...]:
    return tuple((step.kind, step.center, step.first, step.second) for step in steps)


def _validate_core_candidate(
    candidate: Mapping[str, Any],
    rows: Mapping[int, tuple[int, ...]],
    inverse: Mapping[int, int],
) -> CandidateSpec:
    matching = [
        (tag, expected)
        for tag, expected in EXPECTED_SPECS.items()
        if candidate["candidate_id"] == expected["candidate_id"]
    ]
    if len(matching) != 1:
        raise PromotionError("unexpected target formalized core")
    tag, expected = matching[0]
    payload = require_exact_keys(
        candidate["payload"], CORE_PAYLOAD_KEYS, "core payload"
    )
    record = require_exact_keys(
        payload["canonical_bank_record"], CORE_RECORD_KEYS, "core record"
    )
    if payload["full_selected_row_support_replay"] is not True:
        raise PromotionError("full selected-row replay flag drifted")
    core = record["core"]
    if type(core) is not dict or set(core) != {"Q", "U", "V", "Y"}:
        raise PromotionError("core schema drifted")
    physical_core = (core["Q"], core["V"], core["U"], core["Y"])
    if physical_core != expected["physical_core"]:
        raise PromotionError("physical core drifted")
    if (
        candidate["lean_consumer"] != expected["consumer"]
        or record["lean_consumer"] != expected["consumer"]
    ):
        raise PromotionError("formalized core consumer drifted")
    if record["stage"] != expected["stage"] or record["source"] != "common-system-bank":
        raise PromotionError("formalized core stage/source drifted")
    if (
        record["orientation"] != expected["orientation"]
        or record["cyclic_orientation"] != expected["orientation"]
    ):
        raise PromotionError("formalized core orientation drifted")
    canonical_core = tuple(inverse[x] for x in physical_core)
    if canonical_core != expected["canonical_core"]:
        raise PromotionError("physical-to-canonical core mapping drifted")
    q, v, u, y = canonical_core
    qu_path = shortest_path(rows, (q, u), (q, y))
    uv_path = shortest_path(rows, (u, v), (y, v))
    if (
        _step_tuples(qu_path) != expected["qu_path"]
        or _step_tuples(uv_path) != expected["uv_path"]
    ):
        raise PromotionError("deterministic equality path drifted")
    hits = path_hits(qu_path, uv_path)
    if hits != expected["hits"]:
        raise PromotionError("reduced source support drifted")
    for center, point in hits:
        if point not in rows[center]:
            raise PromotionError("equality path uses an unauthenticated row hit")
    if candidate["record_sha256"] != expected["record_sha256"]:
        raise PromotionError("target formalized core record identity drifted")
    return CandidateSpec(
        tag=tag,
        consumer=expected["consumer"],
        stage=expected["stage"],
        orientation=expected["orientation"],
        physical_core=physical_core,
        canonical_core=canonical_core,
        qu_path=qu_path,
        uv_path=uv_path,
        hits=hits,
        choices=choices_from_hits(hits),
    )


def validate_ledger(ledger: Mapping[str, Any]) -> tuple[CandidateSpec, CandidateSpec]:
    require_exact_keys(ledger, TOP_KEYS, "ledger")
    if (
        ledger["schema"] != LEDGER_SCHEMA
        or ledger["status"] != "COMPLETE"
        or ledger["scan_complete"] is not True
        or ledger["source_valid_only"] is not True
        or ledger["complete_no_candidates"] is not False
        or ledger["candidates_examined"] != EXPECTED_TOTAL_CANDIDATES
    ):
        raise PromotionError("ledger schema/status/count drifted")
    if ledger["manifest_sha256"] != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("ledger self-hash drifted")
    if ledger["family_inventory"] != EXPECTED_FAMILY_INVENTORY:
        raise PromotionError("family inventory drifted")
    if ledger["source_valid_family_inventory"] != EXPECTED_SOURCE_VALID_FAMILIES:
        raise PromotionError("source-valid family inventory drifted")
    candidates = ledger["candidates"]
    if type(candidates) is not list or len(candidates) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("candidate count drifted")
    target_ids = {expected["candidate_id"] for expected in EXPECTED_SPECS.values()}
    selected: list[Mapping[str, Any]] = []
    expected_family_counts = {
        FAMILY: 4,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 59,
    }
    family_counts = {family: 0 for family in expected_family_counts}
    for index, candidate in enumerate(candidates):
        require_exact_keys(candidate, CANDIDATE_KEYS, f"candidate[{index}]")
        if (
            candidate["schema"] != CANDIDATE_SCHEMA
            or candidate["source_valid"] is not True
        ):
            raise PromotionError("candidate schema/source-valid drifted")
        if candidate["record_sha256"] != self_hash(candidate, "record_sha256"):
            raise PromotionError("candidate record hash drifted")
        if candidate["candidate_id"] != candidate_id(candidate):
            raise PromotionError("candidate id drifted")
        family = candidate["family"]
        if family not in family_counts:
            raise PromotionError("unexpected candidate family")
        family_counts[family] += 1
        if candidate["candidate_id"] in target_ids:
            if family != FAMILY:
                raise PromotionError("target candidate family drifted")
            selected.append(candidate)
    if family_counts != expected_family_counts:
        raise PromotionError("candidate family counts drifted")
    if len(selected) != 2 or {x["candidate_id"] for x in selected} != target_ids:
        raise PromotionError("target candidate selection drifted")
    rows, inverse = _decoded_rows(ledger)
    full_physical_support = sorted(
        [
            [center, point]
            for center in range(N)
            for point in ledger["decoded_selectors"]["rows"][str(center)]
        ],
        key=canonical_json_bytes,
    )
    specs: list[CandidateSpec] = []
    for candidate in selected:
        if candidate["support"] != full_physical_support:
            raise PromotionError("target formalized core full support drifted")
        specs.append(_validate_core_candidate(candidate, rows, inverse))
    specs.sort(key=lambda item: item.tag)
    if [item.tag for item in specs] != ["candidateForward", "candidateReverse"]:
        raise PromotionError("target candidate order drifted")
    return specs[0], specs[1]


def oriented_label(order: int, direction: int, index: int) -> int:
    """Transport a positional label into one named order/orientation."""

    position = index if direction == 0 else N - 1 - index
    return ORDER_TABLES[order][position]


def orbit_clauses(hits: tuple[tuple[int, int], ...]) -> tuple[tuple[int, ...], ...]:
    """Render the four DIMACS clauses emitted by Lean's `occurrenceClauses`."""

    clauses = []
    for order in range(2):
        for direction in range(2):
            literals = [-307 - order]
            literals.extend(
                -(
                    1
                    + oriented_label(order, direction, center) * N
                    + oriented_label(order, direction, point)
                )
                for center, point in hits
            )
            clauses.append(tuple(literals))
    result = tuple(clauses)
    if len(set(result)) != 4:
        raise PromotionError("candidate occurrence does not have a full clause orbit")
    return result


def render_dimacs_suffix(
    candidates: tuple[CandidateSpec, CandidateSpec],
) -> tuple[tuple[int, ...], ...]:
    """Render the eight clauses in the same candidate/orbit order as Lean."""

    suffix = tuple(
        clause for candidate in candidates for clause in orbit_clauses(candidate.hits)
    )
    if len(suffix) != EXPECTED_SUFFIX_CLAUSES or len(set(suffix)) != len(suffix):
        raise PromotionError("rendered DIMACS suffix cardinality or uniqueness drifted")
    return suffix


def classify_parent_novelty(
    parent_cnf: Path,
    suffix: tuple[tuple[int, ...], ...],
    *,
    expected_sha256: str,
    expected_bytes: int,
    expected_num_variables: int,
    expected_num_clauses: int,
) -> ParentNovelty:
    """Authenticate and stream a DIMACS parent while classifying the suffix."""

    if not parent_cnf.is_file() or parent_cnf.is_symlink():
        raise PromotionError("parent baseline DIMACS is not a regular file")
    if parent_cnf.stat().st_size != expected_bytes:
        raise PromotionError("parent baseline DIMACS byte length drifted")
    target_sets = tuple(frozenset(clause) for clause in suffix)
    if any(
        len(clause) != len(target)
        for clause, target in zip(suffix, target_sets, strict=True)
    ):
        raise PromotionError("candidate suffix contains duplicate literals")
    literal_masks: dict[int, int] = {}
    for index, clause in enumerate(target_sets):
        bit = 1 << index
        for literal in clause:
            literal_masks[literal] = literal_masks.get(literal, 0) | bit
    exact = [0] * len(suffix)
    strict = [0] * len(suffix)
    digest = hashlib.sha256()
    header_seen = False
    physical_clause_count = 0
    all_targets_mask = (1 << len(suffix)) - 1
    with parent_cnf.open("rb") as handle:
        for raw_line in handle:
            digest.update(raw_line)
            stripped = raw_line.strip()
            if not stripped or stripped.startswith(b"c"):
                continue
            if stripped.startswith(b"p"):
                if header_seen or physical_clause_count:
                    raise PromotionError(
                        "parent baseline DIMACS header placement drifted"
                    )
                fields = stripped.split()
                if fields != [
                    b"p",
                    b"cnf",
                    str(expected_num_variables).encode(),
                    str(expected_num_clauses).encode(),
                ]:
                    raise PromotionError("parent baseline DIMACS header drifted")
                header_seen = True
                continue
            if not header_seen:
                raise PromotionError("parent baseline DIMACS clause precedes header")
            fields = stripped.split()
            if not fields or fields[-1] != b"0" or b"0" in fields[:-1]:
                raise PromotionError("parent baseline DIMACS clause is malformed")
            try:
                literals = tuple(int(field) for field in fields[:-1])
            except ValueError as error:
                raise PromotionError(
                    "parent baseline DIMACS clause contains a non-integer literal"
                ) from error
            if any(
                literal == 0 or abs(literal) > expected_num_variables
                for literal in literals
            ):
                raise PromotionError("parent baseline DIMACS literal is out of range")
            literal_set = frozenset(literals)
            physical_clause_count += 1
            mask = all_targets_mask
            for literal in literal_set:
                mask &= literal_masks.get(literal, 0)
                if mask == 0:
                    break
            while mask:
                low_bit = mask & -mask
                index = low_bit.bit_length() - 1
                if len(literal_set) == len(target_sets[index]):
                    exact[index] += 1
                elif len(literal_set) < len(target_sets[index]):
                    strict[index] += 1
                mask ^= low_bit
    if not header_seen:
        raise PromotionError("parent baseline DIMACS header is missing")
    if physical_clause_count != expected_num_clauses:
        raise PromotionError("parent baseline DIMACS physical clause count drifted")
    if digest.hexdigest() != expected_sha256:
        raise PromotionError("parent baseline DIMACS byte hash drifted")
    return ParentNovelty(tuple(exact), tuple(strict))


def verify_authenticated_parent_novelty(
    candidates: tuple[CandidateSpec, CandidateSpec],
) -> ParentNovelty:
    """Fail closed unless the pinned production baseline reproduces the census."""

    if PARENT_BASELINE_CNF.resolve(strict=True) != (
        REPO
        / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "preparer-20260822/preparation-v1/artifacts/cells/"
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none/"
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none.cnf"
    ).resolve(strict=True):
        raise PromotionError("parent baseline DIMACS path drifted")
    novelty = classify_parent_novelty(
        PARENT_BASELINE_CNF,
        render_dimacs_suffix(candidates),
        expected_sha256=PARENT_BASELINE_CNF_SHA256,
        expected_bytes=PARENT_BASELINE_CNF_BYTES,
        expected_num_variables=PARENT_BASELINE_NUM_VARIABLES,
        expected_num_clauses=PARENT_BASELINE_NUM_CLAUSES,
    )
    if (
        novelty.exact_duplicate_multiplicities
        != EXPECTED_EXACT_DUPLICATE_MULTIPLICITIES
        or novelty.strict_subsumer_multiplicities
        != EXPECTED_STRICT_SUBSUMER_MULTIPLICITIES
    ):
        raise PromotionError("parent baseline exact/subsumer census drifted")
    strict_new_per_occurrence = tuple(
        sum(novelty.strict_new[index : index + 4]) for index in range(0, 8, 4)
    )
    if (
        sum(novelty.strict_new) != EXPECTED_STRICT_NEW_CLAUSES
        or strict_new_per_occurrence != EXPECTED_STRICT_NEW_PER_OCCURRENCE
    ):
        raise PromotionError("parent baseline strict-new census drifted")
    return novelty


def _lean_pairs(items: tuple[tuple[int, int], ...]) -> str:
    rendered = [f"({a}, {b})" for a, b in items]
    lines = [
        ", ".join(rendered[index : index + 6]) for index in range(0, len(rendered), 6)
    ]
    return "[" + ",\n    ".join(lines) + "]"


def _lean_choices(items: tuple[tuple[int, tuple[int, ...]], ...]) -> str:
    rendered = []
    for center, support in items:
        points = ", ".join(str(point) for point in support)
        rendered.append(f"{{ center := {center}, support := {{{points}}} }}")
    return "[" + ",\n    ".join(rendered) + "]"


def _reflect_choices(
    items: tuple[tuple[int, tuple[int, ...]], ...],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(
        sorted(
            (N - 1 - center, tuple(sorted(N - 1 - x for x in support)))
            for center, support in items
        )
    )


def _reflect_step(step: Step) -> Step:
    return Step(step.kind, N - 1 - step.center, N - 1 - step.first, N - 1 - step.second)


def _lean_steps(steps: tuple[Step, ...]) -> str:
    parts = []
    for step in steps:
        if step.kind == "row":
            parts.append(f".row {step.center} {step.first} {step.second}")
        else:
            parts.append(f".flip {step.center} {step.first}")
    return "[\n      " + ",\n      ".join(parts) + "]"


def _render_candidate_data(spec: CandidateSpec) -> str:
    reflected_choices = _reflect_choices(spec.choices)
    rq, rv, ru, ry = (N - 1 - x for x in spec.canonical_core)
    q, v, u, y = spec.canonical_core
    reflected_qu = tuple(_reflect_step(step) for step in spec.qu_path)
    reflected_uv = tuple(_reflect_step(step) for step in spec.uv_path)
    return f"""
def {spec.tag}Hits : List Hit :=
  {_lean_pairs(spec.hits)}

def {spec.tag}ForwardChoices : List (RowChoice Label) :=
  {_lean_choices(spec.choices)}

def {spec.tag}ReflectedChoices : List (RowChoice Label) :=
  {_lean_choices(reflected_choices)}

theorem {spec.tag}ForwardCover :
    ∀ choice ∈ {spec.tag}ForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ {spec.tag}Hits := by
  decide

theorem {spec.tag}ReflectedCover :
    ∀ choice ∈ {spec.tag}ReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ {spec.tag}Hits := by
  decide

private def {spec.tag}ForwardCore {{P : RowPattern Label}}
    (hrows : PositiveRowsMatch P {spec.tag}ForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {{
  q := {q}
  v := {v}
  u := {u}
  y := {y}
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨({q}, {u}), {_lean_steps(spec.qu_path)}, ({q}, {y})⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨({u}, {v}), {_lean_steps(spec.uv_path)}, ({y}, {v})⟩ (by decide) }}

private def {spec.tag}ReflectedCore {{P : RowPattern Label}}
    (hrows : PositiveRowsMatch P {spec.tag}ReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {{
  q := {rq}
  v := {rv}
  u := {ru}
  y := {ry}
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨({rq}, {ru}), {_lean_steps(reflected_qu)}, ({rq}, {ry})⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨({ru}, {rv}), {_lean_steps(reflected_uv)}, ({ry}, {rv})⟩ (by decide) }}
"""


LEAN_PREAMBLE = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

/-!
# Source-valid FourPointTwoCircle refinements from the exact-seventeen v4 ledger

The authenticated v4 survivor supplies two further instances of the
cardinality-generic two-circle same-side obstruction.  The source adapter keeps
only the positive selected-row hits on deterministic shortest equality paths.

Source: `candidate-ledger.json`, raw SHA-256
`a3f7e3b098e13831684d8c219d0d4e632ff9a1196f5d875e3f1b893f25ffc828`.
The promoted records are `8fa04a9e…` at canonical core `(6,2,13,16)` and
`d756b9bc…` at canonical core `(7,8,3,12)`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring
"""


LEAN_POSTAMBLE = f"""
private theorem false_of_candidateForwardForwardRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateForwardForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateForwardForwardCore hrows)
  · change 0 < signedArea2 (pointOf 13) (pointOf 6) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (6 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 16) (pointOf 6) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (6 : Label)) (k := (16 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateForwardReflectedRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateForwardReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateForwardReflectedCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (10 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (0 : Label)) (j := (10 : Label)) (k := (14 : Label))
      (by decide) (by decide)

private theorem false_of_candidateReverseForwardRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateReverseForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateReverseForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (3 : Label)) (j := (7 : Label)) (k := (8 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 12) (pointOf 7) (pointOf 8) < 0
    rw [← signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (7 : Label)) (j := (8 : Label)) (k := (12 : Label))
      (by decide) (by decide)

private theorem false_of_candidateReverseReflectedRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateReverseReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateReverseReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 13) (pointOf 9) (pointOf 8)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (8 : Label)) (j := (9 : Label)) (k := (13 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 4) (pointOf 9) (pointOf 8)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (8 : Label)) (k := (9 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateForwardHits {{A : Finset ℝ²}}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateForwardHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateForwardForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateForwardHits
        candidateForwardForwardChoices candidateForwardForwardCover hall)
  · exact false_of_candidateForwardReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateForwardHits
        candidateForwardReflectedChoices candidateForwardReflectedCover hall)

private theorem false_of_candidateReverseHits {{A : Finset ℝ²}}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateReverseHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateReverseForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateReverseHits
        candidateReverseForwardChoices candidateReverseForwardCover hall)
  · exact false_of_candidateReverseReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateReverseHits
        candidateReverseReflectedChoices candidateReverseReflectedCover hall)

def candidateForwardClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateForwardHits order direction

def candidateReverseClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateReverseHits order direction

def candidateForwardClauses : Std.Sat.CNF Atom := occurrenceClauses candidateForwardHits

def candidateReverseClauses : Std.Sat.CNF Atom := occurrenceClauses candidateReverseHits

theorem sourceAssign_candidateForwardClause {{A : Finset ℝ²}}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateForwardClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateForwardHits source order direction horder.symm hall

theorem sourceAssign_candidateReverseClause {{A : Finset ℝ²}}
    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateReverseClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateReverseHits source order direction horder.symm hall

private theorem sourceAssign_occurrenceClauses {{A : Finset ℝ²}}
    (source : SourceRealization A) (hits : List Hit)
    (hvalid : ∀ order direction,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model)
        (occurrenceClause hits order direction) = true) :
    ∀ clause ∈ occurrenceClauses hits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact hvalid order direction

def fourPointTwoCircleV4CoreRefinementClauses : Std.Sat.CNF Atom :=
  candidateForwardClauses ++ candidateReverseClauses

set_option linter.style.nativeDecide false in
theorem fourPointTwoCircleV4CoreRefinementClauses_length :
    fourPointTwoCircleV4CoreRefinementClauses.length = {EXPECTED_SUFFIX_CLAUSES} := by
  native_decide

set_option linter.style.nativeDecide false in
theorem fourPointTwoCircleV4CoreRefinementClauses_nodup :
    fourPointTwoCircleV4CoreRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_fourPointTwoCircleV4CoreRefinementClauses {{A : Finset ℝ²}}
    (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleV4CoreRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  rcases List.mem_append.mp hclause with hforward | hreverse
  · exact sourceAssign_occurrenceClauses source candidateForwardHits
      (sourceAssign_candidateForwardClause source) clause hforward
  · exact sourceAssign_occurrenceClauses source candidateReverseHits
      (sourceAssign_candidateReverseClause source) clause hreverse

def canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    fourPointTwoCircleV4CoreRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf.length =
      {EXPECTED_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    fourPointTwoCircleV4CoreRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf
    {{A : Finset ℝ²}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleV4CoreRefinementClauses source clause hsuffix

#print axioms sourceAssign_candidateForwardClause
#print axioms sourceAssign_candidateReverseClause
#print axioms fourPointTwoCircleV4CoreRefinementClauses_nodup
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements
end Problem97
"""


def render_lean(ledger: Mapping[str, Any]) -> str:
    candidate_forward, candidate_reverse = validate_ledger(ledger)
    return (
        LEAN_PREAMBLE
        + _render_candidate_data(candidate_forward)
        + _render_candidate_data(candidate_reverse)
        + LEAN_POSTAMBLE
    )


def write_text_once(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() or path.is_symlink():
        raise FileExistsError(f"immutable publication target exists: {path}")
    descriptor, staged_name = tempfile.mkstemp(
        prefix=f".{path.name}.stage-", dir=path.parent
    )
    staged = Path(staged_name)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(content.encode())
            handle.flush()
            os.fsync(handle.fileno())
        os.link(staged, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        staged.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--lean-output", type=Path, default=LEAN_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    candidates = validate_ledger(ledger)
    novelty = verify_authenticated_parent_novelty(candidates)
    rendered = render_lean(ledger)
    if EXPECTED_LEAN_SHA256 and sha256_bytes(rendered.encode()) != EXPECTED_LEAN_SHA256:
        raise PromotionError("rendered Lean hash drifted")
    if args.check:
        if not args.lean_output.is_file() or args.lean_output.read_text() != rendered:
            raise PromotionError("checked Lean output drifted")
        print(
            f"PASS {args.lean_output}: 2 candidates, {EXPECTED_SUFFIX_CLAUSES} new "
            f"clauses, {EXPECTED_STRICT_NEW_CLAUSES} strict-new against the "
            f"physical-none baseline, {EXPECTED_ROOT_CLAUSES} root clauses; "
            f"exact={novelty.exact_duplicate_multiplicities}, "
            f"strict={novelty.strict_subsumer_multiplicities}"
        )
        return 0
    write_text_once(args.lean_output, rendered)
    print(
        f"generated {args.lean_output}: 2 candidates, {EXPECTED_SUFFIX_CLAUSES} new "
        f"clauses, {EXPECTED_STRICT_NEW_CLAUSES} strict-new against the "
        f"physical-none baseline, {EXPECTED_ROOT_CLAUSES} root clauses; "
        f"exact={novelty.exact_duplicate_multiplicities}, "
        f"strict={novelty.strict_subsumer_multiplicities}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
