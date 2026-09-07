# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import cardge13_exact13_coarse_cell_boolean_piqd as coarse
import cardge13_exact13_witnessed_key_root_piqd as root
import check_exact13_guarded_boundary as boundary
import exact13_direct_cell0_key_contract as subject

# Positive literals copied from the authenticated wave5 model certificate
# imported-6000 (certificate SHA-256:
# 2ee72ca033d4619cafd0364299d5aef7660eb8e17ec625882762dc3690fb9af4).
# They are used only as an in-memory synthetic assignment; no source-geometry
# or coverage claim is made.
SYNTHETIC_POSITIVE_LITERALS = {
    7,
    8,
    12,
    13,
    14,
    17,
    18,
    19,
    28,
    29,
    36,
    37,
    43,
    48,
    51,
    52,
    57,
    60,
    62,
    64,
    66,
    67,
    71,
    74,
    81,
    83,
    86,
    87,
    92,
    94,
    97,
    98,
    106,
    108,
    111,
    112,
    118,
    125,
    127,
    130,
    135,
    136,
    141,
    143,
    159,
    160,
    161,
    169,
    175,
    176,
    179,
    182,
    190,
    191,
    193,
    195,
    217,
    234,
    243,
    260,
    266,
    283,
    290,
    311,
    325,
    326,
    328,
    340,
    341,
    345,
    358,
    376,
    379,
    380,
    382,
    385,
    386,
    388,
    391,
    395,
    396,
    397,
    401,
    402,
    423,
    425,
    429,
    431,
}


def test_source_catalog_confirms_direct_cell_zero_pins() -> None:
    cells = coarse.catalog_cells()
    assert any(
        cell.orientation == "direct" and cell.z == 8 and cell.k_i2 == (9, 10)
        for cell in cells
    )
    assert subject.is_direct_cell0_signature("direct", 8, (9, 10))
    assert subject.source_catalog_member(
        subject.normalize_raw_signature("direct", 8, (9, 10))
    )


def test_restricted_root_preserves_corrected_root_and_has_no_cuts() -> None:
    restricted = subject.build_direct_cell0_root()
    assert len(restricted.cnf.names) == 432
    assert len(restricted.original_clauses) == 29_468
    assert len(restricted.guarded_clauses) == 1_815
    assert len(restricted.pin_literals) == 7
    assert len(restricted.clauses) == 31_290
    assert tuple(restricted.cnf.clauses) == restricted.clauses
    assert restricted.cnf.dimacs().splitlines()[0] == b"p cnf 432 31290"
    assert restricted.imported_cut_count == 0
    assert subject.retained_witness_families(restricted) == (
        "u",
        "e",
        "pair",
        "c",
        "chosen",
    )


def test_root_pin_mutations_are_rejected_by_the_raw_signature_predicate() -> None:
    assert not subject.is_direct_cell0_signature("mirror", 8, (9, 10))
    assert not subject.is_direct_cell0_signature("direct", 9, (9, 10))
    assert not subject.is_direct_cell0_signature("direct", 8, (8, 10))
    assert not subject.is_direct_cell0_signature("direct", 8, (9, 11))


def test_full_restricted_root_accepts_synthetic_direct_assignment() -> None:
    restricted = subject.build_direct_cell0_root()
    assignment = set(SYNTHETIC_POSITIVE_LITERALS)
    orientation = restricted.projection["orientation"]
    assert isinstance(orientation, int) and orientation in assignment
    assignment.remove(orientation)  # mirror fixture, toggled to direct
    assert restricted.satisfied(assignment)
    key = root.key_from_assignment(assignment, restricted.projection)
    assert key["orientation"] == "direct"
    assert key["z"] == 8
    assert set(key["raw_rows"]["K"]) & set(root.I2) == {9, 10}
    assert root.replay_assignment(assignment, key, restricted.projection)["Valid"]
    assert not boundary.guarded_violations(key)


def test_retained_final_coarse_cell0_has_no_occurrence_witness() -> None:
    # Final iteration 20 of the retained direct-z08-k09-10 coarse run.
    K, L = {4, 7, 9, 10}, {5, 8, 11, 12}
    C0, C1, z = {1, 2, 6, 12}, {0, 3, 5, 11}, 8
    assert subject.occurrence_witnesses(K, L, C0, C1, z) == ()


def test_synthetic_occurrence_core_has_the_exact_witness_equations() -> None:
    K, L = {4, 7, 9, 10}, {5, 8, 11, 12}
    C0, C1, z = {1, 6, 11, 12}, {0, 2, 3, 5}, 8
    witnesses = subject.occurrence_witnesses(K, L, C0, C1, z)
    assert len(witnesses) == 2
    witness = witnesses[0]
    assert (witness.other, witness.a, witness.b, witness.ell) == ("C0", 11, 12, 5)
    assert witness.E == {2, 3}
    assert witness.C == C1
    assert witness.D == C0
    assert witness.D == (set(L) - {z, witness.ell}) | (set(witness.U) - set(witness.E))
    assert (witnesses[1].a, witnesses[1].b) == (witness.b, witness.a)
    assert subject.occurrence_witness_exists(K, L, C0, C1, z=z)


def test_occurrence_mutations_cover_pair_and_role_boundaries() -> None:
    K, L = {4, 7, 9, 10}, {5, 8, 11, 12}
    C0, C1 = {1, 6, 11, 12}, {0, 2, 3, 5}
    assert not subject.occurrence_witness_exists(K, L, C0, C1, z=0)
    assert not subject.occurrence_witness_exists(K | {0}, L, C0, C1, z=8)
    assert not subject.occurrence_witness_exists(K, L | {0}, C0, C1, z=8)
    mutated_c0 = set(C0)
    mutated_c0.remove(11)  # breaks the selected {a,b} pair equation
    assert not subject.occurrence_witness_exists(K, L, mutated_c0, C1, z=8)


def test_direct_pin_literal_mutation_cannot_pass_synthetic_assignment() -> None:
    restricted = subject.build_direct_cell0_root()
    assignment = set(SYNTHETIC_POSITIVE_LITERALS)
    orientation = restricted.projection["orientation"]
    assert isinstance(orientation, int)
    assignment.remove(orientation)
    for pin in restricted.pin_literals:
        mutated_assignment = set(assignment)
        if pin > 0:
            mutated_assignment.remove(pin)
        else:
            mutated_assignment.add(-pin)
        assert not restricted.satisfied(mutated_assignment)
