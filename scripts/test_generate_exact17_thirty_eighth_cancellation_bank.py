from __future__ import annotations

import hashlib

import generate_exact17_thirty_eighth_cancellation_bank as bank
import pytest


def test_authenticated_child38_bank_has_28_subset_minimal_six_hit_occurrences() -> None:
    entries, ledger_entries = bank.derive_entries()
    assert len(entries) == 28
    assert len(ledger_entries) == 28
    assert all(entry.count("{ hits :=") == 1 for entry in entries)


def test_authenticated_child38_bank_freezes_the_full_census() -> None:
    payload = bank.load_model()
    rows = bank.decode_rows(payload)
    forward = bank.producer_bank.enumerate_two_kalmanson_cancellations(
        rows, bank.N, bank.ORDERS[1], max_cores=100_000
    )
    reverse = bank.producer_bank.enumerate_two_kalmanson_cancellations(
        rows, bank.N, tuple(reversed(bank.ORDERS[1])), max_cores=100_000
    )
    supports = {bank.path_hits(record) for record in forward}
    minimal = [hits for hits in supports if not any(other < hits for other in supports)]
    assert len(forward) == bank.FORWARD_RECORDS
    assert len(reverse) == bank.REVERSE_RECORDS
    assert len(supports) == bank.DISTINCT_SUPPORTS
    assert len(minimal) == bank.SUBSET_MINIMAL_SUPPORTS
    assert sum(len(hits) == 6 for hits in minimal) == bank.OCCURRENCES


def test_authenticated_sources_and_replay_pins_are_stable() -> None:
    payload = bank.load_model()
    assert payload["cnf_sha256"] == bank.CNF_SHA256
    assert payload["replay"] == {"clauses_checked": bank.PARENT_CLAUSES, "satisfies_all": True}
    assert hashlib.sha256(bank.ANALYSIS.read_bytes()).hexdigest() == bank.ANALYSIS_SHA256


def test_generator_rejects_model_pin_drift(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(bank, "MODEL_SHA256", "0" * 64)
    with pytest.raises(ValueError, match="source pin drifted"):
        bank.load_model()


def test_emitted_bank_has_four_shards_and_no_sorry() -> None:
    paths = [
        bank.OUT / f"BlockerVExactSeventeenThirtyEighthModelRefinementsShard{i}.lean"
        for i in range(bank.SHARDS)
    ]
    paths.append(bank.OUT / "BlockerVExactSeventeenThirtyEighthModelRefinements.lean")
    assert all(path.is_file() for path in paths)
    assert all("sorry" not in path.read_text(encoding="utf-8") for path in paths)
    assert sum(path.read_text(encoding="utf-8").count("{ hits :=") for path in paths[:4]) == 28
