# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import json
import sys
from pathlib import Path

import pytest

SOLVER_DIR = Path(__file__).parent
sys.path.insert(0, str(SOLVER_DIR))

import verify_rigid221_s0_true_cap as verifier


def load(name: str) -> object:
    return json.loads((SOLVER_DIR / name).read_text(encoding="utf-8"))


def documents() -> tuple[object, object, object]:
    return (
        load("prior-seed-row-core.json"),
        load("s0-true-cap-wave1-obstruction.json"),
        load("s0-true-cap-wave1-result.json"),
    )


def test_independent_verifier_accepts_scoped_wave() -> None:
    assert verifier.verify_documents(*documents()) == {
        "status": "VERIFIED_SCOPED_OBSTRUCTION",
        "fixed_cell_mec_exact": True,
        "fixed_cell_boundary_roles": ["v", "xv"],
        "physical_O_boundary_required": True,
        "physical_O_on_fixed_mec_boundary": False,
        "physical_O_strict_interior_slack": "3051/6749",
        "minimal_fixed_cell_source_core": ["TC-03"],
        "s0_i_fixed_cell": "UNSAT_FIXED_CELL_EXACT",
        "s0_n_fixed_cell": "UNSAT_FIXED_CELL_EXACT",
        "bounded_grid_claim_boundary_verified": True,
        "l1_s0_i_decided": False,
        "l1_s0_n_decided": False,
        "sat_exact_witness_reconstructed": False,
    }


def test_independent_verifier_rejects_O_slack_mutation() -> None:
    row, obstruction, search = documents()
    mutated = copy.deepcopy(obstruction)
    mutated["exact_mec_certificate"]["enclosure_slacks"]["O"] = "1/1"
    with pytest.raises(verifier.VerificationError, match="slacks"):
        verifier.verify_documents(row, mutated, search)


def test_independent_verifier_rejects_search_status_upgrade() -> None:
    row, obstruction, search = documents()
    mutated = copy.deepcopy(search)
    mutated["status"] = "SAT_EXACT"
    with pytest.raises(verifier.VerificationError, match="search status"):
        verifier.verify_documents(row, obstruction, mutated)


def test_independent_verifier_rejects_universal_claim() -> None:
    row, obstruction, search = documents()
    mutated = copy.deepcopy(search)
    mutated["claim_scope"]["source_universal_claim"] = True
    with pytest.raises(verifier.VerificationError, match="universal"):
        verifier.verify_documents(row, obstruction, mutated)
