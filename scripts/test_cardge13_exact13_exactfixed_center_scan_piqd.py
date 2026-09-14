# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy

import cardge13_exact13_exactfixed_center_scan_piqd as subject


def _sat_record(center: int, solver: str = "z3") -> dict[str, object]:
    digest = subject.hashlib.sha256(subject.journal_bytes(center)).hexdigest()
    commands = len(subject.build_commands(center))
    result_sha256 = "a" * 64
    solver_sha256 = "b" * 64
    return {
        "solver": solver,
        "created": {
            "id": "session",
            "solver_signature": f"{solver}-test",
            "solver_sha256": solver_sha256,
        },
        "asserted": {"commands": commands},
        "solved": {
            "status": "SAT",
            "result_sha256": result_sha256,
            "solve_ms": 1,
            "model_replay": {
                "outcome": "SATISFIED",
                "script_sha256": "c" * 64,
                "solver_sha256": solver_sha256,
            },
        },
        "receipts": {
            "receipts": [
                {
                    "base_sha256": digest,
                    "base_commands": commands,
                    "status": "SAT",
                    "result_sha256": result_sha256,
                }
            ]
        },
    }


def test_center9_query_matches_existing_exact_fixed_producer() -> None:
    assert subject.build_commands(9) == subject.center9.build_commands(
        exact_fixed_rows=True
    )
    assert subject.journal_bytes(9) == subject.center9.journal_bytes(
        exact_fixed_rows=True
    )


def test_each_query_has_one_center_omitting_four_support_row() -> None:
    base = subject.center9.build_commands(
        include_center9_k4=False, exact_fixed_rows=True
    )
    assert len(base) == 2500
    journals = set()
    for center in subject.core.LABELS:
        commands = subject.build_commands(center)
        journal = subject.journal_bytes(center).decode("ascii")
        journals.add(subject.hashlib.sha256(journal.encode("ascii")).hexdigest())
        assert len(commands) == len(base) + 27
        assert commands[: len(base)] == base
        assert f"(declare-const m_G{center}_{center} Bool)" not in commands
        assert (
            sum(
                command.startswith(f"(declare-const m_G{center}_")
                for command in commands
            )
            == 12
        )
        assert sum(f"(=> m_G{center}_" in command for command in commands) == 12
        assert f"(declare-const r_G{center} Real)" in commands
        assert not any(f"(not m_G{center}_" in command for command in commands)
    assert len(journals) == 13


def test_exact_fixed_rows_add_all_forty_off_radius_exclusions() -> None:
    equality_base = subject.center9.build_commands(include_center9_k4=False)
    exact_base = subject.center9.build_commands(
        include_center9_k4=False, exact_fixed_rows=True
    )
    assert len(exact_base) - len(equality_base) == 40
    assert all(command in exact_base for command in equality_base)


def test_expected_status_policy_is_fail_closed() -> None:
    for center in subject.core.LABELS:
        assert subject.allowed_statuses(center, "z3") == (
            frozenset(("UNSAT",)) if center == 9 else frozenset(("SAT",))
        )
        assert ("UNKNOWN" in subject.allowed_statuses(center, "cvc5")) == (
            center in (1, 3)
        )


def test_sat_summary_requires_authenticated_model_replay() -> None:
    center = 0
    record = _sat_record(center)
    digest = subject.hashlib.sha256(subject.journal_bytes(center)).hexdigest()
    summary = subject.summarize_solve(
        center=center,
        journal_sha256=digest,
        commands=len(subject.build_commands(center)),
        record=record,
    )
    assert summary["status"] == "SAT"
    assert summary["receipt_base_sha256"] == digest
    assert summary["model_replay"]["outcome"] == "SATISFIED"

    broken = copy.deepcopy(record)
    broken["solved"]["model_replay"]["outcome"] = "FAILED"
    try:
        subject.summarize_solve(
            center=center,
            journal_sha256=digest,
            commands=len(subject.build_commands(center)),
            record=broken,
        )
    except subject.ScanError as error:
        assert "not replayed" in str(error)
    else:
        raise AssertionError("missing SAT-model replay was accepted")
