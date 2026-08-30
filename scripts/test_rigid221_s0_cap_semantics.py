#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for the exact finite S0 cap-semantics positive control."""

from __future__ import annotations

import copy
import hashlib
import json
import re
import sys
from fractions import Fraction as F
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_cap_semantics as mod


def assert_blocked(action: object, expected_code: str) -> None:
    with pytest.raises(mod.VerificationError) as caught:
        action()  # type: ignore[operator]
    assert caught.value.code == expected_code


def write_result(path: Path, result: dict[str, object] | None = None) -> None:
    payload = result if result is not None else mod.build_result()
    path.write_text(mod.canonical_json(payload, pretty=True) + "\n", encoding="utf-8")


def test_signed_area_and_closed_on_arc_opposite_include_endpoints() -> None:
    fixture = mod.fixture_12()
    points = fixture.point_map()
    v1, v2, v3 = (points[name] for name in fixture.moser)
    assert mod.signed_area2(v1, v2, v3) == 2
    assert mod.on_arc_opposite(v1, v2, v3, v2)
    assert mod.on_arc_opposite(v1, v2, v3, v3)
    assert not mod._on_arc_opposite_strict(v1, v2, v3, v2)
    assert not mod._on_arc_opposite_strict(v1, v2, v3, v3)


def test_caps_are_closed_carrier_filters_with_exact_cap_triple_pattern() -> None:
    fixture = mod.fixture_12()
    caps = mod.derive_caps(fixture)
    assert tuple(map(len, caps)) == (7, 4, 4)
    assert caps[0] == {
        "v2",
        "v3",
        "upper_right_shallow",
        "upper_right_steep",
        "top",
        "upper_left_steep",
        "upper_left_shallow",
    }
    assert caps[1] == {
        "v1",
        "v3",
        "lower_left_shallow",
        "lower_left_steep",
    }
    assert caps[2] == {
        "v1",
        "v2",
        "lower_right_shallow",
        "lower_right_steep",
    }
    assert mod.verify_cap_triple(fixture, caps) == tuple(
        (name, 1) for name in mod.ROLE_ORDER if name not in mod.MOSER_ROLES
    )
    assert tuple(map(len, mod.derive_caps(fixture, closed=False))) == (5, 2, 2)


def test_cap_interiors_and_every_opposite_index_apex_row() -> None:
    fixture = mod.fixture_12()
    caps = mod.derive_caps(fixture)
    assert mod.cap_interior_by_index(caps, 0) == {
        "upper_right_shallow",
        "upper_right_steep",
        "top",
        "upper_left_steep",
        "upper_left_shallow",
    }
    assert mod.cap_interior_by_index(caps, 1) == {
        "lower_left_shallow",
        "lower_left_steep",
    }
    assert mod.cap_interior_by_index(caps, 2) == {
        "lower_right_shallow",
        "lower_right_steep",
    }
    assert mod.opposite_table() == ((0, 2, "v3"), (1, 0, "v1"), (2, 1, "v2"))
    assert tuple(mod.opp_index2(index) for index in range(3)) == (2, 0, 1)
    assert mod.verify_fixture(fixture).selected_interior == {
        "lower_right_shallow",
        "lower_right_steep",
    }


def test_mec_nonobtuse_convexity_and_point_quotient_certificates() -> None:
    fixture = mod.fixture_12()
    points = mod.validate_fixture_shape(fixture)
    mod.verify_mec(fixture, points)
    assert all(mod.dist2(fixture.mec_center, point) == 1 for point in points.values())
    moser = tuple(points[name] for name in fixture.moser)
    assert mod.verify_nonobtuse(*moser) == (F(0), F(2), F(2))
    assert mod.verify_convex_order(fixture, points) == F(2, 25)
    report = mod.verify_fixture(fixture)
    assert report.coordinate_quotient_cardinality == 12
    assert report.minimum_edge_area == F(2, 25)


def test_mec_certificate_rejects_nonpositive_outside_and_nonboundary_mutations() -> (
    None
):
    fixture = mod.fixture_12()
    points = fixture.point_map()
    zero_radius = mod.Fixture(
        fixture.points,
        fixture.order,
        fixture.moser,
        fixture.surplus_idx,
        fixture.mec_center,
        F(0),
    )
    assert_blocked(lambda: mod.verify_mec(zero_radius, points), "mec_positive_radius")

    outside = dict(points)
    outside["top"] = (F(0), F(2))
    assert_blocked(lambda: mod.verify_mec(fixture, outside), "mec_carrier_containment")

    off_boundary = dict(points)
    off_boundary["v1"] = (F(0), F(-1, 2))
    assert_blocked(lambda: mod.verify_mec(fixture, off_boundary), "mec_moser_boundary")


def test_requested_negative_diagnostic_controls_all_hit_their_checker_layer() -> None:
    controls = mod.diagnostic_controls()
    assert set(controls) == {
        "adjacent_moser_nonobtuse_failure",
        "collinear_moser_vertices",
        "count_two_corner_point",
        "count_zero_central_point",
        "duplicate_coordinates",
        "interior_point_convexity_failure",
        "malformed_serialized_replay",
        "missing_endpoint_erasure",
        "outside_carrier_filter",
        "strict_vs_closed_endpoints",
        "wrong_fixed_cap_index",
    }
    assert all(control["passed"] is True for control in controls.values())
    assert all(
        control["observed_code"] == control["expected_code"]
        for control in controls.values()
    )


def test_count_zero_count_two_and_outside_filter_diagnostics_are_exact() -> None:
    fixture = mod.fixture_12()
    points = fixture.point_map()
    moser = tuple(points[name] for name in fixture.moser)
    assert mod.cap_membership_count((F(0), F(-1, 3)), moser) == 0
    assert mod.cap_membership_count((F(-2), F(1)), moser) == 2
    outside = (F(0), F(2))
    assert mod.cap_membership_count(outside, moser) == 1
    assert outside not in points.values()
    assert all("outside_probe" not in cap for cap in mod.derive_caps(fixture))


def test_strict_endpoints_wrong_index_and_missing_erasure_are_rejected() -> None:
    fixture = mod.fixture_12()
    strict_caps = mod.derive_caps(fixture, closed=False)
    assert_blocked(
        lambda: mod.verify_cap_triple(fixture, strict_caps), "cap_endpoint_pattern"
    )
    assert_blocked(
        lambda: mod._reject_wrong_fixed_index(fixture), "wrong_fixed_cap_index"
    )
    assert_blocked(
        lambda: mod._reject_missing_endpoint_erasure(fixture),
        "missing_endpoint_erasure",
    )


def test_collinear_adjacent_interior_and_duplicate_mutations_are_rejected() -> None:
    fixture = mod.fixture_12()
    points = fixture.point_map()
    assert_blocked(
        lambda: mod.require_nondegenerate_moser(
            (F(0), F(-1)), (F(0), F(0)), (F(0), F(1))
        ),
        "collinear_moser",
    )
    adjacent = tuple(
        points[name] for name in ("v1", "lower_right_steep", "lower_right_shallow")
    )
    assert mod.nonobtuse_dot_products(*adjacent)[1] < 0
    assert_blocked(lambda: mod.verify_nonobtuse(*adjacent), "adjacent_moser_nonobtuse")

    interior = mod.replace_fixture(fixture, points={"top": (F(0), F(0))})
    assert_blocked(
        lambda: mod.verify_convex_order(interior, mod.validate_fixture_shape(interior)),
        "strict_convex_order",
    )
    duplicate = mod.replace_fixture(
        fixture,
        points={"upper_right_steep": points["upper_right_shallow"]},
    )
    assert_blocked(
        lambda: mod.validate_fixture_shape(duplicate), "duplicate_coordinates"
    )


def test_positive_result_has_exact_metrics_claim_flags_ledgers_and_provenance() -> None:
    result = mod.build_result()
    assert result["status"] == mod.POSITIVE_STATUS
    assert result["claim_scope"] == mod.CLAIM_SCOPE
    assert result["full_L1_claim"] is False
    assert result["s0_claim"] is False
    assert result["promotion_claim"] is False
    assert result["source_binding_claim"] is False
    assert result["encoded_ledger"] == list(mod.ENCODED_FACTS)
    assert result["assumptions_ledger"] == list(mod.ASSUMPTIONS)
    assert result["omitted_ledger"] == list(mod.OMITTED_FACTS)
    assert result["verification"]["cap_sizes"] == [7, 4, 4]
    assert result["verification"]["selected_J"] == [
        "lower_right_shallow",
        "lower_right_steep",
    ]
    assert result["verification"]["moser_dot_products"] == ["0", "2", "2"]
    assert result["verification"]["minimum_edge_area2"] == "2/25"
    provenance = result["runtime_provenance"]
    assert frozenset(provenance) == mod.PROVENANCE_KEYS
    assert provenance["authentication_claim"] == mod.PROVENANCE_AUTHENTICATION_CLAIM
    assert (
        provenance["script_sha256"]
        == hashlib.sha256(Path(mod.__file__).read_bytes()).hexdigest()
    )
    assert provenance["git_head"] == "unavailable" or re.fullmatch(
        r"[0-9a-f]{40}", provenance["git_head"]
    )
    assert (
        "does not authenticate uncommitted source bytes"
        in provenance["authentication_claim"]
    )


def test_source_reference_ledger_uses_actual_declaration_names() -> None:
    assert mod.SOURCE_REFERENCES == (
        "Problem97.signedArea2",
        "Problem97.OnArcOpposite",
        "Problem97.MoserTriangle",
        "Problem97.CapTriple",
        "Problem97.SurplusCapPacket.capInteriorByIndex",
        "Problem97.SurplusCapPacket.oppIndex2",
        "Problem97.MEC.NonObtuseCircumscribedMoserTriangle",
        "docs/audits/2026-08-29-rigid221-s0-cap-semantics-computation.md",
    )
    assert mod.build_result()["source_references"] == list(mod.SOURCE_REFERENCES)


def test_result_and_json_are_deterministic_sorted_and_timestamp_free() -> None:
    first = mod.build_result()
    second = mod.build_result()
    assert first == second
    encoded = mod.canonical_json(first)
    assert encoded == mod.canonical_json(second)
    assert encoded.startswith('{"assumptions_ledger":')
    assert "timestamp" not in encoded.lower()
    assert json.loads(encoded) == first


def test_strict_replay_reconstructs_fractions_and_writes_nothing(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    result_path = tmp_path / "result.json"
    write_result(result_path)
    monkeypatch.chdir(tmp_path)
    before = {path.name: path.read_bytes() for path in tmp_path.iterdir()}
    replayed = mod.replay_result(result_path)
    return_code = mod.main(["--replay-result", str(result_path)])
    stdout = json.loads(capsys.readouterr().out)
    after = {path.name: path.read_bytes() for path in tmp_path.iterdir()}
    assert replayed == mod.build_result()
    assert return_code == 0
    assert stdout["status"] == mod.POSITIVE_STATUS
    assert before == after


def test_replay_accepts_recorded_git_head_drift_with_identical_script_bytes(
    tmp_path: Path,
) -> None:
    result = mod.build_result()
    current_head = result["runtime_provenance"]["git_head"]
    recorded_head = "0" * 40 if current_head != "0" * 40 else "1" * 40
    result["runtime_provenance"]["git_head"] = recorded_head
    path = tmp_path / "prior-head.json"
    write_result(path, result)
    replayed = mod.replay_result(path)
    assert replayed["runtime_provenance"]["git_head"] == recorded_head
    assert (
        replayed["runtime_provenance"]["script_sha256"]
        == mod.current_provenance()["script_sha256"]
    )


@pytest.mark.parametrize(
    ("mutation", "expected_code"),
    [
        ("false_status", "false_status"),
        ("false_claim", "false_claim"),
        ("stale_script", "stale_result"),
        ("malformed_git_head", "malformed_provenance"),
        ("malformed_authentication_text", "malformed_provenance"),
        ("extra_provenance_key", "malformed_json"),
        ("missing_role", "malformed_json"),
        ("extra_role", "malformed_json"),
        ("malformed_coordinate", "malformed_fraction"),
        ("duplicate_coordinate", "duplicate_coordinates"),
        ("corrupt_metrics", "stale_or_corrupt_result"),
    ],
)
def test_serialized_result_corruptions_are_rejected(
    tmp_path: Path, mutation: str, expected_code: str
) -> None:
    result = copy.deepcopy(mod.build_result())
    carrier = result["fixture"]["carrier"]
    if mutation == "false_status":
        result["status"] = mod.UNKNOWN_STATUS
    elif mutation == "false_claim":
        result["s0_claim"] = True
    elif mutation == "stale_script":
        result["runtime_provenance"]["script_sha256"] = "0" * 64
    elif mutation == "malformed_git_head":
        result["runtime_provenance"]["git_head"] = "A" * 40
    elif mutation == "malformed_authentication_text":
        result["runtime_provenance"]["authentication_claim"] = "authenticated"
    elif mutation == "extra_provenance_key":
        result["runtime_provenance"]["timestamp"] = "forbidden"
    elif mutation == "missing_role":
        carrier.pop("top")
    elif mutation == "extra_role":
        carrier["extra"] = {"x": "2", "y": "0"}
    elif mutation == "malformed_coordinate":
        carrier["top"]["x"] = "1.5"
    elif mutation == "duplicate_coordinate":
        carrier["top"] = copy.deepcopy(carrier["v2"])
    elif mutation == "corrupt_metrics":
        result["verification"]["cap_sizes"] = [6, 4, 4]
    else:  # pragma: no cover - guards the parameter table
        raise AssertionError(mutation)
    path = tmp_path / f"{mutation}.json"
    write_result(path, result)
    assert_blocked(lambda: mod.replay_result(path), expected_code)


def test_malformed_serialized_replay_is_encoding_blocked_and_no_write(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    malformed = tmp_path / "malformed.json"
    malformed.write_text('{"status":', encoding="utf-8")
    monkeypatch.chdir(tmp_path)
    before = {path.name: path.read_bytes() for path in tmp_path.iterdir()}
    return_code = mod.main(["--replay-result", str(malformed), "--verbose"])
    output = json.loads(capsys.readouterr().out)
    after = {path.name: path.read_bytes() for path in tmp_path.iterdir()}
    assert return_code == 2
    assert output["status"] == mod.BLOCKED_STATUS
    assert output["error"]["code"] == "malformed_json"
    assert output["full_L1_claim"] is False
    assert output["s0_claim"] is False
    assert output["promotion_claim"] is False
    assert output["source_binding_claim"] is False
    assert before == after


def test_smoke_mode_is_sparse_and_writes_nothing(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    monkeypatch.chdir(tmp_path)
    assert not list(tmp_path.iterdir())
    return_code = mod.main(["--smoke"])
    output = json.loads(capsys.readouterr().out)
    assert return_code == 0
    assert output == {
        "cap_sizes": [7, 4, 4],
        "controls_passed": 11,
        "controls_total": 11,
        "selected_J": ["lower_right_shallow", "lower_right_steep"],
        "status": mod.POSITIVE_STATUS,
    }
    assert not list(tmp_path.iterdir())


def test_output_dir_writes_one_deterministic_result_then_replays_without_writes(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
) -> None:
    output_dir = tmp_path / "explicit-output"
    assert mod.main(["--output-dir", str(output_dir)]) == 0
    capsys.readouterr()
    result_path = output_dir / mod.RESULT_FILENAME
    assert [path.name for path in output_dir.iterdir()] == [mod.RESULT_FILENAME]
    first_bytes = result_path.read_bytes()
    assert mod.main(["--output-dir", str(output_dir)]) == 0
    capsys.readouterr()
    assert result_path.read_bytes() == first_bytes
    before = {path.name: path.read_bytes() for path in output_dir.iterdir()}
    assert mod.main(["--replay-result", str(result_path)]) == 0
    capsys.readouterr()
    after = {path.name: path.read_bytes() for path in output_dir.iterdir()}
    assert before == after


def test_only_permitted_verdict_vocabulary_is_exposed() -> None:
    assert mod.ALLOWED_STATUSES == {
        "CAP_SEMANTICS_POSITIVE_CONTROL_EXACT",
        "UNKNOWN",
        "ENCODING_BLOCKED",
    }
