from __future__ import annotations

import sys
from pathlib import Path

import pytest
import z3

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import round5_rich_kalmanson_cegar_v28 as v28


def test_equality_records_emit_all_six_pairs_with_boolean_support() -> None:
    ctx = z3.Context()
    support = ({"apex_index": 2, "apex": 14, "class": 1, "points": [4, 8, 10, 12]},)
    records = v28.equality_records(support, ctx)
    assert len(records) == 6
    assert records[0]["membership_pair"] == ["rich_2_1_4", "rich_2_1_8"]
    assert records[0]["sexpr"] == "(= d_4_14 d_8_14)"


def test_generalized_clause_blocks_exactly_the_supporting_memberships() -> None:
    ctx = z3.Context()
    core = (
        {"kind": "equality", "membership_pair": ["rich_0_0_1", "rich_0_0_3"]},
        {"kind": "equality", "membership_pair": ["rich_1_0_1", "rich_1_0_2"]},
        {"kind": "kalmanson"},
    )
    clause, names = v28.generalized_clause(core, ctx)
    assert names == ["rich_0_0_1", "rich_0_0_3", "rich_1_0_1", "rich_1_0_2"]
    solver = z3.Solver(ctx=ctx)
    solver.add(*(z3.Bool(name, ctx=ctx) for name in names), clause)
    assert solver.check() == z3.unsat


def test_schema_match_recognizes_cyclic_rotation() -> None:
    # Template 013_412_523 mapped through roles 0..5 -> this cyclic rotation.
    sequence = [4, 7, 12, 8, 9, 10]
    triples = ((0, 1, 3), (4, 1, 2), (5, 2, 3))
    core = [
        {"kind": "equality", "center": sequence[c], "endpoints": [sequence[x], sequence[y]]}
        for c, x, y in triples
    ]
    matches = v28.schema_matches(core)
    assert any(item["theorem"].endswith("013_412_523") for item in matches)


def test_independent_replay_checks_deletion_minimality() -> None:
    core = (
        {"id": "lo", "sexpr": "(>= x 1.0)"},
        {"id": "hi", "sexpr": "(<= x 0.0)"},
    )
    replay = v28.independent_replay(core, timeout_ms=10_000, seed=1)
    assert replay["status"] == "unsat"
    assert replay["deletion_minimal_replayed"] is True
    assert all(item["status"] == "sat" for item in replay["deletion_checks"])


def test_paired_replay_disagreement_cannot_admit(monkeypatch) -> None:
    answers = iter((
        {"status": "unsat", "deletion_minimal_replayed": True, "formula_sha256": "a", "core_ids_sha256": "ids"},
        {"status": "unsat", "deletion_minimal_replayed": True, "formula_sha256": "b", "core_ids_sha256": "ids"},
    ))
    monkeypatch.setattr(v28, "independent_replay", lambda *_args, **_kwargs: next(answers))
    result = v28.paired_independent_replay((), timeout_ms=1, seed=1)
    assert result["status"] == "paired_replay_fail_closed"
    assert result["admitted"] is False


def test_paired_fresh_raw_replay_disagreement_cannot_admit(monkeypatch, tmp_path: Path) -> None:
    common = {
        "status": "unsat", "deletion_minimal_replayed": True,
        "formula_sha256": "formula", "core_ids_sha256": "ids",
        "raw_blob_sha256": "blob", "raw_formula_sha256": "raw",
        "raw_assertions_sha256": "assertions",
    }
    answers = iter((
        {**common, "raw_core_reconstruction_sha256": "exploratory-corruption"},
        {**common, "raw_core_reconstruction_sha256": "fresh-source"},
    ))
    monkeypatch.setattr(v28, "fresh_raw_core_replay", lambda *_args, **_kwargs: next(answers))
    result = v28.paired_fresh_raw_core_replay(
        (), tmp_path / "raw.gz", "raw", timeout_ms=1, seed=1
    )
    assert result["fresh_raw_parse_count"] == 2
    assert result["status"] == "paired_replay_fail_closed"
    assert result["admitted"] is False


def test_output_writer_refuses_overwrite(tmp_path: Path) -> None:
    existing = tmp_path / "result.json"
    existing.write_text("occupied")
    with pytest.raises(FileExistsError, match="refusing to overwrite"):
        v28.write_outputs({}, existing, tmp_path / "report.md", tmp_path / "manifest.json")
