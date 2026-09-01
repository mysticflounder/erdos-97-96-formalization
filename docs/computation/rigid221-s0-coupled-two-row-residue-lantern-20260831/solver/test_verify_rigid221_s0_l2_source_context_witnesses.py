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

import verify_rigid221_s0_l2_source_context_witnesses as verifier


def retained_document() -> object:
    path = SOLVER_DIR / "s0-true-cap-wave2-l2-witnesses.json"
    return json.loads(path.read_text(encoding="utf-8"))


def test_verifier_accepts_both_exact_l2_source_context_cores() -> None:
    assert verifier.verify_document(retained_document()) == {
        "status": "VERIFIED_SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE",
        "l2_source_context_geometric_core": True,
        "CounterexampleData": False,
        "CriticalShellSystem": False,
        "OriginalUniqueFourResidual": False,
        "Minimal": False,
        "JointDeletion": False,
        "CommonDeletion": False,
        "robust_surface": False,
        "global_K4": False,
        "full_theorem": False,
    }


def test_verifier_rejects_status_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["status"] = "SAT_EXACT_COUNTEREXAMPLE_DATA"
    with pytest.raises(verifier.VerificationError, match="status upgrade"):
        verifier.verify_document(mutated)


def test_verifier_rejects_branch_status_injection() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-I"]["status"] = "FULL_THEOREM"
    with pytest.raises(verifier.VerificationError, match="S0-I status upgrade"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_extension_coordinate() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-N"]["points"]["fq"][0] = "0/1"
    with pytest.raises(verifier.VerificationError, match="coordinates"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_updated_cap() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-I"]["caps"]["members"]["C2"].remove("fq")
    with pytest.raises(verifier.VerificationError, match="caps/J"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_cap_endpoint_membership() -> None:
    mutated = copy.deepcopy(retained_document())
    endpoint_pattern = mutated["branches"]["S0-I"]["caps"]["cap_triple_axioms"][
        "endpoint_pattern"
    ]
    endpoint_pattern["v3"]["C3"] = True
    with pytest.raises(verifier.VerificationError, match="caps/J"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_conditional_opp_mapping() -> None:
    mutated = copy.deepcopy(retained_document())
    mapping = mutated["branches"]["S0-N"]["packet"][
        "conditional_surplus_index_zero_mapping"
    ]
    mapping["computed_oppIndex2"] = 1
    with pytest.raises(verifier.VerificationError, match="packet"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_first_apex_localization() -> None:
    mutated = copy.deepcopy(retained_document())
    checks = mutated["branches"]["S0-N"]["first_apex"][
        "retained_pair_localization_over_every_modeled_carrier_role"
    ]["checks"]
    checks["fq"]["implication_holds"] = False
    with pytest.raises(verifier.VerificationError, match="first-apex"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_source_context_survival() -> None:
    mutated = copy.deepcopy(retained_document())
    retained = mutated["branches"]["S0-I"]["source_context"][
        "retained_pair_omission_and_survival"
    ]
    retained["source_survives_delete_fq"] = False
    with pytest.raises(verifier.VerificationError, match="source-context"):
        verifier.verify_document(mutated)


def test_verifier_rejects_mutated_modeled_source_outside_proxy() -> None:
    mutated = copy.deepcopy(retained_document())
    checks = mutated["branches"]["S0-I"]["source_context"][
        "modeled_source_context_geometry_checks"
    ]
    checks["modeled_source_outside_first_apex_blocker_fiber_proxy"] = False
    with pytest.raises(verifier.VerificationError, match="source-context"):
        verifier.verify_document(mutated)


def test_verifier_rejects_actual_global_deletion_field_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    actual = mutated["branches"]["S0-N"]["rows"][
        "global_deletion_modeled_finite_set_predicates"
    ]["actual_Lean_global_deletion_fields_instantiated"]
    actual["rigid"] = True
    with pytest.raises(verifier.VerificationError, match="rows/centers"):
        verifier.verify_document(mutated)


def test_verifier_rejects_claim_scope_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["claim_scope"]["CounterexampleData"] = True
    with pytest.raises(verifier.VerificationError, match="claim-scope upgrade"):
        verifier.verify_document(mutated)


def test_verifier_rejects_source_anchor_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["source_anchors"]["opp_index2"] = (
        "lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:543"
    )
    with pytest.raises(verifier.VerificationError, match="source anchors"):
        verifier.verify_document(mutated)


def test_verifier_requires_every_certificate_field() -> None:
    mutated = copy.deepcopy(retained_document())
    del mutated["branches"]["S0-N"]["rows"]["Ku"]["complete_ambient_fiber"]
    with pytest.raises(verifier.VerificationError, match="rows/centers"):
        verifier.verify_document(mutated)


def test_verifier_rejects_input_provenance_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["input_provenance"]["sha256"] = "0" * 64
    with pytest.raises(verifier.VerificationError, match="input provenance"):
        verifier.verify_document(mutated)
