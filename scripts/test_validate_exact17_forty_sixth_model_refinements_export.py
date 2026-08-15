from __future__ import annotations

import json
from pathlib import Path

import pytest
import validate_exact17_forty_sixth_model_refinements_export as validator


def _write_fixture(
    parent: Path, child: Path, *, drop_last_parent_clause: bool = False
) -> None:
    prefix = ["1 0", "-1 0"]
    if drop_last_parent_clause:
        prefix = prefix[:1]
    parent.write_text("p cnf 2 2\n" + "\n".join(prefix) + "\n", encoding="ascii")
    child.write_text("p cnf 2 3\n1 0\n-1 0\n2 0\n", encoding="ascii")


def test_stream_consumes_all_parent_clauses(tmp_path: Path) -> None:
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    _write_fixture(parent, child)
    parent_sha, child_sha, parent_bytes, child_bytes, parent_subsumed = (
        validator._stream_export(
            parent,
            child,
            ((2,),),
            variables=2,
            parent_clauses=2,
            child_clauses=3,
            expected_parent_subsumed=(),
        )
    )
    assert len(parent_sha) == 64
    assert len(child_sha) == 64
    assert parent_bytes == parent.stat().st_size
    assert child_bytes == child.stat().st_size
    assert parent_subsumed == ()


def test_stream_rejects_missing_last_parent_clause(tmp_path: Path) -> None:
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    _write_fixture(parent, child, drop_last_parent_clause=True)
    with pytest.raises(ValueError, match="prefix|extra"):
        validator._stream_export(
            parent,
            child,
            ((2,),),
            variables=2,
            parent_clauses=2,
            child_clauses=3,
            expected_parent_subsumed=(),
        )


def test_stream_rejects_symlinked_custody_path(tmp_path: Path) -> None:
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    _write_fixture(parent, child)
    link = tmp_path / "child-link.cnf"
    link.symlink_to(child)
    with pytest.raises(ValueError, match="normalized|exclusive regular"):
        validator._stream_export(
            parent,
            link,
            ((2,),),
            variables=2,
            parent_clauses=2,
            child_clauses=3,
            expected_parent_subsumed=(),
        )


def test_mutated_ledger_dedup_policy_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    ledger = json.loads(validator.LEDGER_PATH.read_text(encoding="utf-8"))
    ledger["support_dedup"]["representatives"] = list(
        reversed(ledger["support_dedup"]["representatives"])
    )
    mutated = tmp_path / "ledger.json"
    mutated.write_text(json.dumps(ledger), encoding="utf-8")
    monkeypatch.setattr(validator, "LEDGER_PATH", mutated)
    monkeypatch.setattr(validator, "LEDGER_SHA256", validator.sha256_file(mutated))
    with pytest.raises(ValueError, match="representative order"):
        validator._expected_suffix()


def test_mutated_ledger_hash_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    mutated = tmp_path / "ledger.json"
    mutated.write_bytes(validator.LEDGER_PATH.read_bytes() + b"\n")
    monkeypatch.setattr(validator, "LEDGER_PATH", mutated)
    with pytest.raises(ValueError, match="ledger hash"):
        validator._expected_suffix()


def test_unprovisioned_child_identity_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(validator, "CHILD_SHA256", None)
    with pytest.raises(ValueError, match="Child46 hash/bytes are not provisioned"):
        validator.validate_export()


def test_authenticated_models_reject_all_nine_nonredundant_cuts() -> None:
    audits, cut_indices = validator._authenticated_model_rejections(
        validator._expected_suffix()
    )
    assert len(audits) == 13
    assert cut_indices == validator.AUTHENTICATED_MODEL_CUT_SUFFIX_INDICES
    assert set(cut_indices).isdisjoint(validator.PARENT_SUBSUMED_SUFFIX_INDICES)
    assert [row["required_rejected_suffix_index"] for row in audits] == [
        1,
        5,
        9,
        13,
        17,
        21,
        25,
        25,
        25,
        29,
        29,
        29,
        33,
    ]
