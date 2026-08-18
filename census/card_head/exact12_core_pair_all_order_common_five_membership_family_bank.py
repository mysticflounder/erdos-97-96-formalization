# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated core-pair all-order common-five membership family.

The installed twenty-first bank (``exact12_center_exchange_all_order_common_
five_membership_family_bank``) blocks a five-point membership pattern when ONE
core placement ``(a, x, b, c, y)`` orients all forty-eight canonical zero-cut
boundary orders, allowing a free ``x <-> y`` exchange per order.  This family
widens the admissible domain to a PAIR of core placements: writing a core as
``(a, b, c, x, y)``, its partner is the fixed role rotation

    partner(a, b, c, x, y) = (x, b, a, c, y)

— the labels in the ``a``, ``x`` and ``c`` slots rotate while ``b`` and ``y``
stay fixed.  The decidable check is ``corePairOrientedAll48``: in each
canonical order one of the four orientations (each core, each up to its own
``x <-> y`` exchange) holds.  Neither core has to orient the whole deck.

The blocking clause is the negation of the UNION of both cores' membership
rows.  The checked certificate consumes eight primitive steps — the four steps
of each core — and merging them by center gives exactly four rows on four
distinct centers:

    x:{a,b}, y:{a,b,x}, c:{b,x,y}, a:{b,c,y}

one pair and three triples, so no new row arity is needed.  Soundness is
proved in
``Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CorePair
AllOrderCommonFiveCertificate`` by
``SourceOrderPositiveNogood.ofCorePairAllOrderCommonFive``: the realized
configuration induces one canonical order; one of the four orientations holds
there; the union rows contain that core's own four rows, so that core's
``ConvexFivePointCore`` contradiction fires.  ``_union_rows`` below merges the
eight steps in the ``CorePairCommonFiveData.check`` field order, and
``_admissible_core_pair`` mirrors ``CorePairCommonFiveData.rolesValid``.

The family installs the core-pair DELTA only: every role whose own core or
whose partner core is already admitted by the installed single-core
center-exchange rule is dropped, because the twenty-first bank and its
ancestors already block those patterns.  No ``x < y`` canonicalization is
applied: the rotation is not symmetric in ``x`` and ``y``, so both
serializations are distinct family members.  The delta orbit is 35,704 roles
over 2,580 distinct rows; the bank installs the realizable sub-orbit —
23,802 roles, one distinct blocking clause each, over 2,168 distinct rows
(596 pair + 1,572 triple) — dropping a role when any of its four rows has no
candidate realization on the frozen source-faithful surface
(``candidate_rows``).  An unrealizable row can never be selected in any model
of the formula, so dropping such patterns loses no blocking strength.
Requirements already defined by ancestor banks reuse their inherited pattern
variables; the remaining requirements are fresh.  The family appends the fresh
implications followed by one four-literal block per realizable role.

Every orbit count here is EMPIRICAL, derived from the frozen twenty-first-bank
primitives (``_positions``, ``_common_five``, ``_side_conditions``,
``_admissible_center_exchange``, ``candidate_rows``, ``_row_realizable``)
rather than recomputed, and pinned so that a drifted primitive fails closed.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
"""

from __future__ import annotations

import copy
import functools
import hashlib
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .exact12_all_order_common_five_membership_family_bank import (
    _lean_import_modules,
    _project_lean_source_path,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    COMPILER_SOURCE_PATH,
    HELPER_SOURCE_PATH,
    ORDER_SOURCE_PATH,
    SURFACE_SOURCE_PATH,
    _admissible_center_exchange,
    _common_five,
    _positions,
    _row_realizable,
    _side_conditions,
    attest_center_exchange_all_order_common_five_membership_family_bank_live_sources,
    candidate_rows,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    EXPECTED_BANK_SHA256 as EXPECTED_PARENT_BANK_SHA256,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    EXPECTED_FINAL_CLAUSES as EXPECTED_PARENT_CLAUSES,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    EXPECTED_FINAL_DIMACS_SHA256 as EXPECTED_PARENT_DIMACS_SHA256,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    EXPECTED_FINAL_VARIABLES as EXPECTED_PARENT_VARIABLES,
)
from .exact12_center_exchange_all_order_common_five_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

BANK_SCHEMA = (
    "p97_rigid221_exact12_core_pair_all_order_common_five_membership_family_bank.v1"
)
FAMILY_ID = "core-pair-all-order-common-five-label-general-abcxy.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_LABEL_GENERAL_CORE_PAIR_ALL_ORDER_COMMON_FIVE_"
    "MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {6: FAMILY_ID}

# The parent identity is READ from the frozen twenty-first-bank module rather
# than transcribed: its final CNF state is this family's initial state, and its
# frozen bank hash is this family's parent bank pin.
PARENT_VARIABLE_CUTOFF = EXPECTED_PARENT_VARIABLES
"""Highest variable index the frozen parent chain can have allocated.

A membership requirement is REUSED when the frozen parent chain already
defined its pattern variable — every such variable is at or below this cutoff —
and FRESH otherwise, in which case its variable is allocated above the cutoff.
Read from
``exact12_center_exchange_all_order_common_five_membership_family_bank.
EXPECTED_FINAL_VARIABLES``.
"""

# --- Orbit pins (EMPIRICAL, measured from the frozen primitives) -----------
# Roles whose own core AND whose rotated partner core pass the side
# conditions.  The partner's side conditions are what force ``a != c``, so the
# four union centers are pairwise distinct exactly on this set.
EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT = 95_040
# Roles the core-pair check admits.  Equal to the side-condition count: every
# side-condition-valid rotated pair orients all forty-eight canonical orders.
# The bank still records the per-role decidable check, so a drifted order deck
# or orientation primitive fails closed here instead of silently widening.
EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT = 95_040
# Admissible roles the installed single-core center-exchange rule already
# covers, through either the core or its partner.
EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT = 59_336
# The full validated delta orbit before the realizability filter.
EXPECTED_FULL_ORBIT_ROLE_COUNT = 35_704
EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT = 2_580
EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT = 645
EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT = 1_935
# The v25 mined core in (a, b, c, x, y) serialization.  Its partner is
# (7, 8, 10, 5, 11); neither core orients the whole canonical deck alone, and
# the pair's union clause is the single clause of this family realized in the
# authenticated v25 survivor cube, so it must survive every filter below.
DOMINANT_CORE = (10, 8, 5, 7, 11)
# The realizable sub-orbit installed by this bank.  Roles and blocking clauses
# are in bijection here: no two realizable roles share a normalized pattern.
EXPECTED_ROLE_COUNT = 23_802
EXPECTED_PATTERN_COUNT = 23_802
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 2_168
EXPECTED_PAIR_REQUIREMENT_COUNT = 596
EXPECTED_TRIPLE_REQUIREMENT_COUNT = 1_572
EXPECTED_DEFINITION_COUNT = 2_168
# Every pattern is one pair row plus three triple rows on four centers.  The
# normalized pattern is center-sorted, so the arities are pinned as a sorted
# multiset rather than in the role order ``x, y, c, a``.
EXPECTED_PATTERN_ROW_ARITIES = (2, 3, 3, 3)
EXPECTED_ROLES_SHA256 = (
    "b222f0715b44feb62903f87bd76f7e41852c83059dee9a26ae8ecfaee4e86115"
)
EXPECTED_REQUIREMENTS_SHA256 = (
    "8000e67083bd408fd41043cae124c6be087995ebf9b9c28132219cd21886d8be"
)

# --- Requirement-schedule pins (EMPIRICAL, measured against the live frozen
# --- parent instance at PARENT_VARIABLE_CUTOFF) ----------------------------
# 2,131 of the 2,168 requirements already carry an ancestor pattern variable
# (all at or below the 47,174 cutoff); the remaining 37 are fresh and take
# 47,175 .. 47,211.
EXPECTED_REUSED_REQUIREMENT_COUNT: int | None = 2_131
EXPECTED_FRESH_REQUIREMENT_COUNT: int | None = 37
# Digest of the requirement-sorted ((center, required), inherited variable)
# bindings for every requirement an ancestor bank already defined.  The frozen
# ancestors carry that table as a literal; at this family's size the literal
# would be thousands of lines, so the bank pins its canonical-JSON digest and
# publishes the table in the compiled payload instead.
EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256: str | None = (
    "c7413f4dc72a471ee663d3f82b419e5db16afd2f2b6ed6fb951690b6ea42cb59"
)

# --- Compiled CNF pins (EMPIRICAL, measured on the live frozen parent) -----
# The delta is 380 fresh implication clauses (one per fresh requirement per
# containing candidate row) followed by one four-literal block per role.
EXPECTED_FINAL_VARIABLES: int | None = 47_211
EXPECTED_FINAL_CLAUSES: int | None = 703_533
EXPECTED_DELTA_CLAUSE_COUNT: int | None = 24_182
EXPECTED_DELTA_SHA256: str | None = (
    "70d03f84375453e46d16ff87218c88d6a9439ff0398ea48d693ebe298523110e"
)
EXPECTED_COMPILED_SHA256: str | None = (
    "0ed9d1979d870dc89ec18dea622ee56434d0fc7d72f4ed61c30238206bec0b0f"
)
EXPECTED_FINAL_DIMACS_SHA256: str | None = (
    "415be05fdedfb008b0a1eb5a5ca5e299ef7564e9287b89333dc4705235916a93"
)

# Pins that must be frozen before the family may be built or installed.  The
# freeze measurement itself runs with ``allow_pending_pins=True``; see the
# module docstring and ``PENDING_PIN_NAMES``.
REQUIRED_PIN_NAMES = (
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_FRESH_REQUIREMENT_COUNT",
    "EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_DELTA_CLAUSE_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_COMPILED_SHA256",
    "EXPECTED_FINAL_DIMACS_SHA256",
)

# The bank hash covers the source manifest: the Lean import closure of
# LEAN_ROOT_MODULES -- the checked certificate, which pulls the core-pair
# bridge and the frozen ancestors, together with the generated
# MembershipFamilyCnf module -- plus the frozen Python compiler, helper,
# surface, and order sources.  2,879 files in all.  Frozen on 2026-08-18 by
# ``scratch/rigid221-sourceheavy-anchor/core-pair/refreeze_bank_sha.py``,
# against the tree carrying the generated CNF module at sha256
# 246c1e9191781b0cdd65d29fe3fcf8e5c62436266654177fa8e271e8f4f54fe2.
#
# The manifest hashes every file of that closure, so a content change to any
# one of them drifts this pin and every pin downstream of it.  The parent
# chain was broken and repaired that way once already (revert 5fe42600).
# Narrowing the manifest to the files a bank actually depends on is the
# durable repair and is not done.
EXPECTED_BANK_SHA256: str | None = (
    "e219ea20abdf35389401b4498da09833d1f4aa145c7e804a4998fd4f1b7061dc"
)

# The frozen Python source paths of the authenticated manifest are reused from
# the parent module rather than restated: COMPILER_SOURCE_PATH,
# HELPER_SOURCE_PATH, SURFACE_SOURCE_PATH and ORDER_SOURCE_PATH are imported
# above and stay byte-identical to the parent's manifest entries.
# The generated CNF module this family emits.  It joined LEAN_ROOT_MODULES
# once it was materialized; ``_lean_source_paths`` fails closed on an
# unreadable repository-local import, so listing it also asserts it exists.
LEAN_CNF_MODULE = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "ExactTwelveRigid221CorePairAllOrderCommonFiveMembershipFamilyCnf"
)
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221CorePairAllOrderCommonFiveCertificate"
    ),
    LEAN_CNF_MODULE,
)

# The repository-local Lean modules that supply a declaration the root
# modules transitively depend on, mined from the Lean kernel by
# ``scripts/mine_bank_lean_dependencies.py`` and frozen here.  This is the
# source set the bank manifest authenticates.
#
# It is deliberately NOT the transitive import closure.  That closure is 2,875
# files for this bank, of which only these 29 carry a declaration the theorems
# use; hashing the other 2,846 made every unrelated commit in the closure break
# this pin and every pin below it, which already cost one repair (5fe42600).
#
# Freezing the set rather than recomputing it is safe because the set is closed
# under change detection: a new dependency can only be introduced by editing a
# declaration that already lies inside the set, and every module in the set is
# hashed, so no edit can add a dependency without breaking the pin first.
# Re-mine with ``--compare`` after any change to a listed module.
LEAN_DEPENDENCY_MODULES = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveCarrierIngress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221AllOrderCommonFiveCertificate",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BoundaryOrderIngress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CanonicalBoundaryOrderBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CenterExchangeBoundaryOrderBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CorePairAllOrderCommonFiveCertificate",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CorePairAllOrderCommonFiveMembershipFamilyCnf",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221CorePairBoundaryOrderBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221Ingress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoreConsumer",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PositiveMembershipCnfBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_01",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverIndexBridge",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SameBoundaryOrderIngress",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderPositiveNogood",
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate",
    "Erdos9796Proof.P97.Census554.ConvexFivePointCore",
    "Erdos9796Proof.P97.Census554.CoverCnf",
    "Erdos9796Proof.P97.Census554.EqualityCore",
    "Erdos9796Proof.P97.Census554.SinzSat",
    "Erdos9796Proof.P97.ConvexCyclicOrder.Basic",
    "Erdos9796Proof.P97.Foundation",
    "Erdos9796Proof.P97.Q3SharedInterior",
    "Erdos9796Proof.P97.SignedAreaOangle",
    "Erdos9796Proof.P97.SurplusCOMPGBankSep",
    "Erdos9796Proof.P97.U2.OneHitMonotone",
    "Erdos9796Proof.P97.U2.SimilarityNormalization",
)


class Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def pending_pin_names() -> tuple[str, ...]:
    """Required pins that are not frozen yet, in declaration order."""

    return tuple(
        name for name in REQUIRED_PIN_NAMES if globals().get(name) is None
    )


def _pin_mismatch(observed: Any, expected: Any) -> bool:
    return expected is not None and observed != expected


def _require_frozen_pins(allow_pending_pins: bool) -> None:
    pending = pending_pin_names()
    if pending and not allow_pending_pins:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family pins are not frozen yet: "
            f"{', '.join(pending)}"
        )


def _lean_source_paths(repo_root: Path) -> tuple[str, ...]:
    """The frozen kernel dependency set, resolved to repository-local paths.

    Fails closed on a module that is not repository-local, on an unreadable
    source file, and on a root module missing from the frozen set.
    """

    root = repo_root.resolve()
    source_paths: set[str] = set()
    for module in LEAN_DEPENDENCY_MODULES:
        relative_path = _project_lean_source_path(module)
        if relative_path is None:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                f"frozen Lean dependency is not repository-local: {module}"
            )
        try:
            (root / relative_path).read_bytes()
        except OSError as exc:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                f"frozen Lean dependency is unreadable: {relative_path}"
            ) from exc
        source_paths.add(relative_path)
    for module in LEAN_ROOT_MODULES:
        if module not in LEAN_DEPENDENCY_MODULES:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                f"root module absent from the frozen dependency set: {module}"
            )
    return tuple(sorted(source_paths))


def _source_paths(repo_root: Path) -> tuple[str, ...]:
    return tuple(
        sorted(
            (
                *_lean_source_paths(repo_root),
                COMPILER_SOURCE_PATH,
                HELPER_SOURCE_PATH,
                SURFACE_SOURCE_PATH,
                ORDER_SOURCE_PATH,
            )
        )
    )


def production_family_id_for_cell(cell_index: int) -> str:
    if type(cell_index) is not int:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            f"no production core-pair all-order common-five family for cell "
            f"{cell_index}"
        ) from exc


def partner_role(
    role: tuple[int, int, int, int, int],
) -> tuple[int, int, int, int, int]:
    """The rotated partner core in ``(a, b, c, x, y)`` serialization.

    Mirrors the pairing the checked certificate's ``right`` field carries for
    this family: the labels in the ``a``, ``x`` and ``c`` slots rotate while
    ``b`` and ``y`` stay fixed.
    """

    a, b, c, x, y = role
    return (x, b, a, c, y)


def _core_steps(
    role: tuple[int, int, int, int, int],
) -> tuple[tuple[int, tuple[int, int]], ...]:
    """One core's four primitive membership steps, in certificate order.

    ``CorePairCommonFiveData.check`` consumes, for each core,
    ``x:{a,b}``, ``y:{a,b}``, ``c:{b,x}``, ``c:{b,y}``.
    """

    a, b, c, x, y = role
    return ((x, (a, b)), (y, (a, b)), (c, (b, x)), (c, (b, y)))


def _union_rows(
    role: tuple[int, int, int, int, int],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    """The union rows of a core and its rotated partner.

    The eight primitive steps of ``CorePairCommonFiveData.check`` — the four
    steps of ``left``, then the four of ``right`` — are merged by center, in
    first-appearance order of centers and of labels.  On the side-condition
    domain this is exactly ``x:{a,b}``, ``y:{a,b,x}``, ``c:{b,x,y}``,
    ``a:{b,c,y}``.
    """

    merged: dict[int, list[int]] = {}
    for center, required in _core_steps(role) + _core_steps(partner_role(role)):
        slot = merged.setdefault(center, [])
        for label in required:
            if label not in slot:
                slot.append(label)
    return tuple((center, tuple(labels)) for center, labels in merged.items())


def _role_side_conditions(role: tuple[int, int, int, int, int]) -> bool:
    """The frozen common-five side conditions in ``(a, b, c, x, y)`` order."""

    a, b, c, x, y = role
    return _side_conditions(a, x, b, c, y)


def _pair_side_conditions(role: tuple[int, int, int, int, int]) -> bool:
    """Mirror of the two ``sideConditions`` conjuncts of ``rolesValid``."""

    return _role_side_conditions(role) and _role_side_conditions(partner_role(role))


def _oriented_all48(role: tuple[int, int, int, int, int]) -> bool:
    """Per-order four-way disjunction mirroring ``corePairOrientedAll48``."""

    a, b, c, x, y = role
    pa, pb, pc, px, py = partner_role(role)
    return all(
        _common_five(position, a, x, b, c, y)
        or _common_five(position, a, y, b, c, x)
        or _common_five(position, pa, px, pb, pc, py)
        or _common_five(position, pa, py, pb, pc, px)
        for position in _positions()
    )


def _admissible_core_pair(role: tuple[int, int, int, int, int]) -> bool:
    """Mirror of ``CorePairCommonFiveData.rolesValid``."""

    if not _pair_side_conditions(role):
        return False
    return _oriented_all48(role)


def _single_core_admitted(role: tuple[int, int, int, int, int]) -> bool:
    """True when the installed single-core rule already admits the pattern."""

    a, b, c, x, y = role
    pa, pb, pc, px, py = partner_role(role)
    return _admissible_center_exchange(a, x, b, c, y) or _admissible_center_exchange(
        pa, px, pb, pc, py
    )


def _role_realizable(role: tuple[int, int, int, int, int]) -> bool:
    return all(
        _row_realizable(center, tuple(sorted(required)))
        for center, required in _union_rows(role)
    )


@functools.cache
def _family_roles() -> tuple[tuple[int, int, int, int, int], ...]:
    """The realizable core-pair delta orbit in ``(a, b, c, x, y)`` order.

    Enumeration is over all twelve labels in every slot with no ``x < y``
    canonicalization: the rotation is not symmetric in ``x`` and ``y``, so both
    serializations carry different union rows and are different family members.
    A role is dropped when the installed single-core center-exchange rule
    already admits its own core or its partner core, and then again when any of
    its four union rows is unrealizable on the frozen candidate surface.
    """

    side_condition_count = 0
    admissible_count = 0
    single_core_count = 0
    full: list[tuple[int, int, int, int, int]] = []
    for a in range(12):
        for b in range(12):
            for c in range(12):
                for x in range(12):
                    for y in range(12):
                        role = (a, b, c, x, y)
                        if not _pair_side_conditions(role):
                            continue
                        side_condition_count += 1
                        if not _oriented_all48(role):
                            continue
                        admissible_count += 1
                        if _single_core_admitted(role):
                            single_core_count += 1
                            continue
                        full.append(role)
    if (
        side_condition_count != EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT
        or admissible_count != EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT
        or single_core_count != EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair orbit drifted: expected "
            f"{EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT} side-condition, "
            f"{EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT} admissible and "
            f"{EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT} single-core roles, "
            f"observed {side_condition_count}, {admissible_count} and "
            f"{single_core_count}"
        )
    if len(full) != EXPECTED_FULL_ORBIT_ROLE_COUNT:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five delta orbit drifted: expected "
            f"{EXPECTED_FULL_ORBIT_ROLE_COUNT} roles, observed {len(full)}"
        )
    full_pair_rows: set[tuple[int, tuple[int, ...]]] = set()
    full_triple_rows: set[tuple[int, tuple[int, ...]]] = set()
    for role in full:
        for center, required in _union_rows(role):
            ordered = tuple(sorted(required))
            if len(ordered) == 2:
                full_pair_rows.add((center, ordered))
            else:
                full_triple_rows.add((center, ordered))
    if (
        len(full_pair_rows) != EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT
        or len(full_triple_rows) != EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT
        or len(full_pair_rows) + len(full_triple_rows)
        != EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five delta row universe drifted"
        )
    roles = tuple(role for role in full if _role_realizable(role))
    if DOMINANT_CORE not in roles:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "v25 mined core did not survive the realizability filter"
        )
    if len(roles) != EXPECTED_ROLE_COUNT:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five realizable sub-orbit drifted: "
            f"expected {EXPECTED_ROLE_COUNT} roles, observed {len(roles)}"
        )
    roles_sha256 = _sha256_json(
        [{"a": a, "b": b, "c": c, "x": x, "y": y} for a, b, c, x, y in roles]
    )
    if roles_sha256 != EXPECTED_ROLES_SHA256:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family role hash drifted: expected "
            f"{EXPECTED_ROLES_SHA256}, observed {roles_sha256}"
        )
    return roles


def family_roles() -> tuple[tuple[int, int, int, int, int], ...]:
    return _family_roles()


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    return tuple(
        tuple(
            {"center": center, "support": list(required)}
            for center, required in _union_rows(role)
        )
        for role in family_roles()
    )


@functools.cache
def _normalized_patterns() -> tuple[tuple[tuple[int, tuple[int, ...]], ...], ...]:
    normalized = tuple(
        normalize_memberships(12, choices) for choices in family_patterns()
    )
    if any(
        tuple(sorted(len(required) for _center, required in pattern))
        != EXPECTED_PATTERN_ROW_ARITIES
        for pattern in normalized
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five pattern row arities drifted"
        )
    if len(set(normalized)) != EXPECTED_PATTERN_COUNT:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five patterns are not in bijection "
            "with the installed roles"
        )
    return normalized


@functools.cache
def _all_requirements() -> tuple[tuple[int, tuple[int, ...]], ...]:
    requirements = tuple(
        sorted({item for pattern in _normalized_patterns() for item in pattern})
    )
    pairs = sum(1 for _center, required in requirements if len(required) == 2)
    triples = sum(1 for _center, required in requirements if len(required) == 3)
    if (
        len(requirements) != EXPECTED_LOGICAL_REQUIREMENT_COUNT
        or pairs != EXPECTED_PAIR_REQUIREMENT_COUNT
        or triples != EXPECTED_TRIPLE_REQUIREMENT_COUNT
        or pairs + triples != len(requirements)
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five requirement universe drifted: "
            f"expected {EXPECTED_LOGICAL_REQUIREMENT_COUNT} requirements "
            f"({EXPECTED_PAIR_REQUIREMENT_COUNT} pair, "
            f"{EXPECTED_TRIPLE_REQUIREMENT_COUNT} triple), observed "
            f"{len(requirements)} ({pairs} pair, {triples} triple)"
        )
    requirements_sha256 = _sha256_json(
        [
            {"center": center, "required": list(required)}
            for center, required in requirements
        ]
    )
    if requirements_sha256 != EXPECTED_REQUIREMENTS_SHA256:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family requirement hash drifted: "
            f"expected {EXPECTED_REQUIREMENTS_SHA256}, observed "
            f"{requirements_sha256}"
        )
    return requirements


def family_requirements() -> tuple[tuple[int, tuple[int, ...]], ...]:
    return _all_requirements()


def _roles_payload() -> list[dict[str, int]]:
    return [
        {"a": a, "b": b, "c": c, "x": x, "y": y} for a, b, c, x, y in family_roles()
    ]


def _requirements_payload() -> list[dict[str, Any]]:
    return [
        {"center": center, "required": list(required)}
        for center, required in family_requirements()
    ]


def _parent_record(
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
) -> dict[str, Any]:
    bank_body = dict(parent_bank)
    bank_sha256 = bank_body.pop("bank_sha256", None)
    dimacs_sha256 = hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()
    if (
        not isinstance(layout, StaticConvexLayout)
        or parent_bank.get("schema") != PARENT_BANK_SCHEMA
        or parent_bank.get("family_id") != PARENT_FAMILY_ID
        or bank_sha256 != EXPECTED_PARENT_BANK_SHA256
        or _sha256_json(bank_body) != bank_sha256
        or instance.cnf.n_variables != EXPECTED_PARENT_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_PARENT_CLAUSES
        or dimacs_sha256 != EXPECTED_PARENT_DIMACS_SHA256
        or not getattr(
            instance,
            "_center_exchange_all_order_common_five_membership_family_bank_"
            "installed",
            False,
        )
        or getattr(
            instance,
            "_core_pair_all_order_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-center-exchange core-pair parent"
        )
    return {
        "schema": PARENT_BANK_SCHEMA,
        "family_id": PARENT_FAMILY_ID,
        "bank_sha256": bank_sha256,
        "n_variables": instance.cnf.n_variables,
        "n_clauses": len(instance.cnf.clauses),
        "dimacs_sha256": dimacs_sha256,
        "layout_manifest_sha256": _sha256_json(layout.manifest()),
    }


def _compile(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    if any(
        tuple(instance.candidates[center]) != candidate_rows(center)
        for center in range(12)
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "instance candidate surface differs from the frozen candidate_rows "
            "derivation"
        )
    normalized = _normalized_patterns()
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = family_requirements()
    variables: dict[tuple[int, tuple[int, ...]], int] = {}
    definitions: list[dict[str, Any]] = []
    for center, required in requirements:
        key = (center, frozenset(required))
        candidate_indices = [
            index
            for index, candidate in enumerate(instance.candidates[center])
            if set(required) <= set(candidate)
        ]
        if not candidate_indices:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "positive membership requirement has no candidate realization"
            )
        inherited_variable = instance.pattern_variables.get(key)
        reused = inherited_variable is not None
        if reused and inherited_variable > PARENT_VARIABLE_CUTOFF:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "inherited membership variable is above the parent cutoff"
            )
        before = len(instance.cnf.clauses)
        variable = instance.pattern_variable(center, required)
        implications = tuple(instance.cnf.clauses[before:])
        candidate_variables = tuple(
            instance.choice_variables[(center, index)] for index in candidate_indices
        )
        expected = tuple(
            (-choice_variable, variable) for choice_variable in candidate_variables
        )
        if (reused and implications) or (not reused and implications != expected):
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "pattern implication compiler drifted"
            )
        if not reused and variable <= PARENT_VARIABLE_CUTOFF:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "fresh membership variable is not above the parent cutoff"
            )
        variables[(center, required)] = variable
        definitions.append(
            {
                "center": center,
                "required": list(required),
                "pattern_variable": variable,
                "reused": reused,
                "candidate_indices": candidate_indices,
                "candidate_variables": list(candidate_variables),
                "implication_clauses": [list(clause) for clause in implications],
                "implication_clauses_sha256": _sha256_json(implications),
            }
        )
    entries: list[dict[str, Any]] = []
    blocks: set[tuple[int, ...]] = set()
    for index, pattern in enumerate(normalized):
        block = tuple(-variables[item] for item in pattern)
        if block in blocks:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "core-pair all-order common-five family contains a duplicate block"
            )
        instance.cnf.add_clause(block)
        blocks.add(block)
        requirements_payload = [
            {"center": center, "required": list(required)}
            for center, required in pattern
        ]
        entries.append(
            {
                "index": index,
                "requirements": requirements_payload,
                "requirements_sha256": _sha256_json(requirements_payload),
                "blocking_clause": list(block),
                "blocking_clause_sha256": _sha256_json(block),
            }
        )
    delta = tuple(instance.cnf.clauses[initial_clauses:])
    reused_bindings = [
        [[definition["center"], definition["required"]], definition["pattern_variable"]]
        for definition in definitions
        if definition["reused"]
    ]
    fresh_bindings = [
        [[definition["center"], definition["required"]], definition["pattern_variable"]]
        for definition in definitions
        if not definition["reused"]
    ]
    compiled = {
        "schema": MEMBERSHIP_CNF_SCHEMA,
        "pattern_keys": [
            [
                {"center": center, "required": list(required)}
                for center, required in pattern
            ]
            for pattern in normalized
        ],
        "pattern_definitions": definitions,
        "entries": entries,
        "initial_n_variables": initial_variables,
        "initial_n_clauses": initial_clauses,
        "final_n_variables": instance.cnf.n_variables,
        "final_n_clauses": len(instance.cnf.clauses),
        "delta_clauses": [list(clause) for clause in delta],
        "delta_sha256": _sha256_json(delta),
        "parent_variable_cutoff": PARENT_VARIABLE_CUTOFF,
        "reused_requirement_count": len(reused_bindings),
        "fresh_requirement_count": len(fresh_bindings),
        "reused_requirement_bindings": reused_bindings,
        "reused_requirement_bindings_sha256": _sha256_json(reused_bindings),
        "fresh_requirement_bindings": fresh_bindings,
        "fresh_requirement_bindings_sha256": _sha256_json(fresh_bindings),
    }
    pair_requirements = sum(
        1 for definition in definitions if len(definition["required"]) == 2
    )
    triple_requirements = sum(
        1 for definition in definitions if len(definition["required"]) == 3
    )
    fresh_variables = tuple(
        definition["pattern_variable"]
        for definition in definitions
        if not definition["reused"]
    )
    expected_fresh_variables = tuple(
        range(
            PARENT_VARIABLE_CUTOFF + 1,
            PARENT_VARIABLE_CUTOFF + 1 + len(fresh_variables),
        )
    )
    if (
        len(compiled["pattern_keys"]) != EXPECTED_PATTERN_COUNT
        or len(definitions) != EXPECTED_DEFINITION_COUNT
        or pair_requirements != EXPECTED_PAIR_REQUIREMENT_COUNT
        or triple_requirements != EXPECTED_TRIPLE_REQUIREMENT_COUNT
        or sorted(fresh_variables) != list(expected_fresh_variables)
        or _pin_mismatch(len(reused_bindings), EXPECTED_REUSED_REQUIREMENT_COUNT)
        or _pin_mismatch(len(fresh_bindings), EXPECTED_FRESH_REQUIREMENT_COUNT)
        or _pin_mismatch(
            compiled["reused_requirement_bindings_sha256"],
            EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256,
        )
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family requirement binding "
            f"drifted: observed {len(definitions)} definitions "
            f"({pair_requirements} pair, {triple_requirements} triple), "
            f"{len(reused_bindings)} reused and {len(fresh_bindings)} fresh "
            f"against cutoff {PARENT_VARIABLE_CUTOFF}"
        )
    return compiled


def _compile_payload(
    instance: SourceFaithfulCoverInstance,
    *,
    allow_pending_pins: bool = False,
) -> dict[str, Any]:
    _require_frozen_pins(allow_pending_pins)
    working = copy.deepcopy(instance)
    compiled = _compile(working)
    final_sha256 = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    if (
        compiled["initial_n_variables"] != EXPECTED_PARENT_VARIABLES
        or compiled["initial_n_clauses"] != EXPECTED_PARENT_CLAUSES
        or _pin_mismatch(compiled["final_n_variables"], EXPECTED_FINAL_VARIABLES)
        or _pin_mismatch(compiled["final_n_clauses"], EXPECTED_FINAL_CLAUSES)
        or _pin_mismatch(len(compiled["delta_clauses"]), EXPECTED_DELTA_CLAUSE_COUNT)
        or _pin_mismatch(compiled["delta_sha256"], EXPECTED_DELTA_SHA256)
        or _pin_mismatch(final_sha256, EXPECTED_FINAL_DIMACS_SHA256)
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "compiled core-pair all-order common-five family counts or hashes "
            f"drifted: observed final variables {compiled['final_n_variables']}, "
            f"final clauses {compiled['final_n_clauses']}, "
            f"delta clauses {len(compiled['delta_clauses'])}, "
            f"delta {compiled['delta_sha256']}, dimacs {final_sha256}"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if _pin_mismatch(compiled["compiled_sha256"], EXPECTED_COMPILED_SHA256):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "compiled core-pair all-order common-five family payload hash "
            f"drifted: expected {EXPECTED_COMPILED_SHA256}, observed "
            f"{compiled['compiled_sha256']}"
        )
    return compiled


def build_core_pair_all_order_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
    allow_pending_pins: bool = False,
) -> dict[str, Any]:
    """Build the authenticated family bank against the frozen parent.

    ``allow_pending_pins`` is the freeze-measurement escape hatch: with it the
    still-unfrozen pins in ``REQUIRED_PIN_NAMES`` are observed and published
    instead of enforced.  Production callers must leave it false.
    """

    family_id = production_family_id_for_cell(cell_index)
    _require_frozen_pins(allow_pending_pins)
    attest_center_exchange_all_order_common_five_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance, allow_pending_pins=allow_pending_pins)
    roles = _roles_payload()
    roles_sha256 = _sha256_json(roles)
    if roles_sha256 != EXPECTED_ROLES_SHA256:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family role hash drifted: expected "
            f"{EXPECTED_ROLES_SHA256}, observed {roles_sha256}"
        )
    requirements = _requirements_payload()
    requirements_sha256 = _sha256_json(requirements)
    if requirements_sha256 != EXPECTED_REQUIREMENTS_SHA256:
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family requirement hash drifted: "
            f"expected {EXPECTED_REQUIREMENTS_SHA256}, observed "
            f"{requirements_sha256}"
        )
    body = {
        "schema": BANK_SCHEMA,
        "family_id": family_id,
        "cell_index": cell_index,
        "semantic_status": SEMANTIC_STATUS,
        "claims": {
            "terminal_unsat": False,
            "lean_terminal_ingress_ready": False,
            "aggregate_placement_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
        "parent_center_exchange_all_order_common_five_bank": parent,
        "center_exchange_all_order_common_five_bank": copy.deepcopy(dict(parent_bank)),
        "orbit": {
            "pair_side_condition_roles": EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT,
            "pair_admissible_roles": EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT,
            "single_core_admitted_roles": EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT,
            "delta_roles": EXPECTED_FULL_ORBIT_ROLE_COUNT,
            "delta_rows": EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT,
            "delta_pair_rows": EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT,
            "delta_triple_rows": EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT,
            "realizable_roles": EXPECTED_ROLE_COUNT,
        },
        "roles": roles,
        "roles_sha256": roles_sha256,
        "patterns": [list(pattern) for pattern in family_patterns()],
        "requirements": requirements,
        "requirements_sha256": requirements_sha256,
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "parent_variable_cutoff": PARENT_VARIABLE_CUTOFF,
        "reused_requirement_count": compiled["reused_requirement_count"],
        "fresh_requirement_count": compiled["fresh_requirement_count"],
        "source_manifest": [
            _source_record(repo_root.resolve(), path)
            for path in _source_paths(repo_root)
        ],
    }
    bank_sha256 = _sha256_json(body)
    if _pin_mismatch(bank_sha256, EXPECTED_BANK_SHA256):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family bank hash drifted: expected "
            f"{EXPECTED_BANK_SHA256}, observed {bank_sha256}"
        )
    return {**body, "bank_sha256": bank_sha256}


def attest_core_pair_all_order_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("center_exchange_all_order_common_five_bank")
    if not isinstance(parent, Mapping):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "embedded center-exchange all-order common-five bank is malformed"
        )
    attest_center_exchange_all_order_common_five_membership_family_bank_live_sources(
        repo_root, parent
    )
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if (
        not isinstance(manifest, list)
        or [record.get("path") for record in manifest if isinstance(record, Mapping)]
        != expected_paths
    ):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "core-pair all-order common-five family source bytes or hashes "
                "drifted"
            )


def validate_core_pair_all_order_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
    allow_pending_pins: bool = False,
) -> None:
    fresh = build_core_pair_all_order_common_five_membership_family_bank(
        repo_root,
        instance,
        layout,
        parent_bank,
        cell_index=cell_index,
        allow_pending_pins=allow_pending_pins,
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family differs from a live "
            "authenticated rebuild"
        )


def install_core_pair_all_order_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
    allow_pending_pins: bool = False,
) -> dict[str, Any]:
    attribute = "_core_pair_all_order_common_five_membership_family_bank_installed"
    if getattr(instance, attribute, False):
        raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
            "core-pair all-order common-five family is already installed"
        )
    bank = build_core_pair_all_order_common_five_membership_family_bank(
        repo_root,
        instance,
        layout,
        parent_bank,
        cell_index=cell_index,
        allow_pending_pins=allow_pending_pins,
    )
    validate_core_pair_all_order_common_five_membership_family_bank(
        repo_root,
        instance,
        layout,
        parent_bank,
        bank,
        cell_index=cell_index,
        allow_pending_pins=allow_pending_pins,
    )
    initial_n_variables = instance.cnf.n_variables
    initial_n_clauses = len(instance.cnf.clauses)
    initial_pattern_variables = dict(instance.pattern_variables)
    try:
        installed = _compile(instance)
        expected = copy.deepcopy(bank["compiled"])
        expected.pop("compiled_sha256")
        expected.pop("final_dimacs_sha256")
        if installed != expected:
            raise Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError(
                "installed core-pair all-order common-five family differs from "
                "its authenticated bank"
            )
    except Exception:
        instance.cnf.n_variables = initial_n_variables
        del instance.cnf.clauses[initial_n_clauses:]
        instance.pattern_variables.clear()
        instance.pattern_variables.update(initial_pattern_variables)
        raise
    setattr(instance, attribute, True)
    return bank


__all__ = [
    "BANK_SCHEMA",
    "DOMINANT_CORE",
    "EXPECTED_BANK_SHA256",
    "EXPECTED_COMPILED_SHA256",
    "EXPECTED_DEFINITION_COUNT",
    "EXPECTED_DELTA_CLAUSE_COUNT",
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_FRESH_REQUIREMENT_COUNT",
    "EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT",
    "EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT",
    "EXPECTED_FULL_ORBIT_ROLE_COUNT",
    "EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT",
    "EXPECTED_LOGICAL_REQUIREMENT_COUNT",
    "EXPECTED_PAIR_ADMISSIBLE_ROLE_COUNT",
    "EXPECTED_PAIR_REQUIREMENT_COUNT",
    "EXPECTED_PAIR_SIDE_CONDITION_ROLE_COUNT",
    "EXPECTED_PARENT_BANK_SHA256",
    "EXPECTED_PARENT_CLAUSES",
    "EXPECTED_PARENT_DIMACS_SHA256",
    "EXPECTED_PARENT_VARIABLES",
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_PATTERN_ROW_ARITIES",
    "EXPECTED_REQUIREMENTS_SHA256",
    "EXPECTED_REUSED_REQUIREMENT_BINDINGS_SHA256",
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_ROLES_SHA256",
    "EXPECTED_ROLE_COUNT",
    "EXPECTED_SINGLE_CORE_ADMITTED_ROLE_COUNT",
    "EXPECTED_TRIPLE_REQUIREMENT_COUNT",
    "FAMILY_ID",
    "LEAN_CNF_MODULE",
    "LEAN_ROOT_MODULES",
    "PARENT_VARIABLE_CUTOFF",
    "REQUIRED_PIN_NAMES",
    "Exact12CorePairAllOrderCommonFiveMembershipFamilyBankError",
    "attest_core_pair_all_order_common_five_membership_family_bank_live_sources",
    "build_core_pair_all_order_common_five_membership_family_bank",
    "candidate_rows",
    "family_patterns",
    "family_requirements",
    "family_roles",
    "install_core_pair_all_order_common_five_membership_family_bank",
    "partner_role",
    "pending_pin_names",
    "production_family_id_for_cell",
    "validate_core_pair_all_order_common_five_membership_family_bank",
]
