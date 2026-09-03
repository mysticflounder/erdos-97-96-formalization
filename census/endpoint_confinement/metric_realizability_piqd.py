"""PIQD Z3 adapter for endpoint-confinement metric realizability.

This is finite diagnostic infrastructure.  UNSAT is discovery-only, while SAT
is retained only after exact-rational replay of every generated assertion.  A
version-2 direct system also exposes the circumscribed-MEC constraints named by
``CircumscribedMECPacket.radius_pos``,
``CircumscribedMECPacket.moser_on_boundary``, and
``CircumscribedMECPacket.disk_contains_A``; its nonobtuse apex-triangle packet
is replayed alongside them.  The quantified minimum-radius clause remains
outside this finite exposed packet.  When the MEC triangle contains both gauge
labels, the two boundary equations are supplemented by their exact consequences
``mec_x = 1/2`` and ``mec_r2 = 1/4 + mec_y^2``.
"""

from __future__ import annotations

import argparse
import ctypes
import errno
import hashlib
import json
import math
import os
import re
import stat
import sys
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path, PurePosixPath
from typing import Any

from census.p97_search import phase3_piqd_smt_source_adapter as neutral

from . import metric_realizability_probe as producer

RESULT_SCHEMA = "p97-endpoint-metric-realizability-piqd-result/v1"
SOURCE_SCHEMA = "p97-endpoint-metric-realizability-piqd-source/v1"
DESCRIPTOR_SCHEMA = "p97-endpoint-metric-realizability-piqd-query/v1"
PROFILE_SCHEMA = "p97-piqd-z3-qfnra-one-shot/v1"
NORMALIZATION_SCHEMA = "p97-endpoint-metric-smt-normalization/v1"
STAGES = ("exact-metric-relaxation", "full-convex", "convex-only-relaxation")
_SAT_REPLAY_INCONCLUSIVE_STATUSES = {
    "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
    "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
}
_SMOKE_SAT_FIXTURE_PINS = (
    ("x_2", 4, 5),
    ("y_2", 3, 5),
    ("x_3", 0, 1),
    ("y_3", 1, 1),
    ("x_4", -4, 5),
    ("y_4", 3, 5),
)
MAX_N = 64
MAX_SOURCE_BYTES = 64 * 1024 * 1024
MAX_MODEL_BYTES = 1024 * 1024
MAX_MODEL_TOKENS = 4096
MAX_MODEL_DEPTH = 32
MAX_JSON_DEPTH = 64
MAX_JSON_NODES = 250_000
MAX_PUBLICATION_FILES = 128
MAX_PUBLICATION_TOTAL_BYTES = 512 * 1024 * 1024
_INTEGER = re.compile(r"-?(?:0|[1-9][0-9]*)\Z")
_DECIMAL = re.compile(r"-?(?:0|[1-9][0-9]*)\.[0-9]+\Z")
_PLATFORM_PATH_TYPE = type(Path())
_REPO_ROOT = producer.ROOT

PROOF_BLUEPRINT = {
    "session_id": "019fdf9c",
    "state": "OPEN",
    "relation": "OFF_SPINE",
    "changed": False,
}
FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
}


class EndpointMetricPiqdError(RuntimeError):
    """The endpoint source, PIQD contract, or exact replay failed closed."""


@dataclass(frozen=True)
class PreparedStage:
    system_id: str
    stage: str
    source_record: dict[str, Any]
    source_record_bytes: bytes
    query: neutral.SourceSemanticQuery


@dataclass(frozen=True)
class _CapturedInput(os.PathLike[str]):
    path: Path
    payload: bytes

    def __fspath__(self) -> str:
        return os.fspath(self.path)

    @property
    def name(self) -> str:
        return self.path.name

    def read_bytes(self) -> bytes:
        return self.payload


@dataclass
class _OutputStaging:
    parent_fd: int
    staging_fd: int
    staging_name: str
    final_name: str
    parent_path: Path
    installed: bool = False


@dataclass(frozen=True)
class _PublishedCapture:
    path: Path
    parent_fd: int
    root_fd: int
    parent_identity: tuple[int, ...]
    root_identity: tuple[int, ...]
    inventory: list[dict[str, object]]
    files: dict[str, bytes]


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    _validate_builtin_tree(value, "canonical value")
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def _validate_builtin_tree(value: object, where: str) -> None:
    nodes = 0

    def visit(item: object, location: str, depth: int) -> None:
        nonlocal nodes
        nodes += 1
        if nodes > MAX_JSON_NODES or depth > MAX_JSON_DEPTH:
            raise EndpointMetricPiqdError(f"{where} exceeds its JSON structure bound")
        if item is None or type(item) in {str, int, bool}:
            return
        if type(item) is list:
            for index, child in enumerate(item):
                visit(child, f"{location}[{index}]", depth + 1)
            return
        if type(item) is dict:
            for key, child in item.items():
                if type(key) is not str:
                    raise EndpointMetricPiqdError(f"{location} has a non-string key")
                visit(child, f"{location}.{key}", depth + 1)
            return
        raise EndpointMetricPiqdError(f"{location} contains a non-builtin JSON value")

    visit(value, where, 0)


def _validate_system(value: object) -> dict[str, Any]:
    legacy_keys = {
        "system_id",
        "n",
        "profile",
        "order",
        "rows",
        "sources",
    }
    if type(value) is not dict or set(value) not in {
        frozenset(legacy_keys),
        frozenset(legacy_keys | {"mec_apices"}),
    }:
        raise EndpointMetricPiqdError("metric system has the wrong keys")
    _validate_builtin_tree(value, "metric system")
    system = json.loads(_canonical(value))
    n = system["n"]
    if type(n) is not int or not 3 <= n <= MAX_N:
        raise EndpointMetricPiqdError("metric system n is invalid")
    if type(system["system_id"]) is not str or not system["system_id"]:
        raise EndpointMetricPiqdError("metric system id is invalid")
    if (
        type(system["profile"]) is not list
        or any(type(item) is not int for item in system["profile"])
        or type(system["order"]) is not list
        or any(type(item) is not int for item in system["order"])
        or sorted(system["order"]) != list(range(n))
        or type(system["rows"]) is not list
        or type(system["sources"]) is not list
    ):
        raise EndpointMetricPiqdError("metric system structure is invalid")
    for row in system["rows"]:
        if type(row) is not dict or set(row) != {"center", "support", "exact"}:
            raise EndpointMetricPiqdError("metric row has the wrong keys")
        center, support, exact = row["center"], row["support"], row["exact"]
        if (
            type(center) is not int
            or center not in range(n)
            or type(support) is not list
            or len(support) < 2
            or any(type(point) is not int for point in support)
            or len(support) != len(set(support))
            or center in support
            or any(point not in range(n) for point in support)
            or type(exact) is not bool
        ):
            raise EndpointMetricPiqdError("metric row is invalid")
    if "mec_apices" in system:
        mec_apices = system["mec_apices"]
        if (
            type(mec_apices) is not list
            or len(mec_apices) != 3
            or any(type(apex) is not int for apex in mec_apices)
            or len(set(mec_apices)) != 3
            or any(apex not in range(n) for apex in mec_apices)
        ):
            raise EndpointMetricPiqdError("metric system MEC apices are invalid")
        rows = tuple(
            producer.MetricRow(row["center"], tuple(row["support"]), row["exact"])
            for row in system["rows"]
        )
        identity = producer._direct_system_key(
            n, system["order"], rows, mec_apices
        )
        expected_system_id = hashlib.sha256(identity.encode()).hexdigest()[:20]
        if system["system_id"] != expected_system_id:
            raise EndpointMetricPiqdError(
                "metric system id does not bind its MEC apices"
            )
    return system


def _identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _require_exact_platform_path(value: object, where: str) -> None:
    if type(value) is not _PLATFORM_PATH_TYPE:
        raise EndpointMetricPiqdError(f"{where} must be an exact platform Path")


def _validate_source_paths(source_paths: object) -> None:
    if type(source_paths) not in {tuple, list}:
        raise EndpointMetricPiqdError(
            "source paths must be an exact list or tuple of platform Paths"
        )
    _require_exact_platform_path(_REPO_ROOT, "repo_root")
    repo_root = _absolute_lexical(_REPO_ROOT)
    for path in source_paths:
        _require_exact_platform_path(path, "source path")
        absolute = _absolute_lexical(path)
        if repo_root not in absolute.parents:
            raise EndpointMetricPiqdError(
                "production source path must be contained within repo_root"
            )


def _absolute_lexical(path: Path) -> Path:
    _require_exact_platform_path(path, "source path")
    if ".." in path.parts:
        raise EndpointMetricPiqdError("source path must be an exact lexical Path")
    return Path(os.path.abspath(os.fspath(path)))


def _open_directory_nofollow(path: Path) -> int:
    absolute = _absolute_lexical(path)
    descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
    try:
        for part in absolute.parts[1:]:
            next_descriptor = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = next_descriptor
        if not stat.S_ISDIR(os.fstat(descriptor).st_mode):
            raise EndpointMetricPiqdError("path is not a directory")
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _open_file_nofollow(path: Path) -> int:
    absolute = _absolute_lexical(path)
    parent_fd = _open_directory_nofollow(absolute.parent)
    try:
        return os.open(
            absolute.name,
            os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
    finally:
        os.close(parent_fd)


def _read_descriptor(descriptor: int, cap: int) -> bytes:
    chunks: list[bytes] = []
    remaining = cap + 1
    while remaining:
        chunk = os.read(descriptor, min(1024 * 1024, remaining))
        if not chunk:
            break
        chunks.append(chunk)
        remaining -= len(chunk)
    return b"".join(chunks)


def _read_nofollow(path: Path, *, cap: int = MAX_SOURCE_BYTES) -> bytes:
    absolute = _absolute_lexical(path)
    try:
        descriptor = _open_file_nofollow(absolute)
    except OSError as exc:
        raise EndpointMetricPiqdError(
            f"cannot read source componentwise without following links: {path}"
        ) from exc
    check_fd: int | None = None
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise EndpointMetricPiqdError(
                f"source is not a private regular file: {path}"
            )
        if before.st_size > cap:
            raise EndpointMetricPiqdError(f"source exceeds byte cap: {path}")
        payload = _read_descriptor(descriptor, cap)
        after = os.fstat(descriptor)
        if (
            len(payload) > cap
            or len(payload) != before.st_size
            or _identity(before) != _identity(after)
        ):
            raise EndpointMetricPiqdError(f"source changed while read: {path}")
        check_fd = _open_file_nofollow(absolute)
        rebound = os.fstat(check_fd)
        if _identity(after) != _identity(rebound):
            raise EndpointMetricPiqdError(f"source path changed while read: {path}")
        return payload
    except OSError as exc:
        raise EndpointMetricPiqdError(
            f"cannot read source componentwise without following links: {path}"
        ) from exc
    finally:
        if check_fd is not None:
            os.close(check_fd)
        os.close(descriptor)


def _coordinate(point: int, axis: str) -> str:
    return f"{axis}_{point}"


def _difference(left: str, right: str) -> str:
    return f"(- {left} {right})"


def _d2(left: int, right: int) -> str:
    dx = _difference(_coordinate(left, "x"), _coordinate(right, "x"))
    dy = _difference(_coordinate(left, "y"), _coordinate(right, "y"))
    return f"(+ (* {dx} {dx}) (* {dy} {dy}))"


def _mec_d2(point: int) -> str:
    dx = _difference(_coordinate(point, "x"), "mec_x")
    dy = _difference(_coordinate(point, "y"), "mec_y")
    return f"(+ (* {dx} {dx}) (* {dy} {dy}))"


def _cross(a: int, b: int, c: int) -> str:
    abx = _difference(_coordinate(b, "x"), _coordinate(a, "x"))
    aby = _difference(_coordinate(b, "y"), _coordinate(a, "y"))
    acx = _difference(_coordinate(c, "x"), _coordinate(a, "x"))
    acy = _difference(_coordinate(c, "y"), _coordinate(a, "y"))
    return f"(- (* {abx} {acy}) (* {aby} {acx}))"


def _dot_at(vertex: int, left: int, right: int) -> str:
    vlx = _difference(_coordinate(left, "x"), _coordinate(vertex, "x"))
    vly = _difference(_coordinate(left, "y"), _coordinate(vertex, "y"))
    vrx = _difference(_coordinate(right, "x"), _coordinate(vertex, "x"))
    vry = _difference(_coordinate(right, "y"), _coordinate(vertex, "y"))
    return f"(+ (* {vlx} {vrx}) (* {vly} {vry}))"


def _fixture_pin_records(
    system: Mapping[str, Any], fixture_only: bool
) -> list[dict[str, object]]:
    if type(fixture_only) is not bool:
        raise EndpointMetricPiqdError("fixture-only seam must be exact Boolean")
    if not fixture_only:
        return []
    fixtures = {
        fixture["system_id"]: _validate_system(fixture)
        for fixture in producer._smoke_systems()
    }
    expected = fixtures.get(system["system_id"])
    if expected is None or system != expected:
        raise EndpointMetricPiqdError(
            "fixture-only seam requires an exact built-in smoke system"
        )
    if system["system_id"] != "smoke-sat":
        return []
    return [
        {"term": term, "numerator": numerator, "denominator": denominator}
        for term, numerator, denominator in _SMOKE_SAT_FIXTURE_PINS
    ]


def _smt_rational(numerator: int, denominator: int) -> str:
    if denominator == 1:
        return str(numerator)
    magnitude = f"(/ {abs(numerator)} {denominator})"
    return f"(- {magnitude})" if numerator < 0 else magnitude


def _authenticate_fixture_pin_packet(
    value: object, expected: list[dict[str, object]], where: str
) -> None:
    if type(value) is not list:
        raise EndpointMetricPiqdError(f"{where} has the wrong type")
    _validate_builtin_tree(value, where)
    if _canonical(value) != _canonical(expected):
        raise EndpointMetricPiqdError(f"{where} is crossed")


def _stage_atoms(
    system: Mapping[str, Any], stage: str, *, _fixture_only: bool = False
) -> tuple[dict[str, list[str]], dict[str, int]]:
    if type(stage) is not str or stage not in STAGES:
        raise EndpointMetricPiqdError("unknown metric PIQD stage")
    n = system["n"]
    atoms: dict[str, list[str]] = {
        "gauge": [
            "(= x_0 0)",
            "(= y_0 0)",
            "(= x_1 1)",
            "(= y_1 0)",
        ],
        "fixture_pins": [
            f"(= {pin['term']} {_smt_rational(pin['numerator'], pin['denominator'])})"
            for pin in _fixture_pin_records(system, _fixture_only)
        ],
        "equalities": [],
        "exactness": [],
        "distinctness": [],
        "convexity": [],
    }
    mec_apices = system.get("mec_apices")
    if mec_apices is not None:
        gauge_apices = {0, 1}.issubset(set(mec_apices))
        atoms.update(
            {
                "mec_gauge": (
                    [
                        "(= mec_x (/ 1 2))",
                        "(= mec_r2 (+ (/ 1 4) (* mec_y mec_y)))",
                    ]
                    if gauge_apices
                    else []
                ),
                "mec_radius_pos": ["(> mec_r2 0)"],
                "mec_boundary": [
                    f"(= {_mec_d2(apex)} mec_r2)" for apex in mec_apices
                ],
                "mec_disk": [
                    f"(>= (- mec_r2 {_mec_d2(point)}) 0)"
                    for point in range(n)
                ],
                "mec_nonobtuse": [
                    f"(>= {_dot_at(apex, mec_apices[(index + 1) % 3], mec_apices[(index + 2) % 3])} 0)"
                    for index, apex in enumerate(mec_apices)
                ],
            }
        )
    for row in system["rows"]:
        center, support = row["center"], row["support"]
        reference = _d2(center, support[0])
        atoms["equalities"].extend(
            f"(= {_d2(center, point)} {reference})" for point in support[1:]
        )
        if row["exact"]:
            support_set = set(support)
            for point in range(n):
                if point != center and point not in support_set:
                    delta = _difference(_d2(center, point), reference)
                    atoms["exactness"].append(f"(> (* {delta} {delta}) 0)")
    atoms["distinctness"] = [
        f"(> {_d2(left, right)} 0)" for left in range(n) for right in range(left + 1, n)
    ]
    order = system["order"]
    for index, left in enumerate(order):
        right = order[(index + 1) % n]
        atoms["convexity"].extend(
            f"(> {_cross(left, right, point)} 0)"
            for point in order
            if point not in {left, right}
        )
    mec_categories = {
        "mec_gauge",
        "mec_radius_pos",
        "mec_boundary",
        "mec_disk",
        "mec_nonobtuse",
    } & set(atoms)
    included = {
        "exact-metric-relaxation": {
            "gauge",
            "fixture_pins",
            "equalities",
            "exactness",
            "distinctness",
        } | mec_categories,
        "full-convex": set(atoms),
        "convex-only-relaxation": {
            "gauge",
            "fixture_pins",
            "equalities",
            "distinctness",
            "convexity",
        } | mec_categories,
    }[stage]
    selected = {
        name: values if name in included else [] for name, values in atoms.items()
    }
    counts = {name: len(values) for name, values in selected.items()}
    counts["total"] = sum(counts.values())
    return selected, counts


def build_stage_smt2(
    system: Mapping[str, Any], stage: str, *, _fixture_only: bool = False
) -> tuple[tuple[str, ...], dict[str, int]]:
    """Build the deterministic, terminal-command-free QF_NRA state journal."""

    system = _validate_system(system)
    atoms, counts = _stage_atoms(system, stage, _fixture_only=_fixture_only)
    commands = ["(set-logic QF_NRA)"]
    for point in range(system["n"]):
        commands.extend(
            [
                f"(declare-fun x_{point} () Real)",
                f"(declare-fun y_{point} () Real)",
            ]
        )
    if "mec_apices" in system:
        commands.extend(
            [
                "(declare-fun mec_x () Real)",
                "(declare-fun mec_y () Real)",
                "(declare-fun mec_r2 () Real)",
            ]
        )
    for category in (
        "gauge",
        "fixture_pins",
        "equalities",
        "exactness",
        "distinctness",
        "convexity",
        "mec_gauge",
        "mec_radius_pos",
        "mec_boundary",
        "mec_disk",
        "mec_nonobtuse",
    ):
        commands.extend(f"(assert {atom})" for atom in atoms.get(category, ()))
    return tuple(commands), counts


def _variables(n: int, *, include_mec: bool = False) -> list[dict[str, str]]:
    variables = [
        {"id": f"p{point:03d}-{axis}", "term": f"{axis}_{point}", "sort": "Real"}
        for point in range(n)
        for axis in ("x", "y")
    ]
    if include_mec:
        variables.extend(
            [
                {"id": "z000-mec-x", "term": "mec_x", "sort": "Real"},
                {"id": "z001-mec-y", "term": "mec_y", "sort": "Real"},
                {"id": "z002-mec-r2", "term": "mec_r2", "sort": "Real"},
            ]
        )
    return variables


def prepare_stage(
    system: Mapping[str, Any],
    stage: str,
    *,
    timeout_ms: int,
    source_paths: Sequence[Path] = (),
    _fixture_only: bool = False,
) -> PreparedStage:
    """Freeze one endpoint system and one normalized one-shot PIQD query."""

    system = _validate_system(system)
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise EndpointMetricPiqdError("timeout_ms must be in 1..3600000")
    _validate_source_paths(source_paths)
    if type(_fixture_only) is not bool:
        raise EndpointMetricPiqdError("fixture-only seam must be exact Boolean")
    if _fixture_only and source_paths:
        raise EndpointMetricPiqdError(
            "fixture-only seam cannot authenticate production sources"
        )
    fixture_pins = _fixture_pin_records(system, _fixture_only)
    if not source_paths and not _fixture_only:
        raise EndpointMetricPiqdError(
            "production PIQD systems require nonempty exact source paths"
        )
    captured_inputs = tuple(
        _CapturedInput(_absolute_lexical(path), _read_nofollow(path))
        for path in source_paths
    )
    if captured_inputs:
        rebuilt, _extraction = producer.extract_systems(captured_inputs)
        matches = [item for item in rebuilt if item["system_id"] == system["system_id"]]
        if len(matches) != 1 or matches[0] != system:
            raise EndpointMetricPiqdError(
                "system is not the exact captured input reconstruction"
            )
    implementation_paths = (
        ("endpoint_adapter", _absolute_lexical(Path(__file__))),
        ("legacy_producer", _absolute_lexical(Path(producer.__file__))),
        ("generic_adapter", _absolute_lexical(Path(neutral.__file__))),
    )
    implementation_sources = [
        (label, path, _read_nofollow(path)) for label, path in implementation_paths
    ]
    producer_path = implementation_sources[1][1]
    producer_bytes = implementation_sources[1][2]
    commands, counts = build_stage_smt2(system, stage, _fixture_only=_fixture_only)
    journal = b"".join(command.encode() + b"\n" for command in commands)
    variables = _variables(system["n"], include_mec="mec_apices" in system)
    input_records = [
        {
            "path": os.path.relpath(item.path, producer.ROOT),
            "bytes": len(item.payload),
            "sha256": _sha(item.payload),
        }
        for item in captured_inputs
    ]
    source_record = {
        "schema": SOURCE_SCHEMA,
        "system_id": system["system_id"],
        "stage": stage,
        "system": system,
        "system_sha256": _sha(_canonical(system)),
        "order_sha256": _sha(_canonical(system["order"])),
        "rows_sha256": _sha(_canonical(system["rows"])),
        "constraint_counts": counts,
        "fixture_only": _fixture_only,
        "fixture_pins": fixture_pins,
        "normalization": {
            "schema": NORMALIZATION_SCHEMA,
            "encoding": "utf-8",
            "line_endings": "LF",
            "state_commands_only": True,
            "journal_sha256": _sha(journal),
        },
        "producer_source": {
            "path": os.path.relpath(producer_path, producer.ROOT),
            "bytes": len(producer_bytes),
            "sha256": _sha(producer_bytes),
        },
        "implementation_sources": [
            {
                "role": label,
                "path": os.path.relpath(path, producer.ROOT),
                "bytes": len(payload),
                "sha256": _sha(payload),
            }
            for label, path, payload in implementation_sources
        ],
        "inputs": input_records,
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solver": "z3",
            "lane": "smt",
            "logic": "QF_NRA",
            "fresh_session": True,
            "solve_count": 1,
            "workers": 1,
            "timeout_ms": timeout_ms,
            "local_fallback": False,
        },
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    source_record_bytes = _canonical(source_record) + b"\n"
    snapshots = [
        neutral.SourceSnapshot("0000-system-record.json", source_record_bytes),
        *(
            neutral.SourceSnapshot(f"000{index}-{label}.py", payload)
            for index, (label, _path, payload) in enumerate(
                implementation_sources, start=1
            )
        ),
    ]
    snapshots.extend(
        neutral.SourceSnapshot(f"input-{index:04d}.json", item.payload)
        for index, item in enumerate(captured_inputs)
    )
    snapshots.sort(key=lambda item: item.path)
    semantic = {
        "system_id": system["system_id"],
        "stage": stage,
        "system": system,
        "constraint_counts": counts,
        "fixture_only": _fixture_only,
        "fixture_pins": fixture_pins,
        "normalization_sha256": _sha(journal),
        "source_record_sha256": _sha(source_record_bytes),
    }
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "endpoint-metric-realizability", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-stage-replay", "version": "v1"},
        "stage_id": stage,
        "query_id": f"{system['system_id']}-{stage}",
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "original.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["z3"],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_bytes = _canonical(descriptor) + b"\n"
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=tuple(snapshots),
    )
    query = neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )
    return PreparedStage(
        system["system_id"], stage, source_record, source_record_bytes, query
    )


def _real(value: object) -> Fraction:
    if type(value) is str and _INTEGER.fullmatch(value):
        return Fraction(int(value))
    if type(value) is str and _DECIMAL.fullmatch(value):
        return Fraction(value)
    if type(value) is list and len(value) == 2 and value[0] == "-":
        return -_real(value[1])
    if type(value) is list and len(value) == 3 and value[0] == "/":
        denominator = _real(value[2])
        if denominator == 0:
            raise EndpointMetricPiqdError("zero denominator in Z3 readback")
        return _real(value[1]) / denominator
    raise EndpointMetricPiqdError("Z3 readback is not an exact rational")


def _parse_bounded_sexpr(raw: str) -> object:
    if type(raw) is not str or len(raw.encode("utf-8")) > MAX_MODEL_BYTES:
        raise EndpointMetricPiqdError("Z3 readback exceeds its exact text bound")
    tokens: list[str] = []
    index = 0
    while index < len(raw):
        if raw[index].isspace():
            index += 1
            continue
        if raw[index] in "()":
            tokens.append(raw[index])
            index += 1
        else:
            end = index
            while end < len(raw) and not raw[end].isspace() and raw[end] not in "()":
                end += 1
            tokens.append(raw[index:end])
            index = end
        if len(tokens) > MAX_MODEL_TOKENS:
            raise EndpointMetricPiqdError("Z3 readback has too many tokens")
    if not tokens:
        raise EndpointMetricPiqdError("Z3 readback is empty")
    stack: list[list[object]] = []
    roots: list[object] = []
    for token in tokens:
        if token == "(":
            if len(stack) >= MAX_MODEL_DEPTH:
                raise EndpointMetricPiqdError("Z3 readback is nested too deeply")
            stack.append([])
        elif token == ")":
            if not stack:
                raise EndpointMetricPiqdError("Z3 readback has an unmatched close")
            completed = stack.pop()
            (stack[-1] if stack else roots).append(completed)
        else:
            (stack[-1] if stack else roots).append(token)
    if stack or len(roots) != 1:
        raise EndpointMetricPiqdError("Z3 readback is not one S-expression")
    return roots[0]


def _readback(raw: str, terms: Sequence[str]) -> dict[str, Fraction]:
    parsed = _parse_bounded_sexpr(raw)
    if type(parsed) is not list or len(parsed) != len(terms):
        raise EndpointMetricPiqdError("Z3 readback arity mismatch")
    answer: dict[str, Fraction] = {}
    for term, pair in zip(terms, parsed, strict=True):
        if type(term) is not str or type(pair) is not list or len(pair) != 2:
            raise EndpointMetricPiqdError("Z3 readback pair has the wrong type")
        if pair[0] != term or term in answer:
            raise EndpointMetricPiqdError("Z3 readback term mismatch")
        answer[term] = _real(pair[1])
    return answer


def _distance(
    points: Mapping[int, tuple[Fraction, Fraction]], a: int, b: int
) -> Fraction:
    return (points[a][0] - points[b][0]) ** 2 + (points[a][1] - points[b][1]) ** 2


def _orientation(
    points: Mapping[int, tuple[Fraction, Fraction]], a: int, b: int, c: int
) -> Fraction:
    return (points[b][0] - points[a][0]) * (points[c][1] - points[a][1]) - (
        points[b][1] - points[a][1]
    ) * (points[c][0] - points[a][0])


def _distance_to(
    point: tuple[Fraction, Fraction], center: tuple[Fraction, Fraction]
) -> Fraction:
    return (point[0] - center[0]) ** 2 + (point[1] - center[1]) ** 2


def _dot_product_at(
    points: Mapping[int, tuple[Fraction, Fraction]],
    vertex: int,
    left: int,
    right: int,
) -> Fraction:
    return (
        (points[left][0] - points[vertex][0])
        * (points[right][0] - points[vertex][0])
        + (points[left][1] - points[vertex][1])
        * (points[right][1] - points[vertex][1])
    )


def verify_sat_model(
    query: neutral.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> neutral.SemanticVerification:
    """Independently replay every asserted atom using exact rationals."""

    if solver != "z3" or type(model) is not str or type(values) is not str:
        raise EndpointMetricPiqdError(
            "SAT replay received the wrong solver/model shape"
        )
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict:
        raise EndpointMetricPiqdError("SAT semantic input has the wrong type")
    system = _validate_system(semantic.get("system"))
    stage = semantic.get("stage")
    fixture_only = semantic.get("fixture_only")
    fixture_pins = _fixture_pin_records(system, fixture_only)
    _authenticate_fixture_pin_packet(
        semantic.get("fixture_pins"), fixture_pins, "SAT fixture pins"
    )
    _atoms, expected = _stage_atoms(system, stage, _fixture_only=fixture_only)
    if semantic.get("constraint_counts") != expected:
        raise EndpointMetricPiqdError("SAT constraint counts are not authenticated")
    readback = _readback(values, query.get_values)
    points = {
        point: (readback[f"x_{point}"], readback[f"y_{point}"])
        for point in range(system["n"])
    }
    checked = {
        "gauge": 4,
        "fixture_pins": 0,
        "equalities": 0,
        "exactness": 0,
        "distinctness": 0,
        "convexity": 0,
    }
    mec_apices = system.get("mec_apices")
    mec_center: tuple[Fraction, Fraction] | None = None
    mec_r2: Fraction | None = None
    if mec_apices is not None:
        checked.update(
            {
                "mec_gauge": 0,
                "mec_radius_pos": 0,
                "mec_boundary": 0,
                "mec_disk": 0,
                "mec_nonobtuse": 0,
            }
        )
        mec_center = (readback["mec_x"], readback["mec_y"])
        mec_r2 = readback["mec_r2"]
        if {0, 1}.issubset(set(mec_apices)):
            checked["mec_gauge"] += 2
            if mec_center[0] != Fraction(1, 2):
                return neutral.SemanticVerification(False, {"reason": "mec_gauge"})
            if mec_r2 != Fraction(1, 4) + mec_center[1] ** 2:
                return neutral.SemanticVerification(False, {"reason": "mec_gauge"})
        checked["mec_radius_pos"] += 1
        if mec_r2 <= 0:
            return neutral.SemanticVerification(False, {"reason": "mec_radius_pos"})
        for apex in mec_apices:
            checked["mec_boundary"] += 1
            if _distance_to(points[apex], mec_center) != mec_r2:
                return neutral.SemanticVerification(
                    False, {"reason": "mec_boundary"}
                )
        for point in range(system["n"]):
            checked["mec_disk"] += 1
            if mec_r2 - _distance_to(points[point], mec_center) < 0:
                return neutral.SemanticVerification(False, {"reason": "mec_disk"})
        for index, apex in enumerate(mec_apices):
            checked["mec_nonobtuse"] += 1
            if _dot_product_at(
                points,
                apex,
                mec_apices[(index + 1) % 3],
                mec_apices[(index + 2) % 3],
            ) < 0:
                return neutral.SemanticVerification(
                    False, {"reason": "mec_nonobtuse"}
                )
    if points[0] != (0, 0) or points[1] != (1, 0):
        return neutral.SemanticVerification(False, {"reason": "gauge"})
    for pin in fixture_pins:
        checked["fixture_pins"] += 1
        expected_value = Fraction(pin["numerator"], pin["denominator"])
        if readback[pin["term"]] != expected_value:
            return neutral.SemanticVerification(False, {"reason": "fixture_pin"})
    for row in system["rows"]:
        center, support = row["center"], row["support"]
        radius = _distance(points, center, support[0])
        for point in support[1:]:
            checked["equalities"] += 1
            if _distance(points, center, point) != radius:
                return neutral.SemanticVerification(False, {"reason": "row_equality"})
        if stage != "convex-only-relaxation" and row["exact"]:
            support_set = set(support)
            for point in range(system["n"]):
                if point != center and point not in support_set:
                    checked["exactness"] += 1
                    delta = _distance(points, center, point) - radius
                    if delta * delta <= 0:
                        return neutral.SemanticVerification(
                            False, {"reason": "exactness"}
                        )
    for left in range(system["n"]):
        for right in range(left + 1, system["n"]):
            checked["distinctness"] += 1
            if _distance(points, left, right) <= 0:
                return neutral.SemanticVerification(False, {"reason": "distinctness"})
    if stage != "exact-metric-relaxation":
        order = system["order"]
        for index, left in enumerate(order):
            right = order[(index + 1) % system["n"]]
            for point in order:
                if point not in {left, right}:
                    checked["convexity"] += 1
                    if _orientation(points, left, right, point) <= 0:
                        return neutral.SemanticVerification(
                            False, {"reason": "convexity"}
                        )
    if (
        checked != {key: expected[key] for key in checked}
        or sum(checked.values()) != expected["total"]
    ):
        raise EndpointMetricPiqdError("SAT replay did not cover every asserted atom")
    evidence = {
        "system_id": system["system_id"],
        "stage": stage,
        "model_sha256": _sha(model.encode()),
        "values_sha256": _sha(values.encode()),
        "exact_rational_readback": True,
        "all_asserted_atoms_replayed": True,
        "checks": checked,
        "coordinates": {
            str(point): {
                "x": str(points[point][0]),
                "y": str(points[point][1]),
            }
            for point in range(system["n"])
        },
    }
    if mec_center is not None and mec_r2 is not None:
        evidence["circumscribed_mec"] = {
            "x": str(mec_center[0]),
            "y": str(mec_center[1]),
            "r2": str(mec_r2),
            "apices": list(mec_apices),
        }
    return neutral.SemanticVerification(True, evidence)


def _classification(engine: Mapping[str, object]) -> str:
    if (
        engine.get("raw_status") == "SAT"
        and engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED"
    ):
        return "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    if engine.get("raw_status") == "UNSAT":
        return "Z3_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED"
    if engine.get("raw_status") == "UNKNOWN":
        return "UNKNOWN_INCONCLUSIVE"
    return "ERROR_OR_REPLAY_REJECTION_INCONCLUSIVE"


def _write_immutable(directory_fd: int, name: str, payload: bytes) -> None:
    """Create one custody artifact without following links or replacing files."""

    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    flags |= getattr(os, "O_NOFOLLOW", 0)
    artifact_fd = os.open(name, flags, 0o600, dir_fd=directory_fd)
    try:
        view = memoryview(payload)
        while view:
            written = os.write(artifact_fd, view)
            if written <= 0:
                raise EndpointMetricPiqdError(f"short immutable write for {name}")
            view = view[written:]
        os.fsync(artifact_fd)
    finally:
        os.close(artifact_fd)


def _reserve_output_staging(path: Path) -> _OutputStaging:
    if path.name in {"", ".", ".."} or len(os.fsencode(path.name)) > 128:
        raise EndpointMetricPiqdError("unsafe output directory")
    parent_path = _absolute_lexical(path.parent)
    try:
        parent_fd = _open_directory_nofollow(parent_path)
    except OSError as exc:
        raise EndpointMetricPiqdError("cannot open output parent safely") from exc
    staging_fd: int | None = None
    try:
        try:
            os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise EndpointMetricPiqdError("output directory already exists")
        for _attempt in range(16):
            staging_name = f".endpoint-metric-piqd-{uuid.uuid4()}"
            try:
                os.mkdir(staging_name, 0o700, dir_fd=parent_fd)
                break
            except FileExistsError:
                continue
        else:
            raise EndpointMetricPiqdError("cannot allocate private output staging")
        staging_fd = os.open(
            staging_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
        if os.listdir(staging_fd):
            raise EndpointMetricPiqdError("new output staging is not empty")
        return _OutputStaging(
            parent_fd, staging_fd, staging_name, path.name, parent_path
        )
    except BaseException:
        if staging_fd is not None:
            os.close(staging_fd)
        os.close(parent_fd)
        raise


def _create_output_root(path: Path) -> None:
    """Create one private output container without following parent links."""

    if path.name in {"", ".", ".."}:
        raise EndpointMetricPiqdError("unsafe output root")
    parent_fd = _open_directory_nofollow(path.parent)
    root_fd: int | None = None
    try:
        os.mkdir(path.name, 0o700, dir_fd=parent_fd)
        root_fd = os.open(
            path.name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
        if os.listdir(root_fd):
            raise EndpointMetricPiqdError("new output root is not empty")
        os.fsync(root_fd)
        os.fsync(parent_fd)
    except OSError as exc:
        raise EndpointMetricPiqdError("cannot create private output root") from exc
    finally:
        if root_fd is not None:
            os.close(root_fd)
        os.close(parent_fd)


def _rename_directory_noreplace(root_fd: int, source: str, target: str) -> None:
    libc = ctypes.CDLL(None, use_errno=True)
    source_bytes, target_bytes = os.fsencode(source), os.fsencode(target)
    if sys.platform == "darwin" and hasattr(libc, "renameatx_np"):
        function = libc.renameatx_np
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(root_fd, source_bytes, root_fd, target_bytes, 0x4)
    elif sys.platform.startswith("linux") and hasattr(libc, "renameat2"):
        function = libc.renameat2
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(root_fd, source_bytes, root_fd, target_bytes, 0x1)
    else:
        raise EndpointMetricPiqdError(
            "platform lacks atomic no-replace directory publication"
        )
    if result != 0:
        error = ctypes.get_errno()
        if error in {errno.EEXIST, errno.ENOTEMPTY}:
            raise EndpointMetricPiqdError("output directory already exists")
        raise EndpointMetricPiqdError(
            f"cannot atomically publish output: {os.strerror(error)}"
        )


def _capture_tree(root_fd: int) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []

    def visit(directory_fd: int, prefix: str) -> None:
        for name in sorted(os.listdir(directory_fd)):
            if name in {"", ".", ".."} or "/" in name:
                raise EndpointMetricPiqdError("output inventory has unsafe name")
            relative = f"{prefix}/{name}" if prefix else name
            info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            identity = list(_identity(info))
            if stat.S_ISDIR(info.st_mode):
                child_fd = os.open(
                    name,
                    os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                    dir_fd=directory_fd,
                )
                try:
                    records.append(
                        {"path": relative, "kind": "directory", "identity": identity}
                    )
                    visit(child_fd, relative)
                finally:
                    os.close(child_fd)
            elif stat.S_ISREG(info.st_mode) and info.st_nlink == 1:
                child_fd = os.open(
                    name,
                    os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
                    dir_fd=directory_fd,
                )
                try:
                    payload = _read_descriptor(child_fd, MAX_SOURCE_BYTES)
                    after = os.fstat(child_fd)
                finally:
                    os.close(child_fd)
                if (
                    len(payload) > MAX_SOURCE_BYTES
                    or len(payload) != info.st_size
                    or _identity(info) != _identity(after)
                ):
                    raise EndpointMetricPiqdError(
                        "output artifact changed during inventory"
                    )
                records.append(
                    {
                        "path": relative,
                        "kind": "file",
                        "bytes": len(payload),
                        "sha256": _sha(payload),
                        "identity": identity,
                    }
                )
            else:
                raise EndpointMetricPiqdError(
                    "output inventory contains a link or non-private file"
                )

    visit(root_fd, "")
    return records


def _reopen_parent_matches(staging: _OutputStaging) -> None:
    current_fd = _open_directory_nofollow(staging.parent_path)
    try:
        if _identity(os.fstat(current_fd)) != _identity(os.fstat(staging.parent_fd)):
            raise EndpointMetricPiqdError("output parent identity changed")
    finally:
        os.close(current_fd)


def _publish_output(staging: _OutputStaging) -> tuple[bytes, list[dict[str, object]]]:
    before_manifest = _capture_tree(staging.staging_fd)
    manifest = {
        "schema": "p97-endpoint-metric-piqd-custody/v1",
        "payload_inventory": before_manifest,
        "publication": "atomic-directory-rename-no-replace",
    }
    manifest_bytes = _canonical(manifest) + b"\n"
    _write_immutable(staging.staging_fd, "custody-inventory.json", manifest_bytes)
    expected = _capture_tree(staging.staging_fd)
    _reopen_parent_matches(staging)
    os.fsync(staging.staging_fd)
    _rename_directory_noreplace(
        staging.parent_fd, staging.staging_name, staging.final_name
    )
    staging.installed = True
    os.fsync(staging.parent_fd)
    _reopen_parent_matches(staging)
    published_fd = os.open(
        staging.final_name,
        os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
        dir_fd=staging.parent_fd,
    )
    try:
        if _identity(os.fstat(published_fd)) != _identity(os.fstat(staging.staging_fd)):
            raise EndpointMetricPiqdError("published output identity changed")
        if _capture_tree(published_fd) != expected:
            raise EndpointMetricPiqdError("published output inventory changed")
    finally:
        os.close(published_fd)
    return manifest_bytes, expected


def _strict_json_artifact(payload: bytes, where: str, *, endpoint: bool) -> object:
    if type(payload) is not bytes or len(payload) > MAX_SOURCE_BYTES:
        raise EndpointMetricPiqdError(f"{where} exceeds its JSON byte bound")

    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    def reject_float(_value: str) -> object:
        raise ValueError("floating-point JSON is forbidden")

    def reject_constant(_value: str) -> object:
        raise ValueError("non-JSON numeric constant is forbidden")

    try:
        value = json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_float=reject_float,
            parse_constant=reject_constant,
        )
    except (UnicodeDecodeError, ValueError, json.JSONDecodeError) as exc:
        raise EndpointMetricPiqdError(f"{where} is not strict UTF-8 JSON") from exc
    _validate_builtin_tree(value, where)
    canonical = (
        _canonical(value)
        if endpoint
        else json.dumps(
            value,
            ensure_ascii=False,
            allow_nan=False,
            sort_keys=True,
            separators=(",", ":"),
        ).encode("utf-8")
    ) + b"\n"
    if payload != canonical:
        raise EndpointMetricPiqdError(f"{where} is not canonical JSON")
    return value


def _expect_object(value: object, keys: set[str], where: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != keys:
        raise EndpointMetricPiqdError(f"{where} has the wrong keys")
    _validate_builtin_tree(value, where)
    return value


def _expect_text(value: object, where: str, *, empty: bool = False) -> str:
    if type(value) is not str or (not empty and not value):
        raise EndpointMetricPiqdError(f"{where} is not exact text")
    return value


def _expect_int(value: object, where: str, *, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        raise EndpointMetricPiqdError(f"{where} is not an exact bounded integer")
    return value


def _expect_digest(value: object, where: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise EndpointMetricPiqdError(f"{where} is not a lowercase SHA-256")
    return value


def _capture_published_tree(
    root_fd: int,
) -> tuple[list[dict[str, object]], dict[str, bytes]]:
    records: list[dict[str, object]] = []
    files: dict[str, bytes] = {}
    total = 0

    def visit(directory_fd: int, prefix: str, depth: int) -> None:
        nonlocal total
        if depth > 2:
            raise EndpointMetricPiqdError("published output is nested too deeply")
        before = os.fstat(directory_fd)
        names = sorted(os.listdir(directory_fd))
        if len(records) + len(names) > MAX_PUBLICATION_FILES:
            raise EndpointMetricPiqdError("published output has too many entries")
        for name in names:
            if (
                type(name) is not str
                or name in {"", ".", ".."}
                or "/" in name
                or "\\" in name
                or len(os.fsencode(name)) > 255
            ):
                raise EndpointMetricPiqdError("published output has an unsafe name")
            relative = f"{prefix}/{name}" if prefix else name
            info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            identity = list(_identity(info))
            if stat.S_ISDIR(info.st_mode):
                child_fd = os.open(
                    name,
                    os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                    dir_fd=directory_fd,
                )
                try:
                    if _identity(os.fstat(child_fd)) != _identity(info):
                        raise EndpointMetricPiqdError(
                            "published directory identity changed during capture"
                        )
                    records.append(
                        {"path": relative, "kind": "directory", "identity": identity}
                    )
                    visit(child_fd, relative, depth + 1)
                finally:
                    os.close(child_fd)
                continue
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                raise EndpointMetricPiqdError(
                    "published output contains a link or non-private file"
                )
            child_fd = os.open(
                name,
                os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            try:
                if _identity(os.fstat(child_fd)) != _identity(info):
                    raise EndpointMetricPiqdError(
                        "published artifact identity changed during capture"
                    )
                payload = _read_descriptor(child_fd, MAX_SOURCE_BYTES)
                after = os.fstat(child_fd)
            finally:
                os.close(child_fd)
            total += len(payload)
            if (
                len(payload) > MAX_SOURCE_BYTES
                or total > MAX_PUBLICATION_TOTAL_BYTES
                or len(payload) != info.st_size
                or _identity(after) != _identity(info)
            ):
                raise EndpointMetricPiqdError(
                    "published artifact changed or exceeded bounds during capture"
                )
            files[relative] = payload
            records.append(
                {
                    "path": relative,
                    "kind": "file",
                    "bytes": len(payload),
                    "sha256": _sha(payload),
                    "identity": identity,
                }
            )
        if (
            _identity(os.fstat(directory_fd)) != _identity(before)
            or sorted(os.listdir(directory_fd)) != names
        ):
            raise EndpointMetricPiqdError("published directory changed during capture")

    visit(root_fd, "", 0)
    if not records:
        raise EndpointMetricPiqdError("published output is empty")
    return records, files


def _open_published_capture(output_directory: Path) -> _PublishedCapture:
    _require_exact_platform_path(output_directory, "published output")
    path = _absolute_lexical(output_directory)
    parent_fd: int | None = None
    root_fd: int | None = None
    keep = False
    try:
        parent_fd = _open_directory_nofollow(path.parent)
        info = os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        if not stat.S_ISDIR(info.st_mode):
            raise EndpointMetricPiqdError("published output is not a directory")
        root_fd = os.open(
            path.name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
        if _identity(os.fstat(root_fd)) != _identity(info):
            raise EndpointMetricPiqdError("published root identity changed")
        inventory, files = _capture_published_tree(root_fd)
        capture = _PublishedCapture(
            path,
            parent_fd,
            root_fd,
            _identity(os.fstat(parent_fd)),
            _identity(os.fstat(root_fd)),
            inventory,
            files,
        )
        keep = True
        return capture
    except EndpointMetricPiqdError:
        raise
    except OSError as exc:
        raise EndpointMetricPiqdError(
            "cannot capture published output without following links"
        ) from exc
    finally:
        if not keep:
            if root_fd is not None:
                os.close(root_fd)
            if parent_fd is not None:
                os.close(parent_fd)


def _finalize_published_capture(capture: _PublishedCapture) -> None:
    inventory, files = _capture_published_tree(capture.root_fd)
    if inventory != capture.inventory or files != capture.files:
        raise EndpointMetricPiqdError(
            "published output changed during semantic validation"
        )
    parent_fd = _open_directory_nofollow(capture.path.parent)
    rebound_fd: int | None = None
    try:
        if _identity(os.fstat(parent_fd)) != capture.parent_identity:
            raise EndpointMetricPiqdError("published output parent was replaced")
        rebound_fd = os.open(
            capture.path.name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
        if (
            _identity(os.fstat(rebound_fd)) != capture.root_identity
            or _identity(os.fstat(capture.root_fd)) != capture.root_identity
        ):
            raise EndpointMetricPiqdError("published output root was replaced")
    except OSError as exc:
        raise EndpointMetricPiqdError(
            "cannot revalidate published output without following links"
        ) from exc
    finally:
        if rebound_fd is not None:
            os.close(rebound_fd)
        os.close(parent_fd)


def _publication_json(
    files: Mapping[str, bytes], name: str, *, endpoint: bool
) -> object:
    try:
        payload = files[name]
    except KeyError as exc:
        raise EndpointMetricPiqdError(f"published output is missing {name}") from exc
    return _strict_json_artifact(
        payload, f"published artifact {name}", endpoint=endpoint
    )


def _validate_artifact_record(
    files: Mapping[str, bytes], value: object, expected_path: str, where: str
) -> dict[str, Any]:
    record = _expect_object(value, {"path", "bytes", "sha256"}, where)
    try:
        payload = files[expected_path]
    except KeyError as exc:
        raise EndpointMetricPiqdError(
            f"published output is missing {expected_path}"
        ) from exc
    if record != {
        "path": expected_path,
        "bytes": len(payload),
        "sha256": _sha(payload),
    }:
        raise EndpointMetricPiqdError(f"{where} does not bind its exact artifact")
    return record


_SESSION_KEYS = {
    "id",
    "lane",
    "state",
    "solver_name",
    "solver_sha256",
    "solver_signature",
    "protocol_version",
    "journal_path",
    "created_at",
    "updated_at",
    "clauses",
    "max_var",
    "solves",
    "last_status",
    "declared_num_vars",
    "last_solve_index",
    "last_assumption_free",
    "last_terminal_unsat",
    "label",
}
_SOLVE_REQUIRED = {
    "status",
    "solve_ms",
    "solve_index",
    "result_sha256",
    "effective_deadline_ms",
}
_ANSWER_OPTIONAL = {"interrupted_by", "core", "terminal_unsat", "model", "values"}
_RECEIPT_REQUIRED = {
    "solve_index",
    "base_commands",
    "base_bytes",
    "base_sha256",
    "solver_signature",
    "solver_sha256",
    "assumptions",
    "timeout_ms",
    "effective_deadline_ms",
    "include_model",
    "get_values",
    "status",
    "solve_ms",
    "result_sha256",
    "at",
}


def _validate_archived_session(
    value: object, *, query: neutral.SourceSemanticQuery, state: str
) -> dict[str, Any]:
    session = _expect_object(value, _SESSION_KEYS, "published PIQD session")
    session_id = _expect_text(session["id"], "session.id")
    try:
        if str(uuid.UUID(session_id)) != session_id:
            raise ValueError
    except ValueError as exc:
        raise EndpointMetricPiqdError("session.id is not a canonical UUID") from exc
    label = (
        f"p97-smt-source/{query.descriptor['query_id']}/z3/"
        f"{query.descriptor['semantic_sha256'][:12]}"
    )
    if (
        session["lane"] != "smt"
        or session["state"] != state
        or session["solver_name"] != "z3"
        or session["label"] != label
        or _expect_int(session["protocol_version"], "session.protocol_version") != 1
    ):
        raise EndpointMetricPiqdError("published PIQD session identity mismatch")
    _expect_digest(session["solver_sha256"], "session.solver_sha256")
    _expect_text(session["solver_signature"], "session.solver_signature")
    journal_path = _expect_text(session["journal_path"], "session.journal_path")
    journal = PurePosixPath(journal_path)
    if (
        str(journal) != journal_path
        or "." in journal.parts
        or ".." in journal.parts
        or journal.name != "journal.smt2"
        or journal.parent.name != session_id
        or journal.parent.parent.name != "sessions"
    ):
        raise EndpointMetricPiqdError("published PIQD journal path is not canonical")
    for key in (
        "created_at",
        "updated_at",
        "clauses",
        "max_var",
        "solves",
    ):
        _expect_int(session[key], f"session.{key}")
    if session["updated_at"] < session["created_at"] or session["max_var"] != 0:
        raise EndpointMetricPiqdError("published PIQD session counters are invalid")
    if session["declared_num_vars"] is not None:
        _expect_int(session["declared_num_vars"], "session.declared_num_vars")
        raise EndpointMetricPiqdError("SMT session has a CNF variable count")
    if session["last_solve_index"] is not None:
        _expect_int(session["last_solve_index"], "session.last_solve_index", minimum=1)
    for key in ("last_assumption_free", "last_terminal_unsat"):
        if session[key] is not None and type(session[key]) is not bool:
            raise EndpointMetricPiqdError(f"session.{key} is not exact Boolean")
    if session["last_status"] is not None and session["last_status"] not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise EndpointMetricPiqdError("session.last_status is invalid")
    return session


def _validate_fresh_archived_session(session: Mapping[str, object]) -> None:
    if not (
        session["clauses"] == 0
        and session["solves"] == 0
        and session["updated_at"] == session["created_at"]
        and session["last_status"] is None
        and session["last_solve_index"] is None
        and session["last_assumption_free"] is None
        and session["last_terminal_unsat"] is None
    ):
        raise EndpointMetricPiqdError("published PIQD session was not fresh")


def _validate_answer_shape(value: Mapping[str, object], where: str) -> None:
    status = value["status"]
    if type(status) is not str or status not in {"SAT", "UNSAT", "UNKNOWN"}:
        raise EndpointMetricPiqdError(f"{where}.status is invalid")
    for key in ("interrupted_by", "model", "values"):
        if key in value:
            _expect_text(value[key], f"{where}.{key}", empty=True)
    if "interrupted_by" in value and value["interrupted_by"] != "daemon_deadline":
        raise EndpointMetricPiqdError(f"{where}.interrupted_by is invalid")
    if "core" in value:
        core = value["core"]
        if type(core) is not list:
            raise EndpointMetricPiqdError(f"{where}.core is not an exact list")
        for index, member in enumerate(core):
            _expect_text(member, f"{where}.core[{index}]")
    if "terminal_unsat" in value and type(value["terminal_unsat"]) is not bool:
        raise EndpointMetricPiqdError(f"{where}.terminal_unsat is not Boolean")
    present = set(value) & _ANSWER_OPTIONAL
    if status == "SAT" and present != {"model", "values"}:
        raise EndpointMetricPiqdError(f"{where} SAT payload shape mismatch")
    if status == "UNSAT" and present != {"core", "terminal_unsat"}:
        raise EndpointMetricPiqdError(f"{where} UNSAT payload shape mismatch")
    if status == "UNSAT" and value["terminal_unsat"] is not (len(value["core"]) == 0):
        raise EndpointMetricPiqdError(f"{where} terminal UNSAT flag mismatch")
    if status == "UNKNOWN" and not present <= {"interrupted_by"}:
        raise EndpointMetricPiqdError(f"{where} UNKNOWN payload shape mismatch")


def _validate_archived_solve(value: object, *, timeout_ms: int) -> dict[str, Any]:
    if type(value) is not dict or not _SOLVE_REQUIRED <= set(value) <= (
        _SOLVE_REQUIRED | _ANSWER_OPTIONAL | {"replayed"}
    ):
        raise EndpointMetricPiqdError("published solve has the wrong keys")
    solve = value
    _validate_builtin_tree(solve, "published solve")
    _expect_int(solve["solve_ms"], "solve.solve_ms")
    if _expect_int(solve["solve_index"], "solve.solve_index", minimum=1) != 1:
        raise EndpointMetricPiqdError("published solve index is not one")
    _expect_digest(solve["result_sha256"], "solve.result_sha256")
    if _expect_int(
        solve["effective_deadline_ms"], "solve.effective_deadline_ms", minimum=1
    ) != (timeout_ms + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS):
        raise EndpointMetricPiqdError("published solve deadline is not profile-bound")
    if "replayed" in solve and solve["replayed"] is not False:
        raise EndpointMetricPiqdError("published solve replay flag is invalid")
    _validate_answer_shape(solve, "solve")
    return solve


def _validate_archived_receipts(
    value: object,
    *,
    session: Mapping[str, object],
    query: neutral.SourceSemanticQuery,
    solve: Mapping[str, object] | None,
    count: int,
) -> dict[str, Any] | None:
    envelope = _expect_object(
        value,
        {"session_id", "lane", "journal_path", "receipts_path", "count", "receipts"},
        "published receipts envelope",
    )
    expected_receipts_path = str(
        PurePosixPath(
            _expect_text(session["journal_path"], "session.journal_path")
        ).with_name("receipts.jsonl")
    )
    if not (
        envelope["session_id"] == session["id"]
        and envelope["lane"] == "smt"
        and envelope["journal_path"] == session["journal_path"]
        and envelope["receipts_path"] == expected_receipts_path
        and envelope["count"] == count
        and type(envelope["receipts"]) is list
        and len(envelope["receipts"]) == count
    ):
        raise EndpointMetricPiqdError("published receipt envelope identity mismatch")
    if count == 0:
        return None
    receipt = envelope["receipts"][0]
    if type(receipt) is not dict or not _RECEIPT_REQUIRED <= set(receipt) <= (
        _RECEIPT_REQUIRED | _ANSWER_OPTIONAL
    ):
        raise EndpointMetricPiqdError("published PIQD receipt has the wrong keys")
    _validate_builtin_tree(receipt, "published PIQD receipt")
    for key in ("solve_index", "base_commands", "base_bytes", "solve_ms", "at"):
        _expect_int(receipt[key], f"receipt.{key}")
    _expect_int(receipt["timeout_ms"], "receipt.timeout_ms", minimum=1)
    _expect_int(
        receipt["effective_deadline_ms"],
        "receipt.effective_deadline_ms",
        minimum=1,
    )
    for key in ("base_sha256", "solver_sha256", "result_sha256"):
        _expect_digest(receipt[key], f"receipt.{key}")
    _expect_text(receipt["solver_signature"], "receipt.solver_signature")
    if type(receipt["include_model"]) is not bool:
        raise EndpointMetricPiqdError("receipt include_model is not Boolean")
    if (
        type(receipt["assumptions"]) is not list
        or type(receipt["get_values"]) is not list
    ):
        raise EndpointMetricPiqdError("receipt request vectors are not exact lists")
    _validate_answer_shape(receipt, "receipt")
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    if not (
        receipt["solve_index"] == 1
        and receipt["base_commands"] == len(query.journal_commands)
        and receipt["base_bytes"] == len(query.journal_smt2)
        and receipt["base_sha256"] == _sha(query.journal_smt2)
        and receipt["solver_signature"] == session["solver_signature"]
        and receipt["solver_sha256"] == session["solver_sha256"]
        and receipt["assumptions"] == list(query.assumptions)
        and receipt["timeout_ms"] == timeout_ms
        and receipt["effective_deadline_ms"]
        == timeout_ms + neutral.PIQD_EFFECTIVE_DEADLINE_GRACE_MS
        and receipt["include_model"] is True
        and receipt["get_values"] == list(query.get_values)
    ):
        raise EndpointMetricPiqdError("published receipt request binding mismatch")
    if solve is not None:
        answer_keys = _ANSWER_OPTIONAL | {"status"}
        if not (
            all(receipt.get(key) == solve.get(key) for key in answer_keys)
            and receipt["solve_ms"] == solve["solve_ms"]
            and receipt["result_sha256"] == solve["result_sha256"]
            and receipt["effective_deadline_ms"] == solve["effective_deadline_ms"]
        ):
            raise EndpointMetricPiqdError("published solve and receipt disagree")
    return receipt


def _validate_archived_terminal_session(
    value: object,
    *,
    query: neutral.SourceSemanticQuery,
    created: Mapping[str, object],
    solve: Mapping[str, object] | None,
    state: str,
) -> dict[str, Any]:
    current = _validate_archived_session(value, query=query, state=state)
    identity_keys = (
        "id",
        "solver_name",
        "solver_sha256",
        "solver_signature",
        "protocol_version",
        "journal_path",
        "created_at",
        "label",
    )
    if any(current[key] != created[key] for key in identity_keys) or current[
        "clauses"
    ] != len(query.journal_commands):
        raise EndpointMetricPiqdError("published terminal session identity mismatch")
    if solve is None:
        expected = (0, None, None, None, None)
    else:
        expected = (
            1,
            solve["status"],
            1,
            not bool(query.assumptions),
            solve.get("terminal_unsat"),
        )
    actual = (
        current["solves"],
        current["last_status"],
        current["last_solve_index"],
        current["last_assumption_free"],
        current["last_terminal_unsat"],
    )
    if actual != expected:
        raise EndpointMetricPiqdError("published terminal session state mismatch")
    return current


def _validate_published_source_query(
    files: Mapping[str, bytes],
    *,
    stage: str,
    repo_root: Path,
) -> PreparedStage:
    source_value = _publication_json(files, "source-record.json", endpoint=True)
    source = _expect_object(
        source_value,
        {
            "schema",
            "system_id",
            "stage",
            "system",
            "system_sha256",
            "order_sha256",
            "rows_sha256",
            "constraint_counts",
            "fixture_only",
            "fixture_pins",
            "normalization",
            "producer_source",
            "implementation_sources",
            "inputs",
            "solver_profile",
            "claims",
            "proof_blueprint",
        },
        "published endpoint source record",
    )
    system = _validate_system(source["system"])
    profile = _expect_object(
        source["solver_profile"],
        {
            "schema",
            "solver",
            "lane",
            "logic",
            "fresh_session",
            "solve_count",
            "workers",
            "timeout_ms",
            "local_fallback",
        },
        "published endpoint solver profile",
    )
    timeout_ms = _expect_int(profile["timeout_ms"], "profile.timeout_ms", minimum=1)
    if timeout_ms > 3_600_000:
        raise EndpointMetricPiqdError("published timeout exceeds its bound")
    if _absolute_lexical(repo_root) != _absolute_lexical(Path(producer.ROOT)):
        raise EndpointMetricPiqdError(
            "repo_root must name the loaded current endpoint checkout"
        )
    inputs = source["inputs"]
    if type(inputs) is not list or len(inputs) > 16:
        raise EndpointMetricPiqdError("published source input list is not bounded")
    source_paths: list[Path] = []
    for index, value in enumerate(inputs):
        record = _expect_object(
            value, {"path", "bytes", "sha256"}, f"published source input {index}"
        )
        relative = _expect_text(record["path"], f"source input {index}.path")
        relative_path = Path(relative)
        if (
            relative_path.is_absolute()
            or ".." in relative_path.parts
            or "." in relative_path.parts
            or "\x00" in relative
        ):
            raise EndpointMetricPiqdError("published source input path is unsafe")
        _expect_int(record["bytes"], f"source input {index}.bytes")
        _expect_digest(record["sha256"], f"source input {index}.sha256")
        source_paths.append(repo_root / relative_path)
    fixture_only = not source_paths
    if fixture_only and not (
        system["system_id"] in {"smoke-sat", "smoke-unsat"} and system["sources"] == []
    ):
        raise EndpointMetricPiqdError(
            "published production source record lacks source entitlement"
        )
    if (
        type(source["fixture_only"]) is not bool
        or source["fixture_only"] != fixture_only
    ):
        raise EndpointMetricPiqdError("published fixture-only identity is crossed")
    expected_fixture_pins = _fixture_pin_records(system, fixture_only)
    _authenticate_fixture_pin_packet(
        source["fixture_pins"], expected_fixture_pins, "published fixture pins"
    )
    prepared = prepare_stage(
        system,
        stage,
        timeout_ms=timeout_ms,
        source_paths=tuple(source_paths),
        _fixture_only=fixture_only,
    )
    if files.get("source-record.json") != prepared.source_record_bytes:
        raise EndpointMetricPiqdError(
            "published source record does not reconstruct from current sources"
        )
    if files.get("descriptor.json") != prepared.query.descriptor_bytes:
        raise EndpointMetricPiqdError("published descriptor reconstruction mismatch")
    descriptor = _publication_json(files, "descriptor.json", endpoint=True)
    if descriptor != prepared.query.descriptor:
        raise EndpointMetricPiqdError("published descriptor bytes are crossed")
    if (
        files.get("original.smt2") != prepared.query.original_smt2
        or files.get("journal.smt2") != prepared.query.journal_smt2
        or files.get("original.smt2") != files.get("journal.smt2")
    ):
        raise EndpointMetricPiqdError("published normalized SMT query is crossed")
    for snapshot in prepared.query.source_files:
        path = f"source-{snapshot.path}"
        if files.get(path) != snapshot.payload:
            raise EndpointMetricPiqdError(
                f"published current source snapshot is crossed: {path}"
            )
    return prepared


def _replay_archived_semantics(
    query: neutral.SourceSemanticQuery, solve: Mapping[str, object]
) -> tuple[str, dict[str, object] | None, dict[str, object] | None]:
    if solve["status"] == "UNSAT":
        terms = solve["core"]
        if (
            len(terms) != len(set(terms))
            or not set(terms) <= set(query.assumptions)
            or solve["terminal_unsat"] is not (len(terms) == 0)
        ):
            raise EndpointMetricPiqdError(
                "published UNSAT assumption provenance is invalid"
            )
        assumption_to_id = {
            entry["assumption_term"]: entry["id"]
            for entry in query.descriptor["named_atoms"]
        }
        unsat = {
            "basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_field": "core",
            "assumption_terms": list(terms),
            "source_atom_ids": [assumption_to_id[term] for term in terms],
            "terminal_unsat": solve["terminal_unsat"],
        }
        return "UNSAT_DISCOVERY_ONLY", None, unsat
    if solve["status"] == "UNKNOWN":
        return "INCONCLUSIVE_UNKNOWN", None, None
    try:
        verification = verify_sat_model(query, "z3", solve["model"], solve["values"])
        if type(verification) is not neutral.SemanticVerification:
            raise EndpointMetricPiqdError("SAT verifier returned the wrong type")
        if type(verification.accepted) is not bool:
            raise EndpointMetricPiqdError("SAT verifier acceptance is not Boolean")
        _validate_builtin_tree(verification.evidence, "SAT replay evidence")
    except EndpointMetricPiqdError as exc:
        return (
            "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
            {
                "accepted": False,
                "failure": type(exc).__name__,
                "verifier": query.descriptor["semantic_verifier"],
            },
            None,
        )
    semantic = {
        "accepted": verification.accepted,
        "evidence": verification.evidence,
        "verifier": query.descriptor["semantic_verifier"],
        "model_sha256": _sha(solve["model"].encode("utf-8")),
        "values_sha256": _sha(solve["values"].encode("utf-8")),
    }
    return (
        "SAT_SEMANTICALLY_REPLAYED"
        if verification.accepted
        else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        semantic,
        None,
    )


def _validate_published_engine(
    files: Mapping[str, bytes],
    query: neutral.SourceSemanticQuery,
    value: object,
) -> tuple[dict[str, Any], set[str]]:
    engine = _expect_object(
        value,
        {
            "solver",
            "session_id",
            "solver_signature",
            "solver_sha256",
            "raw_status",
            "effective_status",
            "solve_index",
            "result_sha256",
            "response_lost",
            "reconciled_from_receipt",
            "reconciliation_attempts",
            "result_digest_advisory",
            "unsat_assumptions",
            "semantic_replay",
            "artifacts",
            "claims",
        },
        "published endpoint engine",
    )
    raw = engine["raw_status"]
    if raw is not None and (
        type(raw) is not str or raw not in {"SAT", "UNSAT", "UNKNOWN"}
    ):
        raise EndpointMetricPiqdError("published engine raw status is invalid")
    if (
        type(engine["response_lost"]) is not bool
        or type(engine["reconciled_from_receipt"]) is not bool
    ):
        raise EndpointMetricPiqdError("published response-loss flags are not Boolean")
    attempts = _expect_int(
        engine["reconciliation_attempts"], "engine.reconciliation_attempts"
    )
    response_lost = engine["response_lost"]
    reconciled = engine["reconciled_from_receipt"]
    max_attempts = len(neutral.TRANSPORT_RECONCILIATION_DELAYS_S)
    if raw is None:
        if not response_lost or reconciled or attempts != max_attempts:
            raise EndpointMetricPiqdError("published transport-loss state is invalid")
    elif not (
        response_lost is reconciled
        and (
            (response_lost and 1 <= attempts <= max_attempts)
            or (not response_lost and attempts == 0)
        )
    ):
        raise EndpointMetricPiqdError("published reconciliation state is invalid")
    artifact_paths = {
        "session": "z3.session.json",
        "smt2": "z3.smt2",
        "receipts_before": "z3.receipts-before.json",
        "receipts": "z3.receipts.json",
        "closed_session": "z3.closed-session.json",
    }
    if raw is not None:
        if response_lost:
            artifact_paths.update(
                {
                    "reconciled_solve": "z3.reconciled-solve.json",
                    "reconciliation_session": "z3.reconciliation-session.json",
                }
            )
        else:
            artifact_paths["solve"] = "z3.solve.json"
        if raw == "SAT":
            artifact_paths["semantic"] = "z3.semantic.json"
    artifacts = _expect_object(
        engine["artifacts"], set(artifact_paths), "published engine artifacts"
    )
    for key, path in artifact_paths.items():
        _validate_artifact_record(
            files, artifacts[key], path, f"published engine artifact {key}"
        )
    session = _validate_archived_session(
        _publication_json(files, artifact_paths["session"], endpoint=False),
        query=query,
        state="live",
    )
    _validate_fresh_archived_session(session)
    if files[artifact_paths["smt2"]] != query.journal_smt2:
        raise EndpointMetricPiqdError("published PIQD export differs from the query")
    _validate_archived_receipts(
        _publication_json(files, artifact_paths["receipts_before"], endpoint=False),
        session=session,
        query=query,
        solve=None,
        count=0,
    )
    solve: dict[str, Any] | None = None
    receipt: dict[str, Any] | None = None
    if raw is not None:
        solve_key = "reconciled_solve" if response_lost else "solve"
        solve = _validate_archived_solve(
            _publication_json(files, artifact_paths[solve_key], endpoint=False),
            timeout_ms=query.descriptor["solver_profile"]["timeout_ms"],
        )
        if response_lost and "replayed" in solve:
            raise EndpointMetricPiqdError(
                "reconciled solve contains a direct-response replay flag"
            )
        receipt = _validate_archived_receipts(
            _publication_json(files, artifact_paths["receipts"], endpoint=False),
            session=session,
            query=query,
            solve=solve,
            count=1,
        )
        if solve["status"] != raw or receipt is None:
            raise EndpointMetricPiqdError("published solve status is crossed")
    else:
        _validate_archived_receipts(
            _publication_json(files, artifact_paths["receipts"], endpoint=False),
            session=session,
            query=query,
            solve=None,
            count=0,
        )
    if response_lost and solve is not None:
        _validate_archived_terminal_session(
            _publication_json(
                files, artifact_paths["reconciliation_session"], endpoint=False
            ),
            query=query,
            created=session,
            solve=solve,
            state="live",
        )
    _validate_archived_terminal_session(
        _publication_json(files, artifact_paths["closed_session"], endpoint=False),
        query=query,
        created=session,
        solve=solve,
        state="closed",
    )
    if solve is None:
        effective, semantic, unsat = (
            "INCONCLUSIVE_TRANSPORT_LOSS",
            None,
            None,
        )
        advisory = None
        solve_index = None
        result_sha = None
    else:
        effective, semantic, unsat = _replay_archived_semantics(query, solve)
        local_digest = neutral.piqd_result_digest(solve)
        advisory = {
            "algorithm": "piqd-smt-solve-result/v1",
            "locally_recomputed": local_digest,
            "matches_daemon": local_digest == receipt["result_sha256"],
        }
        solve_index = solve["solve_index"]
        result_sha = receipt["result_sha256"]
    if (
        semantic is not None
        and _publication_json(files, artifact_paths["semantic"], endpoint=False)
        != semantic
    ):
        raise EndpointMetricPiqdError(
            "published SAT replay evidence is not reproducible"
        )
    expected = {
        "solver": "z3",
        "session_id": session["id"],
        "solver_signature": session["solver_signature"],
        "solver_sha256": session["solver_sha256"],
        "raw_status": raw,
        "effective_status": effective,
        "solve_index": solve_index,
        "result_sha256": result_sha,
        "response_lost": response_lost,
        "reconciled_from_receipt": reconciled,
        "reconciliation_attempts": attempts,
        "result_digest_advisory": advisory,
        "unsat_assumptions": unsat,
        "semantic_replay": semantic,
        "artifacts": artifacts,
        "claims": dict(neutral.FALSE_CLAIMS),
    }
    if engine != expected:
        raise EndpointMetricPiqdError("published endpoint engine binding mismatch")
    return engine, set(artifact_paths.values())


def run_staged_system(
    system: Mapping[str, Any],
    *,
    timeout_s: float,
    transport: neutral.PiqdTransport,
    output_directory: Path,
    source_paths: Sequence[Path] = (),
    _fixture_only: bool = False,
) -> dict[str, Any]:
    """Run at most three fresh, one-solve PIQD sessions with no fallback."""

    system = _validate_system(system)
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s <= 0
    ):
        raise EndpointMetricPiqdError("timeout_s must be positive")
    _validate_source_paths(source_paths)
    _require_exact_platform_path(output_directory, "output directory")
    staging = _reserve_output_staging(output_directory)
    timeout_ms = max(1, int(timeout_s * 1000))
    stages: list[dict[str, Any]] = []
    used_session_ids: set[str] = set()
    final_status = "UNKNOWN"
    decisive_stage: str | None = None
    final_model: object | None = None
    schedule = ["exact-metric-relaxation", "full-convex"]
    index = 0
    try:
        while index < len(schedule):
            stage = schedule[index]
            prepared = prepare_stage(
                system,
                stage,
                timeout_ms=timeout_ms,
                source_paths=source_paths,
                _fixture_only=_fixture_only,
            )
            stage_name = f"{index:02d}-{stage}"
            os.mkdir(stage_name, 0o700, dir_fd=staging.staging_fd)
            descriptor = os.open(
                stage_name,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=staging.staging_fd,
            )
            try:
                _write_immutable(
                    descriptor, "source-record.json", prepared.source_record_bytes
                )
                _write_immutable(
                    descriptor, "descriptor.json", prepared.query.descriptor_bytes
                )
                _write_immutable(
                    descriptor, "original.smt2", prepared.query.original_smt2
                )
                _write_immutable(
                    descriptor, "journal.smt2", prepared.query.journal_smt2
                )
                for snapshot in prepared.query.source_files:
                    _write_immutable(
                        descriptor, f"source-{snapshot.path}", snapshot.payload
                    )
                engine = neutral.run_authenticated_single_solver_query(
                    prepared.query,
                    solver="z3",
                    descriptor_schema=DESCRIPTOR_SCHEMA,
                    solver_profile_schema=PROFILE_SCHEMA,
                    authenticated_journal_commands=prepared.query.journal_commands,
                    transport=transport,
                    semantic_verifier=verify_sat_model,
                    output_fd=descriptor,
                    used_session_ids=used_session_ids,
                )
            finally:
                os.close(descriptor)
            raw = engine["raw_status"]
            effective = engine["effective_status"]
            stage_result = {
                "stage": stage,
                "status": raw,
                "effective_status": effective,
                "classification": _classification(engine),
                "added_constraints": prepared.source_record["constraint_counts"][
                    "total"
                ],
                "total_constraints": prepared.source_record["constraint_counts"][
                    "total"
                ],
                "source_record_sha256": _sha(prepared.source_record_bytes),
                "journal_sha256": _sha(prepared.query.journal_smt2),
                "engine": engine,
            }
            stages.append(stage_result)
            descriptor = os.open(
                stage_name,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=staging.staging_fd,
            )
            try:
                _write_immutable(
                    descriptor,
                    "stage-result.json",
                    _canonical(stage_result) + b"\n",
                )
            finally:
                os.close(descriptor)
            if raw == "UNSAT":
                final_status, decisive_stage = "UNSAT", stage
                break
            relaxation_replay_rejected = (
                stage == "exact-metric-relaxation"
                and raw == "SAT"
                and effective in _SAT_REPLAY_INCONCLUSIVE_STATUSES
            )
            if (
                effective != "SAT_SEMANTICALLY_REPLAYED"
                and raw != "UNKNOWN"
                and not relaxation_replay_rejected
            ):
                break
            if stage == "full-convex":
                if effective == "SAT_SEMANTICALLY_REPLAYED":
                    final_status, decisive_stage = "SAT", stage
                    final_model = engine["semantic_replay"]["evidence"]
                elif raw == "UNKNOWN":
                    schedule.append("convex-only-relaxation")
            index += 1
        custody_bytes, custody_inventory = _publish_output(staging)
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)
    result: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "system_id": system["system_id"],
        "status": final_status,
        "decisive_stage": decisive_stage,
        "stages": stages,
        "constraint_counts": producer._constraint_counts(
            system["n"],
            tuple(
                producer.MetricRow(row["center"], tuple(row["support"]), row["exact"])
                for row in system["rows"]
            ),
            system.get("mec_apices"),
        ),
        "route": "piqd-z3-qfnra",
        "workers": 1,
        "local_fallback": False,
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
        "output_custody": {
            "inventory_sha256": _sha(custody_bytes),
            "entries": len(custody_inventory),
            "publication": "atomic-directory-rename-no-replace",
        },
    }
    if final_model is not None:
        result["verification"] = final_model
        result["model"] = final_model["coordinates"]
    return result


def _validate_published_stage(
    files: Mapping[str, bytes],
    *,
    stage: str,
    repo_root: Path,
) -> tuple[dict[str, Any], dict[str, Any]]:
    prepared = _validate_published_source_query(files, stage=stage, repo_root=repo_root)
    result_value = _publication_json(files, "stage-result.json", endpoint=True)
    result = _expect_object(
        result_value,
        {
            "stage",
            "status",
            "effective_status",
            "classification",
            "added_constraints",
            "total_constraints",
            "source_record_sha256",
            "journal_sha256",
            "engine",
        },
        "published endpoint stage result",
    )
    engine, engine_paths = _validate_published_engine(
        files, prepared.query, result["engine"]
    )
    total = prepared.source_record["constraint_counts"]["total"]
    expected = {
        "stage": stage,
        "status": engine["raw_status"],
        "effective_status": engine["effective_status"],
        "classification": _classification(engine),
        "added_constraints": total,
        "total_constraints": total,
        "source_record_sha256": _sha(prepared.source_record_bytes),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "engine": engine,
    }
    if result != expected:
        raise EndpointMetricPiqdError("published endpoint stage result is crossed")
    expected_files = {
        "source-record.json",
        "descriptor.json",
        "original.smt2",
        "journal.smt2",
        "stage-result.json",
        *engine_paths,
        *(f"source-{item.path}" for item in prepared.query.source_files),
    }
    if set(files) != expected_files:
        raise EndpointMetricPiqdError("published endpoint stage inventory is not exact")
    return result, prepared.source_record["system"]


def _derive_published_result(
    stages: Sequence[Mapping[str, Any]], system: Mapping[str, Any]
) -> dict[str, Any]:
    if not 1 <= len(stages) <= 3:
        raise EndpointMetricPiqdError("published endpoint stage count is invalid")
    actual_names = [item["stage"] for item in stages]
    expected_names = ["exact-metric-relaxation"]
    first = stages[0]
    first_continues = first["status"] != "UNSAT" and (
        first["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
        or first["status"] == "UNKNOWN"
        or (
            first["status"] == "SAT"
            and first["effective_status"] in _SAT_REPLAY_INCONCLUSIVE_STATUSES
        )
    )
    if first_continues:
        expected_names.append("full-convex")
        if len(stages) >= 2 and stages[1]["status"] == "UNKNOWN":
            expected_names.append("convex-only-relaxation")
    if actual_names != expected_names:
        raise EndpointMetricPiqdError("published endpoint stage order is invalid")
    final_status = "UNKNOWN"
    decisive_stage: str | None = None
    verification: object | None = None
    for stage in stages:
        if stage["status"] == "UNSAT":
            final_status = "UNSAT"
            decisive_stage = stage["stage"]
            break
        if (
            stage["stage"] == "full-convex"
            and stage["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
        ):
            final_status = "SAT"
            decisive_stage = "full-convex"
            verification = stage["engine"]["semantic_replay"]["evidence"]
            break
    result: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "system_id": system["system_id"],
        "status": final_status,
        "decisive_stage": decisive_stage,
        "stages": list(stages),
        "constraint_counts": producer._constraint_counts(
            system["n"],
            tuple(
                producer.MetricRow(row["center"], tuple(row["support"]), row["exact"])
                for row in system["rows"]
            ),
            system.get("mec_apices"),
        ),
        "route": "piqd-z3-qfnra",
        "workers": 1,
        "local_fallback": False,
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    if verification is not None:
        result["verification"] = verification
        result["model"] = verification["coordinates"]
    return result


def _validate_captured_published_output(
    capture: _PublishedCapture, *, repo_root: Path
) -> dict[str, Any]:
    manifest_value = _publication_json(
        capture.files, "custody-inventory.json", endpoint=True
    )
    manifest = _expect_object(
        manifest_value,
        {"schema", "payload_inventory", "publication"},
        "published endpoint custody manifest",
    )
    payload_inventory = [
        record
        for record in capture.inventory
        if record["path"] != "custody-inventory.json"
    ]
    if manifest != {
        "schema": "p97-endpoint-metric-piqd-custody/v1",
        "payload_inventory": payload_inventory,
        "publication": "atomic-directory-rename-no-replace",
    }:
        raise EndpointMetricPiqdError("published custody inventory is crossed")
    directories = [
        record["path"]
        for record in capture.inventory
        if record["kind"] == "directory" and "/" not in record["path"]
    ]
    if any(
        record["kind"] == "directory" and "/" in record["path"]
        for record in capture.inventory
    ):
        raise EndpointMetricPiqdError("published stage tree has nested directories")
    expected_directory_names = [
        f"{index:02d}-{stage}" for index, stage in enumerate(STAGES)
    ]
    if (
        not 1 <= len(directories) <= 3
        or directories != expected_directory_names[: len(directories)]
    ):
        raise EndpointMetricPiqdError("published stage directory order is invalid")
    root_files = {path for path in capture.files if "/" not in path}
    if root_files != {"custody-inventory.json"}:
        raise EndpointMetricPiqdError("published output has unexpected root artifacts")
    stages: list[dict[str, Any]] = []
    systems: list[dict[str, Any]] = []
    for index, directory in enumerate(directories):
        prefix = f"{directory}/"
        stage_files = {
            path[len(prefix) :]: payload
            for path, payload in capture.files.items()
            if path.startswith(prefix)
        }
        stage_result, system = _validate_published_stage(
            stage_files, stage=STAGES[index], repo_root=repo_root
        )
        stages.append(stage_result)
        systems.append(system)
    if any(system != systems[0] for system in systems[1:]):
        raise EndpointMetricPiqdError("published stages describe crossed systems")
    session_ids = [stage["engine"]["session_id"] for stage in stages]
    if len(session_ids) != len(set(session_ids)):
        raise EndpointMetricPiqdError("published stages reuse a PIQD session identity")
    result = _derive_published_result(stages, systems[0])
    manifest_bytes = capture.files["custody-inventory.json"]
    result["output_custody"] = {
        "inventory_sha256": _sha(manifest_bytes),
        "entries": len(capture.inventory),
        "publication": "atomic-directory-rename-no-replace",
    }
    return result


def validate_published_output(
    output_directory: Path, *, repo_root: Path | None = None
) -> dict[str, Any]:
    """Offline-validate one complete endpoint metric PIQD publication.

    This never contacts PIQD or a solver. It validates exact current sources,
    the complete archived generic lifecycle, and SAT models by exact replay.
    """

    _require_exact_platform_path(output_directory, "published output")
    if repo_root is not None:
        _require_exact_platform_path(repo_root, "repo_root")
    selected_root = Path(producer.ROOT) if repo_root is None else repo_root
    capture = _open_published_capture(output_directory)
    try:
        try:
            result = _validate_captured_published_output(
                capture, repo_root=selected_root
            )
        except neutral.SmtSourceAdapterError as exc:
            raise EndpointMetricPiqdError(
                "published generic query validation failed"
            ) from exc
        _finalize_published_capture(capture)
        return result
    finally:
        os.close(capture.root_fd)
        os.close(capture.parent_fd)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", required=True, type=Path)
    parser.add_argument("--repo-root", type=Path)
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    result = validate_published_output(args.check, repo_root=args.repo_root)
    print(
        json.dumps(
            {
                "checked": True,
                "output": os.fspath(args.check),
                "status": result["status"],
                "system_id": result["system_id"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
