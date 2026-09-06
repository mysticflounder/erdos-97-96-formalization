from __future__ import annotations

import copy
import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))
import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as old_paths
import cardge13_exact13_global_source_cell_csp_piqd as legacy
import cardge13_exact13_witnessed_key_cegar_wave1_piqd as subject
import cardge13_exact13_witnessed_key_root_piqd as root

SURVIVOR: dict[str, object] = {
    "base_rows": {
        "C0": [2, 4, 6, 11],
        "C1": [0, 3, 5, 10],
        "K": [1, 7, 8, 12],
        "L": [2, 9, 10, 11],
        "T": [5, 6, 7, 9],
    },
    "global_rows": {
        "3": [0, 1, 4, 9],
        "4": [0, 6, 10, 12],
        "5": [0, 3, 8, 11],
        "6": [2, 3, 4, 7],
        "7": [4, 5, 8, 9],
        "8": [2, 3, 9, 12],
        "10": [5, 8, 11, 12],
        "11": [1, 3, 6, 8],
        "12": [1, 4, 7, 11],
    },
    "roles": {"b0": 9, "b1": 2, "d": 7, "s0": 4, "s1": 3, "z": 9},
}


def test_source_faithful_rows_do_not_import_legacy_t_interval_constraint() -> None:
    order_index = {raw: position for position, raw in enumerate(root.DIRECT_ORDER)}
    raw_rows = {
        **SURVIVOR["base_rows"],  # type: ignore[arg-type]
        **{f"G{center}": support for center, support in (
            (int(center), values)
            for center, values in SURVIVOR["global_rows"].items()  # type: ignore[union-attr]
        )},
        "G2": [],
        "G9": [],
    }
    raw_rows["T"] = [2, 3, 4, 5]
    key = {
        "orientation": "direct",
        "roles": {
            **SURVIVOR["roles"],  # type: ignore[arg-type]
            "ell": 0,
            "a": 0,
            "b": 0,
        },
        "supportOf": {
            name: sorted(order_index[point] for point in support)
            for name, support in raw_rows.items()
        },
    }
    cell = subject.key_cell(key)
    assert cell["base_rows"]["T"] == [2, 3, 4, 5]  # type: ignore[index]
    with pytest.raises(AssertionError, match="first-apex row"):
        legacy.validate_cell(cell)
    assert len(subject.cell_rows(cell)) == 14


def test_provider_graph_matches_existing_graph_when_legacy_cell_is_admissible() -> None:
    rows = subject.cell_rows(SURVIVOR)
    assert subject.equality_graph(rows) == old_paths.equality_graph(SURVIVOR)


def test_two_form_incidence_cut_replays_exact_zero_sum() -> None:
    assert old_paths.minimal_incidence_path_conflict(
        SURVIVOR, legacy.DIRECT_ORDER
    ) is None
    conflict = subject.find_conflict(SURVIVOR, legacy.DIRECT_ORDER)
    assert conflict is not None
    assert conflict["kind"] == "two-form-incidence-path"
    replay = subject.replay_zero_sum(conflict, SURVIVOR, legacy.DIRECT_ORDER)
    assert replay["form_count"] == 2
    assert replay["pairing_count"] == 4
    assert replay["zero_projected_sum_replayed"] is True


def test_cut_contains_only_true_projected_provider_atoms() -> None:
    conflict = subject.find_conflict(SURVIVOR, legacy.DIRECT_ORDER)
    assert conflict is not None
    cnf, _projection = root.emit_root()
    assignment = {cnf.names[atom] for atom in conflict["atoms"]}
    clause, admission = subject.admitted_cut(
        conflict, SURVIVOR, legacy.DIRECT_ORDER, assignment, cnf
    )
    assert clause
    assert all(literal < 0 for literal in clause)
    assert all(
        atom.startswith(("m_", "is_b0_", "is_b1_"))
        for atom in admission["atoms"]
    )
    assert admission["no_existential_witness_variables"] is True


def test_tampered_path_atom_fails_closed() -> None:
    conflict = subject.find_conflict(SURVIVOR, legacy.DIRECT_ORDER)
    assert conflict is not None
    tampered = copy.deepcopy(conflict)
    tampered["atoms"] = (*tampered["atoms"], "u_1")
    with pytest.raises(subject.AuditError, match="exact path incidences"):
        subject.replay_zero_sum(tampered, SURVIVOR, legacy.DIRECT_ORDER)


def test_expected_journal_and_receipt_prefixes_are_exact() -> None:
    cnf, _projection = root.emit_root()
    emitted = cnf.dimacs((root.SCHEMA, f"producer={root.PRODUCER}", "producer_commit=test"))
    bank = [
        {"index": 0, "clause": [-1, -2], "atoms": ["m_C0_0", "m_C0_1"]},
        {"index": 1, "clause": [-3], "atoms": ["m_C0_2"]},
    ]
    journal = subject.expected_session_journal(emitted, bank)
    normalized, _metadata = root.normalize_for_piqd_session(emitted)
    assert journal == normalized + b"-1 -2 0\n-3 0\n"
    first = normalized
    second = normalized + b"-1 -2 0\n"
    receipts = {
        "receipts": [
            {
                "solve_index": 1,
                "base_bytes": len(first),
                "base_clauses": 29464,
                "base_sha256": subject.sha256(first),
            },
            {
                "solve_index": 2,
                "base_bytes": len(second),
                "base_clauses": 29465,
                "base_sha256": subject.sha256(second),
            },
        ]
    }
    checks = subject.verify_receipts(receipts, emitted, bank)
    assert [row["base_clauses"] for row in checks] == [29464, 29465]


def test_effective_root_repairs_inherited_blocker_apex_clause(tmp_path: Path) -> None:
    cnf, _projection, report = subject.initial_root(
        tmp_path, subject.DEFAULT_SOURCE, "test"
    )
    expected_units = {
        (-cnf.names[f"is_{name}_{apex}"],)
        for name in ("b0", "b1")
        for apex in (root.SECOND_APEX, root.FIRST_APEX)
    }
    assert expected_units <= set(cnf.clauses)
    assert len(cnf.clauses) == 29468
    assert report["inherited_clause_count"] == 29468
    assert len(report["root_static_corrections"]) == 4
    assert report["exact_key_valid_root"] is True


def test_export_normalization_removes_exact_canonical_header() -> None:
    body = b"1 -2 0\n3 0\n"
    exported = b"p cnf 3 2\n" + body
    normalized, metadata = subject.normalize_exported_dimacs(
        exported, variables=3, clauses=2
    )
    assert normalized == body
    assert metadata["removed_header_bytes"] == 10
    assert metadata["clause_body_preserved_byte_for_byte"] is True
    with pytest.raises(subject.AuditError, match="unexpected DIMACS header"):
        subject.normalize_exported_dimacs(exported, variables=4, clauses=2)


def test_cut_bank_is_digest_bound_and_ordered(tmp_path: Path) -> None:
    certificate = tmp_path / "cut.json"
    certificate.write_text(json.dumps({"cut": 0}) + "\n")
    bank = tmp_path / "bank.jsonl"
    record = {
        "index": 0,
        "atoms": ["m_K_1", "m_K_2"],
        "clause": [-1, -2],
        "certificate": str(certificate),
        "certificate_sha256": subject.sha256(certificate.read_bytes()),
    }
    bank.write_bytes(subject.canonical(record) + b"\n")
    assert subject.load_bank(bank) == [record]
    certificate.write_text("drift\n")
    with pytest.raises(subject.AuditError, match="digest drifted"):
        subject.load_bank(bank)


def test_full_cone_formula_accepts_source_faithful_row_tuple() -> None:
    commands, form_count = subject.cone_formula(
        subject.cell_rows(SURVIVOR), legacy.DIRECT_ORDER
    )
    assert commands[0] == "(set-logic QF_LRA)"
    assert 0 < form_count <= 1430
    assert any("(assert (= " in command for command in commands)
