# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Source-authenticated, one-worker PIQD route for the Rigid221 pentagon.

This is finite diagnostic infrastructure.  Every solver call is one fresh Z3
session with one solve.  SAT is retained only after independent exact-rational
replay.  Proofless UNSAT and named cores are diagnostic; UNKNOWN and transport
loss are inconclusive.  No local solver fallback exists in this module.
"""

from __future__ import annotations

import argparse
import ctypes
import errno
import hashlib
import json
import os
import stat
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path, PurePosixPath
from typing import Any

from census.endpoint_confinement import metric_realizability_piqd as metric
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

DESCRIPTOR_SCHEMA = "p97-rigid221-pentagon-piqd-query/v1"
PROFILE_SCHEMA = "p97-piqd-z3-qfnra-one-shot/v1"
RESULT_SCHEMA = "p97-rigid221-pentagon-piqd-result/v1"
MANIFEST_SCHEMA = "p97-rigid221-pentagon-piqd-manifest/v1"
SOURCE_SCHEMA = "p97-rigid221-pentagon-piqd-source/v1"
NAMED_CORE_SCHEMA = "p97-rigid221-pentagon-piqd-named-core/v1"
MAX_SOURCE_BYTES = 64 * 1024 * 1024
MAX_PUBLICATION_FILE_BYTES = 96 * 1024 * 1024
MAX_PUBLICATION_TOTAL_BYTES = 768 * 1024 * 1024
MAX_PUBLICATION_FILES = 100_000
_PLATFORM_PATH_TYPE = type(Path())
_ROOT = Path(__file__).resolve().parents[1]
_SOURCE_PATHS = (
    _ROOT / "census" / "rigid221_pentagon_oracle.py",
    _ROOT / "census" / "rigid221_pentagon_piqd.py",
    _ROOT / "census" / "endpoint_confinement" / "metric_realizability_piqd.py",
    _ROOT / "census" / "p97_search" / "phase3_piqd_smt_source_adapter.py",
)
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


class Rigid221PiqdError(RuntimeError):
    """A PIQD contract, source, replay, or custody boundary failed closed."""


@dataclass(frozen=True)
class CapturedSource:
    path: Path
    payload: bytes
    identity: tuple[int, ...]


@dataclass(frozen=True)
class _Staging:
    output: Path
    parent_fd: int
    parent_identity: tuple[int, ...]
    staging_name: str
    staging_fd: int


def _fail(condition: bool, message: str) -> None:
    if not condition:
        raise Rigid221PiqdError(message)


def _validate_builtin_tree(value: object, where: str) -> None:
    seen = 0

    def visit(item: object, location: str, depth: int) -> None:
        nonlocal seen
        seen += 1
        _fail(depth <= 64 and seen <= 250_000, f"{where} exceeds JSON bounds")
        if item is None or type(item) in {str, int, bool}:
            return
        if type(item) is list:
            for index, child in enumerate(item):
                visit(child, f"{location}[{index}]", depth + 1)
            return
        if type(item) is dict:
            for key, child in item.items():
                _fail(type(key) is str, f"{location} has a non-string key")
                visit(child, f"{location}.{key}", depth + 1)
            return
        raise Rigid221PiqdError(f"{location} is not an exact builtin JSON value")

    visit(value, where, 0)


def _canonical(value: object) -> bytes:
    _validate_builtin_tree(value, "canonical value")
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode("utf-8")


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


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


def _directory_identity(info: os.stat_result) -> tuple[int, ...]:
    return (info.st_dev, info.st_ino, stat.S_IFMT(info.st_mode))


def _absolute_path(path: Path, where: str) -> Path:
    _fail(type(path) is _PLATFORM_PATH_TYPE, f"{where} must be an exact native Path")
    _fail(path.is_absolute(), f"{where} must be absolute")
    pure = PurePosixPath(os.fspath(path))
    _fail(".." not in pure.parts, f"{where} contains a parent traversal")
    _fail(len(pure.parts) <= 64, f"{where} has too many components")
    return path


def _open_componentwise(path: Path, *, directory: bool) -> int:
    absolute = _absolute_path(path, "custodied path")
    parts = PurePosixPath(os.fspath(absolute)).parts[1:]
    flags_dir = os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW
    descriptor = os.open("/", flags_dir)
    try:
        for index, component in enumerate(parts):
            final = index == len(parts) - 1
            flags = (
                flags_dir
                if not final or directory
                else os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK
            )
            next_fd = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_fd
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def capture_source(path: Path, cap: int = MAX_SOURCE_BYTES) -> CapturedSource:
    """Capture one private regular file without following any path component."""

    _fail(type(cap) is int and type(cap) is not bool and cap >= 0, "invalid byte cap")
    absolute = _absolute_path(path, "source path")
    try:
        descriptor = _open_componentwise(absolute, directory=False)
    except OSError as exc:
        raise Rigid221PiqdError(f"cannot open source without links: {path}") from exc
    rebound: int | None = None
    try:
        before = os.fstat(descriptor)
        _fail(stat.S_ISREG(before.st_mode), f"source is not regular: {path}")
        _fail(before.st_nlink == 1, f"source is not private (nlink != 1): {path}")
        _fail(before.st_size <= cap, f"source exceeds byte cap: {path}")
        chunks: list[bytes] = []
        remaining = cap + 1
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        after = os.fstat(descriptor)
        _fail(len(payload) <= cap, f"source exceeds byte cap: {path}")
        _fail(len(payload) == before.st_size, f"source changed while read: {path}")
        _fail(
            _identity(before) == _identity(after), f"source changed while read: {path}"
        )
        rebound = _open_componentwise(absolute, directory=False)
        rebound_info = os.fstat(rebound)
        _fail(
            _identity(after) == _identity(rebound_info),
            f"source path changed while read: {path}",
        )
        return CapturedSource(absolute, payload, _identity(after))
    finally:
        if rebound is not None:
            os.close(rebound)
        os.close(descriptor)


def _source_snapshots(
    extra_record: Mapping[str, object],
) -> tuple[neutral.SourceSnapshot, ...]:
    record = dict(extra_record)
    _validate_builtin_tree(record, "source record")
    snapshots = [
        neutral.SourceSnapshot("0000-source-record.json", _canonical(record) + b"\n")
    ]
    for index, source_path in enumerate(_SOURCE_PATHS, start=1):
        captured = capture_source(source_path)
        relative = source_path.relative_to(_ROOT).as_posix()
        snapshots.append(
            neutral.SourceSnapshot(
                f"{index:04d}-{relative.replace('/', '--')}", captured.payload
            )
        )
    return tuple(sorted(snapshots, key=lambda item: item.path))


def _variables(n: int) -> list[dict[str, str]]:
    return [
        {"id": f"p{point:03d}-{axis}", "term": f"{axis}_{point}", "sort": "Real"}
        for point in range(n)
        for axis in ("x", "y")
    ]


def prepare_metric_query(
    system: Mapping[str, object], *, stage_id: str, timeout_ms: int
) -> neutral.SourceSemanticQuery:
    """Freeze one stage-0--4 query using maintained public metric APIs."""

    _fail(type(system) is dict, "metric system must be an exact dict")
    _fail(type(stage_id) is str and bool(stage_id), "stage id must be a string")
    _fail(
        type(timeout_ms) is int
        and type(timeout_ms) is not bool
        and 1 <= timeout_ms <= 3_600_000,
        "timeout_ms must be in 1..3600000",
    )
    frozen_system = json.loads(_canonical(system))
    commands, counts = metric.build_stage_smt2(frozen_system, "full-convex")
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    source_record = {
        "schema": SOURCE_SCHEMA,
        "stage_id": stage_id,
        "system": frozen_system,
        "journal_sha256": _sha(journal),
        "constraint_counts": counts,
        "source_order": [path.relative_to(_ROOT).as_posix() for path in _SOURCE_PATHS],
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    snapshots = _source_snapshots(source_record)
    semantic = {
        "system_id": frozen_system["system_id"],
        "stage": "full-convex",
        "system": frozen_system,
        "constraint_counts": counts,
        "fixture_only": False,
        "fixture_pins": [],
        "normalization_sha256": _sha(journal),
        "source_record_sha256": _sha(snapshots[0].payload),
    }
    variables = _variables(frozen_system["n"])
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "rigid221-pentagon", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-stage-replay", "version": "v1"},
        "stage_id": stage_id,
        "query_id": f"{stage_id}-{frozen_system['system_id']}",
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
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=_canonical(descriptor) + b"\n",
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=snapshots,
    )
    return neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )


def run_metric_query(
    query: neutral.SourceSemanticQuery,
    *,
    transport: neutral.PiqdTransport,
    output_fd: int,
    used_session_ids: set[str],
) -> dict[str, object]:
    """Run one fresh, one-solve Z3 session; exceptions propagate unchanged."""

    return neutral.run_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=query.journal_commands,
        transport=transport,
        semantic_verifier=metric.verify_sat_model,
        output_fd=output_fd,
        used_session_ids=used_session_ids,
    )


def _difference(left: str, right: str) -> str:
    return f"(- {left} {right})"


def _d2(left: int, right: int) -> str:
    dx = _difference(f"x_{left}", f"x_{right}")
    dy = _difference(f"y_{left}", f"y_{right}")
    return f"(+ (* {dx} {dx}) (* {dy} {dy}))"


def _cross(left: int, right: int, point: int) -> str:
    abx = _difference(f"x_{right}", f"x_{left}")
    aby = _difference(f"y_{right}", f"y_{left}")
    acx = _difference(f"x_{point}", f"x_{left}")
    acy = _difference(f"y_{point}", f"y_{left}")
    return f"(- (* {abx} {acy}) (* {aby} {acx}))"


def _off_circle(center: int, point: int, reference: int) -> str:
    delta = _difference(_d2(center, point), _d2(center, reference))
    return f"(> (* {delta} {delta}) 0)"


def _stage5_groups(
    order: Sequence[int], *, class_exact: bool, chord: bool, apex_same_side: bool
) -> list[tuple[str, list[str]]]:
    _fail(type(order) in {tuple, list}, "stage-5 order must be a tuple or list")
    frozen_order = list(order)
    _fail(
        all(type(item) is int for item in frozen_order)
        and sorted(frozen_order) == list(range(7)),
        "stage-5 order is not a permutation of 0..6",
    )
    _fail(
        type(class_exact) is bool
        and type(chord) is bool
        and type(apex_same_side) is bool,
        "stage-5 flags must be exact Booleans",
    )
    groups: list[tuple[str, list[str]]] = [
        (
            "ambient-distinct",
            [
                f"(> {_d2(left, right)} 0)"
                for left in range(7)
                for right in range(left + 1, 7)
            ],
        )
    ]
    convexity: list[str] = []
    for index, left in enumerate(frozen_order):
        right = frozen_order[(index + 1) % 7]
        convexity.extend(
            f"(> {_cross(left, right, point)} 0)"
            for point in frozen_order
            if point not in {left, right}
        )
    groups.append(("convex-position", convexity))
    groups.extend(
        [
            (
                "apex-circle",
                [f"(= {_d2(5, point)} {_d2(5, 0)})" for point in (1, 2, 3, 4)],
            ),
            ("apex-exact-w-off-class", [_off_circle(5, 6, 0)]),
        ]
    )
    for tag, center, support in (("u", 4, (0, 1)), ("xv", 6, (4, 0))):
        reference = support[0]
        groups.append(
            (
                f"row-{tag}-equidistance",
                [
                    f"(= {_d2(center, point)} {_d2(center, reference)})"
                    for point in support[1:]
                ],
            )
        )
        if class_exact:
            groups.append(
                (
                    f"row-{tag}-class-exact",
                    [
                        _off_circle(center, point, reference)
                        for point in (0, 1, 2, 3, 4)
                        if point != center and point not in support
                    ],
                )
            )
    if chord:

        def side(point: int) -> str:
            return f"(+ (* chord_a x_{point}) (* chord_b y_{point}) chord_c)"

        groups.append(
            (
                "chord-nondegenerate",
                ["(> (+ (* chord_a chord_a) (* chord_b chord_b)) 0)"],
            )
        )
        for point, name in ((0, "u"), (1, "xu"), (4, "xv"), (6, "w")):
            groups.append((f"chord-interior-{name}", [f"(> {side(point)} 0)"]))
        groups.append(("chord-opposite-A", [f"(< {side(5)} 0)"]))
        if apex_same_side:
            groups.append(("chord-sanity-A-same-side", [f"(> {side(5)} 0)"]))
    return groups


def _ledger_binding(tag: str) -> tuple[str, str, str]:
    from census import rigid221_pentagon_oracle as oracle

    ledger = {item[0]: item for item in oracle._CAP_LAYER_LEDGER}
    key = "chord-*" if tag.startswith("chord-") else tag
    _fail(key in ledger, f"stage-5 group {tag!r} lacks an exact ledger entry")
    entry = ledger[key]
    _fail(entry[1] == "PROVED", f"stage-5 group {tag!r} is not proved in the ledger")
    return entry


def prepare_stage5_query(
    order: Sequence[int],
    *,
    variant: str,
    class_exact: bool,
    chord: bool,
    apex_same_side: bool,
    timeout_ms: int,
) -> neutral.SourceSemanticQuery:
    """Freeze an unlabelled stage-5 solve for the maintained single-Z3 API."""

    _fail(type(variant) is str and bool(variant), "stage-5 variant must be text")
    _fail(not apex_same_side or variant == "SANITY same-side", "sanity flag mismatch")
    groups = _stage5_groups(
        order,
        class_exact=class_exact,
        chord=chord,
        apex_same_side=apex_same_side,
    )
    commands = ["(set-logic QF_NRA)"]
    for point in range(7):
        commands.extend(
            [f"(declare-fun x_{point} () Real)", f"(declare-fun y_{point} () Real)"]
        )
    commands.extend(
        [
            "(declare-fun chord_a () Real)",
            "(declare-fun chord_b () Real)",
            "(declare-fun chord_c () Real)",
            "(assert (= x_0 0))",
            "(assert (= y_0 0))",
            "(assert (= x_1 1))",
            "(assert (= y_1 0))",
        ]
    )
    for _tag, atoms in groups:
        commands.extend(f"(assert {atom})" for atom in atoms)
    command_tuple = tuple(commands)
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    ledger_bindings = []
    for tag, atoms in groups:
        if tag.startswith("chord-sanity-"):
            ledger_bindings.append(
                {
                    "tag": tag,
                    "classification": "DELIBERATE-CONTRADICTION-SANITY",
                    "atoms": atoms,
                    "ledger_entry": None,
                }
            )
        else:
            ledger_bindings.append(
                {
                    "tag": tag,
                    "classification": "PROVED",
                    "atoms": atoms,
                    "ledger_entry": list(_ledger_binding(tag)),
                }
            )
    semantic = {
        "order": list(order),
        "variant": variant,
        "class_exact": class_exact,
        "chord": chord,
        "apex_same_side": apex_same_side,
        "groups": ledger_bindings,
        "normalization_sha256": _sha(journal),
    }
    source_record = {
        "schema": SOURCE_SCHEMA,
        "stage_id": "stage5",
        "semantic": semantic,
        "source_order": [path.relative_to(_ROOT).as_posix() for path in _SOURCE_PATHS],
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    snapshots = _source_snapshots(source_record)
    semantic["source_record_sha256"] = _sha(snapshots[0].payload)
    variables = _variables(7) + [
        {"id": "z-chord-a", "term": "chord_a", "sort": "Real"},
        {"id": "z-chord-b", "term": "chord_b", "sort": "Real"},
        {"id": "z-chord-c", "term": "chord_c", "sort": "Real"},
    ]
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "rigid221-pentagon-cap-layer", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-cap-replay", "version": "v1"},
        "stage_id": "stage5",
        "query_id": f"stage5-{variant}-{'-'.join(map(str, order))}",
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
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=_canonical(descriptor) + b"\n",
        original_smt2=journal,
        journal_commands=command_tuple,
        journal_smt2=journal,
        source_files=snapshots,
    )
    return neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=command_tuple,
    )


def _sexpr(value: str) -> object:
    _fail(
        type(value) is str and len(value.encode()) <= 1024 * 1024, "values are invalid"
    )
    tokens: list[str] = []
    current: list[str] = []
    for character in value:
        if character in "()":
            if current:
                tokens.append("".join(current))
                current.clear()
            tokens.append(character)
        elif character.isspace():
            if current:
                tokens.append("".join(current))
                current.clear()
        else:
            current.append(character)
    if current:
        tokens.append("".join(current))
    index = 0

    def parse(depth: int) -> object:
        nonlocal index
        _fail(depth <= 32 and index < len(tokens), "malformed values expression")
        token = tokens[index]
        index += 1
        if token != "(":
            _fail(token != ")", "unexpected close parenthesis")
            return token
        result: list[object] = []
        while index < len(tokens) and tokens[index] != ")":
            result.append(parse(depth + 1))
        _fail(index < len(tokens) and tokens[index] == ")", "unclosed values list")
        index += 1
        return result

    root = parse(0)
    _fail(index == len(tokens), "trailing values tokens")
    return root


def _fraction(value: object) -> Fraction:
    if type(value) is str:
        try:
            return Fraction(value)
        except (ValueError, ZeroDivisionError) as exc:
            raise Rigid221PiqdError("SAT readback is not exact rational") from exc
    _fail(type(value) is list and bool(value), "SAT readback is not exact rational")
    operator = value[0]
    _fail(type(operator) is str, "rational operator is invalid")
    if operator == "-" and len(value) == 2:
        return -_fraction(value[1])
    if operator == "/" and len(value) == 3:
        denominator = _fraction(value[2])
        _fail(denominator != 0, "zero denominator in SAT readback")
        return _fraction(value[1]) / denominator
    if operator == "to_real" and len(value) == 2:
        return _fraction(value[1])
    raise Rigid221PiqdError("SAT readback contains a non-rational term")


def _readback(values: str, terms: Sequence[str]) -> dict[str, Fraction]:
    root = _sexpr(values)
    _fail(type(root) is list, "SAT values root is not a list")
    result: dict[str, Fraction] = {}
    for pair in root:
        _fail(type(pair) is list and len(pair) == 2, "SAT value is not a pair")
        term = pair[0]
        _fail(type(term) is str and term not in result, "SAT value term is invalid")
        result[term] = _fraction(pair[1])
    _fail(list(result) == list(terms), "SAT values are missing, extra, or reordered")
    return result


def verify_stage5_sat(
    query: neutral.SourceSemanticQuery, solver: str, model: str, values: str | None
) -> neutral.SemanticVerification:
    """Independently replay every cap-layer atom over exact rational readback."""

    _fail(solver == "z3", "stage-5 replay requires z3")
    _fail(type(model) is str and type(values) is str, "SAT lacks model/readback")
    terms = query.get_values
    readback = _readback(values, terms)
    semantic = query.descriptor["semantic_input"]
    order = semantic["order"]

    def point(index: int) -> tuple[Fraction, Fraction]:
        return readback[f"x_{index}"], readback[f"y_{index}"]

    def d2(left: int, right: int) -> Fraction:
        lx, ly = point(left)
        rx, ry = point(right)
        return (lx - rx) ** 2 + (ly - ry) ** 2

    def cross(left: int, right: int, third: int) -> Fraction:
        lx, ly = point(left)
        rx, ry = point(right)
        tx, ty = point(third)
        return (rx - lx) * (ty - ly) - (ry - ly) * (tx - lx)

    checks: list[tuple[str, bool]] = [
        ("gauge", point(0) == (0, 0) and point(1) == (1, 0)),
        (
            "ambient-distinct",
            all(
                d2(left, right) > 0 for left in range(7) for right in range(left + 1, 7)
            ),
        ),
        (
            "convex-position",
            all(
                cross(left, order[(index + 1) % 7], third) > 0
                for index, left in enumerate(order)
                for third in order
                if third not in {left, order[(index + 1) % 7]}
            ),
        ),
        ("apex-circle", all(d2(5, item) == d2(5, 0) for item in (1, 2, 3, 4))),
        ("apex-exact-w-off-class", (d2(5, 6) - d2(5, 0)) ** 2 > 0),
        ("row-u-equidistance", d2(4, 1) == d2(4, 0)),
        ("row-xv-equidistance", d2(6, 0) == d2(6, 4)),
    ]
    if semantic["class_exact"]:
        checks.extend(
            [
                (
                    "row-u-class-exact",
                    all((d2(4, item) - d2(4, 0)) ** 2 > 0 for item in (2, 3)),
                ),
                (
                    "row-xv-class-exact",
                    all((d2(6, item) - d2(6, 4)) ** 2 > 0 for item in (1, 2, 3)),
                ),
            ]
        )
    if semantic["chord"]:
        a, b, c = readback["chord_a"], readback["chord_b"], readback["chord_c"]

        def side(index: int) -> Fraction:
            x, y = point(index)
            return a * x + b * y + c

        checks.extend(
            [
                ("chord-nondegenerate", a * a + b * b > 0),
                ("chord-interior", all(side(item) > 0 for item in (0, 1, 4, 6))),
                ("chord-opposite", side(5) < 0),
            ]
        )
        if semantic["apex_same_side"]:
            checks.append(("chord-sanity", side(5) > 0))
    failed = [name for name, accepted in checks if not accepted]
    return neutral.SemanticVerification(
        accepted=not failed,
        evidence={
            "schema": "p97-rigid221-pentagon-exact-rational-replay/v1",
            "all_assertions_true": not failed,
            "failed": failed,
            "readback_sha256": _sha(values.encode()),
        },
    )


def run_stage5_query(
    query: neutral.SourceSemanticQuery,
    *,
    transport: neutral.PiqdTransport,
    output_fd: int,
    used_session_ids: set[str],
) -> dict[str, object]:
    return neutral.run_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=query.journal_commands,
        transport=transport,
        semantic_verifier=verify_stage5_sat,
        output_fd=output_fd,
        used_session_ids=used_session_ids,
    )


def prepare_named_core_query(
    order: Sequence[int], *, timeout_ms: int
) -> tuple[neutral.SourceSemanticQuery, tuple[str, ...]]:
    """Freeze the base+chord query with one source-bound assumption per group."""

    groups = _stage5_groups(order, class_exact=True, chord=True, apex_same_side=False)
    from census import rigid221_pentagon_oracle as oracle

    oracle_source = capture_source(_SOURCE_PATHS[0])
    ledger_bytes = _canonical([list(entry) for entry in oracle._CAP_LAYER_LEDGER])
    commands = ["(set-logic QF_NRA)"]
    for point in range(7):
        commands.extend(
            [f"(declare-fun x_{point} () Real)", f"(declare-fun y_{point} () Real)"]
        )
    commands.extend(
        [
            "(declare-fun chord_a () Real)",
            "(declare-fun chord_b () Real)",
            "(declare-fun chord_c () Real)",
            "(assert (= x_0 0))",
            "(assert (= y_0 0))",
            "(assert (= x_1 1))",
            "(assert (= y_1 0))",
        ]
    )
    named_atoms: list[dict[str, str]] = []
    bindings: list[dict[str, object]] = []
    labels: list[str] = []
    for index, (tag, atoms) in enumerate(groups):
        assumption = f"rigid221_group_{index:03d}"
        atom_id = f"group-{index:03d}"
        ledger_entry = list(_ledger_binding(tag))
        binding = {
            "index": index,
            "tag": tag,
            "assumption_term": assumption,
            "atoms": atoms,
            "ledger_entry": ledger_entry,
            "ledger_sha256": _sha(ledger_bytes),
            "oracle_source": {
                "path": _SOURCE_PATHS[0].relative_to(_ROOT).as_posix(),
                "bytes": len(oracle_source.payload),
                "sha256": _sha(oracle_source.payload),
            },
            "labels_are_names_not_entitlement": True,
        }
        binding_sha = _sha(_canonical(binding))
        label = f"rigid221-ledger/{index:03d}/{tag}/{binding_sha}"
        binding["binding_sha256"] = binding_sha
        binding["assumption_label"] = label
        bindings.append(binding)
        labels.append(label)
        named_atoms.append({"id": atom_id, "assumption_term": assumption})
        commands.extend(
            [
                f"(declare-fun {assumption} () Bool)",
                f"(assert (=> {assumption} (and {' '.join(atoms)})))",
            ]
        )
    command_tuple = tuple(commands)
    journal = b"".join(command.encode() + b"\n" for command in commands)
    semantic = {
        "order": list(order),
        "variant": "base+chord",
        "class_exact": True,
        "chord": True,
        "apex_same_side": False,
        "groups": bindings,
        "assumption_labels": labels,
        "normalization_sha256": _sha(journal),
        "label_contract": {
            "non_null_core_labels_required": True,
            "labels_are_names_not_source_entitlement": True,
            "response_receipt_result_digest_cross_bound": True,
        },
    }
    source_record = {
        "schema": SOURCE_SCHEMA,
        "stage_id": "stage5-named-core",
        "semantic": semantic,
        "source_order": [path.relative_to(_ROOT).as_posix() for path in _SOURCE_PATHS],
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    snapshots = _source_snapshots(source_record)
    semantic["source_record_sha256"] = _sha(snapshots[0].payload)
    variables = _variables(7) + [
        {"id": "z-chord-a", "term": "chord_a", "sort": "Real"},
        {"id": "z-chord-b", "term": "chord_b", "sort": "Real"},
        {"id": "z-chord-c", "term": "chord_c", "sort": "Real"},
    ]
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "rigid221-pentagon-named-core", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-cap-replay", "version": "v1"},
        "stage_id": "stage5-named-core",
        "query_id": f"stage5-core-{'-'.join(map(str, order))}",
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
        "named_atoms": named_atoms,
        "solve": {
            "assumption_ids": [item["id"] for item in named_atoms],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["z3"],
            "timeout_ms": timeout_ms,
        },
    }
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=_canonical(descriptor) + b"\n",
        original_smt2=journal,
        journal_commands=command_tuple,
        journal_smt2=journal,
        source_files=snapshots,
    )
    validated = neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=command_tuple,
    )
    return validated, tuple(labels)


def labelled_result_digest(result: Mapping[str, object]) -> str:
    """Reproduce the shipped named-core result digest byte-for-byte."""

    _fail(type(result) is dict, "digest input must be an exact dict")
    digest = hashlib.sha256(b"piqd-smt-solve-result/v1")

    def field(name: str, value: object | None) -> None:
        if value is None:
            digest.update(f"\n{name}=-".encode())
            return
        _fail(type(value) is str, f"digest field {name} is not text")
        encoded = value.encode()
        digest.update(f"\n{name}={len(encoded)}:".encode())
        digest.update(encoded)

    field("status", result.get("status"))
    field("interrupted_by", result.get("interrupted_by"))
    terminal = result.get("terminal_unsat")
    _fail(terminal is None or type(terminal) is bool, "terminal_unsat has wrong type")
    field("terminal_unsat", None if terminal is None else str(terminal).lower())
    core = result.get("core")
    if core is None:
        digest.update(b"\ncore=-")
    else:
        _fail(type(core) is list, "core is not a list")
        digest.update(f"\ncore={len(core)}".encode())
        for member in core:
            _fail(type(member) is str, "core member is not text")
            encoded = member.encode()
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    field("model", result.get("model"))
    field("values", result.get("values"))
    labels = result.get("core_labels")
    _fail(type(labels) is list, "labelled result requires core_labels")
    digest.update(f"\ncore_labels={len(labels)}".encode())
    for label in labels:
        if label is None:
            digest.update(b"\n-")
        else:
            _fail(type(label) is str, "core label is not text")
            encoded = label.encode()
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    return digest.hexdigest()


def _solve_request_digest(
    query: neutral.SourceSemanticQuery, labels: Sequence[str], timeout_ms: int
) -> str:
    digest = hashlib.sha256(b"piqd-smt-solve-request/v1")
    digest.update(
        (
            f"\nbase={len(query.journal_commands)}:{len(query.journal_smt2)}:"
            f"{_sha(query.journal_smt2)}"
        ).encode()
    )
    digest.update(f"\ntimeout={timeout_ms}\nmodel=true".encode())
    digest.update(f"\nassumptions={len(query.assumptions)}".encode())
    for term in query.assumptions:
        encoded = term.encode()
        digest.update(f"\n{len(encoded)}:".encode())
        digest.update(encoded)
    digest.update(f"\nget_values={len(query.get_values)}".encode())
    for term in query.get_values:
        encoded = term.encode()
        digest.update(f"\n{len(encoded)}:".encode())
        digest.update(encoded)
    digest.update(f"\nassumption_labels={len(labels)}".encode())
    for label in labels:
        encoded = label.encode()
        digest.update(f"\n{len(encoded)}:".encode())
        digest.update(encoded)
    return digest.hexdigest()


def _json_response(
    transport: neutral.PiqdTransport,
    method: str,
    path: str,
    body: Mapping[str, object] | None = None,
    *,
    status: int = 200,
) -> dict[str, object]:
    response = transport.request_json(method, path, body)
    _fail(type(response) is neutral.JsonResponse, "transport returned wrong JSON type")
    _fail(
        type(response.status) is int and response.status == status, "PIQD HTTP mismatch"
    )
    _fail(type(response.body) is dict, "PIQD JSON body is not an exact object")
    _validate_builtin_tree(response.body, "PIQD JSON response")
    return json.loads(_canonical(response.body))


def _bytes_response(transport: neutral.PiqdTransport, path: str) -> bytes:
    response = transport.request_bytes("GET", path)
    _fail(type(response) is neutral.BytesResponse, "transport returned wrong byte type")
    _fail(response.status == 200 and type(response.body) is bytes, "PIQD byte mismatch")
    _fail(len(response.body) <= MAX_SOURCE_BYTES, "PIQD byte response exceeds cap")
    return response.body


def _validate_session_shape(
    value: Mapping[str, object], *, label: str, state: str
) -> dict[str, object]:
    required = {
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
    _fail(
        type(value) is dict and set(value) == required,
        "PIQD session schema mismatch",
    )
    _fail(
        value["lane"] == "smt"
        and value["state"] == state
        and value["solver_name"] == "z3"
        and value["label"] == label,
        "PIQD session identity mismatch",
    )
    session_id = value["id"]
    _fail(type(session_id) is str, "PIQD session id is not text")
    try:
        _fail(
            str(uuid.UUID(session_id)) == session_id,
            "PIQD session id is not canonical",
        )
    except ValueError as exc:
        raise Rigid221PiqdError("PIQD session id is not a UUID") from exc
    _fail(
        type(value["solver_sha256"]) is str
        and len(value["solver_sha256"]) == 64
        and all(
            character in "0123456789abcdef" for character in value["solver_sha256"]
        ),
        "PIQD solver digest is invalid",
    )
    _fail(
        type(value["solver_signature"]) is str
        and bool(value["solver_signature"])
        and all(
            type(value[key]) is int and value[key] >= 0
            for key in (
                "protocol_version",
                "created_at",
                "updated_at",
                "clauses",
                "max_var",
                "solves",
            )
        )
        and value["protocol_version"] == 1
        and value["updated_at"] >= value["created_at"],
        "PIQD session scalar fields are invalid",
    )
    _fail(
        value["declared_num_vars"] is None
        and value["max_var"] == 0
        and (
            value["last_solve_index"] is None or type(value["last_solve_index"]) is int
        )
        and (
            value["last_assumption_free"] is None
            or type(value["last_assumption_free"]) is bool
        )
        and (
            value["last_terminal_unsat"] is None
            or type(value["last_terminal_unsat"]) is bool
        )
        and (
            value["last_status"] is None
            or value["last_status"] in {"SAT", "UNSAT", "UNKNOWN"}
        ),
        "PIQD session terminal fields are invalid",
    )
    _fail(
        value["journal_path"] == f"/daemon/sessions/{session_id}/journal.smt2",
        "PIQD journal path crossed session identity",
    )
    return dict(value)


def _answer_projection(value: Mapping[str, object]) -> dict[str, object]:
    allowed = {
        "status",
        "interrupted_by",
        "terminal_unsat",
        "core",
        "model",
        "values",
        "core_labels",
    }
    result = {key: value[key] for key in allowed if key in value}
    status = result.get("status")
    _fail(status in {"SAT", "UNSAT", "UNKNOWN"}, "PIQD solve status is invalid")
    if status == "SAT":
        _fail(
            set(result) == {"status", "model", "values", "core_labels"},
            "SAT shape mismatch",
        )
        _fail(result["core_labels"] == [], "SAT labelled response has core labels")
    elif status == "UNSAT":
        _fail(
            set(result) == {"status", "core", "core_labels", "terminal_unsat"},
            "UNSAT shape mismatch",
        )
        _fail(
            type(result["core"]) is list
            and type(result["core_labels"]) is list
            and type(result["terminal_unsat"]) is bool
            and result["terminal_unsat"] is (len(result["core"]) == 0),
            "UNSAT terminal/core shape mismatch",
        )
    else:
        _fail(
            set(result)
            in ({"status", "core_labels"}, {"status", "interrupted_by", "core_labels"}),
            "UNKNOWN shape mismatch",
        )
        _fail(result["core_labels"] == [], "UNKNOWN labelled response has core labels")
    return result


def _validate_label_cross_binding(
    answer: Mapping[str, object],
    *,
    assumptions: Sequence[str],
    labels: Sequence[str],
) -> None:
    core = answer.get("core")
    core_labels = answer.get("core_labels")
    _fail(type(core_labels) is list, "core_labels must be present and exact list")
    if core is None:
        _fail(core_labels == [], "non-UNSAT response has nonempty core_labels")
        return
    _fail(
        type(core) is list and len(core) == len(core_labels),
        "core/label length mismatch",
    )
    by_term = dict(zip(assumptions, labels, strict=True))
    for member, label in zip(core, core_labels, strict=True):
        _fail(
            type(member) is str and member in by_term,
            "core member is not an exact assumption",
        )
        _fail(
            type(label) is str and label == by_term[member],
            "core label binding mismatch",
        )


def run_named_core_query(
    query: neutral.SourceSemanticQuery,
    labels: tuple[str, ...],
    *,
    transport: neutral.PiqdTransport,
    output_fd: int,
    used_session_ids: set[str],
) -> dict[str, object]:
    """Run the shipped named-core contract in one fresh, one-solve Z3 session."""

    query = neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=query.journal_commands,
    )
    _fail(
        type(labels) is tuple and all(type(item) is str for item in labels),
        "bad labels",
    )
    _fail(len(labels) == len(query.assumptions) > 0, "label/assumption count mismatch")
    _fail(type(output_fd) is int and output_fd >= 0, "invalid output descriptor")
    label = query.descriptor["query_id"]
    created = _validate_session_shape(
        _json_response(
            transport,
            "POST",
            "/sessions",
            {"solver": "z3", "lane": "smt", "label": label},
            status=201,
        ),
        label=label,
        state="live",
    )
    session_id = created["id"]
    _fail(
        created["clauses"] == 0
        and created["solves"] == 0
        and created["updated_at"] == created["created_at"]
        and all(
            created[key] is None
            for key in (
                "last_status",
                "last_solve_index",
                "last_assumption_free",
                "last_terminal_unsat",
            )
        ),
        "created named-core session is not fresh",
    )
    _fail(session_id not in used_session_ids, "PIQD reused a session id")
    used_session_ids.add(session_id)
    route = f"/sessions/{session_id}"
    primary: BaseException | None = None
    answer: dict[str, object] | None = None
    try:
        before = _json_response(transport, "GET", f"{route}/receipts")
        _fail(
            before.get("session_id") == session_id
            and before.get("lane") == "smt"
            and before.get("journal_path") == created["journal_path"]
            and before.get("receipts_path")
            == f"/daemon/sessions/{session_id}/receipts.jsonl"
            and before.get("count") == 0
            and before.get("receipts") == [],
            "fresh named-core session has receipts",
        )
        asserted = _json_response(
            transport,
            "POST",
            f"{route}/assert",
            {"commands": list(query.journal_commands), "expect_commands": 0},
        )
        _fail(
            asserted
            == {
                "added": len(query.journal_commands),
                "commands": len(query.journal_commands),
            },
            "PIQD assertion acknowledgement mismatch",
        )
        _fail(
            _bytes_response(transport, f"{route}/smt2") == query.journal_smt2,
            "PIQD exported journal differs from exact query bytes",
        )
        timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
        request_id = f"rigid221-{_sha(query.descriptor_bytes)[:32]}"
        request_sha = _solve_request_digest(query, labels, timeout_ms)
        request = {
            "assumptions": list(query.assumptions),
            "assumption_labels": list(labels),
            "timeout_ms": timeout_ms,
            "include_model": True,
            "get_values": list(query.get_values),
            "request_id": request_id,
        }
        solve = _json_response(transport, "POST", f"{route}/solve", request)
        _fail(
            solve.get("solve_index") == 1
            and type(solve.get("solve_ms")) is int
            and solve.get("effective_deadline_ms")
            == neutral.effective_deadline_ms(timeout_ms, "named solve timeout")
            and solve.get("request_id") == request_id
            and solve.get("request_sha256") == request_sha,
            "named solve request identity mismatch",
        )
        answer = _answer_projection(solve)
        _validate_label_cross_binding(
            answer, assumptions=query.assumptions, labels=labels
        )
        digest = labelled_result_digest(answer)
        _fail(solve.get("result_sha256") == digest, "solve result digest mismatch")
        receipts = _json_response(transport, "GET", f"{route}/receipts")
        _fail(
            receipts.get("session_id") == session_id
            and receipts.get("lane") == "smt"
            and receipts.get("journal_path") == created["journal_path"]
            and receipts.get("receipts_path")
            == f"/daemon/sessions/{session_id}/receipts.jsonl"
            and receipts.get("count") == 1
            and type(receipts.get("receipts")) is list
            and len(receipts["receipts"]) == 1,
            "named receipt envelope crossed session identity",
        )
        receipt = receipts["receipts"][0]
        _fail(type(receipt) is dict, "named receipt is not an exact object")
        receipt_answer = _answer_projection(receipt)
        _validate_label_cross_binding(
            receipt_answer, assumptions=query.assumptions, labels=labels
        )
        _fail(
            receipt.get("solve_index") == 1
            and receipt.get("base_commands") == len(query.journal_commands)
            and receipt.get("base_bytes") == len(query.journal_smt2)
            and receipt.get("base_sha256") == _sha(query.journal_smt2)
            and receipt.get("solver_signature") == created["solver_signature"]
            and receipt.get("solver_sha256") == created["solver_sha256"]
            and receipt.get("assumptions") == list(query.assumptions)
            and receipt.get("assumption_labels") == list(labels)
            and receipt.get("timeout_ms") == timeout_ms
            and receipt.get("effective_deadline_ms")
            == neutral.effective_deadline_ms(timeout_ms, "named receipt timeout")
            and receipt.get("include_model") is True
            and receipt.get("get_values") == list(query.get_values)
            and receipt.get("solve_ms") == solve["solve_ms"]
            and receipt.get("request_id") == request_id
            and receipt.get("request_sha256") == request_sha
            and receipt.get("result_sha256") == digest
            and receipt_answer == answer,
            "named receipt/response/query cross-binding mismatch",
        )
        session = _validate_session_shape(
            _json_response(transport, "GET", route), label=label, state="live"
        )
        _fail(
            session["id"] == session_id
            and session["solves"] == 1
            and session["last_status"] == answer["status"]
            and session["last_solve_index"] == 1
            and session["last_assumption_free"] is False
            and session["last_terminal_unsat"] == answer.get("terminal_unsat"),
            "named solved session state mismatch",
        )
        if answer["status"] == "SAT":
            verification = verify_stage5_sat(
                query, "z3", answer["model"], answer["values"]
            )
            _fail(verification.accepted, "named-core SAT exact replay failed")
            replay: object = verification.evidence
        else:
            replay = None
        engine = {
            "schema": NAMED_CORE_SCHEMA,
            "status": answer["status"],
            "diagnostic_only": True,
            "proofless_unsat": answer["status"] == "UNSAT",
            "session_id": session_id,
            "request_id": request_id,
            "request_sha256": request_sha,
            "result_sha256": digest,
            "assumption_labels": list(labels),
            "core": answer.get("core"),
            "core_labels": answer.get("core_labels"),
            "semantic_replay": replay,
            "response": solve,
            "receipt_envelope": receipts,
            "session": session,
            "claims": dict(FALSE_CLAIMS),
        }
        _write_exclusive(output_fd, "named-core.json", _canonical(engine) + b"\n")
        return engine
    except BaseException as exc:
        primary = exc
        raise
    finally:
        try:
            closed = _validate_session_shape(
                _json_response(transport, "DELETE", route), label=label, state="closed"
            )
            _fail(closed["id"] == session_id, "closed session identity mismatch")
            _write_exclusive(
                output_fd,
                "named-core.closed-session.json",
                _canonical(closed) + b"\n",
            )
        except BaseException:
            if primary is None:
                raise


def _write_exclusive(directory_fd: int, name: str, payload: bytes) -> None:
    _fail(
        type(directory_fd) is int and directory_fd >= 0,
        "output descriptor is invalid",
    )
    _fail(
        type(name) is str
        and name not in {"", ".", ".."}
        and "/" not in name
        and "\x00" not in name,
        "unsafe output name",
    )
    _fail(type(payload) is bytes, "output payload must be exact bytes")
    _fail(len(payload) <= MAX_PUBLICATION_FILE_BYTES, "output file exceeds byte cap")
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW
    descriptor = os.open(name, flags, 0o600, dir_fd=directory_fd)
    try:
        offset = 0
        while offset < len(payload):
            offset += os.write(descriptor, payload[offset:])
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        _fail(
            stat.S_ISREG(info.st_mode)
            and info.st_nlink == 1
            and info.st_size == len(payload),
            "created output is not one private regular file",
        )
    finally:
        os.close(descriptor)


def _mkdir_open(parent_fd: int, name: str) -> int:
    _fail(
        type(name) is str and name not in {"", ".", ".."} and "/" not in name,
        "unsafe directory name",
    )
    os.mkdir(name, 0o700, dir_fd=parent_fd)
    return os.open(name, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW, dir_fd=parent_fd)


def _reserve_staging(output: Path) -> _Staging:
    output = _absolute_path(output, "output directory")
    _fail(output.name not in {"", ".", ".."}, "invalid output directory name")
    parent = output.parent
    try:
        parent_fd = _open_componentwise(parent, directory=True)
    except OSError as exc:
        raise Rigid221PiqdError("output parent is unavailable without links") from exc
    try:
        parent_info = os.fstat(parent_fd)
        _fail(stat.S_ISDIR(parent_info.st_mode), "output parent is not a directory")
        try:
            os.stat(output.name, dir_fd=parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise Rigid221PiqdError("output target already exists")
        staging_name = f".{output.name}.staging-{uuid.uuid4()}"
        staging_fd = _mkdir_open(parent_fd, staging_name)
        return _Staging(
            output=output,
            parent_fd=parent_fd,
            parent_identity=_directory_identity(os.fstat(parent_fd)),
            staging_name=staging_name,
            staging_fd=staging_fd,
        )
    except BaseException:
        os.close(parent_fd)
        raise


def _validate_parent_identity(staging: _Staging) -> None:
    held = os.fstat(staging.parent_fd)
    _fail(
        _directory_identity(held) == staging.parent_identity,
        "held output parent changed",
    )
    rebound = _open_componentwise(staging.output.parent, directory=True)
    try:
        _fail(
            _directory_identity(os.fstat(rebound)) == staging.parent_identity,
            "output parent path changed before publication",
        )
    finally:
        os.close(rebound)


def _publish_noreplace(staging: _Staging) -> None:
    _validate_parent_identity(staging)
    source = staging.staging_name.encode()
    destination = staging.output.name.encode()
    libc = ctypes.CDLL(None, use_errno=True)
    if hasattr(libc, "renameatx_np"):
        function = libc.renameatx_np
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(
            staging.parent_fd, source, staging.parent_fd, destination, 0x00000004
        )
    elif hasattr(libc, "renameat2"):
        function = libc.renameat2
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(staging.parent_fd, source, staging.parent_fd, destination, 1)
    else:
        raise Rigid221PiqdError(
            "atomic no-replace directory publication is unavailable"
        )
    if result != 0:
        error = ctypes.get_errno()
        if error in {errno.EEXIST, errno.ENOTEMPTY}:
            raise Rigid221PiqdError("output target appeared before publication")
        raise Rigid221PiqdError(f"atomic no-replace publication failed: errno {error}")
    os.fsync(staging.parent_fd)


def _write_query_packet(directory_fd: int, query: neutral.SourceSemanticQuery) -> None:
    _write_exclusive(directory_fd, "descriptor.json", query.descriptor_bytes)
    _write_exclusive(directory_fd, "original.smt2", query.original_smt2)
    sources_fd = _mkdir_open(directory_fd, "sources")
    try:
        for source in query.source_files:
            _write_exclusive(sources_fd, source.path, source.payload)
        os.fsync(sources_fd)
    finally:
        os.close(sources_fd)


def _system(system_id: str, n: int, order: Sequence[int], rows: Sequence[dict]) -> dict:
    return {
        "system_id": system_id,
        "n": n,
        "profile": [0, 0, 0],
        "order": list(order),
        "rows": list(rows),
        "sources": [],
    }


def _job_directory(staging_fd: int, index: int, stage: str) -> tuple[str, int]:
    safe_stage = "".join(
        character if character.isalnum() else "-" for character in stage
    )
    name = f"job-{index:06d}-{safe_stage[:32]}"
    return name, _mkdir_open(staging_fd, name)


def _record_job(
    staging_fd: int,
    index: int,
    stage: str,
    query: neutral.SourceSemanticQuery,
    run: Any,
    *,
    transport: neutral.PiqdTransport,
    used_session_ids: set[str],
) -> tuple[dict[str, object], dict[str, object]]:
    name, directory_fd = _job_directory(staging_fd, index, stage)
    try:
        engine = run(
            query,
            transport=transport,
            output_fd=directory_fd,
            used_session_ids=used_session_ids,
        )
        # The maintained adapters own an initially empty, regular-file-only
        # staging directory while the one-shot session is live.  Archive the
        # already authenticated query packet only after that adapter closes.
        _write_query_packet(directory_fd, query)
        status = engine.get("effective_status", engine.get("status"))
        _fail(
            type(status) is str
            and status
            in {
                "SAT_SEMANTICALLY_REPLAYED",
                "UNSAT_DISCOVERY_ONLY",
                "INCONCLUSIVE_UNKNOWN",
                "INCONCLUSIVE_TRANSPORT_LOSS",
                "SAT",
                "UNSAT",
                "UNKNOWN",
            },
            "engine status is invalid",
        )
        record = {
            "index": index,
            "directory": name,
            "stage": stage,
            "query_id": query.descriptor["query_id"],
            "descriptor_sha256": _sha(query.descriptor_bytes),
            "journal_sha256": _sha(query.journal_smt2),
            "source_order": [source.path for source in query.source_files],
            "status": status,
            "session_id": engine.get("session_id")
            or engine.get("session", {}).get("id"),
            "diagnostic_only": True,
            "claims": dict(FALSE_CLAIMS),
        }
        _write_exclusive(directory_fd, "job.json", _canonical(record) + b"\n")
        os.fsync(directory_fd)
        return record, engine
    finally:
        os.close(directory_fd)


def _timeout_ms(timeout_s: float, minimum_s: float = 0.0) -> int:
    _fail(
        type(timeout_s) in {int, float}
        and type(timeout_s) is not bool
        and 0 < timeout_s <= 3600,
        "timeout must be in (0, 3600] seconds",
    )
    return max(1, int(max(float(timeout_s), minimum_s) * 1000))


def _inventory_from_fd(root_fd: int) -> list[dict[str, object]]:
    files: list[dict[str, object]] = []
    total = 0

    def visit(directory_fd: int, prefix: str) -> None:
        nonlocal total
        names = sorted(os.listdir(directory_fd))
        for name in names:
            _fail(name not in {".", ".."}, "unsafe publication entry")
            info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            relative = f"{prefix}/{name}" if prefix else name
            if stat.S_ISDIR(info.st_mode):
                child = os.open(
                    name,
                    os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                    dir_fd=directory_fd,
                )
                try:
                    visit(child, relative)
                finally:
                    os.close(child)
                continue
            _fail(
                stat.S_ISREG(info.st_mode), f"nonregular publication entry: {relative}"
            )
            _fail(info.st_nlink == 1, f"multiply linked publication file: {relative}")
            _fail(
                info.st_size <= MAX_PUBLICATION_FILE_BYTES,
                f"oversize publication file: {relative}",
            )
            descriptor = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=directory_fd)
            try:
                before = os.fstat(descriptor)
                payload = b""
                remaining = MAX_PUBLICATION_FILE_BYTES + 1
                while remaining:
                    chunk = os.read(descriptor, min(1024 * 1024, remaining))
                    if not chunk:
                        break
                    payload += chunk
                    remaining -= len(chunk)
                after = os.fstat(descriptor)
            finally:
                os.close(descriptor)
            _fail(
                len(payload) == before.st_size
                and _identity(before) == _identity(after)
                and len(payload) <= MAX_PUBLICATION_FILE_BYTES,
                f"publication file changed while captured: {relative}",
            )
            total += len(payload)
            _fail(
                total <= MAX_PUBLICATION_TOTAL_BYTES,
                "publication exceeds total byte cap",
            )
            files.append(
                {"path": relative, "bytes": len(payload), "sha256": _sha(payload)}
            )
            _fail(len(files) <= MAX_PUBLICATION_FILES, "publication exceeds file cap")

    visit(root_fd, "")
    return files


def _campaign_sources() -> list[dict[str, object]]:
    records = []
    for path in _SOURCE_PATHS:
        captured = capture_source(path)
        records.append(
            {
                "path": path.relative_to(_ROOT).as_posix(),
                "bytes": len(captured.payload),
                "sha256": _sha(captured.payload),
            }
        )
    return records


def run_campaign(
    *,
    output_directory: Path,
    timeout_s: float = 20.0,
    server: str = "http://127.0.0.1:7272",
    transport: neutral.PiqdTransport | None = None,
) -> dict[str, object]:
    """Run stages 0--5 strictly sequentially and publish one immutable tree."""

    _fail(type(output_directory) is _PLATFORM_PATH_TYPE, "output must be exact Path")
    _fail(type(server) is str and bool(server), "server must be text")
    staging = _reserve_staging(output_directory)
    used_session_ids: set[str] = set()
    if transport is None:
        transport = neutral.UrllibPiqdTransport(server)
    records: list[dict[str, object]] = []
    summaries: dict[str, dict[str, int]] = {}
    index = 0

    def tally(stage: str, status: str) -> None:
        bucket = summaries.setdefault(stage, {})
        bucket[status] = bucket.get(status, 0) + 1

    def metric_job(
        stage: str, system: dict, seconds: float = timeout_s
    ) -> dict[str, object]:
        nonlocal index
        query = prepare_metric_query(
            system, stage_id=stage, timeout_ms=_timeout_ms(seconds)
        )
        record, engine = _record_job(
            staging.staging_fd,
            index,
            stage,
            query,
            run_metric_query,
            transport=transport,
            used_session_ids=used_session_ids,
        )
        index += 1
        records.append(record)
        tally(stage, record["status"])
        return engine

    try:
        from census import rigid221_pentagon_oracle as oracle

        smoke_sat = _system(
            "smoke-sat",
            5,
            range(5),
            [oracle.MetricRow(0, (1, 2, 3, 4), True).as_dict()],
        )
        smoke_unsat = _system(
            "smoke-unsat",
            6,
            range(6),
            [
                oracle.MetricRow(0, (1, 2, 3, 4), True).as_dict(),
                oracle.MetricRow(0, (1, 2, 3, 5), True).as_dict(),
            ],
        )
        metric_job("stage0-smoke-sat", smoke_sat)
        metric_job("stage0-smoke-unsat", smoke_unsat)

        survivors: dict[str, list[tuple[int, ...]]] = {}
        configs = {"baseline": [oracle.ROW_APEX, oracle.ROW_U]}
        for leaf, center in oracle.XV_CENTER.items():
            configs[leaf] = [
                oracle.ROW_APEX,
                oracle.ROW_U,
                oracle.MetricRow(center, oracle.EDGE["xv"], False).as_dict(),
            ]
        for name, rows in configs.items():
            survivors[name] = []
            for order in oracle.cyclic_orders(6):
                engine = metric_job(
                    "stage1",
                    _system(f"stage1-{name}-{order}", 6, order, rows),
                )
                if engine["effective_status"] == "SAT_SEMANTICALLY_REPLAYED":
                    survivors[name].append(order)

        for leaf in oracle.XV_CENTER:
            for row_name in ("xu", "deleted", "v"):
                for candidate in range(6):
                    if candidate in oracle.EDGE[row_name]:
                        continue
                    for order in survivors[leaf]:
                        rows = [
                            oracle.ROW_APEX,
                            oracle.ROW_U,
                            oracle.MetricRow(
                                oracle.XV_CENTER[leaf], oracle.EDGE["xv"], False
                            ).as_dict(),
                            oracle.MetricRow(
                                candidate, oracle.EDGE[row_name], False
                            ).as_dict(),
                        ]
                        metric_job(
                            "stage2",
                            _system(
                                f"stage2-{leaf}-{row_name}-{candidate}-{order}",
                                6,
                                order,
                                rows,
                            ),
                            min(timeout_s, 15.0),
                        )

        for row_name in ("xu", "deleted"):
            rows = [
                oracle.ROW_APEX,
                oracle.ROW_U,
                oracle.MetricRow(4, oracle.EDGE[row_name], False).as_dict(),
            ]
            for order in oracle.cyclic_orders(6):
                metric_job(
                    "stage3",
                    _system(f"stage3-{row_name}-{order}", 6, order, rows),
                )

        for variant, flags in oracle._OFFCLASS_VARIANTS.items():
            rows = oracle._offclass_rows(*flags)
            for order in oracle.cyclic_orders(7):
                metric_job(
                    "stage4",
                    _system(f"stage4-{variant}-{order}", 7, order, rows),
                    min(timeout_s, 15.0),
                )

        first_base_unsat: tuple[int, ...] | None = None
        for variant, flags in oracle._CAP_LAYER_VARIANTS.items():
            for order in oracle.cyclic_orders(7):
                query = prepare_stage5_query(
                    order,
                    variant=variant,
                    class_exact=flags[0],
                    chord=flags[1],
                    apex_same_side=flags[2],
                    timeout_ms=_timeout_ms(timeout_s, 30.0),
                )
                record, engine = _record_job(
                    staging.staging_fd,
                    index,
                    "stage5",
                    query,
                    run_stage5_query,
                    transport=transport,
                    used_session_ids=used_session_ids,
                )
                index += 1
                records.append(record)
                tally("stage5", record["status"])
                if (
                    variant == "base+chord"
                    and engine["effective_status"] == "UNSAT_DISCOVERY_ONLY"
                    and first_base_unsat is None
                ):
                    first_base_unsat = tuple(order)
        named_core: dict[str, object] | None = None
        if first_base_unsat is not None:
            query, labels = prepare_named_core_query(
                first_base_unsat, timeout_ms=_timeout_ms(timeout_s, 30.0)
            )
            record, named_core = _record_job(
                staging.staging_fd,
                index,
                "stage5-named-core",
                query,
                lambda selected, **kwargs: run_named_core_query(
                    selected, labels, **kwargs
                ),
                transport=transport,
                used_session_ids=used_session_ids,
            )
            records.append(record)
            tally("stage5-named-core", named_core["status"])

        result = {
            "schema": RESULT_SCHEMA,
            "route": "piqd-z3-qfnra",
            "workers": 1,
            "sequential": True,
            "fresh_session_per_query": True,
            "solve_count_per_session": 1,
            "local_fallback": False,
            "jobs": records,
            "summaries": summaries,
            "named_core": None
            if named_core is None
            else {
                "status": named_core["status"],
                "core": named_core["core"],
                "core_labels": named_core["core_labels"],
                "diagnostic_only": True,
            },
            "source_files": _campaign_sources(),
            "proof_blueprint": dict(PROOF_BLUEPRINT),
            "claims": dict(FALSE_CLAIMS),
            "classification": "FINITE-DIAGNOSTIC-ONLY",
        }
        _write_exclusive(
            staging.staging_fd, "campaign.json", _canonical(result) + b"\n"
        )
        inventory = _inventory_from_fd(staging.staging_fd)
        manifest = {
            "schema": MANIFEST_SCHEMA,
            "files": inventory,
            "file_count": len(inventory),
            "total_bytes": sum(item["bytes"] for item in inventory),
            "root_digest": _sha(_canonical(inventory)),
        }
        _write_exclusive(
            staging.staging_fd, "manifest.json", _canonical(manifest) + b"\n"
        )
        os.fsync(staging.staging_fd)
        _publish_noreplace(staging)
        return result
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)


def _read_relative(root_fd: int, relative: str) -> bytes:
    _fail(type(relative) is str, "publication path is not text")
    pure = PurePosixPath(relative)
    _fail(
        not pure.is_absolute()
        and str(pure) == relative
        and pure.parts
        and all(part not in {"", ".", ".."} for part in pure.parts),
        "unsafe publication relative path",
    )
    current = os.dup(root_fd)
    try:
        for component in pure.parts[:-1]:
            child = os.open(
                component,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=current,
            )
            os.close(current)
            current = child
        descriptor = os.open(
            pure.parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=current
        )
        try:
            before = os.fstat(descriptor)
            _fail(
                stat.S_ISREG(before.st_mode)
                and before.st_nlink == 1
                and before.st_size <= MAX_PUBLICATION_FILE_BYTES,
                f"published file is not a bounded private regular file: {relative}",
            )
            chunks: list[bytes] = []
            remaining = MAX_PUBLICATION_FILE_BYTES + 1
            while remaining:
                chunk = os.read(descriptor, min(1024 * 1024, remaining))
                if not chunk:
                    break
                chunks.append(chunk)
                remaining -= len(chunk)
            payload = b"".join(chunks)
            after = os.fstat(descriptor)
            _fail(
                len(payload) == before.st_size
                and _identity(before) == _identity(after)
                and len(payload) <= MAX_PUBLICATION_FILE_BYTES,
                f"published file changed while read: {relative}",
            )
            return payload
        finally:
            os.close(descriptor)
    except OSError as exc:
        raise Rigid221PiqdError(
            f"cannot capture published file without links: {relative}"
        ) from exc
    finally:
        os.close(current)


def _strict_json_bytes(payload: bytes, where: str) -> dict[str, object]:
    _fail(type(payload) is bytes, f"{where} is not bytes")
    try:
        value = json.loads(payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise Rigid221PiqdError(f"{where} is not strict JSON") from exc
    _fail(type(value) is dict, f"{where} is not an exact JSON object")
    _validate_builtin_tree(value, where)
    _fail(
        payload == _canonical(value) + b"\n", f"{where} is not canonical JSON plus LF"
    )
    return value


def _validate_current_source_packet(query: neutral.SourceSemanticQuery) -> None:
    """Bind every archived source snapshot to its current exact source bytes."""

    expected_order = [path.relative_to(_ROOT).as_posix() for path in _SOURCE_PATHS]
    _fail(
        len(query.source_files) == len(expected_order) + 1,
        "archived source packet has the wrong cardinality",
    )
    record_snapshot = query.source_files[0]
    _fail(
        record_snapshot.path == "0000-source-record.json",
        "archived source record has the wrong path",
    )
    record = _strict_json_bytes(record_snapshot.payload, "archived source record")
    semantic = json.loads(_canonical(query.descriptor["semantic_input"]))
    source_record_sha = semantic.pop("source_record_sha256", None)
    _fail(
        source_record_sha == _sha(record_snapshot.payload),
        "descriptor/source-record digest mismatch",
    )
    common = {
        "schema": SOURCE_SCHEMA,
        "stage_id": query.descriptor["stage_id"],
        "source_order": expected_order,
        "claims": dict(FALSE_CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    if "semantic" in record:
        expected_record = {**common, "semantic": semantic}
    else:
        expected_record = {
            **common,
            "system": semantic["system"],
            "journal_sha256": _sha(query.journal_smt2),
            "constraint_counts": semantic["constraint_counts"],
        }
    _fail(record == expected_record, "archived source semantics are not exact")
    _fail(
        semantic["normalization_sha256"] == _sha(query.journal_smt2),
        "source semantic journal digest mismatch",
    )
    for index, (path, snapshot) in enumerate(
        zip(_SOURCE_PATHS, query.source_files[1:], strict=True), start=1
    ):
        relative = path.relative_to(_ROOT).as_posix()
        expected_path = f"{index:04d}-{relative.replace('/', '--')}"
        live = capture_source(path)
        _fail(
            snapshot.path == expected_path and snapshot.payload == live.payload,
            f"archived source differs from current exact bytes: {relative}",
        )


def _load_archived_query(root_fd: int, directory: str) -> neutral.SourceSemanticQuery:
    descriptor_bytes = _read_relative(root_fd, f"{directory}/descriptor.json")
    descriptor = _strict_json_bytes(descriptor_bytes, "archived descriptor")
    original = _read_relative(root_fd, f"{directory}/original.smt2")
    _fail(
        descriptor["original_smt2"]
        == {
            "path": "original.smt2",
            "bytes": len(original),
            "sha256": _sha(original),
        },
        "archived original SMT2 binding mismatch",
    )
    commands, journal = neutral.normalize_state_journal(original)
    sources = []
    for record in descriptor["sources"]:
        payload = _read_relative(root_fd, f"{directory}/sources/{record['path']}")
        _fail(
            record
            == {
                "path": record["path"],
                "bytes": len(payload),
                "sha256": _sha(payload),
            },
            "archived source binding mismatch",
        )
        sources.append(neutral.SourceSnapshot(record["path"], payload))
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=original,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=tuple(sources),
    )
    validated = neutral.validate_authenticated_single_solver_query(
        query,
        solver="z3",
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=PROFILE_SCHEMA,
        authenticated_journal_commands=commands,
    )
    _validate_current_source_packet(validated)
    return validated


def _validate_archived_neutral_job(
    root_fd: int,
    directory: str,
    query: neutral.SourceSemanticQuery,
    job: Mapping[str, object],
) -> None:
    label = (
        f"p97-smt-source/{query.descriptor['query_id']}/z3/"
        f"{query.descriptor['semantic_sha256'][:12]}"
    )
    created = _validate_session_shape(
        _strict_json_bytes(
            _read_relative(root_fd, f"{directory}/z3.session.json"),
            "archived created session",
        ),
        label=label,
        state="live",
    )
    _fail(
        created["id"] == job["session_id"]
        and created["clauses"] == 0
        and created["solves"] == 0
        and created["updated_at"] == created["created_at"]
        and all(
            created[key] is None
            for key in (
                "last_status",
                "last_solve_index",
                "last_assumption_free",
                "last_terminal_unsat",
            )
        ),
        "archived created session is not fresh or crossed its job",
    )
    _fail(
        _read_relative(root_fd, f"{directory}/z3.smt2") == query.journal_smt2,
        "archived exported journal mismatch",
    )
    before = _strict_json_bytes(
        _read_relative(root_fd, f"{directory}/z3.receipts-before.json"),
        "archived pre-solve receipts",
    )
    _fail(
        before
        == {
            "session_id": created["id"],
            "lane": "smt",
            "journal_path": created["journal_path"],
            "receipts_path": (f"/daemon/sessions/{created['id']}/receipts.jsonl"),
            "count": 0,
            "receipts": [],
        },
        "archived fresh-session receipt envelope mismatch",
    )
    receipts = _strict_json_bytes(
        _read_relative(root_fd, f"{directory}/z3.receipts.json"),
        "archived receipt envelope",
    )
    _fail(
        receipts.get("session_id") == created["id"]
        and receipts.get("lane") == "smt"
        and receipts.get("journal_path") == created["journal_path"]
        and receipts.get("receipts_path")
        == f"/daemon/sessions/{created['id']}/receipts.jsonl"
        and type(receipts.get("count")) is int
        and type(receipts.get("receipts")) is list
        and receipts["count"] == len(receipts["receipts"]),
        "archived receipt envelope crossed session identity",
    )
    transport_loss = job["status"] == "INCONCLUSIVE_TRANSPORT_LOSS"
    solve: dict[str, object] | None = None
    if transport_loss:
        _fail(
            receipts["count"] == 0 and receipts["receipts"] == [],
            "unreconciled transport loss unexpectedly has a receipt",
        )
    else:
        solve_path = f"{directory}/z3.solve.json"
        try:
            solve_payload = _read_relative(root_fd, solve_path)
        except Rigid221PiqdError:
            solve_path = f"{directory}/z3.reconciled-solve.json"
            solve_payload = _read_relative(root_fd, solve_path)
        solve = _strict_json_bytes(solve_payload, "archived solve")
        answer_keys = {
            "status",
            "interrupted_by",
            "terminal_unsat",
            "core",
            "model",
            "values",
        }
        answer = {key: solve[key] for key in answer_keys if key in solve}
        _fail(
            solve.get("solve_index") == 1
            and type(solve.get("solve_ms")) is int
            and solve.get("effective_deadline_ms")
            == neutral.effective_deadline_ms(
                query.descriptor["solver_profile"]["timeout_ms"],
                "archived timeout",
            )
            and solve.get("result_sha256") == neutral.piqd_result_digest(answer),
            "archived neutral solve/result digest mismatch",
        )
        _fail(
            receipts["count"] == 1 and len(receipts["receipts"]) == 1,
            "archived completed solve receipt count mismatch",
        )
        receipt = receipts["receipts"][0]
        _fail(type(receipt) is dict, "archived receipt is not an object")
        receipt_answer = {key: receipt[key] for key in answer_keys if key in receipt}
        timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
        _fail(
            receipt.get("solve_index") == 1
            and receipt.get("base_commands") == len(query.journal_commands)
            and receipt.get("base_bytes") == len(query.journal_smt2)
            and receipt.get("base_sha256") == _sha(query.journal_smt2)
            and receipt.get("solver_signature") == created["solver_signature"]
            and receipt.get("solver_sha256") == created["solver_sha256"]
            and receipt.get("assumptions") == list(query.assumptions)
            and receipt.get("timeout_ms") == timeout_ms
            and receipt.get("effective_deadline_ms")
            == neutral.effective_deadline_ms(timeout_ms, "archived receipt timeout")
            and receipt.get("include_model") is True
            and receipt.get("get_values") == list(query.get_values)
            and receipt.get("solve_ms") == solve["solve_ms"]
            and receipt.get("result_sha256") == solve["result_sha256"]
            and receipt_answer == answer,
            "archived receipt/query/result crossing mismatch",
        )
        expected_status = {
            "SAT": "SAT_SEMANTICALLY_REPLAYED",
            "UNSAT": "UNSAT_DISCOVERY_ONLY",
            "UNKNOWN": "INCONCLUSIVE_UNKNOWN",
        }
        _fail(
            job["status"] == expected_status.get(solve.get("status")),
            "archived raw/effective status mismatch",
        )
        if solve["status"] == "SAT":
            if query.descriptor["stage_id"] == "stage5":
                verification = verify_stage5_sat(
                    query, "z3", solve["model"], solve["values"]
                )
            else:
                verification = metric.verify_sat_model(
                    query, "z3", solve["model"], solve["values"]
                )
            _fail(verification.accepted, "archived SAT exact-rational replay failed")
            semantic = _strict_json_bytes(
                _read_relative(root_fd, f"{directory}/z3.semantic.json"),
                "archived SAT replay",
            )
            _fail(
                semantic
                == {
                    "accepted": True,
                    "evidence": verification.evidence,
                    "verifier": query.descriptor["semantic_verifier"],
                    "model_sha256": _sha(solve["model"].encode()),
                    "values_sha256": _sha(solve["values"].encode()),
                },
                "archived SAT replay evidence mismatch",
            )
    closed = _validate_session_shape(
        _strict_json_bytes(
            _read_relative(root_fd, f"{directory}/z3.closed-session.json"),
            "archived closed session",
        ),
        label=label,
        state="closed",
    )
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
    _fail(
        all(closed[key] == created[key] for key in identity_keys)
        and closed["clauses"] == len(query.journal_commands),
        "archived closed session changed identity or journal count",
    )
    if solve is None:
        _fail(
            closed["solves"] == 0
            and all(
                closed[key] is None
                for key in (
                    "last_status",
                    "last_solve_index",
                    "last_assumption_free",
                    "last_terminal_unsat",
                )
            ),
            "archived unreceipted session has terminal solve state",
        )
    else:
        _fail(
            closed["solves"] == 1
            and closed["last_status"] == solve["status"]
            and closed["last_solve_index"] == 1
            and closed["last_assumption_free"] is (not bool(query.assumptions))
            and closed["last_terminal_unsat"] == solve.get("terminal_unsat"),
            "archived closed session crossed its solve",
        )


def _validate_archived_named_core(
    root_fd: int,
    directory: str,
    query: neutral.SourceSemanticQuery,
    job: Mapping[str, object],
) -> None:
    artifact = _strict_json_bytes(
        _read_relative(root_fd, f"{directory}/named-core.json"),
        "archived named core",
    )
    _fail(artifact.get("schema") == NAMED_CORE_SCHEMA, "named-core schema mismatch")
    labels = artifact.get("assumption_labels")
    _fail(
        type(labels) is list and all(type(item) is str for item in labels), "bad labels"
    )
    _fail(
        labels == query.descriptor["semantic_input"]["assumption_labels"],
        "label crossing",
    )
    timeout_ms = query.descriptor["solver_profile"]["timeout_ms"]
    expected_request_id = f"rigid221-{_sha(query.descriptor_bytes)[:32]}"
    expected_request_sha = _solve_request_digest(query, labels, timeout_ms)
    response = artifact.get("response")
    receipts = artifact.get("receipt_envelope")
    _fail(
        type(response) is dict and type(receipts) is dict, "named artifacts are absent"
    )
    answer = _answer_projection(response)
    _validate_label_cross_binding(answer, assumptions=query.assumptions, labels=labels)
    digest = labelled_result_digest(answer)
    _fail(
        artifact.get("result_sha256") == digest
        and response.get("result_sha256") == digest,
        "named response/result digest crossing mismatch",
    )
    _fail(
        artifact.get("request_id") == response.get("request_id") == expected_request_id
        and artifact.get("request_sha256")
        == response.get("request_sha256")
        == expected_request_sha
        and response.get("solve_index") == 1
        and type(response.get("solve_ms")) is int
        and response.get("effective_deadline_ms")
        == neutral.effective_deadline_ms(timeout_ms, "archived named timeout"),
        "named response/request crossing mismatch",
    )
    session = artifact.get("session")
    _fail(type(session) is dict, "named solved session is absent")
    validated_session = _validate_session_shape(
        session, label=query.descriptor["query_id"], state="live"
    )
    _fail(
        validated_session["id"] == artifact.get("session_id") == job["session_id"]
        and validated_session["solves"] == 1
        and validated_session["last_status"] == answer["status"]
        and validated_session["last_solve_index"] == 1
        and validated_session["last_assumption_free"] is False
        and validated_session["last_terminal_unsat"] == answer.get("terminal_unsat"),
        "named archived session/answer crossing mismatch",
    )
    _fail(
        receipts.get("session_id") == artifact.get("session_id")
        and receipts.get("lane") == "smt"
        and receipts.get("journal_path") == validated_session["journal_path"]
        and receipts.get("receipts_path")
        == f"/daemon/sessions/{validated_session['id']}/receipts.jsonl"
        and receipts.get("count") == 1
        and type(receipts.get("receipts")) is list
        and len(receipts["receipts"]) == 1,
        "named receipt session crossing mismatch",
    )
    receipt = receipts["receipts"][0]
    _fail(
        type(receipt) is dict
        and receipt.get("solve_index") == 1
        and receipt.get("base_commands") == len(query.journal_commands)
        and receipt.get("base_bytes") == len(query.journal_smt2)
        and receipt.get("base_sha256") == _sha(query.journal_smt2)
        and receipt.get("solver_signature") == validated_session["solver_signature"]
        and receipt.get("solver_sha256") == validated_session["solver_sha256"]
        and receipt.get("assumptions") == list(query.assumptions)
        and receipt.get("timeout_ms") == timeout_ms
        and receipt.get("effective_deadline_ms")
        == neutral.effective_deadline_ms(timeout_ms, "archived named receipt timeout")
        and receipt.get("include_model") is True
        and receipt.get("get_values") == list(query.get_values)
        and receipt.get("solve_ms") == response["solve_ms"]
        and receipt.get("result_sha256") == digest
        and receipt.get("request_id") == expected_request_id
        and receipt.get("request_sha256") == expected_request_sha
        and receipt.get("assumption_labels") == labels,
        "named receipt request/digest/labels crossing mismatch",
    )
    _fail(
        _answer_projection(receipt) == answer, "named receipt/response answer mismatch"
    )
    from census import rigid221_pentagon_oracle as oracle

    live_oracle = capture_source(_SOURCE_PATHS[0])
    live_ledger_sha = _sha(
        _canonical([list(entry) for entry in oracle._CAP_LAYER_LEDGER])
    )
    for index, binding in enumerate(query.descriptor["semantic_input"]["groups"]):
        _fail(type(binding) is dict, "named source binding is not an object")
        stored_sha = binding.get("binding_sha256")
        stored_label = binding.get("assumption_label")
        basis = {
            key: value
            for key, value in binding.items()
            if key not in {"binding_sha256", "assumption_label"}
        }
        expected_sha = _sha(_canonical(basis))
        _fail(stored_sha == expected_sha, "named source binding digest mismatch")
        _fail(
            stored_label
            == f"rigid221-ledger/{index:03d}/{binding['tag']}/{expected_sha}"
            == labels[index],
            "named source label differs from exact source binding",
        )
        live_entry = list(_ledger_binding(binding["tag"]))
        _fail(
            binding.get("ledger_entry") == live_entry
            and binding.get("ledger_sha256") == live_ledger_sha
            and binding.get("oracle_source")
            == {
                "path": _SOURCE_PATHS[0].relative_to(_ROOT).as_posix(),
                "bytes": len(live_oracle.payload),
                "sha256": _sha(live_oracle.payload),
            },
            "named label is not bound to the current exact ledger source",
        )
    _fail(
        artifact.get("core") == answer.get("core")
        and artifact.get("core_labels") == answer.get("core_labels")
        and artifact.get("diagnostic_only") is True
        and artifact.get("proofless_unsat") == (answer["status"] == "UNSAT")
        and artifact.get("claims") == FALSE_CLAIMS,
        "named archived classification/answer mismatch",
    )
    _fail(job["status"] == answer["status"], "named job/answer status mismatch")
    closed = _validate_session_shape(
        _strict_json_bytes(
            _read_relative(root_fd, f"{directory}/named-core.closed-session.json"),
            "archived named closed session",
        ),
        label=query.descriptor["query_id"],
        state="closed",
    )
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
    _fail(
        all(closed[key] == validated_session[key] for key in identity_keys)
        and closed["clauses"] == len(query.journal_commands)
        and closed["solves"] == 1
        and closed["last_status"] == answer["status"]
        and closed["last_solve_index"] == 1
        and closed["last_assumption_free"] is False
        and closed["last_terminal_unsat"] == answer.get("terminal_unsat"),
        "named closed session crossed response or receipt",
    )
    if answer["status"] == "SAT":
        replay = verify_stage5_sat(query, "z3", answer["model"], answer["values"])
        _fail(
            replay.accepted and artifact.get("semantic_replay") == replay.evidence,
            "named archived SAT replay mismatch",
        )


def validate_published_output(output_directory: Path) -> dict[str, object]:
    """Standalone offline validation; this function performs zero transport."""

    output = _absolute_path(output_directory, "published output")
    try:
        root_fd = _open_componentwise(output, directory=True)
    except OSError as exc:
        raise Rigid221PiqdError("cannot open published output without links") from exc
    try:
        observed = _inventory_from_fd(root_fd)
        manifest = _strict_json_bytes(
            _read_relative(root_fd, "manifest.json"), "publication manifest"
        )
        _fail(manifest.get("schema") == MANIFEST_SCHEMA, "manifest schema mismatch")
        without_manifest = [
            item for item in observed if item["path"] != "manifest.json"
        ]
        _fail(manifest.get("files") == without_manifest, "manifest inventory mismatch")
        _fail(
            manifest.get("file_count") == len(without_manifest)
            and manifest.get("total_bytes")
            == sum(item["bytes"] for item in without_manifest)
            and manifest.get("root_digest") == _sha(_canonical(without_manifest)),
            "manifest aggregate mismatch",
        )
        campaign = _strict_json_bytes(
            _read_relative(root_fd, "campaign.json"), "campaign result"
        )
        _fail(campaign.get("schema") == RESULT_SCHEMA, "campaign schema mismatch")
        _fail(
            campaign.get("workers") == 1
            and campaign.get("sequential") is True
            and campaign.get("fresh_session_per_query") is True
            and campaign.get("solve_count_per_session") == 1
            and campaign.get("local_fallback") is False,
            "campaign execution contract mismatch",
        )
        _fail(
            campaign.get("proof_blueprint") == PROOF_BLUEPRINT,
            "proof-blueprint classification drifted",
        )
        _fail(campaign.get("source_files") == _campaign_sources(), "live source drift")
        jobs = campaign.get("jobs")
        _fail(type(jobs) is list, "campaign jobs are not a list")
        directories: set[str] = set()
        session_ids: set[str] = set()
        for expected_index, job in enumerate(jobs):
            _fail(
                type(job) is dict and job.get("index") == expected_index,
                "job order mismatch",
            )
            directory = job.get("directory")
            _fail(
                type(directory) is str and directory not in directories,
                "duplicate or invalid job directory",
            )
            directories.add(directory)
            job_record = _strict_json_bytes(
                _read_relative(root_fd, f"{directory}/job.json"), "job record"
            )
            _fail(job_record == job, "campaign/job record mismatch")
            query = _load_archived_query(root_fd, directory)
            _fail(
                job["descriptor_sha256"] == _sha(query.descriptor_bytes)
                and job["journal_sha256"] == _sha(query.journal_smt2)
                and job["query_id"] == query.descriptor["query_id"]
                and job["source_order"] == [item.path for item in query.source_files],
                "job query/order/source binding mismatch",
            )
            session_id = job.get("session_id")
            _fail(
                type(session_id) is str and session_id not in session_ids,
                "session reuse",
            )
            session_ids.add(session_id)
            if job["stage"] == "stage5-named-core":
                _validate_archived_named_core(root_fd, directory, query, job)
            else:
                _validate_archived_neutral_job(root_fd, directory, query, job)
        return campaign
    finally:
        os.close(root_fd)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", type=Path)
    parser.add_argument("--timeout", type=float, default=20.0)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    if args.check is not None:
        if args.output is not None:
            parser.error("--check is standalone and accepts no --output")
        validate_published_output(args.check)
        return 0
    if args.output is None:
        parser.error("PIQD execution requires an exact create-once --output Path")
    run_campaign(
        output_directory=args.output,
        timeout_s=args.timeout,
        server=args.server,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
