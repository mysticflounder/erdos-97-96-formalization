from __future__ import annotations

import copy
import importlib
import sys
from itertools import product
from pathlib import Path

import pytest
import z3
from z3 import sat, unsat

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

packet = importlib.import_module(
    "census.p97_search.freshthird_firstnonhit_live_retained_v1"
)


EXPECTED_NONHIT = ("sameBlocker", "sourceRowOmission")
EXPECTED_INTERACTION = (
    "sameBlocker",
    "sourceRowOmission",
    "distinctBlockersDifferentCaps",
    "sameCapWithInternalFiberSource",
)
EXPECTED_ORIGIN = ("P", "P_rho", "Q")
MALFORMED = (
    "duplicate_q_support",
    "escaped_point_in_seed",
    "origin_overlap_three",
    "q_overlap_three",
    "retained_endpoint_not_omitted",
)


def _cells() -> tuple[tuple[str, str, str], ...]:
    assert tuple(packet.NONHIT_BRANCHES) == EXPECTED_NONHIT
    assert tuple(packet.INTERACTION_BRANCHES) == EXPECTED_INTERACTION
    assert tuple(packet.ORIGIN_BRANCHES) == EXPECTED_ORIGIN
    return tuple(
        product(
            packet.NONHIT_BRANCHES,
            packet.INTERACTION_BRANCHES,
            packet.ORIGIN_BRANCHES,
        )
    )


def test_every_live_constructor_cell_is_sat_and_model_is_valid() -> None:
    cells = _cells()
    assert len(cells) == 2 * 4 * 3

    for nonhit, interaction, origin in cells:
        solver, context = packet.build_packet(nonhit, interaction, origin)
        assert solver.check() == sat, (nonhit, interaction, origin)

        report = packet.validate_model(solver.model(), context)
        assert report["nonhit"] == nonhit
        assert report["interaction"] == interaction
        assert report["origin"] == origin
        candidate_classes = report["candidate_support_classes"]
        assert len(candidate_classes) == 4
        assert len(set(candidate_classes)) == 4
        assert report["point_classes"]["g0"] not in report["triple_seed_classes"]
        assert report["candidate_origin_overlap"] <= 2
        assert report["candidate_origin_outside"] >= 2
        assert report["candidate_q_overlap"] <= 2


def test_malformed_controls_are_unsat_in_every_live_cell() -> None:
    for nonhit, interaction, origin in _cells():
        for malformed in MALFORMED:
            solver, _ = packet.build_packet(
                nonhit, interaction, origin, malformed=malformed
            )
            assert solver.check() == unsat, (
                nonhit,
                interaction,
                origin,
                malformed,
            )


def test_manifest_binds_live_theorems_and_keeps_discovery_claims_false() -> None:
    manifest = packet.manifest()
    assert manifest["cell_count"] == 2 * 4 * 3
    assert {
        "FreshThirdCapSourceNonHit",
        "FreshThirdCapSourceInteraction",
        "FreshThirdAlignedRetainedConsumerPacket",
        "exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases",
        (
            "Problem97.ATailFrontierLiveClosure."
            "TwoSourceExactCollisionRowsTerminal."
            "exists_q_tripleShellEscape_qRow_overlap_card_le_two"
        ),
    } <= set(manifest["source_theorems"])

    claims = manifest["false_claims"]
    assert claims
    assert all(value is False for value in claims.values())
    assert manifest["solver_timeout_ms"] == packet.SOLVER_TIMEOUT_MS
    assert {
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "TwoSourceCanonicalSurface.lean"
        ),
        (
            "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "TwoSourceFreshThirdFiber.lean"
        ),
    } <= set(manifest["source_files"])
    assert [row["id"] for row in manifest["synchronization_predicates"]] == [
        "common_p_omission",
        "common_p_rho_omission",
        "retained_centers_equal",
        "retained_support_overlap_ge_two",
        "retained_cross_center_membership",
    ]


def test_full_abstract_signature_replays_and_tampering_fails_closed() -> None:
    solver, context = packet.build_packet(
        "sourceRowOmission", "distinctBlockersDifferentCaps", "P"
    )
    assert solver.check() == sat
    signature = packet.validate_model(solver.model(), context)
    assert packet.replay_signature(signature) == signature

    tampered = copy.deepcopy(signature)
    ranks = tampered["abstract_assignment"]["rank"]
    ranks["q1"] = ranks["q0"]
    with pytest.raises(packet.LiveRetainedEncodingError):
        packet.replay_signature(tampered)


def test_counterfactual_panel_replays_each_sat_polarity() -> None:
    solver, context = packet.build_packet(
        "sourceRowOmission", "distinctBlockersDifferentCaps", "P"
    )
    predicates = packet.synchronization_predicates(context)

    for name, predicate in predicates.items():
        statuses = []
        for required_value in (True, False):
            solver.push()
            solver.add(predicate if required_value else z3.Not(predicate))
            status = solver.check()
            statuses.append(status)
            if status == sat:
                signature = packet.validate_model(solver.model(), context)
                assert (
                    packet.replay_signature(
                        signature,
                        required_predicate=name,
                        required_value=required_value,
                    )
                    == signature
                )
            solver.pop()
        assert sat in statuses


@pytest.mark.parametrize(
    "malformed",
    ("fresh_alias_retained_endpoint", "cap_witness_alias", "blocker_alias"),
)
def test_source_forbidden_cross_role_aliases_are_unsat(malformed: str) -> None:
    solver, _ = packet.build_packet(
        "sourceRowOmission",
        "distinctBlockersDifferentCaps",
        "P",
        malformed=malformed,
    )
    assert solver.check() == unsat


@pytest.mark.parametrize(
    "malformed",
    (
        "positive_source_cap_two_hot",
        "positive_overlap_not_exact",
        "positive_cap_implication_violation",
    ),
)
def test_positive_interaction_controls_are_unsat(malformed: str) -> None:
    solver, _ = packet.build_packet(
        "sourceRowOmission",
        "distinctBlockersDifferentCaps",
        "P",
        malformed=malformed,
    )
    assert solver.check() == unsat


@pytest.mark.parametrize(
    "malformed",
    (
        "nonhit_omission_survival_false",
        "nonhit_omission_two_hot",
    ),
)
def test_nonhit_omission_controls_are_unsat(malformed: str) -> None:
    solver, _ = packet.build_packet(
        "sourceRowOmission", "sameBlocker", "P", malformed=malformed
    )
    assert solver.check() == unsat


@pytest.mark.parametrize(
    "malformed",
    (
        "interaction_omission_survival_false",
        "interaction_omission_two_hot",
    ),
)
def test_interaction_omission_controls_are_unsat(malformed: str) -> None:
    solver, _ = packet.build_packet(
        "sameBlocker", "sourceRowOmission", "P", malformed=malformed
    )
    assert solver.check() == unsat


@pytest.mark.parametrize(
    "malformed",
    (
        "retained_double_survival_false",
        "retained_opp_blocked_false",
        "retained_radius_equal",
    ),
)
def test_retained_packet_controls_are_unsat(malformed: str) -> None:
    solver, _ = packet.build_packet(
        "sourceRowOmission", "sourceRowOmission", "P", malformed=malformed
    )
    assert solver.check() == unsat
