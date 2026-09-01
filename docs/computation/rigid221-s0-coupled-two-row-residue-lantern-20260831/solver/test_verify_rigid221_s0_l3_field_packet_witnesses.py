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

import verify_rigid221_s0_l3_field_packet_witnesses as verifier


def retained_document() -> object:
    return json.loads(
        (SOLVER_DIR / "s0-true-cap-wave2-l3-witnesses.json").read_text(encoding="utf-8")
    )


def test_accepts_both_exact_l3_field_packets() -> None:
    assert verifier.verify_document(retained_document()) == {
        "status": "VERIFIED_SAT_EXACT_L3_FIELD_LEVEL_GEOMETRIC_PACKET",
        "l3_named_field_level_finite_geometry": True,
        "full_typed_Lean_packets": False,
        "CounterexampleData": False,
        "CriticalShellSystem": False,
        "OriginalUniqueFourResidual": False,
        "K4": False,
        "Minimal": False,
        "JointDeletion": False,
        "RobustSurface": False,
        "Rigid221GlobalDeletion": False,
        "full_theorem": False,
    }


def test_rejects_mutated_coordinate() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-I"]["points"]["d2"][0] = "0/1"
    with pytest.raises(verifier.VerificationError, match="S0-I exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_mutated_delta_row() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-N"]["finite_core"]["delta_row"]["radius_squared"] = "1/1"
    with pytest.raises(verifier.VerificationError, match="S0-N exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_joint_packet_overlap_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    packet = mutated["branches"]["S0-I"]["joint_deletion"]["modeled_uPacket"]
    packet["modeled_overlap_roles"] = []
    packet["modeled_overlap_cardinality"] = 0
    with pytest.raises(verifier.VerificationError, match="S0-I exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_joint_packet_omission_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    row = mutated["branches"]["S0-N"]["joint_deletion"]["modeled_vPacket"][
        "modeled_row1"
    ]
    row["modeled_q_not_mem"] = False
    with pytest.raises(verifier.VerificationError, match="S0-N exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_robustness_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    check = mutated["branches"]["S0-I"]["robust_surface"][
        "modeled_secondApex_robust_deletion_checks"
    ]["delta"]
    check["survives"] = False
    with pytest.raises(verifier.VerificationError, match="S0-I exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_cap_growth_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-N"]["robust_surface"]["modeled_capGrowth"][
        "constructor"
    ] = "firstOpposite"
    with pytest.raises(verifier.VerificationError, match="S0-N exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_singleton_deletion_restoration_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    restoration = mutated["branches"]["S0-I"]["global_deletion"][
        "modeled_restores_quantified_over_deleted"
    ][0]
    restoration["restored_K4_holds"] = False
    with pytest.raises(verifier.VerificationError, match="S0-I exact field packet"):
        verifier.verify_document(mutated)


@pytest.mark.parametrize(
    "field",
    [
        "full_typed_Lean_packets",
        "CounterexampleData",
        "CriticalShellSystem",
        "OriginalUniqueFourResidual",
        "global_K4",
        "full_theorem",
        "lean_claim",
        "promotion_claim",
    ],
)
def test_rejects_scope_upgrade(field: str) -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["claim_scope"][field] = True
    with pytest.raises(verifier.VerificationError, match="claim-scope upgrade"):
        verifier.verify_document(mutated)


def test_rejects_actual_typed_packet_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-I"]["joint_deletion"][
        "actual_typed_ExactFourMutualOmissionJointDeletion_instantiated"
    ] = True
    with pytest.raises(verifier.VerificationError, match="S0-I exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_cap_endpoint_membership_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["branches"]["S0-N"]["caps"]["endpoint_pattern"]["v1"]["C1"] = True
    with pytest.raises(verifier.VerificationError, match="S0-N exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_d_minimal_boundary_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["first_unmodeled_next_interface"]["name"] = "D.Minimal supplied"
    with pytest.raises(verifier.VerificationError, match="D.Minimal/D.K4 boundary"):
        verifier.verify_document(mutated)


def test_requires_every_named_packet_field() -> None:
    mutated = copy.deepcopy(retained_document())
    del mutated["branches"]["S0-I"]["robust_surface"]["modeled_ingress"][
        "modeled_packet"
    ]["modeled_row2"]["modeled_same_squared_radius"]
    with pytest.raises(verifier.VerificationError, match="S0-I exact field packet"):
        verifier.verify_document(mutated)


def test_rejects_status_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["status"] = "SAT_EXACT_FULL_THEOREM"
    with pytest.raises(verifier.VerificationError, match="status upgrade"):
        verifier.verify_document(mutated)


def test_rejects_input_provenance_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["input_provenance"]["sha256"] = "0" * 64
    with pytest.raises(verifier.VerificationError, match="input provenance"):
        verifier.verify_document(mutated)
