"""Focused custody tests for the Balanced555 PiQD source adapter."""

from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import scripts.materialize_checkpointed_rup as rup
import scripts.prepare_balanced555_piqd_rup_source as subject


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _fixture(tmp_path: Path, proof: str = "3 1 0 1 0\n4 0 3 0\n") -> tuple[Path, Path, Path]:
    cnf = tmp_path / "raw.cnf"
    cnf.write_text("p cnf 2 2\n1 0\n2 0\n", encoding="ascii")
    lrat = tmp_path / "proof.lrat"
    lrat.write_text(proof, encoding="ascii")
    export = tmp_path / "export"
    export.mkdir()
    (export / "cnf").write_bytes(cnf.read_bytes())
    (export / "lrat").write_bytes(lrat.read_bytes())
    (export / "status.json").write_text(
        json.dumps(
            {
                "status": "completed",
                "result": "UNSAT",
                "artifacts": {
                    "cnf": {"path": "cnf", "sha256": _sha256(export / "cnf")},
                    "proof": {"path": "lrat", "sha256": _sha256(export / "lrat")},
                },
            }
        ),
        encoding="utf-8",
    )
    return export, cnf, lrat


@pytest.fixture()
def tiny_contract(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(subject, "EXPECTED_VARIABLE_COUNT", 2)
    monkeypatch.setattr(subject, "EXPECTED_CLAUSE_COUNT", 2)
    monkeypatch.setattr(subject, "FIRST_ADDITION_ID", 3)


def test_completed_export_publishes_generic_source(
    tmp_path: Path, tiny_contract: None
) -> None:
    export, _, _ = _fixture(tmp_path)
    output = tmp_path / "source"
    receipt = subject.prepare_balanced555_piqd_rup_source(output, export_dir=export)
    assert receipt["normalization"]["additions"] == 2
    manifest = json.loads((output / "source-manifest.json").read_text())
    rup.load_source_manifest(output / "source-manifest.json")
    assert manifest["schema"] == rup.PURE_RUP_SOURCE_SCHEMA
    assert (output / "normalized.lrat").read_text() == "3 1 0 1 0\n4 0 3 0\n"


def test_rat_hint_is_rejected_and_output_is_not_published(
    tmp_path: Path, tiny_contract: None
) -> None:
    export, _, _ = _fixture(tmp_path, "3 1 0 -1 0\n4 0 3 0\n")
    output = tmp_path / "source"
    with pytest.raises(subject.Balanced555PiqdRupError, match="RUP hint"):
        subject.prepare_balanced555_piqd_rup_source(output, export_dir=export)
    assert not output.exists()


def test_explicit_hash_contract_rejects_mismatch(tmp_path: Path, tiny_contract: None) -> None:
    _, cnf, lrat = _fixture(tmp_path)
    output = tmp_path / "source"
    with pytest.raises(subject.Balanced555PiqdRupError, match="CNF SHA-256 mismatch"):
        subject.prepare_balanced555_piqd_rup_source(
            output,
            cnf_path=cnf,
            lrat_path=lrat,
            expected_cnf_sha256="0" * 64,
            expected_lrat_sha256=_sha256(lrat),
        )
    assert not output.exists()


def test_metadata_path_escape_is_rejected(tmp_path: Path, tiny_contract: None) -> None:
    export, _, _ = _fixture(tmp_path)
    status = export / "status.json"
    payload = json.loads(status.read_text())
    payload["artifacts"]["cnf"]["path"] = "../outside.cnf"
    status.write_text(json.dumps(payload), encoding="utf-8")
    with pytest.raises(subject.Balanced555PiqdRupError, match="escapes export"):
        subject.prepare_balanced555_piqd_rup_source(tmp_path / "source", export_dir=export)


def test_malformed_json_is_rejected(tmp_path: Path, tiny_contract: None) -> None:
    export, _, _ = _fixture(tmp_path)
    (export / "status.json").write_text('{"status":"completed",', encoding="utf-8")
    with pytest.raises(subject.Balanced555PiqdRupError, match="malformed status JSON"):
        subject.prepare_balanced555_piqd_rup_source(tmp_path / "source", export_dir=export)
