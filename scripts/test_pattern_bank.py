"""Tests for the scratch pattern bank."""

from __future__ import annotations

import json
from pathlib import Path

import pytest
from pattern_bank import (
    CONFIDENCE_LEVELS,
    connect,
    export_markdown,
    ingest,
    init_db,
    list_patterns,
    main,
    stats,
)


def _payload() -> dict:
    """A miniature pattern-mine output with two clusters and one verdict."""
    return {
        "result": {
            "candidateCount": 3,
            "mined": [
                {
                    "cluster": "phase3-cube24-frontier",
                    "corpus_notes": "36k records, one schema",
                    "dead_patterns": "verdict field is always 'sat' because the "
                    "generator drops unsat rows",
                    "best_candidate_id": "assertion-count-role-symmetry",
                    "candidates": [
                        {
                            "id": "assertion-count-role-symmetry",
                            "observation": "transposing role slots r1 and r2 leaves "
                            "the assertion count unchanged",
                            "candidate_statement": "The assertion count is invariant "
                            "under the transposition (r1 r2).",
                            "evidence": "jq over 36053 records; 0 violations",
                            "sample_size": "36053 of 36053",
                            "encoder_check": "read phase3_projected.py; the encoder "
                            "emits slots independently, so a violation was possible",
                            "obstruction_bucket": 3,
                            "falsification_test": "check cube32 variant",
                            "confidence": "plausible-invariant",
                        },
                        {
                            "id": "empty-trivial-centers",
                            "observation": "trivial_k4_centers is always []",
                            "candidate_statement": "No trivial K4 centre occurs.",
                            "evidence": "uniq -c gives one bucket",
                            "sample_size": "36053 of 36053",
                            "encoder_check": "generator hardcodes [] on this path",
                            "obstruction_bucket": 0,
                            "falsification_test": "n/a",
                            "confidence": "likely-encoder-artifact",
                        },
                    ],
                },
                {
                    "cluster": "atail-geometry-banks",
                    "corpus_notes": "3.6k files",
                    "dead_patterns": "",
                    "best_candidate_id": None,
                    "candidates": [
                        {
                            "id": "card13-radius-gap",
                            "observation": "radius gap never below 2",
                            "candidate_statement": "For card >= 13 the radius gap "
                            "satisfies gap >= 2.",
                            "evidence": "awk min over 1194 files",
                            "sample_size": "1194 of 1194",
                            "encoder_check": "read the aggregate script; unconstrained",
                            "obstruction_bucket": 5,
                            "falsification_test": "run on v6 bank",
                            "confidence": "strong-invariant",
                        }
                    ],
                },
            ],
            "falsifications": [
                {
                    "candidate_id": "assertion-count-role-symmetry",
                    "killed": True,
                    "kill_reason": "encoder-artifact",
                    "verdict_detail": "the slot writer sorts before counting",
                    "salvageable_form": "none",
                }
            ],
        }
    }


@pytest.fixture()
def bank(tmp_path: Path):
    conn = connect(tmp_path / "bank.db")
    init_db(conn)
    yield conn
    conn.close()


def test_init_seeds_obstruction_buckets(bank):
    rows = list(bank.execute("SELECT bucket, label FROM obstruction ORDER BY bucket"))
    assert [r["bucket"] for r in rows] == list(range(8))
    assert rows[5]["label"] == "endpoint-parametric-card13"


def test_init_is_idempotent(bank):
    init_db(bank)
    init_db(bank)
    (count,) = bank.execute("SELECT COUNT(*) FROM obstruction").fetchone()
    assert count == 8


def test_ingest_counts(bank):
    counts = ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    assert counts == {
        "clusters": 2,
        "patterns": 3,
        "verdicts": 1,
        "orphan_verdicts": 0,
    }


def test_ingest_accepts_inner_result_object(bank):
    inner = _payload()["result"]
    counts = ingest(bank, inner, run_id="wf_inner", workflow="mine")
    assert counts["patterns"] == 3


def test_ingest_rejects_wrong_payload(bank):
    with pytest.raises(ValueError, match="no 'mined' key"):
        ingest(bank, {"result": {"report": "nope"}}, run_id="x", workflow="mine")


def test_killed_pattern_is_not_live(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    live = {row["handle"] for row in list_patterns(bank, live_only=True)}
    assert "assertion-count-role-symmetry" not in live
    assert live == {"empty-trivial-centers", "card13-radius-gap"}


def test_untested_patterns_are_live_but_flagged(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    rows = {row["handle"]: row for row in list_patterns(bank, live_only=True)}
    assert rows["card13-radius-gap"]["tested"] == 0


def test_best_candidate_flag(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    rows = dict(bank.execute("SELECT handle, is_best FROM pattern").fetchall())
    assert rows["assertion-count-role-symmetry"] == 1
    assert rows["empty-trivial-centers"] == 0


def test_filter_by_bucket(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    rows = list_patterns(bank, live_only=True, bucket=5)
    assert [r["handle"] for r in rows] == ["card13-radius-gap"]


def test_filter_by_min_confidence(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    rows = list_patterns(bank, min_confidence="plausible-invariant")
    handles = {r["handle"] for r in rows}
    assert "empty-trivial-centers" not in handles
    assert "card13-radius-gap" in handles


def test_confidence_levels_are_ordered_weakest_first():
    assert CONFIDENCE_LEVELS[0] == "likely-encoder-artifact"
    assert CONFIDENCE_LEVELS[-1] == "strong-invariant"


def test_orphan_verdict_is_counted_not_fatal(bank):
    payload = _payload()
    payload["result"]["falsifications"].append(
        {
            "candidate_id": "does-not-exist",
            "killed": True,
            "kill_reason": "encoder-artifact",
        }
    )
    counts = ingest(bank, payload, run_id="wf_test", workflow="mine")
    assert counts["orphan_verdicts"] == 1
    assert counts["verdicts"] == 1


def test_reingest_replaces_run_without_duplicating(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    st = stats(bank)
    assert st["runs"] == 1
    assert st["patterns"] == 3
    assert st["clusters"] == 2


def test_second_run_accumulates(bank):
    ingest(bank, _payload(), run_id="wf_one", workflow="mine")
    ingest(bank, _payload(), run_id="wf_two", workflow="mine")
    st = stats(bank)
    assert st["runs"] == 2
    assert st["patterns"] == 6


def test_deleting_run_cascades(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    bank.execute("DELETE FROM mine_run WHERE run_id = 'wf_test'")
    bank.commit()
    assert stats(bank)["patterns"] == 0
    assert stats(bank)["verdicts"] == 0


def test_stats_shape(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    st = stats(bank)
    assert st["killed"] == 1
    assert st["live"] == 2
    assert st["kills_by_reason"] == {"encoder-artifact": 1}
    assert st["live_by_obstruction"] == {0: 1, 5: 1}


def test_out_of_range_bucket_is_nulled(bank):
    payload = _payload()
    payload["result"]["mined"][0]["candidates"][0]["obstruction_bucket"] = 99
    ingest(bank, payload, run_id="wf_test", workflow="mine")
    row = bank.execute(
        "SELECT obstruction_bucket FROM pattern WHERE handle = 'assertion-count-role-symmetry'"
    ).fetchone()
    assert row["obstruction_bucket"] is None


def test_export_markdown_lists_live_and_omits_killed(bank):
    ingest(bank, _payload(), run_id="wf_test", workflow="mine")
    text = export_markdown(bank)
    assert "card13-radius-gap" in text
    assert "assertion-count-role-symmetry" not in text
    assert "No row here is a theorem" in text


def test_cli_roundtrip(tmp_path: Path, capsys):
    db = tmp_path / "cli.db"
    payload = tmp_path / "out.json"
    payload.write_text(json.dumps(_payload()))

    assert main(["--db", str(db), "init"]) == 0
    assert (
        main(
            [
                "--db",
                str(db),
                "ingest",
                "--run-output",
                str(payload),
                "--run-id",
                "wf_cli",
            ]
        )
        == 0
    )
    capsys.readouterr()

    assert main(["--db", str(db), "list", "--live"]) == 0
    out = capsys.readouterr().out
    assert "card13-radius-gap" in out
    assert "KILLED:encoder-artifact" not in out

    assert main(["--db", str(db), "show", "card13-radius-gap"]) == 0
    assert "radius gap" in capsys.readouterr().out

    assert main(["--db", str(db), "show", "nope"]) == 1


def test_cli_stats_is_valid_json(tmp_path: Path, capsys):
    db = tmp_path / "cli.db"
    payload = tmp_path / "out.json"
    payload.write_text(json.dumps(_payload()))
    main(["--db", str(db), "init"])
    main(["--db", str(db), "ingest", "--run-output", str(payload), "--run-id", "r"])
    capsys.readouterr()
    main(["--db", str(db), "stats"])
    assert json.loads(capsys.readouterr().out)["patterns"] == 3
