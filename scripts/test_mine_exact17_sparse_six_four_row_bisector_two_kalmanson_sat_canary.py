from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / (
    "scripts/mine_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_canary.py"
)
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


def test_cnf_failed_clause_rejected(monkeypatch: pytest.MonkeyPatch) -> None:
    mine = module()
    cnf = b"p cnf 1 1\n1 0\n"
    monkeypatch.setattr(mine, "VARIABLES", 1)
    monkeypatch.setattr(mine, "CNF_CLAUSES", 1)
    monkeypatch.setattr(mine, "CNF_SHA256", hashlib.sha256(cnf).hexdigest())
    with pytest.raises(mine.MineError, match="falsifies"):
        mine.replay_dimacs(cnf, {1: False})


def test_missing_just_added_orbit_clause_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    mine = module()
    cnf = b"p cnf 1 1\n1 0\n"
    monkeypatch.setattr(mine, "VARIABLES", 1)
    monkeypatch.setattr(mine, "CNF_CLAUSES", 1)
    monkeypatch.setattr(mine, "CNF_SHA256", hashlib.sha256(cnf).hexdigest())
    monkeypatch.setattr(mine, "JUST_ADDED_ORBIT_CLAUSES", frozenset({(-1,)}))
    with pytest.raises(mine.MineError, match="multiplicity"):
        mine.replay_dimacs(cnf, {1: True})


def test_model_job_mutation_rejected() -> None:
    mine = module()
    model = live_json(mine.MODEL_ARTIFACT)
    model["job_id"] = "crossed-job"
    with pytest.raises(mine.MineError, match="identity"):
        mine._require(model.get("job_id") == mine.JOB_ID, "SAT model identity drifted")


def test_mining_order_must_match_authenticated_selector() -> None:
    mine = module()
    model = live_json(mine.MODEL_ARTIFACT)
    values, decoded = mine.decode_model(model)
    assert decoded["selected_order_index"] == 0
    assert tuple(decoded["selected_order"]) == mine.ORDER_ZERO
    with pytest.raises(mine.MineError, match="does not match"):
        mine.require_order_matches_selector(values, 1, mine.ORDER_ONE)


def test_named_order_selector_flip_changes_table() -> None:
    mine = module()
    model = live_json(mine.MODEL_ARTIFACT)
    values, _ = mine.decode_model(model)
    flipped = dict(values)
    flipped[307] = False
    flipped[308] = True
    assert mine.selected_order_table(flipped) == (1, mine.ORDER_ONE)
    with pytest.raises(mine.MineError, match="does not match"):
        mine.require_order_matches_selector(flipped, 0, mine.ORDER_ZERO)


def test_active_registered_scan_rejects_incomplete_component_certificate(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    mine = module()
    model = live_json(mine.MODEL_ARTIFACT)
    values, _ = mine.decode_model(model)
    order_index, order = mine.selected_order_table(values)
    monkeypatch.setattr(
        mine.producer_bank,
        "complete_perpendicular_bisector_certificate",
        lambda rows, n, selected_order: {"status": "INCOMPLETE", "complete": False},
    )
    with pytest.raises(mine.MineError, match="equality-component scan did not complete"):
        mine.scan_registered_families(
            values, mine.MOTIF_SCANNER.read_bytes(), order_index, order
        )


def test_predecessor_hardcoded_order_did_not_match_selector() -> None:
    mine = module()
    audit = mine.audit_predecessor_selector(
        mine.PREDECESSOR_MODEL.read_bytes(), mine.PREDECESSOR_ANALYSIS.read_bytes()
    )
    assert audit["decoded_selector"] == 0
    assert audit["decoded_selector_table"] == list(mine.ORDER_ZERO)
    assert audit["prior_hardcoded_mining_table"] == list(mine.ORDER_ONE)
    assert audit["hardcoded_table_matched_model_selector"] is False
    assert audit["prior_model_specific_mine_valid"] is False


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
    assert (
        mine.classify_support(mine.JUST_ADDED_SUPPORT, {mine.JUST_ADDED_SUPPORT})
        == "exact-parent-bank-support"
    )


def test_just_added_support_serializes_to_exact_four_clause_orbit() -> None:
    mine = module()
    actual = mine.occurrence_orbit_clauses(mine.JUST_ADDED_SUPPORT)
    expected = frozenset(frozenset(clause) for clause in mine.JUST_ADDED_ORBIT_CLAUSES)
    assert actual == expected


def test_semantic_orbit_multiplicity_ignores_literal_order() -> None:
    mine = module()
    lines = ["p cnf 308 12"]
    for clause in mine.JUST_ADDED_ORBIT_CLAUSES:
        for offset in range(3):
            rotated = clause[offset:] + clause[:offset]
            lines.append(" ".join(map(str, rotated)) + " 0")
    cnf = ("\n".join(lines) + "\n").encode("ascii")
    assert mine.semantic_orbit_clause_multiplicities(cnf, mine.JUST_ADDED_SUPPORT) == [
        3,
        3,
        3,
        3,
    ]


def test_just_added_support_does_not_cut_active_order_model() -> None:
    mine = module()
    values, _ = mine.decode_model(live_json(mine.MODEL_ARTIFACT))
    evaluations = mine.evaluate_occurrence_orbit(values, mine.JUST_ADDED_SUPPORT)
    assert len(evaluations) == 4
    assert sum(not item["satisfied"] for item in evaluations) == 0
    assert sum(item["guard_satisfies_clause"] for item in evaluations) == 2


def test_live_terminal_artifacts_are_pinned() -> None:
    mine = module()
    terminal = json.loads(mine.CANARY_JOURNAL.read_text().splitlines()[-1])
    assert terminal["outcome"] == "STRUCTURAL_SAT"
    assert terminal["artifacts"]["model_sha256"] == mine.MODEL_SHA256
    assert terminal["artifacts"]["solver_log_sha256"] == mine.SOLVER_LOG_SHA256
