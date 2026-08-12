# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated finite positive-membership source-order bank.

Each build selects one append-only proof-backed binding by registry index.  It
authenticates the Lean source bytes and binding, replays the finite 48-order
certificate, and binds the deterministic positive-membership CNF delta to the
exact static-convex parent formula.

The result is finite infrastructure only.  The pattern-CNF bridge and its
static-parent terminal consumer are complete, but the bank does not itself
register a terminal promotion, prove UNSAT, cover every placement cell, or
close a live Lean theorem.
"""

from __future__ import annotations

import copy
import hashlib
import json
import os
import stat
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any, BinaryIO

from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import (
    compile_positive_membership_bank,
    normalize_memberships,
)
from .exact12_v14_ordered_coverage import (
    PROOF_BACKED_MEMBERSHIP_BINDINGS,
    detect_ordered_coverage,
    replay_ordered_coverage,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_positive_membership_source_order_bank.v2"
PROMOTION_STATUS = "LEAN_PATTERN_CNF_BRIDGE_COMPLETE_AWAITING_STATIC_PARENT_VALUATION"
PATTERN_BRIDGE_SCHEMA = "p97_exact12_positive_membership_lean_bridge.v1"
SEMANTIC_STATUS = "FINITE_POSITIVE_MEMBERSHIP_SOURCE_ORDER"
COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
ORDER_COUNT = 48

# Cell-keyed production selection is intentionally separate from the
# append-only proof registry.  A runner must never infer semantics from a raw
# tuple position.  Cell 1 is the current block-spanning production target.
PRODUCTION_BINDING_INDEX_BY_CELL = {1: 1}


class Exact12PositiveMembershipSourceOrderBankError(ValueError):
    """An authenticated membership bank input or compiled delta is malformed."""


def production_binding_index_for_cell(cell_index: int) -> int:
    """Return the explicitly approved membership binding for one schedule cell."""

    if type(cell_index) is not int:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership cell index must be an integer"
        )
    try:
        return PRODUCTION_BINDING_INDEX_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12PositiveMembershipSourceOrderBankError(
            f"no production positive-membership binding for cell {cell_index}"
        ) from exc


_BANK_CLAIMS = {
    "terminal_promotion": False,
    "terminal_unsat": False,
    "universal_lift": False,
    "live_theorem_closure": False,
    "runner_integrated": False,
}


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _open_repo_source(repo_root: Path, relative: str) -> BinaryIO:
    relative_path = Path(relative)
    if (
        relative_path.is_absolute()
        or not relative_path.parts
        or any(part in {".", ".."} for part in relative_path.parts)
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            f"authenticated source escapes repository: {relative}"
        )
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if (
        nofollow == 0
        or directory == 0
        or nonblock == 0
        or os.open not in os.supports_dir_fd
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "platform lacks required descriptor-relative no-follow operations"
        )
    directory_flags = os.O_RDONLY | nofollow | directory | getattr(os, "O_CLOEXEC", 0)
    source_flags = os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0) | nonblock
    descriptor: int | None = None
    source_descriptor: int | None = None
    try:
        descriptor = os.open(repo_root.resolve(), directory_flags)
        for component in relative_path.parts[:-1]:
            next_descriptor = os.open(component, directory_flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        source_descriptor = os.open(
            relative_path.parts[-1], source_flags, dir_fd=descriptor
        )
    except OSError as exc:
        raise Exact12PositiveMembershipSourceOrderBankError(
            f"missing regular authenticated source: {relative}"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass
    try:
        assert source_descriptor is not None
        if not stat.S_ISREG(os.fstat(source_descriptor).st_mode):
            raise Exact12PositiveMembershipSourceOrderBankError(
                f"missing regular authenticated source: {relative}"
            )
        handle = os.fdopen(source_descriptor, "rb")
        source_descriptor = None
        return handle
    finally:
        if source_descriptor is not None:
            try:
                os.close(source_descriptor)
            except OSError:
                pass


def _source_record(repo_root: Path, relative: str) -> dict[str, Any]:
    digest = hashlib.sha256()
    byte_count = 0
    with _open_repo_source(repo_root, relative) as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            byte_count += len(chunk)
            digest.update(chunk)
    return {"path": relative, "bytes": byte_count, "sha256": digest.hexdigest()}


def _binding_at(
    binding_index: int,
) -> tuple[dict[str, list[int]], dict[str, Any], list[dict[str, Any]]]:
    if type(binding_index) is not int or not 0 <= binding_index < len(
        PROOF_BACKED_MEMBERSHIP_BINDINGS
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership source bank binding index is out of range"
        )
    cube, binding, choices = PROOF_BACKED_MEMBERSHIP_BINDINGS[binding_index]
    if not isinstance(cube, Mapping) or not isinstance(binding, Mapping):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership binding registry entry is malformed"
        )
    if binding.get("promotion_status") != PROMOTION_STATUS:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership binding promotion status changed"
        )
    bridge = binding.get("terminal_pattern_bridge")
    if not isinstance(bridge, Mapping):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership binding pattern bridge is missing"
        )
    if (
        bridge.get("schema") != PATTERN_BRIDGE_SCHEMA
        or not isinstance(bridge.get("implication_satisfaction_declaration"), str)
        or not isinstance(bridge.get("blocking_false_declaration"), str)
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership binding pattern bridge is malformed"
        )
    if binding.get("choices") != choices:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership binding choices disagree with registry choices"
        )
    return copy.deepcopy(dict(cube)), copy.deepcopy(dict(binding)), copy.deepcopy(list(choices))


def _authenticated_lean_sources(
    repo_root: Path, binding: Mapping[str, Any]
) -> list[dict[str, Any]]:
    paths = []
    for prefix in ("", "coverage_"):
        path = binding.get(f"{prefix}source_path")
        expected = {
            "path": path,
            "bytes": binding.get(f"{prefix}source_bytes"),
            "sha256": binding.get(f"{prefix}source_sha256"),
        }
        if not isinstance(path, str) or expected["bytes"] is None:
            raise Exact12PositiveMembershipSourceOrderBankError(
                "membership binding Lean source manifest is malformed"
            )
        if expected != _source_record(repo_root, path):
            raise Exact12PositiveMembershipSourceOrderBankError(
                "membership binding Lean source bytes or hash drifted"
            )
        if path not in paths:
            paths.append(path)
    bridge = binding["terminal_pattern_bridge"]
    for prefix in ("", "generic_"):
        path = bridge.get(f"{prefix}source_path")
        expected = {
            "path": path,
            "bytes": bridge.get(f"{prefix}source_bytes"),
            "sha256": bridge.get(f"{prefix}source_sha256"),
        }
        if not isinstance(path, str) or expected["bytes"] is None:
            raise Exact12PositiveMembershipSourceOrderBankError(
                "membership pattern bridge Lean source manifest is malformed"
            )
        if expected != _source_record(repo_root, path):
            raise Exact12PositiveMembershipSourceOrderBankError(
                "membership pattern bridge Lean source bytes or hash drifted"
            )
        if path not in paths:
            paths.append(path)
    return [_source_record(repo_root, path) for path in sorted(paths)]


def _certificate_and_binding(
    cube: Mapping[str, Sequence[int]],
    binding: Mapping[str, Any],
    choices: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    certificate = detect_ordered_coverage(cube)
    if certificate is None:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership cube lacks complete 48-order coverage"
        )
    try:
        replayed = replay_ordered_coverage(certificate)
    except ValueError as exc:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership 48-order certificate failed exact replay"
        ) from exc
    expected_key = normalize_memberships(12, choices)
    if replayed != expected_key:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership choices disagree with replayed 48-order certificate"
        )
    if certificate.get("selected_memberships") != [
        {"center": center, "required": list(points)}
        for center, points in expected_key
    ]:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "certificate selected memberships drifted"
        )
    if len(certificate.get("coverage", ())) != ORDER_COUNT:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership certificate does not replay all 48 source orders"
        )
    if certificate.get("generated_lean_nogood", {}).get("coverage_declaration") != (
        binding.get("coverage_declaration")
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership coverage declaration drifted"
        )
    preferred = binding.get("preferred_common_five_cores")
    if not isinstance(preferred, list) or not preferred:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership preferred common-five cores are missing"
        )
    replayed_cores: list[dict[str, int]] = []
    for item in certificate["coverage"]:
        core = item.get("core")
        if isinstance(core, dict) and core not in replayed_cores:
            replayed_cores.append(copy.deepcopy(core))
    if replayed_cores != preferred:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership preferred common-five cores failed replay"
        )
    return certificate


def _parent_record(
    instance: SourceFaithfulCoverInstance, layout: StaticConvexLayout
) -> dict[str, Any]:
    if not isinstance(layout, StaticConvexLayout):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "static-convex parent layout is required"
        )
    dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    if (
        instance.cnf.n_variables != layout.final_n_variables
        or len(instance.cnf.clauses) != layout.final_n_clauses
        or dimacs_sha256 != layout.final_cnf_sha256
        or not getattr(instance, "_exact12_next_row_static_convex_layout", False)
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "instance does not match the static-convex parent formula"
        )
    if instance.pattern_variables:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "static-convex parent already contains membership variables"
        )
    return {
        "schema": layout.manifest()["schema"],
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.cnf.clauses),
        "dimacs_sha256": dimacs_sha256,
        "layout_manifest_sha256": _sha256_json(layout.manifest()),
    }


def _compiled_payload(
    instance: SourceFaithfulCoverInstance,
    choices: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = compile_positive_membership_bank(working, (choices,))
    if tuple(working.cnf.clauses[: len(instance.cnf.clauses)]) != tuple(
        instance.cnf.clauses
    ):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership compiler changed the authenticated parent formula"
        )
    payload = compiled.as_dict()
    if payload["schema"] != MEMBERSHIP_CNF_SCHEMA:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership compiler schema drifted"
        )
    payload["compiled_sha256"] = _sha256_json(payload)
    return payload


def _build_body(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    binding_index: int,
) -> dict[str, Any]:
    cube, binding, choices = _binding_at(binding_index)
    certificate = _certificate_and_binding(cube, binding, choices)
    parent = _parent_record(instance, layout)
    compiler_source = _source_record(repo_root, COMPILER_SOURCE_PATH)
    claims = copy.deepcopy(_BANK_CLAIMS)
    claims["runner_integrated"] = binding_index in set(
        PRODUCTION_BINDING_INDEX_BY_CELL.values()
    )
    entry_body = {
        "index": binding_index,
        "cube": cube,
        "cube_sha256": _sha256_json(cube),
        "certificate": certificate,
        "certificate_sha256": certificate["certificate_sha256"],
        "order_count": ORDER_COUNT,
        "replayed_memberships": [
            {"center": center, "required": list(points)}
            for center, points in normalize_memberships(12, choices)
        ],
        "preferred_common_five_cores": copy.deepcopy(
            binding["preferred_common_five_cores"]
        ),
        "preferred_common_five_cores_sha256": _sha256_json(
            binding["preferred_common_five_cores"]
        ),
        "generated_lean_membership_binding": binding,
        "generated_lean_membership_binding_sha256": _sha256_json(binding),
        "choices": choices,
        "choices_sha256": _sha256_json(choices),
        "compiled": _compiled_payload(instance, choices),
    }
    entry = {
        **entry_body,
        "entry_sha256": _sha256_json(entry_body),
    }
    body = {
        "schema": BANK_SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_status": PROMOTION_STATUS,
        "claims": claims,
        "binding_index": binding_index,
        "parent_static_convex": parent,
        "compiler_source": compiler_source,
        "lean_source_manifest": _authenticated_lean_sources(repo_root, binding),
        "entries": [entry],
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def build_positive_membership_source_order_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    binding_index: int = 0,
) -> dict[str, Any]:
    """Build one selected entry after authenticating all live inputs."""

    return _build_body(repo_root.resolve(), instance, layout, binding_index)


def validate_positive_membership_source_order_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    bank: Mapping[str, Any],
    binding_index: int = 0,
) -> None:
    """Require exact equality with a fresh live-source authenticated rebuild."""

    if not isinstance(bank, Mapping):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership source bank is not a mapping"
        )
    fresh = build_positive_membership_source_order_bank(
        repo_root, instance, layout, binding_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership source bank differs from fresh authenticated rebuild"
        )


def attest_positive_membership_source_order_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    """Check the recorded Lean and compiler manifests against live bytes."""

    try:
        lean_manifest = bank["lean_source_manifest"]
        compiler_source = bank["compiler_source"]
    except (KeyError, TypeError) as exc:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership source bank source manifests are missing"
        ) from exc
    if not isinstance(lean_manifest, list) or not lean_manifest:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership Lean source manifest is malformed"
        )
    for record in lean_manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12PositiveMembershipSourceOrderBankError(
                "membership Lean source bytes or hash are not live-current"
            )
    if not isinstance(compiler_source, Mapping) or _source_record(
        repo_root.resolve(), compiler_source.get("path", "")
    ) != compiler_source:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "membership compiler source bytes or hash are not live-current"
        )


def install_positive_membership_source_order_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    binding_index: int = 0,
) -> dict[str, Any]:
    """Validate once, then append the complete authenticated compiler delta."""

    if getattr(instance, "_positive_membership_source_order_bank_installed", False):
        raise Exact12PositiveMembershipSourceOrderBankError(
            "positive-membership source bank is already installed"
        )
    bank = build_positive_membership_source_order_bank(
        repo_root, instance, layout, binding_index
    )
    validate_positive_membership_source_order_bank(
        repo_root, instance, layout, bank, binding_index
    )
    choices = bank["entries"][0]["choices"]
    compiled = compile_positive_membership_bank(instance, (choices,)).as_dict()
    expected = copy.deepcopy(bank["entries"][0]["compiled"])
    expected.pop("compiled_sha256")
    if compiled != expected:
        raise Exact12PositiveMembershipSourceOrderBankError(
            "installed membership compiler delta differs from authenticated bank"
        )
    instance._positive_membership_source_order_bank_installed = True
    return bank


__all__ = [
    "BANK_SCHEMA",
    "COMPILER_SOURCE_PATH",
    "PRODUCTION_BINDING_INDEX_BY_CELL",
    "PROMOTION_STATUS",
    "SEMANTIC_STATUS",
    "Exact12PositiveMembershipSourceOrderBankError",
    "_sha256_json",
    "_source_record",
    "attest_positive_membership_source_order_bank_live_sources",
    "build_positive_membership_source_order_bank",
    "install_positive_membership_source_order_bank",
    "production_binding_index_for_cell",
    "validate_positive_membership_source_order_bank",
]
