# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""PIQD custody for the pinned-general-m finite-interface Z3 census.

This module deliberately owns the producer semantics.  PIQD supplies one fresh
Z3 process per query; a SAT answer is accepted only after an independent exact
bit-vector replay.  An UNSAT answer remains diagnostic and is not proof checked.
"""

from __future__ import annotations

import ctypes
import hashlib
import json
import os
import re
import stat
import sys
from collections import defaultdict
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Protocol

from census.p97_search import phase3_piqd_smt_source_adapter as neutral

LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
LABEL_INDEX = {label: index for index, label in enumerate(LABELS)}
NONFIXED_CENTERS = tuple(label for label in LABELS if label not in {"v", "w"})
CARDINALITY_FLOORS = (2, 3, 4)
DESCRIPTOR_SCHEMA = "pinned-generalm-piqd-query.v1"
PROFILE_SCHEMA = "pinned-generalm-piqd-z3-profile.v1"
SOURCE_PACKET_SCHEMA = "pinned-generalm-piqd-source-packet.v1"
REPORT_SCHEMA = "pinned_surplus_generalm_certificate_coverage.piqd.v1"
MANIFEST_SCHEMA = "pinned-generalm-piqd-publication.v1"
INVENTORY_SCHEMA = "pinned-generalm-piqd-custody-inventory.v1"
EXPECTED_REQUIRED_SCHEMA = "pinned_surplus_generalm_required_facts.v1"
EXPECTED_INCIDENCE_SCHEMA = "pinned_surplus_relaxed_incidence_census.v1"
EXPECTED_CERTIFICATE_SCHEMA = "pinned_surplus_relaxed_split_certificate_census.v1"
EXPECTED_QUERY_COUNT = 45
MAX_SOURCE_BYTES = 64 * 1024 * 1024
MAX_ARTIFACT_BYTES = 64 * 1024 * 1024
NATIVE_PATH_TYPE = type(Path())


class PinnedGeneralmPiqdError(RuntimeError):
    """Fail-closed producer or offline-validation error."""


class ShadowTool(Protocol):
    def candidate_masks_for(self, sstar: str, center: str) -> list[int]: ...

    def py_separated(
        self, center: str, other_center: str, left: str, right: str
    ) -> bool: ...


@dataclass(frozen=True)
class CapturedSource:
    role: str
    locator: str
    path: Path
    payload: bytes
    identity: tuple[int, int, int, int, int]
    component_identities: tuple[tuple[int, int], ...]

    @property
    def sha256(self) -> str:
        return _sha(self.payload)


@dataclass(frozen=True)
class SourceBundle:
    repo_root: Path
    sources: tuple[CapturedSource, ...]
    required_facts: dict[str, Any]
    incidence: dict[str, Any]

    def by_role(self, role: str) -> CapturedSource:
        matches = [source for source in self.sources if source.role == role]
        if len(matches) != 1:
            raise PinnedGeneralmPiqdError(f"source role {role!r} is not unique")
        return matches[0]


@dataclass(frozen=True)
class PreparedQuery:
    query_index: int
    cardinality_floor: int
    row_index: int
    context: dict[str, Any]
    context_bytes: bytes
    query: neutral.SourceSemanticQuery


@dataclass
class StagingDirectory:
    final_path: Path
    staging_path: Path
    parent_fd: int
    parent_identity: tuple[int, int]
    final_name: str
    staging_name: str
    fd: int
    identity: tuple[int, int]


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=True,
            allow_nan=False,
        ).encode("ascii")
    except (TypeError, ValueError) as exc:
        raise PinnedGeneralmPiqdError("value is not canonical JSON") from exc


def _object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise PinnedGeneralmPiqdError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _parse_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=_object_pairs,
            parse_constant=lambda token: (_ for _ in ()).throw(
                PinnedGeneralmPiqdError(f"non-finite JSON number {token} in {where}")
            ),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PinnedGeneralmPiqdError(f"malformed JSON in {where}") from exc
    if type(value) is not dict:
        raise PinnedGeneralmPiqdError(f"{where} must be a JSON object")
    return value


def _safe_locator(value: object, where: str) -> str:
    if type(value) is not str or not value or "\\" in value:
        raise PinnedGeneralmPiqdError(f"{where} is not a safe repository path")
    path = PurePosixPath(value)
    if path.is_absolute() or any(part in {"", ".", ".."} for part in path.parts):
        raise PinnedGeneralmPiqdError(f"{where} is not a safe repository path")
    return value


def _native_absolute_path(path: object, where: str) -> Path:
    if type(path) is not NATIVE_PATH_TYPE:
        raise PinnedGeneralmPiqdError(f"{where} must be an exact native Path")
    return Path(os.path.abspath(os.fspath(path)))


def _directory_identity(info: os.stat_result) -> tuple[int, int]:
    return (info.st_dev, info.st_ino)


def _directory_custody_identity(
    info: os.stat_result,
) -> tuple[int, int, int, int]:
    return (info.st_dev, info.st_ino, info.st_mtime_ns, info.st_ctime_ns)


def _file_identity(info: os.stat_result) -> tuple[int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _open_directory_componentwise(
    path: Path, where: str
) -> tuple[int, tuple[tuple[int, int], ...]]:
    absolute = _native_absolute_path(path, where)
    flags = os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0)
    try:
        fd = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise PinnedGeneralmPiqdError(f"cannot open {where} root") from exc
    identities: list[tuple[int, int]] = []
    try:
        root_info = os.fstat(fd)
        if not stat.S_ISDIR(root_info.st_mode):
            raise PinnedGeneralmPiqdError(f"{where} root is not a directory")
        identities.append(_directory_identity(root_info))
        for component in absolute.parts[1:]:
            try:
                child_fd = os.open(component, flags, dir_fd=fd)
            except OSError as exc:
                raise PinnedGeneralmPiqdError(
                    f"cannot open component of {where}"
                ) from exc
            child_info = os.fstat(child_fd)
            if not stat.S_ISDIR(child_info.st_mode):
                os.close(child_fd)
                raise PinnedGeneralmPiqdError(
                    f"component of {where} is not a directory"
                )
            identities.append(_directory_identity(child_info))
            os.close(fd)
            fd = child_fd
        return fd, tuple(identities)
    except BaseException:
        os.close(fd)
        raise


def _read_bounded_regular_fd(fd: int, *, where: str, max_bytes: int) -> bytes:
    before = os.fstat(fd)
    if (
        not stat.S_ISREG(before.st_mode)
        or before.st_nlink != 1
        or before.st_size > max_bytes
    ):
        raise PinnedGeneralmPiqdError(f"{where} is not a bounded unique regular file")
    remaining = before.st_size
    chunks: list[bytes] = []
    while remaining:
        chunk = os.read(fd, min(remaining, 1024 * 1024))
        if not chunk:
            raise PinnedGeneralmPiqdError(f"{where} was truncated during capture")
        chunks.append(chunk)
        remaining -= len(chunk)
    if os.read(fd, 1):
        raise PinnedGeneralmPiqdError(f"{where} grew during capture")
    after = os.fstat(fd)
    if _file_identity(before) != _file_identity(after):
        raise PinnedGeneralmPiqdError(f"{where} changed during capture")
    payload = b"".join(chunks)
    if len(payload) != before.st_size:
        raise PinnedGeneralmPiqdError(f"{where} size changed during capture")
    return payload


def _capture(path: Path, *, role: str, locator: str) -> CapturedSource:
    absolute = _native_absolute_path(path, "source path")
    parent_fd, component_identities = _open_directory_componentwise(
        absolute.parent, f"source parent {locator}"
    )
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    try:
        try:
            fd = os.open(absolute.name, flags, dir_fd=parent_fd)
        except OSError as exc:
            raise PinnedGeneralmPiqdError(f"cannot capture source {locator}") from exc
        try:
            before = os.fstat(fd)
            payload = _read_bounded_regular_fd(
                fd, where=f"source {locator}", max_bytes=MAX_SOURCE_BYTES
            )
        finally:
            os.close(fd)
    finally:
        os.close(parent_fd)
    return CapturedSource(
        role,
        locator,
        absolute,
        payload,
        _file_identity(before),
        component_identities,
    )


def _repo_path(repo_root: Path, locator: object, where: str) -> tuple[str, Path]:
    safe = _safe_locator(locator, where)
    root = _native_absolute_path(repo_root, "repo_root")
    return safe, root / safe


def _relative_locator(repo_root: Path, path: Path, where: str) -> str:
    root = _native_absolute_path(repo_root, "repo_root")
    resolved = _native_absolute_path(path, where)
    try:
        return resolved.relative_to(root).as_posix()
    except ValueError as exc:
        raise PinnedGeneralmPiqdError(f"{where} is outside repository root") from exc


def _implementation_locator(repo_root: Path, path: Path, role: str) -> str:
    try:
        return _relative_locator(repo_root, path, role)
    except PinnedGeneralmPiqdError:
        # Test fixtures and vendored callers may place the authenticated input
        # tree under a different root.  The role-qualified logical locator is
        # still exact because bytes, filesystem identity, and role are bound.
        return f"implementation/{role}/{path.name}"


def _require_sha_edge(
    owner: dict[str, Any],
    *,
    path_key: str,
    sha_key: str,
    expected: CapturedSource,
    where: str,
) -> None:
    source = owner.get("source")
    if type(source) is not dict:
        raise PinnedGeneralmPiqdError(f"{where}.source is not an object")
    if (
        source.get(path_key) != expected.locator
        or source.get(sha_key) != expected.sha256
    ):
        raise PinnedGeneralmPiqdError(f"{where} upstream {path_key} binding mismatch")


def _validate_inputs(required: dict[str, Any], incidence: dict[str, Any]) -> None:
    if required.get("schema") != EXPECTED_REQUIRED_SCHEMA:
        raise PinnedGeneralmPiqdError("required-facts schema mismatch")
    if incidence.get("schema") != EXPECTED_INCIDENCE_SCHEMA:
        raise PinnedGeneralmPiqdError("incidence schema mismatch")
    rows = incidence.get("rows")
    leaves = required.get("leaves")
    if type(rows) is not list or len(rows) != 15:
        raise PinnedGeneralmPiqdError("incidence must contain exactly 15 rows")
    if type(leaves) is not list or not leaves:
        raise PinnedGeneralmPiqdError("required facts must contain leaves")
    row_ids: list[str] = []
    for index, row in enumerate(rows):
        if type(row) is not dict:
            raise PinnedGeneralmPiqdError(f"incidence row {index} is not an object")
        relaxed_id = row.get("relaxed_id")
        sstar = row.get("sstar")
        masks = row.get("relaxed_masks")
        if (
            type(relaxed_id) is not str
            or type(sstar) is not str
            or type(masks) is not dict
        ):
            raise PinnedGeneralmPiqdError(f"incidence row {index} has invalid identity")
        if set(masks) != set(LABELS):
            raise PinnedGeneralmPiqdError(f"incidence row {index} mask labels mismatch")
        for label, record in masks.items():
            if type(record) is not dict or type(record.get("mask")) is not int:
                raise PinnedGeneralmPiqdError(
                    f"incidence row {index} mask {label} is invalid"
                )
            mask = record["mask"]
            if not 0 <= mask < (1 << len(LABELS)):
                raise PinnedGeneralmPiqdError(
                    f"incidence row {index} mask is out of range"
                )
        row_ids.append(relaxed_id)
    if len(set(row_ids)) != len(row_ids):
        raise PinnedGeneralmPiqdError("incidence relaxed IDs are not unique")
    seen: set[str] = set()
    leaf_row_ids: set[str] = set()
    for index, leaf in enumerate(leaves):
        if type(leaf) is not dict:
            raise PinnedGeneralmPiqdError(f"leaf {index} is not an object")
        certificate_id = leaf.get("certificate_id")
        relaxed_id = leaf.get("relaxed_id")
        erased = leaf.get("erased_facts")
        if type(certificate_id) is not str or certificate_id in seen:
            raise PinnedGeneralmPiqdError("certificate IDs are invalid or duplicate")
        if type(relaxed_id) is not str or relaxed_id not in row_ids:
            raise PinnedGeneralmPiqdError("leaf relaxed ID is not in incidence")
        if type(erased) is not list or not erased:
            raise PinnedGeneralmPiqdError(f"leaf {certificate_id} has no erased facts")
        for fact in erased:
            if type(fact) is not dict or fact.get("center") not in LABELS:
                raise PinnedGeneralmPiqdError(f"leaf {certificate_id} fact is invalid")
            witnesses = fact.get("witnesses")
            if (
                type(witnesses) is not list
                or len(witnesses) != 2
                or any(item not in LABELS for item in witnesses)
                or witnesses[0] == witnesses[1]
            ):
                raise PinnedGeneralmPiqdError(
                    f"leaf {certificate_id} witnesses are invalid"
                )
        seen.add(certificate_id)
        leaf_row_ids.add(relaxed_id)
    if leaf_row_ids != set(row_ids):
        raise PinnedGeneralmPiqdError("not every incidence row has certificate leaves")


def capture_source_bundle(
    *,
    repo_root: Path,
    required_facts_path: Path,
    incidence_path: Path,
    caller_script_path: Path,
    shadow_tool_path: Path,
) -> SourceBundle:
    """Capture all direct inputs and all hash-named upstreams without following links."""

    repo_root = _native_absolute_path(repo_root, "repo_root")
    root_fd, _root_components = _open_directory_componentwise(repo_root, "repo_root")
    os.close(root_fd)
    required_locator = _relative_locator(
        repo_root, required_facts_path, "required facts"
    )
    incidence_locator = _relative_locator(repo_root, incidence_path, "incidence")
    required_source = _capture(
        required_facts_path, role="required_facts", locator=required_locator
    )
    incidence_source = _capture(
        incidence_path, role="incidence", locator=incidence_locator
    )
    required = _parse_json(required_source.payload, required_locator)
    incidence = _parse_json(incidence_source.payload, incidence_locator)
    _validate_inputs(required, incidence)

    required_meta = required.get("source")
    incidence_meta = incidence.get("source")
    if type(required_meta) is not dict or type(incidence_meta) is not dict:
        raise PinnedGeneralmPiqdError("input source records are missing")
    cert_locator, cert_path = _repo_path(
        repo_root, required_meta.get("certificate_census"), "certificate census path"
    )
    bank_locator, bank_path = _repo_path(
        repo_root, incidence_meta.get("bank"), "bank path"
    )
    certificate = _capture(cert_path, role="certificate_census", locator=cert_locator)
    bank = _capture(bank_path, role="bank", locator=bank_locator)
    certificate_json = _parse_json(certificate.payload, cert_locator)
    if certificate_json.get("schema") != EXPECTED_CERTIFICATE_SCHEMA:
        raise PinnedGeneralmPiqdError("certificate-census schema mismatch")
    certificate_meta = certificate_json.get("source")
    if type(certificate_meta) is not dict:
        raise PinnedGeneralmPiqdError("certificate-census source record is missing")
    split_locator, split_path = _repo_path(
        repo_root, certificate_meta.get("split_probe"), "split-probe path"
    )
    split_probe = _capture(split_path, role="split_probe", locator=split_locator)

    _require_sha_edge(
        required,
        path_key="incidence_census",
        sha_key="incidence_census_sha256",
        expected=incidence_source,
        where="required facts",
    )
    _require_sha_edge(
        required,
        path_key="certificate_census",
        sha_key="certificate_census_sha256",
        expected=certificate,
        where="required facts",
    )
    _require_sha_edge(
        incidence,
        path_key="bank",
        sha_key="bank_sha256",
        expected=bank,
        where="incidence",
    )
    _require_sha_edge(
        certificate_json,
        path_key="relaxed_census",
        sha_key="relaxed_census_sha256",
        expected=incidence_source,
        where="certificate census",
    )
    _require_sha_edge(
        certificate_json,
        path_key="split_probe",
        sha_key="split_probe_sha256",
        expected=split_probe,
        where="certificate census",
    )

    implementation_paths = (
        ("caller", caller_script_path),
        ("producer_adapter", Path(__file__)),
        ("generic_adapter", Path(neutral.__file__)),
        ("shadow_tool", shadow_tool_path),
    )
    implementations = tuple(
        _capture(
            path,
            role=role,
            locator=_implementation_locator(repo_root, path, role),
        )
        for role, path in implementation_paths
    )
    sources = (
        required_source,
        incidence_source,
        certificate,
        bank,
        split_probe,
        *implementations,
    )
    if len({source.locator for source in sources}) != len(sources):
        raise PinnedGeneralmPiqdError("captured source locators are not unique")
    return SourceBundle(repo_root, tuple(sources), required, incidence)


def check_bundle_current(bundle: SourceBundle) -> None:
    """Reopen every direct source and require exact identity and bytes."""

    if type(bundle) is not SourceBundle:
        raise PinnedGeneralmPiqdError("bundle must be an exact SourceBundle")
    for source in bundle.sources:
        current = _capture(source.path, role=source.role, locator=source.locator)
        if (
            current.identity != source.identity
            or current.component_identities != source.component_identities
            or current.payload != source.payload
        ):
            raise PinnedGeneralmPiqdError(
                f"source changed after capture: {source.locator}"
            )


def submask_domain(
    shadow_tool: ShadowTool, sstar: str, center: str, cardinality_floor: int
) -> list[int]:
    if (
        type(sstar) is not str
        or type(center) is not str
        or type(cardinality_floor) is not int
    ):
        raise PinnedGeneralmPiqdError("submask inputs have non-native types")
    values: set[int] = set()
    candidates = shadow_tool.candidate_masks_for(sstar, center)
    if type(candidates) is not list:
        raise PinnedGeneralmPiqdError("candidate_masks_for must return an exact list")
    for full_mask in candidates:
        if type(full_mask) is not int or not 0 <= full_mask < (1 << len(LABELS)):
            raise PinnedGeneralmPiqdError("candidate mask is invalid")
        submask = full_mask
        while True:
            if cardinality_floor <= submask.bit_count() <= 4:
                values.add(submask)
            if submask == 0:
                break
            submask = (submask - 1) & full_mask
    if not values:
        raise PinnedGeneralmPiqdError("authenticated finite domain is empty")
    return sorted(values)


def _cross_constraints(shadow_tool: ShadowTool) -> list[list[str]]:
    result: list[list[str]] = []
    for center_index, center in enumerate(LABELS):
        for other in LABELS[center_index + 1 :]:
            for left_index, left in enumerate(LABELS):
                for right in LABELS[left_index + 1 :]:
                    if left in {center, other} or right in {center, other}:
                        continue
                    separated = shadow_tool.py_separated(center, other, left, right)
                    if type(separated) is not bool:
                        raise PinnedGeneralmPiqdError("py_separated must return bool")
                    if not separated:
                        result.append([center, other, left, right])
    return result


def _bit(center: str, label: str) -> str:
    return (
        f"(= ((_ extract {LABEL_INDEX[label]} {LABEL_INDEX[label]}) mask_{center}) #b1)"
    )


def _or(parts: list[str]) -> str:
    if not parts:
        raise PinnedGeneralmPiqdError("empty disjunction is forbidden")
    return parts[0] if len(parts) == 1 else f"(or {' '.join(parts)})"


def _and(parts: list[str]) -> str:
    if not parts:
        raise PinnedGeneralmPiqdError("empty conjunction is forbidden")
    return parts[0] if len(parts) == 1 else f"(and {' '.join(parts)})"


def _bvadd(parts: list[str]) -> str:
    if not parts:
        raise PinnedGeneralmPiqdError("empty bit-vector sum is forbidden")
    result = parts[0]
    for part in parts[1:]:
        result = f"(bvadd {result} {part})"
    return result


def _query_commands(context: Mapping[str, Any]) -> tuple[str, ...]:
    commands = ["(set-logic QF_BV)"]
    commands.extend(f"(declare-const mask_{center} (_ BitVec 10))" for center in LABELS)
    domains = context["domains"]
    for center in NONFIXED_CENTERS:
        equalities = [
            f"(= mask_{center} (_ bv{value} 10))" for value in domains[center]
        ]
        commands.append(f"(assert {_or(equalities)})")
    for center in ("v", "w"):
        commands.append(
            f"(assert (= mask_{center} (_ bv{context['fixed_masks'][center]} 10)))"
        )
    for center, other, left, right in context["cross_constraints"]:
        commands.append(
            f"(assert (not {_and([_bit(center, left), _bit(center, right), _bit(other, left), _bit(other, right)])}))"
        )
    for left_index, left in enumerate(LABELS):
        for right in LABELS[left_index + 1 :]:
            uses = [
                f"(ite {_and([_bit(center, left), _bit(center, right)])} (_ bv1 4) (_ bv0 4))"
                for center in LABELS
                if center not in {left, right}
            ]
            commands.append(f"(assert (bvule {_bvadd(uses)} (_ bv2 4)))")
    for leaf in context["leaf_records"]:
        missing = [
            f"(not {_and([_bit(fact['center'], fact['witnesses'][0]), _bit(fact['center'], fact['witnesses'][1])])})"
            for fact in leaf["erased_facts"]
        ]
        commands.append(f"(assert {_or(missing)})")
    return tuple(commands)


def prepare_queries(
    bundle: SourceBundle, shadow_tool: ShadowTool, *, timeout_ms: int
) -> tuple[PreparedQuery, ...]:
    """Construct and public-API-validate all 45 exact single-Z3 queries."""

    if type(bundle) is not SourceBundle:
        raise PinnedGeneralmPiqdError("bundle must be an exact SourceBundle")
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise PinnedGeneralmPiqdError(
            "timeout_ms must be an exact integer in 1..3600000"
        )
    check_bundle_current(bundle)
    leaves_by_row: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for leaf in bundle.required_facts["leaves"]:
        leaves_by_row[leaf["relaxed_id"]].append(leaf)
    source_summary = [
        {
            "role": item.role,
            "path": item.locator,
            "bytes": len(item.payload),
            "sha256": item.sha256,
            "identity": list(item.identity),
            "component_identities": [
                list(identity) for identity in item.component_identities
            ],
        }
        for item in sorted(
            bundle.sources, key=lambda source: (source.role, source.locator)
        )
    ]
    source_packet_sha = _sha(_canonical(source_summary))
    cross = _cross_constraints(shadow_tool)
    prepared: list[PreparedQuery] = []
    for floor in CARDINALITY_FLOORS:
        for row_index, row in enumerate(bundle.incidence["rows"]):
            leaves = sorted(
                leaves_by_row[row["relaxed_id"]],
                key=lambda leaf: leaf["certificate_id"],
            )
            domains = {
                center: submask_domain(shadow_tool, row["sstar"], center, floor)
                for center in NONFIXED_CENTERS
            }
            query_index = len(prepared)
            context = {
                "schema": "pinned-generalm-query-context.v1",
                "query_index": query_index,
                "row_index": row_index,
                "cardinality_floor": floor,
                "row_record": row,
                "leaf_records": leaves,
                "relaxed_id": row["relaxed_id"],
                "sstar": row["sstar"],
                "labels": list(LABELS),
                "nonfixed_centers": list(NONFIXED_CENTERS),
                "fixed_masks": {
                    center: row["relaxed_masks"][center]["mask"]
                    for center in ("v", "w")
                },
                "domains": domains,
                "cross_constraints": cross,
                "pair_class_count_max": 2,
                "source_packet_sha256": source_packet_sha,
                "source_files": source_summary,
                "encoding": "QF_BV10-state-journal-v1",
            }
            context_bytes = _canonical(context) + b"\n"
            commands = _query_commands(context)
            raw_smt2 = b"".join(command.encode("ascii") + b"\n" for command in commands)
            normalized_commands, journal = neutral.normalize_state_journal(raw_smt2)
            if normalized_commands != commands or journal != raw_smt2:
                raise PinnedGeneralmPiqdError(
                    "SMT journal normalization was not byte-stable"
                )
            snapshots = [
                neutral.SourceSnapshot(
                    f"source-{index:02d}-{source.role}-{Path(source.locator).name}",
                    source.payload,
                )
                for index, source in enumerate(
                    sorted(bundle.sources, key=lambda item: (item.role, item.locator))
                )
            ]
            snapshots.append(
                neutral.SourceSnapshot("source-99-query-context.json", context_bytes)
            )
            snapshots.sort(key=lambda item: item.path)
            variables = [
                {
                    "id": f"mask-{center}",
                    "term": f"mask_{center}",
                    "sort": "(_ BitVec 10)",
                }
                for center in sorted(LABELS)
            ]
            descriptor = {
                "schema": DESCRIPTOR_SCHEMA,
                "producer": {
                    "id": "pinned-generalm-certificate-coverage",
                    "version": "v1",
                },
                "semantic_verifier": {
                    "id": "exact-bitvector-interface-replay",
                    "version": "v1",
                },
                "stage_id": f"floor-{floor}",
                "query_id": f"q{query_index:02d}-floor{floor}-row{row_index:02d}-{row['relaxed_id']}",
                "sources": [
                    {
                        "path": item.path,
                        "bytes": len(item.payload),
                        "sha256": _sha(item.payload),
                    }
                    for item in snapshots
                ],
                "semantic_input": context,
                "semantic_sha256": _sha(_canonical(context)),
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
            try:
                query = neutral.validate_authenticated_single_solver_query(
                    query,
                    solver="z3",
                    descriptor_schema=DESCRIPTOR_SCHEMA,
                    solver_profile_schema=PROFILE_SCHEMA,
                    authenticated_journal_commands=commands,
                )
            except neutral.SmtSourceAdapterError as exc:
                raise PinnedGeneralmPiqdError(
                    "public single-Z3 query validation failed"
                ) from exc
            prepared.append(
                PreparedQuery(
                    query_index, floor, row_index, context, context_bytes, query
                )
            )
    if len(prepared) != EXPECTED_QUERY_COUNT:
        raise PinnedGeneralmPiqdError(
            "query construction did not produce exactly 45 queries"
        )
    return tuple(prepared)


_VALUE_PAIR = re.compile(
    r"\(\s*(mask_(?:u|v|w|s1|s2|s3|Pw|Pu|Q1|Q2))\s+"
    r"(#b[01]+|\(_\s+bv[0-9]+\s+10\))\s*\)"
)


def parse_readback(values: str) -> dict[str, int]:
    if type(values) is not str or len(values.encode("utf-8")) > 1024 * 1024:
        raise PinnedGeneralmPiqdError("SAT readback is absent or oversized")
    assignment: dict[str, int] = {}
    spans: list[tuple[int, int]] = []
    for match in _VALUE_PAIR.finditer(values):
        term, literal = match.groups()
        label = term.removeprefix("mask_")
        if label in assignment:
            raise PinnedGeneralmPiqdError("SAT readback contains duplicate terms")
        if literal.startswith("#b"):
            if len(literal) != 12:
                raise PinnedGeneralmPiqdError("SAT bit-vector literal has wrong width")
            value = int(literal[2:], 2)  # noqa: FURB166 -- SMT-LIB uses #b, not 0b
        else:
            value = int(re.search(r"bv([0-9]+)", literal).group(1))  # type: ignore[union-attr]
        if not 0 <= value < 1024:
            raise PinnedGeneralmPiqdError("SAT bit-vector literal is out of range")
        assignment[label] = value
        spans.append(match.span())
    remainder = values
    for start, end in reversed(spans):
        remainder = remainder[:start] + remainder[end:]
    if set(assignment) != set(LABELS) or "".join(remainder.split()) not in {"()", ""}:
        raise PinnedGeneralmPiqdError("SAT readback shape does not match ten masks")
    return assignment


def _has_pair(mask: int, left: str, right: str) -> bool:
    return bool(mask & (1 << LABEL_INDEX[left])) and bool(
        mask & (1 << LABEL_INDEX[right])
    )


def replay_assignment(
    context: Mapping[str, Any], assignment: Mapping[str, int]
) -> dict[str, Any]:
    if type(context) is not dict or type(assignment) is not dict:
        raise PinnedGeneralmPiqdError(
            "SAT replay inputs must be exact builtin dictionaries"
        )
    if set(assignment) != set(LABELS) or any(
        type(value) is not int for value in assignment.values()
    ):
        raise PinnedGeneralmPiqdError("SAT assignment labels or values are invalid")
    for center in NONFIXED_CENTERS:
        if assignment[center] not in context["domains"][center]:
            raise PinnedGeneralmPiqdError(
                f"SAT assignment violates domain for {center}"
            )
    for center in ("v", "w"):
        if assignment[center] != context["fixed_masks"][center]:
            raise PinnedGeneralmPiqdError(
                f"SAT assignment violates fixed mask {center}"
            )
    for center, other, left, right in context["cross_constraints"]:
        if _has_pair(assignment[center], left, right) and _has_pair(
            assignment[other], left, right
        ):
            raise PinnedGeneralmPiqdError("SAT assignment violates cross separation")
    checked_pairs = 0
    for left_index, left in enumerate(LABELS):
        for right in LABELS[left_index + 1 :]:
            count = sum(
                _has_pair(assignment[center], left, right)
                for center in LABELS
                if center not in {left, right}
            )
            if count > 2:
                raise PinnedGeneralmPiqdError(
                    "SAT assignment violates pair-class count"
                )
            checked_pairs += 1
    for leaf in context["leaf_records"]:
        if not any(
            not _has_pair(assignment[fact["center"]], *fact["witnesses"])
            for fact in leaf["erased_facts"]
        ):
            raise PinnedGeneralmPiqdError(
                f"SAT assignment does not defeat leaf {leaf['certificate_id']}"
            )
    return {
        "schema": "pinned-generalm-exact-sat-replay.v1",
        "assignment": {label: assignment[label] for label in LABELS},
        "members": {
            label: [
                item for item in LABELS if assignment[label] & (1 << LABEL_INDEX[item])
            ]
            for label in LABELS
        },
        "checked_domains": len(NONFIXED_CENTERS),
        "checked_fixed_masks": 2,
        "checked_cross_constraints": len(context["cross_constraints"]),
        "checked_pair_classes": checked_pairs,
        "checked_leaves": len(context["leaf_records"]),
    }


def verify_sat_model(
    query: neutral.SourceSemanticQuery, solver: str, model: str, values: str | None
) -> neutral.SemanticVerification:
    if type(query) is not neutral.SourceSemanticQuery:
        raise PinnedGeneralmPiqdError("semantic replay query type is invalid")
    if solver != "z3" or type(model) is not str or type(values) is not str:
        raise PinnedGeneralmPiqdError(
            "semantic replay received the wrong solver payload"
        )
    if query.descriptor.get("schema") != DESCRIPTOR_SCHEMA:
        raise PinnedGeneralmPiqdError("semantic replay descriptor schema mismatch")
    evidence = replay_assignment(
        query.descriptor["semantic_input"], parse_readback(values)
    )
    return neutral.SemanticVerification(True, evidence)


def _write_all(fd: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(fd, view)
        if written <= 0:
            raise PinnedGeneralmPiqdError("short artifact write")
        view = view[written:]


def _write_immutable(root_fd: int, name: str, payload: bytes) -> dict[str, object]:
    if type(payload) is not bytes or len(payload) > MAX_ARTIFACT_BYTES:
        raise PinnedGeneralmPiqdError("artifact payload must be bounded exact bytes")
    if name in {"", ".", ".."} or "/" in name or "\\" in name:
        raise PinnedGeneralmPiqdError("unsafe artifact name")
    fd: int | None = None
    try:
        fd = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o400,
            dir_fd=root_fd,
        )
        _write_all(fd, payload)
        os.fsync(fd)
        info = os.fstat(fd)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or info.st_size != len(payload)
        ):
            raise PinnedGeneralmPiqdError("immutable artifact verification failed")
    except OSError as exc:
        raise PinnedGeneralmPiqdError(f"cannot install artifact {name}") from exc
    finally:
        if fd is not None:
            os.close(fd)
    os.fsync(root_fd)
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _create_private_directory(parent_fd: int, name: str) -> int:
    if name in {"", ".", ".."} or "/" in name or "\\" in name:
        raise PinnedGeneralmPiqdError("unsafe private directory name")
    try:
        os.mkdir(name, 0o700, dir_fd=parent_fd)
    except OSError as exc:
        raise PinnedGeneralmPiqdError(
            f"cannot create private directory {name}"
        ) from exc
    info = _entry_info(parent_fd, name, f"private directory {name}")
    return _assert_named_directory(
        parent_fd,
        name,
        _directory_identity(info),
        f"private directory {name}",
    )


def _open_or_create_directory_componentwise(path: Path, where: str) -> int:
    absolute = _native_absolute_path(path, where)
    flags = os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0)
    try:
        fd = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise PinnedGeneralmPiqdError(f"cannot open {where} root") from exc
    try:
        for component in absolute.parts[1:]:
            try:
                child_fd = os.open(component, flags, dir_fd=fd)
            except FileNotFoundError:
                try:
                    os.mkdir(component, 0o700, dir_fd=fd)
                except FileExistsError:
                    pass
                except OSError as exc:
                    raise PinnedGeneralmPiqdError(
                        f"cannot create component of {where}"
                    ) from exc
                try:
                    child_fd = os.open(component, flags, dir_fd=fd)
                except OSError as exc:
                    raise PinnedGeneralmPiqdError(
                        f"cannot authenticate created component of {where}"
                    ) from exc
            except OSError as exc:
                raise PinnedGeneralmPiqdError(
                    f"cannot open component of {where}"
                ) from exc
            child_info = os.fstat(child_fd)
            if not stat.S_ISDIR(child_info.st_mode):
                os.close(child_fd)
                raise PinnedGeneralmPiqdError(
                    f"component of {where} is not a directory"
                )
            os.close(fd)
            fd = child_fd
        return fd
    except BaseException:
        os.close(fd)
        raise


def _entry_info(parent_fd: int, name: str, where: str) -> os.stat_result:
    try:
        return os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    except OSError as exc:
        raise PinnedGeneralmPiqdError(f"cannot stat {where}") from exc


def _assert_named_directory(
    parent_fd: int, name: str, expected: tuple[int, int], where: str
) -> int:
    flags = os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0)
    before = _entry_info(parent_fd, name, where)
    try:
        fd = os.open(name, flags, dir_fd=parent_fd)
    except OSError as exc:
        raise PinnedGeneralmPiqdError(f"cannot open {where}") from exc
    after = _entry_info(parent_fd, name, where)
    actual = os.fstat(fd)
    if (
        not stat.S_ISDIR(before.st_mode)
        or _directory_identity(before) != expected
        or _directory_identity(actual) != expected
        or _directory_identity(after) != expected
    ):
        os.close(fd)
        raise PinnedGeneralmPiqdError(f"{where} was rebound")
    return fd


def _assert_output_parent_current(staging: StagingDirectory) -> None:
    current_fd, _ = _open_directory_componentwise(
        staging.final_path.parent, "output parent"
    )
    try:
        if _directory_identity(os.fstat(current_fd)) != staging.parent_identity:
            raise PinnedGeneralmPiqdError("output parent was rebound")
    finally:
        os.close(current_fd)


def _reserve_staging(final_path: Path) -> StagingDirectory:
    final_path = _native_absolute_path(final_path, "output_directory")
    if final_path.name in {"", ".", ".."}:
        raise PinnedGeneralmPiqdError("output_directory must be a named Path")
    parent_fd = _open_or_create_directory_componentwise(
        final_path.parent, "output parent"
    )
    parent_identity = _directory_identity(os.fstat(parent_fd))
    try:
        try:
            os.stat(final_path.name, dir_fd=parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise PinnedGeneralmPiqdError("create-once output already exists")
    except BaseException:
        os.close(parent_fd)
        raise
    for attempt in range(128):
        staging_name = f".{final_path.name}.staging-{os.getpid()}-{attempt:03d}"
        staging_path = final_path.parent / staging_name
        created_identity: tuple[int, int] | None = None
        try:
            os.mkdir(staging_name, 0o700, dir_fd=parent_fd)
            info = os.stat(staging_name, dir_fd=parent_fd, follow_symlinks=False)
            identity = _directory_identity(info)
            created_identity = identity
            fd = _assert_named_directory(
                parent_fd, staging_name, identity, "private output staging"
            )
            return StagingDirectory(
                final_path,
                staging_path,
                parent_fd,
                parent_identity,
                final_path.name,
                staging_name,
                fd,
                identity,
            )
        except FileExistsError:
            continue
        except BaseException:
            if created_identity is not None:
                try:
                    current = os.stat(
                        staging_name,
                        dir_fd=parent_fd,
                        follow_symlinks=False,
                    )
                    if (
                        stat.S_ISDIR(current.st_mode)
                        and _directory_identity(current) == created_identity
                    ):
                        os.rmdir(staging_name, dir_fd=parent_fd)
                except OSError:
                    # Never clean an entry whose identity cannot be reauthenticated.
                    pass
            os.close(parent_fd)
            raise
    os.close(parent_fd)
    raise PinnedGeneralmPiqdError("cannot allocate private output staging")


def _rename_noreplace(parent_fd: int, source: str, target: str) -> None:
    if os.uname().sysname == "Darwin":
        libc = ctypes.CDLL(None, use_errno=True)
        function = getattr(libc, "renameatx_np", None)
        if function is None:
            raise PinnedGeneralmPiqdError("renameatx_np is unavailable")
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        status = function(
            parent_fd,
            os.fsencode(source),
            parent_fd,
            os.fsencode(target),
            0x00000004,
        )
    elif os.uname().sysname == "Linux":
        libc = ctypes.CDLL(None, use_errno=True)
        function = getattr(libc, "renameat2", None)
        if function is None:
            raise PinnedGeneralmPiqdError("renameat2 is unavailable")
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        status = function(
            parent_fd, os.fsencode(source), parent_fd, os.fsencode(target), 1
        )
    else:
        raise PinnedGeneralmPiqdError("atomic no-replace publication is unsupported")
    if status != 0:
        error = ctypes.get_errno()
        raise PinnedGeneralmPiqdError(
            f"atomic create-once publication failed: errno {error}"
        )


def _read_regular_at(
    parent_fd: int,
    name: str,
    *,
    where: str,
    max_bytes: int,
    expected_identity: tuple[int, int, int, int, int] | None = None,
) -> tuple[bytes, tuple[int, int, int, int, int]]:
    before = _entry_info(parent_fd, name, where)
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    try:
        fd = os.open(name, flags, dir_fd=parent_fd)
    except OSError as exc:
        raise PinnedGeneralmPiqdError(f"cannot open {where}") from exc
    try:
        opened = os.fstat(fd)
        identity = _file_identity(opened)
        if _file_identity(before) != identity or (
            expected_identity is not None and identity != expected_identity
        ):
            raise PinnedGeneralmPiqdError(f"{where} was rebound")
        payload = _read_bounded_regular_fd(fd, where=where, max_bytes=max_bytes)
        after = _entry_info(parent_fd, name, where)
        if _file_identity(after) != identity:
            raise PinnedGeneralmPiqdError(f"{where} was rebound")
        return payload, identity
    finally:
        os.close(fd)


def _tree_inventory_fd(root_fd: int) -> list[dict[str, object]]:
    entries: list[dict[str, object]] = []

    def visit(directory_fd: int, prefix: str) -> None:
        try:
            names = sorted(os.listdir(directory_fd))
        except OSError as exc:
            raise PinnedGeneralmPiqdError(
                "cannot enumerate publication directory"
            ) from exc
        for name in names:
            if not name or name in {".", ".."} or "/" in name or "\\" in name:
                raise PinnedGeneralmPiqdError("unsafe publication entry name")
            relative = f"{prefix}/{name}" if prefix else name
            info = _entry_info(directory_fd, name, f"publication entry {relative}")
            if stat.S_ISDIR(info.st_mode):
                identity = _directory_custody_identity(info)
                child_fd = _assert_named_directory(
                    directory_fd,
                    name,
                    _directory_identity(info),
                    f"publication directory {relative}",
                )
                try:
                    if _directory_custody_identity(os.fstat(child_fd)) != identity:
                        raise PinnedGeneralmPiqdError(
                            f"publication directory {relative} changed"
                        )
                    entries.append(
                        {
                            "path": relative,
                            "kind": "directory",
                            "identity": list(identity),
                        }
                    )
                    visit(child_fd, relative)
                    after = _entry_info(
                        directory_fd, name, f"publication directory {relative}"
                    )
                    if _directory_custody_identity(after) != identity:
                        raise PinnedGeneralmPiqdError(
                            f"publication directory {relative} changed"
                        )
                finally:
                    os.close(child_fd)
            elif stat.S_ISREG(info.st_mode):
                payload, identity = _read_regular_at(
                    directory_fd,
                    name,
                    where=f"publication artifact {relative}",
                    max_bytes=MAX_ARTIFACT_BYTES,
                )
                if relative == "custody-inventory.json":
                    continue
                entries.append(
                    {
                        "path": relative,
                        "kind": "file",
                        "identity": list(identity),
                        "bytes": len(payload),
                        "sha256": _sha(payload),
                    }
                )
            else:
                raise PinnedGeneralmPiqdError(
                    "publication contains a non-regular artifact"
                )

    visit(root_fd, "")
    entries.sort(key=lambda item: item["path"])
    return entries


def _inventory_index(
    entries: object,
) -> dict[str, dict[str, object]]:
    if type(entries) is not list:
        raise PinnedGeneralmPiqdError("custody inventory entries are malformed")
    result: dict[str, dict[str, object]] = {}
    for entry in entries:
        if type(entry) is not dict or type(entry.get("path")) is not str:
            raise PinnedGeneralmPiqdError("custody inventory entry is malformed")
        path = _safe_locator(entry["path"], "custody inventory path")
        if path in result:
            raise PinnedGeneralmPiqdError("duplicate custody inventory path")
        if entry.get("kind") == "directory":
            if set(entry) != {"path", "kind", "identity"}:
                raise PinnedGeneralmPiqdError("custody directory entry is malformed")
            identity = entry["identity"]
            if (
                type(identity) is not list
                or len(identity) != 4
                or any(type(value) is not int for value in identity)
            ):
                raise PinnedGeneralmPiqdError("custody directory identity is malformed")
        elif entry.get("kind") == "file":
            if set(entry) != {"path", "kind", "identity", "bytes", "sha256"}:
                raise PinnedGeneralmPiqdError("custody file entry is malformed")
            identity = entry["identity"]
            if (
                type(identity) is not list
                or len(identity) != 5
                or any(type(value) is not int for value in identity)
                or type(entry["bytes"]) is not int
                or type(entry["sha256"]) is not str
            ):
                raise PinnedGeneralmPiqdError("custody file identity is malformed")
        else:
            raise PinnedGeneralmPiqdError("unknown custody inventory entry kind")
        result[path] = entry
    return result


def _read_artifact_at(
    root_fd: int,
    locator: object,
    *,
    inventory: Mapping[str, dict[str, object]] | None,
    max_bytes: int = MAX_ARTIFACT_BYTES,
) -> bytes:
    safe = _safe_locator(locator, "publication artifact path")
    parts = PurePosixPath(safe).parts
    current_fd = os.dup(root_fd)
    try:
        prefix: list[str] = []
        for component in parts[:-1]:
            prefix.append(component)
            relative = "/".join(prefix)
            info = _entry_info(
                current_fd, component, f"publication directory {relative}"
            )
            expected = inventory.get(relative) if inventory is not None else None
            if expected is not None and (
                expected.get("kind") != "directory"
                or expected.get("identity") != list(_directory_custody_identity(info))
            ):
                raise PinnedGeneralmPiqdError(
                    f"publication directory custody mismatch: {relative}"
                )
            child_fd = _assert_named_directory(
                current_fd,
                component,
                _directory_identity(info),
                f"publication directory {relative}",
            )
            if expected is not None and expected.get("identity") != list(
                _directory_custody_identity(os.fstat(child_fd))
            ):
                os.close(child_fd)
                raise PinnedGeneralmPiqdError(
                    f"publication directory custody mismatch: {relative}"
                )
            os.close(current_fd)
            current_fd = child_fd
        expected_file = inventory.get(safe) if inventory is not None else None
        expected_identity: tuple[int, int, int, int, int] | None = None
        if expected_file is not None:
            if expected_file.get("kind") != "file":
                raise PinnedGeneralmPiqdError(
                    f"publication file custody mismatch: {safe}"
                )
            expected_identity = tuple(expected_file["identity"])  # type: ignore[arg-type]
        payload, identity = _read_regular_at(
            current_fd,
            parts[-1],
            where=f"publication artifact {safe}",
            max_bytes=max_bytes,
            expected_identity=expected_identity,
        )
        if expected_file is not None and (
            expected_file.get("bytes") != len(payload)
            or expected_file.get("sha256") != _sha(payload)
            or expected_file.get("identity") != list(identity)
        ):
            raise PinnedGeneralmPiqdError(
                f"publication artifact custody mismatch: {safe}"
            )
        return payload
    finally:
        os.close(current_fd)


def _remove_tree_contents_fd(directory_fd: int) -> None:
    for name in sorted(os.listdir(directory_fd)):
        if not name or name in {".", ".."} or "/" in name or "\\" in name:
            raise PinnedGeneralmPiqdError("unsafe staging entry blocks cleanup")
        before = _entry_info(directory_fd, name, "staging cleanup entry")
        if stat.S_ISDIR(before.st_mode):
            child_fd = _assert_named_directory(
                directory_fd,
                name,
                _directory_identity(before),
                "staging cleanup directory",
            )
            try:
                _remove_tree_contents_fd(child_fd)
            finally:
                os.close(child_fd)
            after = _entry_info(directory_fd, name, "staging cleanup directory")
            if _directory_identity(after) != _directory_identity(before):
                raise PinnedGeneralmPiqdError(
                    "staging directory was rebound during cleanup"
                )
            os.rmdir(name, dir_fd=directory_fd)
        elif stat.S_ISREG(before.st_mode) and before.st_nlink == 1:
            flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
            try:
                fd = os.open(name, flags, dir_fd=directory_fd)
            except OSError as exc:
                raise PinnedGeneralmPiqdError(
                    "cannot authenticate staging cleanup file"
                ) from exc
            try:
                opened = os.fstat(fd)
                after = _entry_info(directory_fd, name, "staging cleanup file")
                if _file_identity(opened) != _file_identity(before) or _file_identity(
                    after
                ) != _file_identity(before):
                    raise PinnedGeneralmPiqdError(
                        "staging file was rebound during cleanup"
                    )
            finally:
                os.close(fd)
            os.unlink(name, dir_fd=directory_fd)
        else:
            raise PinnedGeneralmPiqdError(
                "linked/non-regular staging entry blocks safe cleanup"
            )


def _cleanup_staging(staging: StagingDirectory, installed_name: str) -> None:
    if staging.fd < 0 or staging.parent_fd < 0:
        return
    if _directory_identity(os.fstat(staging.parent_fd)) != staging.parent_identity:
        raise PinnedGeneralmPiqdError("held output parent changed during cleanup")
    named_fd = _assert_named_directory(
        staging.parent_fd, installed_name, staging.identity, "staging cleanup root"
    )
    try:
        if _directory_identity(os.fstat(staging.fd)) != staging.identity:
            raise PinnedGeneralmPiqdError("held staging root changed during cleanup")
        _remove_tree_contents_fd(named_fd)
    finally:
        os.close(named_fd)
    current = _entry_info(staging.parent_fd, installed_name, "staging cleanup root")
    if _directory_identity(current) != staging.identity:
        raise PinnedGeneralmPiqdError("staging root was rebound during cleanup")
    os.rmdir(installed_name, dir_fd=staging.parent_fd)


def _classification(engine: Mapping[str, Any]) -> tuple[str, str]:
    if type(engine) is not dict:
        raise PinnedGeneralmPiqdError("PIQD engine result must be an exact dict")
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    if raw == "SAT" and effective == "SAT_SEMANTICALLY_REPLAYED":
        return "sat", "SAT_FINITE_INTERFACE_COUNTERMODEL_REPLAYED"
    if raw == "UNSAT" and effective == "UNSAT_DISCOVERY_ONLY":
        return "unsat", "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
    if raw == "UNKNOWN" and effective == "INCONCLUSIVE_UNKNOWN":
        return "unknown", "UNKNOWN_INCONCLUSIVE"
    if raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS":
        return "inconclusive", "TRANSPORT_LOSS_INCONCLUSIVE"
    raise PinnedGeneralmPiqdError("unsupported PIQD status/classification pair")


def _source_packet(
    bundle: SourceBundle, archive_names: Mapping[str, str]
) -> dict[str, Any]:
    certificate_source = _parse_json(
        bundle.by_role("certificate_census").payload, "certificate census"
    )["source"]
    return {
        "schema": SOURCE_PACKET_SCHEMA,
        "sources": [
            {
                "role": source.role,
                "path": source.locator,
                "archive_path": archive_names[source.role],
                "bytes": len(source.payload),
                "sha256": source.sha256,
                "identity": list(source.identity),
                "component_identities": [
                    list(identity) for identity in source.component_identities
                ],
            }
            for source in sorted(
                bundle.sources, key=lambda item: (item.role, item.locator)
            )
        ],
        "upstream_edges": {
            "required_to_incidence": True,
            "required_to_certificate_census": True,
            "incidence_to_bank": True,
            "certificate_census_to_incidence": True,
            "certificate_census_to_split_probe": True,
        },
        "provenance_limits": {
            "certificate_dir": bundle.required_facts["source"].get("certificate_dir"),
            "rvol_input_dir": certificate_source.get("rvol_input_dir"),
            "meaning": "recorded upstream locators, not transitively captured entitlement",
        },
    }


def run_piqd(
    bundle: SourceBundle,
    shadow_tool: ShadowTool,
    *,
    transport: neutral.PiqdTransport,
    output_directory: Path,
    timeout_ms: int,
    workers: int = 1,
) -> dict[str, Any]:
    """Run exactly 45 sequential fresh-session queries and publish once."""

    if type(bundle) is not SourceBundle:
        raise PinnedGeneralmPiqdError("bundle must be an exact SourceBundle")
    if type(workers) is not int or workers != 1:
        raise PinnedGeneralmPiqdError("workers must be exactly 1")
    prepared_queries = prepare_queries(bundle, shadow_tool, timeout_ms=timeout_ms)
    staging = _reserve_staging(output_directory)
    keep = False
    try:
        source_fd = _create_private_directory(staging.fd, "sources")
        archive_names: dict[str, str] = {}
        try:
            for index, source in enumerate(
                sorted(bundle.sources, key=lambda item: (item.role, item.locator))
            ):
                name = f"{index:02d}-{source.role}-{Path(source.locator).name}.bin"
                _write_immutable(source_fd, name, source.payload)
                archive_names[source.role] = f"sources/{name}"
        finally:
            os.close(source_fd)
        source_packet = _source_packet(bundle, archive_names)
        source_packet_bytes = _canonical(source_packet) + b"\n"
        _write_immutable(staging.fd, "source-packet.json", source_packet_bytes)

        used_session_ids: set[str] = set()
        row_results: list[dict[str, Any]] = []
        for prepared in prepared_queries:
            dirname = f"query-{prepared.query_index:02d}"
            query_fd = _create_private_directory(staging.fd, dirname)
            try:
                _write_immutable(query_fd, "query-context.json", prepared.context_bytes)
                _write_immutable(
                    query_fd, "descriptor.json", prepared.query.descriptor_bytes
                )
                _write_immutable(
                    query_fd, "original.smt2", prepared.query.original_smt2
                )
                _write_immutable(query_fd, "journal.smt2", prepared.query.journal_smt2)
                engine = neutral.run_authenticated_single_solver_query(
                    prepared.query,
                    solver="z3",
                    descriptor_schema=DESCRIPTOR_SCHEMA,
                    solver_profile_schema=PROFILE_SCHEMA,
                    authenticated_journal_commands=prepared.query.journal_commands,
                    transport=transport,
                    semantic_verifier=verify_sat_model,
                    output_fd=query_fd,
                    used_session_ids=used_session_ids,
                )
                status, classification = _classification(engine)
                result: dict[str, Any] = {
                    "query_index": prepared.query_index,
                    "row_index": prepared.row_index,
                    "cardinality_floor": prepared.cardinality_floor,
                    "relaxed_id": prepared.context["relaxed_id"],
                    "sstar": prepared.context["sstar"],
                    "certificate_leaf_count": len(prepared.context["leaf_records"]),
                    "status": status,
                    "classification": classification,
                    "query_context_sha256": _sha(prepared.context_bytes),
                    "descriptor_sha256": _sha(prepared.query.descriptor_bytes),
                    "journal_sha256": _sha(prepared.query.journal_smt2),
                    "engine": engine,
                }
                if status == "sat":
                    result["countermodel_masks"] = engine["semantic_replay"][
                        "evidence"
                    ]["assignment"]
                    result["countermodel_members"] = engine["semantic_replay"][
                        "evidence"
                    ]["members"]
                _write_immutable(
                    query_fd, "query-result.json", _canonical(result) + b"\n"
                )
            except neutral.SmtSourceAdapterError as exc:
                raise PinnedGeneralmPiqdError(
                    f"PIQD query {prepared.query_index} failed closed"
                ) from exc
            finally:
                os.close(query_fd)
            row_results.append(result)

        floors: list[dict[str, Any]] = []
        for floor in CARDINALITY_FLOORS:
            rows = [
                result for result in row_results if result["cardinality_floor"] == floor
            ]
            floors.append(
                {
                    "cardinality_floor": floor,
                    "summary": {
                        status: sum(row["status"] == status for row in rows)
                        for status in ("sat", "unsat", "unknown", "inconclusive")
                    },
                    "rows": rows,
                }
            )
        report = {
            "schema": REPORT_SCHEMA,
            "execution": {
                "backend": "piqd",
                "solver": "z3",
                "query_count": EXPECTED_QUERY_COUNT,
                "fresh_session_per_query": True,
                "solve_count_per_session": 1,
                "workers": 1,
                "timeout_ms": timeout_ms,
                "local_fallback": False,
            },
            "status_semantics": {
                "sat": "exact finite-interface countermodel independently replayed",
                "unsat": "Z3 discovery diagnostic only; not proof checked",
                "unknown": "solver-inconclusive",
                "inconclusive": "transport or semantic replay did not establish a result",
            },
            "source_packet_sha256": _sha(source_packet_bytes),
            "floors": floors,
        }
        report_bytes = _canonical(report) + b"\n"
        _write_immutable(staging.fd, "report.json", report_bytes)
        manifest = {
            "schema": MANIFEST_SCHEMA,
            "report": {
                "path": "report.json",
                "bytes": len(report_bytes),
                "sha256": _sha(report_bytes),
            },
            "source_packet": {
                "path": "source-packet.json",
                "bytes": len(source_packet_bytes),
                "sha256": _sha(source_packet_bytes),
            },
            "query_count": len(row_results),
            "session_count": len(used_session_ids),
            "sequential": True,
            "create_once": True,
            "claims": {
                "unsat_proof_checked": False,
                "geometric_realizability": False,
                "theorem_producer": False,
            },
        }
        _write_immutable(staging.fd, "run-manifest.json", _canonical(manifest) + b"\n")
        check_bundle_current(bundle)
        inventory = _tree_inventory_fd(staging.fd)
        inventory_record = {
            "schema": INVENTORY_SCHEMA,
            "root_identity": list(staging.identity),
            "entries": inventory,
            "entries_sha256": _sha(_canonical(inventory)),
        }
        _write_immutable(
            staging.fd, "custody-inventory.json", _canonical(inventory_record) + b"\n"
        )
        os.fsync(staging.fd)
        _validate_publication_fd(
            staging.fd,
            expected_root_identity=staging.identity,
            repo_root=bundle.repo_root,
            caller_script_path=bundle.by_role("caller").path,
            shadow_tool_path=bundle.by_role("shadow_tool").path,
            shadow_tool=shadow_tool,
        )
        _assert_output_parent_current(staging)
        named_fd = _assert_named_directory(
            staging.parent_fd,
            staging.staging_name,
            staging.identity,
            "private output staging",
        )
        os.close(named_fd)
        _rename_noreplace(staging.parent_fd, staging.staging_name, staging.final_name)
        os.fsync(staging.parent_fd)
        final_fd = _assert_named_directory(
            staging.parent_fd,
            staging.final_name,
            staging.identity,
            "published output",
        )
        try:
            _validate_publication_fd(
                final_fd,
                expected_root_identity=staging.identity,
                repo_root=bundle.repo_root,
                caller_script_path=bundle.by_role("caller").path,
                shadow_tool_path=bundle.by_role("shadow_tool").path,
                shadow_tool=shadow_tool,
            )
        finally:
            os.close(final_fd)
        _assert_output_parent_current(staging)
        keep = True
        return report
    finally:
        active_exception = sys.exc_info()[0] is not None
        cleanup_error: BaseException | None = None
        if not keep and staging.fd >= 0 and staging.parent_fd >= 0:
            installed_name = staging.final_name
            try:
                os.stat(
                    installed_name,
                    dir_fd=staging.parent_fd,
                    follow_symlinks=False,
                )
            except FileNotFoundError:
                installed_name = staging.staging_name
            try:
                _cleanup_staging(staging, installed_name)
            except BaseException as exc:  # noqa: BLE001 - never mask active BaseException
                cleanup_error = exc
        if staging.fd >= 0:
            os.close(staging.fd)
            staging.fd = -1
        if staging.parent_fd >= 0:
            os.close(staging.parent_fd)
            staging.parent_fd = -1
        if cleanup_error is not None and not active_exception:
            raise cleanup_error


def _validate_artifact_record(
    root_fd: int,
    directory: str,
    inventory: Mapping[str, dict[str, object]],
    record: object,
) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise PinnedGeneralmPiqdError("engine artifact record is malformed")
    name = record["path"]
    if type(name) is not str or PurePosixPath(name).name != name:
        raise PinnedGeneralmPiqdError("engine artifact path is unsafe")
    payload = _read_artifact_at(root_fd, f"{directory}/{name}", inventory=inventory)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise PinnedGeneralmPiqdError("engine artifact hash/size mismatch")
    return payload


def _validate_publication_fd(
    root_fd: int,
    *,
    expected_root_identity: tuple[int, int],
    repo_root: Path,
    caller_script_path: Path,
    shadow_tool_path: Path,
    shadow_tool: ShadowTool,
) -> dict[str, Any]:
    root_info = os.fstat(root_fd)
    if (
        not stat.S_ISDIR(root_info.st_mode)
        or _directory_identity(root_info) != expected_root_identity
    ):
        raise PinnedGeneralmPiqdError("publication root custody mismatch")
    custody = _parse_json(
        _read_artifact_at(root_fd, "custody-inventory.json", inventory=None),
        "custody inventory",
    )
    if (
        set(custody)
        != {
            "schema",
            "root_identity",
            "entries",
            "entries_sha256",
        }
        or custody.get("schema") != INVENTORY_SCHEMA
        or custody.get("root_identity") != list(expected_root_identity)
    ):
        raise PinnedGeneralmPiqdError("custody inventory schema mismatch")
    inventory = _tree_inventory_fd(root_fd)
    if custody.get("entries") != inventory or custody.get("entries_sha256") != _sha(
        _canonical(inventory)
    ):
        raise PinnedGeneralmPiqdError("custody inventory mismatch")
    inventory_by_path = _inventory_index(inventory)
    manifest = _parse_json(
        _read_artifact_at(root_fd, "run-manifest.json", inventory=inventory_by_path),
        "run manifest",
    )
    if (
        manifest.get("schema") != MANIFEST_SCHEMA
        or manifest.get("query_count") != EXPECTED_QUERY_COUNT
    ):
        raise PinnedGeneralmPiqdError("run manifest mismatch")
    source_packet_payload = _read_artifact_at(
        root_fd, "source-packet.json", inventory=inventory_by_path
    )
    source_packet = _parse_json(source_packet_payload, "source packet")
    if source_packet.get("schema") != SOURCE_PACKET_SCHEMA:
        raise PinnedGeneralmPiqdError("source packet schema mismatch")
    if manifest.get("source_packet") != {
        "path": "source-packet.json",
        "bytes": len(source_packet_payload),
        "sha256": _sha(source_packet_payload),
    }:
        raise PinnedGeneralmPiqdError("manifest source-packet binding mismatch")
    source_records = source_packet.get("sources")
    if type(source_records) is not list:
        raise PinnedGeneralmPiqdError("source packet sources are malformed")
    locators = {
        record["role"]: record["path"]
        for record in source_records
        if type(record) is dict
    }
    required_path = repo_root / _safe_locator(
        locators.get("required_facts"), "required source"
    )
    incidence_path = repo_root / _safe_locator(
        locators.get("incidence"), "incidence source"
    )
    bundle = capture_source_bundle(
        repo_root=repo_root,
        required_facts_path=required_path,
        incidence_path=incidence_path,
        caller_script_path=caller_script_path,
        shadow_tool_path=shadow_tool_path,
    )
    current_by_role = {source.role: source for source in bundle.sources}
    archive_names: dict[str, str] = {}
    for record in source_records:
        if type(record) is not dict or set(record) != {
            "role",
            "path",
            "archive_path",
            "bytes",
            "sha256",
            "identity",
            "component_identities",
        }:
            raise PinnedGeneralmPiqdError("source packet entry is malformed")
        current = current_by_role.get(record["role"])
        if (
            current is None
            or current.locator != record["path"]
            or current.sha256 != record["sha256"]
            or list(current.identity) != record["identity"]
            or [list(identity) for identity in current.component_identities]
            != record["component_identities"]
        ):
            raise PinnedGeneralmPiqdError("current source entitlement mismatch")
        archived = _read_artifact_at(
            root_fd,
            _safe_locator(record["archive_path"], "archive path"),
            inventory=inventory_by_path,
        )
        if archived != current.payload or record["bytes"] != len(archived):
            raise PinnedGeneralmPiqdError("archived source mismatch")
        archive_names[current.role] = record["archive_path"]
    if source_packet != _source_packet(bundle, archive_names):
        raise PinnedGeneralmPiqdError("source packet reconstruction mismatch")

    report_payload = _read_artifact_at(
        root_fd, "report.json", inventory=inventory_by_path
    )
    report = _parse_json(report_payload, "report")
    if report.get("schema") != REPORT_SCHEMA or manifest.get("report") != {
        "path": "report.json",
        "bytes": len(report_payload),
        "sha256": _sha(report_payload),
    }:
        raise PinnedGeneralmPiqdError("report binding mismatch")
    timeout_ms = report.get("execution", {}).get("timeout_ms")
    prepared_queries = prepare_queries(bundle, shadow_tool, timeout_ms=timeout_ms)
    report_rows = [
        row for floor in report.get("floors", []) for row in floor.get("rows", [])
    ]
    if len(report_rows) != EXPECTED_QUERY_COUNT:
        raise PinnedGeneralmPiqdError("report does not contain 45 query rows")
    session_ids: set[str] = set()
    rebuilt_rows: list[dict[str, Any]] = []
    for prepared, reported in zip(prepared_queries, report_rows, strict=True):
        query_dir = f"query-{prepared.query_index:02d}"
        if (
            _read_artifact_at(
                root_fd,
                f"{query_dir}/query-context.json",
                inventory=inventory_by_path,
            )
            != prepared.context_bytes
        ):
            raise PinnedGeneralmPiqdError("query context reconstruction mismatch")
        if (
            _read_artifact_at(
                root_fd,
                f"{query_dir}/descriptor.json",
                inventory=inventory_by_path,
            )
            != prepared.query.descriptor_bytes
        ):
            raise PinnedGeneralmPiqdError("query descriptor reconstruction mismatch")
        if (
            _read_artifact_at(
                root_fd,
                f"{query_dir}/original.smt2",
                inventory=inventory_by_path,
            )
            != prepared.query.original_smt2
        ):
            raise PinnedGeneralmPiqdError("query original SMT mismatch")
        if (
            _read_artifact_at(
                root_fd,
                f"{query_dir}/journal.smt2",
                inventory=inventory_by_path,
            )
            != prepared.query.journal_smt2
        ):
            raise PinnedGeneralmPiqdError("query journal reconstruction mismatch")
        stored = _parse_json(
            _read_artifact_at(
                root_fd,
                f"{query_dir}/query-result.json",
                inventory=inventory_by_path,
            ),
            "query result",
        )
        if stored != reported:
            raise PinnedGeneralmPiqdError("query result/report mismatch")
        expected_metadata = {
            "query_index": prepared.query_index,
            "row_index": prepared.row_index,
            "cardinality_floor": prepared.cardinality_floor,
            "relaxed_id": prepared.context["relaxed_id"],
            "sstar": prepared.context["sstar"],
            "certificate_leaf_count": len(prepared.context["leaf_records"]),
            "query_context_sha256": _sha(prepared.context_bytes),
            "descriptor_sha256": _sha(prepared.query.descriptor_bytes),
            "journal_sha256": _sha(prepared.query.journal_smt2),
        }
        if any(stored.get(key) != value for key, value in expected_metadata.items()):
            raise PinnedGeneralmPiqdError("query result metadata mismatch")
        engine = stored.get("engine")
        if type(engine) is not dict or engine.get("solver") != "z3":
            raise PinnedGeneralmPiqdError("query engine is malformed")
        session_id = engine.get("session_id")
        if type(session_id) is not str or session_id in session_ids:
            raise PinnedGeneralmPiqdError("query sessions are not fresh and unique")
        session_ids.add(session_id)
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise PinnedGeneralmPiqdError("engine artifacts are malformed")
        artifact_payloads = {
            key: _validate_artifact_record(
                root_fd, query_dir, inventory_by_path, record
            )
            for key, record in artifacts.items()
        }
        if artifact_payloads.get("smt2") != prepared.query.journal_smt2:
            raise PinnedGeneralmPiqdError("PIQD exported SMT differs from journal")
        session = _parse_json(artifact_payloads.get("session", b""), "session artifact")
        closed = _parse_json(
            artifact_payloads.get("closed_session", b""), "closed-session artifact"
        )
        receipts_before = _parse_json(
            artifact_payloads.get("receipts_before", b""),
            "receipts-before artifact",
        )
        receipts = _parse_json(
            artifact_payloads.get("receipts", b""), "receipts artifact"
        )
        if (
            session.get("id") != session_id
            or session.get("state") != "live"
            or session.get("solver_name") != "z3"
            or session.get("solves") != 0
            or closed.get("id") != session_id
            or closed.get("state") != "closed"
            or closed.get("solver_name") != "z3"
            or receipts_before.get("session_id") != session_id
            or receipts_before.get("count") != 0
            or receipts_before.get("receipts") != []
            or receipts.get("session_id") != session_id
        ):
            raise PinnedGeneralmPiqdError("PIQD session lifecycle mismatch")
        status, classification = _classification(engine)
        if (
            stored.get("status") != status
            or stored.get("classification") != classification
        ):
            raise PinnedGeneralmPiqdError("query classification mismatch")
        solve: dict[str, Any] | None = None
        receipt: dict[str, Any] | None = None
        if engine.get("raw_status") is None:
            if (
                receipts.get("count") != 0
                or receipts.get("receipts") != []
                or closed.get("solves") != 0
                or closed.get("last_status") is not None
            ):
                raise PinnedGeneralmPiqdError(
                    "transport-loss query unexpectedly has a durable result"
                )
            if engine.get("result_sha256") is not None:
                raise PinnedGeneralmPiqdError(
                    "transport-loss result digest is non-null"
                )
        else:
            solve_key = "reconciled_solve" if engine.get("response_lost") else "solve"
            solve = _parse_json(artifact_payloads.get(solve_key, b""), "solve artifact")
            receipt_values = receipts.get("receipts")
            if (
                receipts.get("count") != 1
                or type(receipt_values) is not list
                or len(receipt_values) != 1
                or type(receipt_values[0]) is not dict
            ):
                raise PinnedGeneralmPiqdError("completed query receipt is malformed")
            receipt = receipt_values[0]
            digest = neutral.piqd_result_digest(solve)
            if (
                solve.get("status") != engine.get("raw_status")
                or solve.get("solve_index") != 1
                or receipt.get("solve_index") != 1
                or receipt.get("base_commands") != len(prepared.query.journal_commands)
                or receipt.get("base_bytes") != len(prepared.query.journal_smt2)
                or receipt.get("base_sha256") != _sha(prepared.query.journal_smt2)
                or receipt.get("assumptions") != []
                or receipt.get("timeout_ms") != timeout_ms
                or receipt.get("include_model") is not True
                or receipt.get("get_values") != list(prepared.query.get_values)
                or receipt.get("result_sha256") != digest
                or solve.get("result_sha256") != digest
                or engine.get("result_sha256") != digest
                or closed.get("solves") != 1
                or closed.get("last_status") != solve.get("status")
            ):
                raise PinnedGeneralmPiqdError("PIQD solve/receipt custody mismatch")
        if status == "sat":
            if solve is None:
                raise PinnedGeneralmPiqdError("SAT query lacks a solve artifact")
            verification = verify_sat_model(
                prepared.query, "z3", solve.get("model"), solve.get("values")
            )
            semantic = engine.get("semantic_replay")
            if (
                type(semantic) is not dict
                or semantic.get("accepted") is not True
                or semantic.get("evidence") != verification.evidence
            ):
                raise PinnedGeneralmPiqdError("SAT semantic replay mismatch")
            if (
                "semantic" not in artifact_payloads
                or _parse_json(artifact_payloads["semantic"], "semantic artifact")
                != semantic
                or stored.get("countermodel_masks")
                != verification.evidence["assignment"]
                or stored.get("countermodel_members")
                != verification.evidence["members"]
            ):
                raise PinnedGeneralmPiqdError("SAT semantic artifact mismatch")
        elif status == "unsat":
            if (
                solve is None
                or solve.get("core") != []
                or solve.get("terminal_unsat") is not True
                or engine.get("unsat_assumptions", {}).get("terminal_unsat") is not True
            ):
                raise PinnedGeneralmPiqdError("UNSAT diagnostic provenance mismatch")
        elif status == "unknown" and (
            solve is None
            or set(solve)
            != {
                "status",
                "solve_ms",
                "solve_index",
                "result_sha256",
                "effective_deadline_ms",
            }
        ):
            raise PinnedGeneralmPiqdError("UNKNOWN transcript is malformed")
        rebuilt_rows.append(stored)
    if (
        len(session_ids) != EXPECTED_QUERY_COUNT
        or manifest.get("session_count") != EXPECTED_QUERY_COUNT
    ):
        raise PinnedGeneralmPiqdError("publication does not contain 45 fresh sessions")
    return report


def validate_publication(
    output_directory: Path,
    *,
    repo_root: Path,
    caller_script_path: Path,
    shadow_tool_path: Path,
    shadow_tool: ShadowTool,
) -> dict[str, Any]:
    """Validate one publication offline, without daemon or solver contact."""

    root = _native_absolute_path(output_directory, "output_directory")
    repo = _native_absolute_path(repo_root, "repo_root")
    caller = _native_absolute_path(caller_script_path, "caller_script_path")
    shadow = _native_absolute_path(shadow_tool_path, "shadow_tool_path")
    root_fd, _ = _open_directory_componentwise(root, "publication root")
    try:
        root_identity = _directory_identity(os.fstat(root_fd))
        return _validate_publication_fd(
            root_fd,
            expected_root_identity=root_identity,
            repo_root=repo,
            caller_script_path=caller,
            shadow_tool_path=shadow,
            shadow_tool=shadow_tool,
        )
    finally:
        os.close(root_fd)


def expected_profile(report: Mapping[str, Any]) -> bool:
    expected = {
        2: {"sat": 15, "unsat": 0, "unknown": 0, "inconclusive": 0},
        3: {"sat": 15, "unsat": 0, "unknown": 0, "inconclusive": 0},
        4: {"sat": 0, "unsat": 15, "unknown": 0, "inconclusive": 0},
    }
    actual = {
        floor["cardinality_floor"]: floor["summary"]
        for floor in report.get("floors", [])
    }
    return actual == expected


__all__ = [
    "CARDINALITY_FLOORS",
    "DESCRIPTOR_SCHEMA",
    "EXPECTED_QUERY_COUNT",
    "LABELS",
    "NONFIXED_CENTERS",
    "PROFILE_SCHEMA",
    "PinnedGeneralmPiqdError",
    "PreparedQuery",
    "SourceBundle",
    "capture_source_bundle",
    "check_bundle_current",
    "expected_profile",
    "parse_readback",
    "prepare_queries",
    "replay_assignment",
    "run_piqd",
    "submask_domain",
    "validate_publication",
    "verify_sat_model",
]
