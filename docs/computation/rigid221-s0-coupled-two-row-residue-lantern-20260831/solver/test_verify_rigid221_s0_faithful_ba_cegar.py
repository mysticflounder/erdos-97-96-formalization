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

import verify_rigid221_s0_faithful_ba_cegar as verifier


def retained_document() -> object:
    return json.loads(
        (SOLVER_DIR / "s0-faithful-ba-cegar-wave1-result.json").read_text(
            encoding="utf-8"
        )
    )


def test_accepts_three_scoped_fixed_ba_unsat_candidates() -> None:
    assert verifier.verify_document(retained_document()) == {
        "status": "VERIFIED_SCOPED_CANDIDATES_UNSAT_FIXED_BA_CEGAR_WAVE",
        "fixed_S0_N_B_eq_A_cell_only": True,
        "relaxed_incidence_order_metric_model_only": True,
        "candidate_signature_count": 3,
        "bounded_UNSAT": False,
        "complete_candidate_coverage": False,
        "CounterexampleData": False,
        "CriticalShellSystem": False,
        "global_theorem": False,
        "Lean_proof": False,
    }


def test_rejects_canonical_label_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["fixed_cell"]["canonical_aliases"]["xu"] = 1
    with pytest.raises(verifier.VerificationError, match="fixed-cell labels"):
        verifier.verify_document(mutated)


def test_rejects_cyclic_order_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    order = mutated["fixed_cell"]["cyclic_order"]
    order[0], order[1] = order[1], order[0]
    with pytest.raises(verifier.VerificationError, match="fixed-cell labels"):
        verifier.verify_document(mutated)


def test_rejects_named_support_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    rows = mutated["cegar"]["attempts"][0]["candidate"]["complete_signature"]["rows"]
    next(row for row in rows if row["name"] == "Ku")["support"][0] = "O"
    with pytest.raises(verifier.VerificationError, match="named row"):
        verifier.verify_document(mutated)


def test_rejects_physical_fifth_equality_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["fixed_cell"]["physical_five"]["surplus_incidence_role"] = "fq"
    with pytest.raises(verifier.VerificationError, match="physical equality"):
        verifier.verify_document(mutated)


def test_rejects_exact_flag_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    rows = mutated["cegar"]["attempts"][1]["candidate"]["complete_signature"]["rows"]
    next(row for row in rows if row["name"] == "physical_Q")["exact"] = True
    with pytest.raises(verifier.VerificationError, match="named row"):
        verifier.verify_document(mutated)


def test_rejects_global_exact_flag_upgrade() -> None:
    mutated = copy.deepcopy(retained_document())
    rows = mutated["cegar"]["attempts"][2]["candidate"]["complete_signature"]["rows"]
    next(row for row in rows if row["name"].startswith("global_"))["exact"] = True
    with pytest.raises(verifier.VerificationError, match="exactness scope"):
        verifier.verify_document(mutated)


def test_rejects_smt_hash_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["cegar"]["attempts"][0]["solver"]["smt2_sha256"] = "0" * 64
    with pytest.raises(verifier.VerificationError, match="hash mutation"):
        verifier.verify_document(mutated)


def test_rejects_assertion_count_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    counts = mutated["cegar"]["attempts"][1]["candidate"]["metric_assertion_counts"]
    counts["total"] = 569
    candidate = mutated["cegar"]["attempts"][1]["candidate"]
    unsigned = dict(candidate)
    unsigned.pop("receipt_sha256")
    candidate["receipt_sha256"] = verifier.sha256(verifier.canonical_json(unsigned))
    with pytest.raises(verifier.VerificationError, match="assertion count"):
        verifier.verify_document(mutated)


def test_primary_query_has_no_unconditional_model_readback() -> None:
    document = retained_document()
    rows = verifier.parse_rows(
        document["cegar"]["attempts"][0]["candidate"]["complete_signature"]["rows"]
    )
    smt2, counts = verifier.build_smt2(rows)
    assert counts["total"] == 570
    assert smt2.endswith("(check-sat)\n(exit)\n")
    assert "(get-value" not in smt2


def test_rejects_solver_status_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["cegar"]["attempts"][2]["solver"]["status"] = "UNKNOWN"
    with pytest.raises(verifier.VerificationError, match="solver status"):
        verifier.verify_document(mutated)


def test_rejects_solver_command_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["cegar"]["attempts"][0]["solver"]["command"][1] = "--lang=smt1"
    with pytest.raises(verifier.VerificationError, match="command"):
        verifier.verify_document(mutated)


def test_rejects_solver_timeout_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["cegar"]["attempts"][0]["solver"]["timeout_ms"] = 20_000
    with pytest.raises(verifier.VerificationError, match="timeout"):
        verifier.verify_document(mutated)


@pytest.mark.parametrize(
    "field",
    [
        "bounded_UNSAT",
        "complete_candidate_coverage",
        "CounterexampleData",
        "CriticalShellSystem",
        "global_theorem",
        "Lean_proof",
    ],
)
def test_rejects_scope_upgrade(field: str) -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["claim_scope"][field] = True
    with pytest.raises(verifier.VerificationError, match="claim-scope upgrade"):
        verifier.verify_document(mutated)


def test_rejects_coverage_upgrade_in_cegar_packet() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["cegar"]["complete_structural_coverage"] = True
    with pytest.raises(verifier.VerificationError, match="coverage"):
        verifier.verify_document(mutated)


def test_rejects_relaxed_metric_scope_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["relaxed_metric_model_scope"]["not_retained"]["MEC"] = True
    with pytest.raises(verifier.VerificationError, match="relaxed_metric_model_scope"):
        verifier.verify_document(mutated)


def test_rejects_relaxed_claim_scope_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    mutated["claim_scope"]["relaxed_incidence_order_metric_model_only"] = False
    with pytest.raises(verifier.VerificationError, match="claim-scope upgrade"):
        verifier.verify_document(mutated)


def test_rejects_structural_compatibility_mutation() -> None:
    mutated = copy.deepcopy(retained_document())
    rows = mutated["cegar"]["attempts"][0]["candidate"]["complete_signature"]["rows"]
    global_rows = [row for row in rows if row["name"].startswith("global_")]
    next(row for row in global_rows if row["name"] == "global_qv1")["support"] = list(
        global_rows[0]["support"]
    )
    with pytest.raises(verifier.VerificationError, match="C2 compatibility"):
        verifier.verify_document(mutated)


def test_requires_every_report_field() -> None:
    mutated = copy.deepcopy(retained_document())
    del mutated["row_origin_guard"]
    with pytest.raises(verifier.VerificationError, match="top-level"):
        verifier.verify_document(mutated)
