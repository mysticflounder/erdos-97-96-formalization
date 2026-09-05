# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from pathlib import Path

import cardge13_exact13_fixed_base_k4_scan as fixed_scan
import cardge13_exact13_fixed_base_planar_piqd as fixed_planar
import cardge13_exact13_k4_prefix_cegar_piqd as subject
import cardge13_exact13_kalmanson_cone_piqd as fixed_cone
import cardge13_exact13_residual_domain_csp_piqd as residual_csp
import pytest


def test_default_order_is_a_permutation() -> None:
    assert set(subject.DEFAULT_ORDER) == set(subject.core.LABELS)
    assert len(subject.DEFAULT_ORDER) == len(subject.core.LABELS)


def test_compact_order_covers_only_centers_without_fixed_rows() -> None:
    assert set(subject.COMPACT_ORDER) == set(subject.core.LABELS) - {0, 1}
    assert len(subject.COMPACT_ORDER) == len(subject.core.LABELS) - 2


def test_validate_order_rejects_duplicates_and_out_of_range() -> None:
    with pytest.raises(ValueError, match="duplicate"):
        subject.validate_order((0, 0))
    with pytest.raises(ValueError, match="must lie"):
        subject.validate_order((13,))


def test_k4_delta_matches_existing_all_center_encoding() -> None:
    import cardge13_exact13_all_center_k4_lra_piqd as all_center

    base_count = len(subject.retained.build_commands())
    expected = all_center.build_commands()[base_count:]
    actual = tuple(
        command
        for center in subject.core.LABELS
        for command in subject.k4_delta_commands(center)
    )
    assert actual == expected


def test_retained_rows_cover_fixed_and_variable_centers() -> None:
    commands = set(subject.retained.build_commands())
    labels = subject.core.LABELS

    for row, center in (("K", 0), ("L", 0)):
        members = tuple(subject.core._member(row, point) for point in labels)
        assert f"(assert {subject.core._exactly(members, 4)})" in commands
        assert f"(assert (not {subject.core._member(row, center)}))" in commands
        for point in labels:
            if point != center:
                assert (
                    f"(assert (=> {subject.core._member(row, point)} "
                    f"(= {subject.core._distance(center, point)} r_{row})))"
                ) in commands

    t_members = tuple(f"m_T_{point}" for point in labels)
    assert f"(assert {subject.core._exactly(t_members, 4)})" in commands
    assert "(assert (not m_T_1))" in commands
    for row, role in (("C0", "b0"), ("C1", "b1")):
        members = tuple(subject.core._member(row, point) for point in labels)
        assert f"(assert {subject.core._exactly(members, 4)})" in commands
        for center in labels:
            assert (
                f"(assert (=> {subject.core._role(role, center)} "
                f"(not {subject.core._member(row, center)})))"
            ) in commands


def test_guarded_delta_activates_only_away_from_variable_centers() -> None:
    center = 8
    guard = subject._uncovered_by_known_rows(center)
    commands = subject.guarded_k4_delta_commands(center)
    members = tuple(subject._member(center, point) for point in subject.core.LABELS)
    assert f"(assert (=> {guard} {subject.core._exactly(members, 4)}))" in commands
    assert f"(assert (=> {guard} (>= r_G{center} 1)))" in commands
    assert (
        f"(assert (=> {guard} (not {subject._member(center, center)})))"
    ) in commands
    for point in subject.core.LABELS:
        if point != center:
            assert (
                f"(assert (=> (and {guard} {subject._member(center, point)}) "
                f"(= {subject.core._distance(center, point)} r_G{center})))"
            ) in commands


def test_guarded_delta_rejects_centers_with_fixed_rows() -> None:
    for center in (0, 1):
        with pytest.raises(ValueError, match="already have retained K4 witnesses"):
            subject.guarded_k4_delta_commands(center)


def test_pinned_order_removes_exactly_the_represented_centers() -> None:
    order = subject.pinned_center_order(9, 1)
    assert set(order) == set(subject.core.LABELS) - {0, 1, 9}
    assert len(order) == 10
    order = subject.pinned_center_order(9, 10)
    assert set(order) == set(subject.core.LABELS) - {0, 1, 9, 10}
    assert len(order) == 9


def test_blocker_pair_rejects_second_apex_and_aliasing() -> None:
    with pytest.raises(ValueError, match="cannot equal"):
        subject.validate_blocker_pair(0, 1)
    with pytest.raises(ValueError, match="duplicate"):
        subject.validate_blocker_pair(9, 9)


def test_pinned_builder_selects_roles_and_uses_unguarded_rows() -> None:
    order = subject.pinned_center_order(9, 1)
    commands = subject.build_pinned_commands(9, 1, order[:1])
    base_count = len(subject.retained.build_commands())
    assert commands[base_count:] == (
        f"(assert {subject.core._role('b0', 9)})",
        f"(assert {subject.core._role('b1', 1)})",
        *subject.k4_delta_commands(order[0]),
    )
    with pytest.raises(ValueError, match="already represented"):
        subject.build_pinned_commands(9, 1, (9,))


def test_source_witness_commands_encode_raw_ingress_consequences() -> None:
    commands = set(subject.source_witness_commands())
    labels = subject.core.LABELS
    for role in ("b0", "b1"):
        assert (
            f"(assert (not {subject.core._role(role, subject.retained.FIRST_APEX)}))"
            in commands
        )
    for role in ("s0", "s1", "d"):
        members = tuple(subject.core._role(role, point) for point in labels)
        assert f"(assert {subject.core._exactly_one(members)})" in commands
    for point in labels:
        s0 = subject.core._role("s0", point)
        s1 = subject.core._role("s1", point)
        deleted = subject.core._role("d", point)
        assert f"(assert (not (and {s0} {s1})))" in commands
        assert f"(assert (=> {s0} {subject.core._member('C0', point)}))" in commands
        assert f"(assert (=> {s1} {subject.core._member('C1', point)}))" in commands
        assert f"(assert (=> {s0} (not m_T_{point})))" in commands
        assert f"(assert (=> {s1} (not m_T_{point})))" in commands
        assert f"(assert (=> {deleted} m_T_{point}))" in commands
        assert (
            f"(assert (=> {deleted} (not {subject.core._member('C0', point)})))"
        ) in commands
        assert (
            f"(assert (=> {deleted} (not {subject.core._member('C1', point)})))"
        ) in commands
        assert (
            f"(assert (=> {deleted} (or {subject.core._role('z', point)} "
            f"{subject.core._member('K', point)})))"
        ) in commands


def test_prefix_builder_is_monotone() -> None:
    base = subject.build_commands(())
    first = subject.build_commands((0,))
    second = subject.build_commands((0, 1))
    assert first[: len(base)] == base
    assert second[: len(first)] == first
    assert len(first) - len(base) == len(subject.k4_delta_commands(0))
    assert len(second) - len(first) == len(subject.k4_delta_commands(1))


def test_guarded_prefix_builder_is_monotone() -> None:
    base = subject.build_guarded_commands(())
    first = subject.build_guarded_commands((8,))
    second = subject.build_guarded_commands((8, 9))
    assert first[: len(base)] == base
    assert second[: len(first)] == first
    assert len(first) - len(base) == len(subject.guarded_k4_delta_commands(8))
    assert len(second) - len(first) == len(subject.guarded_k4_delta_commands(9))


def test_journal_is_ascii_and_newline_terminated() -> None:
    payload = subject.journal_bytes(subject.build_commands((0,)))
    assert payload.endswith(b"\n")
    payload.decode("ascii")


def test_fixed_base_scan_uses_the_replayed_source_valid_cell() -> None:
    assert fixed_scan.FIXED_ROWS == (
        (9, (2, 4, 6, 11)),
        (2, (0, 1, 3, 10)),
        (0, (5, 7, 8, 12)),
        (0, (2, 9, 10, 11)),
        (1, (0, 6, 7, 10)),
    )
    fixed_scan.validate_fixed_cell()


def test_fixed_base_scan_covers_exactly_the_unrepresented_centers() -> None:
    assert set(fixed_scan.DEFAULT_CENTERS) == set(fixed_scan.core.LABELS) - {
        0,
        1,
        2,
        9,
    }
    assert all(len(fixed_scan.supports_at(center)) == 495 for center in fixed_scan.DEFAULT_CENTERS)


def test_fixed_base_scan_kalmanson_family_has_expected_size() -> None:
    assert len(fixed_scan.FORMS) == 2 * 715


def test_fixed_base_scan_sparse_vector_addition_combines_and_cancels() -> None:
    assert fixed_scan.add_vectors(
        (((0, 1), 1), ((2, 3), -1)),
        (((0, 1), -1), ((1, 2), 2)),
    ) == (((1, 2), 2), ((2, 3), -1))


def test_fixed_base_scan_binds_the_replayed_source_valid_model() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    assert binding["status"] == "SAT"
    assert binding["blocker_pins"] == {"b0": 9, "b1": 2}
    assert binding["source_roles"] == {"s0": 4, "s1": 3, "d": 7, "z": 9}
    assert binding["challenge_rows"] == {
        "8": [2, 7, 9, 12],
        "10": [8, 9, 11, 12],
        "11": [3, 5, 7, 9],
    }


@pytest.mark.parametrize(
    ("mutation", "message"),
    (
        ("schema", "schema"),
        ("pins", "blocker pins"),
        ("centers", "center sequence"),
        ("replay", "prefix replay"),
    ),
)
def test_fixed_base_scan_rejects_tampered_source_envelope(
    tmp_path, mutation: str, message: str
) -> None:
    payload = json.loads(fixed_scan.DEFAULT_SOURCE_EVENT.read_text())
    if mutation == "schema":
        payload["schema"] = "wrong"
    elif mutation == "pins":
        payload["blocker_pins"]["b0"] = 8
    else:
        selected_prefix = next(
            row
            for row in payload["solvers"][0]["prefixes"]
            if row["step"] == fixed_scan.EXPECTED_PREFIX_STEP
        )
        if mutation == "centers":
            selected_prefix["centers"] = [8, 10]
        else:
            selected_prefix["solve"]["model_replay"]["outcome"] = "FAILED"
    event = tmp_path / "tampered.json"
    event.write_text(json.dumps(payload))
    with pytest.raises(AssertionError, match=message):
        fixed_scan.source_model_binding(event)


def test_fixed_base_exactness_query_uses_disequality_without_unit_gap() -> None:
    commands = fixed_scan.exact_base_commands()
    assert len(commands) == 1548
    assert any(command.startswith("(assert (not (=") for command in commands)
    assert not any(command.startswith("(assert (>=") for command in commands)


def test_fixed_base_all_center_candidate_extends_bound_prefix_with_residuals() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    residual_supports = {
        8: (1, 2, 5, 7),
        10: (1, 4, 5, 9),
        11: (1, 4, 5, 8),
        12: (1, 4, 5, 8),
        3: (0, 1, 5, 8),
        4: (0, 1, 5, 8),
        5: (0, 1, 4, 8),
        6: (0, 2, 4, 8),
        7: (1, 2, 4, 5),
    }
    results = [
        {
            "center": center,
            "first_uncovered_supports": [list(residual_supports[center])],
        }
        for center in fixed_scan.DEFAULT_CENTERS
    ]
    rows = fixed_scan.candidate_all_center_rows(binding, results)
    assert rows == (
        (8, (2, 7, 9, 12)),
        (10, (8, 9, 11, 12)),
        (11, (3, 5, 7, 9)),
        (12, (1, 4, 5, 8)),
        (3, (0, 1, 5, 8)),
        (4, (0, 1, 5, 8)),
        (5, (0, 1, 4, 8)),
        (6, (0, 2, 4, 8)),
        (7, (1, 2, 4, 5)),
    )
    commands = fixed_scan.exact_base_commands(rows)
    assert len(commands) == 1548 + 3 * len(rows)


def test_fixed_base_all_center_candidate_requires_each_residual() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    results = [
        {"center": center, "first_uncovered_supports": []}
        for center in fixed_scan.DEFAULT_CENTERS
    ]
    with pytest.raises(AssertionError, match="center 12 has no residual support"):
        fixed_scan.candidate_all_center_rows(binding, results)


def test_fixed_base_planar_query_covers_all_eight_authenticated_rows() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    rows = fixed_planar.rows_from_binding(binding)
    assert tuple(name for name, _center, _support in rows) == (
        "C0",
        "C1",
        "K",
        "L",
        "T",
        "G8",
        "G10",
        "G11",
    )
    assert all(len(support) == 4 and center not in support for _name, center, support in rows)


@pytest.mark.parametrize(
    "challenge_prefix", range(len(fixed_planar.CHALLENGE_CENTERS) + 1)
)
def test_fixed_base_planar_query_selects_exact_challenge_prefix(
    challenge_prefix: int,
) -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    rows = fixed_planar.rows_from_binding(
        binding, challenge_prefix=challenge_prefix
    )
    expected_names = ("C0", "C1", "K", "L", "T") + tuple(
        f"G{center}" for center in fixed_planar.CHALLENGE_CENTERS[:challenge_prefix]
    )
    assert tuple(name for name, _center, _support in rows) == expected_names
    assert fixed_planar.inventory(challenge_prefix=challenge_prefix) == {
        "commands": 229 + 6 * challenge_prefix,
        "coordinate_variables": 26,
        "radius_squared_variables": 5 + challenge_prefix,
        "supporting_edge_strict_forms": 143,
        "row_equalities": 20 + 4 * challenge_prefix,
        "off_radius_disequalities": 24,
        "distinct_row_radius_constraints": 1,
    }


def test_fixed_base_planar_query_rejects_invalid_challenge_prefix() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    with pytest.raises(ValueError, match="between zero and 3"):
        fixed_planar.rows_from_binding(
            binding, challenge_prefix=len(fixed_planar.CHALLENGE_CENTERS) + 1
        )


@pytest.mark.parametrize("source_prefix", range(6))
def test_fixed_base_planar_query_selects_exact_source_prefix(source_prefix: int) -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    rows = fixed_planar.rows_from_binding(
        binding, source_prefix=source_prefix, challenge_prefix=0
    )
    assert tuple(name for name, _center, _support in rows) == (
        fixed_planar.SOURCE_ROW_NAMES[:source_prefix]
    )
    exact_rows = len(fixed_planar.EXACT_ROW_NAMES & set(fixed_planar.SOURCE_ROW_NAMES[:source_prefix]))
    distinct_radii = int(source_prefix >= 4)
    assert fixed_planar.inventory(
        source_prefix=source_prefix, challenge_prefix=0
    ) == {
        "commands": 174 + 6 * source_prefix + 8 * exact_rows + distinct_radii,
        "coordinate_variables": 26,
        "radius_squared_variables": source_prefix,
        "supporting_edge_strict_forms": 143,
        "row_equalities": 4 * source_prefix,
        "off_radius_disequalities": 8 * exact_rows,
        "distinct_row_radius_constraints": distinct_radii,
    }


def test_fixed_base_planar_query_rejects_invalid_source_prefix() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    with pytest.raises(ValueError, match="between zero and five"):
        fixed_planar.rows_from_binding(binding, source_prefix=6)


def test_fixed_base_kalmanson_cone_rejects_malformed_cell() -> None:
    with pytest.raises(ValueError, match="four distinct"):
        fixed_cone.validate_cell(8, (0, 0, 1, 2))
    with pytest.raises(ValueError, match="omit"):
        fixed_cone.validate_cell(8, (0, 1, 2, 8))


def test_fixed_base_kalmanson_cone_encodes_normalized_nonnegative_kernel() -> None:
    center = 8
    support = (1, 2, 5, 7)
    forms = fixed_cone.projected_forms(center, support)
    commands = fixed_cone.build_commands(center, support)
    coordinates = {
        edge for _form, vector in forms for edge, _coefficient in vector
    }
    assert forms
    assert all(vector for _form, vector in forms)
    assert commands[0] == "(set-logic QF_LRA)"
    assert len(commands) == 2 + 2 * len(forms) + len(coordinates)
    assert any(command.endswith(" 1))") for command in commands)
    assert not any("declare-const d_" in command for command in commands)


def test_fixed_base_kalmanson_cone_retains_trivial_zero_projection() -> None:
    forms = fixed_cone.projected_forms(8, (0, 1, 2, 3))
    assert any(not vector for _form, vector in forms)


def test_fixed_base_kalmanson_cone_binds_all_center_candidate() -> None:
    event = Path(
        "scratch/runs/cardge13-exact13-k4-prefix-cegar-20260904/run-0006/"
        "events/all-centers-source-valid-candidate-piqd.json"
    )
    rows, binding = fixed_cone.rows_event_binding(event)
    assert tuple(center for center, _support in rows) == fixed_scan.DEFAULT_CENTERS
    assert len(binding["rows"]) == len(fixed_scan.DEFAULT_CENTERS)
    forms = fixed_cone.projected_forms_for_rows(rows)
    commands = fixed_cone.build_commands_for_rows(rows)
    coordinates = {
        edge for _form, vector in forms for edge, _coefficient in vector
    }
    assert forms
    assert len(commands) == 2 + 2 * len(forms) + len(coordinates)


def test_fixed_base_planar_inventory_is_exact() -> None:
    assert fixed_planar.inventory() == {
        "commands": 247,
        "coordinate_variables": 26,
        "radius_squared_variables": 8,
        "supporting_edge_strict_forms": 143,
        "row_equalities": 32,
        "off_radius_disequalities": 24,
        "distinct_row_radius_constraints": 1,
    }
    commands = fixed_planar.build_commands()
    assert commands[0] == "(set-logic QF_NRA)"
    assert commands[-1] == "(assert (distinct r2_K r2_L))"
    assert not any("r2_C0" in command and "distinct" in command for command in commands)
    assert not any("r2_G8" in command and "distinct" in command for command in commands)


def test_residual_csp_binds_exhaustive_source_domains() -> None:
    domains, binding = residual_csp.domains_event_binding(
        residual_csp.DEFAULT_DOMAINS_EVENT
    )
    assert binding["domain_sizes"] == {
        "12": 21,
        "3": 9,
        "4": 10,
        "5": 8,
        "6": 6,
        "7": 4,
    }
    assert tuple(domains) == (12, 3, 4, 5, 6, 7)
    source_binding = binding["source_model_binding"]
    assert isinstance(source_binding, dict)
    bank = residual_csp.build_bank(
        domains, residual_csp.fixed_prefix_rows(source_binding)
    )
    assert residual_csp.exhaustive_bank_oracle(domains, bank) == {
        "expected_status": "UNSAT",
        "assignment_count": 362_880,
        "checked_assignment_count": 362_880,
        "survivor": None,
    }


def test_residual_csp_uses_replayed_source_prefix() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    assert residual_csp.fixed_prefix_rows(binding) == (
        (8, (2, 7, 9, 12)),
        (10, (8, 9, 11, 12)),
        (11, (3, 5, 7, 9)),
    )


def test_residual_csp_detects_two_row_zero_form() -> None:
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    prefix = residual_csp.fixed_prefix_rows(binding)
    assert residual_csp.zero_form(
        prefix
        + (
            (12, (1, 4, 5, 8)),
            (3, (0, 1, 5, 8)),
        )
    ) == (8, 12, 3, 5, 0)


def test_residual_csp_encodes_exactly_one_choice_and_conflict_bank() -> None:
    domains = {
        12: ((1, 4, 5, 8), (1, 4, 5, 10)),
        3: ((0, 1, 5, 8), (0, 1, 5, 9)),
    }
    binding = fixed_scan.source_model_binding(fixed_scan.DEFAULT_SOURCE_EVENT)
    bank = residual_csp.build_bank(
        domains, residual_csp.fixed_prefix_rows(binding)
    )
    commands = residual_csp.build_commands(domains, bank)
    assert commands[0] == "(set-logic QF_UF)"
    assert "(assert (or x_12_0 x_12_1))" in commands
    assert "(assert (or (not x_12_0) (not x_12_1)))" in commands
    assert any(
        row["left_center"] == 12 and row["right_center"] == 3
        for row in bank["pair"]
    )


def test_residual_csp_decodes_one_selected_row_per_center() -> None:
    domains = {
        12: ((1, 4, 5, 8), (1, 4, 5, 10)),
        3: ((0, 1, 5, 8), (0, 1, 5, 9)),
    }
    model = """
(define-fun x_12_0 () Bool true)
(define-fun x_12_1 () Bool false)
(define-fun x_3_0 () Bool false)
(define-fun x_3_1 () Bool true)
"""
    assert residual_csp.decode_model(model, domains) == {
        "12": [1, 4, 5, 8],
        "3": [0, 1, 5, 9],
    }
