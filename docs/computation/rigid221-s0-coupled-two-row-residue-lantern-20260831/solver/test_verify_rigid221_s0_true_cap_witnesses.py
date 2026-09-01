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

import verify_rigid221_s0_true_cap_witnesses as verifier


def retained_document() -> object:
    path = SOLVER_DIR / "s0-true-cap-wave2-witnesses.json"
    return json.loads(path.read_text(encoding="utf-8"))


def test_independent_verifier_accepts_both_exact_l1_witnesses() -> None:
    assert verifier.verify_document(retained_document()) == {
        "status": "VERIFIED_SAT_EXACT_L1_CAP_TWO_ROW_CORE",
        "l1_cap_two_row_core": True,
        "full_theorem": False,
        "counterexample_data": False,
        "l2": False,
        "l3": False,
    }


def test_verifier_rejects_top_level_status_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["status"] = "SAT_EXACT_COUNTEREXAMPLE_DATA"
    with pytest.raises(verifier.VerificationError, match="status upgrade"):
        verifier.verify_document(mutated)


def test_verifier_rejects_branch_status_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-I"]["status"] = "FULL_THEOREM"
    with pytest.raises(verifier.VerificationError, match="S0-I status upgrade"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_coordinate() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-N"]["points"]["qu1"][0] = "0/1"
    with pytest.raises(verifier.VerificationError, match="coordinates"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_cap() -> None:
    mutated = copy.deepcopy(retained_document())
    cap = mutated["branches"]["S0-I"]["caps"]["members"]["C1"]
    cap.remove("s")
    with pytest.raises(verifier.VerificationError, match="CapTriple"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_cap_endpoint_membership() -> None:
    mutated = copy.deepcopy(retained_document())
    endpoint_pattern = mutated["branches"]["S0-N"]["caps"]["cap_triple_axioms"][
        "endpoint_pattern"
    ]
    endpoint_pattern["v2"]["C2"] = True
    with pytest.raises(verifier.VerificationError, match="CapTriple"):
        verifier.verify_document(mutated)


def test_verifier_requires_every_certificate_field() -> None:
    mutated = copy.deepcopy(retained_document())
    del mutated["branches"]["S0-N"]["mec"]["enclosure_slacks"]["cv"]
    with pytest.raises(verifier.VerificationError, match="MEC"):
        verifier.verify_document(mutated)


def test_verifier_rejects_claim_scope_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["claim_scope"]["full_theorem"] = True
    with pytest.raises(verifier.VerificationError, match="claim-scope upgrade"):
        verifier.verify_document(mutated)
