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

import verify_rigid221_s0_total_critical_system_model as verifier


def retained_document() -> object:
    return json.loads(
        (SOLVER_DIR / "s0-total-critical-system-wave1-model.json").read_text(
            encoding="utf-8"
        )
    )


def test_accepts_exact_total_critical_shell_geometric_model() -> None:
    assert verifier.verify_document(retained_document()) == {
        "status": "VERIFIED_SAT_EXACT_TOTAL_CRITICAL_SHELL_SYSTEM_GEOMETRIC_MODEL",
        "total_finite_CriticalShellSystem_geometry": True,
        "actual_typed_Lean_CriticalShellSystem": False,
        "CounterexampleData": False,
        "K4": False,
        "Minimal": False,
        "full_theorem": False,
        "promotion_claim": False,
    }


@pytest.mark.parametrize("role", ["a1", "b2", "c3"])
def test_rejects_mutated_extension_coordinate(role: str) -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["points"][role][0] = "0/1"
    with pytest.raises(verifier.VerificationError, match="coordinates"):
        verifier.verify_document(mutated)


def test_rejects_support_partition_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["support_partition"]["supports"]["A"].remove("a1")
    with pytest.raises(verifier.VerificationError, match="support partition"):
        verifier.verify_document(mutated)


def test_rejects_total_assignment_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    del mutated["critical_shell_system_geometric_model"]["source_assignments"]["c3"]
    with pytest.raises(verifier.VerificationError, match="total assignments"):
        verifier.verify_document(mutated)


def test_rejects_deletion_blocker_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    assignment = mutated["critical_shell_system_geometric_model"]["source_assignments"][
        "u"
    ]
    assignment["modeled_A_erase_source_radial_profile"][
        "maximum_positive_distance_multiplicity"
    ] = 4
    with pytest.raises(verifier.VerificationError, match="deletion blockers"):
        verifier.verify_document(mutated)


@pytest.mark.parametrize("field", ["blocker_orbit", "blocker_cycle"])
def test_rejects_blocker_orbit_or_cycle_mutation(field: str) -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["critical_shell_system_geometric_model"][field][-1] = "O"
    with pytest.raises(verifier.VerificationError, match="orbit"):
        verifier.verify_document(mutated)


def test_rejects_centerwise_census_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    census = mutated["centerwise_HasNEquidistantPointsAt_4_census"]
    census["satisfying_center_count"] = 9
    with pytest.raises(verifier.VerificationError, match="8/20 centerwise census"):
        verifier.verify_document(mutated)


@pytest.mark.parametrize("record_index", [0, 1])
def test_rejects_corrected_discrepancy_record_mutation(record_index: int) -> None:
    mutated = copy.deepcopy(retained_document())
    record = mutated["supplied_value_discrepancies"][record_index]
    record["observed"] = record["supplied"]
    with pytest.raises(
        verifier.VerificationError, match="corrected discrepancy records"
    ):
        verifier.verify_document(mutated)


def test_rejects_kdelta_center_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["critical_rows"]["Kdelta"]["center"] = "fq"
    with pytest.raises(verifier.VerificationError, match="critical_rows"):
        verifier.verify_document(mutated)


def test_rejects_corrected_cap_cardinality_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["caps"]["cardinalities"] = {"C1": 8, "C2": 7, "C3": 16}
    with pytest.raises(verifier.VerificationError, match="caps"):
        verifier.verify_document(mutated)


@pytest.mark.parametrize(
    "field",
    [
        "actual_typed_Lean_CriticalShellSystem",
        "CounterexampleData",
        "D.K4",
        "D.Minimal",
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


def test_rejects_actual_dependent_shell_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["critical_shell_system_geometric_model"][
        "actual_dependent_Lean_CriticalShellSystem_instantiated"
    ] = True
    with pytest.raises(verifier.VerificationError, match="total assignments"):
        verifier.verify_document(mutated)


def test_rejects_actual_counterexample_k4_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["centerwise_HasNEquidistantPointsAt_4_census"][
        "actual_CounterexampleData_K4_instantiated"
    ] = True
    with pytest.raises(verifier.VerificationError, match="8/20 centerwise census"):
        verifier.verify_document(mutated)


def test_rejects_status_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["status"] = "SAT_EXACT_COUNTEREXAMPLE_DATA"
    with pytest.raises(verifier.VerificationError, match="status upgrade"):
        verifier.verify_document(mutated)


def test_requires_every_finite_shell_field() -> None:
    mutated = copy.deepcopy(retained_document())
    del mutated["critical_rows"]["C"]["modeled_field_checks"][
        "modeled_support_eq_complete_ambient_radius_class"
    ]
    with pytest.raises(verifier.VerificationError, match="critical_rows"):
        verifier.verify_document(mutated)


def test_rejects_input_provenance_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["input_provenance"]["sha256"] = "0" * 64
    with pytest.raises(verifier.VerificationError, match="input provenance"):
        verifier.verify_document(mutated)
