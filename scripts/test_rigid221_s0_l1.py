#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for the fixed distinct 12-role positive-control harness."""

from __future__ import annotations

import copy
import hashlib
import json
import re
import sys
from fractions import Fraction as F
from pathlib import Path

import pytest
import z3

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_l1 as mod


@pytest.fixture(scope="module")
def discovery() -> mod.ExecutionBundle:
    return mod.run_discovery(timeout_ms=5_000)


def assert_full_scope_ledger(result: dict[str, object]) -> None:
    assert result["claim_scope"] == mod.CLAIM_SCOPE
    assert result["full_L1_claim"] is False
    assert result["s0_claim"] is False
    assert result["promotion_claim"] is False
    assert result["source_binding_claim"] is False
    assert result["encoded"] == list(mod.ENCODED_FACTS)
    assert result["assumptions"] == list(mod.ASSUMPTIONS)
    assert result["omitted"] == list(mod.OMITTED_FACTS)


def test_prior_nine_point_witness_is_used_as_the_fixed_seed() -> None:
    assert mod.SEED_POINTS == {
        "O": (F(0), F(0)),
        "u": (F(3, 5), F(-4, 5)),
        "xu": (F(3, 5), F(4, 5)),
        "delta": (F(33, 65), F(-56, 65)),
        "v": (F(8, 17), F(-15, 17)),
        "xv": (F(228, 397), F(325, 397)),
        "cu": (F(4, 5), F(0)),
        "au": (F(1, 25), F(-8, 25)),
        "bu": (F(12, 25), F(19, 25)),
    }


def test_known_exact_twelve_point_candidate() -> None:
    candidate = mod.known_candidate()
    points = candidate.point_map()
    assert points["cv"] == (F(79, 100), F(-79, 1640))
    assert points["av"] == (F(237, 2050), F(-2599, 4100))
    assert points["bv"] == (F(13557, 26650), F(2131, 2665))

    report = mod.verify_candidate(candidate)
    assert report.physical_radius_squared == 1
    assert report.ku_radius_squared == F(17, 25)
    assert report.kv_radius_squared == F(53649709, 67240000)
    assert report.edge_minimum > 0
    assert report.post_u_max_multiplicity == 3
    assert report.post_v_max_multiplicity == 3


def test_bounded_grid_rediscovers_the_least_denominator_candidate() -> None:
    outcome = mod.bounded_grid_search()
    assert outcome.candidate == mod.known_candidate()
    assert outcome.attempted == 11 * 9 * 41
    assert outcome.exact_survivors > 0
    assert outcome.cv_x == F(79, 100)
    assert outcome.av_rotation == F(-1, 4)
    assert outcome.bv_rotation == F(-14, 5)


def test_known_sat_and_known_unsat_qf_nra_smokes() -> None:
    smokes = mod.run_solver_smokes(timeout_ms=5_000)
    assert smokes["known_sat"] == {
        "expected": "sat with x=1",
        "observed": "sat",
        "exact_readback": "1",
        "passed": True,
    }
    assert smokes["known_unsat"] == {
        "expected": "unsat",
        "observed": "unsat",
        "passed": True,
    }


def test_qf_nra_mirror_has_exact_fraction_readback() -> None:
    candidate = mod.known_candidate()
    solver, variables = mod.build_candidate_solver(candidate, timeout_ms=5_000)
    assert solver.check() == z3.sat
    readback = mod.exact_model_readback(solver.model(), variables)
    assert readback == candidate
    assert mod.verify_candidate(readback) == mod.verify_candidate(candidate)
    smt2 = mod.export_smt2(solver)
    assert "QF_NRA" in smt2
    assert smt2.endswith("(check-sat)\n(get-model)\n")
    second_solver, _second_variables = mod.build_candidate_solver(
        candidate, timeout_ms=5_000
    )
    assert mod.export_smt2(second_solver) == smt2


def test_exact_verifier_rejects_all_mutations_at_expected_layer() -> None:
    mutations = mod.mutation_checks()
    assert set(mutations) == {
        "duplicate_point",
        "cyclic_order_swap",
        "physical_radius_nudge",
        "kv_radius_nudge",
        "off_row_fiber_contamination",
        "mutual_omission_role_identification",
        "center_role_identification",
        "center_physical_exclusion",
        "ku_post_deletion_blocking",
        "kv_post_deletion_blocking",
    }
    assert all(item["passed"] for item in mutations.values())


def test_discovery_status_is_fixed_positive_control_only(
    discovery: mod.ExecutionBundle,
) -> None:
    result = discovery.result
    assert result["status"] == mod.SAT_STATUS
    assert_full_scope_ledger(result)
    assert result["solver"]["logic"] == "QF_NRA"
    assert result["solver"]["exact_rational_readback"] is True
    assert result["witness"]["carrier_cardinality"] == 12
    assert any("exactly the 12 named roles" in fact for fact in result["assumptions"])
    assert any("pairwise-distinct" in fact for fact in result["assumptions"])
    assert any("off-row support roles" in fact for fact in result["assumptions"])
    assert all(
        not (fact.startswith("complete") and "ambient" in fact)
        for fact in result["encoded"]
    )
    assert all(
        "complete within modeled 12-role carrier" in fact
        for fact in result["encoded"][2:5]
    )
    assert "Cap and cap-complete L1 geometry" in result["omitted"]
    assert "S0-I" in result["omitted"]
    assert "S0-N" in result["omitted"]
    assert "q/w roles and constraints" in result["omitted"]
    assert "ExactFourMutualOmissionSourceContext" in result["omitted"]
    assert "packet rows and SurplusCapPacket data" in result["omitted"]
    assert "ExactFourPostCardElevenRobustSurface" in result["omitted"]

    provenance = result["runtime_provenance"]
    assert (
        provenance["script_sha256"]
        == hashlib.sha256(Path(mod.__file__).read_bytes()).hexdigest()
    )
    assert provenance["git_head"] == "unavailable" or re.fullmatch(
        r"[0-9a-f]{40}", provenance["git_head"]
    )
    assert (
        "does not authenticate uncommitted script bytes"
        in provenance["authentication_claim"]
    )


def test_discovery_solver_smoke_unknown_is_unknown(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        mod,
        "run_solver_smokes",
        lambda _timeout_ms: {
            "known_sat": {
                "expected": "sat with x=1",
                "observed": "unknown",
                "exact_readback": None,
                "passed": False,
            },
            "known_unsat": {
                "expected": "unsat",
                "observed": "unsat",
                "passed": True,
            },
        },
    )
    bundle = mod.run_discovery(timeout_ms=1)
    assert bundle.result["status"] == mod.UNKNOWN_STATUS
    assert "inconclusive" in bundle.result["reason"]
    assert_full_scope_ledger(bundle.result)


def test_smoke_candidate_timeout_is_unknown(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        mod,
        "_solver_check_candidate",
        lambda _candidate, _timeout_ms: ("unknown", "timeout", None, "(check-sat)\n"),
    )
    result = mod.run_smoke(timeout_ms=1)
    assert result["status"] == mod.UNKNOWN_STATUS
    assert result["candidate_reason_unknown"] == "timeout"
    assert mod._exit_code(result["status"]) == 2
    assert_full_scope_ledger(result)


def test_smoke_solver_contradiction_is_encoding_blocked(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        mod,
        "_solver_check_candidate",
        lambda _candidate, _timeout_ms: ("unsat", None, None, "(check-sat)\n"),
    )
    result = mod.run_smoke(timeout_ms=5_000)
    assert result["status"] == mod.BLOCKED_STATUS
    assert "rejected" in result["candidate_error"]
    assert mod._exit_code(result["status"]) == 1


def test_no_write_replay_accepts_current_exact_result(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
    discovery: mod.ExecutionBundle,
) -> None:
    result_path = tmp_path / "input-result.json"
    result_path.write_text(json.dumps(discovery.result), encoding="utf-8")
    monkeypatch.chdir(tmp_path)
    before = {path.name for path in tmp_path.iterdir()}
    return_code = mod.main(["--replay-result", str(result_path)])
    replay = json.loads(capsys.readouterr().out)
    after = {path.name for path in tmp_path.iterdir()}
    assert return_code == 0
    assert replay["status"] == mod.SAT_STATUS
    assert replay["mode"] == "no-write-replay"
    assert replay["writes_files"] is False
    assert replay["replayed"] is True
    assert replay["solver_reexecution"] is False
    assert_full_scope_ledger(replay)
    assert after == before == {"input-result.json"}


@pytest.mark.parametrize(
    ("mutation", "expected_code"),
    [
        ("false_status", "replay_status"),
        ("missing_role", "replay_roles"),
        ("extra_role", "replay_roles"),
        ("corrupt_coordinate", "physical_class"),
        ("noncanonical_fraction", "replay_fraction"),
        ("stale_script", "replay_stale_script"),
    ],
)
def test_serialized_result_mutations_are_rejected(
    discovery: mod.ExecutionBundle, mutation: str, expected_code: str
) -> None:
    document = copy.deepcopy(discovery.result)
    if mutation == "false_status":
        document["status"] = mod.UNKNOWN_STATUS
    elif mutation == "missing_role":
        del document["witness"]["points"]["bv"]
    elif mutation == "extra_role":
        document["witness"]["points"]["rogue"] = {"x": "2", "y": "3"}
    elif mutation == "corrupt_coordinate":
        document["witness"]["points"]["delta"]["y"] = mod._fraction_text(
            F(-56, 65) + F(1, 10**9)
        )
    elif mutation == "noncanonical_fraction":
        document["witness"]["points"]["O"]["x"] = "0/1"
    elif mutation == "stale_script":
        document["runtime_provenance"]["script_sha256"] = "0" * 64
    else:
        raise AssertionError(mutation)

    with pytest.raises(mod.VerificationError) as exc_info:
        mod.parse_serialized_result(document)
    assert exc_info.value.code == expected_code


def test_no_write_smoke_mode_creates_no_files(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    monkeypatch.chdir(tmp_path)
    return_code = mod.main(["--smoke", "--timeout-ms", "5000"])
    output = json.loads(capsys.readouterr().out)
    assert return_code == 0
    assert output["status"] == mod.SAT_STATUS
    assert output["mode"] == "no-write-smoke"
    assert output["writes_files"] is False
    assert_full_scope_ledger(output)
    assert list(tmp_path.iterdir()) == []


def test_explicit_output_directory_writes_deterministic_json_and_smt2(
    tmp_path: Path,
    discovery: mod.ExecutionBundle,
    capsys: pytest.CaptureFixture[str],
) -> None:
    output_dir = tmp_path / "l1-v1"
    return_code = mod.main(["--output-dir", str(output_dir), "--timeout-ms", "5000"])
    summary = json.loads(capsys.readouterr().out)
    assert return_code == 0
    assert summary == {
        "positive_control_found": True,
        "result": "positive_control_result.json",
        "smt2": "positive_control_query.smt2",
        "status": mod.SAT_STATUS,
    }

    result_path = output_dir / "positive_control_result.json"
    smt2_path = output_dir / "positive_control_query.smt2"
    assert json.loads(result_path.read_text(encoding="utf-8")) == discovery.result
    assert smt2_path.read_text(encoding="utf-8") == discovery.smt2

    first_json = result_path.read_bytes()
    first_smt2 = smt2_path.read_bytes()
    mod.write_bundle(output_dir, discovery)
    assert result_path.read_bytes() == first_json
    assert smt2_path.read_bytes() == first_smt2


def test_cli_rejects_implicit_write_mode() -> None:
    with pytest.raises(SystemExit) as exc_info:
        mod.parse_args([])
    assert exc_info.value.code == 2
