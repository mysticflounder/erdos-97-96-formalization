# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Hardened, audit-approved one-shot custody runner for common-only v7.

The runner authenticates the committed v6 encoder and frozen v6 launch runner,
but owns the v7 launch gates, terminal schemas, inventory validation, SAT
readback, UNSAT certificate custody, and failure receipt path.  The current
independent audit is APPROVED with exact bundle reproduction.  Dry-run still
creates nothing; a fresh launch additionally requires the single registered
run root before manifest-first custody, binary discovery, or process execution.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import stat
import subprocess
import time
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath

import census.p97_search.freshthird_firstnonhit_common_only_v7 as emitter

RUN_SCHEMA = "p97-freshthird-firstnonhit-common-only-v7/run/v1"
RECEIPT_SCHEMA = f"{RUN_SCHEMA}/terminal-receipt/v1"
PROCESS_SCHEMA = f"{RUN_SCHEMA}/process-receipt/v1"
BINARY_SCHEMA = f"{RUN_SCHEMA}/binaries/v1"
LANE_ID = "firstnonhit-common-only-v7"
CHECKPOINT_RELATIVE = ".codex/worktree-checkpoints/firstnonhit-common-only-v7.json"
RUN_PREFIX = f"scratch/runs/{LANE_ID}/"
PROPOSED_RUN_ID = "n17-one-shot-audit-approved"
PROPOSED_RUN_ROOT = f"{RUN_PREFIX}{PROPOSED_RUN_ID}"
PRODUCTION_N = 17
RUN_ID = re.compile(r"[a-z0-9][a-z0-9._-]{2,79}")
PROCESS_NAME = re.compile(r"[a-z0-9][a-z0-9_-]{2,79}")
TIMEOUT_CUSHION_SECONDS = 10

EXPECTED_COUNTS = {"variables": 93_342, "clauses": 638_735}
EXPECTED_CNF_SHA256 = "81765f225d38b8433ee7704e2f8e2c19566d78842f37eeff08ed055a2a1794cd"
EXPECTED_BUNDLE_SHA256 = {
    "cnf": EXPECTED_CNF_SHA256,
    "map": "74029a4502245f3fa80a6a71ad241d796f987fd073b084c4fb0016a9c1094ed3",
    "sources": "68171f149e887e6ec94358703ea2e1b83e66eee15d2f3d235ea6f8c01fbedfd7",
    "manifest": "00a014c819584481416949a21cf7668eb589006076736eb55e63964a26ae1cab",
}
INDEPENDENT_AUDIT = {
    "status": "APPROVED",
    "scope": (
        "source-current reduced finite payload, common-only units, native "
        "terminal custody, and full base-plus-reduced SAT readback"
    ),
    "counts_expected": EXPECTED_COUNTS,
    "cnf_sha256_expected": EXPECTED_CNF_SHA256,
    "counts_reproduced": EXPECTED_COUNTS,
    "cnf_sha256_reproduced": EXPECTED_CNF_SHA256,
    "bundle_hashes_expected": EXPECTED_BUNDLE_SHA256,
    "bundle_hashes_reproduced": EXPECTED_BUNDLE_SHA256,
    "payload_field_coverage_reproduced": 30,
    "reduced_payload_fields_reproduced": list(emitter.REDUCED_PAYLOAD_FIELDS),
    "reduced_constructor_splits_audited": True,
    "six_center_omission_audited": True,
    "source_map_audited": True,
    "no_unsound_clause_found": True,
    "launch_authorized": True,
}

AUTHENTICATED_SOURCE_SPECS = {
    "encoder_v6": (
        "census/p97_search/freshthird_firstnonhit_common_payload_v6.py",
        "317967139dfdca861a0e7c2eb28d572a98eab34ac44abe7818a42385613c7d76",
    ),
    "frozen_runner_v6": (
        "census/p97_search/freshthird_firstnonhit_common_payload_v6_run.py",
        "4a49ee7de5a8627168df9db65e145089719974d7b085a819af4054c3eb09d864",
    ),
    "encoder_v7": (
        "census/p97_search/freshthird_firstnonhit_common_only_v7.py",
        "822d10cf65afd7d0d3c8d23fb50cd063f37890226a64e4a39736a761b82aea42",
    ),
}


class RunnerError(RuntimeError):
    """Fail-closed custody, readback, or launch-gate error."""


@dataclass(frozen=True)
class ProcessResult:
    name: str
    command: tuple[str, ...]
    status: str
    returncode: int | None
    elapsed_ms: int
    stdout: bytes
    stderr: bytes


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _self_hashed(value: Mapping[str, object], field: str) -> dict[str, object]:
    result = dict(value)
    if field in result:
        raise RunnerError(f"self-hash field already present: {field}")
    result[field] = _sha256(_canonical_json(result))
    return result


def _validate_self_hash(value: Mapping[str, object], field: str) -> None:
    unsigned = dict(value)
    digest = unsigned.pop(field, None)
    if type(digest) is not str or digest != _sha256(_canonical_json(unsigned)):
        raise RunnerError(f"{field} mismatch")


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _reject_symlink_ancestors(path: Path) -> None:
    candidate = path
    while True:
        if candidate.is_symlink():
            raise RunnerError(f"path has a symlinked ancestor: {candidate}")
        if candidate == candidate.parent:
            return
        candidate = candidate.parent


def _read_regular(path: Path, description: str) -> bytes:
    _reject_symlink_ancestors(path)
    flags = os.O_RDONLY
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise RunnerError(f"cannot open {description}: {path}") from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise RunnerError(f"{description} must be a single-link regular file")
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, 1024 * 1024):
            chunks.append(chunk)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _strict_json(
    data: bytes, description: str, *, require_canonical: bool = True
) -> dict[str, object]:
    class DuplicateKey(ValueError):
        pass

    def pairs(rows: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in rows:
            if key in result:
                raise DuplicateKey(key)
            result[key] = value
        return result

    try:
        value = json.loads(
            data,
            object_pairs_hook=pairs,
            parse_constant=lambda token: (_ for _ in ()).throw(ValueError(token)),
        )
    except (UnicodeDecodeError, json.JSONDecodeError, DuplicateKey, ValueError) as exc:
        raise RunnerError(f"malformed {description}: {exc}") from exc
    if type(value) is not dict:
        raise RunnerError(f"{description} must be a JSON object")
    if require_canonical and _canonical_json(value) != data:
        raise RunnerError(f"{description} is not canonical JSON")
    return value


def _fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _write_new(path: Path, data: bytes) -> None:
    if path.exists() or path.is_symlink():
        raise RunnerError(f"refusing to overwrite run artifact: {path}")
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    descriptor = os.open(path, flags, 0o444)
    try:
        view = memoryview(data)
        while view:
            written = os.write(descriptor, view)
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    _fsync_directory(path.parent)


def _authenticated_source_rows() -> dict[str, dict[str, object]]:
    rows: dict[str, dict[str, object]] = {}
    for label, (relative, expected) in AUTHENTICATED_SOURCE_SPECS.items():
        data = _read_regular(_repo_root() / relative, f"authenticated {label} source")
        actual = _sha256(data)
        if actual != expected:
            raise RunnerError(f"{label} source hash mismatch: {actual} != {expected}")
        rows[label] = {"path": relative, "sha256": actual, "size": len(data)}
    return rows


def _read_checkpoint() -> dict[str, object]:
    value = _strict_json(
        _read_regular(_repo_root() / CHECKPOINT_RELATIVE, "lane checkpoint"),
        "lane checkpoint",
        require_canonical=False,
    )
    if value.get("schema") != "worktree-lane-checkpoint/v1":
        raise RunnerError("checkpoint schema mismatch")
    if value.get("lane_id") != LANE_ID:
        raise RunnerError("checkpoint lane mismatch")
    unsigned = dict(value)
    digest = unsigned.pop("manifest_sha256", None)
    canonical = json.dumps(
        unsigned, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode()
    if digest != _sha256(canonical):
        raise RunnerError("checkpoint manifest_sha256 mismatch")
    return value


def _normalize_run_root(run_root: Path) -> tuple[Path, str]:
    repository = _repo_root()
    absolute = run_root if run_root.is_absolute() else repository / run_root
    absolute = Path(os.path.abspath(absolute))
    try:
        relative = absolute.relative_to(repository).as_posix()
    except ValueError as exc:
        raise RunnerError("run root must be inside this repository") from exc
    parts = PurePosixPath(relative).parts
    if (
        len(parts) != 4
        or "/".join(parts[:3]) != RUN_PREFIX.rstrip("/")
        or RUN_ID.fullmatch(parts[3]) is None
    ):
        raise RunnerError(f"run root must be exactly {RUN_PREFIX}<stable-run-id>")
    _reject_symlink_ancestors(absolute)
    return absolute, relative


def _registration_status(relative: str) -> bool:
    roots = _read_checkpoint().get("generated_roots")
    if type(roots) is not list or any(type(row) is not str for row in roots):
        raise RunnerError("checkpoint generated_roots is malformed")
    return relative in roots


def _validate_approved_bundle_identity(
    bundle: emitter.Bundle, manifest: Mapping[str, object]
) -> None:
    actual = {
        "cnf": _sha256(bundle.cnf),
        "map": _sha256(bundle.variable_map),
        "sources": _sha256(bundle.sources),
        "manifest": _sha256(bundle.manifest),
    }
    if actual != EXPECTED_BUNDLE_SHA256:
        raise RunnerError("encoding bundle no longer matches the approved v7 hashes")
    if (
        manifest.get("variables") != EXPECTED_COUNTS["variables"]
        or manifest.get("clauses") != EXPECTED_COUNTS["clauses"]
        or manifest.get("launch_enabled") is not True
        or manifest.get("source_total") is not False
    ):
        raise RunnerError("encoding bundle no longer matches the approved v7 boundary")


def _source_revision_custody(bundle: emitter.Bundle) -> dict[str, object]:
    sources = _strict_json(bundle.sources, "approved source snapshot")
    expected_revisions = {
        emitter.REDUCED_PAYLOAD_SOURCE_FILE: emitter.LEAN_COMMIT,
        emitter.INTERACTION_INGRESS_SOURCE_FILE: (
            emitter.INTERACTION_INGRESS_SOURCE_COMMIT
        ),
    }
    if (
        sources.get("commit") != emitter.LEAN_COMMIT
        or sources.get("target_file_revisions") != expected_revisions
        or "not asserted to be the source revision"
        not in str(sources.get("revision_policy"))
    ):
        raise RunnerError("approved source revision custody drift")
    return {
        "source_projection_commit": emitter.LEAN_COMMIT,
        "target_file_revisions": expected_revisions,
        "target_files_authenticated_unchanged": True,
        "repository_head_claimed_as_source_revision": False,
    }


def _require_launch_audit() -> None:
    required = {
        "status": "APPROVED",
        "counts_reproduced": EXPECTED_COUNTS,
        "cnf_sha256_reproduced": EXPECTED_CNF_SHA256,
        "bundle_hashes_expected": EXPECTED_BUNDLE_SHA256,
        "bundle_hashes_reproduced": EXPECTED_BUNDLE_SHA256,
        "payload_field_coverage_reproduced": 30,
        "reduced_payload_fields_reproduced": list(emitter.REDUCED_PAYLOAD_FIELDS),
        "reduced_constructor_splits_audited": True,
        "six_center_omission_audited": True,
        "source_map_audited": True,
        "no_unsound_clause_found": True,
        "launch_authorized": True,
    }
    if any(INDEPENDENT_AUDIT.get(key) != value for key, value in required.items()):
        raise RunnerError("launch blocked: approved independent-audit identity drift")


def parse_complete_model(stdout: bytes, variable_count: int) -> dict[int, bool]:
    """Parse a complete, unique SAT assignment and reject partial models."""

    try:
        lines = stdout.decode("ascii").splitlines()
    except UnicodeDecodeError as exc:
        raise RunnerError("SAT model output is not ASCII") from exc
    statuses = [line.strip() for line in lines if line.startswith("s ")]
    if statuses != ["s SATISFIABLE"]:
        raise RunnerError("SAT model output has no unique SATISFIABLE status")
    assignment: dict[int, bool] = {}
    saw_zero = False
    for line in lines:
        if not line.startswith("v"):
            continue
        for token in line[1:].split():
            try:
                literal = int(token)
            except ValueError as exc:
                raise RunnerError("SAT model contains a noninteger literal") from exc
            if literal == 0:
                saw_zero = True
                continue
            identifier = abs(literal)
            if identifier > variable_count:
                raise RunnerError("SAT model literal is out of range")
            value = literal > 0
            if identifier in assignment:
                raise RunnerError("SAT model assigns a variable more than once")
            assignment[identifier] = value
    if not saw_zero:
        raise RunnerError("SAT model is not zero-terminated")
    if set(assignment) != set(range(1, variable_count + 1)):
        raise RunnerError("SAT model is incomplete")
    return assignment


def validate_model(bundle: emitter.Bundle, stdout: bytes) -> dict[str, object]:
    """Independently validate the full CNF and all 30 common payload fields."""

    manifest = emitter.validate_bundle(bundle)
    mapping = _strict_json(bundle.variable_map, "problem map")
    variables = mapping.get("variables")
    clauses = mapping.get("clauses")
    if type(variables) is not list or type(clauses) is not list:
        raise RunnerError("v7 model map rows are malformed")
    role_to_id = {
        row["role"]: row["id"]
        for row in variables
        if type(row) is dict
        and type(row.get("role")) is str
        and type(row.get("id")) is int
    }
    variable_count = manifest.get("variables")
    n = manifest.get("n")
    if type(variable_count) is not int or type(n) is not int:
        raise RunnerError("v7 model manifest cardinalities are malformed")
    if len(role_to_id) != variable_count:
        raise RunnerError("v7 model variable roles do not replay uniquely")
    assignment = parse_complete_model(stdout, variable_count)

    def enabled(role: str) -> bool:
        identifier = role_to_id.get(role)
        if type(identifier) is not int:
            raise RunnerError(f"v7 semantic variable is missing: {role}")
        return assignment[identifier]

    if not enabled(emitter.COMMON_GUARD_ROLE):
        raise RunnerError("v7 common payload must be active")
    if not enabled(emitter.LEGACY_COMMON_GUARD_ROLE):
        raise RunnerError("v7 legacy common arm must be active")
    if enabled(emitter.RETAINED_GUARD_ROLE):
        raise RunnerError("v7 retained arm must be false")

    common_sources: dict[str, int] = {}
    common_blockers: dict[str, int] = {}
    validated_fields: set[str] = set()
    for side, field in zip(
        emitter.COMMON_SIDES, emitter.PAYLOAD_FIELDS[:2], strict=True
    ):
        selected = [
            index for index in range(n) if enabled(f"common_source/{side}/{index}")
        ]
        blockers = [
            center for center in range(n) if enabled(f"common_blocker/{side}/{center}")
        ]
        if len(selected) != 1 or len(blockers) != 1:
            raise RunnerError("v7 common source/blocker selector is not one-hot")
        common_sources[side] = selected[0]
        common_blockers[side] = blockers[0]
        actual = [
            center for center in range(n) if enabled(f"blocker/{selected[0]}/{center}")
        ]
        if actual != blockers:
            raise RunnerError("v7 common blocker mux readback mismatch")
        validated_fields.add(field)
    if common_sources["one"] == common_sources["two"]:
        raise RunnerError("v7 common sources are not distinct")
    validated_fields.add("commonSource_ne")

    selected_roles: dict[str, int] = {}
    for role in (*emitter.RETAINED_ROLES, *emitter.APEX_ROLES):
        selected = [index for index in range(n) if enabled(f"role/{role}/{index}")]
        if len(selected) != 1:
            raise RunnerError("v7 referenced named role is not one-hot")
        selected_roles[role] = selected[0]
    for side in emitter.COMMON_SIDES:
        title = side.title()
        source = common_sources[side]
        if not enabled(f"interior/{source}/1"):
            raise RunnerError("v7 common source lost first-cap interior membership")
        validated_fields.add(f"commonSource{title}_firstCapInterior")
        for retained in emitter.RETAINED_ROLES:
            if source == selected_roles[retained]:
                raise RunnerError("v7 common source aliases a retained role")
            validated_fields.add(
                f"commonSource{title}_ne_{emitter.v6._lean_retained_suffix(retained)}"
            )

    named_blockers: dict[str, int] = {}
    for role in emitter.BLOCKER_REFERENCE_ROLES:
        selected = [
            center for center in range(n) if enabled(f"named_blocker/{role}/{center}")
        ]
        if len(selected) != 1:
            raise RunnerError("v7 referenced named blocker is not one-hot")
        named_blockers[role] = selected[0]
    for side, center in common_blockers.items():
        title = side.title()
        for role, suffix in zip(
            emitter.BLOCKER_REFERENCE_ROLES, ("first", "second"), strict=True
        ):
            if center == named_blockers[role]:
                raise RunnerError("v7 common blocker aliases a retained blocker")
            validated_fields.add(f"commonSource{title}_blocker_ne_{suffix}")
        for role, suffix in zip(
            emitter.APEX_ROLES, ("firstApex_point", "secondApex_point"), strict=True
        ):
            if center == selected_roles[role]:
                raise RunnerError("v7 common blocker aliases an apex point")
            validated_fields.add(f"commonSource{title}_blocker_ne_{suffix}")

    for side, center in common_blockers.items():
        title = side.title()
        for left, right, suffix in (
            (emitter.v2.P1, emitter.v2.P2, "first"),
            (emitter.v2.R1, emitter.v2.R2, "second"),
        ):
            if not (
                enabled(f"has4/{selected_roles[left]}/{center}")
                or enabled(f"has4/{selected_roles[right]}/{center}")
            ):
                raise RunnerError("v7 deletion-survival disjunction failed")
            validated_fields.add(f"commonSource{title}_{suffix}Deletion_survives")

    apex = selected_roles[emitter.v2.APEX]
    first = common_sources["one"]
    second = common_sources["two"]
    if not enabled(f"radius/{apex}/{first}/{second}"):
        raise RunnerError("v7 common-radius equality readback failed")
    validated_fields.add("common_radius_eq")
    for role in emitter.RETAINED_ROLES:
        if enabled(f"radius/{apex}/{first}/{selected_roles[role]}"):
            raise RunnerError("v7 common-radius inequality readback failed")
        validated_fields.add(
            f"common_radius_ne_{emitter.v6._lean_retained_suffix(role)}"
        )
    if validated_fields != set(emitter.PAYLOAD_FIELDS):
        raise RunnerError("v7 30-field semantic readback inventory drift")

    def point_of(role: str) -> int:
        chosen = [index for index in range(n) if enabled(f"role/{role}/{index}")]
        if len(chosen) != 1:
            raise RunnerError(f"v7 reduced-payload role is not one-hot: {role}")
        return chosen[0]

    def selected_arm(scope: str, arms: Sequence[str]) -> str:
        chosen = [arm for arm in arms if enabled(f"reduced_payload/{scope}/{arm}")]
        if len(chosen) != 1:
            raise RunnerError(f"v7 reduced-payload choice is not one-hot: {scope}")
        return chosen[0]

    q1 = point_of(emitter.v2.Q1)
    q2 = point_of(emitter.v2.Q2)

    def validate_source_omission(scope: str, side: str) -> str:
        deleted_role = selected_arm(f"{scope}/deleted", (emitter.v2.Q1, emitter.v2.Q2))
        deleted = point_of(deleted_role)
        source = common_sources[side]
        center = common_blockers[side]
        if enabled(f"row/{source}/{deleted}") or not enabled(
            f"has4/{deleted}/{center}"
        ):
            raise RunnerError(f"v7 source-omission readback failed: {scope}")
        return deleted_role

    def validate_same_blocker(scope: str, side: str) -> None:
        if common_blockers[side] != named_blockers[emitter.v2.Q1]:
            raise RunnerError(f"v7 same-blocker center readback failed: {scope}")
        source = common_sources[side]
        if any(
            enabled(f"row/{source}/{point}")
            != enabled(f"named_row/{emitter.v2.Q1}/{point}")
            for point in range(n)
        ):
            raise RunnerError(f"v7 same-blocker row readback failed: {scope}")

    def validate_cross_hit(scope: str, side: str) -> None:
        source = common_sources[side]
        if common_blockers[side] == named_blockers[emitter.v2.Q1]:
            raise RunnerError(f"v7 cross-row blocker readback failed: {scope}")
        if not enabled(f"row/{source}/{q1}") or not enabled(f"row/{source}/{q2}"):
            raise RunnerError(f"v7 equal-center hit membership failed: {scope}")

    def validate_two_point_overlap(scope: str, side: str) -> None:
        validate_cross_hit(scope, side)
        source = common_sources[side]
        overlap = {
            point
            for point in range(n)
            if enabled(f"row/{source}/{point}")
            and enabled(f"named_row/{emitter.v2.Q1}/{point}")
        }
        if overlap != {q1, q2}:
            raise RunnerError(f"v7 two-point overlap readback failed: {scope}")

    def validate_interaction(scope: str, side: str) -> str:
        arm = selected_arm(scope, emitter.INTERACTION_ARMS)
        branch = f"{scope}/{arm}"
        if arm == "same_blocker":
            validate_same_blocker(branch, side)
        elif arm == "source_omission":
            validate_source_omission(branch, side)
        elif arm == "different_caps":
            validate_two_point_overlap(branch, side)
            label = selected_arm(
                f"{branch}/caps",
                tuple(
                    f"{left}_{right}"
                    for left in range(3)
                    for right in range(3)
                    if left != right
                ),
            )
            source_cap, fresh_cap = (int(value) for value in label.split("_"))
            if not enabled(f"interior/{common_blockers[side]}/{source_cap}"):
                raise RunnerError(f"v7 source cap readback failed: {branch}")
            if not enabled(f"blocker_interior/{emitter.v2.Q1}/{fresh_cap}"):
                raise RunnerError(f"v7 fresh cap readback failed: {branch}")
        else:
            validate_two_point_overlap(branch, side)
            cap = int(selected_arm(f"{branch}/cap", ("0", "1", "2")))
            if not enabled(f"interior/{common_blockers[side]}/{cap}"):
                raise RunnerError(f"v7 shared source cap readback failed: {branch}")
            if not enabled(f"blocker_interior/{emitter.v2.Q1}/{cap}"):
                raise RunnerError(f"v7 shared fresh cap readback failed: {branch}")
            if not (
                enabled(f"named_cap/{emitter.v2.Q1}/{cap}")
                or enabled(f"named_cap/{emitter.v2.Q2}/{cap}")
            ):
                raise RunnerError(f"v7 shared-cap endpoint readback failed: {branch}")
        return arm

    def validate_nonhit(scope: str, side: str) -> str:
        arm = selected_arm(scope, emitter.NONHIT_ARMS)
        if arm == "same_blocker":
            validate_same_blocker(f"{scope}/{arm}", side)
        else:
            validate_source_omission(f"{scope}/{arm}", side)
        return arm

    def validate_exact_trace(scope: str) -> None:
        first_source = common_sources["one"]
        second_source = common_sources["two"]
        if not enabled(f"row/{first_source}/{second_source}") or not enabled(
            f"row/{second_source}/{first_source}"
        ):
            raise RunnerError(f"v7 exact-trace mutual membership failed: {scope}")
        if common_blockers["one"] != common_blockers["two"]:
            raise RunnerError(f"v7 exact-trace blocker equality failed: {scope}")
        if not enabled(f"interior/{common_blockers['one']}/1"):
            raise RunnerError(f"v7 exact-trace blocker interior failed: {scope}")
        pair = {
            point
            for point in range(n)
            if enabled(f"row/{first_source}/{point}") and enabled(f"cap/{point}/1")
        }
        if pair != {first_source, second_source}:
            raise RunnerError(f"v7 exact-trace first-cap pair failed: {scope}")
        if any(
            enabled(f"row/{source}/{point_of(role)}")
            for source in (first_source, second_source)
            for role in emitter.RETAINED_ROLES
        ):
            raise RunnerError(f"v7 exact-trace retained omission failed: {scope}")

    def validate_one_sided(scope: str) -> str:
        orientation = selected_arm(
            f"{scope}/orientation", ("delete_two_keep_one", "delete_one_keep_two")
        )
        if orientation == "delete_two_keep_one":
            deleted, center = common_sources["two"], common_blockers["one"]
        else:
            deleted, center = common_sources["one"], common_blockers["two"]
        if not enabled(f"has4/{deleted}/{center}"):
            raise RunnerError(f"v7 one-sided deletion readback failed: {scope}")
        return orientation

    source_pair = selected_arm("source_pair", emitter.SOURCE_PAIR_ARMS)
    if source_pair == "mutual_exact_trace":
        validate_exact_trace("source_pair/mutual_exact_trace")
    else:
        validate_one_sided("source_pair/one_sided_deletion")
    interactions = {
        side: validate_interaction(f"interaction/{side}", side)
        for side in emitter.COMMON_SIDES
    }
    residual = selected_arm("normalized_residual", emitter.NORMALIZED_RESIDUAL_ARMS)
    if residual == "first_nonhit":
        validate_nonhit("normalized_residual/first_nonhit", "one")
    elif residual == "second_nonhit":
        validate_nonhit("normalized_residual/second_nonhit", "two")
    else:
        validate_cross_hit(
            "normalized_residual/equal_cross_row_centers/first_hit", "one"
        )
        validate_cross_hit(
            "normalized_residual/equal_cross_row_centers/second_hit", "two"
        )
        if common_blockers["one"] != common_blockers["two"]:
            raise RunnerError("v7 normalized equal-center readback failed")

    reduced = selected_arm("reduced_case", emitter.REDUCED_CASE_ARMS)
    reduced_details: dict[str, object] = {}
    if reduced == "double_nonhit":
        validate_exact_trace("reduced_case/double_nonhit/exact_trace")
        reduced_details["first_nonhit"] = validate_nonhit(
            "reduced_case/double_nonhit/first_nonhit", "one"
        )
        reduced_details["second_nonhit"] = validate_nonhit(
            "reduced_case/double_nonhit/second_nonhit", "two"
        )
        arm = selected_arm(
            "reduced_case/double_nonhit/five_center",
            emitter.FIVE_CENTER_DELETION_ARMS,
        )
        deletion_roles = {
            "delete_first_one": (emitter.v2.P1, emitter.v2.R1),
            "delete_second_one": (emitter.v2.R1, emitter.v2.P1),
            "delete_first_two": (emitter.v2.P2, emitter.v2.R1),
            "delete_second_two": (emitter.v2.R2, emitter.v2.P1),
        }
        deleted_role, other_role = deletion_roles[arm]
        deleted = point_of(deleted_role)
        centers = (
            common_blockers["one"],
            point_of(emitter.v2.APEX),
            named_blockers[other_role],
            point_of("second_apex"),
            point_of("surplus_apex"),
        )
        if any(not enabled(f"has4/{deleted}/{center}") for center in centers):
            raise RunnerError("v7 five-center deletion readback failed")
        reduced_details["five_center_deletion"] = arm
    elif reduced == "equal_cross_row_centers":
        validate_cross_hit("reduced_case/equal_cross_row_centers/first_hit", "one")
        validate_cross_hit("reduced_case/equal_cross_row_centers/second_hit", "two")
        if common_blockers["one"] != common_blockers["two"]:
            raise RunnerError("v7 reduced equal-center readback failed")
    else:
        reduced_details["orientation"] = validate_one_sided(
            "reduced_case/one_sided_deletion"
        )

    for row in clauses:
        if type(row) is not dict or type(row.get("literals")) is not list:
            raise RunnerError("v7 model clause map is malformed")
        if not any(
            assignment[abs(literal)] == (literal > 0) for literal in row["literals"]
        ):
            raise RunnerError(f"SAT model falsifies CNF clause {row.get('id')}")
    return {
        "variable_count": variable_count,
        "clause_count": manifest["clauses"],
        "all_emitted_clauses_satisfied": True,
        "common_payload_active": True,
        "retained_active": False,
        "common_source_indices": common_sources,
        "common_blocker_indices": common_blockers,
        "retained_blocker_indices": named_blockers,
        "validated_payload_fields": sorted(validated_fields),
        "all_30_payload_fields_validated": True,
        "reduced_payload_validated": True,
        "source_pair_constructor": source_pair,
        "interaction_constructors": interactions,
        "normalized_residual_constructor": residual,
        "reduced_case_constructor": reduced,
        "reduced_case_details": reduced_details,
        "independent_g_surface": True,
        "faithful_six_center_boundary_encoded": False,
        "source_total": False,
        "semantic_scope": "source-current reduced finite exact-n relaxation; no cardinality lift",
    }


def _binary_identity(name: str, *, required: bool) -> dict[str, object] | None:
    resolved = shutil.which(name)
    if resolved is None:
        if required:
            raise RunnerError(f"required binary is unavailable: {name}")
        return None
    path = Path(resolved).resolve()
    data = _read_regular(path, f"{name} binary")
    return {"name": name, "path": str(path), "sha256": _sha256(data), "size": len(data)}


def _run_process(
    name: str, command: Sequence[str], timeout_seconds: int
) -> ProcessResult:
    started = time.monotonic()
    try:
        completed = subprocess.run(
            list(command), capture_output=True, check=False, timeout=timeout_seconds
        )
        return ProcessResult(
            name,
            tuple(command),
            "COMPLETED",
            completed.returncode,
            round((time.monotonic() - started) * 1000),
            completed.stdout,
            completed.stderr,
        )
    except subprocess.TimeoutExpired as exc:
        stdout = exc.stdout if isinstance(exc.stdout, bytes) else b""
        stderr = exc.stderr if isinstance(exc.stderr, bytes) else b""
        return ProcessResult(
            name,
            tuple(command),
            "TIMEOUT",
            None,
            round((time.monotonic() - started) * 1000),
            stdout,
            stderr,
        )


def _record_process(root: Path, result: ProcessResult) -> dict[str, object]:
    stdout_name = f"{result.name}.stdout"
    stderr_name = f"{result.name}.stderr"
    receipt_name = f"{result.name}.process.json"
    _write_new(root / stdout_name, result.stdout)
    _write_new(root / stderr_name, result.stderr)
    receipt = _self_hashed(
        {
            "schema": PROCESS_SCHEMA,
            "name": result.name,
            "command": list(result.command),
            "status": result.status,
            "returncode": result.returncode,
            "elapsed_ms": result.elapsed_ms,
            "stdout": {
                "path": stdout_name,
                "sha256": _sha256(result.stdout),
                "size": len(result.stdout),
            },
            "stderr": {
                "path": stderr_name,
                "sha256": _sha256(result.stderr),
                "size": len(result.stderr),
            },
        },
        "process_receipt_sha256",
    )
    payload = _canonical_json(receipt)
    _write_new(root / receipt_name, payload)
    return {
        "name": result.name,
        "receipt": receipt_name,
        "receipt_sha256": _sha256(payload),
        "status": result.status,
        "returncode": result.returncode,
    }


def _validate_process(
    root: Path, summary: Mapping[str, object]
) -> tuple[dict[str, object], bytes, bytes]:
    name = summary.get("name")
    receipt_name = summary.get("receipt")
    if (
        type(name) is not str
        or PROCESS_NAME.fullmatch(name) is None
        or receipt_name != f"{name}.process.json"
    ):
        raise RunnerError("terminal process summary is malformed")
    data = _read_regular(root / receipt_name, f"{name} process receipt")
    if summary.get("receipt_sha256") != _sha256(data):
        raise RunnerError("terminal process receipt digest mismatch")
    receipt = _strict_json(data, f"{name} process receipt")
    if receipt.get("schema") != PROCESS_SCHEMA or receipt.get("name") != name:
        raise RunnerError("process receipt schema/name mismatch")
    _validate_self_hash(receipt, "process_receipt_sha256")
    if summary.get("status") != receipt.get("status") or summary.get(
        "returncode"
    ) != receipt.get("returncode"):
        raise RunnerError("terminal/process receipt result mismatch")
    command = receipt.get("command")
    if (
        type(command) is not list
        or not command
        or any(type(part) is not str or "\x00" in part for part in command)
    ):
        raise RunnerError("process command is malformed")
    streams: list[bytes] = []
    for field in ("stdout", "stderr"):
        metadata = receipt.get(field)
        if type(metadata) is not dict or metadata.get("path") != f"{name}.{field}":
            raise RunnerError("process stream metadata mismatch")
        stream = _read_regular(root / metadata["path"], f"{name} {field}")
        if metadata.get("sha256") != _sha256(stream) or metadata.get("size") != len(
            stream
        ):
            raise RunnerError("process stream digest/size mismatch")
        streams.append(stream)
    return receipt, streams[0], streams[1]


def _artifact_inventory(root: Path) -> list[dict[str, object]]:
    rows = []
    for path in sorted(root.iterdir(), key=lambda item: item.name):
        if path.name == "terminal-receipt.json":
            continue
        data = _read_regular(path, f"run artifact {path.name}")
        rows.append({"path": path.name, "sha256": _sha256(data), "size": len(data)})
    return rows


def _terminal_receipt(
    root: Path,
    run_manifest_sha256: str,
    status: str,
    result: Mapping[str, object],
    processes: Sequence[Mapping[str, object]],
) -> dict[str, object]:
    receipt = _self_hashed(
        {
            "schema": RECEIPT_SCHEMA,
            "status": status,
            "source_total": False,
            "launch_enabled_at_creation": True,
            "run_manifest_sha256": run_manifest_sha256,
            "result": dict(result),
            "processes": [dict(row) for row in processes],
            "artifact_inventory": _artifact_inventory(root),
            "all_emitted_hard_clauses_source_mapped": True,
            "no_cegar_successor": True,
            "theorem_bank_search_run": False,
        },
        "terminal_receipt_sha256",
    )
    _write_new(root / "terminal-receipt.json", _canonical_json(receipt))
    return receipt


def _write_bundle(root: Path, bundle: emitter.Bundle) -> None:
    for name, data in (
        ("problem.cnf", bundle.cnf),
        ("problem.map.json", bundle.variable_map),
        ("problem.sources.json", bundle.sources),
        ("problem.manifest.json", bundle.manifest),
    ):
        _write_new(root / name, data)


def _bundle_from_root(root: Path) -> emitter.Bundle:
    return emitter.Bundle(
        _read_regular(root / "problem.cnf", "terminal CNF"),
        _read_regular(root / "problem.map.json", "terminal map"),
        _read_regular(root / "problem.sources.json", "terminal sources"),
        _read_regular(root / "problem.manifest.json", "terminal encoding manifest"),
    )


def _initial_manifest(
    relative: str,
    bundle: emitter.Bundle,
    timeout_seconds: int,
    cross_check: bool,
) -> dict[str, object]:
    encoding_manifest = emitter.validate_bundle(bundle)
    return _self_hashed(
        {
            "schema": RUN_SCHEMA,
            "status": "IN_PROGRESS",
            "run_root": relative,
            "n": PRODUCTION_N,
            "source_total": False,
            "launch_enabled": True,
            "timeout_seconds": timeout_seconds,
            "cross_check_requested": cross_check,
            "manifest_first": True,
            "authenticated_sources": _authenticated_source_rows(),
            "source_revision": _source_revision_custody(bundle),
            "encoding": {
                "schema": encoding_manifest["schema"],
                "variables": encoding_manifest["variables"],
                "clauses": encoding_manifest["clauses"],
                "cnf_sha256": encoding_manifest["cnf_sha256"],
                "map_sha256": encoding_manifest["map_sha256"],
                "sources_sha256": encoding_manifest["sources_sha256"],
                "manifest_sha256": _sha256(bundle.manifest),
            },
            "binary_discovery_deferred_until_after_manifest": True,
        },
        "run_manifest_sha256",
    )


def _create_root(root: Path) -> None:
    root.parent.mkdir(parents=True, exist_ok=True)
    root.mkdir(mode=0o755)
    _fsync_directory(root.parent)


def _write_binaries(
    root: Path,
    cadical: Mapping[str, object],
    drat_trim: Mapping[str, object],
    kissat: object,
) -> dict[str, object]:
    value = _self_hashed(
        {
            "schema": BINARY_SCHEMA,
            "cadical": dict(cadical),
            "drat_trim": dict(drat_trim),
            "kissat": kissat,
        },
        "binaries_sha256",
    )
    _write_new(root / "binaries.json", _canonical_json(value))
    return value


def _record_binary_versions(
    root: Path, binaries: Mapping[str, object]
) -> list[dict[str, object]]:
    processes = []
    for name in ("cadical", "drat_trim"):
        row = binaries[name]
        assert isinstance(row, dict)
        processes.append(
            _record_process(
                root,
                _run_process(f"{name}-version", [str(row["path"]), "--version"], 30),
            )
        )
    return processes


def _run_smokes(
    root: Path, cadical: Mapping[str, object], drat_trim: Mapping[str, object]
) -> list[dict[str, object]]:
    sat_path = root / "smoke-sat.cnf"
    unsat_path = root / "smoke-unsat.cnf"
    proof_temp = root / ".smoke-unsat.drat.inprogress"
    proof_final = root / "smoke-unsat.drat"
    _write_new(sat_path, b"p cnf 1 1\n1 0\n")
    _write_new(unsat_path, b"p cnf 1 2\n1 0\n-1 0\n")
    processes = []
    sat = _run_process("smoke-sat", [str(cadical["path"]), str(sat_path)], 30)
    processes.append(_record_process(root, sat))
    if sat.status != "COMPLETED" or sat.returncode != 10:
        raise RunnerError("known-SAT smoke failed")
    unsat = _run_process(
        "smoke-unsat",
        [str(cadical["path"]), str(unsat_path), str(proof_temp)],
        30,
    )
    processes.append(_record_process(root, unsat))
    if unsat.status != "COMPLETED" or unsat.returncode != 20:
        raise RunnerError("known-UNSAT smoke failed")
    trim = _run_process(
        "smoke-unsat-drat-trim",
        [str(drat_trim["path"]), str(unsat_path), str(proof_temp)],
        30,
    )
    processes.append(_record_process(root, trim))
    if (
        trim.status != "COMPLETED"
        or trim.returncode != 0
        or b"s VERIFIED" not in trim.stdout
    ):
        raise RunnerError("known-UNSAT DRAT smoke failed")
    if not proof_temp.is_file() or proof_temp.stat().st_size == 0:
        raise RunnerError("known-UNSAT smoke produced no proof")
    os.replace(proof_temp, proof_final)
    _fsync_directory(root)
    return processes


def _validate_binaries(
    root: Path, *, required: bool, cross_check: bool
) -> dict[str, object]:
    binaries = _strict_json(
        _read_regular(root / "binaries.json", "binary inventory"), "binary inventory"
    )
    if binaries.get("schema") != BINARY_SCHEMA:
        raise RunnerError("binary inventory schema mismatch")
    _validate_self_hash(binaries, "binaries_sha256")
    for name in ("cadical", "drat_trim"):
        row = binaries.get(name)
        if not required and row == {}:
            continue
        if type(row) is not dict or row.get("name") != name:
            raise RunnerError("required binary identity is missing")
        if not all(
            type(row.get(key)) is expected
            for key, expected in (("path", str), ("sha256", str), ("size", int))
        ):
            raise RunnerError("binary identity is malformed")
    kissat = binaries.get("kissat")
    if (
        required
        and cross_check
        and (type(kissat) is not dict or kissat.get("name") != "kissat")
    ):
        raise RunnerError("cross-check binary identity is missing")
    return binaries


def terminal_reentry(run_root: Path) -> dict[str, object]:
    """Replay terminal custody with zero process, solver, or binary calls."""

    root, relative = _normalize_run_root(run_root)
    if not root.is_dir() or root.is_symlink():
        raise RunnerError("terminal run root must be a real directory")
    manifest_data = _read_regular(root / "run-manifest.json", "run manifest")
    manifest = _strict_json(manifest_data, "run manifest")
    if manifest.get("schema") != RUN_SCHEMA or manifest.get("run_root") != relative:
        raise RunnerError("run manifest schema/root mismatch")
    if (
        manifest.get("status") != "IN_PROGRESS"
        or manifest.get("manifest_first") is not True
    ):
        raise RunnerError("run manifest boundary mismatch")
    _validate_self_hash(manifest, "run_manifest_sha256")
    if manifest.get("authenticated_sources") != _authenticated_source_rows():
        raise RunnerError("run manifest source custody drift")
    bundle = _bundle_from_root(root)
    encoding_manifest = emitter.validate_bundle(bundle)
    _validate_approved_bundle_identity(bundle, encoding_manifest)
    if manifest.get("source_revision") != _source_revision_custody(bundle):
        raise RunnerError("run manifest source revision custody drift")
    if (
        encoding_manifest.get("variables") != EXPECTED_COUNTS["variables"]
        or encoding_manifest.get("clauses") != EXPECTED_COUNTS["clauses"]
        or encoding_manifest.get("cnf_sha256") != EXPECTED_CNF_SHA256
    ):
        raise RunnerError("terminal encoding identity drift")
    encoding = manifest.get("encoding")
    expected_encoding = {
        "schema": encoding_manifest["schema"],
        "variables": encoding_manifest["variables"],
        "clauses": encoding_manifest["clauses"],
        "cnf_sha256": encoding_manifest["cnf_sha256"],
        "map_sha256": encoding_manifest["map_sha256"],
        "sources_sha256": encoding_manifest["sources_sha256"],
        "manifest_sha256": _sha256(bundle.manifest),
    }
    if encoding != expected_encoding:
        raise RunnerError("run manifest encoding binding drift")
    receipt_data = _read_regular(root / "terminal-receipt.json", "terminal receipt")
    receipt = _strict_json(receipt_data, "terminal receipt")
    if receipt.get("schema") != RECEIPT_SCHEMA:
        raise RunnerError("terminal receipt schema mismatch")
    _validate_self_hash(receipt, "terminal_receipt_sha256")
    if receipt.get("run_manifest_sha256") != _sha256(manifest_data):
        raise RunnerError("terminal receipt manifest binding mismatch")
    if receipt.get("source_total") is not False:
        raise RunnerError("terminal receipt source-total boundary drift")
    if receipt.get("artifact_inventory") != _artifact_inventory(root):
        raise RunnerError("terminal artifact inventory mismatch")
    if (
        receipt.get("all_emitted_hard_clauses_source_mapped") is not True
        or receipt.get("no_cegar_successor") is not True
        or receipt.get("theorem_bank_search_run") is not False
    ):
        raise RunnerError("terminal receipt semantic boundary mismatch")

    summaries = receipt.get("processes")
    if type(summaries) is not list or any(type(row) is not dict for row in summaries):
        raise RunnerError("terminal process summaries are malformed")
    process_rows: dict[str, tuple[dict[str, object], bytes, bytes]] = {}
    for summary in summaries:
        validated = _validate_process(root, summary)
        name = validated[0]["name"]
        if name in process_rows:
            raise RunnerError("terminal process names are not unique")
        process_rows[name] = validated
    required_prefix = {
        "cadical-version",
        "drat_trim-version",
        "smoke-sat",
        "smoke-unsat",
        "smoke-unsat-drat-trim",
        "production-cadical",
    }
    status = receipt.get("status")
    result = receipt.get("result")
    cross_check = manifest.get("cross_check_requested") is True
    binaries = _validate_binaries(
        root, required=status != "FAILED", cross_check=cross_check
    )
    if type(result) is not dict:
        raise RunnerError("terminal result is malformed")
    if status in {"SAT", "UNSAT"} and not required_prefix.issubset(process_rows):
        raise RunnerError("terminal process phase set is incomplete")
    allowed = set(required_prefix)
    if status == "UNSAT":
        allowed.add("production-drat-trim")
    if cross_check and status in {"SAT", "UNSAT"}:
        allowed.add("production-kissat")
    if status != "FAILED" and set(process_rows) != allowed:
        raise RunnerError("terminal process phase set has missing or extra phases")
    for name, expected_returncode in (
        ("cadical-version", 0),
        ("drat_trim-version", 0),
        ("smoke-sat", 10),
        ("smoke-unsat", 20),
        ("smoke-unsat-drat-trim", 0),
    ):
        row = process_rows.get(name)
        if status != "FAILED" and (
            row is None
            or row[0].get("status") != "COMPLETED"
            or row[0].get("returncode") != expected_returncode
        ):
            raise RunnerError("terminal smoke/version phase failed")
    if status != "FAILED":
        commands = {
            "cadical-version": [binaries["cadical"]["path"], "--version"],
            "drat_trim-version": [binaries["drat_trim"]["path"], "--version"],
            "smoke-sat": [binaries["cadical"]["path"], str(root / "smoke-sat.cnf")],
            "smoke-unsat": [
                binaries["cadical"]["path"],
                str(root / "smoke-unsat.cnf"),
                str(root / ".smoke-unsat.drat.inprogress"),
            ],
            "smoke-unsat-drat-trim": [
                binaries["drat_trim"]["path"],
                str(root / "smoke-unsat.cnf"),
                str(root / ".smoke-unsat.drat.inprogress"),
            ],
            "production-cadical": [
                binaries["cadical"]["path"],
                "-t",
                str(manifest["timeout_seconds"]),
                str(root / "problem.cnf"),
                str(root / ".production.drat.inprogress"),
            ],
        }
        if "production-drat-trim" in process_rows:
            commands["production-drat-trim"] = [
                binaries["drat_trim"]["path"],
                str(root / "problem.cnf"),
                str(root / ".production.drat.inprogress"),
            ]
        if "production-kissat" in process_rows:
            commands["production-kissat"] = [
                binaries["kissat"]["path"],
                str(root / "problem.cnf"),
            ]
        for name, expected_command in commands.items():
            if process_rows[name][0]["command"] != expected_command:
                raise RunnerError("terminal process command binding drift")
    production = process_rows.get("production-cadical")
    if status == "SAT":
        if production is None or production[0].get("returncode") != 10:
            raise RunnerError("SAT receipt lacks a successful production process")
        readback = validate_model(bundle, production[1])
        if result.get("model_readback") != readback or result.get("verdict") != "SAT":
            raise RunnerError("SAT terminal semantic readback drift")
    elif status == "UNSAT":
        if production is None or production[0].get("returncode") != 20:
            raise RunnerError("UNSAT receipt lacks a successful production process")
        trim = process_rows.get("production-drat-trim")
        proof = result.get("proof")
        if (
            trim is None
            or trim[0].get("returncode") != 0
            or b"s VERIFIED" not in trim[1]
            or type(proof) is not dict
            or proof.get("path") != "production.drat"
            or proof.get("drat_trim_verified") is not True
        ):
            raise RunnerError("UNSAT receipt lacks verified DRAT custody")
        proof_data = _read_regular(root / str(proof.get("path")), "terminal DRAT proof")
        if proof.get("sha256") != _sha256(proof_data) or proof.get("size") != len(
            proof_data
        ):
            raise RunnerError("terminal DRAT proof digest/size mismatch")
    elif status in {"UNKNOWN", "ERROR"}:
        if production is None or result.get("verdict") != status:
            raise RunnerError("nondecisive terminal receipt mismatch")
    elif status == "FAILED":
        if result.get("verdict") is not None or not isinstance(
            result.get("reason"), str
        ):
            raise RunnerError("FAILED terminal custody is malformed")
    else:
        raise RunnerError("unknown terminal status")
    if cross_check and status in {"SAT", "UNSAT"}:
        cross = process_rows.get("production-kissat")
        expected_code = 10 if status == "SAT" else 20
        if cross is None or cross[0].get("returncode") != expected_code:
            raise RunnerError("cross-check verdict disagrees with production")
        if result.get("cross_check_verdict") != status:
            raise RunnerError("cross-check result metadata drift")
        if status == "SAT":
            cross_readback = validate_model(bundle, cross[1])
            if result.get("cross_check_model_readback") != cross_readback:
                raise RunnerError("cross-check SAT semantic readback drift")
    return {
        "schema": RUN_SCHEMA,
        "status": status,
        "terminal_reentry": True,
        "solver_calls": 0,
        "run_root": relative,
        "result": result,
        "artifact_count": len(receipt["artifact_inventory"]),
    }


def run_once(
    run_root: Path, *, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    """Run smoke gates and one production solve after every direct safety gate."""

    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise RunnerError("timeout_seconds must be a positive integer")
    root, relative = _normalize_run_root(run_root)
    _authenticated_source_rows()
    bundle = emitter.emit_bundle(PRODUCTION_N)
    encoding_manifest = emitter.validate_bundle(bundle)
    _validate_approved_bundle_identity(bundle, encoding_manifest)
    if root.exists() or root.is_symlink():
        if (root / "terminal-receipt.json").is_file():
            return terminal_reentry(root)
        raise RunnerError(
            "run root exists but is not terminal; one-shot resume is forbidden"
        )
    if not _registration_status(relative):
        raise RunnerError(
            "exact run root is not registered in checkpoint generated_roots"
        )
    _require_launch_audit()
    if emitter.PRODUCTION_LAUNCH_ENABLED is not True:
        raise RunnerError("encoder production launch gate is false")
    if (
        encoding_manifest["cnf_sha256"] != EXPECTED_CNF_SHA256
        or encoding_manifest["variables"] != EXPECTED_COUNTS["variables"]
        or encoding_manifest["clauses"] != EXPECTED_COUNTS["clauses"]
    ):
        raise RunnerError("encoding no longer matches the approved v7 identity")

    manifest = _initial_manifest(relative, bundle, timeout_seconds, cross_check)
    manifest_data = _canonical_json(manifest)
    _create_root(root)
    _write_new(root / "run-manifest.json", manifest_data)
    _write_bundle(root, bundle)
    processes: list[dict[str, object]] = []
    try:
        cadical = _binary_identity("cadical", required=True)
        drat_trim = _binary_identity("drat-trim", required=True)
        kissat = _binary_identity("kissat", required=False) if cross_check else None
        if cadical is None or drat_trim is None:
            raise RunnerError("required binary identity is absent")
        if cross_check and kissat is None:
            raise RunnerError("requested cross-check binary is absent")
        binaries = _write_binaries(root, cadical, drat_trim, kissat)
        processes.extend(_record_binary_versions(root, binaries))
        processes.extend(_run_smokes(root, cadical, drat_trim))
        proof_temp = root / ".production.drat.inprogress"
        production = _run_process(
            "production-cadical",
            [
                str(cadical["path"]),
                "-t",
                str(timeout_seconds),
                str(root / "problem.cnf"),
                str(proof_temp),
            ],
            timeout_seconds + TIMEOUT_CUSHION_SECONDS,
        )
        processes.append(_record_process(root, production))
        verdict = {10: "SAT", 20: "UNSAT"}.get(
            production.returncode,
            "UNKNOWN" if production.status == "TIMEOUT" else "ERROR",
        )
        if verdict not in {"SAT", "UNSAT"}:
            if proof_temp.exists():
                os.replace(proof_temp, root / "partial-production.drat")
            return _terminal_receipt(
                root,
                _sha256(manifest_data),
                verdict,
                {"verdict": verdict, "reason": "production solver was nondecisive"},
                processes,
            )
        result: dict[str, object] = {"verdict": verdict}
        if verdict == "SAT":
            result["model_readback"] = validate_model(bundle, production.stdout)
            if proof_temp.exists():
                os.replace(proof_temp, root / "sat-unused-proof-output")
        else:
            if not proof_temp.is_file() or proof_temp.stat().st_size == 0:
                raise RunnerError("UNSAT result did not produce a DRAT proof")
            trim = _run_process(
                "production-drat-trim",
                [str(drat_trim["path"]), str(root / "problem.cnf"), str(proof_temp)],
                timeout_seconds + TIMEOUT_CUSHION_SECONDS,
            )
            processes.append(_record_process(root, trim))
            if (
                trim.status != "COMPLETED"
                or trim.returncode != 0
                or b"s VERIFIED" not in trim.stdout
            ):
                raise RunnerError("production DRAT proof did not verify")
            final_proof = root / "production.drat"
            os.replace(proof_temp, final_proof)
            proof_data = _read_regular(final_proof, "checked production DRAT proof")
            result["proof"] = {
                "path": final_proof.name,
                "sha256": _sha256(proof_data),
                "size": len(proof_data),
                "drat_trim_verified": True,
            }
        if cross_check:
            assert isinstance(kissat, dict)
            cross = _run_process(
                "production-kissat",
                [str(kissat["path"]), str(root / "problem.cnf")],
                timeout_seconds + TIMEOUT_CUSHION_SECONDS,
            )
            processes.append(_record_process(root, cross))
            cross_verdict = {10: "SAT", 20: "UNSAT"}.get(cross.returncode)
            if cross.status != "COMPLETED" or cross_verdict != verdict:
                raise RunnerError("production cross-check verdict disagrees")
            result["cross_check_verdict"] = cross_verdict
            if verdict == "SAT":
                result["cross_check_model_readback"] = validate_model(
                    bundle, cross.stdout
                )
        return _terminal_receipt(
            root, _sha256(manifest_data), verdict, result, processes
        )
    except Exception as exc:
        for temporary in root.glob(".*.inprogress"):
            os.replace(temporary, root / f"partial-{temporary.name[1:]}")
        if not (root / "binaries.json").exists():
            _write_new(
                root / "binaries.json",
                _canonical_json(
                    _self_hashed(
                        {
                            "schema": BINARY_SCHEMA,
                            "cadical": {},
                            "drat_trim": {},
                            "kissat": None,
                        },
                        "binaries_sha256",
                    )
                ),
            )
        if not (root / "terminal-receipt.json").exists():
            _terminal_receipt(
                root,
                _sha256(manifest_data),
                "FAILED",
                {"verdict": None, "reason": str(exc)},
                processes,
            )
        if isinstance(exc, RunnerError):
            raise
        raise RunnerError(f"runner failed closed: {exc}") from exc


def dry_run(
    run_root: Path | None, timeout_seconds: int, cross_check: bool
) -> dict[str, object]:
    if type(timeout_seconds) is not int or timeout_seconds <= 0:
        raise RunnerError("timeout_seconds must be a positive integer")
    sources = _authenticated_source_rows()
    bundle = emitter.emit_bundle(PRODUCTION_N)
    manifest = emitter.validate_bundle(bundle)
    _validate_approved_bundle_identity(bundle, manifest)
    requested = Path(PROPOSED_RUN_ROOT) if run_root is None else run_root
    _absolute, relative = _normalize_run_root(requested)
    return {
        "schema": RUN_SCHEMA,
        "mode": "DRY_RUN",
        "launch": False,
        "launch_enabled": manifest["launch_enabled"],
        "audit_status": INDEPENDENT_AUDIT["status"],
        "independent_audit": INDEPENDENT_AUDIT,
        "run_root": {"path": relative, "registered": _registration_status(relative)},
        "proposed_run_root": PROPOSED_RUN_ROOT,
        "run_root_created": False,
        "solver_calls": 0,
        "source_total": manifest["source_total"],
        "variables": manifest["variables"],
        "clauses": manifest["clauses"],
        "cnf_sha256": manifest["cnf_sha256"],
        "common_payload_active": manifest["common_payload_active"],
        "retained_active": manifest["retained_active"],
        "common_payload_field_count": manifest["common_payload_field_count"],
        "reduced_payload_complete_for_finite_assignment": manifest[
            "reduced_payload_complete_for_finite_assignment"
        ],
        "faithful_six_center_boundary_encoded": manifest[
            "faithful_six_center_boundary_encoded"
        ],
        "common_surface_identified_with_c": manifest[
            "common_surface_identified_with_c"
        ],
        "source_revision": _source_revision_custody(bundle),
        "authenticated_source_chain": sources,
        "native_terminal_reentry": True,
        "manifest_first_runner": True,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--launch", action="store_true")
    parser.add_argument("--run-root", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=3600)
    parser.add_argument("--cross-check", action="store_true")
    args = parser.parse_args(argv)
    if args.launch:
        if args.run_root is None:
            parser.error("--launch requires --run-root")
        result = run_once(
            args.run_root,
            timeout_seconds=args.timeout_seconds,
            cross_check=args.cross_check,
        )
    else:
        result = dry_run(args.run_root, args.timeout_seconds, args.cross_check)
    print(json.dumps(result, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
