#!/usr/bin/env python3
"""Independent structural validator for the metric-aware CEGAR checkpoint."""

from __future__ import annotations

from typing import Any, Mapping


ALLOWED_FINAL = {
    "EXHAUSTED_FIXED_PLACEMENT_FINITE_SHADOW",
    "FOUND_CROSSCHECKED_NONUNIT_EQUALITY_CANDIDATE",
    "STOPPED_ROUND_BUDGET",
    "STOPPED_INCIDENCE_NODE_CAP",
    "STOPPED_BOOTSTRAP_CUT_NOT_RECONFIRMED",
    "STOPPED_FULL_ORACLE_UNDECIDED",
}


def _validate_sha256(value: object) -> None:
    text = str(value)
    assert len(text) == 64
    assert all(character in "0123456789abcdef" for character in text)


def _cut(record: Mapping[str, object], api: Any) -> Any:
    return api.cut_from_rows(
        tuple(api.decode_metric_row(str(row)) for row in record["rows"])
    )


def _validate_unit_crosscheck(record: Mapping[str, object]) -> None:
    assert record["status"] == "CROSSCHECKED_UNIT"
    assert list(record["verdicts"]) == ["UNIT", "UNIT", "UNIT"]


def _validate_cut_record(record: Mapping[str, object], api: Any) -> Any:
    learned = _cut(record, api)
    learned_rows = tuple(api.cut_rows(learned))
    encoded = api.encode_metric_rows(learned_rows)
    assert list(record["rows"]) == encoded
    assert int(record["row_count"]) == len(learned_rows)
    assert int(record["equality_count"]) == len(
        api.metric_oracle.serialized_system(12, learned_rows)
    )
    assert record["row_set_sha256"] == api.canonical_sha256(encoded)
    assert record["expanded_polynomial_sha256"] == api.canonical_sha256(
        list(api.metric_oracle.serialized_system(12, learned_rows))
    )
    _validate_unit_crosscheck(record["crosscheck"])
    return learned


def validate_case(
    case: Mapping[str, object], budgets: Mapping[str, object], api: Any
) -> None:
    assert case["schema"] == api.CASE_SCHEMA
    assert tuple(case["profile"]) in {(4, 5, 6), (5, 5, 5)}
    assert case["seed_sha256"] == api.canonical_sha256(case["seed"])
    bootstrap = case["bootstrap_cut"]
    cuts = [_validate_cut_record(bootstrap, api)]
    assert cuts[0]
    rounds = list(case["rounds"])
    assert len(rounds) <= int(budgets["max_rounds_per_case"])
    for index, row in enumerate(rounds):
        assert int(row["round"]) == index
        assert int(row["nodes"]) <= int(budgets["max_incidence_nodes_per_round"]) + 1
        status = row["incidence_status"]
        assert status in {"SAT", "UNSAT", "INDETERMINATE"}
        if status != "SAT":
            assert index == len(rounds) - 1
            continue
        assert int(row["metric_row_count"]) >= 1
        assert len(str(row["metric_rows_sha256"])) == 64
        if "accepted_cut" in row:
            accepted = row["accepted_cut"]
            learned = _validate_cut_record(accepted, api)
            assert learned not in cuts
            cuts.append(learned)
            _validate_unit_crosscheck(row["full_equality_ideal"])
            assert row["reported_status"] == "CROSSCHECKED_UNIT_CUT_ACCEPTED"
        else:
            assert row["full_equality_ideal"]["status"] in {
                "CROSSCHECKED_NONUNIT",
                "UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT",
            }
    final = case["final_status"]
    assert final in ALLOWED_FINAL
    if final == "EXHAUSTED_FIXED_PLACEMENT_FINITE_SHADOW":
        assert rounds and rounds[-1]["incidence_status"] == "UNSAT"
    if final == "FOUND_CROSSCHECKED_NONUNIT_EQUALITY_CANDIDATE":
        assert rounds[-1]["full_equality_ideal"]["status"] == "CROSSCHECKED_NONUNIT"
        assert "accepted_cut" not in rounds[-1]
    if final == "STOPPED_ROUND_BUDGET":
        assert len(rounds) == int(budgets["max_rounds_per_case"])
        assert all("accepted_cut" in row for row in rounds)
    if final == "STOPPED_INCIDENCE_NODE_CAP":
        assert rounds[-1]["incidence_status"] == "INDETERMINATE"


def validate_document(
    document: Mapping[str, object], *, api: Any | None = None
) -> dict[str, Any]:
    if api is None:
        import cegar as api

    manifest = api.load_manifest()
    assert document["schema"] == api.SCHEMA
    assert document["manifest_sha256"] == api.canonical_sha256(manifest)
    assert document["scope"]["target_faithful"] is False
    assert document["scope"]["producer_proved"] is False
    source = document["source"]
    assert source["second_center_query_checkpoint_sha256"] == api.file_sha256(
        api.SOURCE_QUERY_DIR / "checkpoint.json"
    )
    assert source["metric_oracle_checkpoint_sha256"] == api.file_sha256(
        api.METRIC_ORACLE_DIR / "checkpoint.json"
    )
    assert source["metric_oracle_manifest_sha256"] == api.file_sha256(
        api.METRIC_ORACLE_DIR / "manifest.json"
    )
    has_resume_hash = "resumed_checkpoint_sha256" in source
    has_resume_budget = "resumed_round_budget_per_case" in source
    assert has_resume_hash == has_resume_budget
    if has_resume_hash:
        _validate_sha256(source["resumed_checkpoint_sha256"])
        resumed_budget = int(source["resumed_round_budget_per_case"])
        assert 0 < resumed_budget < int(document["budgets"]["max_rounds_per_case"])
    cases = list(document["cases"])
    assert {tuple(case["profile"]) for case in cases} == {
        (4, 5, 6),
        (5, 5, 5),
    }
    for case in cases:
        validate_case(case, document["budgets"], api)
    return {"case_count": 2, "all_structurally_validated": True}
