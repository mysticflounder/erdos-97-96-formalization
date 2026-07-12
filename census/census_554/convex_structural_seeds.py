"""Validated convex-structural exclusions for frozen Census-554 probes.

This module deliberately keeps structural theorem seeds separate from the
Nullstellensatz certificate bank.  A seed is usable only after all of its
finite equality-closure paths have been replayed against the exact stored row
pattern and its source frontier result and Lean theorem source hashes match.

The generated exclusions are profile-automorphism images of a theorem-backed
four-row core.  They are not bank rows, do not carry polynomial certificates,
and are sound only in the convex-independent realization context recorded in
the artifact.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from datetime import datetime, timezone
import hashlib
from itertools import combinations
import json
import os
from pathlib import Path
import secrets
from typing import Any, Iterable, Mapping, Sequence

from census.census_554 import combinatorics


SCHEMA = "census554_convex_structural_seeds.v1"
PROBE_SCHEMA = "census554_frozen_separation_probe.v1"
MANIFEST_SCHEMA = "census554_convex_structural_seed_run.v1"
GENERIC_THEOREM = (
    "Problem97.Census554."
    "false_of_convexIndep_of_fourRowPerpBisectorCore"
)
EXACT_THEOREM = (
    "Problem97.Census554.FourRowPerpBisector."
    "false_of_convexRealization"
)
THEOREM_MODULE = "Erdos9796Proof.P97.Census554.FourRowPerpBisector"
THEOREM_SOURCE = Path(
    "lean/Erdos9796Proof/P97/Census554/FourRowPerpBisector.lean"
)
LEAN_BUILD_COMMAND = (
    "lake-build Erdos9796Proof.P97.Census554.FourRowPerpBisector"
)
EXPECTED_AXIOMS = ["propext", "Classical.choice", "Quot.sound"]
REPO_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_WORK_ROOT = (
    REPO_ROOT / "scratch/census-554/frontier_analysis_runs"
)

FOUR_ROW_FOCI = (1, 6)
FOUR_ROW_WITNESSES = (3, 8, 10)
FOUR_ROW_PATTERN = {
    1: frozenset({3, 8}),
    3: frozenset({1, 6}),
    6: frozenset({3, 8}),
    10: frozenset({1, 6}),
}

REQUESTED_FOCI = (1, 4)
REQUESTED_WITNESSES = (3, 5, 9)
REQUESTED_PATTERN = {
    3: frozenset({1, 6}),
    4: frozenset({3, 6}),
    5: frozenset({1, 4}),
    6: frozenset({3, 4}),
    9: frozenset({1, 4}),
}

SEMANTIC_SCOPE = (
    "Excludes injective planar realizations of the stored row pattern only "
    "when every realized label belongs to one convex-independent finite "
    "carrier. It is not an unconditional Nullstellensatz dead-row claim."
)


class StructuralSeedError(ValueError):
    """Raised when a structural seed or its provenance is invalid."""


@dataclass(frozen=True)
class ValidatedArtifact:
    """Strictly validated, normalized view consumed by a future probe."""

    schema: str
    patterns: tuple[dict[int, frozenset[int]], ...]
    records: tuple[dict[str, Any], ...]
    record_count: int
    theorem_ids: tuple[str, ...]
    source_sha256: str
    source_result_sha256: str
    profile_orbit_keys: tuple[tuple[tuple[int, tuple[int, ...]], ...], ...]
    source_result_path: Path
    source_result_bytes: bytes
    theorem_source_path: Path
    theorem_source_bytes: bytes
    theorem_build_status: str
    theorem_source_sha256: str
    theorem_contract_sha256: str


def _sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, indent=2).encode("utf-8") + b"\n"


def _json_pattern(pattern: Mapping[int, Iterable[int]]) -> dict[str, list[int]]:
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def _native_pattern(pattern: Mapping[str | int, Iterable[int]]) -> dict[int, frozenset[int]]:
    if not isinstance(pattern, Mapping):
        raise StructuralSeedError("pattern is not a mapping")
    native: dict[int, frozenset[int]] = {}
    for raw_center, raw_members in pattern.items():
        if isinstance(raw_center, bool):
            raise StructuralSeedError("pattern center is Boolean")
        try:
            center = int(raw_center)
        except (TypeError, ValueError) as exc:
            raise StructuralSeedError("pattern center is not integer-valued") from exc
        if not 0 <= center < combinatorics.N:
            raise StructuralSeedError("pattern center is out of range")
        if not isinstance(raw_members, list):
            raise StructuralSeedError("pattern mask is not a JSON list")
        members: list[int] = []
        for member in raw_members:
            if not isinstance(member, int) or isinstance(member, bool):
                raise StructuralSeedError("pattern member is not an integer")
            if not 0 <= member < combinatorics.N:
                raise StructuralSeedError("pattern member is out of range")
            members.append(member)
        if members != sorted(set(members)):
            raise StructuralSeedError("pattern mask is not sorted and duplicate-free")
        native[center] = frozenset(members)
    if _json_pattern(native) != pattern:
        raise StructuralSeedError("pattern is not in canonical JSON form")
    return native


def _row_step(center: int, first: int, second: int) -> dict[str, Any]:
    return {
        "kind": "row",
        "center": center,
        "first": first,
        "second": second,
    }


def _flip_step(first: int, second: int) -> dict[str, Any]:
    return {"kind": "flip", "first": first, "second": second}


def _path(
    witness: int,
    first: tuple[int, int],
    last: tuple[int, int],
    steps: Sequence[dict[str, Any]],
) -> dict[str, Any]:
    return {
        "witness": witness,
        "first": list(first),
        "last": list(last),
        "steps": list(steps),
    }


def _four_row_paths() -> list[dict[str, Any]]:
    return [
        _path(3, (3, 1), (3, 6), [_row_step(3, 1, 6)]),
        _path(
            8,
            (8, 1),
            (8, 6),
            [
                _flip_step(8, 1),
                _row_step(1, 8, 3),
                _flip_step(1, 3),
                _row_step(3, 1, 6),
                _flip_step(3, 6),
                _row_step(6, 3, 8),
                _flip_step(6, 8),
            ],
        ),
        _path(10, (10, 1), (10, 6), [_row_step(10, 1, 6)]),
    ]


def _requested_paths() -> list[dict[str, Any]]:
    return [
        _path(
            3,
            (3, 1),
            (3, 4),
            [
                _row_step(3, 1, 6),
                _flip_step(3, 6),
                _row_step(6, 3, 4),
                _flip_step(6, 4),
                _row_step(4, 6, 3),
                _flip_step(4, 3),
            ],
        ),
        _path(5, (5, 1), (5, 4), [_row_step(5, 1, 4)]),
        _path(9, (9, 1), (9, 4), [_row_step(9, 1, 4)]),
    ]


def _step_endpoints(step: Mapping[str, Any]) -> tuple[tuple[int, int], tuple[int, int]]:
    kind = step.get("kind")
    if kind == "row" and set(step) == {"kind", "center", "first", "second"}:
        center = step["center"]
        first = step["first"]
        second = step["second"]
        values = (center, first, second)
        if any(not isinstance(value, int) or isinstance(value, bool) for value in values):
            raise StructuralSeedError("row step has a non-integer label")
        return (center, first), (center, second)
    if kind == "flip" and set(step) == {"kind", "first", "second"}:
        first = step["first"]
        second = step["second"]
        values = (first, second)
        if any(not isinstance(value, int) or isinstance(value, bool) for value in values):
            raise StructuralSeedError("flip step has a non-integer label")
        return (first, second), (second, first)
    raise StructuralSeedError("closure path has an unexpected primitive step schema")


def _validate_path(pattern: Mapping[int, frozenset[int]], path: Mapping[str, Any]) -> None:
    required = {"witness", "first", "last", "steps"}
    if not isinstance(path, Mapping) or set(path) != required:
        raise StructuralSeedError("closure path has an unexpected schema")
    first = path["first"]
    last = path["last"]
    if (
        not isinstance(first, list)
        or not isinstance(last, list)
        or len(first) != 2
        or len(last) != 2
        or any(not isinstance(value, int) or isinstance(value, bool) for value in first + last)
    ):
        raise StructuralSeedError("closure path endpoints are malformed")
    witness = path["witness"]
    if not isinstance(witness, int) or isinstance(witness, bool):
        raise StructuralSeedError("closure path witness is malformed")
    if first[0] != witness or last[0] != witness:
        raise StructuralSeedError("closure path endpoints do not use its witness")
    if not isinstance(path["steps"], list):
        raise StructuralSeedError("closure path steps are not a list")
    current = tuple(first)
    for step in path["steps"]:
        if not isinstance(step, Mapping):
            raise StructuralSeedError("closure path step is not a mapping")
        source, target = _step_endpoints(step)
        if source != current:
            raise StructuralSeedError("closure path primitive steps do not compose")
        if step["kind"] == "row":
            center = step["center"]
            if (
                step["first"] not in pattern.get(center, frozenset())
                or step["second"] not in pattern.get(center, frozenset())
            ):
                raise StructuralSeedError(
                    "closure path row step is not generated by the stored pattern"
                )
        current = target
    if current != tuple(last):
        raise StructuralSeedError("closure path does not reach its stored endpoint")


def _used_row_pattern(paths: Sequence[Mapping[str, Any]]) -> dict[int, frozenset[int]]:
    used: dict[int, set[int]] = {}
    for path in paths:
        for step in path["steps"]:
            if step["kind"] != "row":
                continue
            used.setdefault(step["center"], set()).update(
                (step["first"], step["second"])
            )
    return {center: frozenset(members) for center, members in used.items()}


def _edge_key(edge: tuple[int, int]) -> tuple[int, int]:
    return tuple(sorted(edge))


def _rows_connect_targets(
    cube: Mapping[int, frozenset[int]],
    rows: Sequence[int],
    targets: Sequence[tuple[tuple[int, int], tuple[int, int]]],
) -> bool:
    graph: dict[tuple[int, int], set[tuple[int, int]]] = {}
    for center in rows:
        incident = [_edge_key((center, member)) for member in cube[center]]
        for edge in incident:
            graph.setdefault(edge, set()).update(incident)

    def connected(first: tuple[int, int], last: tuple[int, int]) -> bool:
        start = _edge_key(first)
        goal = _edge_key(last)
        seen = {start}
        pending = [start]
        for current in pending:
            for nxt in graph.get(current, ()):
                if nxt not in seen:
                    seen.add(nxt)
                    pending.append(nxt)
        return goal in seen

    return all(connected(first, last) for first, last in targets)


def _minimum_row_subsets(
    cube: Mapping[int, frozenset[int]],
    foci: tuple[int, int],
    witnesses: tuple[int, ...],
) -> tuple[int, list[tuple[int, ...]]]:
    targets = [((witness, foci[0]), (witness, foci[1])) for witness in witnesses]
    centers = tuple(sorted(cube))
    for count in range(len(centers) + 1):
        solutions = [
            rows
            for rows in combinations(centers, count)
            if _rows_connect_targets(cube, rows, targets)
        ]
        if solutions:
            return count, solutions
    raise StructuralSeedError("source cube does not contain the claimed equality core")


def _minimization_record(
    cube: Mapping[int, frozenset[int]],
    pattern: Mapping[int, frozenset[int]],
    foci: tuple[int, int],
    witnesses: tuple[int, ...],
) -> dict[str, Any]:
    minimum, solutions = _minimum_row_subsets(cube, foci, witnesses)
    incidences = sum(len(mask) for mask in pattern.values())
    return {
        "method": (
            "Exhaust all subsets of source-cube row centers using full masks; "
            "then use the two-incidences-per-active-row lower bound."
        ),
        "minimum_active_rows": minimum,
        "optimal_row_subsets": [list(rows) for rows in solutions],
        "selected_active_rows": len(pattern),
        "minimum_row_incidences": 2 * minimum,
        "selected_row_incidences": incidences,
    }


def _validate_minimization(
    record: Mapping[str, Any],
    cube: Mapping[int, frozenset[int]],
    pattern: Mapping[int, frozenset[int]],
    foci: tuple[int, int],
    witnesses: tuple[int, ...],
) -> None:
    expected = _minimization_record(cube, pattern, foci, witnesses)
    if record != expected:
        raise StructuralSeedError("stored minimization record does not replay exactly")
    if expected["selected_active_rows"] != expected["minimum_active_rows"]:
        raise StructuralSeedError("stored core does not attain the minimum row count")
    if expected["selected_row_incidences"] != expected["minimum_row_incidences"]:
        raise StructuralSeedError("stored core does not attain the incidence lower bound")


def _four_row_memberships() -> list[dict[str, Any]]:
    return [
        {"field": "p_mem_a", "row": 1, "member": 3},
        {"field": "q_mem_a", "row": 1, "member": 8},
        {"field": "p_mem_b", "row": 6, "member": 3},
        {"field": "q_mem_b", "row": 6, "member": 8},
        {"field": "a_mem_p", "row": 3, "member": 1},
        {"field": "b_mem_p", "row": 3, "member": 6},
        {"field": "a_mem_r", "row": 10, "member": 1},
        {"field": "b_mem_r", "row": 10, "member": 6},
    ]


def _core_record(
    *,
    kind: str,
    foci: tuple[int, int],
    witnesses: tuple[int, ...],
    pattern: Mapping[int, frozenset[int]],
    paths: Sequence[dict[str, Any]],
    minimization: Mapping[str, Any],
    memberships: Sequence[dict[str, Any]] | None = None,
) -> dict[str, Any]:
    result = {
        "core_kind": kind,
        "foci": list(foci),
        "witnesses": list(witnesses),
        "pattern": _json_pattern(pattern),
        "closure_paths": list(paths),
        "minimization": dict(minimization),
    }
    if memberships is not None:
        result["memberships"] = list(memberships)
    return result


def _map_step(step: Mapping[str, Any], mapping: Mapping[int, int]) -> dict[str, Any]:
    if step["kind"] == "row":
        return _row_step(
            mapping[step["center"]],
            mapping[step["first"]],
            mapping[step["second"]],
        )
    return _flip_step(mapping[step["first"]], mapping[step["second"]])


def _map_path(path: Mapping[str, Any], mapping: Mapping[int, int]) -> dict[str, Any]:
    return _path(
        mapping[path["witness"]],
        (mapping[path["first"][0]], mapping[path["first"][1]]),
        (mapping[path["last"][0]], mapping[path["last"][1]]),
        [_map_step(step, mapping) for step in path["steps"]],
    )


def _theorem_reference(
    source_sha256: str,
    theorem_build: Mapping[str, Any],
) -> dict[str, Any]:
    return {
        "generic": GENERIC_THEOREM,
        "exact_instance": EXACT_THEOREM,
        "module": THEOREM_MODULE,
        "source_path": str(THEOREM_SOURCE),
        "source_sha256": source_sha256,
        "theorem_build": dict(theorem_build),
        "json_paths_emitted_as_lean_certificates": False,
    }


def passed_theorem_build(source_sha256: str) -> dict[str, Any]:
    """Exact durable record supplied by the authorized targeted Lean audit."""

    return {
        "status": "passed",
        "command": LEAN_BUILD_COMMAND,
        "source_sha256": source_sha256,
        "axiom_audits": {
            GENERIC_THEOREM: list(EXPECTED_AXIOMS),
            EXACT_THEOREM: list(EXPECTED_AXIOMS),
        },
        "claim": (
            "The targeted module build passed and both theorem axiom audits "
            "reported exactly propext, Classical.choice, and Quot.sound. "
            "The JSON closure paths remain executable finite data and were "
            "not emitted or kernel-checked as Lean certificates."
        ),
    }


def current_passed_theorem_build() -> dict[str, Any]:
    """Construct the exact passed-build record for the current theorem bytes."""

    return passed_theorem_build(_sha256_file(REPO_ROOT / THEOREM_SOURCE))


def _exclusion_records(
    theorem_reference: Mapping[str, Any],
) -> list[dict[str, Any]]:
    records = []
    source_paths = _four_row_paths()
    for image, mapping in combinatorics.orbit_with_maps(FOUR_ROW_PATTERN):
        mapped_paths = [_map_path(path, mapping) for path in source_paths]
        record = {
            "pattern": _json_pattern(image),
            "core": {
                "core_kind": "FourRowPerpBisectorCore",
                "foci": [mapping[label] for label in FOUR_ROW_FOCI],
                "witnesses": [mapping[label] for label in FOUR_ROW_WITNESSES],
                "closure_paths": mapped_paths,
            },
            "theorem": dict(theorem_reference),
            "provenance": {
                "source_kind": "convex_structural_core",
                "embedding_kind": "census554_profile_automorphism",
                "source_core_index": 0,
                "source_to_image": [
                    [source, mapping[source]] for source in sorted(mapping)
                ],
                "trust_class": "convex-structural-theorem",
                "bank_compatible": False,
            },
            "semantic_scope": SEMANTIC_SCOPE,
        }
        records.append(record)
    return records


def _resolve_recorded_path(raw_path: str) -> Path:
    path = Path(raw_path)
    return path if path.is_absolute() else REPO_ROOT / path


def _record_path(path: Path) -> str:
    resolved = path.resolve()
    try:
        return str(resolved.relative_to(REPO_ROOT))
    except ValueError:
        return str(resolved)


def _parse_probe_result(
    raw: bytes, *, source: str
) -> tuple[dict[str, Any], bytes, dict[int, frozenset[int]]]:
    try:
        result = json.loads(raw)
    except json.JSONDecodeError as exc:
        raise StructuralSeedError(
            f"invalid probe result JSON at {source}: {exc}"
        ) from exc
    if not isinstance(result, dict):
        raise StructuralSeedError("probe result is not a JSON object")
    if result.get("schema") != PROBE_SCHEMA:
        raise StructuralSeedError("probe result has the wrong schema")
    if result.get("status") != "combined-frontier":
        raise StructuralSeedError("probe result is not a combined frontier")
    if result.get("independent_cube_ok") is not True:
        raise StructuralSeedError("probe result lacks independent cube validation")
    if result.get("independent_selected_orders_valid") is not True:
        raise StructuralSeedError("probe result lacks independent order validation")
    cube = _native_pattern(result.get("cube"))
    if set(cube) != set(range(combinatorics.N)):
        raise StructuralSeedError("probe cube does not have all 11 rows")
    if any(len(mask) != 4 for mask in cube.values()):
        raise StructuralSeedError("probe cube rows do not all have four members")
    for center, members in cube.items():
        if center in members:
            raise StructuralSeedError("probe cube contains a center in its own mask")
    return result, raw, cube


def _read_probe_result(path: Path) -> tuple[dict[str, Any], bytes, dict[int, frozenset[int]]]:
    return _parse_probe_result(path.read_bytes(), source=str(path))


def _ensure_subpattern(
    pattern: Mapping[int, frozenset[int]], cube: Mapping[int, frozenset[int]]
) -> None:
    if any(not members <= cube.get(center, frozenset()) for center, members in pattern.items()):
        raise StructuralSeedError("structural core is not contained in source cube")


def build_seed_artifact(
    probe_result_path: Path,
    *,
    theorem_build: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Build the deterministic seed payload from one validated probe result."""

    result_path = probe_result_path.resolve()
    result, result_raw, cube = _read_probe_result(result_path)
    theorem_source_path = REPO_ROOT / THEOREM_SOURCE
    theorem_source_sha256 = _sha256_file(theorem_source_path)
    source_text = theorem_source_path.read_text(encoding="utf-8")
    for declaration in (
        "structure FourRowPerpBisectorCore",
        "theorem false_of_convexIndep_of_fourRowPerpBisectorCore",
        "theorem false_of_convexRealization",
    ):
        if declaration not in source_text:
            raise StructuralSeedError(
                f"theorem source lacks expected declaration: {declaration}"
            )
    _ensure_subpattern(FOUR_ROW_PATTERN, cube)
    _ensure_subpattern(REQUESTED_PATTERN, cube)

    four_paths = _four_row_paths()
    requested_paths = _requested_paths()
    for path in four_paths:
        _validate_path(FOUR_ROW_PATTERN, path)
    for path in requested_paths:
        _validate_path(REQUESTED_PATTERN, path)
    if _used_row_pattern(four_paths) != FOUR_ROW_PATTERN:
        raise StructuralSeedError("four-row paths do not use exactly the stored pattern")
    if _used_row_pattern(requested_paths) != REQUESTED_PATTERN:
        raise StructuralSeedError("requested paths do not use exactly the stored pattern")

    build_record = dict(theorem_build or {
        "status": "pending",
        "claim": (
            "No build result is recorded. The JSON closure paths are only "
            "executable finite data and are not Lean certificates."
        ),
    })
    theorem_reference = _theorem_reference(
        theorem_source_sha256, build_record
    )
    seed_core = _core_record(
        kind="FourRowPerpBisectorCore",
        foci=FOUR_ROW_FOCI,
        witnesses=FOUR_ROW_WITNESSES,
        pattern=FOUR_ROW_PATTERN,
        paths=four_paths,
        memberships=_four_row_memberships(),
        minimization=_minimization_record(
            cube, FOUR_ROW_PATTERN, FOUR_ROW_FOCI, FOUR_ROW_WITNESSES
        ),
    )
    requested_core = _core_record(
        kind="PerpBisectorCore",
        foci=REQUESTED_FOCI,
        witnesses=REQUESTED_WITNESSES,
        pattern=REQUESTED_PATTERN,
        paths=requested_paths,
        minimization=_minimization_record(
            cube, REQUESTED_PATTERN, REQUESTED_FOCI, REQUESTED_WITNESSES
        ),
    )
    return {
        "schema": SCHEMA,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "source_probe": {
            "result_path": _record_path(result_path),
            "result_sha256": _sha256_bytes(result_raw),
            "schema": result["schema"],
            "status": result["status"],
            "bank_sha256": result.get("bank_sha256"),
            "bank_rows": result.get("bank_rows"),
            "iteration": result.get("iteration"),
        },
        "theorem_contract": theorem_reference,
        "semantic_scope": SEMANTIC_SCOPE,
        "seed_cores": [seed_core],
        "analysis": {
            "requested_fixed_labels_core": requested_core,
            "note": (
                "The requested foci 1,4 core is independently retained here, "
                "but future-probe exclusions use the strictly smaller four-row "
                "core formalized by the cited theorem."
            ),
        },
        "exclusions": _exclusion_records(theorem_reference),
    }


def _validate_memberships(
    memberships: Any, pattern: Mapping[int, frozenset[int]]
) -> None:
    if memberships != _four_row_memberships():
        raise StructuralSeedError("four-row membership fields do not match theorem data")
    if any(item["member"] not in pattern.get(item["row"], ()) for item in memberships):
        raise StructuralSeedError("four-row theorem membership is absent from pattern")


def _validate_core_record(
    record: Mapping[str, Any],
    *,
    cube: Mapping[int, frozenset[int]],
    expected_kind: str,
    expected_foci: tuple[int, int],
    expected_witnesses: tuple[int, ...],
    expected_pattern: Mapping[int, frozenset[int]],
    expect_memberships: bool,
) -> None:
    expected_keys = {
        "core_kind",
        "foci",
        "witnesses",
        "pattern",
        "closure_paths",
        "minimization",
    }
    if expect_memberships:
        expected_keys.add("memberships")
    if not isinstance(record, Mapping) or set(record) != expected_keys:
        raise StructuralSeedError("core record has an unexpected schema")
    if record["core_kind"] != expected_kind:
        raise StructuralSeedError("core record has the wrong kind")
    if record["foci"] != list(expected_foci):
        raise StructuralSeedError("core record has the wrong foci")
    if record["witnesses"] != list(expected_witnesses):
        raise StructuralSeedError("core record has the wrong witnesses")
    labels = (*expected_foci, *expected_witnesses)
    if len(set(labels)) != len(labels):
        raise StructuralSeedError("core foci and witnesses are not distinct")
    pattern = _native_pattern(record["pattern"])
    if pattern != expected_pattern:
        raise StructuralSeedError("core record has the wrong pattern")
    _ensure_subpattern(pattern, cube)
    paths = record["closure_paths"]
    if not isinstance(paths, list) or len(paths) != len(expected_witnesses):
        raise StructuralSeedError("core record has the wrong number of paths")
    if [path.get("witness") for path in paths] != list(expected_witnesses):
        raise StructuralSeedError("core paths do not match its witnesses")
    for witness, path in zip(expected_witnesses, paths):
        if path.get("first") != [witness, expected_foci[0]]:
            raise StructuralSeedError("core path has the wrong first edge")
        if path.get("last") != [witness, expected_foci[1]]:
            raise StructuralSeedError("core path has the wrong last edge")
        _validate_path(pattern, path)
    if _used_row_pattern(paths) != pattern:
        raise StructuralSeedError("core paths do not use exactly its sparse pattern")
    _validate_minimization(
        record["minimization"],
        cube,
        pattern,
        expected_foci,
        expected_witnesses,
    )
    if expect_memberships:
        _validate_memberships(record["memberships"], pattern)


def _validate_theorem_reference(
    reference: Any,
    *,
    theorem_source_override: bytes | Path | None = None,
) -> tuple[dict[str, Any], Path, bytes]:
    required = {
        "generic",
        "exact_instance",
        "module",
        "source_path",
        "source_sha256",
        "theorem_build",
        "json_paths_emitted_as_lean_certificates",
    }
    if not isinstance(reference, dict) or set(reference) != required:
        raise StructuralSeedError("theorem reference has an unexpected schema")
    if reference["generic"] != GENERIC_THEOREM:
        raise StructuralSeedError("theorem reference has the wrong generic theorem")
    if reference["exact_instance"] != EXACT_THEOREM:
        raise StructuralSeedError("theorem reference has the wrong exact theorem")
    if reference["module"] != THEOREM_MODULE:
        raise StructuralSeedError("theorem reference has the wrong module")
    if reference["source_path"] != str(THEOREM_SOURCE):
        raise StructuralSeedError("theorem reference has the wrong source path")
    recorded_source_path = REPO_ROOT / THEOREM_SOURCE
    if theorem_source_override is None:
        theorem_source_bytes = recorded_source_path.read_bytes()
    elif isinstance(theorem_source_override, Path):
        theorem_source_bytes = theorem_source_override.read_bytes()
    elif isinstance(theorem_source_override, bytes):
        theorem_source_bytes = theorem_source_override
    else:
        raise StructuralSeedError(
            "theorem source override is neither bytes nor a Path"
        )
    if reference["source_sha256"] != _sha256_bytes(theorem_source_bytes):
        raise StructuralSeedError("theorem source hash has drifted")
    try:
        theorem_source_text = theorem_source_bytes.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise StructuralSeedError("theorem source is not UTF-8") from exc
    for declaration in (
        "structure FourRowPerpBisectorCore",
        "theorem false_of_convexIndep_of_fourRowPerpBisectorCore",
        "theorem false_of_convexRealization",
    ):
        if declaration not in theorem_source_text:
            raise StructuralSeedError(
                f"theorem source lacks expected declaration: {declaration}"
            )
    if reference["json_paths_emitted_as_lean_certificates"] is not False:
        raise StructuralSeedError("artifact falsely claims Lean path certificates")
    build = reference["theorem_build"]
    if not isinstance(build, dict) or build.get("status") not in {"pending", "passed"}:
        raise StructuralSeedError("theorem build status is not explicit")
    if not isinstance(build.get("claim"), str):
        raise StructuralSeedError("theorem build claim is missing")
    if build["status"] == "pending":
        if set(build) != {"status", "claim"}:
            raise StructuralSeedError("pending theorem build has unexpected evidence")
    else:
        expected_build = passed_theorem_build(reference["source_sha256"])
        if build != expected_build:
            raise StructuralSeedError("passed theorem build evidence does not replay")
    return reference, recorded_source_path, theorem_source_bytes


def _validate_exclusions(
    records: Any,
    theorem_reference: Mapping[str, Any],
) -> tuple[dict[int, frozenset[int]], ...]:
    if not isinstance(records, list):
        raise StructuralSeedError("exclusions are not a list")
    expected = _exclusion_records(theorem_reference)
    if records != expected:
        raise StructuralSeedError("structural exclusions do not regenerate exactly")
    patterns = []
    for record in records:
        if set(record) != {"pattern", "core", "theorem", "provenance", "semantic_scope"}:
            raise StructuralSeedError("exclusion record has an unexpected schema")
        pattern = _native_pattern(record["pattern"])
        if record["semantic_scope"] != SEMANTIC_SCOPE:
            raise StructuralSeedError("exclusion loses the convexity scope")
        if record["theorem"] != theorem_reference:
            raise StructuralSeedError("exclusion does not cite the theorem contract")
        provenance = record["provenance"]
        if provenance.get("bank_compatible") is not False:
            raise StructuralSeedError("structural exclusion masquerades as a bank row")
        core = record["core"]
        if core.get("core_kind") != "FourRowPerpBisectorCore":
            raise StructuralSeedError("exclusion has the wrong core kind")
        foci = core.get("foci")
        witnesses = core.get("witnesses")
        if not isinstance(foci, list) or len(foci) != 2:
            raise StructuralSeedError("mapped exclusion foci are malformed")
        if not isinstance(witnesses, list) or len(witnesses) != 3:
            raise StructuralSeedError("mapped exclusion witnesses are malformed")
        if len(set((*foci, *witnesses))) != 5:
            raise StructuralSeedError("mapped exclusion labels are not distinct")
        paths = core.get("closure_paths")
        if not isinstance(paths, list) or len(paths) != 3:
            raise StructuralSeedError("mapped exclusion paths are malformed")
        for witness, path in zip(witnesses, paths):
            if path.get("first") != [witness, foci[0]]:
                raise StructuralSeedError("mapped path has the wrong first edge")
            if path.get("last") != [witness, foci[1]]:
                raise StructuralSeedError("mapped path has the wrong last edge")
            _validate_path(pattern, path)
        if _used_row_pattern(paths) != pattern:
            raise StructuralSeedError("mapped paths do not use exactly their pattern")
        patterns.append(pattern)
    return tuple(patterns)


def validate_seed_artifact_bytes(
    raw: bytes,
    *,
    source_path: Path,
    source_result_override: bytes | Path | None = None,
    theorem_source_override: bytes | Path | None = None,
) -> ValidatedArtifact:
    """Strictly replay one artifact and return normalized exclusion patterns."""

    if not raw.endswith(b"\n"):
        raise StructuralSeedError(f"seed artifact has no final newline: {source_path}")
    try:
        payload = json.loads(raw)
    except json.JSONDecodeError as exc:
        raise StructuralSeedError(f"invalid seed JSON at {source_path}: {exc}") from exc
    required = {
        "schema",
        "created_utc",
        "source_probe",
        "theorem_contract",
        "semantic_scope",
        "seed_cores",
        "analysis",
        "exclusions",
    }
    if not isinstance(payload, dict) or set(payload) != required:
        raise StructuralSeedError("seed artifact has an unexpected top-level schema")
    if payload["schema"] != SCHEMA:
        raise StructuralSeedError("seed artifact has the wrong schema")
    if payload["semantic_scope"] != SEMANTIC_SCOPE:
        raise StructuralSeedError("seed artifact has the wrong semantic scope")
    source = payload["source_probe"]
    source_required = {
        "result_path",
        "result_sha256",
        "schema",
        "status",
        "bank_sha256",
        "bank_rows",
        "iteration",
    }
    if not isinstance(source, dict) or set(source) != source_required:
        raise StructuralSeedError("source probe provenance has an unexpected schema")
    if source["schema"] != PROBE_SCHEMA or source["status"] != "combined-frontier":
        raise StructuralSeedError("source probe provenance has the wrong status")
    recorded_result_path = _resolve_recorded_path(source["result_path"])
    if source_result_override is None:
        result_path = recorded_result_path
        result, result_raw, cube = _read_probe_result(result_path)
    elif isinstance(source_result_override, Path):
        result_path = source_result_override
        result, result_raw, cube = _read_probe_result(result_path)
    elif isinstance(source_result_override, bytes):
        result_path = recorded_result_path
        result, result_raw, cube = _parse_probe_result(
            source_result_override, source="source_result_override"
        )
    else:
        raise StructuralSeedError("source result override is neither bytes nor a Path")
    if _sha256_bytes(result_raw) != source["result_sha256"]:
        raise StructuralSeedError("source probe result hash has drifted")
    for field in ("schema", "status", "bank_sha256", "bank_rows", "iteration"):
        if source[field] != result.get(field):
            raise StructuralSeedError(f"source probe field has drifted: {field}")

    (
        theorem_reference,
        theorem_source_path,
        theorem_source_bytes,
    ) = _validate_theorem_reference(
        payload["theorem_contract"],
        theorem_source_override=theorem_source_override,
    )
    seed_cores = payload["seed_cores"]
    if not isinstance(seed_cores, list) or len(seed_cores) != 1:
        raise StructuralSeedError("artifact must contain exactly one emitted seed core")
    _validate_core_record(
        seed_cores[0],
        cube=cube,
        expected_kind="FourRowPerpBisectorCore",
        expected_foci=FOUR_ROW_FOCI,
        expected_witnesses=FOUR_ROW_WITNESSES,
        expected_pattern=FOUR_ROW_PATTERN,
        expect_memberships=True,
    )
    analysis = payload["analysis"]
    if not isinstance(analysis, dict) or set(analysis) != {
        "requested_fixed_labels_core", "note"
    }:
        raise StructuralSeedError("analysis record has an unexpected schema")
    _validate_core_record(
        analysis["requested_fixed_labels_core"],
        cube=cube,
        expected_kind="PerpBisectorCore",
        expected_foci=REQUESTED_FOCI,
        expected_witnesses=REQUESTED_WITNESSES,
        expected_pattern=REQUESTED_PATTERN,
        expect_memberships=False,
    )
    patterns = _validate_exclusions(payload["exclusions"], theorem_reference)
    records = tuple(payload["exclusions"])
    return ValidatedArtifact(
        schema=SCHEMA,
        patterns=patterns,
        records=records,
        record_count=len(records),
        theorem_ids=(GENERIC_THEOREM, EXACT_THEOREM),
        source_sha256=_sha256_bytes(raw),
        source_result_sha256=_sha256_bytes(result_raw),
        profile_orbit_keys=tuple(
            combinatorics.serialize_pattern(pattern) for pattern in patterns
        ),
        source_result_path=recorded_result_path,
        source_result_bytes=result_raw,
        theorem_source_path=theorem_source_path,
        theorem_source_bytes=theorem_source_bytes,
        theorem_build_status=theorem_reference["theorem_build"]["status"],
        theorem_source_sha256=theorem_reference["source_sha256"],
        theorem_contract_sha256=_sha256_bytes(json.dumps(
            theorem_reference,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")),
    )


def read_seed_artifact(
    path: Path,
    *,
    source_result_override: bytes | Path | None = None,
    theorem_source_override: bytes | Path | None = None,
) -> tuple[ValidatedArtifact, bytes]:
    """Read and strictly validate one structural seed artifact."""

    raw = path.read_bytes()
    return validate_seed_artifact_bytes(
        raw,
        source_path=path,
        source_result_override=source_result_override,
        theorem_source_override=theorem_source_override,
    ), raw


def _fsync_dir(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _write_new_file(path: Path, raw: bytes) -> None:
    with open(path, "xb") as handle:
        handle.write(raw)
        handle.flush()
        os.fsync(handle.fileno())


def write_seed_run(
    probe_result_path: Path,
    *,
    work_root: Path = DEFAULT_WORK_ROOT,
    theorem_build: Mapping[str, Any] | None = None,
) -> Path:
    """Durably publish one independently replayed artifact in a unique run."""

    work_root.mkdir(parents=True, exist_ok=True)
    _fsync_dir(work_root)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    token = secrets.token_hex(4)
    basename = f"perp-bisector-core-{stamp}-{os.getpid()}-{token}"
    staging = work_root / f".{basename}.staging"
    final = work_root / basename
    staging.mkdir()
    artifact = build_seed_artifact(
        probe_result_path, theorem_build=theorem_build
    )
    artifact_raw = _canonical_json_bytes(artifact)
    artifact_path = staging / "structural_seed.json"
    _write_new_file(artifact_path, artifact_raw)
    validated, reread = read_seed_artifact(artifact_path)
    if reread != artifact_raw:
        raise StructuralSeedError("durable artifact reread changed its bytes")
    manifest = {
        "schema": MANIFEST_SCHEMA,
        "status": "validated",
        "artifact": "structural_seed.json",
        "artifact_sha256": validated.source_sha256,
        "source_result_sha256": validated.source_result_sha256,
        "record_count": validated.record_count,
        "theorem_ids": list(validated.theorem_ids),
    }
    _write_new_file(staging / "run_manifest.json", _canonical_json_bytes(manifest))
    _fsync_dir(staging)
    os.replace(staging, final)
    _fsync_dir(work_root)
    return final


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    extract = subparsers.add_parser("extract")
    extract.add_argument("--probe-result", type=Path, required=True)
    extract.add_argument("--work-root", type=Path, default=DEFAULT_WORK_ROOT)
    extract.add_argument(
        "--theorem-build-status",
        choices=("pending", "passed"),
        default="pending",
    )
    validate = subparsers.add_parser("validate")
    validate.add_argument("artifact", type=Path)
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    if args.command == "extract":
        theorem_build = None
        if args.theorem_build_status == "passed":
            theorem_build = current_passed_theorem_build()
        run_dir = write_seed_run(
            args.probe_result,
            work_root=args.work_root,
            theorem_build=theorem_build,
        )
        print(run_dir)
        return 0
    validated, _ = read_seed_artifact(args.artifact)
    print(json.dumps({
        "schema": validated.schema,
        "record_count": validated.record_count,
        "source_sha256": validated.source_sha256,
        "theorem_ids": validated.theorem_ids,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
