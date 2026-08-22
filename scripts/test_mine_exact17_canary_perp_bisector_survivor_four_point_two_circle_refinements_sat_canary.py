# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache 2.0 license as described in the file LICENSE.
"""Adversarial tests for the FourPointTwoCircle successor SAT theorem miner."""

from __future__ import annotations

import copy
import json
import os
import stat
import subprocess
import sys
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from scripts import (
    mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_refinements_sat_canary as mine,
)


def _scanner() -> mine.ScannerModules:
    return mine.load_scanner_modules(ROOT)


def _assignment(*, center: int = 2, order: int = 0) -> list[int]:
    truths: set[int] = set()
    for row_center in range(17):
        truths.update(
            1 + 17 * row_center + ((row_center + offset) % 17) for offset in range(1, 5)
        )
    truths.add(290 + center)
    truths.add(307 + order)
    return [variable if variable in truths else -variable for variable in range(1, 309)]


def _model(*, center: int = 2, order: int = 0, job_id: str = "job-1") -> dict[str, Any]:
    return {
        "assignment": _assignment(center=center, order=order),
        "job_id": job_id,
        "num_assigned": 308,
        "result": "SAT",
    }


def _producer() -> bytes:
    return canonical_json_bytes(
        {
            "variable_map_sha256": "1" * 64,
            "backend": "cadical",
            "solver_profile": "sat",
            "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        }
    )


def _inputs(tmp_path: Path, *, center: int = 2) -> mine.AuthenticatedInputs:
    model_raw = canonical_json_bytes(_model(center=center))
    return mine.AuthenticatedInputs(
        root=tmp_path,
        run_root=tmp_path / "run",
        campaign_sha256="2" * 64,
        run_manifest_sha256="3" * 64,
        cell={
            "portfolio_cell_id": mine.runner.CANARY_PORTFOLIO_CELL_ID,
            "center": center,
        },
        terminal={
            "portfolio_cell_id": mine.runner.CANARY_PORTFOLIO_CELL_ID,
            "job_id": "job-1",
            "outcome": mine.runner.STRUCTURAL_SAT,
            "terminal_record_sha256": "4" * 64,
            "journal_record_count": 3,
            "seal_sha256": "5" * 64,
            "artifacts": {"model_sha256": sha256_bytes(model_raw)},
        },
        cnf=b"p cnf 308 1\n1 0\n",
        producer_raw=_producer(),
        wave_raw=canonical_json_bytes({"wave": "test"}),
        model_raw=model_raw,
        model=_model(center=center),
    )


def _dependencies() -> dict[str, dict[str, str | int]]:
    return copy.deepcopy(mine.SCANNER_DEPENDENCIES)


def _candidate() -> dict[str, Any]:
    return mine._candidate(
        family="perpendicular-bisector-equality-component",
        lean_consumer=(
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "nonempty_perpBisectorCore_of_positiveCheck"
        ),
        support=[[1, 2], [3, 4]],
        payload={"occurrence": {"foci": [0, 1]}, "complete_scan": True},
    )


def test_successor_lane_identity_and_dimensions_are_runner_bound() -> None:
    assert mine.NUM_POINTS == 17
    assert mine.NUM_VARIABLES == mine.runner.NUM_VARIABLES == 308
    assert mine.NUM_CLAUSES == mine.runner.NUM_CLAUSES == 7_409_522
    assert mine.MINER_RELATIVE == (
        "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
        "refinements_sat_canary.py"
    )
    assert (
        mine.MINER_NAME
        == "exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-miner"
    )
    assert mine.MINER_SCHEMA == (
        "p97-exact17-survivor-four-point-two-circle-refinements-"
        "source-valid-theorem-miner/v2"
    )
    assert mine.MINER_VERSION == "2"
    assert mine.VERIFICATION_SCHEMA == mine.runner.MINE_VERIFICATION_SCHEMA
    assert mine.runner.CANARY_PORTFOLIO_CELL_ID == (
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none-sat-profile-v1"
    )
    assert mine.runner.CAMPAIGN_SCHEMA == (
        "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "refinements-sat-profile-campaign/v4"
    )
    assert mine.runner.WAVE_MINE_SCHEMA == (
        "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "refinements-wave-only-mine/v1"
    )
    assert mine.runner.SAT_REPLAY_SCHEMA == (
        "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "refinements-independent-sat-replay/v1"
    )
    assert mine.runner.WAVE_MINE_LEDGER_SCHEMA == (
        "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "refinements-wave-only-candidate-ledger/v2"
    )
    assert mine.runner.WAVE_MINE_CANDIDATE_SCHEMA == (
        "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "refinements-wave-only-candidate/v1"
    )


def test_legacy_two_kalmanson_v3_campaign_schema_is_rejected() -> None:
    old_campaign = {
        "schema": (
            "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-"
            "refinements-sat-profile-campaign/v3"
        ),
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": 76,
        "execution": {},
        "source_ingress": {},
        "cells": [],
    }
    with pytest.raises(mine.runner.PortfolioRunnerError, match="campaign schema"):
        mine.runner.validate_campaign_payload(old_campaign, {})


def _patch_small_replay(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(mine, "NUM_CLAUSES", 3)


def test_scanner_modules_are_not_imported_before_dependency_preflight() -> None:
    code = (
        "import sys; "
        "from scripts import "
        "mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_refinements_sat_canary as m; "
        "assert not any(name in sys.modules for name in m.SCANNER_MODULE_NAMES); "
        "print('PASS')"
    )
    completed = subprocess.run(
        [sys.executable, "-c", code],
        cwd=ROOT,
        check=False,
        capture_output=True,
        text=True,
        timeout=30,
    )
    assert completed.returncode == 0, completed.stderr
    assert completed.stdout == "PASS\n"


def test_cli_result_bytes_pass_runner_strict_canonical_parser_in_real_subprocess() -> (
    None
):
    code = (
        "from scripts import "
        "mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_refinements_sat_canary as m; "
        "m._emit_canonical_result({'z':2,'a':1})"
    )
    completed = subprocess.run(
        [sys.executable, "-c", code],
        cwd=ROOT,
        check=False,
        capture_output=True,
        timeout=30,
    )
    assert completed.returncode == 0, completed.stderr.decode()
    assert completed.stderr == b""
    assert completed.stdout == b'{"a":1,"z":2}'
    assert mine.runner._strict_json(completed.stdout, "miner subprocess") == {
        "a": 1,
        "z": 2,
    }


def test_decode_rows_next_center_and_named_order_are_authenticated() -> None:
    scanner = _scanner()
    values, decoded, rows = mine.decode_model(
        scanner, _model(center=7, order=1), expected_center=7
    )
    assert len(values) == 308
    assert decoded["nextCenter"] == 7
    assert decoded["NamedOrder"] == 1
    assert tuple(decoded["order"]) == mine.ORDER_TABLES[1]
    assert len(rows) == 17
    assert all(len(row.support) == 4 and row.center not in row.support for row in rows)
    assert all(row.exact is False for row in rows)

    with pytest.raises(mine.MineError, match="nextCenter"):
        mine.decode_model(scanner, _model(center=7), expected_center=2)
    malformed = _model()
    malformed["assignment"][-1] = malformed["assignment"][-2]
    with pytest.raises(mine.MineError, match="malformed or duplicated"):
        mine.decode_model(scanner, malformed, expected_center=2)


def test_complete_dimacs_replay_rejects_tamper_and_wrong_dimensions(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _patch_small_replay(monkeypatch)
    values, _, _ = mine.decode_model(_scanner(), _model(), expected_center=2)
    cnf = b"p cnf 308 3\n2 0\n-2 3 0\n307 0\n"
    receipt = mine.replay_dimacs(cnf, values)
    assert receipt["clauses_checked"] == 3
    assert receipt["all_clauses_satisfied"] is True

    with pytest.raises(mine.MineError, match="falsifies"):
        mine.replay_dimacs(b"p cnf 308 3\n-2 0\n-2 3 0\n307 0\n", values)
    with pytest.raises(mine.MineError, match="dimensions"):
        mine.replay_dimacs(b"p cnf 308 2\n2 0\n307 0\n", values)


def test_all_registered_families_are_scanned_and_exact_off_is_not_promoted() -> None:
    scanner = _scanner()
    rows = tuple(
        scanner.producer_bank.MetricRow(
            center, tuple((center + offset) % 17 for offset in range(1, 5)), False
        )
        for center in range(17)
    )
    candidates, inventory = mine.enumerate_candidates(
        scanner, rows, mine.ORDER_TABLES[0]
    )
    assert {candidate["family"] for candidate in candidates} == set(
        mine.SOURCE_VALID_FAMILIES
    )
    assert inventory["complete_equality_component_counts"]["pair_count"] == 136
    assert all(candidate["source_valid"] is True for candidate in candidates)
    assert all(
        candidate["payload"].get("canonical_bank_record", {}).get("stage")
        != "equality-exact-off-circle"
        for candidate in candidates
    )
    mine.validate_candidate_records(candidates)


def test_candidate_schema_rejects_unknown_malformed_duplicate_and_noncanonical() -> (
    None
):
    with pytest.raises(mine.MineError, match="unknown candidate family"):
        mine._candidate(
            family="invented-family",
            lean_consumer="Problem97.X.y",
            support=[[0, 1]],
            payload={"x": 1},
        )
    candidate = _candidate()
    malformed = dict(candidate)
    malformed.pop("payload")
    with pytest.raises(mine.runner.PortfolioRunnerError, match="schema"):
        mine.validate_candidate_records([malformed])
    with pytest.raises(mine.runner.PortfolioRunnerError, match="sorted and unique"):
        mine.validate_candidate_records([candidate, candidate])
    noncanonical = copy.deepcopy(candidate)
    noncanonical["support"] = list(reversed(noncanonical["support"]))
    noncanonical["candidate_id"] = mine.runner._candidate_id(noncanonical)
    noncanonical["record_sha256"] = mine._self_hash(noncanonical, "record_sha256")
    with pytest.raises(mine.runner.PortfolioRunnerError, match="not canonical"):
        mine.validate_candidate_records([noncanonical])


def test_candidate_self_hash_and_identity_change_with_content() -> None:
    candidate = _candidate()
    tampered = copy.deepcopy(candidate)
    tampered["payload"]["complete_scan"] = False
    with pytest.raises(mine.runner.PortfolioRunnerError, match="identifier"):
        mine.validate_candidate_records([tampered])
    tampered["candidate_id"] = mine.runner._candidate_id(tampered)
    with pytest.raises(mine.runner.PortfolioRunnerError, match="record hash"):
        mine.validate_candidate_records([tampered])


def test_complete_ledger_rejects_omitted_candidate_and_is_deterministic(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    inputs = _inputs(tmp_path)
    scanner = _scanner()
    _, decoded, rows = mine.decode_model(scanner, inputs.model, expected_center=2)
    candidate = _candidate()
    inventory = {
        "family_candidate_counts": {
            "formalized-core-bank": 0,
            "perpendicular-bisector-equality-component": 1,
            "two-kalmanson-cancellation": 0,
        },
        "formalized_stage_counts": {},
        "excluded_diagnostic_stage_counts": {},
        "complete_equality_component_counts": {"candidate_count": 1},
    }
    monkeypatch.setattr(
        mine,
        "enumerate_candidates",
        lambda _scanner_arg, _rows, _order: ([candidate], inventory),
    )
    first = mine.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256="6" * 64,
        dependency_inventory=_dependencies(),
    )
    second = mine.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256="6" * 64,
        dependency_inventory=_dependencies(),
    )
    assert canonical_json_bytes(first) == canonical_json_bytes(second)
    mine.validate_candidate_ledger(
        first,
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256="6" * 64,
        dependency_inventory=_dependencies(),
    )
    omitted = copy.deepcopy(first)
    omitted["candidates"] = []
    omitted["candidates_examined"] = 0
    omitted["complete_no_candidates"] = True
    omitted["manifest_sha256"] = mine._self_hash(omitted, "manifest_sha256")
    with pytest.raises(mine.MineError, match="complete scan"):
        mine.validate_candidate_ledger(
            omitted,
            inputs=inputs,
            decoded=decoded,
            scanner=scanner,
            rows=rows,
            scanner_sha256="6" * 64,
            dependency_inventory=_dependencies(),
        )


def test_scanner_source_hash_is_content_addressed_in_ledger(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    inputs = _inputs(tmp_path)
    scanner = _scanner()
    _, decoded, rows = mine.decode_model(scanner, inputs.model, expected_center=2)
    monkeypatch.setattr(
        mine,
        "enumerate_candidates",
        lambda _scanner_arg, _rows, _order: (
            [],
            {
                "family_candidate_counts": dict.fromkeys(mine.SOURCE_VALID_FAMILIES, 0),
                "formalized_stage_counts": {},
                "excluded_diagnostic_stage_counts": {},
                "complete_equality_component_counts": {"candidate_count": 0},
            },
        ),
    )
    first = mine.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256="6" * 64,
        dependency_inventory=_dependencies(),
    )
    changed = mine.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256="7" * 64,
        dependency_inventory=_dependencies(),
    )
    assert first["scanner"]["source_sha256"] != changed["scanner"]["source_sha256"]
    assert first["manifest_sha256"] != changed["manifest_sha256"]


def test_scanner_dependency_drift_fails_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    dependency = tmp_path / "dep.py"
    dependency.write_bytes(b"approved")
    dependency.chmod(0o600)
    expected = {"dep.py": {"sha256": sha256_bytes(b"approved"), "bytes": 8}}
    monkeypatch.setattr(mine, "SCANNER_DEPENDENCIES", expected)
    assert mine.authenticate_scanner_dependencies(tmp_path) == expected
    dependency.write_bytes(b"tampered")
    with pytest.raises(mine.MineError, match="dependency drifted"):
        mine.authenticate_scanner_dependencies(tmp_path)


def test_future_unapproved_formalized_stage_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    scanner = _scanner()
    rows = tuple(
        scanner.producer_bank.MetricRow(
            center, tuple((center + offset) % 17 for offset in range(1, 5)), False
        )
        for center in range(17)
    )
    monkeypatch.setattr(
        scanner.producer_bank,
        "enumerate_two_kalmanson_cancellations",
        lambda *args, **kwargs: (),
    )
    monkeypatch.setattr(
        scanner.producer_bank,
        "scan_all_formalized_cores",
        lambda *args, **kwargs: (
            {
                "stage": "equality-future-unreviewed",
                "core": {"x": 1},
                "lean_consumer": "Problem97.Future.false_of_core",
            },
        ),
    )
    with pytest.raises(mine.MineError, match="unreviewed formalized-core stage"):
        mine.enumerate_candidates(scanner, rows, mine.ORDER_TABLES[0])


@pytest.mark.parametrize("unpaired_direction", ["forward", "reverse"])
def test_two_kalmanson_does_not_promote_if_one_orientation_is_empty(
    unpaired_direction: str,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    scanner = _scanner()
    order = mine.ORDER_TABLES[0]
    rows = tuple(
        scanner.producer_bank.MetricRow(
            center, tuple((center + offset) % 17 for offset in range(1, 5)), False
        )
        for center in range(17)
    )
    record = {"hits": ((0, 1), (2, 3))}

    def enumerate_direction(_rows: Any, _n: int, cyclic: Any, **_kwargs: Any) -> Any:
        is_forward = tuple(cyclic) == order
        present = is_forward == (unpaired_direction == "forward")
        return (record,) if present else ()

    monkeypatch.setattr(
        scanner.producer_bank,
        "enumerate_two_kalmanson_cancellations",
        enumerate_direction,
    )
    asymmetric = replace(
        scanner,
        path_hits=lambda value: frozenset(value["hits"]),
        reflected=lambda hits: hits,
    )
    candidates, inventory = mine.enumerate_candidates(asymmetric, rows, order)
    assert not any(
        candidate["family"] == "two-kalmanson-cancellation" for candidate in candidates
    )
    assert inventory["family_candidate_counts"]["two-kalmanson-cancellation"] == 0


def test_two_kalmanson_asymmetric_paths_are_paired_by_minimal_union() -> None:
    scanner = _scanner()
    order = mine.ORDER_TABLES[0]
    rows = tuple(
        scanner.producer_bank.MetricRow(
            center, tuple((center + offset) % 17 for offset in range(1, 5)), False
        )
        for center in range(17)
    )
    position = {label: index for index, label in enumerate(order)}
    positive_hits = sorted(
        {
            (position[row.center], position[point])
            for row in rows
            for point in row.support
        }
    )
    first_center = positive_hits[0][0]
    same_center = [hit for hit in positive_hits if hit[0] == first_center]
    forward = {"hits": tuple(same_center[:2]), "name": "forward"}
    reverse = {"hits": tuple(same_center[1:3]), "name": "reverse"}

    def enumerate_direction(_rows: Any, _n: int, cyclic: Any, **_kwargs: Any) -> Any:
        return (forward,) if tuple(cyclic) == order else (reverse,)

    component = {
        "status": "COMPLETE",
        "complete": True,
        "lean_consumer": "unused",
        "candidates": [],
        "counts": {},
    }
    fake_producer = SimpleNamespace(
        enumerate_two_kalmanson_cancellations=enumerate_direction,
        scan_all_formalized_cores=lambda *_args, **_kwargs: (),
        complete_perpendicular_bisector_certificate=(
            lambda *_args, **_kwargs: component
        ),
    )
    asymmetric = replace(
        scanner,
        producer_bank=fake_producer,
        path_hits=lambda value: frozenset(value["hits"]),
        reflected=lambda hits: hits,
        project_record_for_lean=(lambda record, _hits, _order, _rows: record),
        lean_occurrence_check=(
            lambda hits, fwd, rev, **_kwargs: (
                frozenset(fwd["hits"]) <= hits and frozenset(rev["hits"]) <= hits
            )
        ),
        validate_complete_perpendicular_bisector_certificate=(
            lambda *_args, **_kwargs: True
        ),
    )
    candidates, inventory = mine.enumerate_candidates(asymmetric, rows, order)
    cancellation = [
        candidate
        for candidate in candidates
        if candidate["family"] == "two-kalmanson-cancellation"
    ]
    assert len(cancellation) == 1
    assert cancellation[0]["support"] == sorted(
        (list(hit) for hit in same_center[:3]), key=canonical_json_bytes
    )
    assert cancellation[0]["payload"]["occurrence_union_cover"] is True
    assert inventory["two_kalmanson_pairing_counts"] == {
        "forward_record_count": 1,
        "reverse_record_count": 1,
        "minimal_forward_support_count": 1,
        "minimal_reverse_support_count": 1,
        "paired_union_count": 1,
        "minimal_paired_union_count": 1,
    }


def test_receipts_bind_campaign_cell_wave_variable_map_cnf_model_and_ledger(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    inputs = _inputs(tmp_path)
    scanner = _scanner()
    _, decoded, rows = mine.decode_model(scanner, inputs.model, expected_center=2)
    monkeypatch.setattr(
        mine,
        "enumerate_candidates",
        lambda _scanner_arg, _rows, _order: (
            [],
            {
                "family_candidate_counts": dict.fromkeys(mine.SOURCE_VALID_FAMILIES, 0),
                "formalized_stage_counts": {},
                "excluded_diagnostic_stage_counts": {},
                "complete_equality_component_counts": {"candidate_count": 0},
            },
        ),
    )
    ledger = mine.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256="6" * 64,
        dependency_inventory=_dependencies(),
    )
    replay = {
        "num_variables": 308,
        "clauses_checked": 7_409_522,
        "all_clauses_satisfied": True,
    }
    first = mine.build_receipts(
        inputs=inputs, replay=replay, ledger=ledger, output_dir=tmp_path / "evidence"
    )
    second = mine.build_receipts(
        inputs=inputs, replay=replay, ledger=ledger, output_dir=tmp_path / "evidence"
    )
    assert first == second
    receipt = mine.strict_json(first["sat-replay-receipt.json"], "replay")
    assert receipt["producer_manifest_sha256"] == sha256_bytes(inputs.producer_raw)
    assert receipt["wave_manifest_sha256"] == sha256_bytes(inputs.wave_raw)
    assert receipt["variable_map_sha256"] == "1" * 64
    acceptance = mine.strict_json(first["canary-acceptance.json"], "acceptance")
    assert acceptance["campaign_sha256"] == inputs.campaign_sha256
    assert acceptance["portfolio_cell_id"] == inputs.cell["portfolio_cell_id"]
    assert acceptance["manifest_sha256"] == mine._self_hash(
        acceptance, "manifest_sha256"
    )


def test_authenticate_inputs_binds_terminal_model_and_rereads_manifests(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "run"
    artifacts = run_root / "artifacts"
    artifacts.mkdir(parents=True)
    campaign_raw = canonical_json_bytes({"campaign": "test"})
    run_raw = canonical_json_bytes({"run": "test"})
    (artifacts / "campaign-manifest.json").write_bytes(campaign_raw)
    (run_root / "run_manifest.json").write_bytes(run_raw)
    producer_path = tmp_path / "producer.json"
    wave_path = tmp_path / "wave.json"
    producer_path.write_bytes(_producer())
    wave_raw = canonical_json_bytes({"wave": "test"})
    wave_path.write_bytes(wave_raw)
    for path in (
        artifacts / "campaign-manifest.json",
        run_root / "run_manifest.json",
        producer_path,
        wave_path,
    ):
        path.chmod(0o600)
    canary_id = mine.runner.CANARY_PORTFOLIO_CELL_ID
    cell = {
        "portfolio_cell_id": canary_id,
        "center": 2,
        "producer_manifest": {
            "path": "producer.json",
            "sha256": sha256_bytes(_producer()),
            "bytes": len(_producer()),
        },
        "wave_manifest": {
            "path": "wave.json",
            "sha256": sha256_bytes(wave_raw),
            "bytes": len(wave_raw),
        },
    }
    model_raw = json.dumps(_model(), sort_keys=True).encode() + b"\n"
    terminal = {
        "portfolio_cell_id": canary_id,
        "job_id": "job-1",
        "outcome": mine.runner.STRUCTURAL_SAT,
        "terminal_record_sha256": "4" * 64,
        "journal_record_count": 3,
        "seal_sha256": "5" * 64,
        "artifacts": {"model_sha256": sha256_bytes(model_raw)},
    }
    monkeypatch.setattr(mine.runner, "OUTPUT_ROOT", run_root)
    monkeypatch.setattr(
        mine.runner,
        "static_check",
        lambda **kwargs: {
            "cells": [cell],
            "campaign_sha256": sha256_bytes(campaign_raw),
            "run_manifest_sha256": sha256_bytes(run_raw),
        },
    )
    monkeypatch.setattr(
        mine.runner,
        "_load_cell_inputs",
        lambda root, selected: (b"p cnf 308 1\n1 0\n", _producer(), {"wave": "test"}),
    )
    monkeypatch.setattr(mine.runner, "_terminal_cell", lambda *args: terminal)
    monkeypatch.setattr(mine.runner, "_artifact_bytes", lambda *args: model_raw)
    authenticated = mine.authenticate_inputs(
        root=tmp_path, run_root=run_root, portfolio_cell_id=canary_id
    )
    assert authenticated.campaign_sha256 == sha256_bytes(campaign_raw)
    assert authenticated.model_raw == model_raw

    broken_terminal = copy.deepcopy(terminal)
    broken_terminal["artifacts"]["model_sha256"] = "9" * 64
    monkeypatch.setattr(mine.runner, "_terminal_cell", lambda *args: broken_terminal)
    with pytest.raises(mine.MineError, match="model digest drifted"):
        mine.authenticate_inputs(
            root=tmp_path, run_root=run_root, portfolio_cell_id=canary_id
        )


def test_authentication_uses_full_static_check_not_forged_self_rehash(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "run"
    (run_root / "artifacts").mkdir(parents=True)
    monkeypatch.setattr(mine.runner, "OUTPUT_ROOT", run_root)
    validate_called = False

    def weak_validate(*args: Any, **kwargs: Any) -> dict[str, Any]:
        nonlocal validate_called
        validate_called = True
        return {"cells": []}

    monkeypatch.setattr(mine.runner, "validate_campaign_payload", weak_validate)
    monkeypatch.setattr(
        mine.runner,
        "static_check",
        lambda **kwargs: (_ for _ in ()).throw(
            mine.runner.PortfolioRunnerError("support pin drifted")
        ),
    )
    with pytest.raises(mine.runner.PortfolioRunnerError, match="support pin drifted"):
        mine.authenticate_inputs(
            root=tmp_path,
            run_root=run_root,
            portfolio_cell_id=mine.runner.CANARY_PORTFOLIO_CELL_ID,
        )
    assert validate_called is False


def test_output_must_be_exact_nonsymlink_runner_artifact_directory(
    tmp_path: Path,
) -> None:
    run_root = tmp_path / "run"
    artifacts = run_root / "artifacts"
    artifacts.mkdir(parents=True, mode=0o700)
    mine.validate_output_dir(run_root, artifacts)
    elsewhere = tmp_path / "elsewhere"
    elsewhere.mkdir(mode=0o700)
    with pytest.raises(mine.MineError, match="runner artifact directory"):
        mine.validate_output_dir(run_root, elsewhere)

    symlink_run = tmp_path / "symlink-run"
    symlink_run.mkdir(mode=0o700)
    (symlink_run / "artifacts").symlink_to(elsewhere, target_is_directory=True)
    with pytest.raises(mine.MineError, match="not a directory"):
        mine.validate_output_dir(symlink_run, symlink_run / "artifacts")


def test_write_once_fsyncs_parent_and_rejects_changed_output(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "receipt.json"
    observed_modes: list[int] = []
    original_fsync = os.fsync

    def recording_fsync(descriptor: int) -> None:
        observed_modes.append(os.fstat(descriptor).st_mode)
        original_fsync(descriptor)

    monkeypatch.setattr(mine.os, "fsync", recording_fsync)
    mine._write_once(path, b"one")
    assert any(stat.S_ISREG(mode) for mode in observed_modes)
    assert any(stat.S_ISDIR(mode) for mode in observed_modes)
    mine._write_once(path, b"one")
    with pytest.raises(mine.MineError, match="differs"):
        mine._write_once(path, b"two")


def test_verify_existing_recomputes_and_byte_compares_all_four_receipts_without_writes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    run_root = tmp_path / "run"
    output_dir = run_root / "artifacts"
    output_dir.mkdir(parents=True, mode=0o700)
    inputs = replace(_inputs(tmp_path), run_root=run_root, cnf=b"p cnf 308 1\n2 0\n")
    scanner = _scanner()
    miner_path = tmp_path / "miner.py"
    miner_path.write_bytes(b"authenticated miner")
    miner_path.chmod(0o600)
    monkeypatch.setattr(mine, "MINER_RELATIVE", "miner.py")
    monkeypatch.setattr(mine, "NUM_CLAUSES", 1)
    monkeypatch.setattr(
        mine,
        "enumerate_candidates",
        lambda _scanner_arg, _rows, _order: (
            [],
            {
                "family_candidate_counts": dict.fromkeys(mine.SOURCE_VALID_FAMILIES, 0),
                "formalized_stage_counts": {},
                "excluded_diagnostic_stage_counts": {},
                "complete_equality_component_counts": {"candidate_count": 0},
            },
        ),
    )
    values, decoded, rows = mine.decode_model(scanner, inputs.model, expected_center=2)
    replay = mine.replay_dimacs(inputs.cnf, values)
    ledger = mine.build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=sha256_bytes(b"authenticated miner"),
        dependency_inventory=_dependencies(),
    )
    receipts = mine.build_receipts(
        inputs=inputs, replay=replay, ledger=ledger, output_dir=output_dir
    )
    for name in mine.RECEIPT_NAMES:
        mine._write_once(output_dir / name, receipts[name])

    monkeypatch.setattr(mine, "authenticate_inputs", lambda **_kwargs: inputs)
    monkeypatch.setattr(mine, "load_scanner_modules", lambda _root: scanner)
    monkeypatch.setattr(
        mine,
        "_write_once",
        lambda *_args, **_kwargs: (_ for _ in ()).throw(AssertionError("write")),
    )
    verified = mine.verify_existing(
        root=tmp_path,
        run_root=run_root,
        portfolio_cell_id=mine.runner.CANARY_PORTFOLIO_CELL_ID,
        output_dir=output_dir,
    )
    assert set(verified) == {
        "schema",
        "status",
        "portfolio_cell_id",
        "campaign_sha256",
        "run_manifest_sha256",
        "model_sha256",
        "cnf_sha256",
        "candidate_ledger_sha256",
        "scanner_dependencies_sha256",
        "family_inventory_sha256",
        "decoded_selectors_sha256",
        "receipt_sha256s",
    }
    assert verified["schema"] == mine.VERIFICATION_SCHEMA
    assert set(verified["receipt_sha256s"]) == set(mine.RECEIPT_NAMES)
    assert verified["scanner_dependencies_sha256"] == sha256_bytes(
        canonical_json_bytes(ledger["scanner_dependencies"])
    )
    assert verified["family_inventory_sha256"] == sha256_bytes(
        canonical_json_bytes(ledger["family_inventory"])
    )
    assert verified["decoded_selectors_sha256"] == sha256_bytes(
        canonical_json_bytes(ledger["decoded_selectors"])
    )

    acceptance = output_dir / "canary-acceptance.json"
    acceptance.write_bytes(receipts["canary-acceptance.json"] + b" ")
    with pytest.raises(
        mine.MineError, match="persisted canary-acceptance.json drifted"
    ):
        mine.verify_existing(
            root=tmp_path,
            run_root=run_root,
            portfolio_cell_id=mine.runner.CANARY_PORTFOLIO_CELL_ID,
            output_dir=output_dir,
        )
