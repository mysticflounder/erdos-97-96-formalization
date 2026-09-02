from __future__ import annotations

import hashlib
import json
import sys
import tempfile
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import scripts.generate_balanced555_finite_cnf as subject


@pytest.mark.parametrize("orientation", ["direct", "mirror"])
def test_variable_bijection_and_roundtrip(orientation: str) -> None:
    assert subject.labels_for_orientation(orientation).surplus == 0
    values = [subject.variable(c, p) for c in range(12) for p in range(12) if c != p]
    assert values == list(range(1, 133))
    assert len(set(values)) == 132
    for value in values:
        decoded = subject.decode_variable(value)
        assert decoded[0] == "row"
        assert subject.variable(decoded[1], decoded[2]) == value
        assert decoded[1] != decoded[2]
    for name, value in {**subject.ROLE_VARS, **subject.MIDDLE_VARS}.items():
        assert subject.decode_variable(value) == ("role", name)


@pytest.mark.parametrize("orientation", ["direct", "mirror"])
def test_local_domains_and_roots(orientation: str) -> None:
    domains = subject.local_domains(orientation)
    assert sorted(len(domain) for domain in domains.values()) == [56, 56, 56] + [301] * 9
    assert len(subject.root_keys(orientation)) == 1656


def test_kalmanson_raw_and_effective_counts() -> None:
    raw = {name: pair[0] for name, pair in subject.KALMANSON_COUNTS.items()}
    effective = {name: pair[1] for name, pair in subject.KALMANSON_COUNTS.items()}
    assert raw == {"S5A": 7920, "S5B": 7920, "S6A": 11088, "S6B": 11088, "S6C": 11088}
    assert effective == {"S5A": 6006, "S5B": 6630, "S6A": 8694, "S6B": 8244, "S6C": 9408}
    kal, _ = subject._kalmanson_clauses()
    actual = {name: sum(clause.schema == name for clause in kal) for name in subject.KALMANSON_COUNTS}
    assert actual == effective
    assert sum(raw.values()) == 49104
    assert sum(effective.values()) == 38982
    for clause in kal:
        assert clause.occurrence is not None
        assert clause.literals == tuple(
            -subject.variable(center, point)
            for center, points in clause.occurrence.row_requirements
            for point in points
        )
        assert len(clause.occurrence.ordered_rows) == 2
        assert {kind for kind, _points in clause.occurrence.ordered_rows} <= {1, 2}


@pytest.mark.parametrize("orientation", ["direct", "mirror"])
def test_clause_counts_and_positive_control(orientation: str) -> None:
    clauses = subject.clauses_for_orientation(orientation)
    assert len(clauses) == 50113
    assert len({clause.literals for clause in clauses}) == 50113
    counts: dict[str, int] = {}
    for clause in clauses:
        counts[clause.family] = counts.get(clause.family, 0) + 1
    assert counts == {
        "shared_alternation": 1980,
        "cover": 660,
        "intersection": 656,
        "tight_membership": 144,
        "row_card_at_most": 5544,
        "row_card_at_least": 1980,
        "cap_upper": 60,
        "apex_opposite_interior": 9,
        "apex_adjacent_cap": 36,
        "role_exact_one": 16,
        "middle_exact_one": 46,
        "kalmanson": 38982,
    }
    assignment = subject.positive_assignment(orientation)
    controlled = [
        clause
        for clause in clauses
        if clause.family not in {"kalmanson", "shared_alternation"}
    ]
    assert all(
        subject.clause_satisfied(clause, assignment)
        for clause in controlled
    )
    assert not all(subject.clause_satisfied(clause, assignment - {133}) for clause in controlled)
    assert not all(subject.clause_satisfied(clause, assignment | {134}) for clause in controlled)


def test_determinism_and_dimacs_roundtrip() -> None:
    direct = subject.clauses_for_orientation("direct")
    again = subject.clauses_for_orientation("direct")
    assert direct == again
    payload = subject.dimacs_bytes(direct)
    lines = payload.decode("ascii").splitlines()
    assert lines[0] == "p cnf 148 50113"
    parsed = [tuple(map(int, line.split()[:-1])) for line in lines[1:]]
    assert len(parsed) == 50113
    assert parsed == [clause.literals for clause in direct]
    assert hashlib.sha256(payload).hexdigest() == hashlib.sha256(subject.dimacs_bytes(again)).hexdigest()


@pytest.mark.parametrize("orientation", ["direct", "mirror"])
def test_structural_positive_control(orientation: str) -> None:
    clauses, assignment = subject.structural_positive_control(orientation)
    assert len(clauses) == 9151
    assert {clause.family for clause in clauses}.isdisjoint({"kalmanson", "shared_alternation"})
    assert all(subject.clause_satisfied(clause, assignment) for clause in clauses)


def test_manifest_and_output_contract_is_sparse_by_default(capsys: pytest.CaptureFixture[str]) -> None:
    with tempfile.TemporaryDirectory() as tmp:
        cnf, ledger_path, manifest_path, manifest = subject.generate(Path(tmp), "direct")
        assert cnf.exists() and ledger_path.exists() and manifest_path.exists()
        assert manifest["clause_count"] == 50113
        loaded = json.loads(manifest_path.read_text(encoding="utf-8"))
        assert loaded["cnf_sha256"] == hashlib.sha256(cnf.read_bytes()).hexdigest()
        assert loaded["clause_ledger"]["row_count"] == 50113
        assert loaded["clause_ledger"]["sha256"] == hashlib.sha256(ledger_path.read_bytes()).hexdigest()
        assert sum(1 for _line in ledger_path.open(encoding="utf-8")) == 50113
        control_cnf, witness_path, control_manifest_path, control_manifest = (
            subject.generate_structural_positive_control(Path(tmp), "mirror")
        )
        assert control_manifest["expected_status"] == "SAT"
        assert control_manifest["clause_count"] == 9151
        assert control_manifest["cnf_sha256"] == hashlib.sha256(control_cnf.read_bytes()).hexdigest()
        assert control_manifest["witness_sha256"] == hashlib.sha256(witness_path.read_bytes()).hexdigest()
        assert control_manifest_path.exists()
    assert capsys.readouterr().out == ""


def test_invalid_orientation_and_output_path() -> None:
    with pytest.raises(subject.Balanced555GenerationError, match="invalid orientation"):
        subject.labels_for_orientation("sideways")  # type: ignore[arg-type]
    with tempfile.TemporaryDirectory() as tmp:
        path = Path(tmp) / "file"
        path.write_text("x", encoding="utf-8")
        with pytest.raises(subject.Balanced555GenerationError, match="not a directory"):
            subject.generate(path, "direct")
