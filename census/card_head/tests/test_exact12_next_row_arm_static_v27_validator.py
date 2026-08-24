"""Adversarial unit tests for the independent v27 validator boundary."""

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path

import pytest

from census.card_head import exact12_next_row_arm_static_v27_validator as validator
from census.card_head.exact12_next_row_arm_static_v27_validator import (
    V27ValidationError,
    _assignment,
    _dimacs,
    _read,
    _receipt_server_job_identity,
    _replay,
    _validate_custody_receipt_binding,
    _validate_live_sources,
    _validate_receipt_flags,
    _validate_receipt_outcome,
)


def test_root_job_hash_distinguishes_compact_and_producer_pretty_json() -> None:
    value = {"b": 2, "a": {"z": "é", "x": 1}}
    compact = validator.sha256_json(value)
    producer_bytes = (json.dumps(value, sort_keys=True, indent=2) + "\n").encode("utf-8")
    producer_pretty = validator._producer_pretty_json_sha256(value)
    assert producer_pretty == hashlib.sha256(producer_bytes).hexdigest()
    assert producer_pretty != compact


def test_survivor_assignment_hash_matches_producer_pretty_json_contract() -> None:
    assignment = [1, 7, 42]
    assert validator._producer_pretty_json_sha256(assignment) != validator.sha256_json(assignment)


def test_descriptor_filename_hash_includes_producer_trailing_lf() -> None:
    raw = b'{"schema":"v1"}\n'
    assert validator._descriptor_file_sha256(raw) == hashlib.sha256(raw).hexdigest()
    assert validator._descriptor_file_sha256(raw) != hashlib.sha256(raw[:-1]).hexdigest()


def test_descriptor_claims_use_descriptor_contract_not_receipt_contract() -> None:
    claims = {key: False for key in validator._DESCRIPTOR_FALSE_CLAIMS}
    validator._false_claims(claims, "descriptor.claims", validator._DESCRIPTOR_FALSE_CLAIMS)
    with pytest.raises(V27ValidationError, match="missing or extra claim"):
        validator._false_claims(claims, "descriptor.claims")


def test_post_arm_identity_digest_matches_immutable_canary_contract() -> None:
    assert len(validator.EXPECTED_POST_ARM_SHA256) == 64
    assert validator.EXPECTED_POST_ARM_SHA256 == (
        "8f072d08ada262fcb3ba98012a5fc638297c681509e8355e04dadd4dd350d2d3"
    )


def test_v15_summary_promotion_fields_are_frozen_constants() -> None:
    assert validator.RUN_SCHEMA == (
        "p97_rigid221_exact12_next_row_arm_static_canary_run.v15"
    )
    assert validator.LEAN_INGRESS_THEOREM == (
        "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
        "FullMembershipPrefixTerminalConsumer."
        "false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank"
    )
    assert validator.TERMINAL_STATUS == (
        "UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE"
    )
    assert {"lean_ingress_theorem", "terminal_promotion_status"} <= validator._SUMMARY_KEYS
    assert (
        "second_opposite_triple_surplus_first_opposite_three_triad_family_bank"
        in validator._BANK_KEYS
    )
    assert "all_order_common_five_family_bank" in validator._BANK_KEYS
    assert (
        "center_exchange_all_order_common_five_family_bank"
        in validator._BANK_KEYS
    )
    assert (
        "core_pair_all_order_common_five_family_bank"
        in validator._BANK_KEYS
    )
    assert len(validator._BANK_KEYS) == 23
    assert "physical_class_cut_bank" in validator._ARTIFACT_KEYS
    assert "physical_class_cut_installation" in validator._ARTIFACT_KEYS
    assert validator.EXPECTED_CLASS_CUT_CLAUSES == 229
    assert validator.EXPECTED_CLASS_CUT_SHA256 == (
        "4ee8e46a036c04d3065f0b87160e23bdf21479f3021409ab2518cc25529ebb2c"
    )
    assert validator.EXPECTED_POST_SOURCE_ORDER_CLAUSES == 704481
    assert validator.EXPECTED_POST_SOURCE_ORDER_SHA256 == (
        "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78"
    )
    assert validator.EXPECTED_FINAL_CLAUSES == 704710
    assert validator.EXPECTED_FINAL_SHA256 == (
        "8da06d5e45d1326fb256d3ca735a802c0bf942ce3e84f5df53125441526f2b5f"
    )


def test_receipt_job_id_is_the_piqd_server_identity_not_root_job_id() -> None:
    receipt = {
        "job_id": "52b5acb2-6ce2-4cfa-8b49-dc334c265f3e",
        "job_identity": {
            "job_id": "52b5acb2-6ce2-4cfa-8b49-dc334c265f3e",
        },
    }
    assert _receipt_server_job_identity(receipt)["job_id"] == receipt["job_id"]
    receipt["job_identity"]["job_id"] = "18ee49e2aae3d1642f8aef7f8bd20e60ddfd7b7f5c4dc7dd3885c1b40043af81"
    with pytest.raises(V27ValidationError, match="server job identity"):
        _receipt_server_job_identity(receipt)


def test_custody_receipt_identity_matches_producer_device_and_inode(tmp_path: Path) -> None:
    receipt_path = tmp_path / "solver-receipt.json"
    receipt_raw = b'{"schema":"v1"}\n'
    receipt_path.write_bytes(receipt_raw)
    info = os.stat(receipt_path)
    custody = {
        "receipt_sha256": "receipt-self-hash",
        "receipt_file_sha256": hashlib.sha256(receipt_raw).hexdigest(),
        "receipt_file_size": len(receipt_raw),
        "receipt_device": info.st_dev,
        "receipt_inode": info.st_ino,
    }
    _validate_custody_receipt_binding(custody, "receipt-self-hash", receipt_path, receipt_raw)
    assert {"receipt_device", "receipt_inode"} <= validator._CUSTODY_KEYS
    custody["receipt_inode"] += 1
    with pytest.raises(V27ValidationError, match="custody seal does not bind receipt"):
        _validate_custody_receipt_binding(custody, "receipt-self-hash", receipt_path, receipt_raw)


def test_survivor_classification_matches_static_cegar_non_admitted_contract() -> None:
    assert "UNADMITTED_STRUCTURAL_SURVIVOR" in validator._SURVIVOR_CLASSIFICATIONS
    assert "STATIC_CONVEX_INVARIANT_FAILED" in validator._SURVIVOR_CLASSIFICATIONS
    assert "SOURCE_ORDER_CUT" not in validator._SURVIVOR_CLASSIFICATIONS


def test_tampered_assignment_is_not_complete_or_replayable() -> None:
    with pytest.raises(V27ValidationError, match="duplicate|cover"):
        _assignment([1, 1, -3], 3)
    _, _, clauses = _dimacs(b"p cnf 2 1\n1 2 0\n", Path("discovery.cnf"))
    with pytest.raises(V27ValidationError, match="satisfy"):
        _replay(clauses, set())


def test_tampered_discovery_cnf_is_rejected() -> None:
    raw = b"p cnf 2 1\n1 0\n"
    variables, clauses, parsed = _dimacs(raw, Path("discovery.cnf"))
    assert (variables, clauses) == (2, 1)
    with pytest.raises(V27ValidationError, match="satisfy"):
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
    with pytest.raises(V27ValidationError, match="verdict/status"):
        _validate_receipt_outcome(receipt, "SAT")
    receipt["adapter_verdict"] = "SAT"
    receipt["proof_pointer"] = "elsewhere.drat"
    with pytest.raises(V27ValidationError, match="proof"):
        _validate_receipt_flags(receipt)
    receipt.pop("proof_pointer")
    receipt["proof_endpoint_called"] = True
    with pytest.raises(V27ValidationError, match="proof"):
        _validate_receipt_flags(receipt)


def test_tampered_live_source_manifest_fails_closed(tmp_path: Path) -> None:
    source = tmp_path / "source.py"
    source.write_bytes(b"original\n")
    manifest = [{
        "path": "source.py",
        "bytes": len(b"original\n"),
        "sha256": hashlib.sha256(b"tampered\n").hexdigest(),
    }]
    with pytest.raises(V27ValidationError, match="live source"):
        _validate_live_sources(tmp_path, manifest)


def test_direct_symlink_and_hardlink_controls_are_rejected(tmp_path: Path) -> None:
    real = tmp_path / "real.json"
    real.write_text(json.dumps({"ok": True}))
    symlink = tmp_path / "summary.json"
    symlink.symlink_to(real)
    with pytest.raises(V27ValidationError, match="regular|symlink|Too many"):
        _read(symlink)
    hardlink = tmp_path / "hardlink.json"
    os.link(real, hardlink)
    with pytest.raises(V27ValidationError, match="hard-linked"):
        _read(hardlink)


def test_parse_bounds_admit_the_live_banks_and_still_bind() -> None:
    # Largest live v26 artifact: 121,948,722 bytes over 4,794,571 JSON nodes.
    assert validator.MAX_JSON_BYTES == 192 * 1024 * 1024
    assert validator.MAX_JSON_NODES == 8_000_000
    assert validator.MAX_JSON_BYTES > 121_948_722
    assert validator.MAX_JSON_NODES > 4_794_571
    assert validator.MAX_JSON_BYTES < validator.MAX_FILE_BYTES
    assert validator.MAX_JSON_DEPTH == 96
    with pytest.raises(V27ValidationError, match="exceeds bounded size"):
        validator._json(b"0" * (validator.MAX_JSON_BYTES + 1), Path("oversize.json"))


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
