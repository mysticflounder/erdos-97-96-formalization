from __future__ import annotations

import copy
import importlib.util
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "generate_exact17_four_point_two_circle_v6_model_core_refinements.py"
)
SPEC = importlib.util.spec_from_file_location("four_point_v6_model_core", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


def _resign_candidate(candidate: dict[str, object]) -> None:
    candidate["candidate_id"] = MODULE.candidate_id(candidate)
    candidate["record_sha256"] = MODULE.self_hash(candidate, "record_sha256")


def _resign_ledger(ledger: dict[str, object]) -> None:
    ledger["manifest_sha256"] = MODULE.self_hash(ledger, "manifest_sha256")


def test_authenticated_ledger_selects_exactly_the_two_model_cores() -> None:
    assert MODULE.sha256_file(MODULE.LEDGER) == MODULE.LEDGER_SHA256 == (
        "ed2abfe2b9606875749bacd85d88dfd953c783ac51d6b8ce20df3cbe5a96ee9d"
    )
    assert (MODULE.PARENT_ROOT_CLAUSES, MODULE.ROOT_CLAUSES) == (7_409_780, 7_409_788)
    assert MODULE.EXPECTED_PARENT_SUBSUMER_COUNTS == (0, 2, 2, 1, 0, 0, 2, 0)
    assert MODULE.EXPECTED_STRICT_NEW_INDICES == (0, 4, 5, 7)
    ledger = MODULE.load_authenticated_ledger()
    selected = MODULE.validate_ledger(ledger)
    assert set(selected) == {"forward", "reverse"}
    assert {candidate["candidate_id"] for candidate in selected.values()} == {
        expected["candidate_id"] for expected in MODULE.EXPECTED_TARGETS.values()
    }


def test_rendered_lean_is_byte_pinned() -> None:
    ledger = MODULE.load_authenticated_ledger()
    rendered = MODULE.render_lean(ledger)
    assert rendered == MODULE.LEAN_OUTPUT.read_text()
    assert MODULE.sha256_bytes(rendered.encode()) == MODULE.LEAN_SHA256
    assert "sourceAssign_candidateAClause" in rendered
    assert "sourceAssign_candidateBClause" in rendered
    assert "7409788" in rendered


def test_suffix_dimacs_orbit_is_eight_distinct_clauses() -> None:
    clauses = MODULE.dimacs_suffix_clauses()
    assert len(clauses) == 8
    assert len(set(clauses)) == 8
    assert [clause[0] for clause in clauses] == [-307, -307, -308, -308] * 2
    assert tuple(len(clause) for clause in clauses) == (9,) * 8


def test_forward_reduced_hits_are_all_authenticated() -> None:
    ledger = MODULE.load_authenticated_ledger()
    rows, _inverse = MODULE._decoded_rows(ledger)
    for center, point in MODULE.EXPECTED_TARGETS["forward"]["hits"]:
        assert MODULE.EXPECTED_ORDER[point] in rows[MODULE.EXPECTED_ORDER[center]]
    assert (13, 8) not in MODULE.EXPECTED_TARGETS["forward"]["hits"]


def test_decoded_order_mutation_fails_closed() -> None:
    ledger = copy.deepcopy(MODULE.load_authenticated_ledger())
    decoded = ledger["decoded_selectors"]
    decoded["order"][0], decoded["order"][1] = decoded["order"][1], decoded["order"][0]
    _resign_ledger(ledger)
    with pytest.raises(MODULE.PromotionError, match="decoded named order drifted"):
        MODULE.validate_ledger(ledger)


def test_target_record_mutation_fails_closed_after_resigning() -> None:
    ledger = copy.deepcopy(MODULE.load_authenticated_ledger())
    candidate = next(
        item
        for item in ledger["candidates"]
        if item["candidate_id"] == MODULE.EXPECTED_TARGETS["reverse"]["candidate_id"]
    )
    candidate["payload"]["canonical_bank_record"]["core"]["Y"] = 14
    _resign_candidate(candidate)
    _resign_ledger(ledger)
    with pytest.raises(MODULE.PromotionError, match="target candidate selection drifted"):
        MODULE.validate_ledger(ledger)


def test_duplicate_json_key_is_rejected() -> None:
    with pytest.raises(MODULE.PromotionError, match="duplicate JSON key"):
        MODULE.strict_json(b'{"schema":"one","schema":"two"}')


def test_write_text_once_is_create_only(tmp_path: Path) -> None:
    output = tmp_path / "Generated.lean"
    MODULE.write_text_once(output, "first\n")
    assert output.read_text() == "first\n"
    with pytest.raises(FileExistsError, match="immutable publication target exists"):
        MODULE.write_text_once(output, "second\n")
    assert output.read_text() == "first\n"


def test_parent_novelty_scanner_checks_exact_and_subsumption(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    suffix = MODULE.dimacs_suffix_clauses()
    witness = tmp_path / "parent-cell.cnf"
    rows = [suffix[0], suffix[1][:-1], (-1, -2)]
    witness.write_text("p cnf 308 3\n" + "".join(" ".join(map(str, row)) + " 0\n" for row in rows))
    monkeypatch.setattr(MODULE, "PARENT_CELL_CNF", witness)
    monkeypatch.setattr(MODULE, "PARENT_CELL_CNF_BYTES", witness.stat().st_size)
    monkeypatch.setattr(MODULE, "PARENT_CELL_CNF_SHA256", MODULE.sha256_file(witness))
    monkeypatch.setattr(MODULE, "PARENT_CLAUSES", 3)
    monkeypatch.setattr(MODULE, "EXPECTED_EXACT_PARENT_MULTIPLICITY", (1, 0, 0, 0, 0, 0, 0, 0))
    monkeypatch.setattr(
        MODULE, "EXPECTED_PARENT_SUBSUMER_COUNTS", (1, 1, 0, 0, 0, 0, 0, 0)
    )
    monkeypatch.setattr(
        MODULE, "EXPECTED_STRICT_NEW_INDICES", (2, 3, 4, 5, 6, 7)
    )
    MODULE.verify_parent_novelty(witness)


def test_lean_output_drift_is_detected(tmp_path: Path) -> None:
    output = tmp_path / "Generated.lean"
    output.write_text(MODULE.LEAN_SOURCE + "-- drift\n")
    assert output.read_text() != MODULE.render_lean(MODULE.load_authenticated_ledger())
