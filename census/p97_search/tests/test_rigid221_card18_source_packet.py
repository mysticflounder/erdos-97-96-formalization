from __future__ import annotations

import ast
import hashlib
from copy import deepcopy
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import rigid221_card18_source_packet as source_packet

_ARMS = (
    source_packet.XV_DELETION_MISSING_INCIDENCE,
    source_packet.U_DELETION_MISSING_INCIDENCE,
    source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE,
)

_LEAF_THEOREMS = {
    source_packet.XV_DELETION_MISSING_INCIDENCE: (
        "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
        "pentagonBlockerV_card_ge_eighteen_xvDeletion_missingIncidence"
    ),
    source_packet.U_DELETION_MISSING_INCIDENCE: (
        "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
        "pentagonBlockerV_card_ge_eighteen_uDeletion_missingIncidence"
    ),
    source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE: (
        "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
        "pentagonBlockerV_card_ge_eighteen_"
        "biSurvival_commonDeletionRectangle"
    ),
}

_EXPECTED_FIXTURE_HASHES = {
    source_packet.XV_DELETION_MISSING_INCIDENCE: (
        "fff35c302dd989358df1804126644a66577121d60d0405dc2b0708b19ad918b0"
    ),
    source_packet.U_DELETION_MISSING_INCIDENCE: (
        "7249638bdfb07fd488e6489d3d1b566dfb708429a17a3d5d06267dc43cd85132"
    ),
    source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE: (
        "074c850a5cb14188776f035d3a2a4881660db73c54ed5a27f0fdcb5d3211325d"
    ),
}

_BLOCKER_V_FIELDS = (
    "hsecond",
    "hxuA",
    "hxvA",
    "huXvRow",
    "huNotXuRow",
    "hxvNotXuRow",
    "hdeletedXuRow",
    "hvDeletedRow",
    "huNotDeletedRow",
    "hxuNotDeletedRow",
    "hxvNotDeletedRow",
    "hclassFive",
    "hxvInterior",
    "hblockerInterior",
    "hblockerEqV",
    "htraceBound",
    "htraceBoundXu",
)


def _roles() -> dict[str, str]:
    return {
        "u": "p00",
        "v": "p01",
        "xu": "p02",
        "xv": "p03",
        "deleted": "p04",
        "opp_apex_2": "p05",
        "source_1": "p06",
        "source_2": "p07",
        "deleted_center": "p08",
        "actual_center_1": "p09",
        "actual_center_2": "p10",
    }


def _crossed_payload(arm: str) -> dict[str, Any]:
    if arm == source_packet.XV_DELETION_MISSING_INCIDENCE:
        deletion_role = "xv"
        common_role = "u"
        producer = (
            "pentagonOffClassBlocker_xvDeletion_"
            "threeExactRows_common_u_neutral"
        )
        consumer = (
            "pentagonOffClassBlocker_xvDeletion_"
            "false_of_tetrahedron_incidences_neutral"
        )
    else:
        deletion_role = "u"
        common_role = "xv"
        producer = (
            "pentagonOffClassBlocker_uDeletion_"
            "threeExactRows_common_xv_neutral"
        )
        consumer = (
            "pentagonOffClassBlocker_uDeletion_"
            "false_of_tetrahedron_incidences_neutral"
        )
    actual_blocker_role = "v" if deletion_role == "xv" else "xv"
    common_label = "p00" if deletion_role == "xv" else "p03"
    row_specs = (
        ("C1", "K1", "SELECTED_SOURCE_ROW", "source_1", "actual_center_1"),
        ("C2", "K2", "SELECTED_SOURCE_ROW", "source_2", "actual_center_2"),
        ("CO", "BO", "PHYSICAL_BLOCKER_CLASS", "opp_apex_2", "opp_apex_2"),
    )
    rows = [
        {
            "row_id": row_id,
            "support_id": support_id,
            "row_kind": row_kind,
            "row_origin_role": origin_role,
            "center_role": center_role,
            "deletion_role": deletion_role,
            "common_member_role": common_role,
            "exact_cardinality": 4,
            "support": (
                [common_label, "p06", "p11", "p12"]
                if support_id == "K1"
                else [common_label, "p07", "p13", "p14"]
                if support_id == "K2"
                else [common_label, "p09", "p11", "p12"]
            ),
        }
        for row_id, support_id, row_kind, origin_role, center_role in row_specs
    ]
    atom_specs = (
        ("c1_in_BO", "actual_center_1", "BO"),
        ("opp_apex_2_in_K1", "opp_apex_2", "K1"),
        ("c2_in_K1", "actual_center_2", "K1"),
        ("opp_apex_2_in_K2", "opp_apex_2", "K2"),
        ("c1_in_K2", "actual_center_1", "K2"),
    )
    atoms = [
        {
            "atom_id": atom_id,
            "member_role": member_role,
            "support_ref": support_ref,
        }
        for atom_id, member_role, support_ref in atom_specs
    ]
    return {
        "materialization_guard": arm,
        "kind": "CROSSED_MISSING_INCIDENCE",
        "exact_rows": {
            "materialization_guard": arm,
            "packet_type": "THREE_U5Q_DELETED_K4_CLASSES",
            "producer_theorem": producer,
            "deletion_role": deletion_role,
            "deletion_actual_blocker_role": actual_blocker_role,
            "common_member_role": common_role,
            "rows": rows,
        },
        "five_incidence_conjunction": {
            "materialization_guard": arm,
            "consumer_theorem": consumer,
            "logical_status": "NEGATED",
            "atoms": atoms,
        },
    }


def _common_deletion_summary(arm: str, q_role: str) -> dict[str, Any]:
    return {
        "materialization_guard": arm,
        "packet_type": "CommonDeletionTwoCenterPacket",
        "q_role": q_role,
        "center_roles": ["actual_center_1", "actual_center_2"],
        "actual_blocker_source_role": q_role,
        "actual_blocker_role": "xv" if q_role == "u" else "v",
        "rows": [
            {
                "row_id": "B1",
                "row_kind": "EXACT_Q_DELETED_SELECTED_ROW",
                "source_role": "source_1",
                "center_role": "actual_center_1",
                "deletion_role": q_role,
                "exact_cardinality": 4,
                "support": ["p06", "p11", "p12", "p13"],
            },
            {
                "row_id": "B2",
                "row_kind": "EXACT_Q_DELETED_SELECTED_ROW",
                "source_role": "source_2",
                "center_role": "actual_center_2",
                "deletion_role": q_role,
                "exact_cardinality": 4,
                "support": ["p07", "p14", "p15", "p16"],
            },
        ],
    }


def _bi_payload(arm: str) -> dict[str, Any]:
    return {
        "materialization_guard": arm,
        "kind": "COMMON_DELETION_RECTANGLE",
        "producer_theorem": (
            "pentagonOffClassBlocker_"
            "biSurvival_commonDeletionRectangle_neutral"
        ),
        "common_deletion_packets": [
            _common_deletion_summary(arm, "u"),
            _common_deletion_summary(arm, "xv"),
        ],
    }


def hand_packet(arm: str) -> dict[str, Any]:
    roles = _roles()
    return {
        "schema": "p97-rigid221-card18-source-packet/v1",
        "packet_id": f"hand-{arm.lower().replace('_', '-')}",
        "claim_boundary": {
            "scope": "DIAGNOSTIC_EXACT_N18",
            "evidence_class": "THEOREM_DISCOVERY_ONLY",
            "full_source_faithful_model": False,
            "finite_ingress_proved": False,
            "coverage_lift_proved": False,
        },
        "source_boundary": {
            "source_path": (
                "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                "Rigid221SourceHeavy.lean"
            ),
            "source_module": (
                "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
                "Rigid221SourceHeavy"
            ),
            "repository_revision": "2866ed1e153594c4db0fed88544612ca3cd2c723",
            "source_sha256": (
                "c5e46308208ac2ae75fdf7e6a21db18f"
                "d03825af7f44bed7f3f47ffc630b542b"
            ),
            "context_type": "ExactFourRigid221PhysicalApexSourceEqUContext",
            "source_heavy_packet_type": (
                "ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket"
            ),
            "coordinator_theorem": (
                "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
                "pentagonBlockerV_vRowBlockerDeleted_"
                "deletedRowBlockerOffClass_card_ge_eighteen"
            ),
            "large_pair_producer_theorem": (
                "pentagonOffClassBlocker_largeCard_threeColor_pair_neutral"
            ),
            "arm_leaf_theorem": _LEAF_THEOREMS[arm],
        },
        "carrier": {
            "materialization_guard": "INTRINSIC",
            "scope": "DIAGNOSTIC_EXACT_N18",
            "exact_cardinality": 18,
            "labels": [f"p{index:02d}" for index in range(18)],
        },
        "roles": {
            "materialization_guard": "INTRINSIC",
            "bindings": roles,
        },
        "blocker_v_parent": {
            "materialization_guard": "INTRINSIC",
            "lean_binder": "_Q",
            "lean_type": "ExactFourRigid221PentagonBlockerVResidual",
            "attestations": {name: True for name in _BLOCKER_V_FIELDS},
        },
        "live_parent_facts": {
            "materialization_guard": "INTRINSIC",
            "center_v_equals_deleted": {
                "lean_binder": "_hcenterV",
                "source_role": "v",
                "center_role": "deleted",
                "attested": True,
            },
            "deleted_center_in_opposite_cap_interior": {
                "lean_binder": "_hcenterDeletedInterior",
                "center_role": "deleted_center",
                "cap_center_role": "opp_apex_2",
                "attested": True,
            },
            "deleted_center_off_opposite_class": {
                "lean_binder": "_hcenterDeletedOffClass",
                "center_role": "deleted_center",
                "class_center_role": "opp_apex_2",
                "attested": True,
            },
            "next_row_physical_hits": {
                "lean_binder": "_hnextRowPhysicalHits",
                "row_source_role": "deleted_center",
                "class_center_role": "opp_apex_2",
                "relation": "CARDINALITY_AT_MOST",
                "bound": 1,
                "attested": True,
            },
            "cardinality": {
                "lean_binder": "_hcard",
                "live_relation": "CARDINALITY_AT_LEAST",
                "live_bound": 18,
                "diagnostic_exact_cardinality": 18,
                "attested": True,
            },
        },
        "source_pair": {
            "materialization_guard": "NEUTRAL_LARGE_PAIR_PRODUCER",
            "producer_theorem": (
                "pentagonOffClassBlocker_largeCard_threeColor_pair_neutral"
            ),
            "center_constructor": "lateFirstApexSystem.centerAt",
            "sources": [
                {
                    "source_role": "source_1",
                    "actual_center_role": "actual_center_1",
                    "center_kind": "ACTUAL_BLOCKER",
                    "outside_row_role": "xv",
                    "outside_xv_row": True,
                },
                {
                    "source_role": "source_2",
                    "actual_center_role": "actual_center_2",
                    "center_kind": "ACTUAL_BLOCKER",
                    "outside_row_role": "xv",
                    "outside_xv_row": True,
                },
            ],
        },
        "arm": arm,
        "deletion_profile": {
            "materialization_guard": arm,
            "outcomes": source_packet.expected_deletion_profile(arm),
        },
        "arm_payload": (
            _bi_payload(arm)
            if arm == source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE
            else _crossed_payload(arm)
        ),
    }


@pytest.mark.parametrize("arm", _ARMS)
def test_one_valid_hand_fixture_per_arm(arm: str) -> None:
    fixture = hand_packet(arm)
    validated = source_packet.validate_packet(fixture)
    assert validated.arm == arm
    assert validated.packet_id == fixture["packet_id"]
    assert validated.to_dict() == fixture


@pytest.mark.parametrize("arm", _ARMS)
def test_roundtrip_and_hash_are_deterministic(arm: str) -> None:
    fixture = hand_packet(arm)
    reverse_root_order = {
        key: fixture[key] for key in reversed(tuple(fixture.keys()))
    }
    encoded = source_packet.encode_packet(fixture)
    assert encoded == source_packet.encode_packet(reverse_root_order)
    assert encoded == source_packet.encode_packet(source_packet.decode_packet(encoded))
    assert source_packet.decode_packet(encoded).to_dict() == fixture
    expected_hash = hashlib.sha256(encoded).hexdigest()
    assert expected_hash == _EXPECTED_FIXTURE_HASHES[arm]
    assert source_packet.packet_sha256(fixture) == expected_hash
    assert source_packet.decode_packet(encoded).sha256 == expected_hash

    detached = source_packet.decode_packet(encoded).to_dict()
    detached["carrier"]["labels"][0] = "mutated"
    assert source_packet.packet_sha256(fixture) == expected_hash


def test_three_leaf_profiles_are_pairwise_disjoint_and_total() -> None:
    profiles = [source_packet.expected_deletion_profile(arm) for arm in _ARMS]
    canonical_profiles = {
        source_packet.canonical_json_bytes(profile) for profile in profiles
    }
    assert len(canonical_profiles) == 3
    for arm, profile in zip(_ARMS, profiles, strict=True):
        assert source_packet.classify_deletion_profile(profile) == arm

    incomplete = deepcopy(profiles[0])
    del incomplete["xv"]["source_2"]
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        source_packet.classify_deletion_profile(incomplete)


@pytest.mark.parametrize("mutation", ["short", "duplicate", "unsorted"])
def test_carrier_size_uniqueness_and_canonical_order_fail_closed(
    mutation: str,
) -> None:
    fixture = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    labels = fixture["carrier"]["labels"]
    if mutation == "short":
        labels.pop()
    elif mutation == "duplicate":
        labels[-1] = labels[0]
    else:
        labels[0], labels[1] = labels[1], labels[0]
    with pytest.raises(source_packet.SourcePacketError, match="carrier.labels"):
        source_packet.validate_packet(fixture)


def test_provenance_and_role_references_fail_closed() -> None:
    arm = source_packet.XV_DELETION_MISSING_INCIDENCE
    wrong_leaf = hand_packet(arm)
    wrong_leaf["source_boundary"]["arm_leaf_theorem"] = _LEAF_THEOREMS[
        source_packet.U_DELETION_MISSING_INCIDENCE
    ]
    with pytest.raises(source_packet.SourcePacketError, match="arm_leaf_theorem"):
        source_packet.validate_packet(wrong_leaf)

    wrong_source_pin = hand_packet(arm)
    wrong_source_pin["source_boundary"]["source_sha256"] = "0" * 64
    with pytest.raises(source_packet.SourcePacketError, match="source_sha256"):
        source_packet.validate_packet(wrong_source_pin)

    missing_parent_fact = hand_packet(arm)
    del missing_parent_fact["blocker_v_parent"]["attestations"]["htraceBoundXu"]
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        source_packet.validate_packet(missing_parent_fact)

    noncarrier = hand_packet(arm)
    noncarrier["roles"]["bindings"]["actual_center_2"] = "not-in-carrier"
    with pytest.raises(source_packet.SourcePacketError, match="non-carrier"):
        source_packet.validate_packet(noncarrier)

    dangling = hand_packet(arm)
    dangling["source_pair"]["sources"][0]["actual_center_role"] = "missing"
    with pytest.raises(source_packet.SourcePacketError, match="dangling role"):
        source_packet.validate_packet(dangling)


@pytest.mark.parametrize(
    ("left", "right", "message"),
    [
        ("u", "v", "five distinct physical roles"),
        ("opp_apex_2", "u", "positive-radius physical-class"),
        ("source_1", "u", "contained in the xv row"),
    ],
)
def test_source_proved_role_inequalities_are_enforced(
    left: str, right: str, message: str
) -> None:
    fixture = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    fixture["roles"]["bindings"][left] = fixture["roles"]["bindings"][right]
    with pytest.raises(source_packet.SourcePacketError, match=message):
        source_packet.validate_packet(fixture)


def test_crossed_five_incidence_is_recomputed_from_supports() -> None:
    fixture = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    rows = fixture["arm_payload"]["exact_rows"]["rows"]
    rows[0]["support"] = ["p00", "p05", "p06", "p10"]
    rows[1]["support"] = ["p00", "p05", "p07", "p09"]
    rows[2]["support"] = ["p00", "p09", "p11", "p12"]
    with pytest.raises(source_packet.SourcePacketError, match="concrete non-membership"):
        source_packet.validate_packet(fixture)


def test_crossed_five_incidence_shape_and_logical_negation_are_strict() -> None:
    bad_status = hand_packet(source_packet.U_DELETION_MISSING_INCIDENCE)
    atoms = bad_status["arm_payload"]["five_incidence_conjunction"]["atoms"]
    atoms[0]["status"] = False
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        source_packet.validate_packet(bad_status)

    wrong_logical_status = hand_packet(source_packet.U_DELETION_MISSING_INCIDENCE)
    conjunction = wrong_logical_status["arm_payload"][
        "five_incidence_conjunction"
    ]
    conjunction["logical_status"] = "UNKNOWN"
    with pytest.raises(source_packet.SourcePacketError, match="NEGATED"):
        source_packet.validate_packet(wrong_logical_status)


def test_crossed_rows_attest_common_endpoint_membership_and_blocker_provenance() -> None:
    arm = source_packet.XV_DELETION_MISSING_INCIDENCE
    missing_membership = hand_packet(arm)
    rows = missing_membership["arm_payload"]["exact_rows"]["rows"]
    rows[1]["support"] = ["p07", "p13", "p14", "p15"]
    with pytest.raises(source_packet.SourcePacketError, match="omits common member"):
        source_packet.validate_packet(missing_membership)

    wrong_blocker = hand_packet(arm)
    exact_rows = wrong_blocker["arm_payload"]["exact_rows"]
    exact_rows["deletion_actual_blocker_role"] = "xv"
    with pytest.raises(source_packet.SourcePacketError, match="actual_blocker_role"):
        source_packet.validate_packet(wrong_blocker)

    aliased_blocker = hand_packet(arm)
    rows = aliased_blocker["arm_payload"]["exact_rows"]["rows"]
    rows[0]["support"].append("p01")
    with pytest.raises(source_packet.SourcePacketError, match="length 4"):
        source_packet.validate_packet(aliased_blocker)


def test_wrong_or_unknown_deletion_profile_fails_closed() -> None:
    arm = source_packet.XV_DELETION_MISSING_INCIDENCE
    wrong = hand_packet(arm)
    wrong["deletion_profile"]["outcomes"] = (
        source_packet.expected_deletion_profile(
            source_packet.U_DELETION_MISSING_INCIDENCE
        )
    )
    with pytest.raises(source_packet.SourcePacketError, match="not packet arm"):
        source_packet.validate_packet(wrong)

    unknown = hand_packet(arm)
    unknown["deletion_profile"]["outcomes"]["u"]["source_1"] = "UNKNOWN"
    with pytest.raises(source_packet.SourcePacketError, match="total"):
        source_packet.validate_packet(unknown)


def test_bi_rectangle_requires_exact_u_and_xv_packet_coverage() -> None:
    arm = source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE
    missing = hand_packet(arm)
    missing["arm_payload"]["common_deletion_packets"].pop()
    with pytest.raises(source_packet.SourcePacketError, match="length 2"):
        source_packet.validate_packet(missing)

    duplicate = hand_packet(arm)
    duplicate["arm_payload"]["common_deletion_packets"][1]["q_role"] = "u"
    with pytest.raises(source_packet.SourcePacketError, match="q=u and q=xv"):
        source_packet.validate_packet(duplicate)

    swapped = hand_packet(arm)
    packets = swapped["arm_payload"]["common_deletion_packets"]
    packets.reverse()
    with pytest.raises(source_packet.SourcePacketError, match="q=u and q=xv"):
        source_packet.validate_packet(swapped)

    wrong_blocker = hand_packet(arm)
    first = wrong_blocker["arm_payload"]["common_deletion_packets"][0]
    first["actual_blocker_role"] = "v"
    with pytest.raises(source_packet.SourcePacketError, match="actual_blocker_role"):
        source_packet.validate_packet(wrong_blocker)

    aliased_blocker = hand_packet(arm)
    bindings = aliased_blocker["roles"]["bindings"]
    bindings["actual_center_1"] = bindings["xv"]
    with pytest.raises(source_packet.SourcePacketError, match="actual blocker"):
        source_packet.validate_packet(aliased_blocker)


def test_source_byte_authentication_is_distinct_from_plain_validation() -> None:
    fixture = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    validated = source_packet.validate_packet(fixture)
    assert not isinstance(validated, source_packet.AuthenticatedSourcePacket)

    authenticated = source_packet.authenticate_source_packet(fixture, Path.cwd())
    assert isinstance(authenticated, source_packet.AuthenticatedSourcePacket)
    assert authenticated.packet == validated
    assert authenticated.source_path == source_packet.SOURCE_PATH
    assert authenticated.source_sha256 == source_packet.SOURCE_SHA256
    assert authenticated.repository_revision == source_packet.SOURCE_REVISION
    assert authenticated.imports_authenticated is False


def test_source_byte_authentication_rejects_missing_or_hash_drifted_source(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    fixture = hand_packet(source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE)
    with pytest.raises(source_packet.SourcePacketError, match="unreadable"):
        source_packet.authenticate_source_packet(fixture, tmp_path)

    class FakeHash:
        @staticmethod
        def hexdigest() -> str:
            return "0" * 64

    monkeypatch.setattr(source_packet.hashlib, "sha256", lambda _data: FakeHash())
    with pytest.raises(source_packet.SourcePacketError, match="pinned digest"):
        source_packet.authenticate_source_packet(fixture, Path.cwd())


def test_source_byte_authentication_rejects_symlink_escape(tmp_path: Path) -> None:
    fixture = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    repo_root = tmp_path / "repo"
    repo_root.mkdir()
    outside = tmp_path / "outside.lean"
    outside.write_bytes(
        (Path.cwd() / source_packet.SOURCE_PATH).read_bytes()
    )
    escaped = repo_root / source_packet.SOURCE_PATH
    escaped.parent.mkdir(parents=True)
    try:
        escaped.symlink_to(outside)
    except (OSError, NotImplementedError):
        pytest.skip("symlinks are unavailable on this platform")
    with pytest.raises(source_packet.SourcePacketError, match="outside repository root"):
        source_packet.authenticate_source_packet(fixture, repo_root)


def test_source_byte_authentication_rejects_downstream_only_tree(tmp_path: Path) -> None:
    fixture = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    repo_root = tmp_path / "repo"
    downstream = repo_root / source_packet.SOURCE_PATH
    downstream = downstream.with_name("Rigid221SourceHeavyCommonDeletion.lean")
    downstream.parent.mkdir(parents=True)
    downstream.write_bytes(
        (
            Path.cwd()
            / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
            "Rigid221SourceHeavyCommonDeletion.lean"
        ).read_bytes()
    )
    with pytest.raises(source_packet.SourcePacketError, match="unreadable"):
        source_packet.authenticate_source_packet(fixture, repo_root)


def test_concrete_supports_reject_deleted_blockers_and_excess_overlap() -> None:
    crossed = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    crossed["arm_payload"]["exact_rows"]["rows"][0]["support"][0] = "p03"
    with pytest.raises(source_packet.SourcePacketError, match="deleted role"):
        source_packet.validate_packet(crossed)

    source = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    source["arm_payload"]["exact_rows"]["rows"][0]["support"][1] = "p17"
    with pytest.raises(source_packet.SourcePacketError, match="omits source membership"):
        source_packet.validate_packet(source)

    bi = hand_packet(source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE)
    packets = bi["arm_payload"]["common_deletion_packets"]
    packets[0]["rows"][1]["support"] = ["p07", "p11", "p12", "p13"]
    with pytest.raises(source_packet.SourcePacketError, match="overlap"):
        source_packet.validate_packet(bi)

    blocker_center = hand_packet(source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE)
    bindings = blocker_center["roles"]["bindings"]
    bindings["actual_center_1"] = bindings["xv"]
    with pytest.raises(source_packet.SourcePacketError, match="aliases the actual blocker"):
        source_packet.validate_packet(blocker_center)

    crossed_center = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    crossed_center["arm_payload"]["exact_rows"]["rows"][2]["support"][1] = "p05"
    with pytest.raises(source_packet.SourcePacketError, match="contains its center"):
        source_packet.validate_packet(crossed_center)

def test_arm_payloads_and_materialization_guards_cannot_be_mixed() -> None:
    crossed = hand_packet(source_packet.XV_DELETION_MISSING_INCIDENCE)
    crossed["arm_payload"] = _bi_payload(
        source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE
    )
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        source_packet.validate_packet(crossed)

    wrong_guard = hand_packet(source_packet.U_DELETION_MISSING_INCIDENCE)
    wrong_guard["arm_payload"]["exact_rows"]["materialization_guard"] = (
        source_packet.XV_DELETION_MISSING_INCIDENCE
    )
    with pytest.raises(source_packet.SourcePacketError, match="guard"):
        source_packet.validate_packet(wrong_guard)

    consumer_guard_on_intrinsic = hand_packet(
        source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE
    )
    consumer_guard_on_intrinsic["roles"]["materialization_guard"] = (
        source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE
    )
    with pytest.raises(source_packet.SourcePacketError, match="roles guard"):
        source_packet.validate_packet(consumer_guard_on_intrinsic)


def test_extra_and_missing_keys_fail_closed_at_root_and_nested_levels() -> None:
    arm = source_packet.XV_DELETION_MISSING_INCIDENCE
    extra = hand_packet(arm)
    extra["proof_evidence"] = True
    with pytest.raises(source_packet.SourcePacketError, match="extra"):
        source_packet.validate_packet(extra)

    missing = hand_packet(arm)
    del missing["source_pair"]
    with pytest.raises(source_packet.SourcePacketError, match="missing"):
        source_packet.validate_packet(missing)

    nested_extra = hand_packet(arm)
    nested_extra["live_parent_facts"]["anonymous_fact"] = True
    with pytest.raises(source_packet.SourcePacketError, match="extra"):
        source_packet.validate_packet(nested_extra)

    nested_missing = hand_packet(arm)
    del nested_missing["claim_boundary"]["finite_ingress_proved"]
    with pytest.raises(source_packet.SourcePacketError, match="missing"):
        source_packet.validate_packet(nested_missing)


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("full_source_faithful_model", True),
        ("finite_ingress_proved", True),
        ("coverage_lift_proved", True),
        ("evidence_class", "PROOF_EVIDENCE"),
        ("scope", "UNIVERSAL"),
    ],
)
def test_proof_or_promotion_overclaim_is_rejected(field: str, value: object) -> None:
    fixture = hand_packet(source_packet.BI_SURVIVAL_COMMON_DELETION_RECTANGLE)
    fixture["claim_boundary"][field] = value
    with pytest.raises(source_packet.SourcePacketError, match="claim_boundary"):
        source_packet.validate_packet(fixture)


def test_strict_decode_rejects_duplicates_nonfinite_and_noncanonical_json() -> None:
    with pytest.raises(source_packet.SourcePacketError, match="duplicate"):
        source_packet.parse_strict_json(b'{"x":1,"x":2}')
    with pytest.raises(source_packet.SourcePacketError, match="non-finite"):
        source_packet.parse_strict_json(b'{"x":NaN}')
    with pytest.raises(source_packet.SourcePacketError, match="not canonical"):
        source_packet.parse_strict_json(b'{"x": 1}')

    forged = source_packet.ValidatedPacket(b"{}", _ARMS[0])
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        source_packet.encode_packet(forged)
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        _ = forged.canonical_bytes
    with pytest.raises(source_packet.SourcePacketError, match="keys drifted"):
        _ = forged.sha256


def test_pre_solver_module_imports_only_the_standard_library() -> None:
    module_path = Path(source_packet.__file__)
    tree = ast.parse(module_path.read_text(encoding="utf-8"))
    imported_roots: set[str] = set()
    for node in ast.walk(tree):
        if isinstance(node, ast.Import):
            imported_roots.update(alias.name.split(".", 1)[0] for alias in node.names)
        elif isinstance(node, ast.ImportFrom) and node.module is not None:
            imported_roots.add(node.module.split(".", 1)[0])
    assert imported_roots <= {
        "__future__",
        "collections",
        "dataclasses",
        "hashlib",
        "json",
        "re",
            "typing",
            "pathlib",
    }
