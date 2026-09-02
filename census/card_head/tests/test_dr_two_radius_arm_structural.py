"""Tests for the profile-parametrized D-R two-radius structural CNF (no solver runs)."""

from __future__ import annotations

import hashlib
import json
from itertools import combinations, product
from math import comb
from pathlib import Path

import pytest

from census.card_head import dr_exact12_structural as exact12
from census.card_head import dr_two_radius_arm_structural as arm

CORE = ("two_circle_same_arc", "five_point_circle_isosceles_order")
WAVE_FIVE_SHA256 = "e29d1b2646d763425598fe0e5b1364118033b61df5aacdf5b907b6d0dad3bcb0"
SPEC_FAMILIES = {"transitivity", "second_apex_rows", "first_apex_class", "k4_everywhere", "blockers"} | set(CORE)
ARMS_13 = ("secondOpposite", "surplus", "firstOpposite")


def _same_arc_pairs(profile: arm.Profile) -> int:
    """Independent count of same-arc pairs: per chord, C(k, 2) + C(n - 2 - k, 2) with k labels strictly inside the forward arc."""

    n = profile.card
    position = {label: index for index, label in enumerate(profile.cyclic_order)}
    total = 0
    for q, v in combinations(profile.labels, 2):
        k = (position[v] - position[q]) % n - 1
        total += comb(k, 2) + comb(n - 2 - k, 2)
    return total


def _by_family(cnf: exact12.CNF) -> dict[str, list[tuple[int, ...]]]:
    grouped: dict[str, list[tuple[int, ...]]] = {}
    for family, clause in zip(cnf.families, cnf.clauses, strict=True):
        grouped.setdefault(family, []).append(clause)
    return grouped


# --------------------------------------------------------------------------
# Legacy mode reproduces the exact-12 encoder
# --------------------------------------------------------------------------


def test_legacy_two_family_core_matches_exact12() -> None:
    reference, ref_layout = exact12.build("none", families=CORE)
    cnf, layout = arm.build(arm.EXACT12, mode="legacy", families=CORE, ingress=True)
    assert cnf.n_variables == reference.n_variables
    assert cnf.clauses == reference.clauses
    assert cnf.families == reference.families
    assert cnf.counts == reference.counts
    assert layout.relation_variables == ref_layout.relation_variables
    assert layout.k4 == ref_layout.k4
    assert (layout.x, layout.y, layout.u, layout.chi) == (ref_layout.x, ref_layout.y, ref_layout.u, ref_layout.chi)
    assert (layout.src, layout.deleted, layout.b2x, layout.b2y) == (ref_layout.src, ref_layout.deleted, ref_layout.b2x, ref_layout.b2y)
    dimacs = cnf.dimacs()
    assert dimacs == reference.dimacs()
    assert hashlib.sha256(dimacs).hexdigest() == WAVE_FIVE_SHA256
    assert len(cnf.clauses) == 254_412
    assert cnf.n_variables == 6_281


def test_legacy_default_families_matches_exact12() -> None:
    reference, _ = exact12.build("none")
    ref_bytes = reference.dimacs()
    ref_counts, ref_families, ref_variables = dict(reference.counts), reference.families, reference.n_variables
    del reference
    cnf, _ = arm.build(arm.EXACT12, mode="legacy", ingress=True)
    assert cnf.n_variables == ref_variables
    assert cnf.counts == ref_counts
    assert cnf.families == ref_families
    assert cnf.dimacs() == ref_bytes


def test_legacy_controls_match_exact12() -> None:
    for control in ("five-at-second-apex", "first-apex-symmetry"):
        reference, _ = exact12.build(control, families=CORE)
        cnf, _ = arm.build(arm.EXACT12, mode="legacy", control=control, families=CORE, ingress=True)
        assert cnf.clauses == reference.clauses


def test_legacy_mode_is_exact12_only() -> None:
    with pytest.raises(exact12.DRStructuralError):
        arm.build(arm.profile_for(13, "surplus"), mode="legacy", families=CORE, ingress=True)
    with pytest.raises(exact12.DRStructuralError):
        arm.build(arm.EXACT12, mode="legacy", families=CORE, ingress=False)
    with pytest.raises(exact12.DRStructuralError):
        arm.build(arm.EXACT12, mode="generic", control="five-at-second-apex", families=CORE, ingress=False)
    with pytest.raises(exact12.DRStructuralError):
        arm.build(arm.EXACT12, mode="generic", families=("transitivity",), ingress=False)


# --------------------------------------------------------------------------
# Profiles
# --------------------------------------------------------------------------


def test_profile_table() -> None:
    expected = {
        (12, "exact12"): (3, 2, 4),
        (13, "secondOpposite"): (3, 2, 5),
        (13, "surplus"): (4, 2, 4),
        (13, "firstOpposite"): (3, 3, 4),
    }
    profiles = {(p.card, p.arm): p for p in arm.all_profiles()}
    assert set(profiles) == set(expected)
    for (card, name), sizes in expected.items():
        profile = profiles[(card, name)]
        assert profile.sizes == sizes
        assert 3 + sum(sizes) == card
        assert len(profile.is_labels) + len(profile.i1_labels) + len(profile.i2_labels) + 3 == card
        assert profile.labels == tuple(range(card))
        assert sorted(profile.cyclic_order) == list(profile.labels)
        assert (arm.A2, arm.A1, arm.A3) == (0, 1, 2)
        assert profile.is_labels + profile.i1_labels + profile.i2_labels == tuple(range(3, card))
        assert profile.cyclic_order == (1,) + profile.is_labels + (0,) + profile.i1_labels + (2,) + profile.i2_labels
        assert (profile.interior_q, profile.interior_w) == profile.i1_labels[:2]
        assert profile.others(0) == tuple(range(1, card))
    exact = profiles[(12, "exact12")]
    assert exact.cyclic_order == exact12.CYCLIC_ORDER
    assert (exact.is_labels, exact.i1_labels, exact.i2_labels) == (exact12.IS, exact12.I1, exact12.I2)
    assert (exact.interior_q, exact.interior_w) == (exact12.IQ, exact12.IW)
    with pytest.raises(exact12.DRStructuralError):
        arm.profile_for(14, "surplus")
    with pytest.raises(exact12.DRStructuralError):
        arm.profile_for(13, "exact12")


# --------------------------------------------------------------------------
# Cardinality helpers beyond six variables
# --------------------------------------------------------------------------


def _satisfying_weights(cnf: exact12.CNF, n: int) -> set[int]:
    weights: set[int] = set()
    for bits in product((False, True), repeat=n):
        value = {i + 1: bits[i] for i in range(n)}
        ok = all(any(value[abs(lit)] == (lit > 0) for lit in clause) for clause in cnf.clauses)
        if ok:
            weights.add(sum(bits))
    return weights


@pytest.mark.parametrize(("n", "k"), [(7, 3), (8, 4), (8, 1), (7, 6)])
def test_at_most_k_brute_force(n: int, k: int) -> None:
    cnf = exact12.CNF()
    variables = [cnf.new_variable(f"v{i}") for i in range(n)]
    arm._at_most_k(cnf, "t", variables, k)
    assert len(cnf.clauses) == comb(n, k + 1)
    assert _satisfying_weights(cnf, n) == set(range(k + 1))
    # every assignment of weight <= k satisfies; every heavier one fails (checked by weight set above)
    assert all(len(c) == k + 1 and all(lit < 0 for lit in c) for c in cnf.clauses)


@pytest.mark.parametrize(("n", "k"), [(7, 3), (8, 4), (8, 2), (7, 7), (7, 0)])
def test_exactly_k_brute_force(n: int, k: int) -> None:
    cnf = exact12.CNF()
    variables = [cnf.new_variable(f"v{i}") for i in range(n)]
    arm._exactly_k(cnf, "t", variables, k)
    assert len(cnf.clauses) == comb(n, n - k + 1) + comb(n, k + 1)
    assert _satisfying_weights(cnf, n) == {k}


def test_exactly_k_matches_exact12_helper_at_small_sizes() -> None:
    for n, k in ((4, 1), (6, 2), (5, 3)):
        mine, theirs = exact12.CNF(), exact12.CNF()
        variables = [mine.new_variable(f"v{i}") for i in range(n)]
        for i in range(n):
            theirs.new_variable(f"v{i}")
        arm._exactly_k(mine, "t", variables, k)
        exact12._exactly_k(theirs, "t", variables, k)
        assert mine.clauses == theirs.clauses


# --------------------------------------------------------------------------
# Generic mode
# --------------------------------------------------------------------------


@pytest.fixture(scope="module")
def generic_card13() -> dict[str, tuple[exact12.CNF, arm.Layout]]:
    return {name: arm.build(arm.profile_for(13, name), mode="generic", families=CORE, ingress=False) for name in ARMS_13}


@pytest.mark.parametrize("name", ARMS_13)
def test_generic_card13_arms_build(name: str, generic_card13: dict[str, tuple[exact12.CNF, arm.Layout]]) -> None:
    cnf, layout = generic_card13[name]
    profile = layout.profile
    assert profile.card == 13
    assert set(cnf.counts) == SPEC_FAMILIES
    assert "ingress" not in cnf.counts
    assert layout.src == {} and layout.deleted == {} and layout.b2x is None and layout.b2y is None
    assert len(layout.edges) == comb(13, 2) == 78
    assert len(layout.relation_variables) == comb(78, 2)
    assert cnf.counts["transitivity"] == 3 * comb(78, 3)
    assert len(layout.k4) == 13 * comb(12, 4)
    assert cnf.counts["k4_everywhere"] == 13 * (comb(12, 4) * 6 + 1)
    assert len(layout.chi) == 12 + 12 * 11
    assert cnf.counts["two_circle_same_arc"] == _same_arc_pairs(profile)
    n_is, n_i1, n_i2 = profile.sizes
    per_row = 3 * comb(12, 2) + comb(12, 9) + comb(12, 5) + comb(n_is + 1, 2) + comb(n_i1 + 1, 2)
    assert cnf.counts["second_apex_rows"] == 2 * per_row + 12
    assert cnf.counts["first_apex_class"] == 3 * comb(12, 2) + 2 + comb(12, 9) + comb(12, 5) + comb(n_is + 1, 2) + comb(n_i2 + 1, 2) + 4 * comb(12, 4)
    header = cnf.dimacs().split(b"\n", 1)[0]
    assert header == f"p cnf {cnf.n_variables} {len(cnf.clauses)}".encode()
    assert cnf.n_variables == comb(78, 2) + 2 * 12 + 12 + 13 * comb(12, 4) + 12 + 12 * 11
    assert len(cnf.families) == len(cnf.clauses)


def test_generic_card13_ingress_on_request() -> None:
    cnf, layout = arm.build(arm.profile_for(13, "secondOpposite"), mode="generic", families=CORE, ingress=True)
    assert cnf.counts["ingress"] > 0
    assert sorted(layout.deleted) == [0, 2] + list(range(6, 13))
    assert len(layout.src) == 13


def test_generic_exact12_differs_only_in_row_and_class_families() -> None:
    legacy, legacy_layout = arm.build(arm.EXACT12, mode="legacy", families=CORE, ingress=True)
    generic, generic_layout = arm.build(arm.EXACT12, mode="generic", families=CORE, ingress=False)
    assert generic_layout.k4 == legacy_layout.k4
    assert generic_layout.chi == legacy_layout.chi
    assert (generic_layout.x, generic_layout.y, generic_layout.u) == (legacy_layout.x, legacy_layout.y, legacy_layout.u)
    by_legacy, by_generic = _by_family(legacy), _by_family(generic)
    assert set(by_legacy) == set(by_generic) | {"ingress"}
    for family in by_generic:
        if family in ("second_apex_rows", "first_apex_class"):
            assert by_generic[family] != by_legacy[family], family
        else:
            assert by_generic[family] == by_legacy[family], family
    assert "ingress" not in by_generic
    x = legacy_layout.x
    legacy_rows, generic_rows = set(by_legacy["second_apex_rows"]), set(by_generic["second_apex_rows"])
    at_least_two_in_i2 = {tuple(sorted(s)) for s in combinations([x[z] for z in exact12.I2], 3)}
    at_least_four = {tuple(sorted(s)) for s in combinations([x[z] for z in exact12.others(exact12.A2)], 8)}
    assert at_least_two_in_i2 <= legacy_rows and not (at_least_two_in_i2 & generic_rows)
    assert at_least_four <= generic_rows and not (at_least_four & legacy_rows)
    assert cnf_same_arc_count(generic) == cnf_same_arc_count(legacy) == _same_arc_pairs(arm.EXACT12) == 1_980


def cnf_same_arc_count(cnf: exact12.CNF) -> int:
    return cnf.counts["two_circle_same_arc"]


def test_generic_exact12_counts() -> None:
    cnf, _ = arm.build(arm.EXACT12, mode="generic", families=CORE, ingress=False)
    assert set(cnf.counts) == SPEC_FAMILIES
    per_row = 3 * comb(11, 2) + comb(11, 8) + comb(11, 5) + comb(4, 2) + comb(3, 2)
    assert cnf.counts["second_apex_rows"] == 2 * per_row + 11
    assert cnf.counts["first_apex_class"] == 3 * comb(11, 2) + 2 + comb(11, 8) + comb(11, 5) + comb(4, 2) + comb(5, 2) + 4 * comb(11, 4)


# --------------------------------------------------------------------------
# Manifest and CLI
# --------------------------------------------------------------------------


def test_manifest_and_cli(tmp_path) -> None:
    cnf_path, manifest_path = tmp_path / "out.cnf", tmp_path / "out.json"
    argv = ["--card", "12", "--arm", "exact12", "--mode", "legacy", "--family", CORE[0], "--family", CORE[1], "--cnf", str(cnf_path), "--manifest", str(manifest_path)]
    assert arm.main(argv) == 0
    assert hashlib.sha256(cnf_path.read_bytes()).hexdigest() == WAVE_FIVE_SHA256
    payload = json.loads(manifest_path.read_text())
    assert payload["schema"] == arm.SCHEMA
    assert payload["mode"] == "legacy" and payload["ingress"] is True
    assert payload["cnf_sha256"] == WAVE_FIVE_SHA256
    assert payload["profile"]["sizes"] == [3, 2, 4]
    assert payload["families"] == list(CORE)
    assert payload["promotion_eligible"] is False
    assert payload["cut_admission_ledger"] == list(exact12.SOURCE_CLAUSE_LEDGER)

    argv = ["--card", "13", "--arm", "surplus", "--mode", "generic", "--family", CORE[0], "--family", CORE[1], "--cnf", str(cnf_path), "--manifest", str(manifest_path)]
    assert arm.main(argv) == 0
    payload = json.loads(manifest_path.read_text())
    assert payload["mode"] == "generic" and payload["ingress"] is False
    assert payload["profile"] == arm.profile_for(13, "surplus").payload()
    assert payload["cut_admission_ledger"] == list(arm.CUT_ADMISSION_LEDGER)
    assert payload["target_theorem"].endswith("_cardGeThirteen")
    assert "ingress" not in payload["clause_counts"]
    assert payload["cnf_sha256"] == hashlib.sha256(cnf_path.read_bytes()).hexdigest()
    with pytest.raises(SystemExit):
        arm.main(argv + ["--family", "transitivity"])


# --------------------------------------------------------------------------
# NEW_FAMILIES cuts (cap_betweenness, common_pair_localization,
# frontier_bisector_interior)
# --------------------------------------------------------------------------

NEW = ("cap_betweenness", "common_pair_localization", "frontier_bisector_interior")
GENERIC_SECOND_OPPOSITE_SHA256 = "21df2d6e3581ba21aa3e1798fb0095549e0ff0d2662cd9b3833701cda3308bb3"
ARTIFACTS = Path(__file__).resolve().parents[3] / "scratch" / "runs" / "dr-two-radius-20260901" / "p4-card13-arms" / "artifacts"


def _reference_new_family_clauses(layout: arm.Layout) -> dict[str, list[tuple[int, ...]]]:
    """Independent reference for the three cut families, from the checker semantics.

    Deliberately re-derives the caps, the loop bounds and the relation-variable
    lookup rather than calling the encoder's helpers.
    """

    profile = layout.profile
    index = {edge: position for position, edge in enumerate(layout.edges)}
    relation = layout.relation_variables

    def same(c: int, a: int, b: int) -> int:
        first = index[(min(c, a), max(c, a))]
        second = index[(min(c, b), max(c, b))]
        assert first != second
        return relation[(min(first, second), max(first, second))]

    def clause(*literals: int) -> tuple[int, ...]:
        return tuple(sorted(set(literals), key=abs))

    a2, a1, a3 = 0, 1, 2
    labels = list(range(profile.card))
    i_s, i1, i2 = list(profile.is_labels), list(profile.i1_labels), list(profile.i2_labels)
    caps = {
        "capS": ([a1] + i_s + [a2], a3, i_s),
        "cap1": ([a2] + i1 + [a3], a1, i1),
        "cap2": ([a3] + i2 + [a1], a2, i2),
    }
    out: dict[str, list[tuple[int, ...]]] = {name: [] for name in NEW}
    for order, opposite, interior in caps.values():
        pos = {z: k for k, z in enumerate(order)}
        for j in order:
            for r in order:
                for s in order:
                    if not (pos[r] < pos[s]) or j in (r, s):
                        continue
                    if not (pos[r] < pos[j] < pos[s]):
                        out["cap_betweenness"].append(clause(-same(j, r, s)))
        for s in interior:
            for q in interior:
                if not s < q:
                    continue
                for c in labels:
                    if c in interior or c == opposite:
                        continue
                    out["common_pair_localization"].append(clause(-same(c, s, q), -same(opposite, s, q)))
    iq, iw = profile.interior_q, profile.interior_w
    for c in labels:
        if c in i1 or c == a1:
            continue
        out["frontier_bisector_interior"].append(clause(-same(c, iq, iw)))
    return out


@pytest.fixture(scope="module")
def generic_card13_new() -> dict[str, tuple[exact12.CNF, arm.Layout]]:
    return {name: arm.build(arm.profile_for(13, name), mode="generic", families=CORE + NEW, ingress=False) for name in ARMS_13}


def test_new_families_tuple_and_ledger() -> None:
    assert arm.NEW_FAMILIES == NEW
    assert not set(arm.NEW_FAMILIES) & set(exact12.SELECTABLE_FAMILIES)
    ledger = {entry["family"]: entry for entry in arm.CUT_ADMISSION_LEDGER}
    for name in NEW:
        assert name in ledger
        assert ledger[name]["status"] and ledger[name]["lean_sources"]
    assert "index_strictly_between_of_equidistant" in ledger["cap_betweenness"]["lean_sources"]
    assert "{{NEEDS_PROOF}}" in ledger["cap_betweenness"]["status"]
    assert "commonPhysicalPair_center_mem_capInteriorByIndex" in ledger["common_pair_localization"]["lean_sources"]
    assert "bisector_center_mem_interior" in ledger["frontier_bisector_interior"]["lean_sources"]


@pytest.mark.parametrize("name", ARMS_13)
def test_new_families_match_reference(name: str, generic_card13_new: dict[str, tuple[exact12.CNF, arm.Layout]]) -> None:
    cnf, layout = generic_card13_new[name]
    grouped = _by_family(cnf)
    expected = _reference_new_family_clauses(layout)
    for family in NEW:
        assert sorted(grouped[family]) == sorted(expected[family]), family
        assert len(grouped[family]) == len(set(grouped[family])), family
        assert cnf.counts[family] == len(expected[family]), family
    assert set(cnf.counts) == SPEC_FAMILIES | set(NEW)
    assert all(len(c) == 1 and c[0] < 0 for c in grouped["cap_betweenness"])
    assert all(len(c) == 2 and all(lit < 0 for lit in c) for c in grouped["common_pair_localization"])
    assert all(len(c) == 1 and c[0] < 0 for c in grouped["frontier_bisector_interior"])


@pytest.mark.parametrize("name", ARMS_13)
def test_new_family_counts_closed_form(name: str, generic_card13_new: dict[str, tuple[exact12.CNF, arm.Layout]]) -> None:
    """cap_betweenness: 2 * C(m, 3) per closed cap of size m; the others by inspection."""

    cnf, layout = generic_card13_new[name]
    profile = layout.profile
    caps = arm.closed_caps(profile)
    assert [len(order) for _n, order, _o, _i in caps] == [len(profile.is_labels) + 2, len(profile.i1_labels) + 2, len(profile.i2_labels) + 2]
    assert cnf.counts["cap_betweenness"] == sum(2 * comb(len(order), 3) for _n, order, _o, _i in caps)
    assert cnf.counts["common_pair_localization"] == sum(comb(len(interior), 2) * (profile.card - len(interior) - 1) for _n, _o2, _o, interior in caps)
    assert cnf.counts["frontier_bisector_interior"] == profile.card - len(profile.i1_labels) - 1


def test_new_families_are_generic_only_and_off_by_default() -> None:
    reference, _ = arm.build(arm.EXACT12, mode="legacy", families=CORE, ingress=True)
    with_new, _ = arm.build(arm.EXACT12, mode="legacy", families=CORE + NEW, ingress=True)
    assert with_new.clauses == reference.clauses
    assert not set(with_new.counts) & set(NEW)
    assert hashlib.sha256(with_new.dimacs()).hexdigest() == WAVE_FIVE_SHA256
    default, _ = arm.build(arm.profile_for(13, "secondOpposite"), mode="generic", ingress=False)
    assert not set(default.counts) & set(NEW)


def test_generic_base_sha_unchanged() -> None:
    cnf, _ = arm.build(arm.profile_for(13, "secondOpposite"), mode="generic", families=CORE, ingress=False)
    assert hashlib.sha256(cnf.dimacs()).hexdigest() == GENERIC_SECOND_OPPOSITE_SHA256
    recorded = ARTIFACTS / "cnf-card13-secondOpposite-generic.json"
    if recorded.exists():
        assert json.loads(recorded.read_text())["cnf_sha256"] == GENERIC_SECOND_OPPOSITE_SHA256


def test_new_families_in_cli_manifest(tmp_path) -> None:
    cnf_path, manifest_path = tmp_path / "out.cnf", tmp_path / "out.json"
    argv = ["--card", "13", "--arm", "secondOpposite", "--mode", "generic"]
    for family in CORE + NEW:
        argv += ["--family", family]
    argv += ["--cnf", str(cnf_path), "--manifest", str(manifest_path)]
    assert arm.main(argv) == 0
    payload = json.loads(manifest_path.read_text())
    assert payload["families"] == list(CORE + NEW)
    assert set(NEW) <= set(payload["clause_counts"])
    assert {entry["family"] for entry in payload["cut_admission_ledger"]} >= set(NEW)
    assert payload["cnf_sha256"] == hashlib.sha256(cnf_path.read_bytes()).hexdigest()


def test_new_families_replay_on_convex_model() -> None:
    """The recorded convex-family model violates cap_betweenness but satisfies the other two."""

    model_path = ARTIFACTS / "model-cnf-card13-secondOpposite-generic-convex.json"
    if not model_path.exists():
        pytest.skip(f"no recorded model at {model_path}")
    assignment = json.loads(model_path.read_text())["assignment"]
    truth = {abs(literal): literal > 0 for literal in assignment}
    cnf, _layout = arm.build(arm.profile_for(13, "secondOpposite"), mode="generic", families=CORE + NEW, ingress=False)
    grouped = _by_family(cnf)

    def satisfied(clause: tuple[int, ...]) -> bool:
        return any(truth.get(abs(lit), False) == (lit > 0) for lit in clause)

    assert any(not satisfied(clause) for clause in grouped["cap_betweenness"])
    assert all(satisfied(clause) for clause in grouped["common_pair_localization"])
    assert all(satisfied(clause) for clause in grouped["frontier_bisector_interior"])
