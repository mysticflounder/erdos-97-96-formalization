from __future__ import annotations

from pathlib import Path

import cardge13_exact13_coarse_cell_iterative_two_form_batch_piqd as subject
import cardge13_exact13_global_source_cell_csp_piqd as base
import test_cardge13_exact13_coarse_cell_batch_piqd as fixtures


def test_novel_batch_deduplicates_and_respects_seen_cuts() -> None:
    cell = fixtures.source_valid_cell()
    rows, one_count, two_count = subject.novel_batch(
        cell, base.DIRECT_ORDER, set()
    )
    assert one_count > 0
    assert two_count > 0
    assert rows
    cuts = tuple(cut for _conflict, cut in rows)
    assert len(set(cuts)) == len(cuts)

    retained = set(cuts[::2])
    novel, next_one_count, next_two_count = subject.novel_batch(
        cell, base.DIRECT_ORDER, retained
    )
    assert next_one_count == one_count
    assert next_two_count == two_count
    assert {cut for _conflict, cut in novel} == set(cuts) - retained


def test_assert_chunks_tracks_exact_command_count(tmp_path, monkeypatch) -> None:
    observed: list[int] = []

    def fake_run(arguments: list[str], **_kwargs: object) -> dict[str, object]:
        expected = int(arguments[arguments.index("--expect-commands") + 1])
        source = Path(arguments[arguments.index("--file") + 1])
        count = len(source.read_text().splitlines())
        observed.append(count)
        return {"commands": expected + count}

    monkeypatch.setattr(base.core, "_run_json", fake_run)
    assertions, final_count = subject._assert_chunks(
        session_id="session",
        commands=("(set-logic QF_LIA)", "(check-sat)"),
        expected_commands=7,
        tmp_root=tmp_path,
        stem="test",
    )
    assert observed == [2]
    assert assertions == [{"commands": 9}]
    assert final_count == 9


def test_run_piqd_batched_asserts_one_batch_then_reports_survivor(
    tmp_path, monkeypatch
) -> None:
    state = {"commands": 0, "solves": 0, "batches": 0}

    def fake_run(arguments: list[str], **_kwargs: object) -> dict[str, object]:
        operation = arguments[1]
        if operation == "new":
            return {"id": "session"}
        if operation == "assert":
            expected = int(arguments[arguments.index("--expect-commands") + 1])
            source = Path(arguments[arguments.index("--file") + 1])
            count = len(source.read_text().splitlines())
            assert expected == state["commands"]
            state["commands"] += count
            state["batches"] += 1
            return {"commands": state["commands"]}
        if operation == "solve":
            state["solves"] += 1
            return {
                "status": "SAT",
                "model": "model",
                "model_replay": {"outcome": "SATISFIED"},
            }
        if operation == "receipts":
            return {"count": state["solves"]}
        if operation == "close":
            return {"state": "closed"}
        raise AssertionError(arguments)

    batch_calls = 0

    def fake_batch(
        _cell: dict[str, object], _order: tuple[int, ...], _seen: set[str]
    ) -> tuple[tuple[tuple[dict[str, object], str], ...], int, int]:
        nonlocal batch_calls
        batch_calls += 1
        if batch_calls == 1:
            return ((({"kind": "test", "atoms": ("a",)}, "(assert a)"),), 1, 0)
        return (), 0, 0

    monkeypatch.setattr(base.core, "_run_json", fake_run)
    monkeypatch.setattr(base, "decode_model", lambda _model: fixtures.source_valid_cell())
    monkeypatch.setattr(subject, "novel_batch", fake_batch)
    out = tmp_path / "run" / "artifacts" / "input.smt2"
    out.parent.mkdir(parents=True)
    records = subject.run_piqd_batched(
        out,
        ("(set-logic QF_LIA)",),
        (),
        ("z3",),
        1_000,
        label="test",
        order=base.DIRECT_ORDER,
        max_batches=2,
    )
    assert records[0]["cegar_status"] == "SAT_SURVIVOR_ONE_TWO_FORM"
    assert len(records[0]["iterations"]) == 2
    assert records[0]["iterations"][0]["new_cut_count"] == 1
    assert state == {"commands": 2, "solves": 2, "batches": 2}
