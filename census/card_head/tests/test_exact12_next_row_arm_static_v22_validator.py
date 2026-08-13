"""Adversarial unit tests for the independent v22 validator boundary."""

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path

import pytest

from census.card_head import exact12_next_row_arm_static_v22_validator as validator
from census.card_head.exact12_next_row_arm_static_v22_validator import (
    V22ValidationError,
    _assignment,
    _dimacs,
    _read,
    _replay,
    _validate_live_sources,
    _validate_receipt_flags,
    _validate_receipt_outcome,
)


def test_tampered_assignment_is_not_complete_or_replayable() -> None:
    with pytest.raises(V22ValidationError, match="duplicate|cover"):
        _assignment([1, 1, -3], 3)
    _, _, clauses = _dimacs(b"p cnf 2 1\n1 2 0\n", Path("discovery.cnf"))
    with pytest.raises(V22ValidationError, match="satisfy"):
        _replay(clauses, set())


def test_tampered_discovery_cnf_is_rejected() -> None:
    raw = b"p cnf 2 1\n1 0\n"
    variables, clauses, parsed = _dimacs(raw, Path("discovery.cnf"))
    assert (variables, clauses) == (2, 1)
    with pytest.raises(V22ValidationError, match="satisfy"):
        _replay(parsed, {2})


def test_tampered_proof_pointer_or_status_fails_closed() -> None:
    receipt = {
        "prepare_freshness_claimed": False,
        "proof_endpoint_called": False,
        "legacy_drat_proof_path_written": False,
        "certificate_blocker": "CERT-001",
        "claims": {key: False for key in (
            "source_entitlement", "theorem_coverage", "universal_lift",
            "lean_closure", "one_process", "one_core",
        )},
    }
    _validate_receipt_flags(receipt)
    receipt.update({"outcome": "STRUCTURAL_SAT", "adapter_verdict": "SAT", "adapter_returncode": 10})
    _validate_receipt_outcome(receipt, "SAT")
    receipt["adapter_verdict"] = "UNKNOWN"
    with pytest.raises(V22ValidationError, match="verdict/status"):
        _validate_receipt_outcome(receipt, "SAT")
    receipt["adapter_verdict"] = "SAT"
    receipt["proof_pointer"] = "elsewhere.drat"
    with pytest.raises(V22ValidationError, match="proof"):
        _validate_receipt_flags(receipt)
    receipt.pop("proof_pointer")
    receipt["proof_endpoint_called"] = True
    with pytest.raises(V22ValidationError, match="proof"):
        _validate_receipt_flags(receipt)


def test_tampered_live_source_manifest_fails_closed(tmp_path: Path) -> None:
    source = tmp_path / "source.py"
    source.write_bytes(b"original\n")
    manifest = [{
        "path": "source.py",
        "bytes": len(b"original\n"),
        "sha256": hashlib.sha256(b"tampered\n").hexdigest(),
    }]
    with pytest.raises(V22ValidationError, match="live source"):
        _validate_live_sources(tmp_path, manifest)


def test_direct_symlink_and_hardlink_controls_are_rejected(tmp_path: Path) -> None:
    real = tmp_path / "real.json"
    real.write_text(json.dumps({"ok": True}))
    symlink = tmp_path / "summary.json"
    symlink.symlink_to(real)
    with pytest.raises(V22ValidationError, match="regular|symlink|Too many"):
        _read(symlink)
    hardlink = tmp_path / "hardlink.json"
    os.link(real, hardlink)
    with pytest.raises(V22ValidationError, match="hard-linked"):
        _read(hardlink)


def test_drat_verifier_requires_exact_verified_line(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(validator.shutil, "which", lambda _name: "/usr/bin/drat-trim")

    def check(stdout: str, returncode: int) -> bool:
        monkeypatch.setattr(
            validator.subprocess,
            "run",
            lambda *_args, **_kwargs: validator.subprocess.CompletedProcess(
                args=[], returncode=returncode, stdout=stdout, stderr=""
            ),
        )
        return validator._verify_drat(Path("terminal.cnf"), Path("terminal.drat"))

    assert check("s VERIFIED\n", 0)
    assert not check("VERIFIED\n", 0)
    assert not check("s VERIFIED\n", 1)
