from __future__ import annotations

import hashlib

import generate_exact17_fortieth_model_refinements as bank
import pytest


def test_authenticated_child40_bank_replays_exact_census() -> None:
    entries, ledger_entries = bank.derive_entries()
    assert len(entries) == bank.OCCURRENCES == 84
    assert len(ledger_entries) == bank.OCCURRENCES
    assert all(entry.count("{ hits :=") == 1 for entry in entries)
    assert all(len(entry["hits"]) >= 6 for entry in ledger_entries)


def test_authenticated_child40_sources_and_replay_pins_are_stable() -> None:
    payload = bank.load_model()
    assert payload["cnf_sha256"] == bank.PARENT_SHA256
    assert payload["replay"] == {
        "clauses_checked": bank.PARENT_CLAUSES,
        "satisfies_all": True,
    }
    assert hashlib.sha256(bank.ANALYSIS_PATH.read_bytes()).hexdigest() == (
        bank.ANALYSIS_SHA256
    )


def test_generator_rejects_model_pin_drift(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(bank, "MODEL_SHA256", "0" * 64)
    with pytest.raises(ValueError, match="model pin drifted"):
        bank.load_model()


def test_emitted_bank_has_twelve_shards_exporter_and_no_sorry() -> None:
    paths = [
        bank.OUT / f"BlockerVExactSeventeenFortiethModelRefinementsShard{i}.lean"
        for i in range(bank.SHARDS)
    ]
    paths.extend(
        [
            bank.OUT / "BlockerVExactSeventeenFortiethModelRefinements.lean",
            bank.OUT / "BlockerVExactSeventeenFortiethModelRefinementsExport.lean",
        ]
    )
    assert all(path.is_file() for path in paths)
    assert all("sorry" not in path.read_text(encoding="utf-8") for path in paths)
    assert sum(
        path.read_text(encoding="utf-8").count("{ hits :=")
        for path in paths[: bank.SHARDS]
    ) == bank.OCCURRENCES
