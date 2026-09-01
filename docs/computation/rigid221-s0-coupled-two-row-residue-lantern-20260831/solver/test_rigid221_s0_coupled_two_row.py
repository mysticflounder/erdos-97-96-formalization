# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))

import rigid221_s0_coupled_two_row as producer
import verify_rigid221_s0_coupled_two_row as verifier


def split_documents(report: dict[str, object]) -> tuple[dict[str, object], dict[str, object]]:
    row = {
        "schema": report["schema"],
        "status": producer.SEED_STATUS,
        "points": report["points"],
        "cyclic_order": report["cyclic_order"],
        "row_core": report["row_core"],
        "claim_scope": report["claim_scope"],
    }
    mec = {
        "schema": report["schema"],
        "status": producer.SEED_STATUS,
        "prior_single_row_mec": report["prior_single_row_mec"],
        "coupled_row_mec": report["coupled_row_mec"],
        "source_obstruction": report["source_obstruction"],
        "remaining_gap": report["remaining_gap"],
    }
    return row, mec


def test_exact_report_values() -> None:
    report = producer.build_report()
    row_core = report["row_core"]
    coupled_mec = report["coupled_row_mec"]
    assert report["status"] == "ENCODING_BLOCKED"
    assert report["claim_scope"]["seed_source_valid"] is False
    assert row_core["physical_radius_squared"] == "1/1"
    assert row_core["ku_radius_squared"] == "17/25"
    assert row_core["kv_radius_squared"] == "53649709/67240000"
    assert row_core["orientation_checks"] == 120
    assert row_core["minimum_orientation"] == "2/5525"
    assert row_core["post_u_max_positive_multiplicity"] == 3
    assert row_core["post_v_max_positive_multiplicity"] == 3
    assert coupled_mec["center"] == ["3526/6749", "-215/6749"]
    assert coupled_mec["radius_squared"] == "4900/6749"
    assert coupled_mec["boundary_roles"] == ["v", "xv"]


def test_independent_verifier_accepts_exact_documents() -> None:
    row, mec = split_documents(producer.build_report())
    result = verifier.verify_documents(row, mec)
    assert result == {
        "status": "VERIFIED",
        "row_core_exact": True,
        "mec_boundary_roles": ["v", "xv"],
        "mec_boundary_cardinality": 2,
        "surplus_cap_packet_available": False,
        "l1_s0_i_decided": False,
        "l1_s0_n_decided": False,
    }


def test_independent_verifier_rejects_coordinate_mutation() -> None:
    row, mec = split_documents(producer.build_report())
    mutated = copy.deepcopy(row)
    mutated["points"]["au"][0] = "1/24"
    with pytest.raises(verifier.VerificationError):
        verifier.verify_documents(mutated, mec)


def test_independent_verifier_rejects_slack_mutation() -> None:
    row, mec = split_documents(producer.build_report())
    mutated = copy.deepcopy(mec)
    mutated["coupled_row_mec"]["strict_interior_slacks"]["O"] = "1/1"
    with pytest.raises(verifier.VerificationError, match="slack"):
        verifier.verify_documents(row, mutated)


def test_independent_verifier_rejects_status_upgrade() -> None:
    row, mec = split_documents(producer.build_report())
    mutated = copy.deepcopy(row)
    mutated["status"] = "SAT_EXACT"
    with pytest.raises(verifier.VerificationError, match="status"):
        verifier.verify_documents(mutated, mec)
