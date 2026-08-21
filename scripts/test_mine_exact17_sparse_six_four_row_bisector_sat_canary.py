from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts/mine_exact17_sparse_six_four_row_bisector_sat_canary.py"
sys.path.insert(0, str(ROOT))

from census.p97_search.phase3_cegar_wave import WaveContractError


def module() -> Any:
    spec = importlib.util.spec_from_file_location("sat_canary_mine", SCRIPT)
    assert spec and spec.loader
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


def live_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text())


def test_descriptor_path_escape_rejected(tmp_path: Path) -> None:
    mine = module()
    with pytest.raises(mine.MineError, match="escapes"):
        mine._relative(tmp_path, tmp_path.parent / "outside.json")


def test_descriptor_hash_mutation_rejected(tmp_path: Path) -> None:
    mine = module()
    target = tmp_path / "artifact.json"
    target.write_bytes(b"original")
    expected = hashlib.sha256(b"original").hexdigest()
    with mine.prep.DescriptorCustody(tmp_path) as custody:
        assert (
            mine._pinned(custody, tmp_path, target, expected, 1024).sha256 == expected
        )
    target.write_bytes(b"mutated")
    with (
        mine.prep.DescriptorCustody(tmp_path) as custody,
        pytest.raises(mine.MineError, match="pinned SHA-256"),
    ):
        mine._pinned(custody, tmp_path, target, expected, 1024)


def test_lane_checkpoint_mutation_rejected() -> None:
    mine = module()
    checkpoint = live_json(mine.CHECKPOINT)
    checkpoint["generated_roots"] = []
    with pytest.raises(mine.MineError, match="generated root"):
        mine.validate_checkpoint(checkpoint)


def test_run_manifest_schema_rejects_durable_paths() -> None:
    mine = module()
    run = {key: None for key in mine.RUN_MANIFEST_KEYS}
    run["durable_paths"] = []
    with pytest.raises(mine.MineError, match="keys"):
        mine.validate_run_manifest(run)


def test_journal_chain_mutation_rejected() -> None:
    mine = module()
    journal = mine.CANARY_JOURNAL.read_bytes()
    records = [
        mine._json(line[:-1], "record") for line in journal.splitlines(keepends=True)
    ]
    wave = live_json(
        mine.PORTFOLIO_ROOT / "artifacts/cells" / mine.CELL_ID / "wave-manifest.json"
    )
    records[1]["previous_attempt_sha256"] = "0" * 64
    with pytest.raises(WaveContractError):
        mine.driver.validate_attempt_journal(
            records,
            manifest=wave,
            expected_record_count=16,
            expected_terminal_sha256=mine.TERMINAL_RECORD_SHA256,
        )


def test_seal_mutation_rejected() -> None:
    mine = module()
    seal = live_json(mine.CANARY_SEAL)
    seal["journal_sha256"] = "0" * 64
    with pytest.raises(mine.MineError, match="digest|envelope"):
        mine.validate_seal_envelope(seal)


def test_wave_manifest_mutation_rejected() -> None:
    mine = module()
    wave = live_json(
        mine.PORTFOLIO_ROOT / "artifacts/cells" / mine.CELL_ID / "wave-manifest.json"
    )
    wave["encoding"]["cnf_sha256"] = "0" * 64
    with pytest.raises(mine.MineError, match="wave hash"):
        mine.validate_wave_binding(wave)


def test_six_cell_campaign_manifest_mutation_rejected() -> None:
    mine = module()
    campaign = live_json(mine.PORTFOLIO_ROOT / "artifacts/campaign-manifest.json")
    campaign["cells"][1]["wave_manifest"]["path"] = "../../outside.json"
    with pytest.raises(mine.MineError, match="escapes"):
        mine.validate_campaign_inventory(campaign)


def test_incomplete_model_rejected() -> None:
    mine = module()
    model = live_json(mine.MODEL_ARTIFACT)
    model["assignment"] = model["assignment"][:-1]
    with pytest.raises(mine.MineError, match="incomplete"):
        mine.decode_model(model)


@pytest.mark.parametrize("left,right", [(False, False), (True, True)])
def test_named_order_selector_must_be_one_hot(left: bool, right: bool) -> None:
    mine = module()
    values, _ = mine.decode_model(live_json(mine.MODEL_ARTIFACT))
    values[307] = left
    values[308] = right
    with pytest.raises(mine.MineError, match="not one-hot"):
        mine.selected_order_table(values)


def test_named_order_selector_controls_actual_table() -> None:
    mine = module()
    values, decoded = mine.decode_model(live_json(mine.MODEL_ARTIFACT))
    assert decoded["selected_order_index"] == 0
    assert tuple(decoded["selected_order"]) == mine.ORDER_ZERO
    with pytest.raises(mine.MineError, match="does not match"):
        mine.require_order_matches_selector(values, 1, mine.ORDER_ONE)
    values[307] = False
    values[308] = True
    assert mine.selected_order_table(values) == (1, mine.ORDER_ONE)


def test_cnf_failed_clause_rejected(monkeypatch: pytest.MonkeyPatch) -> None:
    mine = module()
    cnf = b"p cnf 1 1\n1 0\n"
    monkeypatch.setattr(mine, "VARIABLES", 1)
    monkeypatch.setattr(mine, "CNF_CLAUSES", 1)
    monkeypatch.setattr(mine, "CNF_SHA256", hashlib.sha256(cnf).hexdigest())
    with pytest.raises(mine.MineError, match="falsifies"):
        mine.replay_dimacs(cnf, {1: False})


def test_model_job_mutation_rejected() -> None:
    mine = module()
    model = live_json(mine.MODEL_ARTIFACT)
    model["job_id"] = "crossed-job"
    with pytest.raises(mine.MineError, match="identity"):
        mine._require(model.get("job_id") == mine.JOB_ID, "SAT model identity drifted")


def test_prior_bank_classification_is_fail_closed() -> None:
    mine = module()
    support = frozenset({(0, 1), (1, 2)})
    assert mine.classify_support(support, {support}) == "exact-parent-bank-support"
    assert (
        mine.classify_support(support | {(2, 3)}, {support})
        == "strictly-subsumed-by-parent-bank"
    )
    assert (
        mine.classify_support(support, {frozenset({(3, 4)})})
        == "new-occurrence-existing-family"
    )


def test_actual_cnf_bank_requires_every_orbit_clause_despite_duplicates() -> None:
    mine = module()
    support = mine.HISTORICAL_SIZE4_SUPPORT
    orbit = sorted(
        mine.occurrence_orbit_clauses(support),
        key=lambda clause: (len(clause), sorted(clause)),
    )
    duplicated = sorted(orbit[0])
    cnf = (
        "p cnf 308 2\n"
        + " ".join(map(str, duplicated))
        + " 0\n"
        + " ".join(map(str, reversed(duplicated)))
        + " 0\n"
    ).encode("ascii")
    ledger = {"entries": [{"support": [list(hit) for hit in sorted(support)]}]}
    summary = mine.classify_ledger_against_cnf(cnf, ledger)
    entry = ledger["entries"][0]
    assert summary["exact_current_cnf_bank_count"] == 0
    assert summary["new_after_current_cnf_bank_count"] == 1
    assert entry["bank_relation"] == "new-occurrence-existing-family"
    assert entry["current_cnf_exact_orbit_clause_multiplicities"] == [0, 0, 0, 2]


def test_actual_cnf_bank_recognizes_strict_clause_subsumption() -> None:
    mine = module()
    support = mine.HISTORICAL_SIZE4_SUPPORT
    orbit = mine.occurrence_orbit_clauses(support)
    subsumers = []
    for clause in orbit:
        row_literal = next(literal for literal in clause if literal not in {-307, -308})
        subsumers.append(sorted(clause - {row_literal}))
    lines = [f"p cnf 308 {len(subsumers)}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in subsumers)
    ledger = {"entries": [{"support": [list(hit) for hit in sorted(support)]}]}
    summary = mine.classify_ledger_against_cnf(
        ("\n".join(lines) + "\n").encode("ascii"), ledger
    )
    entry = ledger["entries"][0]
    assert summary["strictly_subsumed_by_current_cnf_bank_count"] == 1
    assert entry["bank_relation"] == "strictly-subsumed-by-current-cnf-bank"
    assert entry["present_or_subsumed_in_current_cnf_bank"] is True


def test_historical_hardcoded_order_analysis_is_invalid() -> None:
    mine = module()
    values, _ = mine.decode_model(live_json(mine.MODEL_ARTIFACT))
    correction = mine.historical_analysis_correction(
        values,
        live_json(mine.HISTORICAL_ANALYSIS),
        live_json(mine.HISTORICAL_LEDGER),
    )
    assert correction["status"] == "INVALID_HISTORICAL_MODEL_SPECIFIC_MINE"
    assert correction["authenticated_named_order"] == 0
    assert correction["authenticated_order_table"] == list(mine.ORDER_ZERO)
    assert correction["historical_hardcoded_order_table"] == list(mine.ORDER_ONE)
    assert correction["historical_model_specific_mine_valid"] is False
    assert correction["historical_size4_rejects_authenticated_model"] is False


def test_historical_size4_has_no_active_selector_falsified_clause() -> None:
    mine = module()
    values, decoded = mine.decode_model(live_json(mine.MODEL_ARTIFACT))
    evaluations = mine.evaluate_occurrence_orbit(
        values, mine.HISTORICAL_SIZE4_SUPPORT, decoded["selected_order_index"]
    )
    assert sum(item["active_selector_clause"] for item in evaluations) == 2
    assert sum(item["active_selector_clause_falsified"] for item in evaluations) == 0


def test_live_terminal_artifacts_are_pinned() -> None:
    mine = module()
    terminal = json.loads(mine.CANARY_JOURNAL.read_text().splitlines()[-1])
    assert terminal["outcome"] == "STRUCTURAL_SAT"
    assert terminal["artifacts"]["model_sha256"] == mine.MODEL_SHA256
    assert terminal["artifacts"]["solver_log_sha256"] == mine.SOLVER_LOG_SHA256
