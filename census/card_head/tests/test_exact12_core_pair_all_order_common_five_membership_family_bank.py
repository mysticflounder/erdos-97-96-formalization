from __future__ import annotations

import collections
import itertools
from pathlib import Path

import pytest

import census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank as parent_family_bank_module
import census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank as family_bank_module
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    _admissible_center_exchange,
    _row_realizable,
)
from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (
    family_roles as parent_family_roles,
)
from census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank import (
    BANK_SCHEMA,
    DOMINANT_CORE,
    EXPECTED_COMPILED_SHA256,
    EXPECTED_DEFINITION_COUNT,
    EXPECTED_DELTA_CLAUSE_COUNT,
    EXPECTED_DELTA_SHA256,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_FINAL_VARIABLES,
    EXPECTED_FRESH_REQUIREMENT_COUNT,
    EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT,
    EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT,
    EXPECTED_FULL_ORBIT_ROLE_COUNT,
    EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT,
    EXPECTED_LOGICAL_REQUIREMENT_COUNT,
    EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT,
    EXPECTED_PAIR_REQUIREMENT_COUNT,
    EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT,
    EXPECTED_PARENT_BANK_SHA256,
    EXPECTED_PARENT_CLAUSES,
    EXPECTED_PARENT_DIMACS_SHA256,
    EXPECTED_PARENT_VARIABLES,
    EXPECTED_PATTERN_COUNT,
    EXPECTED_PATTERN_ROW_ARITIES,
    EXPECTED_REQUIREMENTS_SHA256,
    EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256,
    EXPECTED_REUSED_REQUIREMENT_COUNT,
    EXPECTED_ROLE_COUNT,
    EXPECTED_ROLES_SHA256,
    EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT,
    EXPECTED_TRIPLE_REQUIREMENT_COUNT,
    FAMILY_ID,
    LEAN_CNF_MODULE,
    LEAN_ROOT_MODULES,
    PARENT_VARIABLE_CUTOFF,
    REQUIRED_PIN_NAMES,
    Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
    _admissible_core_pair,
    _core_steps,
    _lean_source_paths,
    _pair_side_conditions,
    _source_paths,
    _union_rows,
    build_core_pair_all_order_common_five_membership_family_bank,
    family_patterns,
    family_requirements,
    family_roles,
    partner_role,
    pending_pin_names,
    production_family_id_for_cell,
)
from census.card_head.exact12_positive_membership_source_order_bank import _sha256_json

REPO_ROOT = Path(__file__).resolve().parents[3]
CERTIFICATE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CorePairAllOrderCommonFiveCertificate.lean"
)
BRIDGE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CorePairBoundaryOrderBridge.lean"
)
CNF_PATH = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221CorePairAllOrderCommonFiveMembershipFamilyCnf.lean"
)
# The v25 mined pair as the checked certificate writes it, in
# (a, x, b, c, y) argument order for each core.
V25_LEFT_CORE = (10, 7, 8, 5, 11)
V25_RIGHT_CORE = (7, 5, 8, 10, 11)


def _clear_caches() -> None:
    family_bank_module._family_roles.cache_clear()
    family_bank_module._normalized_patterns.cache_clear()
    family_bank_module._all_requirements.cache_clear()


@pytest.fixture
def isolated_caches():
    """Run a drift test against freshly derived, then restored, caches."""

    _clear_caches()
    yield
    _clear_caches()


def test_schema_family_id_and_frozen_parent_identity() -> None:
    assert BANK_SCHEMA == (
        "p97_rigid221_exact12_core_pair_all_order_common_five_membership_"
        "family_bank.v1"
    )
    assert FAMILY_ID == "core-pair-all-order-common-five-label-general-abcxy.v1"
    assert family_bank_module.SEMANTIC_STATUS == (
        "FINITE_SOURCE_PROVED_LABEL_GENERAL_CORE_PAIR_ALL_ORDER_COMMON_FIVE_"
        "MEMBERSHIP_FAMILY"
    )
    assert family_bank_module.PRODUCTION_FAMILY_ID_BY_CELL == {6: FAMILY_ID}
    # The parent identity is read from the frozen twenty-first bank, never
    # transcribed: its final CNF state is this family's initial state.
    assert EXPECTED_PARENT_VARIABLES == (
        parent_family_bank_module.EXPECTED_FINAL_VARIABLES
    ) == 47_174
    assert EXPECTED_PARENT_CLAUSES == (
        parent_family_bank_module.EXPECTED_FINAL_CLAUSES
    ) == 679_351
    assert EXPECTED_PARENT_DIMACS_SHA256 == (
        parent_family_bank_module.EXPECTED_FINAL_DIMACS_SHA256
    )
    assert EXPECTED_PARENT_BANK_SHA256 == (
        parent_family_bank_module.EXPECTED_BANK_SHA256
    )
    assert PARENT_VARIABLE_CUTOFF == EXPECTED_PARENT_VARIABLES == 47_174
    assert family_bank_module.PARENT_BANK_SCHEMA == (
        parent_family_bank_module.BANK_SCHEMA
    )
    assert family_bank_module.PARENT_FAMILY_ID == parent_family_bank_module.FAMILY_ID


def test_rotation_and_union_rows_follow_the_certificate() -> None:
    # The rotation the certificate's core pair carries.
    assert partner_role(DOMINANT_CORE) == (7, 8, 10, 5, 11)
    a, b, c, x, y = DOMINANT_CORE
    assert (a, x, b, c, y) == V25_LEFT_CORE
    pa, pb, pc, px, py = partner_role(DOMINANT_CORE)
    assert (pa, px, pb, pc, py) == V25_RIGHT_CORE
    # The eight primitive steps of CorePairCommonFiveData.check, merged by
    # center, are the four union rows.
    assert _core_steps(DOMINANT_CORE) == (
        (7, (10, 8)),
        (11, (10, 8)),
        (5, (8, 7)),
        (5, (8, 11)),
    )
    assert _core_steps(partner_role(DOMINANT_CORE)) == (
        (5, (7, 8)),
        (11, (7, 8)),
        (10, (8, 5)),
        (10, (8, 11)),
    )
    assert _union_rows(DOMINANT_CORE) == (
        (7, (10, 8)),
        (11, (10, 8, 7)),
        (5, (8, 7, 11)),
        (10, (8, 5, 11)),
    )
    # Every role's union rows must contain each core's own four rows: that
    # containment is what lets either branch of the four-way orientation
    # disjunction consume the rows its ConvexFivePointCore needs.
    for role in family_roles():
        rows = {center: frozenset(required) for center, required in _union_rows(role)}
        assert len(rows) == 4
        for core in (role, partner_role(role)):
            for center, required in _core_steps(core):
                assert frozenset(required) <= rows[center]
        a, b, c, x, y = role
        assert set(rows) == {a, c, x, y}


def test_delta_orbit_counts_match_frozen_pins() -> None:
    # Independent re-enumeration: this must not call family_roles().
    side_conditions = 0
    admissible = 0
    single_core = 0
    delta: list[tuple[int, int, int, int, int]] = []
    for role in itertools.product(range(12), repeat=5):
        if not _pair_side_conditions(role):
            continue
        side_conditions += 1
        if not _admissible_core_pair(role):
            continue
        admissible += 1
        a, b, c, x, y = role
        pa, pb, pc, px, py = partner_role(role)
        if _admissible_center_exchange(a, x, b, c, y) or _admissible_center_exchange(
            pa, px, pb, pc, py
        ):
            single_core += 1
            continue
        delta.append(role)
    assert side_conditions == EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT == 95_040
    # Every side-condition-valid rotated pair orients all forty-eight orders.
    assert admissible == EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT == 95_040
    assert admissible == side_conditions
    assert single_core == EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT == 59_336
    assert len(delta) == EXPECTED_FULL_ORBIT_ROLE_COUNT == 35_704
    assert side_conditions - single_core == len(delta)
    rows = collections.Counter()
    universe: set[tuple[int, tuple[int, ...]]] = set()
    for role in delta:
        for center, required in _union_rows(role):
            universe.add((center, tuple(sorted(required))))
    for _center, required in universe:
        rows[len(required)] += 1
    assert rows[2] == EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT == 645
    assert rows[3] == EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT == 1_935
    assert len(universe) == EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT == 2_580
    assert set(rows) == {2, 3}
    # The installed sub-orbit is the realizable part of this delta.
    assert set(family_roles()) <= set(delta)


def test_realizable_sub_orbit_roles_and_patterns() -> None:
    roles = family_roles()
    assert len(roles) == EXPECTED_ROLE_COUNT == EXPECTED_PATTERN_COUNT == 23_802
    assert len(set(roles)) == len(roles)
    assert roles[0] == (0, 1, 3, 4, 5)
    assert roles[-1] == (11, 10, 9, 8, 5)
    assert _sha256_json(
        [{"a": a, "b": b, "c": c, "x": x, "y": y} for a, b, c, x, y in roles]
    ) == EXPECTED_ROLES_SHA256 == (
        "b222f0715b44feb62903f87bd76f7e41852c83059dee9a26ae8ecfaee4e86115"
    )
    patterns = family_patterns()
    assert len(patterns) == EXPECTED_PATTERN_COUNT
    assert patterns[0] == (
        {"center": 4, "support": [0, 1]},
        {"center": 5, "support": [0, 1, 4]},
        {"center": 3, "support": [1, 4, 5]},
        {"center": 0, "support": [1, 3, 5]},
    )
    assert patterns[-1] == (
        {"center": 8, "support": [11, 10]},
        {"center": 5, "support": [11, 10, 8]},
        {"center": 9, "support": [10, 8, 5]},
        {"center": 11, "support": [10, 9, 5]},
    )
    for pattern in patterns:
        assert len(pattern) == 4
        assert len({row["center"] for row in pattern}) == 4
        assert tuple(sorted(len(row["support"]) for row in pattern)) == (
            EXPECTED_PATTERN_ROW_ARITIES
        ) == (2, 3, 3, 3)
        for row in pattern:
            assert set(row) == {"center", "support"}
            assert row["center"] not in row["support"]
            assert len(set(row["support"])) == len(row["support"])
    normalized = family_bank_module._normalized_patterns()
    assert len(normalized) == len(set(normalized)) == 23_802


def test_requirement_universe_and_realizability() -> None:
    requirements = family_requirements()
    assert len(requirements) == EXPECTED_LOGICAL_REQUIREMENT_COUNT == 2_168
    assert len(requirements) == EXPECTED_DEFINITION_COUNT
    assert list(requirements) == sorted(requirements)
    pairs = [item for item in requirements if len(item[1]) == 2]
    triples = [item for item in requirements if len(item[1]) == 3]
    assert len(pairs) == EXPECTED_PAIR_REQUIREMENT_COUNT == 596
    assert len(triples) == EXPECTED_TRIPLE_REQUIREMENT_COUNT == 1_572
    assert len(pairs) + len(triples) == len(requirements)
    assert _sha256_json(
        [
            {"center": center, "required": list(required)}
            for center, required in requirements
        ]
    ) == EXPECTED_REQUIREMENTS_SHA256 == (
        "8000e67083bd408fd41043cae124c6be087995ebf9b9c28132219cd21886d8be"
    )
    for center, required in requirements:
        assert 0 <= center < 12
        assert center not in required
        assert list(required) == sorted(set(required))
        # Every installed requirement is realizable on the frozen surface.
        assert _row_realizable(center, required)
    # Every pattern row is one of the logical requirements.
    universe = set(requirements)
    for pattern in family_bank_module._normalized_patterns():
        for item in pattern:
            assert item in universe


def test_v25_witness_core_is_installed() -> None:
    assert DOMINANT_CORE == (10, 8, 5, 7, 11)
    roles = family_roles()
    assert DOMINANT_CORE in roles
    assert _pair_side_conditions(DOMINANT_CORE)
    assert _admissible_core_pair(DOMINANT_CORE)
    # Neither core of the mined pair is admitted by the installed single-core
    # rule, so the witness is a genuine widening.
    a, b, c, x, y = DOMINANT_CORE
    pa, pb, pc, px, py = partner_role(DOMINANT_CORE)
    assert not _admissible_center_exchange(a, x, b, c, y)
    assert not _admissible_center_exchange(pa, px, pb, pc, py)
    assert (
        {"center": 7, "support": [10, 8]},
        {"center": 11, "support": [10, 8, 7]},
        {"center": 5, "support": [8, 7, 11]},
        {"center": 10, "support": [8, 5, 11]},
    ) in family_patterns()


def test_family_excludes_every_single_core_admitted_pattern() -> None:
    for role in family_roles():
        a, b, c, x, y = role
        pa, pb, pc, px, py = partner_role(role)
        assert _admissible_core_pair(role)
        assert not _admissible_center_exchange(a, x, b, c, y)
        assert not _admissible_center_exchange(a, y, b, c, x)
        assert not _admissible_center_exchange(pa, px, pb, pc, py)
        assert not _admissible_center_exchange(pa, py, pb, pc, px)


def test_no_installed_pattern_is_dominated_by_the_parent_family() -> None:
    # A core-pair clause is redundant when some installed twenty-first-bank
    # pattern sits row-wise inside it.  None does.
    installed: dict[tuple[int, ...], list[dict[int, frozenset[int]]]] = (
        collections.defaultdict(list)
    )
    for a, b, c, x, y in parent_family_roles():
        rows = {
            x: frozenset((a, b)),
            y: frozenset((a, b)),
            c: frozenset((b, x, y)),
        }
        installed[tuple(sorted(rows))].append(rows)
    def covers(rows, parent_rows) -> bool:
        return all(
            required <= rows[center] for center, required in parent_rows.items()
        )

    dominated = 0
    for role in family_roles():
        rows = {center: frozenset(required) for center, required in _union_rows(role)}
        for triple in itertools.combinations(sorted(rows), 3):
            if any(
                covers(rows, parent_rows)
                for parent_rows in installed.get(triple, ())
            ):
                dominated += 1
                break
    assert dominated == 0


def test_lean_and_python_source_manifest_paths() -> None:
    source_paths = _lean_source_paths(REPO_ROOT)
    assert CERTIFICATE_PATH in source_paths
    assert BRIDGE_PATH in source_paths
    assert source_paths == tuple(sorted(set(source_paths)))
    assert all((REPO_ROOT / path).is_file() for path in source_paths)
    # The generated CNF module is materialized, so it is a root module and its
    # whole import closure is inside the authenticated manifest.
    assert LEAN_ROOT_MODULES == (
        (
            "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
            "ExactTwelveRigid221CorePairAllOrderCommonFiveCertificate"
        ),
        LEAN_CNF_MODULE,
    )
    assert LEAN_CNF_MODULE in LEAN_ROOT_MODULES
    assert CNF_PATH in source_paths
    assert (REPO_ROOT / CNF_PATH).is_file()
    paths = _source_paths(REPO_ROOT)
    assert paths == tuple(sorted(set(paths)))
    for python_path in (
        family_bank_module.COMPILER_SOURCE_PATH,
        family_bank_module.HELPER_SOURCE_PATH,
        family_bank_module.SURFACE_SOURCE_PATH,
        family_bank_module.ORDER_SOURCE_PATH,
    ):
        assert python_path in paths
        assert (REPO_ROOT / python_path).is_file()
    assert set(source_paths) <= set(paths)


def test_production_family_id_guards() -> None:
    assert production_family_id_for_cell(6) == FAMILY_ID
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
        match="no production core-pair all-order common-five family",
    ):
        production_family_id_for_cell(0)
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
        match="cell index must be an integer",
    ):
        production_family_id_for_cell(True)


def test_requirement_schedule_split_against_the_parent_cutoff() -> None:
    # The cutoff is read from the frozen twenty-first bank's final variable
    # count, not transcribed.
    assert PARENT_VARIABLE_CUTOFF == 47_174
    assert EXPECTED_REUSED_REQUIREMENT_COUNT == 2_131
    assert EXPECTED_FRESH_REQUIREMENT_COUNT == 37
    assert (
        EXPECTED_REUSED_REQUIREMENT_COUNT + EXPECTED_FRESH_REQUIREMENT_COUNT
        == EXPECTED_LOGICAL_REQUIREMENT_COUNT
        == EXPECTED_DEFINITION_COUNT
        == 2_168
    )
    # Fresh pattern variables sit strictly above the cutoff and are contiguous.
    assert EXPECTED_FINAL_VARIABLES == (
        PARENT_VARIABLE_CUTOFF + EXPECTED_FRESH_REQUIREMENT_COUNT
    ) == 47_211
    # The delta is the fresh implications followed by one block per role.
    assert EXPECTED_DELTA_CLAUSE_COUNT == 24_182
    assert EXPECTED_DELTA_CLAUSE_COUNT - EXPECTED_PATTERN_COUNT == 380
    assert EXPECTED_FINAL_CLAUSES == (
        EXPECTED_PARENT_CLAUSES + EXPECTED_DELTA_CLAUSE_COUNT
    ) == 703_533
    for digest in (
        EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256,
        EXPECTED_DELTA_SHA256,
        EXPECTED_COMPILED_SHA256,
        EXPECTED_FINAL_DIMACS_SHA256,
    ):
        assert isinstance(digest, str)
        assert len(digest) == 64
        assert digest == digest.lower()
    # Every pin the family needs before it may be built is frozen.
    assert pending_pin_names() == ()
    # The bank manifest hash is deliberately not pinned yet.
    assert family_bank_module.EXPECTED_BANK_SHA256 is None
    assert "EXPECTED_BANK_SHA256" not in REQUIRED_PIN_NAMES


def test_pending_pins_refuse_to_build(monkeypatch) -> None:
    assert set(pending_pin_names()) <= set(REQUIRED_PIN_NAMES)
    for name in REQUIRED_PIN_NAMES:
        assert hasattr(family_bank_module, name)
    # Whatever is frozen today, an unfrozen required pin must refuse to build
    # rather than emit an unauthenticated bank.
    monkeypatch.setattr(family_bank_module, REQUIRED_PIN_NAMES[0], None)
    assert REQUIRED_PIN_NAMES[0] in pending_pin_names()
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
        match="pins are not frozen yet",
    ):
        build_core_pair_all_order_common_five_membership_family_bank(
            REPO_ROOT, None, None, {}, cell_index=6
        )


@pytest.mark.parametrize(
    ("pin", "value", "message"),
    [
        ("EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT", 95_039, "core-pair orbit drifted"),
        ("EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT", 95_039, "core-pair orbit drifted"),
        ("EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT", 59_335, "core-pair orbit drifted"),
        ("EXPECTED_FULL_ORBIT_ROLE_COUNT", 35_703, "delta orbit drifted"),
        ("EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT", 644, "delta row universe drifted"),
        ("EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT", 1_934, "delta row universe drifted"),
        ("EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT", 2_579, "delta row universe drifted"),
        ("EXPECTED_ROLE_COUNT", 23_801, "realizable sub-orbit drifted"),
        ("DOMINANT_CORE", (0, 1, 2, 3, 4), "v25 mined core did not survive"),
    ],
)
def test_orbit_pin_drift_fails_closed(
    monkeypatch, isolated_caches, pin, value, message
) -> None:
    monkeypatch.setattr(family_bank_module, pin, value)
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError, match=message
    ):
        family_bank_module.family_roles()


@pytest.mark.parametrize(
    ("pin", "value", "message"),
    [
        ("EXPECTED_PATTERN_ROW_ARITIES", (2, 2, 3, 3), "pattern row arities drifted"),
        ("EXPECTED_PATTERN_COUNT", 23_801, "not in bijection"),
    ],
)
def test_pattern_pin_drift_fails_closed(
    monkeypatch, isolated_caches, pin, value, message
) -> None:
    monkeypatch.setattr(family_bank_module, pin, value)
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError, match=message
    ):
        family_bank_module._normalized_patterns()


@pytest.mark.parametrize(
    ("pin", "value"),
    [
        ("EXPECTED_LOGICAL_REQUIREMENT_COUNT", 2_167),
        ("EXPECTED_PAIR_REQUIREMENT_COUNT", 595),
        ("EXPECTED_TRIPLE_REQUIREMENT_COUNT", 1_571),
    ],
)
def test_requirement_pin_drift_fails_closed(
    monkeypatch, isolated_caches, pin, value
) -> None:
    monkeypatch.setattr(family_bank_module, pin, value)
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
        match="requirement universe drifted",
    ):
        family_bank_module.family_requirements()


def test_roles_digest_drift_fails_closed(monkeypatch, isolated_caches) -> None:
    monkeypatch.setattr(family_bank_module, "EXPECTED_ROLES_SHA256", "0" * 64)
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
        match="role hash drifted",
    ):
        family_bank_module.family_roles()


def test_requirements_digest_drift_fails_closed(monkeypatch, isolated_caches) -> None:
    monkeypatch.setattr(family_bank_module, "EXPECTED_REQUIREMENTS_SHA256", "0" * 64)
    with pytest.raises(
        Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError,
        match="requirement hash drifted",
    ):
        family_bank_module.family_requirements()
