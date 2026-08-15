# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated label-general all-order common-five membership family.

For every role assignment ``a, b, c, x, y`` over all twelve labels that
satisfies the validated orbit side conditions ``a != b``, ``x != y``,
``x not in {a, b}``, ``y not in {a, b}``, ``c not in {b, x, y}`` and whose
five-point orientation ``(a, x, b, c, y)`` holds in all forty-eight
canonical zero-cut boundary orders, the checked source producer refutes the
positive rows

    x:{a,b}, y:{a,b}, c:{b,x,y}.

One canonical admissible assignment is kept per unordered ``{x, y}``
pattern.  The roles enumeration mirrors ``rolesValid`` in the checked
certificate and reuses ``source_boundary_orders()`` as the single 48-order
source of truth.  The full validated orbit is 15,588 patterns over 2,585
distinct rows (641 pair + 1,944 triple) — EMPIRICAL, validated against the
independent crosscheck enumeration.  The bank installs the realizable
sub-orbit for this instance family: a role is dropped when any of its three
rows has no candidate realization on the frozen source-faithful surface
(``candidate_rows``).  An unrealizable row can never be selected in any
model of the formula, so dropping such patterns loses no blocking strength.
Requirements already defined by ancestor banks reuse their inherited
pattern variables; the remaining requirements are fresh.  The family
appends the fresh implications followed by one three-literal block per
realizable role.

This is not terminal UNSAT, aggregate coverage, a universal lift, or live
closure.
"""

from __future__ import annotations

import copy
import functools
import hashlib
import itertools
from collections.abc import Mapping
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_next_row_static_convex import StaticConvexLayout
from .exact12_positive_membership_cnf import SCHEMA as MEMBERSHIP_CNF_SCHEMA
from .exact12_positive_membership_cnf import normalize_memberships
from .exact12_positive_membership_source_order_bank import (
    _canonical_json_bytes,
    _sha256_json,
    _source_record,
)
from .exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    BANK_SCHEMA as PARENT_BANK_SCHEMA,
)
from .exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    FAMILY_ID as PARENT_FAMILY_ID,
)
from .exact12_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank import (
    _lean_import_modules,
    _project_lean_source_path,
    attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources,
)
from .exact12_v14_ordered_coverage import source_boundary_orders
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
    source_faithful_candidate_classes,
)

BANK_SCHEMA = "p97_rigid221_exact12_all_order_common_five_membership_family_bank.v1"
FAMILY_ID = "all-order-common-five-label-general-abcxy.v1"
SEMANTIC_STATUS = (
    "FINITE_SOURCE_PROVED_LABEL_GENERAL_ALL_ORDER_COMMON_FIVE_MEMBERSHIP_FAMILY"
)
PRODUCTION_FAMILY_ID_BY_CELL = {6: FAMILY_ID}

EXPECTED_PARENT_VARIABLES = 45_489
EXPECTED_PARENT_CLAUSES = 646_103
EXPECTED_PARENT_DIMACS_SHA256 = (
    "dc63ac918ed05c66cb9207f05219f66b2ad1df0310537bad1c3028abe980c300"
)
EXPECTED_PARENT_BANK_SHA256 = (
    "fdc0308a147dcfd0b1b99da000ec1b32e60010fd34f192c86f3d794f2f56a348"
)
EXPECTED_FINAL_VARIABLES = 47_136
EXPECTED_FINAL_CLAUSES = 676_147
EXPECTED_FINAL_DIMACS_SHA256 = (
    "f6109195cea858ae0e0a179a9ccd4118118bb3e786d1169e40a94e399435166b"
)
EXPECTED_DELTA_SHA256 = (
    "df88eb0c2a5eed985c79f1173e7b97aad7b5de1a47354719733787ca4717255b"
)
EXPECTED_COMPILED_SHA256 = (
    "54c666518e5a547af921bb5c611e82469486e4a4dd779146453a4f5e2f61a058"
)
# The bank hash covers the source manifest, so it is refrozen in the O5
# step after the generated MembershipFamilyCnf module joins
# LEAN_ROOT_MODULES.
EXPECTED_BANK_SHA256 = (
    "e7f5d680b155d5d34379b5f0d7c1d77eee6166417fef7a6cc096426c4ec34d33"
)
EXPECTED_ROLES_SHA256 = (
    "7c5d4985772d96146f08d93061c6a661e1b70b6e21ae9e70261c7c555d8dd9b6"
)
# The full validated orbit (EMPIRICAL, crosscheck-validated) before the
# realizability filter.
EXPECTED_FULL_ORBIT_ROLE_COUNT = 15_588
EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT = 2_585
EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT = 641
EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT = 1_944
# The v23 dominant mined core in (a, b, c, x, y) serialization.  It came
# from an actual model, so it must survive the realizability filter.
DOMINANT_CORE = (1, 7, 6, 9, 11)
# The realizable sub-orbit installed by this bank.
EXPECTED_ROLE_COUNT = 11_052
EXPECTED_PATTERN_COUNT = 11_052
EXPECTED_LOGICAL_REQUIREMENT_COUNT = 2_230
EXPECTED_PAIR_REQUIREMENT_COUNT = 603
EXPECTED_TRIPLE_REQUIREMENT_COUNT = 1_627
EXPECTED_DEFINITION_COUNT = 2_230
EXPECTED_REUSED_REQUIREMENT_COUNT = 583
EXPECTED_FRESH_REQUIREMENT_COUNT = 1_647
# Requirement-sorted ((center, required), inherited variable) bindings for
# every requirement already defined by an ancestor bank.
EXPECTED_REUSED_REQUIREMENT_BINDINGS: tuple[
    tuple[tuple[int, tuple[int, ...]], int], ...
] = (
    ((0, (1, 2)), 45225),
    ((0, (1, 3)), 44926),
    ((0, (1, 4)), 44927),
    ((0, (1, 5)), 44928),
    ((0, (2, 3)), 44903),
    ((0, (2, 4)), 44904),
    ((0, (2, 5)), 44905),
    ((0, (2, 10)), 45338),
    ((0, (2, 11)), 45339),
    ((0, (3, 6)), 45097),
    ((0, (3, 6, 10)), 45011),
    ((0, (3, 6, 11)), 45012),
    ((0, (3, 7)), 45098),
    ((0, (3, 7, 10)), 45013),
    ((0, (3, 7, 11)), 45014),
    ((0, (3, 8)), 45099),
    ((0, (3, 8, 10)), 45015),
    ((0, (3, 8, 11)), 45016),
    ((0, (3, 9)), 45100),
    ((0, (3, 9, 10)), 45017),
    ((0, (3, 9, 11)), 45018),
    ((0, (3, 10)), 45248),
    ((0, (3, 11)), 45249),
    ((0, (4, 6)), 45101),
    ((0, (4, 6, 10)), 45019),
    ((0, (4, 6, 11)), 45020),
    ((0, (4, 7)), 45102),
    ((0, (4, 7, 10)), 45021),
    ((0, (4, 7, 11)), 45022),
    ((0, (4, 8)), 45103),
    ((0, (4, 8, 10)), 45023),
    ((0, (4, 8, 11)), 45024),
    ((0, (4, 9)), 45104),
    ((0, (4, 9, 10)), 45025),
    ((0, (4, 9, 11)), 45026),
    ((0, (4, 10)), 45250),
    ((0, (4, 11)), 45251),
    ((0, (5, 6)), 45105),
    ((0, (5, 6, 10)), 45027),
    ((0, (5, 6, 11)), 45028),
    ((0, (5, 7)), 45106),
    ((0, (5, 7, 10)), 45029),
    ((0, (5, 7, 11)), 45030),
    ((0, (5, 8)), 45107),
    ((0, (5, 8, 10)), 45031),
    ((0, (5, 8, 11)), 45032),
    ((0, (5, 9)), 45108),
    ((0, (5, 9, 10)), 45033),
    ((0, (5, 9, 11)), 45034),
    ((0, (5, 10)), 45252),
    ((0, (5, 11)), 45253),
    ((1, (0, 3)), 45055),
    ((1, (0, 3, 6)), 45078),
    ((1, (0, 3, 7)), 45079),
    ((1, (0, 3, 8)), 45080),
    ((1, (0, 3, 9)), 45081),
    ((1, (0, 4)), 45056),
    ((1, (0, 4, 6)), 45082),
    ((1, (0, 4, 7)), 45083),
    ((1, (0, 4, 8)), 45084),
    ((1, (0, 4, 9)), 45085),
    ((1, (0, 5)), 45057),
    ((1, (0, 5, 6)), 45086),
    ((1, (0, 5, 7)), 45087),
    ((1, (0, 5, 8)), 45088),
    ((1, (0, 5, 9)), 45089),
    ((1, (0, 6)), 44876),
    ((1, (0, 7)), 44877),
    ((1, (0, 8)), 44878),
    ((1, (0, 9)), 44879),
    ((1, (3, 6)), 45109),
    ((1, (3, 7)), 45110),
    ((1, (3, 8)), 45111),
    ((1, (3, 9)), 45112),
    ((1, (4, 6)), 45113),
    ((1, (4, 7)), 45114),
    ((1, (4, 8)), 45115),
    ((1, (4, 9)), 45116),
    ((1, (5, 6)), 45117),
    ((1, (5, 7)), 45118),
    ((1, (5, 8)), 45119),
    ((1, (5, 9)), 45120),
    ((2, (3, 6, 10)), 45308),
    ((2, (3, 6, 11)), 45309),
    ((2, (3, 7, 10)), 45310),
    ((2, (3, 7, 11)), 45311),
    ((2, (3, 8, 10)), 45312),
    ((2, (3, 8, 11)), 45313),
    ((2, (3, 9, 10)), 45314),
    ((2, (3, 9, 11)), 45315),
    ((2, (3, 10)), 45340),
    ((2, (3, 11)), 45341),
    ((2, (4, 6, 10)), 45316),
    ((2, (4, 6, 11)), 45317),
    ((2, (4, 7, 10)), 45318),
    ((2, (4, 7, 11)), 45319),
    ((2, (4, 8, 10)), 45320),
    ((2, (4, 8, 11)), 45321),
    ((2, (4, 9, 10)), 45322),
    ((2, (4, 9, 11)), 45323),
    ((2, (4, 10)), 45342),
    ((2, (4, 11)), 45343),
    ((2, (5, 6, 10)), 45324),
    ((2, (5, 6, 11)), 45325),
    ((2, (5, 7, 10)), 45326),
    ((2, (5, 7, 11)), 45327),
    ((2, (5, 8, 10)), 45328),
    ((2, (5, 8, 11)), 45329),
    ((2, (5, 9, 10)), 45330),
    ((2, (5, 9, 11)), 45331),
    ((2, (5, 10)), 45344),
    ((2, (5, 11)), 45345),
    ((2, (6, 10, 11)), 45163),
    ((2, (7, 10, 11)), 45164),
    ((2, (8, 10, 11)), 45165),
    ((2, (9, 10, 11)), 45166),
    ((3, (0, 1, 4)), 44880),
    ((3, (0, 1, 5)), 44881),
    ((3, (0, 2)), 45090),
    ((3, (0, 2, 6)), 45226),
    ((3, (0, 2, 7)), 45227),
    ((3, (0, 2, 8)), 45228),
    ((3, (0, 2, 9)), 45229),
    ((3, (0, 4)), 45242),
    ((3, (0, 5)), 45243),
    ((3, (0, 6)), 44882),
    ((3, (0, 7)), 44883),
    ((3, (0, 8)), 44884),
    ((3, (0, 9)), 44885),
    ((3, (0, 10)), 45332),
    ((3, (0, 11)), 45333),
    ((3, (1, 6)), 45035),
    ((3, (1, 7)), 45036),
    ((3, (1, 8)), 45037),
    ((3, (1, 9)), 45038),
    ((3, (2, 7)), 44965),
    ((3, (2, 8)), 44966),
    ((3, (6, 10)), 45370),
    ((3, (6, 11)), 45371),
    ((3, (7, 10)), 45372),
    ((3, (7, 11)), 45373),
    ((3, (8, 10)), 45374),
    ((3, (8, 11)), 45375),
    ((3, (9, 10)), 45376),
    ((3, (9, 11)), 45377),
    ((4, (0, 1, 3)), 44886),
    ((4, (0, 1, 5)), 44887),
    ((4, (0, 2)), 45091),
    ((4, (0, 2, 6)), 45230),
    ((4, (0, 2, 7)), 45231),
    ((4, (0, 2, 8)), 45232),
    ((4, (0, 2, 9)), 45233),
    ((4, (0, 3)), 45244),
    ((4, (0, 5)), 45245),
    ((4, (0, 6)), 44888),
    ((4, (0, 7)), 44889),
    ((4, (0, 8)), 44890),
    ((4, (0, 9)), 44891),
    ((4, (0, 10)), 45334),
    ((4, (0, 11)), 45335),
    ((4, (1, 6)), 45039),
    ((4, (1, 7)), 45040),
    ((4, (1, 8)), 45041),
    ((4, (1, 9)), 45042),
    ((4, (2, 7)), 44967),
    ((4, (2, 8)), 44968),
    ((4, (6, 10)), 45378),
    ((4, (6, 11)), 45379),
    ((4, (7, 10)), 45380),
    ((4, (7, 11)), 45381),
    ((4, (8, 10)), 45382),
    ((4, (8, 11)), 45383),
    ((4, (9, 10)), 45384),
    ((4, (9, 11)), 45385),
    ((5, (0, 1, 3)), 44892),
    ((5, (0, 1, 4)), 44893),
    ((5, (0, 2)), 45092),
    ((5, (0, 2, 6)), 45234),
    ((5, (0, 2, 7)), 45235),
    ((5, (0, 2, 8)), 45236),
    ((5, (0, 2, 9)), 45237),
    ((5, (0, 3)), 45246),
    ((5, (0, 4)), 45247),
    ((5, (0, 6)), 44894),
    ((5, (0, 7)), 44895),
    ((5, (0, 8)), 44896),
    ((5, (0, 9)), 44897),
    ((5, (0, 10)), 45336),
    ((5, (0, 11)), 45337),
    ((5, (1, 6)), 45043),
    ((5, (1, 7)), 45044),
    ((5, (1, 8)), 45045),
    ((5, (1, 9)), 45046),
    ((5, (2, 7)), 44969),
    ((5, (2, 8)), 44970),
    ((5, (6, 10)), 45386),
    ((5, (6, 11)), 45387),
    ((5, (7, 10)), 45388),
    ((5, (7, 11)), 45389),
    ((5, (8, 10)), 45390),
    ((5, (8, 11)), 45391),
    ((5, (9, 10)), 45392),
    ((5, (9, 11)), 45393),
    ((6, (0, 2)), 45093),
    ((6, (0, 2, 3)), 45346),
    ((6, (0, 2, 4)), 45347),
    ((6, (0, 2, 5)), 45348),
    ((6, (0, 3)), 45058),
    ((6, (0, 3, 10)), 45278),
    ((6, (0, 3, 11)), 45279),
    ((6, (0, 4)), 45059),
    ((6, (0, 4, 10)), 45280),
    ((6, (0, 4, 11)), 45281),
    ((6, (0, 5)), 45060),
    ((6, (0, 5, 10)), 45282),
    ((6, (0, 5, 11)), 45283),
    ((6, (0, 10)), 45167),
    ((6, (0, 11)), 45168),
    ((6, (1, 2)), 45238),
    ((6, (1, 3)), 44929),
    ((6, (1, 4)), 44930),
    ((6, (1, 5)), 44931),
    ((6, (2, 3)), 44906),
    ((6, (2, 4)), 44907),
    ((6, (2, 5)), 44908),
    ((6, (2, 7)), 44971),
    ((6, (2, 8)), 44972),
    ((6, (3, 7)), 45127),
    ((6, (3, 7, 8)), 44973),
    ((6, (3, 7, 9)), 44974),
    ((6, (3, 7, 10)), 45394),
    ((6, (3, 7, 11)), 45395),
    ((6, (3, 8)), 45128),
    ((6, (3, 8, 9)), 44975),
    ((6, (3, 8, 10)), 45396),
    ((6, (3, 8, 11)), 45397),
    ((6, (3, 9)), 45001),
    ((6, (3, 9, 10)), 45398),
    ((6, (3, 9, 11)), 45399),
    ((6, (3, 10)), 45254),
    ((6, (3, 10, 11)), 45358),
    ((6, (3, 11)), 45255),
    ((6, (4, 7)), 45129),
    ((6, (4, 7, 8)), 44976),
    ((6, (4, 7, 9)), 44977),
    ((6, (4, 7, 10)), 45400),
    ((6, (4, 7, 11)), 45401),
    ((6, (4, 8)), 45130),
    ((6, (4, 8, 9)), 44978),
    ((6, (4, 8, 10)), 45402),
    ((6, (4, 8, 11)), 45403),
    ((6, (4, 9)), 45002),
    ((6, (4, 9, 10)), 45404),
    ((6, (4, 9, 11)), 45405),
    ((6, (4, 10)), 45256),
    ((6, (4, 10, 11)), 45359),
    ((6, (4, 11)), 45257),
    ((6, (5, 7)), 45131),
    ((6, (5, 7, 8)), 44979),
    ((6, (5, 7, 9)), 44980),
    ((6, (5, 7, 10)), 45406),
    ((6, (5, 7, 11)), 45407),
    ((6, (5, 8)), 45132),
    ((6, (5, 8, 9)), 44981),
    ((6, (5, 8, 10)), 45408),
    ((6, (5, 8, 11)), 45409),
    ((6, (5, 9)), 45003),
    ((6, (5, 9, 10)), 45410),
    ((6, (5, 9, 11)), 45411),
    ((6, (5, 10)), 45258),
    ((6, (5, 10, 11)), 45360),
    ((6, (5, 11)), 45259),
    ((6, (7, 8, 10)), 45412),
    ((6, (7, 8, 11)), 45413),
    ((6, (7, 9, 10)), 45414),
    ((6, (7, 9, 11)), 45415),
    ((6, (8, 9, 10)), 45416),
    ((6, (8, 9, 11)), 45417),
    ((7, (0, 2)), 45094),
    ((7, (0, 2, 3)), 45349),
    ((7, (0, 2, 4)), 45350),
    ((7, (0, 2, 5)), 45351),
    ((7, (0, 3)), 45061),
    ((7, (0, 3, 10)), 45284),
    ((7, (0, 3, 11)), 45285),
    ((7, (0, 4)), 45062),
    ((7, (0, 4, 10)), 45286),
    ((7, (0, 4, 11)), 45287),
    ((7, (0, 5)), 45063),
    ((7, (0, 5, 10)), 45288),
    ((7, (0, 5, 11)), 45289),
    ((7, (0, 10)), 45169),
    ((7, (0, 11)), 45170),
    ((7, (1, 2)), 45239),
    ((7, (1, 3)), 44932),
    ((7, (1, 4)), 44933),
    ((7, (1, 5)), 44934),
    ((7, (2, 3)), 44909),
    ((7, (2, 4)), 44910),
    ((7, (2, 5)), 44911),
    ((7, (2, 8)), 44982),
    ((7, (3, 6)), 45133),
    ((7, (3, 6, 8)), 45004),
    ((7, (3, 6, 10)), 45418),
    ((7, (3, 6, 11)), 45419),
    ((7, (3, 8)), 45134),
    ((7, (3, 8, 9)), 44983),
    ((7, (3, 8, 10)), 45420),
    ((7, (3, 8, 11)), 45421),
    ((7, (3, 9)), 45135),
    ((7, (3, 9, 10)), 45422),
    ((7, (3, 9, 11)), 45423),
    ((7, (3, 10)), 45260),
    ((7, (3, 10, 11)), 45361),
    ((7, (3, 11)), 45261),
    ((7, (4, 6)), 45136),
    ((7, (4, 6, 8)), 45005),
    ((7, (4, 6, 10)), 45424),
    ((7, (4, 6, 11)), 45425),
    ((7, (4, 8)), 45137),
    ((7, (4, 8, 9)), 44984),
    ((7, (4, 8, 10)), 45426),
    ((7, (4, 8, 11)), 45427),
    ((7, (4, 9)), 45138),
    ((7, (4, 9, 10)), 45428),
    ((7, (4, 9, 11)), 45429),
    ((7, (4, 10)), 45262),
    ((7, (4, 10, 11)), 45362),
    ((7, (4, 11)), 45263),
    ((7, (5, 6)), 45139),
    ((7, (5, 6, 8)), 45006),
    ((7, (5, 6, 10)), 45430),
    ((7, (5, 6, 11)), 45431),
    ((7, (5, 8)), 45140),
    ((7, (5, 8, 9)), 44985),
    ((7, (5, 8, 10)), 45432),
    ((7, (5, 8, 11)), 45433),
    ((7, (5, 9)), 45141),
    ((7, (5, 9, 10)), 45434),
    ((7, (5, 9, 11)), 45435),
    ((7, (5, 10)), 45264),
    ((7, (5, 10, 11)), 45363),
    ((7, (5, 11)), 45265),
    ((7, (6, 8, 10)), 45436),
    ((7, (6, 8, 11)), 45437),
    ((7, (6, 9, 10)), 45438),
    ((7, (6, 9, 11)), 45439),
    ((7, (8, 9, 10)), 45440),
    ((7, (8, 9, 11)), 45441),
    ((8, (0, 2)), 45095),
    ((8, (0, 2, 3)), 45352),
    ((8, (0, 2, 4)), 45353),
    ((8, (0, 2, 5)), 45354),
    ((8, (0, 3)), 45064),
    ((8, (0, 3, 10)), 45290),
    ((8, (0, 3, 11)), 45291),
    ((8, (0, 4)), 45065),
    ((8, (0, 4, 10)), 45292),
    ((8, (0, 4, 11)), 45293),
    ((8, (0, 5)), 45066),
    ((8, (0, 5, 10)), 45294),
    ((8, (0, 5, 11)), 45295),
    ((8, (0, 10)), 45171),
    ((8, (0, 11)), 45172),
    ((8, (1, 2)), 45240),
    ((8, (1, 3)), 44935),
    ((8, (1, 4)), 44936),
    ((8, (1, 5)), 44937),
    ((8, (2, 3)), 44912),
    ((8, (2, 4)), 44913),
    ((8, (2, 5)), 44914),
    ((8, (2, 7)), 44986),
    ((8, (3, 6)), 45142),
    ((8, (3, 6, 7)), 44987),
    ((8, (3, 6, 9)), 45007),
    ((8, (3, 6, 10)), 45442),
    ((8, (3, 6, 11)), 45443),
    ((8, (3, 7)), 45143),
    ((8, (3, 7, 9)), 45144),
    ((8, (3, 7, 10)), 45444),
    ((8, (3, 7, 11)), 45445),
    ((8, (3, 9)), 45145),
    ((8, (3, 9, 10)), 45446),
    ((8, (3, 9, 11)), 45447),
    ((8, (3, 10)), 45266),
    ((8, (3, 10, 11)), 45364),
    ((8, (3, 11)), 45267),
    ((8, (4, 6)), 45146),
    ((8, (4, 6, 7)), 44988),
    ((8, (4, 6, 9)), 45008),
    ((8, (4, 6, 10)), 45448),
    ((8, (4, 6, 11)), 45449),
    ((8, (4, 7)), 45147),
    ((8, (4, 7, 9)), 45148),
    ((8, (4, 7, 10)), 45450),
    ((8, (4, 7, 11)), 45451),
    ((8, (4, 9)), 45149),
    ((8, (4, 9, 10)), 45452),
    ((8, (4, 9, 11)), 45453),
    ((8, (4, 10)), 45268),
    ((8, (4, 10, 11)), 45365),
    ((8, (4, 11)), 45269),
    ((8, (5, 6)), 45150),
    ((8, (5, 6, 7)), 44989),
    ((8, (5, 6, 9)), 45009),
    ((8, (5, 6, 10)), 45454),
    ((8, (5, 6, 11)), 45455),
    ((8, (5, 7)), 45151),
    ((8, (5, 7, 9)), 45152),
    ((8, (5, 7, 10)), 45456),
    ((8, (5, 7, 11)), 45457),
    ((8, (5, 9)), 45153),
    ((8, (5, 9, 10)), 45458),
    ((8, (5, 9, 11)), 45459),
    ((8, (5, 10)), 45270),
    ((8, (5, 10, 11)), 45366),
    ((8, (5, 11)), 45271),
    ((8, (6, 7, 10)), 45460),
    ((8, (6, 7, 11)), 45461),
    ((8, (6, 9, 10)), 45462),
    ((8, (6, 9, 11)), 45463),
    ((8, (7, 9, 10)), 45464),
    ((8, (7, 9, 11)), 45465),
    ((9, (0, 2)), 45096),
    ((9, (0, 2, 3)), 45355),
    ((9, (0, 2, 4)), 45356),
    ((9, (0, 2, 5)), 45357),
    ((9, (0, 3)), 45067),
    ((9, (0, 3, 10)), 45296),
    ((9, (0, 3, 11)), 45297),
    ((9, (0, 4)), 45068),
    ((9, (0, 4, 10)), 45298),
    ((9, (0, 4, 11)), 45299),
    ((9, (0, 5)), 45069),
    ((9, (0, 5, 10)), 45300),
    ((9, (0, 5, 11)), 45301),
    ((9, (0, 10)), 45173),
    ((9, (0, 11)), 45174),
    ((9, (1, 2)), 45241),
    ((9, (1, 3)), 44938),
    ((9, (1, 4)), 44939),
    ((9, (1, 5)), 44940),
    ((9, (2, 3)), 44915),
    ((9, (2, 4)), 44916),
    ((9, (2, 5)), 44917),
    ((9, (2, 7)), 44990),
    ((9, (2, 8)), 44991),
    ((9, (3, 6)), 45154),
    ((9, (3, 6, 7)), 44992),
    ((9, (3, 6, 8)), 44993),
    ((9, (3, 6, 10)), 45466),
    ((9, (3, 6, 11)), 45467),
    ((9, (3, 7)), 45155),
    ((9, (3, 7, 8)), 44994),
    ((9, (3, 7, 10)), 45468),
    ((9, (3, 7, 11)), 45469),
    ((9, (3, 8)), 45156),
    ((9, (3, 8, 10)), 45470),
    ((9, (3, 8, 11)), 45471),
    ((9, (3, 10)), 45272),
    ((9, (3, 10, 11)), 45367),
    ((9, (3, 11)), 45273),
    ((9, (4, 6)), 45157),
    ((9, (4, 6, 7)), 44995),
    ((9, (4, 6, 8)), 44996),
    ((9, (4, 6, 10)), 45472),
    ((9, (4, 6, 11)), 45473),
    ((9, (4, 7)), 45158),
    ((9, (4, 7, 8)), 44997),
    ((9, (4, 7, 10)), 45474),
    ((9, (4, 7, 11)), 45475),
    ((9, (4, 8)), 45159),
    ((9, (4, 8, 10)), 45476),
    ((9, (4, 8, 11)), 45477),
    ((9, (4, 10)), 45274),
    ((9, (4, 10, 11)), 45368),
    ((9, (4, 11)), 45275),
    ((9, (5, 6)), 45160),
    ((9, (5, 6, 7)), 44998),
    ((9, (5, 6, 8)), 44999),
    ((9, (5, 6, 10)), 45478),
    ((9, (5, 6, 11)), 45479),
    ((9, (5, 7)), 45161),
    ((9, (5, 7, 8)), 45000),
    ((9, (5, 7, 10)), 45480),
    ((9, (5, 7, 11)), 45481),
    ((9, (5, 8)), 45162),
    ((9, (5, 8, 10)), 45482),
    ((9, (5, 8, 11)), 45483),
    ((9, (5, 10)), 45276),
    ((9, (5, 10, 11)), 45369),
    ((9, (5, 11)), 45277),
    ((9, (6, 7)), 45010),
    ((9, (6, 7, 10)), 45484),
    ((9, (6, 7, 11)), 45485),
    ((9, (6, 8, 10)), 45486),
    ((9, (6, 8, 11)), 45487),
    ((9, (7, 8, 10)), 45488),
    ((9, (7, 8, 11)), 45489),
    ((10, (0, 1, 3)), 45121),
    ((10, (0, 1, 4)), 45122),
    ((10, (0, 1, 5)), 45123),
    ((10, (0, 1, 6)), 45070),
    ((10, (0, 1, 7)), 45071),
    ((10, (0, 1, 8)), 45072),
    ((10, (0, 1, 9)), 45073),
    ((10, (0, 2, 6)), 44918),
    ((10, (0, 2, 7)), 44919),
    ((10, (0, 2, 8)), 44920),
    ((10, (0, 2, 9)), 44921),
    ((10, (0, 3, 6)), 44941),
    ((10, (0, 3, 7)), 44942),
    ((10, (0, 3, 8)), 44943),
    ((10, (0, 3, 9)), 44944),
    ((10, (0, 4, 6)), 44945),
    ((10, (0, 4, 7)), 44946),
    ((10, (0, 4, 8)), 44947),
    ((10, (0, 4, 9)), 44948),
    ((10, (0, 5, 6)), 44949),
    ((10, (0, 5, 7)), 44950),
    ((10, (0, 5, 8)), 44951),
    ((10, (0, 5, 9)), 44952),
    ((10, (1, 6)), 45047),
    ((10, (1, 7)), 45048),
    ((10, (1, 8)), 45049),
    ((10, (1, 9)), 45050),
    ((10, (2, 3)), 45302),
    ((10, (2, 4)), 45303),
    ((10, (2, 5)), 45304),
    ((10, (3, 6)), 45201),
    ((10, (3, 7)), 45202),
    ((10, (3, 8)), 45203),
    ((10, (3, 9)), 45204),
    ((10, (4, 6)), 45205),
    ((10, (4, 7)), 45206),
    ((10, (4, 8)), 45207),
    ((10, (4, 9)), 45208),
    ((10, (5, 6)), 45209),
    ((10, (5, 7)), 45210),
    ((10, (5, 8)), 45211),
    ((10, (5, 9)), 45212),
    ((11, (0, 1, 3)), 45124),
    ((11, (0, 1, 4)), 45125),
    ((11, (0, 1, 5)), 45126),
    ((11, (0, 1, 6)), 45074),
    ((11, (0, 1, 7)), 45075),
    ((11, (0, 1, 8)), 45076),
    ((11, (0, 1, 9)), 45077),
    ((11, (0, 2, 6)), 44922),
    ((11, (0, 2, 7)), 44923),
    ((11, (0, 2, 8)), 44924),
    ((11, (0, 2, 9)), 44925),
    ((11, (0, 3, 6)), 44953),
    ((11, (0, 3, 7)), 44954),
    ((11, (0, 3, 8)), 44955),
    ((11, (0, 3, 9)), 44956),
    ((11, (0, 4, 6)), 44957),
    ((11, (0, 4, 7)), 44958),
    ((11, (0, 4, 8)), 44959),
    ((11, (0, 4, 9)), 44960),
    ((11, (0, 5, 6)), 44961),
    ((11, (0, 5, 7)), 44962),
    ((11, (0, 5, 8)), 44963),
    ((11, (0, 5, 9)), 44964),
    ((11, (1, 6)), 45051),
    ((11, (1, 7)), 45052),
    ((11, (1, 8)), 45053),
    ((11, (1, 9)), 45054),
    ((11, (2, 3)), 45305),
    ((11, (2, 4)), 45306),
    ((11, (2, 5)), 45307),
    ((11, (3, 6)), 45213),
    ((11, (3, 7)), 45214),
    ((11, (3, 8)), 45215),
    ((11, (3, 9)), 45216),
    ((11, (4, 6)), 45217),
    ((11, (4, 7)), 45218),
    ((11, (4, 8)), 45219),
    ((11, (4, 9)), 45220),
    ((11, (5, 6)), 45221),
    ((11, (5, 7)), 45222),
    ((11, (5, 8)), 45223),
    ((11, (5, 9)), 45224),
)
EXPECTED_REUSED_REQUIREMENTS = tuple(
    requirement for requirement, _variable in EXPECTED_REUSED_REQUIREMENT_BINDINGS
)
EXPECTED_REUSED_PATTERN_VARIABLES = tuple(
    variable for _requirement, variable in EXPECTED_REUSED_REQUIREMENT_BINDINGS
)
EXPECTED_FRESH_PATTERN_VARIABLES = tuple(
    range(45_490, 45_490 + EXPECTED_FRESH_REQUIREMENT_COUNT)
)

COMPILER_SOURCE_PATH = "census/card_head/exact12_positive_membership_cnf.py"
HELPER_SOURCE_PATH = "census/card_head/exact12_positive_membership_source_order_bank.py"
SURFACE_SOURCE_PATH = "census/card_head/source_faithful_candidate_surface.py"
# The roles enumeration consumes source_boundary_orders() from this module,
# so its bytes are part of the authenticated source manifest.
ORDER_SOURCE_PATH = "census/card_head/exact12_v14_ordered_coverage.py"
LEAN_ROOT_MODULES = (
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221AllOrderCommonFiveCertificate"
    ),
    (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "ExactTwelveRigid221AllOrderCommonFiveMembershipFamilyCnf"
    ),
)


class Exact12AllOrderCommonFiveMembershipFamilyBankError(ValueError):
    """The family, its authenticated sources, or frozen parent drifted."""


def _lean_source_paths(repo_root: Path) -> tuple[str, ...]:
    root = repo_root.resolve()
    pending = list(LEAN_ROOT_MODULES)
    seen_modules: set[str] = set()
    source_paths: set[str] = set()
    while pending:
        module = pending.pop()
        if module in seen_modules:
            continue
        seen_modules.add(module)
        relative_path = _project_lean_source_path(module)
        if relative_path is None:
            continue
        source_path = root / relative_path
        try:
            source = source_path.read_text(encoding="utf-8")
        except (OSError, UnicodeError) as exc:
            raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                f"repository-local Lean import is unreadable: {relative_path}"
            ) from exc
        source_paths.add(relative_path)
        for imported_module in _lean_import_modules(
            source, relative_path=relative_path
        ):
            if _project_lean_source_path(imported_module) is not None:
                pending.append(imported_module)
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
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family cell index must be an integer"
        )
    try:
        return PRODUCTION_FAMILY_ID_BY_CELL[cell_index]
    except KeyError as exc:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            f"no production all-order common-five family for cell {cell_index}"
        ) from exc


@functools.cache
def _positions() -> tuple[tuple[int, ...], ...]:
    """Label-to-position maps for the forty-eight canonical orders."""

    orders = source_boundary_orders()
    if len(orders) != 48:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "canonical boundary-order universe is not 48 orders"
        )
    positions = []
    for _orientation, order in orders:
        position = [0] * 12
        for index, label in enumerate(order):
            position[label] = index
        positions.append(tuple(position))
    return tuple(positions)


def _cyclic_triple(position: tuple[int, ...], a: int, b: int, c: int) -> bool:
    pa, pb, pc = position[a], position[b], position[c]
    return (pa < pb < pc) or (pb < pc < pa) or (pc < pa < pb)


def _common_five(
    position: tuple[int, ...], a: int, x: int, b: int, c: int, y: int
) -> bool:
    return (
        _cyclic_triple(position, a, x, b) and _cyclic_triple(position, b, c, y)
    ) or (_cyclic_triple(position, a, b, x) and _cyclic_triple(position, b, y, c))


def _side_conditions(a: int, x: int, b: int, c: int, y: int) -> bool:
    if a == b or x == y:
        return False
    if x in (a, b) or y in (a, b):
        return False
    return c not in (b, x, y)


def _admissible(a: int, x: int, b: int, c: int, y: int) -> bool:
    if not _side_conditions(a, x, b, c, y):
        return False
    return all(
        _common_five(position, a, x, b, c, y) for position in _positions()
    )


@functools.cache
def candidate_rows(center: int) -> tuple[tuple[int, int, int, int], ...]:
    """Per-center candidate rows of the frozen source-faithful surface.

    This is the exact derivation the parent-chain instance is built from
    (``SourceFaithfulCoverInstance(build_model(12,
    SOURCE_FAITHFUL_PYTHON_PROFILE))``), exposed as a pure function of the
    static layout with no instance parameter.  ``_compile`` asserts that the
    live instance's candidate sets equal this derivation.
    """

    return source_faithful_candidate_classes(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE), center
    )


@functools.cache
def _covered_row_subsets(
    center: int,
) -> tuple[frozenset[tuple[int, ...]], frozenset[tuple[int, ...]]]:
    """All sorted pairs and triples contained in some candidate row."""

    pairs: set[tuple[int, ...]] = set()
    triples: set[tuple[int, ...]] = set()
    for candidate in candidate_rows(center):
        ordered = tuple(sorted(candidate))
        pairs.update(itertools.combinations(ordered, 2))
        triples.update(itertools.combinations(ordered, 3))
    return frozenset(pairs), frozenset(triples)


def _row_realizable(center: int, required: tuple[int, ...]) -> bool:
    pairs, triples = _covered_row_subsets(center)
    ordered = tuple(sorted(required))
    if len(ordered) == 2:
        return ordered in pairs
    if len(ordered) == 3:
        return ordered in triples
    raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
        "all-order common-five rows are pairs and triples only"
    )


def _role_realizable(a: int, b: int, c: int, x: int, y: int) -> bool:
    pair = (a, b) if a < b else (b, a)
    return (
        _row_realizable(x, pair)
        and _row_realizable(y, pair)
        and _row_realizable(c, (b, x, y))
    )


@functools.cache
def _family_roles() -> tuple[tuple[int, int, int, int, int], ...]:
    """One canonical realizable ``(a, b, c, x, y)`` per unordered pattern.

    The orientation check runs in the certificate's argument order
    ``(a, x, b, c, y)``.  For each unordered pattern with ``x < y`` the
    ``x < y`` assignment is kept when it is admissible; otherwise the
    swapped assignment ``(a, b, c, y, x)`` is kept when it is admissible.
    The full orbit is then restricted to roles whose three rows are all
    realizable on the frozen candidate surface.
    """

    full: list[tuple[int, int, int, int, int]] = []
    for a in range(12):
        for b in range(12):
            for c in range(12):
                for x in range(12):
                    for y in range(x + 1, 12):
                        if _admissible(a, x, b, c, y):
                            full.append((a, b, c, x, y))
                        elif _admissible(a, y, b, c, x):
                            full.append((a, b, c, y, x))
    if len(full) != EXPECTED_FULL_ORBIT_ROLE_COUNT:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five full orbit drifted: "
            f"expected {EXPECTED_FULL_ORBIT_ROLE_COUNT} roles, "
            f"observed {len(full)}"
        )
    full_pair_rows: set[tuple[int, tuple[int, ...]]] = set()
    full_triple_rows: set[tuple[int, tuple[int, ...]]] = set()
    for a, b, c, x, y in full:
        pair = (a, b) if a < b else (b, a)
        full_pair_rows.add((x, pair))
        full_pair_rows.add((y, pair))
        full_triple_rows.add((c, tuple(sorted((b, x, y)))))
    if (
        len(full_pair_rows) != EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT
        or len(full_triple_rows) != EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT
        or len(full_pair_rows) + len(full_triple_rows)
        != EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT
    ):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five full-orbit row universe drifted"
        )
    roles = tuple(role for role in full if _role_realizable(*role))
    if DOMINANT_CORE not in roles:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "v23 dominant core did not survive the realizability filter"
        )
    if len(roles) != EXPECTED_ROLE_COUNT:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five realizable sub-orbit drifted: "
            f"expected {EXPECTED_ROLE_COUNT} roles, observed {len(roles)}"
        )
    return roles


def family_roles() -> tuple[tuple[int, int, int, int, int], ...]:
    return _family_roles()


def family_patterns() -> tuple[tuple[dict[str, Any], ...], ...]:
    return tuple(
        (
            {"center": x, "support": [a, b]},
            {"center": y, "support": [a, b]},
            {"center": c, "support": [b, x, y]},
        )
        for a, b, c, x, y in family_roles()
    )


@functools.cache
def _all_requirements() -> tuple[tuple[int, tuple[int, ...]], ...]:
    normalized = tuple(
        normalize_memberships(12, choices) for choices in family_patterns()
    )
    return tuple(sorted({item for pattern in normalized for item in pattern}))


def _expected_fresh_requirements() -> tuple[tuple[int, tuple[int, ...]], ...]:
    reused = set(EXPECTED_REUSED_REQUIREMENTS)
    return tuple(
        requirement
        for requirement in _all_requirements()
        if requirement not in reused
    )


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
            "_second_opposite_triple_surplus_first_opposite_three_triad_"
            "membership_family_bank_installed",
            False,
        )
        or getattr(
            instance,
            "_all_order_common_five_membership_family_bank_installed",
            False,
        )
    ):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "instance is not the frozen post-three-triad all-order parent"
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
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "instance candidate surface differs from the frozen candidate_rows "
            "derivation"
        )
    normalized = tuple(
        normalize_memberships(12, choices) for choices in family_patterns()
    )
    initial_variables = instance.cnf.n_variables
    initial_clauses = len(instance.cnf.clauses)
    requirements = sorted({item for pattern in normalized for item in pattern})
    expected_reused_variables = dict(EXPECTED_REUSED_REQUIREMENT_BINDINGS)
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
            raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                "positive membership requirement has no candidate realization"
            )
        inherited_variable = instance.pattern_variables.get(key)
        expected_reused_variable = expected_reused_variables.get((center, required))
        if expected_reused_variable is None:
            if inherited_variable is not None:
                raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                    "fresh membership requirement was unexpectedly inherited"
                )
            reused = False
        else:
            if inherited_variable != expected_reused_variable:
                raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                    "authenticated parent membership variable changed"
                )
            reused = True
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
            raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                "pattern implication compiler drifted"
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
            raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                "all-order common-five family contains a duplicate block"
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
    }
    definition_requirements = tuple(
        (definition["center"], tuple(definition["required"]))
        for definition in definitions
    )
    definition_variables = tuple(
        definition["pattern_variable"] for definition in definitions
    )
    reused = tuple(
        requirement
        for requirement, definition in zip(
            definition_requirements, definitions, strict=True
        )
        if definition["reused"]
    )
    reused_variables = tuple(
        variable
        for variable, definition in zip(definition_variables, definitions, strict=True)
        if definition["reused"]
    )
    fresh = tuple(
        requirement
        for requirement, definition in zip(
            definition_requirements, definitions, strict=True
        )
        if not definition["reused"]
    )
    fresh_variables = tuple(
        variable
        for variable, definition in zip(definition_variables, definitions, strict=True)
        if not definition["reused"]
    )
    pair_requirements = tuple(
        requirement for requirement in definition_requirements
        if len(requirement[1]) == 2
    )
    triple_requirements = tuple(
        requirement for requirement in definition_requirements
        if len(requirement[1]) == 3
    )
    if (
        len(compiled["pattern_keys"]) != EXPECTED_PATTERN_COUNT
        or len(definitions) != EXPECTED_DEFINITION_COUNT
        or len(definition_requirements) != EXPECTED_LOGICAL_REQUIREMENT_COUNT
        or len(pair_requirements) != EXPECTED_PAIR_REQUIREMENT_COUNT
        or len(triple_requirements) != EXPECTED_TRIPLE_REQUIREMENT_COUNT
        or len(reused) != EXPECTED_REUSED_REQUIREMENT_COUNT
        or len(fresh) != EXPECTED_FRESH_REQUIREMENT_COUNT
        or reused != EXPECTED_REUSED_REQUIREMENTS
        or reused_variables != EXPECTED_REUSED_PATTERN_VARIABLES
        or fresh != _expected_fresh_requirements()
        or fresh_variables != EXPECTED_FRESH_PATTERN_VARIABLES
    ):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family requirement binding drifted"
        )
    return compiled


def _compile_payload(instance: SourceFaithfulCoverInstance) -> dict[str, Any]:
    working = copy.deepcopy(instance)
    compiled = _compile(working)
    final_sha256 = hashlib.sha256(working.dimacs().encode("ascii")).hexdigest()
    if (
        compiled["initial_n_variables"] != EXPECTED_PARENT_VARIABLES
        or compiled["initial_n_clauses"] != EXPECTED_PARENT_CLAUSES
        or compiled["final_n_variables"] != EXPECTED_FINAL_VARIABLES
        or compiled["final_n_clauses"] != EXPECTED_FINAL_CLAUSES
        or compiled["delta_sha256"] != EXPECTED_DELTA_SHA256
        or final_sha256 != EXPECTED_FINAL_DIMACS_SHA256
    ):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "compiled all-order common-five family counts or hashes drifted: "
            f"observed final variables {compiled['final_n_variables']}, "
            f"final clauses {compiled['final_n_clauses']}, "
            f"delta {compiled['delta_sha256']}, dimacs {final_sha256}"
        )
    compiled["final_dimacs_sha256"] = final_sha256
    compiled["compiled_sha256"] = _sha256_json(compiled)
    if compiled["compiled_sha256"] != EXPECTED_COMPILED_SHA256:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "compiled all-order common-five family payload hash drifted: "
            f"expected {EXPECTED_COMPILED_SHA256}, "
            f"observed {compiled['compiled_sha256']}"
        )
    return compiled


def build_all_order_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    family_id = production_family_id_for_cell(cell_index)
    attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources(
        repo_root, parent_bank
    )
    parent = _parent_record(instance, layout, parent_bank)
    compiled = _compile_payload(instance)
    roles = [
        {"a": a, "b": b, "c": c, "x": x, "y": y}
        for a, b, c, x, y in family_roles()
    ]
    roles_sha256 = _sha256_json(roles)
    if roles_sha256 != EXPECTED_ROLES_SHA256:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family role hash drifted: "
            f"expected {EXPECTED_ROLES_SHA256}, observed {roles_sha256}"
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
        "parent_three_triad_bank": parent,
        "three_triad_bank": copy.deepcopy(dict(parent_bank)),
        "roles": roles,
        "roles_sha256": roles_sha256,
        "patterns": [list(pattern) for pattern in family_patterns()],
        "entries": copy.deepcopy(compiled["entries"]),
        "compiled": compiled,
        "reused_requirement_count": EXPECTED_REUSED_REQUIREMENT_COUNT,
        "source_manifest": [
            _source_record(repo_root.resolve(), path)
            for path in _source_paths(repo_root)
        ],
    }
    bank_sha256 = _sha256_json(body)
    if bank_sha256 != EXPECTED_BANK_SHA256:
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family bank hash drifted: "
            f"expected {EXPECTED_BANK_SHA256}, observed {bank_sha256}"
        )
    return {**body, "bank_sha256": bank_sha256}


def attest_all_order_common_five_membership_family_bank_live_sources(
    repo_root: Path, bank: Mapping[str, Any]
) -> None:
    parent = bank.get("three_triad_bank")
    if not isinstance(parent, Mapping):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "embedded three-triad bank is malformed"
        )
    attest_second_opposite_triple_surplus_first_opposite_three_triad_membership_family_bank_live_sources(
        repo_root, parent
    )
    manifest = bank.get("source_manifest")
    expected_paths = list(_source_paths(repo_root))
    if (
        not isinstance(manifest, list)
        or [record.get("path") for record in manifest if isinstance(record, Mapping)]
        != expected_paths
    ):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family source path set drifted"
        )
    for record in manifest:
        if (
            not isinstance(record, Mapping)
            or set(record) != {"path", "bytes", "sha256"}
            or not isinstance(record.get("path"), str)
            or _source_record(repo_root.resolve(), record["path"]) != record
        ):
            raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                "all-order common-five family source bytes or hashes drifted"
            )


def validate_all_order_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> None:
    fresh = build_all_order_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family differs from a live authenticated rebuild"
        )


def install_all_order_common_five_membership_family_bank(
    repo_root: Path,
    instance: SourceFaithfulCoverInstance,
    layout: StaticConvexLayout,
    parent_bank: Mapping[str, Any],
    *,
    cell_index: int,
) -> dict[str, Any]:
    attribute = "_all_order_common_five_membership_family_bank_installed"
    if getattr(instance, attribute, False):
        raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
            "all-order common-five family is already installed"
        )
    bank = build_all_order_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, cell_index=cell_index
    )
    validate_all_order_common_five_membership_family_bank(
        repo_root, instance, layout, parent_bank, bank, cell_index=cell_index
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
            raise Exact12AllOrderCommonFiveMembershipFamilyBankError(
                "installed all-order common-five family differs from its "
                "authenticated bank"
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
    "EXPECTED_DELTA_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
    "EXPECTED_FINAL_VARIABLES",
    "EXPECTED_FRESH_PATTERN_VARIABLES",
    "EXPECTED_FRESH_REQUIREMENT_COUNT",
    "EXPECTED_FULL_ORBIT_PAIR_ROW_COUNT",
    "EXPECTED_FULL_ORBIT_REQUIREMENT_COUNT",
    "EXPECTED_FULL_ORBIT_ROLE_COUNT",
    "EXPECTED_FULL_ORBIT_TRIPLE_ROW_COUNT",
    "EXPECTED_LOGICAL_REQUIREMENT_COUNT",
    "EXPECTED_PAIR_REQUIREMENT_COUNT",
    "EXPECTED_PATTERN_COUNT",
    "EXPECTED_REUSED_PATTERN_VARIABLES",
    "EXPECTED_REUSED_REQUIREMENTS",
    "EXPECTED_REUSED_REQUIREMENT_BINDINGS",
    "EXPECTED_REUSED_REQUIREMENT_COUNT",
    "EXPECTED_ROLES_SHA256",
    "EXPECTED_ROLE_COUNT",
    "EXPECTED_TRIPLE_REQUIREMENT_COUNT",
    "FAMILY_ID",
    "Exact12AllOrderCommonFiveMembershipFamilyBankError",
    "attest_all_order_common_five_membership_family_bank_live_sources",
    "build_all_order_common_five_membership_family_bank",
    "candidate_rows",
    "family_patterns",
    "family_roles",
    "install_all_order_common_five_membership_family_bank",
    "production_family_id_for_cell",
    "validate_all_order_common_five_membership_family_bank",
]
