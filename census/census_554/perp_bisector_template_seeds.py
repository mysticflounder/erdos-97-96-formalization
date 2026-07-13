"""Deterministic seeds from the square perpendicular-bisector template.

The canonical role pattern is the four-row, eight-incidence template

``[[1, [2, 3]], [2, [0, 4]], [3, [0, 4]], [4, [2, 3]]]``.

Every injection of its five roles into the eleven Census-554 labels gives a
sparse row pattern.  Swapping roles 2 and 3 does not change that pattern, so
the 55,440 injections have 27,720 distinct images.  This module keeps the
lexicographically least role injection as deterministic provenance, filters
images whose four sparse rows can each be extended to a current card-11
candidate row, and emits a compact artifact.

The artifact stores sparse patterns rather than repeating thousands of nearly
identical proof traces.  Strict validation regenerates, then exactly replays,
an ``equality-perpendicular-bisector-convex`` detection for every seed.  The
returned :class:`ValidatedSeed` values therefore carry the theorem source
hash and executable row/flip equality-closure paths produced by the permanent
formalized structural oracle.  These are convex-structural exclusions, not
Nullstellensatz bank rows.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from functools import cache
import hashlib
from itertools import combinations, permutations
import json
import os
from pathlib import Path
import tempfile
from typing import Any, Iterable, Iterator

from census.census_554 import combinatorics
from census.census_554 import formalized_structural_oracle as oracle


SCHEMA = "census554_perp_bisector_template_seeds.v1"
STAGE = "equality-perpendicular-bisector-convex"
HASH_POLICY = "sha256-canonical-compact-json-with-final-newline-v1"
QUOTIENT_POLICY = "distinct-serialized-row-pattern-keep-least-injection-v1"
TRUST_CLASS = "convex-structural-theorem"

# Immutable Python form of the exact public template.  ``template_json`` below
# is the canonical JSON representation recorded in artifacts.
CANONICAL_TEMPLATE = (
    (1, (2, 3)),
    (2, (0, 4)),
    (3, (0, 4)),
    (4, (2, 3)),
)

SURPLUS_CAP = frozenset({1, 2, 3, 4, 5})
FIRST_OTHER_CAP = frozenset({0, 2, 6, 7, 8})
SECOND_OTHER_CAP = frozenset({0, 1, 9, 10})

ROLE_INJECTION_COUNT = 55_440
DISTINCT_PATTERN_COUNT = 27_720
FEASIBLE_PATTERN_COUNT = 23_250
INFEASIBLE_PATTERN_COUNT = DISTINCT_PATTERN_COUNT - FEASIBLE_PATTERN_COUNT
EXPECTED_CANDIDATE_COUNTS = (210, 43, 16, 210, 210, 210, 210, 210, 210, 210, 210)

# These hashes come from the deterministic enumeration below and are pinned
# as regression contracts by the focused tests.  A changed value means either
# the template, quotient order, candidate profile, or serialization changed.
EXPECTED_ALL_PATTERNS_SHA256 = (
    "780b0b45104f9317af5aa0c71098bb973929d1d36cb1046bf99e94dd791200e5"
)
EXPECTED_FEASIBLE_PATTERNS_SHA256 = (
    "b60cb068fd98efb262ff1d1e63fdb256e827ef7ff47e5d7a5d2efa66e98ee742"
)
EXPECTED_CANDIDATE_PROFILE_SHA256 = (
    "0796412fe113bc84bff6edc46ccda4a4112b47131226be4cdad4eb3e399e0ad0"
)
EXPECTED_ARTIFACT_SHA256 = (
    "dc33dc3a9d7d9a299480df6c334232450e3148551451aca2302345069ae42afc"
)


class PerpBisectorSeedError(ValueError):
    """The template inventory or compact artifact failed exact replay."""


PatternKey = tuple[tuple[int, tuple[int, ...]], ...]


@dataclass(frozen=True, slots=True)
class InjectedPattern:
    """One duplicate-quotiented image and its least role injection."""

    role_injection: tuple[int, int, int, int, int]
    pattern_key: PatternKey

    def as_pattern(self) -> dict[int, frozenset[int]]:
        return {
            center: frozenset(members) for center, members in self.pattern_key
        }


@dataclass(frozen=True, slots=True)
class ValidatedSeed:
    """One row-feasible seed with exactly replayed theorem provenance."""

    role_injection: tuple[int, int, int, int, int]
    pattern_key: PatternKey
    detection: dict[str, Any]
    provenance: dict[str, Any]

    def as_pattern(self) -> dict[int, frozenset[int]]:
        return {
            center: frozenset(members) for center, members in self.pattern_key
        }


@dataclass(frozen=True, slots=True)
class ValidatedArtifact:
    """Strictly regenerated seed inventory ready for structural seeding."""

    schema: str
    seeds: tuple[ValidatedSeed, ...]
    all_patterns_sha256: str
    feasible_patterns_sha256: str
    candidate_profile_sha256: str

    @property
    def pattern_count(self) -> int:
        return len(self.seeds)


def _canonical_json_bytes(value: Any) -> bytes:
    return (
        json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=True,
            allow_nan=False,
        ).encode("utf-8")
        + b"\n"
    )


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _json_pattern(pattern_key: PatternKey) -> dict[str, list[int]]:
    return {
        str(center): list(members) for center, members in pattern_key
    }


def _template_json() -> list[list[Any]]:
    return [[center, list(members)] for center, members in CANONICAL_TEMPLATE]


def _pattern_from_injection(
    injection: tuple[int, int, int, int, int],
) -> PatternKey:
    pattern = {
        injection[center]: frozenset(injection[member] for member in members)
        for center, members in CANONICAL_TEMPLATE
    }
    return combinatorics.serialize_pattern(pattern)


@cache
def injected_patterns() -> tuple[InjectedPattern, ...]:
    """Return all distinct card-11 template images in canonical key order."""

    representative: dict[PatternKey, tuple[int, int, int, int, int]] = {}
    for raw in permutations(range(combinatorics.N), 5):
        injection = tuple(raw)
        key = _pattern_from_injection(injection)
        previous = representative.get(key)
        if previous is None or injection < previous:
            representative[key] = injection
    result = tuple(
        InjectedPattern(representative[key], key)
        for key in sorted(representative)
    )
    if len(result) != DISTINCT_PATTERN_COUNT:
        raise PerpBisectorSeedError(
            "template injection quotient has an unexpected cardinality"
        )
    return result


def _one_hit_ok(center: int, members: frozenset[int]) -> bool:
    """Permanent copy of the audited current candidate-profile predicate."""

    if center == 1:
        return (
            len(members & (SURPLUS_CAP - {1})) <= 1
            and len(members & (SECOND_OTHER_CAP - {1})) <= 1
        )
    if center == 2:
        return (
            len(members & (SURPLUS_CAP - {2})) <= 1
            and len(members & (FIRST_OTHER_CAP - {2})) <= 1
        )
    return True


@cache
def candidate_profile() -> tuple[tuple[tuple[int, ...], ...], ...]:
    """Current C1 plus one-hit card-11 candidate rows, center by center."""

    profile = tuple(
        tuple(
            row
            for row in combinations(
                tuple(label for label in range(combinatorics.N) if label != center),
                4,
            )
            if _one_hit_ok(center, frozenset(row))
        )
        for center in range(combinatorics.N)
    )
    counts = tuple(len(rows) for rows in profile)
    if counts != EXPECTED_CANDIDATE_COUNTS:
        raise PerpBisectorSeedError(
            f"candidate profile count drift: {counts!r}"
        )
    return profile


@cache
def _feasible_pairs() -> tuple[frozenset[tuple[int, int]], ...]:
    return tuple(
        frozenset(
            pair
            for row in rows
            for pair in combinations(row, 2)
        )
        for rows in candidate_profile()
    )


def row_feasible(center: int, required: Iterable[int]) -> bool:
    """Whether one current candidate row at ``center`` contains ``required``."""

    if not isinstance(center, int) or isinstance(center, bool):
        raise PerpBisectorSeedError("row center is not an integer")
    if not 0 <= center < combinatorics.N:
        raise PerpBisectorSeedError("row center is outside the card-11 profile")
    raw_members = tuple(required)
    if any(
        not isinstance(member, int) or isinstance(member, bool)
        for member in raw_members
    ):
        raise PerpBisectorSeedError("row mask contains a non-integer member")
    members = tuple(sorted(set(raw_members)))
    if len(members) != 2:
        raise PerpBisectorSeedError(
            "the square template row mask must contain exactly two members"
        )
    if center in members or any(
        member < 0 or member >= combinatorics.N for member in members
    ):
        return False
    return members in _feasible_pairs()[center]


def pattern_row_feasible(pattern: InjectedPattern) -> bool:
    return all(
        row_feasible(center, members)
        for center, members in pattern.pattern_key
    )


@cache
def feasible_injected_patterns() -> tuple[InjectedPattern, ...]:
    """Return the deterministic individually row-feasible seed inventory."""

    result = tuple(
        pattern for pattern in injected_patterns()
        if pattern_row_feasible(pattern)
    )
    if len(result) != FEASIBLE_PATTERN_COUNT:
        raise PerpBisectorSeedError(
            "row-feasible template inventory has an unexpected cardinality"
        )
    return result


def iter_feasible_patterns() -> Iterator[dict[int, frozenset[int]]]:
    """Yield fresh mappings in deterministic structural-seed order."""

    for injected in feasible_injected_patterns():
        yield injected.as_pattern()


def _candidate_profile_json() -> list[dict[str, Any]]:
    return [
        {"center": center, "rows": [list(row) for row in rows]}
        for center, rows in enumerate(candidate_profile())
    ]


@cache
def inventory_hashes() -> dict[str, str]:
    """Hashes over ordered inventories and the exact candidate-row surface."""

    return {
        "all_patterns_sha256": _sha256_json([
            _json_pattern(item.pattern_key) for item in injected_patterns()
        ]),
        "feasible_patterns_sha256": _sha256_json([
            _json_pattern(item.pattern_key) for item in feasible_injected_patterns()
        ]),
        "candidate_profile_sha256": _sha256_json(_candidate_profile_json()),
    }


def _detector_contract() -> dict[str, Any]:
    family = oracle.FAMILY_BY_STAGE[STAGE]
    return {
        "family_id": family.family_id,
        "stage": STAGE,
        "theorem_id": family.theorem_id,
        "theorem_source": family.theorem_source,
        "theorem_source_sha256": oracle.THEOREM_SOURCE_SHA256[
            family.theorem_source
        ],
        "semantic_scope": family.semantic_scope,
        "closure_path_validator": (
            "census.census_554.formalized_structural_oracle.validate_detection"
        ),
    }


def _seed_json(item: InjectedPattern) -> dict[str, Any]:
    return {
        "role_injection": list(item.role_injection),
        "pattern": _json_pattern(item.pattern_key),
    }


def build_seed_artifact() -> dict[str, Any]:
    """Build the compact deterministic seed artifact without writing it."""

    assert_pinned_inventory()
    hashes = inventory_hashes()
    return {
        "schema": SCHEMA,
        "template": _template_json(),
        "generator": {
            "label_count": combinatorics.N,
            "role_count": 5,
            "quotient_policy": QUOTIENT_POLICY,
            "candidate_profile": "C1-plus-audited-one-hit-at-centers-1-and-2",
            "hash_policy": HASH_POLICY,
        },
        "counts": {
            "role_injections": ROLE_INJECTION_COUNT,
            "distinct_patterns": DISTINCT_PATTERN_COUNT,
            "row_feasible_patterns": FEASIBLE_PATTERN_COUNT,
            "row_infeasible_patterns": INFEASIBLE_PATTERN_COUNT,
            "candidate_rows_by_center": list(EXPECTED_CANDIDATE_COUNTS),
        },
        "hashes": hashes,
        "detector_contract": _detector_contract(),
        "provenance_contract": {
            "source_kind": "complete-card11-role-injection-enumeration",
            "trust_class": TRUST_CLASS,
            "bank_compatible": False,
            "feasibility_scope": "individual-row-extension-only",
        },
        "seeds": [_seed_json(item) for item in feasible_injected_patterns()],
    }


def seed_artifact_bytes() -> bytes:
    """Canonical bytes suitable for a durable generated artifact."""

    return _canonical_json_bytes(build_seed_artifact())


def artifact_metadata(raw: bytes | None = None) -> dict[str, Any]:
    """Small immutable handoff record for a generated artifact."""

    artifact = seed_artifact_bytes() if raw is None else raw
    return {
        "schema": SCHEMA,
        "artifact_sha256": hashlib.sha256(artifact).hexdigest(),
        "artifact_bytes": len(artifact),
        "pattern_count": FEASIBLE_PATTERN_COUNT,
        **inventory_hashes(),
    }


def write_seed_artifact(path: Path, *, overwrite: bool = False) -> dict[str, Any]:
    """Atomically emit canonical artifact bytes and return their metadata.

    Existing identical bytes are accepted.  Existing different bytes are
    preserved unless ``overwrite`` is explicit.  The function does not touch
    a probe checkpoint, database, or process.
    """

    destination = Path(path)
    raw = seed_artifact_bytes()
    if destination.exists():
        existing = destination.read_bytes()
        if existing == raw:
            return artifact_metadata(raw)
        if not overwrite:
            raise PerpBisectorSeedError(
                f"refusing to replace different artifact bytes: {destination}"
            )
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary_name: str | None = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="wb",
            prefix=f".{destination.name}.",
            suffix=".tmp",
            dir=destination.parent,
            delete=False,
        ) as handle:
            temporary_name = handle.name
            handle.write(raw)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary_name, destination)
        temporary_name = None
    finally:
        if temporary_name is not None:
            try:
                Path(temporary_name).unlink()
            except FileNotFoundError:
                pass
    return artifact_metadata(raw)


def _parse_pattern(value: Any) -> PatternKey:
    if not isinstance(value, dict):
        raise PerpBisectorSeedError("seed pattern is not a JSON object")
    native: dict[int, tuple[int, ...]] = {}
    for raw_center, raw_members in value.items():
        if not isinstance(raw_center, str) or not raw_center.isdigit():
            raise PerpBisectorSeedError("seed center is not a decimal string")
        center = int(raw_center)
        if not isinstance(raw_members, list) or any(
            not isinstance(member, int) or isinstance(member, bool)
            for member in raw_members
        ):
            raise PerpBisectorSeedError("seed row mask is malformed")
        members = tuple(raw_members)
        if members != tuple(sorted(set(members))):
            raise PerpBisectorSeedError(
                "seed row mask is not sorted and duplicate-free"
            )
        native[center] = members
    key = tuple(sorted(native.items()))
    if _json_pattern(key) != value:
        raise PerpBisectorSeedError("seed pattern is not in canonical JSON form")
    return key


def load_pinned_seed_patterns_bytes(
    raw: bytes,
) -> tuple[dict[int, frozenset[int]], ...]:
    """Load exact published bytes for fast probe seeding.

    This path deliberately avoids re-enumerating injections or rerunning the
    theorem detector.  Its trust boundary is the pinned whole-artifact SHA-256;
    use :func:`validate_seed_artifact_bytes` offline before publishing new
    artifact bytes or changing that pin.
    """

    if hashlib.sha256(raw).hexdigest() != EXPECTED_ARTIFACT_SHA256:
        raise PerpBisectorSeedError("seed artifact does not match the pinned hash")
    try:
        payload = json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PerpBisectorSeedError("seed artifact is not valid UTF-8 JSON") from exc
    if raw != _canonical_json_bytes(payload):
        raise PerpBisectorSeedError("seed artifact bytes are not canonical")
    if payload.get("schema") != SCHEMA:
        raise PerpBisectorSeedError("seed artifact has the wrong schema")
    raw_seeds = payload.get("seeds")
    if not isinstance(raw_seeds, list) or len(raw_seeds) != FEASIBLE_PATTERN_COUNT:
        raise PerpBisectorSeedError("seed artifact has the wrong pattern count")
    keys = tuple(_parse_pattern(seed.get("pattern")) for seed in raw_seeds)
    if len(set(keys)) != FEASIBLE_PATTERN_COUNT:
        raise PerpBisectorSeedError("seed artifact contains duplicate patterns")
    if _sha256_json([_json_pattern(key) for key in keys]) != (
        EXPECTED_FEASIBLE_PATTERNS_SHA256
    ):
        raise PerpBisectorSeedError("seed artifact pattern hash has drifted")
    return tuple(
        {center: frozenset(members) for center, members in key}
        for key in keys
    )


def load_pinned_seed_patterns(
    path: Path,
) -> tuple[dict[int, frozenset[int]], ...]:
    """Path wrapper for the no-recomputation pinned probe load."""

    return load_pinned_seed_patterns_bytes(Path(path).read_bytes())


def _validated_seed(item: InjectedPattern) -> ValidatedSeed:
    pattern = item.as_pattern()
    detection = oracle.build_detection(pattern, STAGE)
    oracle.validate_detection(pattern, detection)
    if detection["stage"] != STAGE or not detection["closure_paths"]:
        raise PerpBisectorSeedError(
            "perpendicular-bisector detection lacks its replayable proof trace"
        )
    provenance = {
        "source_kind": "complete-card11-role-injection-enumeration",
        "role_injection": list(item.role_injection),
        "template": _template_json(),
        "quotient_policy": QUOTIENT_POLICY,
        "candidate_profile_sha256": inventory_hashes()[
            "candidate_profile_sha256"
        ],
        "trust_class": TRUST_CLASS,
        "bank_compatible": False,
        "feasibility_scope": "individual-row-extension-only",
    }
    return ValidatedSeed(
        item.role_injection,
        item.pattern_key,
        detection,
        provenance,
    )


def iter_validated_seeds() -> Iterator[ValidatedSeed]:
    """Regenerate and exactly replay every feasible theorem-backed seed."""

    for item in feasible_injected_patterns():
        yield _validated_seed(item)


def validate_seed_artifact_bytes(raw: bytes) -> ValidatedArtifact:
    """Strictly validate compact artifact bytes and replay every detection."""

    if not isinstance(raw, bytes) or not raw.endswith(b"\n"):
        raise PerpBisectorSeedError("seed artifact must end with one newline")
    try:
        payload = json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PerpBisectorSeedError("seed artifact is not valid UTF-8 JSON") from exc
    if raw != _canonical_json_bytes(payload):
        raise PerpBisectorSeedError("seed artifact bytes are not canonical")
    expected = build_seed_artifact()
    if payload != expected:
        raise PerpBisectorSeedError(
            "seed artifact does not exactly regenerate from the pinned template"
        )

    raw_seeds = payload["seeds"]
    if len(raw_seeds) != FEASIBLE_PATTERN_COUNT:
        raise PerpBisectorSeedError("seed artifact has the wrong pattern count")
    validated = []
    for raw_seed, expected_item in zip(raw_seeds, feasible_injected_patterns()):
        if not isinstance(raw_seed, dict) or set(raw_seed) != {
            "role_injection", "pattern"
        }:
            raise PerpBisectorSeedError("seed record has an unexpected schema")
        injection = raw_seed["role_injection"]
        if (
            not isinstance(injection, list)
            or len(injection) != 5
            or any(
                not isinstance(label, int) or isinstance(label, bool)
                for label in injection
            )
            or len(set(injection)) != 5
        ):
            raise PerpBisectorSeedError("seed role injection is malformed")
        key = _parse_pattern(raw_seed["pattern"])
        item = InjectedPattern(tuple(injection), key)
        if item != expected_item:
            raise PerpBisectorSeedError(
                "seed is not the canonical feasible template representative"
            )
        validated.append(_validated_seed(item))

    hashes = payload["hashes"]
    return ValidatedArtifact(
        schema=SCHEMA,
        seeds=tuple(validated),
        all_patterns_sha256=hashes["all_patterns_sha256"],
        feasible_patterns_sha256=hashes["feasible_patterns_sha256"],
        candidate_profile_sha256=hashes["candidate_profile_sha256"],
    )


def validate_seed_artifact(path: Path) -> ValidatedArtifact:
    """Read a compact artifact and fully replay all theorem detections."""

    return validate_seed_artifact_bytes(Path(path).read_bytes())


def assert_pinned_inventory() -> None:
    """Fail if enumeration, profile, or canonical serialization drifted."""

    hashes = inventory_hashes()
    expected = {
        "all_patterns_sha256": EXPECTED_ALL_PATTERNS_SHA256,
        "feasible_patterns_sha256": EXPECTED_FEASIBLE_PATTERNS_SHA256,
        "candidate_profile_sha256": EXPECTED_CANDIDATE_PROFILE_SHA256,
    }
    if hashes != expected:
        raise PerpBisectorSeedError(
            f"pinned inventory hashes drifted: expected {expected!r}, got {hashes!r}"
        )


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Emit or verify Census-554 perpendicular-bisector seeds"
    )
    subparsers = parser.add_subparsers(dest="command", required=True)
    emit = subparsers.add_parser("emit", help="atomically write canonical JSON")
    emit.add_argument("path", type=Path)
    emit.add_argument("--overwrite", action="store_true")
    verify = subparsers.add_parser(
        "verify", help="fully replay every stored theorem detection"
    )
    verify.add_argument("path", type=Path)
    subparsers.add_parser("metadata", help="print deterministic inventory metadata")
    return parser.parse_args()


def main() -> None:
    args = _parse_args()
    if args.command == "emit":
        result = write_seed_artifact(args.path, overwrite=args.overwrite)
    elif args.command == "verify":
        validated = validate_seed_artifact(args.path)
        result = {
            **artifact_metadata(args.path.read_bytes()),
            "validated_patterns": validated.pattern_count,
            "detector_stage": STAGE,
        }
    else:
        result = artifact_metadata()
    print(json.dumps(result, sort_keys=True, indent=2))


if __name__ == "__main__":
    main()
