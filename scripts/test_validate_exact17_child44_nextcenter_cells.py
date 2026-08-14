# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Adversarial tests for the design-only Child44 cell validator."""

from __future__ import annotations

import hashlib
from pathlib import Path

import pytest
import validate_exact17_child44_nextcenter_cells as subject


def design() -> dict[str, object]:
    return subject.load_json(subject.CELLS_PATH)


def test_authenticated_design_payload_is_exact() -> None:
    payload = design()
    subject.validate_payload(payload)
    report = subject.validate_design()
    assert report["status"] == subject.STATUS
    assert report["cells_checked"] == 13
    assert "result" not in report


def test_mutated_variable_mapping_is_rejected() -> None:
    payload = design()
    payload["variable_map"]["next_center_formula"] = "291 + center"  # type: ignore[index]
    with pytest.raises(ValueError, match="variable map"):
        subject.validate_payload(payload)


def test_missing_or_extra_cell_is_rejected() -> None:
    missing = design()
    missing["cells"] = missing["cells"][:-1]  # type: ignore[index]
    with pytest.raises(ValueError, match="cell count"):
        subject.validate_payload(missing)

    extra = design()
    extra["cells"].append(  # type: ignore[union-attr]
        {"id": "next-center-08", "next_center": 8, "assumptions": [298]}
    )
    with pytest.raises(ValueError, match="cell count"):
        subject.validate_payload(extra)


def test_wrong_old_center_exclusion_is_rejected() -> None:
    payload = design()
    payload["coverage"]["excluded_old_centers"] = [8, 9, 10, 12]  # type: ignore[index]
    with pytest.raises(ValueError, match="coverage contract"):
        subject.validate_payload(payload)


def test_cell_result_claim_is_rejected() -> None:
    payload = design()
    payload["cells"][0]["result"] = "UNSAT"  # type: ignore[index]
    with pytest.raises(ValueError, match="result claims"):
        subject.validate_payload(payload)


def test_duplicate_json_key_is_rejected(tmp_path: Path) -> None:
    path = tmp_path / "duplicate.json"
    path.write_text('{"schema":"one","schema":"two"}\n', encoding="utf-8")
    with pytest.raises(ValueError, match="duplicate JSON key: schema"):
        subject.load_json(path)


def _pure_parent_bytes() -> bytes:
    clauses = [tuple(range(290, 307))]
    clauses.extend(
        (-left, -right)
        for left in subject.NEXT_VARS
        for right in subject.NEXT_VARS
        if left < right
    )
    clauses.extend((-290 - label,) for label in subject.OLD_CENTERS)
    body = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode("ascii") for clause in clauses
    )
    return b"p cnf 308 141\n" + body


def test_parent_header_drift_is_rejected(monkeypatch: pytest.MonkeyPatch, tmp_path: Path) -> None:
    good = _pure_parent_bytes()
    path = tmp_path / "parent.cnf"
    path.write_bytes(good.replace(b"p cnf 308 141", b"p cnf 307 141", 1))
    monkeypatch.setattr(subject, "PARENT_PATH", path)
    monkeypatch.setattr(subject, "PARENT_CLAUSES", 141)
    monkeypatch.setattr(subject, "PARENT_BYTES", len(good))
    monkeypatch.setattr(subject, "PARENT_SHA256", hashlib.sha256(good).hexdigest())
    with pytest.raises(ValueError, match="header"):
        subject.validate_parent_cnf(path)


def test_parent_hash_drift_is_rejected() -> None:
    payload = design()
    payload["parent"]["root_sha256"] = "0" * 64  # type: ignore[index]
    with pytest.raises(ValueError, match="parent root hash"):
        subject.validate_payload(payload)
