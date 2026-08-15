from __future__ import annotations

import json
import shutil
from pathlib import Path

import generate_exact17_forty_sixth_wave_mine as mine
import pytest


def test_terminal_wave_has_nine_union_support_representatives_and_eleven_certificates() -> (
    None
):
    records, representatives, audit = mine.collect_mine()
    assert len(records) == 13
    assert audit["full_unique_count"] == 11
    assert audit["support_unique_count"] == 9
    assert [record["cell_id"] for record in representatives] == list(
        mine.REPRESENTATIVE_CELLS
    )
    assert sum(record["forward_reflected_support_equal"] for record in records) == 9
    assert sum(not record["forward_reflected_support_equal"] for record in records) == 4
    assert all(record["occurrence"]["forward_data"]["terms"] for record in records)
    assert all(record["occurrence"]["reverse_data"]["pairings"] for record in records)


def test_generator_writes_ledger_and_lean_without_sorry(tmp_path: Path) -> None:
    output_lean = tmp_path / "BlockerVExactSeventeenFortySixthModelRefinements.lean"
    output_ledger = tmp_path / "child45-wave-occurrence-ledger.json"
    ledger = mine.generate(output_lean=output_lean, output_ledger=output_ledger)
    assert ledger["audit"]["full_unique_count"] == 11
    assert ledger["audit"]["support_unique_count"] == 9
    assert ledger["new_root"]["new_clauses"] == 36
    assert len(ledger["full_certificate_records"]) == 11
    assert len(ledger["cell_provenance"]) == 13
    assert ledger["status"] == "AUTHENTICATED_PROMOTABLE"
    assert not Path(ledger["input"]["path"]).is_absolute()
    assert ledger["receipt"]["sha256"] == mine.RECEIPT_SHA256
    assert ledger["terminal_envelope"]["sha256"] == mine.TERMINAL_ENVELOPE_SHA256
    assert ledger["predecessor"]["sha256"] == mine.FORTYFIFTH_SOURCE_SHA256
    assert (
        ledger["inherited_support_census"]["sha256"]
        == mine.INHERITED_SUPPORT_CENSUS_SHA256
    )
    source = output_lean.read_text(encoding="utf-8")
    assert "extendedFortySixthModelRefinementsCnf_length" in source
    assert "= 5848864" in source
    assert "sorry" not in source
    assert json.loads(output_ledger.read_text(encoding="utf-8"))["schema"].endswith(
        "/v1"
    )


def test_generator_rejects_nonterminal_summary(tmp_path: Path) -> None:
    payload = json.loads(mine.INPUT_PATH.read_text(encoding="utf-8"))
    payload["summary"]["sat"] = 12
    mutated = tmp_path / "mutated-output.json"
    mutated.write_text(json.dumps(payload), encoding="utf-8")
    with pytest.raises(ValueError, match="receipt hash|envelope hash"):
        mine.collect_mine(mutated)


def test_tampered_receipt_is_rejected(tmp_path: Path) -> None:
    tampered = tmp_path / "receipt.json"
    tampered.write_bytes(mine.RECEIPT_PATH.read_bytes() + b"\n")
    with pytest.raises(ValueError, match="receipt hash"):
        mine._validate_receipt(tampered)


def test_crossed_envelope_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    crossed = tmp_path / "envelope.json"
    payload = json.loads(mine.INPUT_PATH.read_text(encoding="utf-8"))
    payload["envelope_sha256"] = "0" * 64
    crossed.write_text(json.dumps(payload), encoding="utf-8")
    monkeypatch.setattr(mine, "_validate_receipt", lambda _path: {})
    with pytest.raises(ValueError, match="envelope hash"):
        mine._validate_authenticated_envelope(crossed, mine.RECEIPT_PATH)


def test_mutated_predecessor_and_support_census_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original_predecessor = mine.PARENT_LEAN
    predecessor = tmp_path / "FortyFifth.lean"
    shutil.copyfile(original_predecessor, predecessor)
    predecessor.write_text(
        predecessor.read_text(encoding="utf-8") + "\n", encoding="utf-8"
    )
    monkeypatch.setattr(mine, "PARENT_LEAN", predecessor)
    monkeypatch.setattr(mine, "_validate_authenticated_envelope", lambda *_paths: {})
    with pytest.raises(ValueError, match="predecessor source identity"):
        mine.collect_mine()

    monkeypatch.setattr(mine, "PARENT_LEAN", original_predecessor)
    original = mine._inherited_support_census
    monkeypatch.setattr(mine, "_inherited_support_census", lambda: original()[:-1])
    with pytest.raises(ValueError, match="support census"):
        mine._inherited_supports()


def test_mutated_predecessor_export_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(mine, "_validate_authenticated_envelope", lambda *_paths: {})
    monkeypatch.setattr(mine, "FORTYFIFTH_EXPORT_SHA256", "0" * 64)
    with pytest.raises(ValueError, match="predecessor export identity"):
        mine.collect_mine()


def test_both_evidence_digests_are_required() -> None:
    payload = mine._load_json(mine.INPUT_PATH)
    cell = json.loads(json.dumps(payload["cells"][0]))
    cell["semantic_replay"]["result"]["kalmanson"]["exact_evidence_sha256"] = "0" * 64
    with pytest.raises(ValueError, match="exact evidence hash"):
        mine._validate_occurrence(cell)
