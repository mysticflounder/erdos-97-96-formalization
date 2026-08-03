#!/usr/bin/env python3
"""Deterministic, source-faithful CNF export for crossed-arm CEGAR v9/v7.

This module deliberately has no dependency on Z3 or on the discovery lane under
``scratch``.  It reconstructs the frozen n=17 Boolean/incidence/order formula
directly.  A generated CNF is an input formula for a later proof-producing SAT
run; neither an UNKNOWN checkpoint nor this exporter is an UNSAT certificate.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import math
import os
import tempfile
from collections import Counter
from collections.abc import Iterable, Iterator, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

RESULT_SCHEMA = "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v9"
CUT_SCHEMA = "n17-crossed-arm-learned-cuts-v7"
PACKAGE_SCHEMA = "p97-crossed-arm-cegar-v9-cnf-package-v1"
VARIABLE_SCHEMA = "p97-crossed-arm-cegar-v9-variable-registry-v1"
PROVENANCE_SCHEMA = "p97-crossed-arm-cegar-v9-clause-provenance-v1"
LEARNED_CUTS_PACKAGE_SCHEMA = "p97-crossed-arm-cegar-v9-learned-cuts-v1"
CRITICAL_NO_K4_TRIPLE_CLAUSES = "triple-clauses"
CRITICAL_NO_K4_COMPACT_PB = "compact-pb"
CRITICAL_NO_K4_REPRESENTATIONS = (
    CRITICAL_NO_K4_TRIPLE_CLAUSES,
    CRITICAL_NO_K4_COMPACT_PB,
)
# Historical omission/omission checkpoints mean this fixed legacy value; this
# must never follow a mutable discovery-lane default.
CRITICAL_NO_K4_REPRESENTATION = CRITICAL_NO_K4_TRIPLE_CLAUSES
EXPORTED_CRITICAL_NO_K4_REPRESENTATION = CRITICAL_NO_K4_TRIPLE_CLAUSES

N = 17
PROFILE = (6, 8, 6)
ARMS = ("source-at-common", "other-at-common")
NAMES = (
    "a1", "t1", "t2", "t3", "t4", "a2", "p1", "p2", "r1",
    "r2", "q1", "q2", "a3", "s1", "s2", "s3", "s4",
)
ID = {name: index for index, name in enumerate(NAMES)}
VS = tuple(range(N))
A1, A2, A3 = (ID[name] for name in ("a1", "a2", "a3"))
PRECEDING_INTERIOR = tuple(ID[name] for name in ("t1", "t2", "t3", "t4"))
FIRST_INTERIOR = tuple(ID[name] for name in ("p1", "p2", "r1", "r2", "q1", "q2"))
FOLLOWING_INTERIOR = tuple(ID[name] for name in ("s1", "s2", "s3", "s4"))
FIRST_CAP = frozenset((A2, *FIRST_INTERIOR, A3))
OUTSIDE_FIRST = tuple(point for point in VS if point not in FIRST_CAP)
PAIR_P = (ID["p1"], ID["p2"])
PAIR_R = (ID["r1"], ID["r2"])
PAIR_Q = (ID["q1"], ID["q2"])

DELETION_ARM_SPECS = (
    ("delete-P.source1", ID["p1"], ID["r1"]),
    ("delete-Prho.source1", ID["r1"], ID["p1"]),
    ("delete-P.source2", ID["p2"], ID["r1"]),
    ("delete-Prho.source2", ID["r2"], ID["p1"]),
)

BASE_STRUCTURAL_FAMILIES = ("shared_pair", "circle", "bisector")
STRUCTURAL_FAMILIES = (
    *BASE_STRUCTURAL_FAMILIES,
    "raw_btw_sep",
    "mutual_bisector_transport",
)

FAMILIES = {
    "first": {"arity": 5, "rows": ((1, (0, 4)), (2, (0, 1, 3)))},
    "second": {"arity": 5, "rows": ((3, (0, 2, 4)), (4, (0, 1)))},
    "reversed_second": {"arity": 5, "rows": ((1, (0, 2, 4)), (0, (3, 4)))},
}

KALMANSON_FAMILIES = {
    "kalmanson_013_412_523": {
        "arity": 6, "equalities": ((0, 1, 3), (4, 1, 2), (5, 2, 3)),
    },
    "kalmanson_012_325_415": {
        "arity": 6, "equalities": ((0, 1, 2), (3, 2, 5), (4, 1, 5)),
    },
    "kalmanson_012_124_314": {
        "arity": 5, "equalities": ((0, 1, 2), (1, 2, 4), (3, 1, 4)),
    },
    "kalmanson_013_235_415": {
        "arity": 6, "equalities": ((0, 1, 3), (2, 3, 5), (4, 1, 5)),
    },
}

LINEAR_ROW_FAMILIES = {
    "five_kalmanson_three_selected_rows": {
        "arity": 5, "rows": ((2, (0, 3)), (0, (3, 4)), (1, (4, 0))),
    },
    "five_circle_isosceles_two_selected_rows": {
        "arity": 5, "rows": ((0, (1, 3, 4)), (4, (2, 3))),
    },
    "six_sparse_two_selected_rows": {
        "arity": 6, "rows": ((0, (1, 3, 5)), (2, (1, 3, 4))),
    },
    "six_k2_three_row_triangle": {
        "arity": 6, "rows": ((0, (3, 5)), (1, (4, 5)), (2, (3, 4))),
    },
}

RAW_EQUALITY_FAMILIES = {
    "five_kalmanson_three_shell_equalities": {
        "arity": 5, "equalities": ((2, 0, 3), (0, 3, 4), (1, 4, 0)),
    },
    "four_endpoint_centers_bisect_middle_pair": {
        "arity": 4, "equalities": ((0, 1, 2), (3, 1, 2)),
    },
    "four_middle_centers_bisect_endpoint_pair": {
        "arity": 4, "equalities": ((1, 0, 3), (2, 0, 3)),
    },
    "five_second_three_row_equalities": {
        "arity": 5, "equalities": ((3, 0, 2), (3, 2, 4), (4, 0, 1)),
    },
    "five_direct_three_row_equalities": {
        "arity": 5, "equalities": ((1, 0, 4), (2, 0, 1), (2, 0, 3)),
    },
}

SIX_POINT_EQUALITY_FAMILIES = {
    "six_sparse_row_equalities": {
        "arity": 6,
        "equalities": ((0, 1, 3), (0, 1, 5), (2, 1, 3), (2, 1, 4)),
    },
    "six_main_row_equalities": {
        "arity": 6,
        "equalities": ((0, 1, 5), (0, 3, 5), (3, 0, 1), (2, 1, 4), (2, 3, 4)),
    },
    "six_mirror_interleaving_equalities": {
        "arity": 6,
        "equalities": ((0, 1, 5), (0, 2, 4), (3, 0, 2), (3, 0, 4), (4, 1, 5)),
    },
    "six_two_triple_row_equalities": {
        "arity": 6,
        "equalities": ((1, 0, 2), (1, 0, 3), (5, 0, 3), (5, 0, 4)),
    },
}

CONVEX_FIVE_POINT_FAMILY = "convex_five_point_core"
CONVEX_FIVE_POINT_SCHEMA = {
    "arity": 5,
    "equalities": ((1, 0, 2), (4, 0, 2), (3, 2, 1), (3, 2, 4)),
}
GLOBAL_KALMANSON_FAMILY = "global_kalmanson_14role_16eq"
GLOBAL_KALMANSON_SCHEMA = {
    "arity": 14,
    "equalities": (
        (0, 3, 9), (0, 3, 6), (0, 4, 7), (0, 1, 13),
        (0, 11, 8), (0, 11, 12), (1, 0, 2), (1, 0, 11),
        (1, 0, 13), (2, 4, 5), (2, 4, 9), (3, 1, 12),
        (4, 2, 5), (6, 1, 7), (7, 0, 6), (12, 3, 8),
    ),
}

FULL_BANK_FAMILIES = (
    "first", "second", "reversed_second",
    "kalmanson_013_412_523", "kalmanson_012_325_415",
    "kalmanson_012_124_314", "kalmanson_013_235_415",
    "five_kalmanson_three_selected_rows",
    "five_circle_isosceles_two_selected_rows",
    "six_sparse_two_selected_rows", "six_k2_three_row_triangle",
    "five_kalmanson_three_shell_equalities",
    "four_endpoint_centers_bisect_middle_pair",
    "four_middle_centers_bisect_endpoint_pair",
    "five_second_three_row_equalities", "five_direct_three_row_equalities",
    "six_sparse_row_equalities", "six_main_row_equalities",
    "six_mirror_interleaving_equalities",
    "six_two_triple_row_equalities",
    CONVEX_FIVE_POINT_FAMILY, GLOBAL_KALMANSON_FAMILY,
)

SUBSUMED_THEOREM_CUT_FAMILIES = {
    "five_kalmanson_three_selected_rows": "five_kalmanson_three_shell_equalities",
    "six_sparse_two_selected_rows": "six_sparse_row_equalities",
}

MOVABLE_BLOCKS = (PRECEDING_INTERIOR, FIRST_INTERIOR, FOLLOWING_INTERIOR)
BLOCK_SEQUENCE = (
    (A1,), PRECEDING_INTERIOR, (A2,), FIRST_INTERIOR, (A3,), FOLLOWING_INTERIOR,
)
POINT_BLOCK = {
    point: block_index
    for block_index, block in enumerate(BLOCK_SEQUENCE)
    for point in block
}
MOVABLE_BLOCK_BY_POINT = {
    point: block for block in MOVABLE_BLOCKS for point in block
}
EDGES = tuple(itertools.combinations(VS, 2))
EDGE_INDEX = {edge: index for index, edge in enumerate(EDGES)}
EDGE_CLASS_BITS = math.ceil(math.log2(len(EDGES)))


class EncodingError(ValueError):
    """A source checkpoint or generated package failed closed validation."""


Atom = int | bool


def canonical_json_bytes(value: Any) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("ascii")


def compact_json_bytes(value: Any) -> bytes:
    return json.dumps(value, separators=(",", ":"), sort_keys=True).encode("ascii")


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def sha256_path(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


@dataclass(frozen=True, slots=True)
class Variable:
    id: int
    family: str
    args: tuple[int | str, ...]
    name: str


class VariableRegistry:
    """Insertion-ordered registry with a frozen, one-based DIMACS numbering."""

    def __init__(self) -> None:
        self._ids: dict[tuple[Any, ...], int] = {}
        self._variables: list[Variable] = []
        self._frozen = False

    def register(self, family: str, *args: int | str) -> int:
        if self._frozen:
            raise EncodingError(("variable-registry-frozen", family, args))
        key = (family, *args)
        if key in self._ids:
            raise EncodingError(("duplicate-variable-key", key))
        variable_id = len(self._variables) + 1
        rendered = ",".join(str(arg) for arg in args)
        variable = Variable(variable_id, family, tuple(args), f"{family}({rendered})")
        self._ids[key] = variable_id
        self._variables.append(variable)
        return variable_id

    def get(self, family: str, *args: int | str) -> int:
        try:
            return self._ids[(family, *args)]
        except KeyError as exc:
            raise EncodingError(("unregistered-variable", family, args)) from exc

    def freeze(self) -> None:
        self._frozen = True

    @property
    def variables(self) -> tuple[Variable, ...]:
        return tuple(self._variables)

    @property
    def count(self) -> int:
        return len(self._variables)

    def family_ranges(self) -> list[dict[str, Any]]:
        ranges: list[dict[str, Any]] = []
        for variable in self._variables:
            if ranges and ranges[-1]["family"] == variable.family:
                ranges[-1]["last"] = variable.id
                ranges[-1]["count"] += 1
            else:
                ranges.append({
                    "family": variable.family,
                    "first": variable.id,
                    "last": variable.id,
                    "count": 1,
                })
        return ranges


@dataclass(frozen=True, slots=True)
class Clause:
    origin: str
    literals: tuple[int, ...]


class ClauseLedger:
    """Canonical unique-clause ledger with duplicate provenance aliases."""

    def __init__(self) -> None:
        self.clauses: list[Clause] = []
        self._seen: dict[tuple[int, ...], int] = {}
        self.aliases: list[dict[str, Any]] = []
        self.omitted_tautologies: Counter[str] = Counter()
        self.origin_metadata: dict[str, dict[str, Any]] = {}

    @staticmethod
    def canonical_literals(literals: Iterable[Atom]) -> tuple[int, ...] | None:
        polarities: dict[int, int] = {}
        for literal in literals:
            if type(literal) is bool:
                if literal:
                    return None
                continue
            if type(literal) is not int or literal == 0:
                raise EncodingError(("invalid-literal", literal))
            variable = abs(literal)
            sign = 1 if literal > 0 else -1
            previous = polarities.get(variable)
            if previous is not None and previous != sign:
                return None
            polarities[variable] = sign
        return tuple(polarities[var] * var for var in sorted(polarities))

    def declare_origin(self, origin: str, **metadata: Any) -> None:
        if origin in self.origin_metadata and self.origin_metadata[origin] != metadata:
            raise EncodingError(("origin-metadata-drift", origin))
        self.origin_metadata[origin] = metadata

    def add(self, origin: str, literals: Iterable[Atom]) -> int | None:
        canonical = self.canonical_literals(literals)
        if canonical is None:
            self.omitted_tautologies[origin] += 1
            return None
        previous = self._seen.get(canonical)
        if previous is not None:
            self.aliases.append({"clause": previous, "origin": origin})
            return previous
        clause_id = len(self.clauses) + 1
        self._seen[canonical] = clause_id
        self.clauses.append(Clause(origin, canonical))
        return clause_id

    @property
    def count(self) -> int:
        return len(self.clauses)

    def provenance_ranges(self) -> list[dict[str, Any]]:
        ranges: list[dict[str, Any]] = []
        for clause_id, clause in enumerate(self.clauses, 1):
            if ranges and ranges[-1]["origin"] == clause.origin:
                ranges[-1]["last"] = clause_id
                ranges[-1]["count"] += 1
            else:
                ranges.append({
                    "origin": clause.origin,
                    "first": clause_id,
                    "last": clause_id,
                    "count": 1,
                })
        return ranges


@dataclass
class Encoding:
    arm: str
    force_shared_fourth: bool
    variables: VariableRegistry = field(default_factory=VariableRegistry)
    ledger: ClauseLedger = field(default_factory=ClauseLedger)
    phase_ranges: list[dict[str, Any]] = field(default_factory=list)
    learned_cut_ranges: list[dict[str, Any]] = field(default_factory=list)
    base_complete: bool = False
    learned_complete: bool = False
    checkpoint: FrozenCheckpoint | None = None  # type: ignore[name-defined]

    @contextmanager
    def phase(self, name: str) -> Iterator[None]:
        first = self.ledger.count + 1
        yield
        last = self.ledger.count
        self.phase_ranges.append({
            "phase": name,
            "first": first if last >= first else None,
            "last": last if last >= first else None,
            "count": max(0, last - first + 1),
        })


@dataclass(frozen=True)
class FrozenCheckpoint:
    payload: Mapping[str, Any]
    source_name: str
    raw_sha256: str
    byte_count: int
    arm: str
    force_shared_fourth: bool
    status: str
    critical_no_k4_representation: str
    critical_no_k4_representation_records: tuple[str, ...]
    connectivity: tuple[tuple[int, ...], ...]
    structural: tuple[tuple[Any, ...], ...]
    theorem: tuple[tuple[Any, ...], ...]
    cuts_sha256: str


SPEC_BINDING = {
    "result_schema": RESULT_SCHEMA,
    "cut_schema": CUT_SCHEMA,
    "n": N,
    "profile": list(PROFILE),
    "names": list(NAMES),
    "arms": list(ARMS),
    "accepted_source_critical_no_K4_representations": list(
        CRITICAL_NO_K4_REPRESENTATIONS
    ),
    "exported_critical_no_K4_representation": (
        EXPORTED_CRITICAL_NO_K4_REPRESENTATION
    ),
    "structural_families": list(STRUCTURAL_FAMILIES),
    "theorem_families": list(FULL_BANK_FAMILIES),
    "theorem_schemas": {
        **FAMILIES,
        **KALMANSON_FAMILIES,
        **LINEAR_ROW_FAMILIES,
        **RAW_EQUALITY_FAMILIES,
        **SIX_POINT_EQUALITY_FAMILIES,
        CONVEX_FIVE_POINT_FAMILY: CONVEX_FIVE_POINT_SCHEMA,
        GLOBAL_KALMANSON_FAMILY: GLOBAL_KALMANSON_SCHEMA,
    },
    "edge_equivalence": {
        "carrier_edge_count": len(EDGES),
        "class_label_bits": EDGE_CLASS_BITS,
        "relation": "EdgeEq iff all canonical class-label bits agree",
    },
}
SPEC_SHA256 = sha256_bytes(compact_json_bytes(SPEC_BINDING))


def _json_without_duplicate_keys(payload: bytes, *, label: str) -> Any:
    def object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise EncodingError(("duplicate-json-key", label, key))
            result[key] = value
        return result

    try:
        text = payload.decode("utf-8")
        return json.loads(text, object_pairs_hook=object_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise EncodingError(("invalid-json", label, str(exc))) from exc


def _strict_int(value: Any, *, label: str) -> int:
    if type(value) is not int:
        raise EncodingError((label, "expected-integer", value))
    return value


def _vertex_tuple(
    value: Any,
    *,
    label: str,
    size: int | None = None,
    allow_full: bool = True,
) -> tuple[int, ...]:
    if not isinstance(value, list):
        raise EncodingError((label, "expected-list", type(value).__name__))
    points = tuple(_strict_int(point, label=label) for point in value)
    if size is not None and len(points) != size:
        raise EncodingError((label, "wrong-arity", size, points))
    if any(point < 0 or point >= N for point in points):
        raise EncodingError((label, "vertex-out-of-range", points))
    if len(set(points)) != len(points):
        raise EncodingError((label, "duplicate-vertex", points))
    if not allow_full and (not points or len(points) == N):
        raise EncodingError((label, "trivial-connectivity-cut", points))
    return points


def theorem_family_arity(family: str) -> int:
    for registry in (
        FAMILIES,
        KALMANSON_FAMILIES,
        LINEAR_ROW_FAMILIES,
        RAW_EQUALITY_FAMILIES,
        SIX_POINT_EQUALITY_FAMILIES,
    ):
        if family in registry:
            return int(registry[family]["arity"])
    if family == CONVEX_FIVE_POINT_FAMILY:
        return int(CONVEX_FIVE_POINT_SCHEMA["arity"])
    if family == GLOBAL_KALMANSON_FAMILY:
        return int(GLOBAL_KALMANSON_SCHEMA["arity"])
    raise EncodingError(("unknown-theorem-family", family))


def _validate_structural_key(value: Any) -> tuple[Any, ...]:
    if not isinstance(value, list) or not value or value[0] not in STRUCTURAL_FAMILIES:
        raise EncodingError(("invalid-structural-cut-key", value))
    kind = value[0]
    expected_size = {
        "circle": 5,
        "shared_pair": 4,
        "bisector": 5,
        "raw_btw_sep": 4,
        "mutual_bisector_transport": 3,
    }[kind]
    points = _vertex_tuple(value[1:], label=f"structural:{kind}", size=expected_size)
    key = (kind, *points)
    if kind == "mutual_bisector_transport":
        if points[1] >= points[2]:
            raise EncodingError(("noncanonical-mutual-bisector-centers", key))
    else:
        center_count = 3 if kind == "bisector" else 2
        if tuple(sorted(points[:center_count])) != points[:center_count]:
            raise EncodingError(("noncanonical-structural-centers", key))
        if tuple(sorted(points[center_count:])) != points[center_count:]:
            raise EncodingError(("noncanonical-structural-points", key))
    return key


def _validate_theorem_key(value: Any) -> tuple[Any, ...]:
    if not isinstance(value, list) or len(value) < 3 or value[0] != "theorem":
        raise EncodingError(("invalid-theorem-cut-key", value))
    family = value[1]
    if not isinstance(family, str) or family not in FULL_BANK_FAMILIES:
        raise EncodingError(("incompatible-theorem-family", family))
    points = _vertex_tuple(
        value[2:], label=f"theorem:{family}", size=theorem_family_arity(family)
    )
    return ("theorem", family, *points)


def _require_strictly_sorted_unique(keys: Sequence[tuple[Any, ...]], label: str) -> None:
    if len(set(keys)) != len(keys):
        raise EncodingError(("duplicate-resume-cut-key", label))
    if list(keys) != sorted(keys):
        raise EncodingError(("noncanonical-cut-order", label))


def _validate_declared_counts(payload: Mapping[str, Any], cuts: Mapping[str, Any]) -> None:
    count_fields = (
        ("connectivity_cut_count", "connectivity"),
        ("structural_cut_count", "structural"),
        ("theorem_cut_count", "theorem"),
    )
    for field_name, cut_name in count_fields:
        if field_name not in payload:
            raise EncodingError(("missing-checkpoint-count", field_name))
        declared = _strict_int(payload[field_name], label=field_name)
        actual = len(cuts[cut_name])
        if declared != actual:
            raise EncodingError(("checkpoint-count-drift", field_name, declared, actual))
    for field_name, cut_name, family_index in (
        ("structural_cut_counts", "structural", 0),
        ("theorem_cut_counts", "theorem", 1),
    ):
        if field_name not in payload:
            raise EncodingError(("missing-checkpoint-family-counts", field_name))
        declared = payload[field_name]
        if not isinstance(declared, dict):
            raise EncodingError(("invalid-family-counts", field_name))
        actual = Counter(key[family_index] for key in cuts[cut_name])
        expected = {family: actual.get(family, 0) for family in (
            STRUCTURAL_FAMILIES if cut_name == "structural" else FULL_BANK_FAMILIES
        )}
        if declared != expected:
            raise EncodingError(("checkpoint-family-count-drift", field_name))


def _canonical_cuts_payload(
    connectivity: Sequence[tuple[int, ...]],
    structural: Sequence[tuple[Any, ...]],
    theorem: Sequence[tuple[Any, ...]],
) -> dict[str, Any]:
    return {
        "schema": CUT_SCHEMA,
        "structural_families": list(STRUCTURAL_FAMILIES),
        "theorem_families": list(FULL_BANK_FAMILIES),
        "connectivity": [list(key) for key in connectivity],
        "structural": [list(key) for key in structural],
        "theorem": [list(key) for key in theorem],
    }


def load_checkpoint(path: str | Path) -> FrozenCheckpoint:
    """Load only the frozen v9/v7 schema and reject noncanonical cut ledgers."""

    source = Path(path)
    try:
        raw = source.read_bytes()
    except OSError as exc:
        raise EncodingError(("unreadable-checkpoint", source.name, str(exc))) from exc
    payload = _json_without_duplicate_keys(raw, label="checkpoint")
    if not isinstance(payload, dict):
        raise EncodingError(("invalid-checkpoint-payload", type(payload).__name__))
    manifest = payload.get("learned_cuts")
    if not isinstance(manifest, dict):
        raise EncodingError("missing learned_cuts object")
    if payload.get("schema") != RESULT_SCHEMA or manifest.get("schema") != CUT_SCHEMA:
        raise EncodingError((
            "incompatible-checkpoint-schema",
            payload.get("schema"),
            manifest.get("schema"),
        ))
    if payload.get("n") != N or payload.get("closed_cap_profile") != list(PROFILE):
        raise EncodingError(("incompatible-bounded-profile", payload.get("n"), payload.get("closed_cap_profile")))
    arm = payload.get("arm")
    if arm not in ARMS:
        raise EncodingError(("invalid-arm", arm))
    force_shared_fourth = payload.get("forced_shared_fourth")
    if type(force_shared_fourth) is not bool:
        raise EncodingError(("invalid-forced-shared-fourth", force_shared_fourth))
    status = payload.get("status")
    if not isinstance(status, str) or not status:
        raise EncodingError(("invalid-checkpoint-status", status))
    if manifest.get("structural_families") != list(STRUCTURAL_FAMILIES):
        raise EncodingError(("incompatible-structural-families", manifest.get("structural_families")))
    if manifest.get("theorem_families") != list(FULL_BANK_FAMILIES):
        raise EncodingError(("incompatible-theorem-families", manifest.get("theorem_families")))
    required_manifest_fields = {
        "schema", "structural_families", "theorem_families",
        "connectivity", "structural", "theorem",
    }
    allowed_manifest_fields = required_manifest_fields | {
        "critical_no_K4_representation"
    }
    if set(manifest) not in (required_manifest_fields, allowed_manifest_fields):
        raise EncodingError(("noncanonical-learned-cuts-fields", sorted(manifest)))
    representation_field = "critical_no_K4_representation"
    result_present = representation_field in payload
    manifest_present = representation_field in manifest
    result_representation = payload.get(representation_field)
    manifest_representation = manifest.get(representation_field)
    representation_records = tuple(
        label
        for label, present in (
            ("result", result_present),
            ("learned_cuts", manifest_present),
        )
        if present
    )
    if not result_present and not manifest_present:
        representation = CRITICAL_NO_K4_TRIPLE_CLAUSES
    elif not result_present:
        representation = manifest_representation
    elif not manifest_present:
        representation = result_representation
    elif result_representation != manifest_representation:
        raise EncodingError((
            "incompatible-critical-no-K4-representation-records",
            result_representation,
            manifest_representation,
        ))
    else:
        representation = result_representation
    if representation not in CRITICAL_NO_K4_REPRESENTATIONS:
        raise EncodingError((
            "unsupported-critical-no-K4-representation", representation
        ))
    if not all(isinstance(manifest.get(name), list) for name in ("connectivity", "structural", "theorem")):
        raise EncodingError("resume cut collections must be lists")

    connectivity = tuple(
        _vertex_tuple(value, label="connectivity", allow_full=False)
        for value in manifest["connectivity"]
    )
    if any(tuple(sorted(key)) != key for key in connectivity):
        raise EncodingError(("noncanonical-connectivity-cut", connectivity))
    structural = tuple(_validate_structural_key(value) for value in manifest["structural"])
    theorem = tuple(_validate_theorem_key(value) for value in manifest["theorem"])
    _require_strictly_sorted_unique(connectivity, "connectivity")
    _require_strictly_sorted_unique(structural, "structural")
    _require_strictly_sorted_unique(theorem, "theorem")

    validated_cuts = {
        "connectivity": connectivity,
        "structural": structural,
        "theorem": theorem,
    }
    _validate_declared_counts(payload, validated_cuts)
    canonical_cuts = _canonical_cuts_payload(connectivity, structural, theorem)
    return FrozenCheckpoint(
        payload=payload,
        source_name=source.name,
        raw_sha256=sha256_bytes(raw),
        byte_count=len(raw),
        arm=arm,
        force_shared_fourth=force_shared_fourth,
        status=status,
        critical_no_k4_representation=representation,
        critical_no_k4_representation_records=representation_records,
        connectivity=connectivity,
        structural=structural,
        theorem=theorem,
        cuts_sha256=sha256_bytes(compact_json_bytes(canonical_cuts)),
    )


def _learned_cuts_package_payload(
    checkpoint: FrozenCheckpoint,
) -> dict[str, Any]:
    """Canonical, path-independent formula input retained in every package."""

    return {
        "schema": LEARNED_CUTS_PACKAGE_SCHEMA,
        "bounded_instance": {
            "result_schema": RESULT_SCHEMA,
            "learned_cut_schema": CUT_SCHEMA,
            "n": N,
            "names": list(NAMES),
            "closed_cap_profile": list(PROFILE),
            "arm": checkpoint.arm,
            "force_shared_fourth": checkpoint.force_shared_fourth,
            "source_critical_no_K4_representation": (
                checkpoint.critical_no_k4_representation
            ),
            "exported_critical_no_K4_representation": (
                EXPORTED_CRITICAL_NO_K4_REPRESENTATION
            ),
        },
        "cuts": _canonical_cuts_payload(
            checkpoint.connectivity,
            checkpoint.structural,
            checkpoint.theorem,
        ),
    }


def _checkpoint_from_packaged_cuts(payload: Mapping[str, Any]) -> FrozenCheckpoint:
    """Validate canonical packaged keys and recover the exact formula input."""

    if set(payload) != {"schema", "bounded_instance", "cuts"}:
        raise EncodingError("noncanonical packaged learned-cut fields")
    bounded = payload.get("bounded_instance")
    cuts = payload.get("cuts")
    if not isinstance(bounded, dict) or not isinstance(cuts, dict):
        raise EncodingError("missing packaged learned-cut binding")
    expected_bounded_fields = {
        "result_schema", "learned_cut_schema", "n", "names",
        "closed_cap_profile", "arm", "force_shared_fourth",
        "source_critical_no_K4_representation",
        "exported_critical_no_K4_representation",
    }
    if set(bounded) != expected_bounded_fields:
        raise EncodingError("noncanonical packaged learned-cut configuration")
    if (
        bounded.get("result_schema") != RESULT_SCHEMA
        or bounded.get("learned_cut_schema") != CUT_SCHEMA
        or bounded.get("n") != N
        or bounded.get("names") != list(NAMES)
        or bounded.get("closed_cap_profile") != list(PROFILE)
        or bounded.get("arm") not in ARMS
        or type(bounded.get("force_shared_fourth")) is not bool
    ):
        raise EncodingError("packaged learned-cut configuration drift")
    source_representation = bounded.get(
        "source_critical_no_K4_representation"
    )
    if source_representation not in CRITICAL_NO_K4_REPRESENTATIONS:
        raise EncodingError((
            "unsupported-critical-no-K4-representation",
            source_representation,
        ))
    if bounded.get("exported_critical_no_K4_representation") != (
        EXPORTED_CRITICAL_NO_K4_REPRESENTATION
    ):
        raise EncodingError("exported critical no-K4 representation drift")
    if set(cuts) != {
        "schema", "structural_families", "theorem_families",
        "connectivity", "structural", "theorem",
    }:
        raise EncodingError("noncanonical packaged cut-registry fields")
    if cuts.get("schema") != CUT_SCHEMA:
        raise EncodingError("packaged cut schema drift")
    if cuts.get("structural_families") != list(STRUCTURAL_FAMILIES):
        raise EncodingError("packaged structural-family registry drift")
    if cuts.get("theorem_families") != list(FULL_BANK_FAMILIES):
        raise EncodingError("packaged theorem-family registry drift")
    if not all(
        isinstance(cuts.get(name), list)
        for name in ("connectivity", "structural", "theorem")
    ):
        raise EncodingError("packaged cut collections must be lists")
    connectivity = tuple(
        _vertex_tuple(value, label="packaged-connectivity", allow_full=False)
        for value in cuts["connectivity"]
    )
    if any(tuple(sorted(key)) != key for key in connectivity):
        raise EncodingError(("noncanonical-connectivity-cut", connectivity))
    structural = tuple(
        _validate_structural_key(value) for value in cuts["structural"]
    )
    theorem = tuple(_validate_theorem_key(value) for value in cuts["theorem"])
    _require_strictly_sorted_unique(connectivity, "packaged-connectivity")
    _require_strictly_sorted_unique(structural, "packaged-structural")
    _require_strictly_sorted_unique(theorem, "packaged-theorem")
    canonical_cuts = _canonical_cuts_payload(connectivity, structural, theorem)
    if cuts != canonical_cuts:
        raise EncodingError("noncanonical packaged cut registry")
    return FrozenCheckpoint(
        payload=payload,
        source_name="learned-cuts.json",
        raw_sha256="0" * 64,
        byte_count=0,
        arm=bounded["arm"],
        force_shared_fourth=bounded["force_shared_fourth"],
        status="PACKAGED_KEYS_UNAUTHENTICATED",
        critical_no_k4_representation=source_representation,
        critical_no_k4_representation_records=(),
        connectivity=connectivity,
        structural=structural,
        theorem=theorem,
        cuts_sha256=sha256_bytes(compact_json_bytes(canonical_cuts)),
    )


def _neg(atom: Atom) -> Atom:
    return not atom if type(atom) is bool else -atom


def crossed_arm_roles(arm: str, q_source: Any, q_other: Any) -> tuple[Any, Any]:
    if arm == "source-at-common":
        return q_source, q_other
    if arm == "other-at-common":
        return q_other, q_source
    raise EncodingError(("invalid-arm", arm))


def crossed_arm_polarity_clauses(
    guard: int,
    common_blocker: int,
    opposite_blocker: int,
    common_contains_common: int,
    common_contains_opposite: int,
    opposite_contains_common: int,
    opposite_contains_opposite: int,
) -> tuple[tuple[int, ...], ...]:
    """The four exact guarded implications used by both crossed arm labels."""

    return (
        (-guard, -common_blocker, common_contains_common),
        (-guard, -common_blocker, -common_contains_opposite),
        (-guard, -opposite_blocker, opposite_contains_opposite),
        (-guard, -opposite_blocker, -opposite_contains_common),
    )


def _register_variables(encoding: Encoding) -> None:
    registry = encoding.variables
    for center in VS:
        for point in VS:
            registry.register("M", center, point)
    for source in VS:
        for center in VS:
            registry.register("B", source, center)
    for label, _deleted, _opposite in DELETION_ARM_SPECS:
        registry.register("D", label)
    for q_source, q_other in itertools.permutations(OUTSIDE_FIRST, 2):
        registry.register("Q", q_source, q_other)
    for block in MOVABLE_BLOCKS:
        for left, right in itertools.combinations(block, 2):
            registry.register("LT", left, right)
    for left, right in itertools.combinations(VS, 2):
        for point in VS:
            if point not in (left, right):
                registry.register("BTW", left, right, point)
    for edge in range(len(EDGES)):
        for bit in range(EDGE_CLASS_BITS):
            registry.register("EdgeClassBit", edge, bit)
    for left_edge, right_edge in itertools.combinations(range(len(EDGES)), 2):
        registry.register("EdgeEq", left_edge, right_edge)
    for center in VS:
        for left, right in itertools.combinations(
            (point for point in VS if point != center), 2
        ):
            registry.register("E", center, left, right)
    for left_edge, right_edge in itertools.combinations(range(len(EDGES)), 2):
        for bit in range(EDGE_CLASS_BITS):
            registry.register("EdgeSameBit", left_edge, right_edge, bit)
    for center in FIRST_INTERIOR:
        for source in OUTSIDE_FIRST:
            registry.register("FreshOutsideAnd", center, source)
    if encoding.force_shared_fourth:
        for source in (PAIR_Q[0], PAIR_R[0]):
            for point in VS:
                for center in VS:
                    registry.register("ShellAnd", source, point, center)
        for source in (PAIR_Q[0], PAIR_R[0]):
            for point in VS:
                registry.register("Shell", source, point)
        for point in VS:
            registry.register("SharedFourth", point)
    registry.freeze()


def _m(encoding: Encoding, center: int, point: int) -> int:
    return encoding.variables.get("M", center, point)


def _b(encoding: Encoding, source: int, center: int) -> int:
    return encoding.variables.get("B", source, center)


def _edge(left: int, right: int) -> int:
    return EDGE_INDEX[min(left, right), max(left, right)]


def _edge_eq(encoding: Encoding, left_edge: int, right_edge: int) -> Atom:
    if left_edge == right_edge:
        return True
    return encoding.variables.get("EdgeEq", min(left_edge, right_edge), max(left_edge, right_edge))


def _e(encoding: Encoding, center: int, left: int, right: int) -> Atom:
    if left == right:
        return True
    if center in (left, right):
        return False
    return encoding.variables.get("E", center, min(left, right), max(left, right))


def _lt(encoding: Encoding, left: int, right: int) -> Atom:
    if left == right:
        return False
    left_block = POINT_BLOCK[left]
    right_block = POINT_BLOCK[right]
    if left_block != right_block:
        return left_block < right_block
    block = MOVABLE_BLOCK_BY_POINT.get(left)
    if block is None or right not in block:
        raise EncodingError(("invalid-same-block-comparison", left, right))
    low, high = sorted((left, right))
    literal = encoding.variables.get("LT", low, high)
    return literal if left == low else -literal


def _btw(encoding: Encoding, left: int, right: int, point: int) -> int:
    if point in (left, right) or left == right:
        raise EncodingError(("invalid-between-arguments", left, right, point))
    low, high = sorted((left, right))
    return encoding.variables.get("BTW", low, high, point)


def _exactly(encoding: Encoding, origin: str, terms: Iterable[Atom], target: int) -> None:
    fixed_true = 0
    variables: list[int] = []
    for term in terms:
        if type(term) is bool:
            fixed_true += int(term)
        else:
            if term < 0:
                raise EncodingError(("negative-cardinality-literal", origin, term))
            variables.append(term)
    if len(set(variables)) != len(variables):
        raise EncodingError(("duplicate-cardinality-variable", origin))
    remaining = target - fixed_true
    if remaining < 0 or remaining > len(variables):
        encoding.ledger.add(origin, ())
        return
    if remaining < len(variables):
        for subset in itertools.combinations(variables, remaining + 1):
            encoding.ledger.add(origin, (-literal for literal in subset))
    if remaining > 0:
        width = len(variables) - remaining + 1
        for subset in itertools.combinations(variables, width):
            encoding.ledger.add(origin, subset)


def _equivalence_under_guard(
    encoding: Encoding, origin: str, guard: Atom, left: Atom, right: Atom
) -> None:
    encoding.ledger.add(origin, (_neg(guard), _neg(left), right))
    encoding.ledger.add(origin, (_neg(guard), left, _neg(right)))


def _rotations(points: tuple[int, ...]) -> Iterator[tuple[int, ...]]:
    for shift in range(len(points)):
        yield points[shift:] + points[:shift]


def _iff_and(
    encoding: Encoding, origin: str, result: int, left: Atom, right: Atom
) -> None:
    encoding.ledger.add(origin, (-result, left))
    encoding.ledger.add(origin, (-result, right))
    encoding.ledger.add(origin, (result, _neg(left), _neg(right)))


def _iff_xor(
    encoding: Encoding, origin: str, result: int, left: Atom, right: Atom
) -> None:
    encoding.ledger.add(origin, (left, right, -result))
    encoding.ledger.add(origin, (_neg(left), _neg(right), -result))
    encoding.ledger.add(origin, (_neg(left), right, result))
    encoding.ledger.add(origin, (left, _neg(right), result))


def _emit_edge_equivalence(encoding: Encoding) -> None:
    """Represent the source's free EUF edge sort by canonical 8-bit labels.

    There are only 136 edge terms.  Equality of bit vectors realizes every
    possible equivalence relation on those terms, so this is equisatisfiable
    with the uninterpreted-sort equality used by the discovery encoder.
    """

    origin = "base.global_edge_equality_closure"
    with encoding.phase(origin):
        for left_edge, right_edge in itertools.combinations(range(len(EDGES)), 2):
            equal = encoding.variables.get("EdgeEq", left_edge, right_edge)
            same_bits = []
            for bit in range(EDGE_CLASS_BITS):
                left = encoding.variables.get("EdgeClassBit", left_edge, bit)
                right = encoding.variables.get("EdgeClassBit", right_edge, bit)
                same = encoding.variables.get(
                    "EdgeSameBit", left_edge, right_edge, bit
                )
                same_bits.append(same)
                encoding.ledger.add(origin, (-same, -left, right))
                encoding.ledger.add(origin, (-same, left, -right))
                encoding.ledger.add(origin, (same, left, right))
                encoding.ledger.add(origin, (same, -left, -right))
                encoding.ledger.add(origin, (-equal, same))
            encoding.ledger.add(origin, (equal, *(-same for same in same_bits)))
        for center in VS:
            for left, right in itertools.combinations(
                (point for point in VS if point != center), 2
            ):
                alias = _e(encoding, center, left, right)
                relation = _edge_eq(
                    encoding, _edge(center, left), _edge(center, right)
                )
                encoding.ledger.add(origin, (-alias, relation))
                encoding.ledger.add(origin, (alias, _neg(relation)))


def _emit_order_and_between(encoding: Encoding) -> None:
    order_origin = "base.cyclic_position_block_permutation"
    with encoding.phase(order_origin):
        for block in MOVABLE_BLOCKS:
            for left, middle, right in itertools.combinations(block, 3):
                lm = _lt(encoding, left, middle)
                mr = _lt(encoding, middle, right)
                lr = _lt(encoding, left, right)
                encoding.ledger.add(order_origin, (_neg(lm), _neg(mr), lr))
                encoding.ledger.add(order_origin, (lm, mr, _neg(lr)))

    between_origin = "base.between_definition"
    with encoding.phase(between_origin):
        for left, right in itertools.combinations(VS, 2):
            for point in VS:
                if point in (left, right):
                    continue
                _iff_xor(
                    encoding,
                    between_origin,
                    _btw(encoding, left, right, point),
                    _lt(encoding, left, point),
                    _lt(encoding, right, point),
                )


def _emit_auxiliary_definitions(encoding: Encoding) -> None:
    fresh_origin = "base.fresh_outside_conjunction_definition"
    with encoding.phase(fresh_origin):
        for center in FIRST_INTERIOR:
            for source in OUTSIDE_FIRST:
                result = encoding.variables.get("FreshOutsideAnd", center, source)
                _iff_and(
                    encoding,
                    fresh_origin,
                    result,
                    _b(encoding, source, center),
                    _m(encoding, center, source),
                )

    if not encoding.force_shared_fourth:
        return
    shell_origin = "base.shared_fourth_shell_definition"
    with encoding.phase(shell_origin):
        for source in (PAIR_Q[0], PAIR_R[0]):
            for point in VS:
                conjunctions = []
                for center in VS:
                    result = encoding.variables.get(
                        "ShellAnd", source, point, center
                    )
                    conjunctions.append(result)
                    _iff_and(
                        encoding,
                        shell_origin,
                        result,
                        _b(encoding, source, center),
                        _m(encoding, center, point),
                    )
                shell = encoding.variables.get("Shell", source, point)
                for result in conjunctions:
                    encoding.ledger.add(shell_origin, (-result, shell))
                encoding.ledger.add(
                    shell_origin, (-shell, *conjunctions)
                )
        for point in VS:
            _iff_and(
                encoding,
                shell_origin,
                encoding.variables.get("SharedFourth", point),
                encoding.variables.get("Shell", PAIR_Q[0], point),
                encoding.variables.get("Shell", PAIR_R[0], point),
            )


def _emit_global_k4(encoding: Encoding) -> None:
    origin = "base.global_K4"
    with encoding.phase(origin):
        for center in VS:
            encoding.ledger.add(origin, (-_m(encoding, center, center),))
            _exactly(
                encoding,
                origin,
                (_m(encoding, center, point) for point in VS if point != center),
                4,
            )
            for left, right in itertools.combinations(
                (point for point in VS if point != center), 2
            ):
                encoding.ledger.add(
                    origin,
                    (
                        -_m(encoding, center, left),
                        -_m(encoding, center, right),
                        _e(encoding, center, left, right),
                    ),
                )


def _critical_no_k4_negative_triples(
    remaining: Sequence[int],
) -> tuple[tuple[int, int, int, int], ...]:
    """Canonical expansion shared by triple clauses and compact tail PbLe."""

    return tuple(itertools.combinations(remaining, 4))


def _critical_no_k4_compact_tail_expansion(
    remaining: Sequence[int],
) -> tuple[tuple[int, int, int, int], ...]:
    """Expand each fixed-anchor tail ``atMost 2`` into negative triples."""

    return tuple(
        (anchor, second, third, fourth)
        for index, anchor in enumerate(remaining[:-3])
        for second, third, fourth in itertools.combinations(
            remaining[index + 1:], 3
        )
    )


def _emit_critical_shells(encoding: Encoding) -> None:
    total_origin = "base.critical_blocker_total"
    nonself_origin = "base.critical_blocker_nonself"
    support_origin = "base.critical_support_exact"
    no_k4_origin = "base.critical_no_K4_after_source_deletion"
    with encoding.phase(total_origin):
        for source in VS:
            _exactly(
                encoding,
                total_origin,
                (_b(encoding, source, center) for center in VS if center != source),
                1,
            )
    with encoding.phase(nonself_origin):
        for source in VS:
            encoding.ledger.add(nonself_origin, (-_b(encoding, source, source),))
    with encoding.phase(support_origin):
        for source in VS:
            for center in VS:
                if center == source:
                    continue
                guard = _b(encoding, source, center)
                encoding.ledger.add(
                    support_origin, (-guard, _m(encoding, center, source))
                )
                for point in VS:
                    if point == center:
                        continue
                    right = (
                        True
                        if point == source
                        else _e(encoding, center, source, point)
                    )
                    _equivalence_under_guard(
                        encoding,
                        support_origin,
                        guard,
                        _m(encoding, center, point),
                        right,
                    )
    with encoding.phase(no_k4_origin):
        for source in VS:
            for center in VS:
                if center == source:
                    continue
                guard = _b(encoding, source, center)
                remaining = tuple(
                    point for point in VS if point not in (center, source)
                )
                for anchor, second, third, fourth in (
                    _critical_no_k4_negative_triples(remaining)
                ):
                    encoding.ledger.add(
                        no_k4_origin,
                        (
                            -guard,
                            _neg(_e(encoding, center, anchor, second)),
                            _neg(_e(encoding, center, anchor, third)),
                            _neg(_e(encoding, center, anchor, fourth)),
                        ),
                    )


def _emit_blocker_packet(encoding: Encoding) -> None:
    def same_blocker(left: int, right: int, origin: str) -> None:
        for center in VS:
            _equivalence_under_guard(
                encoding,
                origin,
                True,
                _b(encoding, left, center),
                _b(encoding, right, center),
            )

    with encoding.phase("base.blocker_collisions_and_freshness"):
        same_blocker(PAIR_P[0], PAIR_P[1], "base.p_blocker_collision")
        same_blocker(PAIR_R[0], PAIR_R[1], "base.r_blocker_collision")
        same_blocker(PAIR_Q[0], PAIR_Q[1], "base.q_equal_blocker")
        for left, right, origin in (
            (PAIR_P[0], PAIR_R[0], "base.collision_blockers_distinct"),
            (PAIR_P[0], PAIR_Q[0], "base.fresh_q_blocker"),
            (PAIR_R[0], PAIR_Q[0], "base.fresh_q_blocker"),
        ):
            for center in VS:
                encoding.ledger.add(
                    origin,
                    (-_b(encoding, left, center), -_b(encoding, right, center)),
                )
        for source in (PAIR_P[0], PAIR_R[0], PAIR_Q[0]):
            for center in VS:
                if center not in FIRST_INTERIOR:
                    encoding.ledger.add(
                        "base.blockers_in_indexed_strict_cap",
                        (-_b(encoding, source, center),),
                    )


def _emit_complete_apex_class(
    encoding: Encoding, pair: tuple[int, int], origin: str
) -> None:
    left, right = pair
    encoding.ledger.add(origin, (_e(encoding, A1, left, right),))
    _exactly(
        encoding,
        origin,
        (_e(encoding, A1, left, point) for point in VS if point != A1),
        4,
    )
    for point in FIRST_INTERIOR:
        if point not in pair:
            encoding.ledger.add(
                origin, (_neg(_e(encoding, A1, left, point)),)
            )


def _emit_apex_and_shell_packet(encoding: Encoding) -> None:
    with encoding.phase("base.first_apex_classes"):
        _emit_complete_apex_class(
            encoding, PAIR_P, "base.p_first_apex_exact_class"
        )
        _emit_complete_apex_class(
            encoding, PAIR_R, "base.r_first_apex_exact_class"
        )
        _emit_complete_apex_class(
            encoding, PAIR_Q, "base.q_first_apex_exact_class"
        )
        for left, right in (
            (PAIR_P[0], PAIR_R[0]),
            (PAIR_P[0], PAIR_Q[0]),
            (PAIR_R[0], PAIR_Q[0]),
        ):
            encoding.ledger.add(
                "base.distinct_first_apex_radii",
                (_neg(_e(encoding, A1, left, right)),),
            )

    with encoding.phase("base.exact_shell_intersections"):
        for center in FIRST_INTERIOR:
            q_guard = _b(encoding, PAIR_Q[0], center)
            for point in FIRST_CAP - set(PAIR_Q):
                encoding.ledger.add(
                    "base.q_shell_exact_cap_intersection",
                    (-q_guard, -_m(encoding, center, point)),
                )
            for point in (*PAIR_P, *PAIR_R):
                encoding.ledger.add(
                    "base.all_four_endpoint_omissions",
                    (-q_guard, -_m(encoding, center, point)),
                )

            p_guard = _b(encoding, PAIR_P[0], center)
            for point in FIRST_CAP - set(PAIR_P):
                encoding.ledger.add(
                    "base.Q_first_shell_exact_cap_intersection",
                    (-p_guard, -_m(encoding, center, point)),
                )
            encoding.ledger.add(
                "base.Q_fresh_outside_source_same_blocker",
                (
                    -p_guard,
                    *(
                        encoding.variables.get(
                            "FreshOutsideAnd", center, source
                        )
                        for source in OUTSIDE_FIRST
                    ),
                ),
            )


def _emit_deletion_packet(encoding: Encoding) -> None:
    with encoding.phase("base.five_center_deletion"):
        _exactly(
            encoding,
            "base.five_center_deletion_arm_selector",
            (
                encoding.variables.get("D", label)
                for label, _deleted, _opposite in DELETION_ARM_SPECS
            ),
            1,
        )
        for label, deleted, opposite_source in DELETION_ARM_SPECS:
            arm = encoding.variables.get("D", label)
            for center in (A1, A2, A3):
                encoding.ledger.add(
                    "base.five_center_deletion_fixed_apex_survival",
                    (-arm, -_m(encoding, center, deleted)),
                )
            for blocker_source in (PAIR_Q[0], opposite_source):
                for center in VS:
                    encoding.ledger.add(
                        "base.five_center_deletion_blocker_survival",
                        (
                            -arm,
                            -_b(encoding, blocker_source, center),
                            -_m(encoding, center, deleted),
                        ),
                    )


def _emit_geometric_packet(encoding: Encoding) -> None:
    with encoding.phase("base.euclidean_incidence"):
        for first_center, second_center in itertools.combinations(VS, 2):
            possible = tuple(
                point
                for point in VS
                if point not in (first_center, second_center)
            )
            for left, middle, right in itertools.combinations(possible, 3):
                encoding.ledger.add(
                    "base.two_complete_circles_intersect_at_most_two",
                    (
                        _neg(_e(encoding, first_center, left, middle)),
                        _neg(_e(encoding, first_center, left, right)),
                        _neg(_e(encoding, second_center, left, middle)),
                        _neg(_e(encoding, second_center, left, right)),
                    ),
                )
        for left, right in itertools.combinations(VS, 2):
            centers = tuple(
                center for center in VS if center not in (left, right)
            )
            for first, second, third in itertools.combinations(centers, 3):
                encoding.ledger.add(
                    "base.equal_pair_has_at_most_two_carrier_centers",
                    (
                        _neg(_e(encoding, first, left, right)),
                        _neg(_e(encoding, second, left, right)),
                        _neg(_e(encoding, third, left, right)),
                    ),
                )

        for center in PRECEDING_INTERIOR:
            for left, right in itertools.combinations(FIRST_INTERIOR, 2):
                encoding.ledger.add(
                    "base.cap_crossing_kalmanson_shared_late_pair",
                    (
                        -_m(encoding, A1, left),
                        -_m(encoding, A1, right),
                        -_m(encoding, center, left),
                        -_m(encoding, center, right),
                    ),
                )

        for first_center, second_center in itertools.combinations(VS, 2):
            possible = tuple(
                point
                for point in VS
                if point not in (first_center, second_center)
            )
            for left, right in itertools.combinations(possible, 2):
                prefix = (
                    -_m(encoding, first_center, left),
                    -_m(encoding, first_center, right),
                    -_m(encoding, second_center, left),
                    -_m(encoding, second_center, right),
                )
                first_between = _btw(
                    encoding, first_center, second_center, left
                )
                second_between = _btw(
                    encoding, first_center, second_center, right
                )
                encoding.ledger.add(
                    "base.full_selected_row_shared_pair_separation",
                    (*prefix, first_between, second_between),
                )
                encoding.ledger.add(
                    "base.full_selected_row_shared_pair_separation",
                    (*prefix, -first_between, -second_between),
                )


def _emit_crossed_arm(encoding: Encoding) -> None:
    origin = "base.live_Q_ordered_outside_pair_selector"
    with encoding.phase("base.crossed_arm"):
        q_variables = tuple(
            encoding.variables.get("Q", source, other)
            for source, other in itertools.permutations(OUTSIDE_FIRST, 2)
        )
        _exactly(encoding, origin, q_variables, 1)
        for q_source, q_other in itertools.permutations(OUTSIDE_FIRST, 2):
            guard = encoding.variables.get("Q", q_source, q_other)
            common_point, opposite_point = crossed_arm_roles(
                encoding.arm, q_source, q_other
            )
            for center in VS:
                _equivalence_under_guard(
                    encoding,
                    "base.live_Q_source_same_actual_blocker",
                    guard,
                    _b(encoding, q_source, center),
                    _b(encoding, PAIR_P[0], center),
                )
                encoding.ledger.add(
                    "base.live_Q_named_pair_in_first_blocker_row",
                    (
                        -guard,
                        -_b(encoding, PAIR_P[0], center),
                        _m(encoding, center, q_source),
                    ),
                )
                encoding.ledger.add(
                    "base.live_Q_named_pair_in_first_blocker_row",
                    (
                        -guard,
                        -_b(encoding, PAIR_P[0], center),
                        _m(encoding, center, q_other),
                    ),
                )
                for clause in crossed_arm_polarity_clauses(
                    guard,
                    _b(encoding, PAIR_Q[0], center),
                    _b(encoding, PAIR_R[0], center),
                    _m(encoding, center, common_point),
                    _m(encoding, center, opposite_point),
                    _m(encoding, center, common_point),
                    _m(encoding, center, opposite_point),
                ):
                    encoding.ledger.add(
                        f"base.crossed_arm_{encoding.arm}", clause
                    )
            if encoding.force_shared_fourth:
                named = {
                    PAIR_Q[0], PAIR_Q[1], PAIR_R[0], PAIR_R[1],
                    common_point, opposite_point,
                }
                encoding.ledger.add(
                    "base.crossed_arm_shared_fourth",
                    (
                        -guard,
                        *(
                            encoding.variables.get("SharedFourth", point)
                            for point in VS
                            if point not in named
                        ),
                    ),
                )


def build_base(arm: str, force_shared_fourth: bool) -> Encoding:
    """Build the complete frozen v9 base formula without learned cuts."""

    if arm not in ARMS:
        raise EncodingError(("invalid-arm", arm))
    if type(force_shared_fourth) is not bool:
        raise EncodingError(("invalid-force-shared-fourth", force_shared_fourth))
    encoding = Encoding(arm=arm, force_shared_fourth=force_shared_fourth)
    _register_variables(encoding)
    _emit_edge_equivalence(encoding)
    _emit_order_and_between(encoding)
    _emit_auxiliary_definitions(encoding)
    _emit_global_k4(encoding)
    _emit_critical_shells(encoding)
    _emit_blocker_packet(encoding)
    _emit_apex_and_shell_packet(encoding)
    _emit_deletion_packet(encoding)
    _emit_geometric_packet(encoding)
    _emit_crossed_arm(encoding)
    encoding.base_complete = True
    return encoding


def _row_negative_literals(
    encoding: Encoding, center: int, points: Iterable[int]
) -> tuple[int, ...]:
    return tuple(-_m(encoding, center, point) for point in points)


def _order_chain(encoding: Encoding, points: tuple[int, ...]) -> tuple[Atom, ...]:
    return tuple(
        _lt(encoding, left, right)
        for left, right in itertools.pairwise(points)
    )


def _emit_guarded_order_cut(
    encoding: Encoding,
    origin: str,
    points: tuple[int, ...],
    negative_atoms: tuple[Atom, ...],
    kind: str,
) -> None:
    if kind == "linear":
        orders = (points,)
    elif kind == "cyclic":
        orders = tuple(_rotations(points))
    elif kind == "cyclic-up-to-orientation":
        orders = (
            *tuple(_rotations(points)),
            *tuple(_rotations(tuple(reversed(points)))),
        )
    else:
        raise EncodingError(("invalid-order-guard-kind", kind))
    for order in orders:
        encoding.ledger.add(
            origin,
            (*(_neg(term) for term in _order_chain(encoding, order)), *negative_atoms),
        )


def _emit_connectivity_cut(encoding: Encoding, key: tuple[int, ...]) -> None:
    inside = frozenset(key)
    encoding.ledger.add(
        "learned.connectivity",
        (
            _m(encoding, center, point)
            for center in key
            for point in VS
            if point not in inside
        ),
    )


def _emit_structural_cut(encoding: Encoding, key: tuple[Any, ...]) -> None:
    kind = key[0]
    origin = f"learned.structural.{kind}"
    if kind == "circle":
        _, first, second, left, middle, right = key
        encoding.ledger.add(
            origin,
            (
                *_row_negative_literals(
                    encoding, first, (left, middle, right)
                ),
                *_row_negative_literals(
                    encoding, second, (left, middle, right)
                ),
            ),
        )
    elif kind == "bisector":
        _, first, second, third, left, right = key
        encoding.ledger.add(
            origin,
            (
                *(
                    literal
                    for center in (first, second, third)
                    for literal in _row_negative_literals(
                        encoding, center, (left, right)
                    )
                ),
            ),
        )
    elif kind == "shared_pair":
        _, first, second, left, right = key
        prefix = (
            *_row_negative_literals(encoding, first, (left, right)),
            *_row_negative_literals(encoding, second, (left, right)),
        )
        left_between = _btw(encoding, first, second, left)
        right_between = _btw(encoding, first, second, right)
        encoding.ledger.add(origin, (*prefix, left_between, right_between))
        encoding.ledger.add(origin, (*prefix, -left_between, -right_between))
    elif kind == "raw_btw_sep":
        _, first, second, left, right = key
        prefix = (
            _neg(_e(encoding, first, left, right)),
            _neg(_e(encoding, second, left, right)),
        )
        left_between = _btw(encoding, first, second, left)
        right_between = _btw(encoding, first, second, right)
        encoding.ledger.add(origin, (*prefix, left_between, right_between))
        encoding.ledger.add(origin, (*prefix, -left_between, -right_between))
    elif kind == "mutual_bisector_transport":
        _, point, first, second = key
        encoding.ledger.add(
            origin,
            (
                _neg(_e(encoding, first, point, second)),
                _neg(_e(encoding, second, point, first)),
                _e(encoding, point, first, second),
            ),
        )
    else:
        raise EncodingError(("unknown-structural-cut-kind", kind))


def _theorem_negative_atoms(
    encoding: Encoding, family: str, points: tuple[int, ...]
) -> tuple[str, tuple[Atom, ...]]:
    if family in FAMILIES:
        schema = FAMILIES[family]
        atoms = tuple(
            literal
            for center_index, support in schema["rows"]
            for literal in _row_negative_literals(
                encoding,
                points[center_index],
                (points[index] for index in support),
            )
        )
        return "cyclic", atoms
    if family in LINEAR_ROW_FAMILIES:
        schema = LINEAR_ROW_FAMILIES[family]
        atoms = tuple(
            literal
            for center_index, support in schema["rows"]
            for literal in _row_negative_literals(
                encoding,
                points[center_index],
                (points[index] for index in support),
            )
        )
        return "linear", atoms
    if family == CONVEX_FIVE_POINT_FAMILY:
        schema = CONVEX_FIVE_POINT_SCHEMA
        kind = "cyclic-up-to-orientation"
    elif family == GLOBAL_KALMANSON_FAMILY:
        schema = GLOBAL_KALMANSON_SCHEMA
        kind = "cyclic-up-to-orientation"
    else:
        registries = (
            KALMANSON_FAMILIES,
            RAW_EQUALITY_FAMILIES,
            SIX_POINT_EQUALITY_FAMILIES,
        )
        try:
            schema = next(registry[family] for registry in registries if family in registry)
        except StopIteration as exc:
            raise EncodingError(("unknown-theorem-family", family)) from exc
        kind = "linear"
    atoms = tuple(
        _neg(_e(
            encoding,
            points[center],
            points[left],
            points[right],
        ))
        for center, left, right in schema["equalities"]
    )
    return kind, atoms


def _emit_theorem_cut(encoding: Encoding, key: tuple[Any, ...]) -> None:
    _, family, *raw_points = key
    points = tuple(raw_points)
    kind, negative_atoms = _theorem_negative_atoms(encoding, family, points)
    _emit_guarded_order_cut(
        encoding,
        f"learned.theorem.{family}",
        points,
        negative_atoms,
        kind,
    )


def _record_learned_cut_range(
    encoding: Encoding,
    category: str,
    ordinal: int,
    key: tuple[Any, ...],
    first: int,
    alias_first: int,
) -> None:
    last = encoding.ledger.count
    alias_last = len(encoding.ledger.aliases)
    encoding.learned_cut_ranges.append({
        "category": category,
        "ordinal": ordinal,
        "key": list(key),
        "first": first if last >= first else None,
        "last": last if last >= first else None,
        "count": max(0, last - first + 1),
        "alias_first": alias_first if alias_last >= alias_first else None,
        "alias_last": alias_last if alias_last >= alias_first else None,
        "alias_count": max(0, alias_last - alias_first + 1),
    })


def add_learned_cuts(
    encoding: Encoding, checkpoint: FrozenCheckpoint
) -> Encoding:
    """Translate every validated v7 learned cut into deterministic clauses."""

    if not encoding.base_complete:
        raise EncodingError("base encoding is incomplete")
    if encoding.learned_complete or encoding.checkpoint is not None:
        raise EncodingError("learned cuts were already installed")
    if (encoding.arm, encoding.force_shared_fourth) != (
        checkpoint.arm,
        checkpoint.force_shared_fourth,
    ):
        raise EncodingError((
            "checkpoint-base-configuration-mismatch",
            encoding.arm,
            encoding.force_shared_fourth,
            checkpoint.arm,
            checkpoint.force_shared_fourth,
        ))

    with encoding.phase("learned.connectivity"):
        for ordinal, key in enumerate(checkpoint.connectivity):
            first = encoding.ledger.count + 1
            alias_first = len(encoding.ledger.aliases) + 1
            _emit_connectivity_cut(encoding, key)
            _record_learned_cut_range(
                encoding, "connectivity", ordinal, key, first, alias_first
            )
    with encoding.phase("learned.structural"):
        for ordinal, key in enumerate(checkpoint.structural):
            first = encoding.ledger.count + 1
            alias_first = len(encoding.ledger.aliases) + 1
            _emit_structural_cut(encoding, key)
            _record_learned_cut_range(
                encoding, "structural", ordinal, key, first, alias_first
            )
    with encoding.phase("learned.theorem"):
        for ordinal, key in enumerate(checkpoint.theorem):
            first = encoding.ledger.count + 1
            alias_first = len(encoding.ledger.aliases) + 1
            _emit_theorem_cut(encoding, key)
            _record_learned_cut_range(
                encoding, "theorem", ordinal, key, first, alias_first
            )

    encoding.checkpoint = checkpoint
    encoding.learned_complete = True
    return encoding


def _variable_payload(encoding: Encoding) -> dict[str, Any]:
    return {
        "schema": VARIABLE_SCHEMA,
        "count": encoding.variables.count,
        "family_ranges": encoding.variables.family_ranges(),
        "variables": [
            {
                "id": variable.id,
                "family": variable.family,
                "args": list(variable.args),
                "name": variable.name,
            }
            for variable in encoding.variables.variables
        ],
    }


def _provenance_payload(encoding: Encoding) -> dict[str, Any]:
    alias_rows = encoding.ledger.aliases
    return {
        "schema": PROVENANCE_SCHEMA,
        "clause_count": encoding.ledger.count,
        "phase_ranges": encoding.phase_ranges,
        "origin_ranges": encoding.ledger.provenance_ranges(),
        "origin_metadata": encoding.ledger.origin_metadata,
        "learned_cut_ranges": encoding.learned_cut_ranges,
        "duplicate_alias_count": len(alias_rows),
        "duplicate_aliases": alias_rows,
        "duplicate_alias_sha256": sha256_bytes(compact_json_bytes(alias_rows)),
        "duplicate_alias_counts_by_origin": dict(sorted(Counter(
            row["origin"] for row in alias_rows
        ).items())),
        "omitted_tautologies": dict(sorted(
            encoding.ledger.omitted_tautologies.items()
        )),
        "canonical_clause_rule": (
            "drop true/tautological clauses; otherwise sort unique literals "
            "by absolute variable id and retain the first occurrence"
        ),
    }


def _atomic_write_bytes(path: Path, payload: bytes) -> dict[str, Any]:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=f".{path.name}.", dir=path.parent
    )
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, path)
    except BaseException:
        try:
            os.unlink(temporary_name)
        except FileNotFoundError:
            pass
        raise
    return {"sha256": sha256_bytes(payload), "bytes": len(payload)}


def _atomic_write_cnf(path: Path, encoding: Encoding) -> dict[str, Any]:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=f".{path.name}.", dir=path.parent
    )
    digest = hashlib.sha256()
    byte_count = 0
    try:
        with os.fdopen(descriptor, "wb") as stream:
            def emit(payload: bytes) -> None:
                nonlocal byte_count
                stream.write(payload)
                digest.update(payload)
                byte_count += len(payload)

            emit(
                f"p cnf {encoding.variables.count} {encoding.ledger.count}\n".encode(
                    "ascii"
                )
            )
            for clause in encoding.ledger.clauses:
                emit((" ".join(map(str, clause.literals)) + " 0\n").encode("ascii"))
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, path)
    except BaseException:
        try:
            os.unlink(temporary_name)
        except FileNotFoundError:
            pass
        raise
    return {"sha256": digest.hexdigest(), "bytes": byte_count}


def _artifact_entry(
    filename: str, metadata: Mapping[str, Any], *, schema: str | None = None
) -> dict[str, Any]:
    result = {
        "filename": filename,
        "sha256": metadata["sha256"],
        "bytes": metadata["bytes"],
    }
    if schema is not None:
        result["schema"] = schema
    return result


def _write_package(encoding: Encoding, output_dir: str | Path) -> dict[str, Any]:
    if not (encoding.base_complete and encoding.learned_complete):
        raise EncodingError("refusing to advertise an incomplete encoding")
    if encoding.checkpoint is None:
        raise EncodingError("materialization requires a validated checkpoint")
    destination = Path(output_dir)
    if destination.exists() and not destination.is_dir():
        raise EncodingError(("package-destination-is-not-directory", destination.name))
    package_filenames = {
        "start.cnf", "variables.json", "clause-provenance.json",
        "learned-cuts.json", "manifest.json",
    }
    if destination.exists():
        unexpected = sorted(
            entry.name
            for entry in destination.iterdir()
            if entry.name not in package_filenames or not entry.is_file()
        )
        if unexpected:
            raise EncodingError(("noncanonical-package-destination", unexpected))
    destination.mkdir(parents=True, exist_ok=True)

    variables_payload = _variable_payload(encoding)
    variables_meta = _atomic_write_bytes(
        destination / "variables.json", canonical_json_bytes(variables_payload)
    )
    provenance_payload = _provenance_payload(encoding)
    provenance_meta = _atomic_write_bytes(
        destination / "clause-provenance.json",
        canonical_json_bytes(provenance_payload),
    )
    learned_cuts_payload = _learned_cuts_package_payload(encoding.checkpoint)
    learned_cuts_meta = _atomic_write_bytes(
        destination / "learned-cuts.json",
        canonical_json_bytes(learned_cuts_payload),
    )
    cnf_meta = _atomic_write_cnf(destination / "start.cnf", encoding)

    checkpoint = encoding.checkpoint
    exporter_path = Path(__file__)
    structural_registry = json.loads(compact_json_bytes({
        "schema": CUT_SCHEMA,
        "families": list(STRUCTURAL_FAMILIES),
    }))
    theorem_registry = json.loads(compact_json_bytes({
        "schema": CUT_SCHEMA,
        "families": list(FULL_BANK_FAMILIES),
        "schemas": SPEC_BINDING["theorem_schemas"],
    }))
    manifest = {
        "schema": PACKAGE_SCHEMA,
        "bounded_instance": {
            "n": N,
            "names": list(NAMES),
            "closed_cap_profile": list(PROFILE),
            "arm": encoding.arm,
            "force_shared_fourth": encoding.force_shared_fourth,
        },
        "source_checkpoint": {
            "result_schema": RESULT_SCHEMA,
            "learned_cut_schema": CUT_SCHEMA,
            "declared_raw_sha256": checkpoint.raw_sha256,
            "declared_raw_bytes": checkpoint.byte_count,
            "canonical_learned_cuts_sha256": checkpoint.cuts_sha256,
            "declared_status": checkpoint.status,
            "source_critical_no_K4_representation": (
                checkpoint.critical_no_k4_representation
            ),
            "critical_no_K4_representation_records": list(
                checkpoint.critical_no_k4_representation_records
            ),
            "authentication": "external-checkpoint-required",
        },
        "exporter": {
            "filename": exporter_path.name,
            "sha256": sha256_path(exporter_path),
            "spec_binding_sha256": SPEC_SHA256,
            "stdlib_only": True,
        },
        "registries": {
            "structural": {
                "sha256": sha256_bytes(compact_json_bytes(structural_registry)),
                **structural_registry,
            },
            "theorem": {
                "sha256": sha256_bytes(compact_json_bytes(theorem_registry)),
                **theorem_registry,
            },
            "variables_sha256": variables_meta["sha256"],
        },
        "formula": {
            "complete_booleanization": True,
            "base_complete": encoding.base_complete,
            "learned_cuts_complete": encoding.learned_complete,
            "exported_critical_no_K4_representation": (
                EXPORTED_CRITICAL_NO_K4_REPRESENTATION
            ),
            "variable_count": encoding.variables.count,
            "clause_count": encoding.ledger.count,
            "variable_family_ranges": encoding.variables.family_ranges(),
            "clause_phase_ranges": encoding.phase_ranges,
            "learned_cut_counts": {
                "connectivity": len(checkpoint.connectivity),
                "structural": len(checkpoint.structural),
                "theorem": len(checkpoint.theorem),
            },
        },
        "artifacts": {
            "start.cnf": _artifact_entry("start.cnf", cnf_meta),
            "variables.json": _artifact_entry(
                "variables.json", variables_meta, schema=VARIABLE_SCHEMA
            ),
            "clause-provenance.json": _artifact_entry(
                "clause-provenance.json",
                provenance_meta,
                schema=PROVENANCE_SCHEMA,
            ),
            "learned-cuts.json": _artifact_entry(
                "learned-cuts.json",
                learned_cuts_meta,
                schema=LEARNED_CUTS_PACKAGE_SCHEMA,
            ),
        },
        "canonicalization": {
            "json": "UTF-8 ASCII subset, sorted keys, indent 2, one trailing newline",
            "dimacs": "one canonical clause per line; literals sorted by absolute id",
            "variable_order": "fixed family loops recorded in variables.json",
            "edge_equivalence": (
                "136 canonical undirected edges receive 8-bit class labels; "
                "EdgeEq is bit-vector equality; E aliases EdgeEq"
            ),
            "cyclic_order": (
                "fixed cross-block order plus no-three-cycle tournaments within "
                "the t, indexed, and s movable blocks"
            ),
            "between": "canonical endpoint BTW aliases XOR of the two LT comparisons",
            "learned_cuts": (
                "strictly sorted unique v7 keys retained exactly, including any "
                "checkpoint-recorded logical redundancies"
            ),
        },
        "epistemic_status": {
            "classification": "INPUT_FORMULA_ONLY",
            "declared_source_status": checkpoint.status,
            "unsat_claim": False,
            "closure_claim": False,
        },
        "trust_boundary": {
            "solver_invoked": False,
            "lrat_checked": False,
            "lean_kernel_checked": False,
            "source_authentication": "external-checkpoint-required",
            "claim": (
                "deterministic Booleanization reconstructed from packaged "
                "canonical learned-cut keys; original checkpoint authentication "
                "requires an external checkpoint"
            ),
        },
    }
    _atomic_write_bytes(
        destination / "manifest.json", canonical_json_bytes(manifest)
    )
    if {entry.name for entry in destination.iterdir()} != package_filenames:
        raise EncodingError("incomplete materialized package")
    return manifest


def materialize(
    checkpoint: str | Path | FrozenCheckpoint,
    output_dir: str | Path,
) -> dict[str, Any]:
    """Build and write the five-file deterministic CNF package."""

    frozen = (
        checkpoint
        if isinstance(checkpoint, FrozenCheckpoint)
        else load_checkpoint(checkpoint)
    )
    encoding = build_base(frozen.arm, frozen.force_shared_fourth)
    add_learned_cuts(encoding, frozen)
    return _write_package(encoding, output_dir)


def _read_canonical_json(path: Path, expected_schema: str) -> tuple[dict[str, Any], bytes]:
    try:
        raw = path.read_bytes()
    except OSError as exc:
        raise EncodingError(("unreadable-package-artifact", path.name, str(exc))) from exc
    payload = _json_without_duplicate_keys(raw, label=path.name)
    if not isinstance(payload, dict) or payload.get("schema") != expected_schema:
        raise EncodingError(("package-schema-mismatch", path.name, payload.get("schema") if isinstance(payload, dict) else None))
    if raw != canonical_json_bytes(payload):
        raise EncodingError(("noncanonical-package-json", path.name))
    return payload, raw


def _verify_variable_payload(payload: Mapping[str, Any]) -> None:
    variables = payload.get("variables")
    if not isinstance(variables, list) or payload.get("count") != len(variables):
        raise EncodingError("variable registry count drift")
    seen_keys: set[tuple[Any, ...]] = set()
    rebuilt_ranges: list[dict[str, Any]] = []
    for expected_id, row in enumerate(variables, 1):
        if not isinstance(row, dict) or row.get("id") != expected_id:
            raise EncodingError(("noncanonical-variable-id", expected_id))
        family = row.get("family")
        args = row.get("args")
        if not isinstance(family, str) or not isinstance(args, list):
            raise EncodingError(("invalid-variable-row", expected_id))
        key = (family, *args)
        if key in seen_keys:
            raise EncodingError(("duplicate-variable-key", key))
        seen_keys.add(key)
        rendered = ",".join(str(arg) for arg in args)
        if row.get("name") != f"{family}({rendered})":
            raise EncodingError(("variable-name-drift", expected_id))
        if rebuilt_ranges and rebuilt_ranges[-1]["family"] == family:
            rebuilt_ranges[-1]["last"] = expected_id
            rebuilt_ranges[-1]["count"] += 1
        else:
            rebuilt_ranges.append({
                "family": family,
                "first": expected_id,
                "last": expected_id,
                "count": 1,
            })
    if payload.get("family_ranges") != rebuilt_ranges:
        raise EncodingError("variable family range drift")


def _verify_ranges(
    ranges: Any, total: int, *, label: str, allow_empty: bool = False
) -> None:
    if not isinstance(ranges, list):
        raise EncodingError(("invalid-ranges", label))
    expected_first = 1
    for row in ranges:
        if not isinstance(row, dict):
            raise EncodingError(("invalid-range-row", label))
        count = row.get("count")
        first = row.get("first")
        last = row.get("last")
        if count == 0 and allow_empty:
            if first is not None or last is not None:
                raise EncodingError(("noncanonical-empty-range", label))
            continue
        if type(count) is not int or count <= 0:
            raise EncodingError(("invalid-range-count", label, count))
        if first != expected_first or last != first + count - 1:
            raise EncodingError(("noncontiguous-ranges", label, expected_first, first, last))
        expected_first = last + 1
    if expected_first != total + 1:
        raise EncodingError(("range-total-drift", label, expected_first - 1, total))


def _verify_cnf(path: Path, variable_count: int, clause_count: int) -> dict[str, Any]:
    digest = hashlib.sha256()
    byte_count = 0
    seen: set[tuple[int, ...]] = set()
    actual_clauses = 0
    try:
        stream = path.open("rb")
    except OSError as exc:
        raise EncodingError(("unreadable-package-artifact", path.name, str(exc))) from exc
    with stream:
        header_seen = False
        for line_number, raw_line in enumerate(stream, 1):
            digest.update(raw_line)
            byte_count += len(raw_line)
            try:
                line = raw_line.decode("ascii")
            except UnicodeDecodeError as exc:
                raise EncodingError(("non-ascii-dimacs", line_number)) from exc
            if not header_seen:
                expected = f"p cnf {variable_count} {clause_count}\n"
                if line != expected:
                    raise EncodingError(("dimacs-header-drift", line.rstrip("\n"), expected.rstrip("\n")))
                header_seen = True
                continue
            if not line.endswith("\n"):
                raise EncodingError(("unterminated-dimacs-line", line_number))
            fields = line.split()
            if not fields or fields[-1] != "0" or fields.count("0") != 1:
                raise EncodingError(("invalid-dimacs-clause", line_number))
            try:
                literals = tuple(int(value) for value in fields[:-1])
            except ValueError as exc:
                raise EncodingError(("invalid-dimacs-integer", line_number)) from exc
            canonical = ClauseLedger.canonical_literals(literals)
            if canonical is None or canonical != literals:
                raise EncodingError(("noncanonical-dimacs-clause", line_number))
            if any(abs(literal) > variable_count for literal in literals):
                raise EncodingError(("dimacs-variable-out-of-range", line_number))
            if literals in seen:
                raise EncodingError(("duplicate-dimacs-clause", line_number))
            seen.add(literals)
            actual_clauses += 1
    if not header_seen or actual_clauses != clause_count:
        raise EncodingError(("dimacs-clause-count-drift", actual_clauses, clause_count))
    return {"sha256": digest.hexdigest(), "bytes": byte_count}


def _verify_cnf_against_encoding(path: Path, encoding: Encoding) -> dict[str, Any]:
    """Byte-compare DIMACS with a freshly reconstructed canonical encoding."""

    digest = hashlib.sha256()
    byte_count = 0
    try:
        stream = path.open("rb")
    except OSError as exc:
        raise EncodingError((
            "unreadable-package-artifact", path.name, str(exc)
        )) from exc
    with stream:
        expected_header = (
            f"p cnf {encoding.variables.count} {encoding.ledger.count}\n"
        ).encode("ascii")
        actual = stream.readline()
        digest.update(actual)
        byte_count += len(actual)
        if actual != expected_header:
            raise EncodingError("regenerated DIMACS header drift")
        for clause_id, clause in enumerate(encoding.ledger.clauses, 1):
            expected = (
                " ".join(map(str, clause.literals)) + " 0\n"
            ).encode("ascii")
            actual = stream.readline()
            digest.update(actual)
            byte_count += len(actual)
            if actual != expected:
                raise EncodingError((
                    "regenerated-dimacs-clause-drift", clause_id
                ))
        if stream.read(1):
            raise EncodingError("regenerated DIMACS has trailing data")
    return {"sha256": digest.hexdigest(), "bytes": byte_count}


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def verify_package(
    package_dir: str | Path,
    checkpoint: Path | None = None,
) -> dict[str, Any]:
    """Regenerate the formula; optionally authenticate a checkpoint read here."""

    if checkpoint is not None and not isinstance(checkpoint, Path):
        raise EncodingError((
            "external-checkpoint-authentication-requires-path",
            type(checkpoint).__name__,
        ))

    package = Path(package_dir)
    required_files = {
        "start.cnf", "variables.json", "clause-provenance.json",
        "learned-cuts.json", "manifest.json",
    }
    try:
        entries = list(package.iterdir())
    except OSError as exc:
        raise EncodingError((
            "unreadable-package-directory", package.name, str(exc)
        )) from exc
    actual_files = {entry.name for entry in entries if entry.is_file()}
    nested_entries = [entry.name for entry in entries if not entry.is_file()]
    if actual_files != required_files or nested_entries:
        raise EncodingError((
            "noncanonical-package-file-set",
            sorted(actual_files),
            sorted(nested_entries),
        ))

    manifest, _manifest_raw = _read_canonical_json(
        package / "manifest.json", PACKAGE_SCHEMA
    )
    _variables, variables_raw = _read_canonical_json(
        package / "variables.json", VARIABLE_SCHEMA
    )
    _provenance, provenance_raw = _read_canonical_json(
        package / "clause-provenance.json", PROVENANCE_SCHEMA
    )
    learned_cuts, learned_cuts_raw = _read_canonical_json(
        package / "learned-cuts.json", LEARNED_CUTS_PACKAGE_SCHEMA
    )
    packaged_checkpoint = _checkpoint_from_packaged_cuts(learned_cuts)

    # The learned-cut artifact is the standalone formula input.  Reconstruct
    # every derived artifact instead of trusting mutually consistent digests.
    expected_encoding = build_base(
        packaged_checkpoint.arm,
        packaged_checkpoint.force_shared_fourth,
    )
    add_learned_cuts(expected_encoding, packaged_checkpoint)
    expected_variables_raw = canonical_json_bytes(
        _variable_payload(expected_encoding)
    )
    if variables_raw != expected_variables_raw:
        raise EncodingError("regenerated variable registry drift")
    expected_provenance_raw = canonical_json_bytes(
        _provenance_payload(expected_encoding)
    )
    if provenance_raw != expected_provenance_raw:
        raise EncodingError("regenerated clause provenance drift")
    cnf_meta = _verify_cnf_against_encoding(
        package / "start.cnf", expected_encoding
    )

    if set(manifest) != {
        "schema", "bounded_instance", "source_checkpoint", "exporter",
        "registries", "formula", "artifacts", "canonicalization",
        "epistemic_status", "trust_boundary",
    }:
        raise EncodingError("noncanonical manifest fields")
    source = manifest.get("source_checkpoint")
    if not isinstance(source, dict) or set(source) != {
        "result_schema", "learned_cut_schema", "declared_raw_sha256",
        "declared_raw_bytes", "canonical_learned_cuts_sha256",
        "declared_status", "source_critical_no_K4_representation",
        "critical_no_K4_representation_records", "authentication",
    }:
        raise EncodingError("noncanonical source checkpoint declaration")
    if (
        source.get("result_schema") != RESULT_SCHEMA
        or source.get("learned_cut_schema") != CUT_SCHEMA
        or not _is_sha256(source.get("declared_raw_sha256"))
        or type(source.get("declared_raw_bytes")) is not int
        or source["declared_raw_bytes"] <= 0
        or not isinstance(source.get("declared_status"), str)
        or not source["declared_status"]
        or source.get("authentication") != "external-checkpoint-required"
    ):
        raise EncodingError("invalid source checkpoint declaration")
    if source.get("canonical_learned_cuts_sha256") != (
        packaged_checkpoint.cuts_sha256
    ):
        raise EncodingError("packaged learned-cut digest drift")
    if source.get("source_critical_no_K4_representation") != (
        packaged_checkpoint.critical_no_k4_representation
    ):
        raise EncodingError("source representation binding drift")
    representation_records = source.get(
        "critical_no_K4_representation_records"
    )
    if representation_records not in (
        [], ["result"], ["learned_cuts"], ["result", "learned_cuts"]
    ):
        raise EncodingError("invalid representation record provenance")

    variable_count = expected_encoding.variables.count
    clause_count = expected_encoding.ledger.count
    bounded = {
        "n": N,
        "names": list(NAMES),
        "closed_cap_profile": list(PROFILE),
        "arm": packaged_checkpoint.arm,
        "force_shared_fourth": packaged_checkpoint.force_shared_fourth,
    }
    if manifest.get("bounded_instance") != bounded:
        raise EncodingError("bounded instance drift")
    expected_formula = {
        "complete_booleanization": True,
        "base_complete": True,
        "learned_cuts_complete": True,
        "exported_critical_no_K4_representation": (
            EXPORTED_CRITICAL_NO_K4_REPRESENTATION
        ),
        "variable_count": variable_count,
        "clause_count": clause_count,
        "variable_family_ranges": expected_encoding.variables.family_ranges(),
        "clause_phase_ranges": expected_encoding.phase_ranges,
        "learned_cut_counts": {
            "connectivity": len(packaged_checkpoint.connectivity),
            "structural": len(packaged_checkpoint.structural),
            "theorem": len(packaged_checkpoint.theorem),
        },
    }
    if manifest.get("formula") != expected_formula:
        raise EncodingError("manifest formula binding drift")

    exporter_path = Path(__file__)
    if manifest.get("exporter") != {
        "filename": exporter_path.name,
        "sha256": sha256_path(exporter_path),
        "spec_binding_sha256": SPEC_SHA256,
        "stdlib_only": True,
    }:
        raise EncodingError("exporter binding drift")
    structural_registry = json.loads(compact_json_bytes({
        "schema": CUT_SCHEMA,
        "families": list(STRUCTURAL_FAMILIES),
    }))
    theorem_registry = json.loads(compact_json_bytes({
        "schema": CUT_SCHEMA,
        "families": list(FULL_BANK_FAMILIES),
        "schemas": SPEC_BINDING["theorem_schemas"],
    }))
    variables_meta = {
        "sha256": sha256_bytes(variables_raw),
        "bytes": len(variables_raw),
    }
    expected_registries = {
        "structural": {
            "sha256": sha256_bytes(compact_json_bytes(structural_registry)),
            **structural_registry,
        },
        "theorem": {
            "sha256": sha256_bytes(compact_json_bytes(theorem_registry)),
            **theorem_registry,
        },
        "variables_sha256": variables_meta["sha256"],
    }
    if manifest.get("registries") != expected_registries:
        raise EncodingError("registry binding drift")

    provenance_meta = {
        "sha256": sha256_bytes(provenance_raw),
        "bytes": len(provenance_raw),
    }
    learned_cuts_meta = {
        "sha256": sha256_bytes(learned_cuts_raw),
        "bytes": len(learned_cuts_raw),
    }
    expected_artifacts = {
        "start.cnf": _artifact_entry("start.cnf", cnf_meta),
        "variables.json": _artifact_entry(
            "variables.json", variables_meta, schema=VARIABLE_SCHEMA
        ),
        "clause-provenance.json": _artifact_entry(
            "clause-provenance.json",
            provenance_meta,
            schema=PROVENANCE_SCHEMA,
        ),
        "learned-cuts.json": _artifact_entry(
            "learned-cuts.json",
            learned_cuts_meta,
            schema=LEARNED_CUTS_PACKAGE_SCHEMA,
        ),
    }
    if manifest.get("artifacts") != expected_artifacts:
        raise EncodingError("manifest artifact registry drift")

    expected_canonicalization = {
        "json": "UTF-8 ASCII subset, sorted keys, indent 2, one trailing newline",
        "dimacs": "one canonical clause per line; literals sorted by absolute id",
        "variable_order": "fixed family loops recorded in variables.json",
        "edge_equivalence": (
            "136 canonical undirected edges receive 8-bit class labels; "
            "EdgeEq is bit-vector equality; E aliases EdgeEq"
        ),
        "cyclic_order": (
            "fixed cross-block order plus no-three-cycle tournaments within "
            "the t, indexed, and s movable blocks"
        ),
        "between": "canonical endpoint BTW aliases XOR of the two LT comparisons",
        "learned_cuts": (
            "strictly sorted unique v7 keys retained exactly, including any "
            "checkpoint-recorded logical redundancies"
        ),
    }
    if manifest.get("canonicalization") != expected_canonicalization:
        raise EncodingError("canonicalization declaration drift")
    expected_epistemic = {
        "classification": "INPUT_FORMULA_ONLY",
        "declared_source_status": source["declared_status"],
        "unsat_claim": False,
        "closure_claim": False,
    }
    if manifest.get("epistemic_status") != expected_epistemic:
        raise EncodingError("epistemic declaration drift")
    expected_trust = {
        "solver_invoked": False,
        "lrat_checked": False,
        "lean_kernel_checked": False,
        "source_authentication": "external-checkpoint-required",
        "claim": (
            "deterministic Booleanization reconstructed from packaged "
            "canonical learned-cut keys; original checkpoint authentication "
            "requires an external checkpoint"
        ),
    }
    if manifest.get("trust_boundary") != expected_trust:
        raise EncodingError("trust boundary drift")

    external = load_checkpoint(checkpoint) if checkpoint is not None else None
    source_authenticated = external is not None
    if external is not None:
        expected_source = {
            "result_schema": RESULT_SCHEMA,
            "learned_cut_schema": CUT_SCHEMA,
            "declared_raw_sha256": external.raw_sha256,
            "declared_raw_bytes": external.byte_count,
            "canonical_learned_cuts_sha256": external.cuts_sha256,
            "declared_status": external.status,
            "source_critical_no_K4_representation": (
                external.critical_no_k4_representation
            ),
            "critical_no_K4_representation_records": list(
                external.critical_no_k4_representation_records
            ),
            "authentication": "external-checkpoint-required",
        }
        if source != expected_source:
            raise EncodingError("external checkpoint declaration mismatch")
        if learned_cuts != _learned_cuts_package_payload(external):
            raise EncodingError("external checkpoint learned-cut mismatch")

    return {
        "status": (
            "PACKAGE_OK_AUTHENTICATED_SOURCE_INPUT_FORMULA_ONLY"
            if source_authenticated
            else "PACKAGE_OK_SELF_CONSISTENT_UNAUTHENTICATED_SOURCE"
        ),
        "source_authenticated": source_authenticated,
        "arm": packaged_checkpoint.arm,
        "force_shared_fourth": packaged_checkpoint.force_shared_fourth,
        "variable_count": variable_count,
        "clause_count": clause_count,
        "cnf_sha256": cnf_meta["sha256"],
        "declared_source_status": source["declared_status"],
        "source_critical_no_K4_representation": (
            packaged_checkpoint.critical_no_k4_representation
        ),
        "exported_critical_no_K4_representation": (
            EXPORTED_CRITICAL_NO_K4_REPRESENTATION
        ),
        "unsat_claim": False,
    }
