from __future__ import annotations

import copy
import importlib
import sys
from itertools import product
from pathlib import Path

import pytest
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
EXPECTED_ORIGIN = ("P", "P_rho", "first")
MALFORMED = (
    "duplicate_q_support",
    "escaped_point_in_seed",
    "origin_overlap_three",
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
    } <= set(manifest["source_theorems"])

    claims = manifest["false_claims"]
    assert claims
    assert all(value is False for value in claims.values())


def test_full_semantic_signature_replays_and_tampering_fails_closed() -> None:
    solver, context = packet.build_packet(
        "sourceRowOmission", "distinctBlockersDifferentCaps", "P"
    )
    assert solver.check() == sat
    signature = packet.validate_model(solver.model(), context)
    assert packet.replay_signature(signature) == signature

    tampered = copy.deepcopy(signature)
    ranks = tampered["semantic_assignment"]["rank"]
    ranks["q1"] = ranks["q0"]
    with pytest.raises(packet.LiveRetainedEncodingError):
        packet.replay_signature(tampered)
