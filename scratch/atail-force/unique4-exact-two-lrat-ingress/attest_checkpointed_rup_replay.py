#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Validate and hash a supplied Lean replay record without changing its package.

This utility does not run Lean and cannot create a replay success claim.  It
checks a caller-supplied success record against local evidence and returns a
canonical digest binding the verified structural package, checker, replay
inputs, theorem/result, replay transcript, and axiom audit.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
from typing import Any

import materialize_checkpointed_rup as package_tools


SCHEMA = "p97-checkpointed-rup-lean-replay-attestation-v1"
LEAN_NAME = re.compile(r"[A-Za-z_][A-Za-z0-9_']*(?:\.[A-Za-z_][A-Za-z0-9_']*)+")
BASE_KEYS = {
    "schema",
    "package",
    "checker",
    "replay_inputs",
    "theorem",
    "result",
    "axiom_audit",
}


class AttestationError(ValueError):
    """A supplied replay record failed a fail-closed integrity check."""


def require_exact_keys(
    value: Any,
    expected: set[str],
    *,
    label: str,
) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise AttestationError(f"{label} must be an object")
    actual = set(value)
    if actual != expected:
        raise AttestationError(
            f"{label} fields drift: expected {sorted(expected)}, got "
            f"{sorted(actual)}"
        )
    return value


def safe_relative_path(raw: Any, *, label: str) -> Path:
    path = Path(str(raw))
    if not path.parts or path.is_absolute() or ".." in path.parts:
        raise AttestationError(f"unsafe {label} path: {path}")
    return path


def validate_local_artifact(
    record: Any,
    *,
    base_dir: Path,
    label: str,
) -> dict[str, Any]:
    record = require_exact_keys(
        record,
        {"path", "sha256", "byte_count"},
        label=label,
    )
    path = base_dir / safe_relative_path(record["path"], label=label)
    try:
        package_tools.validate_expected_artifact(path, record, label=label)
    except package_tools.MaterializationError as exc:
        raise AttestationError(str(exc)) from exc
    except (KeyError, TypeError, ValueError) as exc:
        raise AttestationError(f"malformed {label} record") from exc
    return record


def validate_sorted_strings(
    value: Any,
    *,
    label: str,
    allow_empty: bool,
) -> list[str]:
    if (
        not isinstance(value, list)
        or any(not isinstance(item, str) or not item for item in value)
        or value != sorted(set(value))
        or (not allow_empty and not value)
    ):
        raise AttestationError(
            f"{label} must be a canonical sorted list of unique strings"
        )
    return value


def digest_payload(record: dict[str, Any]) -> dict[str, Any]:
    """Remove locations and the digest field, retaining all hashed evidence."""

    payload = {
        key: value
        for key, value in record.items()
        if key != "attestation_sha256"
    }
    return package_tools.without_provenance_paths(payload)


def canonical_attestation_digest(record: dict[str, Any]) -> str:
    payload = digest_payload(record)
    return hashlib.sha256(
        json.dumps(
            payload,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    ).hexdigest()


def validate_replay_record(
    record: Any,
    *,
    base_dir: Path,
) -> str:
    """Validate supplied replay evidence and return its canonical digest."""

    if not isinstance(record, dict):
        raise AttestationError("replay record must be an object")
    expected_keys = BASE_KEYS | (
        {"attestation_sha256"} if "attestation_sha256" in record else set()
    )
    require_exact_keys(record, expected_keys, label="replay record")
    if record["schema"] != SCHEMA:
        raise AttestationError(f"unexpected attestation schema: {record['schema']!r}")
    base_dir = base_dir.resolve()

    package = require_exact_keys(
        record["package"],
        {"path", "package_sha256"},
        label="package",
    )
    package_dir = base_dir / safe_relative_path(package["path"], label="package")
    try:
        manifest = package_tools.verify_package(package_dir)
    except package_tools.MaterializationError as exc:
        raise AttestationError(str(exc)) from exc
    if package["package_sha256"] != manifest["package_sha256"]:
        raise AttestationError("supplied package SHA-256 does not match package")

    checker = validate_local_artifact(
        record["checker"],
        base_dir=base_dir,
        label="Lean checker",
    )
    if not isinstance(checker["sha256"], str) or len(checker["sha256"]) != 64:
        raise AttestationError("malformed Lean checker SHA-256")
    tools = manifest.get("tools")
    if not isinstance(tools, dict):
        raise AttestationError("package manifest has no tools object")
    manifest_checker = tools.get("lean_checker")
    if not isinstance(manifest_checker, dict):
        raise AttestationError(
            "package manifest has no bound Lean checker artifact"
        )
    try:
        expected_checker = {
            "sha256": manifest_checker["sha256"],
            "byte_count": manifest_checker["byte_count"],
        }
    except KeyError as exc:
        raise AttestationError(
            "package manifest has a malformed Lean checker artifact"
        ) from exc
    supplied_checker = {
        "sha256": checker["sha256"],
        "byte_count": checker["byte_count"],
    }
    if supplied_checker != expected_checker:
        raise AttestationError(
            "supplied Lean checker does not match package manifest"
        )

    replay_inputs = require_exact_keys(
        record["replay_inputs"],
        set(manifest["artifacts"]),
        label="replay inputs",
    )
    for label, package_record in manifest["artifacts"].items():
        replay_record = require_exact_keys(
            replay_inputs[label],
            {"sha256", "byte_count"},
            label=f"replay input {label}",
        )
        expected = {
            "sha256": package_record["sha256"],
            "byte_count": package_record["byte_count"],
        }
        if replay_record != expected:
            raise AttestationError(f"replay input artifact drift: {label}")

    theorem = record["theorem"]
    if not isinstance(theorem, str) or LEAN_NAME.fullmatch(theorem) is None:
        raise AttestationError("theorem must be a fully qualified Lean name")

    result = require_exact_keys(
        record["result"],
        {"status", "invocation", "report"},
        label="result",
    )
    if result["status"] != "PASS":
        raise AttestationError("supplied replay result is not PASS")
    if not isinstance(result["invocation"], str) or not result["invocation"]:
        raise AttestationError("replay invocation must be nonempty")
    validate_local_artifact(
        result["report"],
        base_dir=base_dir,
        label="replay report",
    )

    audit = require_exact_keys(
        record["axiom_audit"],
        {
            "status",
            "theorem",
            "invocation",
            "observed_axioms",
            "forbidden_axioms_absent",
            "report",
        },
        label="axiom audit",
    )
    if audit["status"] != "PASS":
        raise AttestationError("supplied axiom audit is not PASS")
    if audit["theorem"] != theorem:
        raise AttestationError("axiom audit theorem does not match replay theorem")
    if not isinstance(audit["invocation"], str) or not audit["invocation"]:
        raise AttestationError("axiom-audit invocation must be nonempty")
    observed = validate_sorted_strings(
        audit["observed_axioms"],
        label="observed axioms",
        allow_empty=True,
    )
    forbidden = validate_sorted_strings(
        audit["forbidden_axioms_absent"],
        label="forbidden axioms",
        allow_empty=False,
    )
    if "sorryAx" not in forbidden:
        raise AttestationError("axiom audit must explicitly exclude sorryAx")
    if set(observed) & set(forbidden):
        raise AttestationError("an observed axiom is claimed absent")
    validate_local_artifact(
        audit["report"],
        base_dir=base_dir,
        label="axiom-audit report",
    )

    digest = canonical_attestation_digest(record)
    supplied_digest = record.get("attestation_sha256")
    if supplied_digest is not None and supplied_digest != digest:
        raise AttestationError("attestation SHA-256 drift")
    return digest


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--record", required=True, type=Path)
    args = parser.parse_args()
    record_path = args.record.resolve()
    try:
        record = json.loads(record_path.read_text(encoding="utf-8"))
        digest = validate_replay_record(record, base_dir=record_path.parent)
    except (OSError, json.JSONDecodeError, AttestationError) as exc:
        parser.error(str(exc))
    print(
        json.dumps(
            {
                "status": "SUPPLIED REPLAY RECORD VALIDATED",
                "attestation_sha256": digest,
                "digest_was_supplied": "attestation_sha256" in record,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
