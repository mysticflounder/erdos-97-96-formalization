# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Pure contract checks for the direct exact-13 cell-zero restriction.

This module builds an in-memory restriction of the corrected witnessed-Key
root.  It does not invoke a solver and makes no SAT, coverage, promotion, or
realizability claim.  In particular, a raw-cell signature is only a finite
necessary-data check; it is not ``Key.Valid``.
"""

from __future__ import annotations

from collections.abc import Iterable
from dataclasses import dataclass
from itertools import combinations

import cardge13_exact13_witnessed_key_guarded_cegar_wave3_piqd as wave3
import cardge13_exact13_witnessed_key_root_piqd as root

LABELS = frozenset(root.LABELS)
I2 = frozenset(root.I2)
SECOND_APEX = root.SECOND_APEX
DIRECT_CELL0 = ("direct", 8, frozenset((9, 10)))
EXPECTED_ROOT_VARIABLES = 432
EXPECTED_ROOT_CLAUSES = 29_468
EXPECTED_GUARDED_CLAUSES = 1_815
EXISTENTIAL_WITNESS_FAMILIES = ("u", "e", "pair", "c", "chosen")


@dataclass(frozen=True)
class RawCellSignature:
    """The orientation and coarse raw ``I2`` data retained by the catalog."""

    orientation: str
    z: int
    k_i2: frozenset[int]


@dataclass(frozen=True)
class OccurrenceWitness:
    """One finite witness for the exact ``Key.OccurrenceValid`` equations."""

    other: str
    a: int
    b: int
    ell: int
    E: frozenset[int]
    C: frozenset[int]
    D: frozenset[int]
    U: frozenset[int]


@dataclass(frozen=True)
class RestrictedRoot:
    """Root clauses plus only the direct cell-zero unit pins."""

    cnf: root.Cnf
    projection: dict[str, object]
    original_clauses: tuple[tuple[int, ...], ...]
    guarded_clauses: tuple[tuple[int, ...], ...]
    pin_literals: tuple[int, ...]
    clauses: tuple[tuple[int, ...], ...]
    imported_cut_count: int = 0

    def satisfied(self, assignment: set[int]) -> bool:
        return all(
            any((literal > 0) == (abs(literal) in assignment) for literal in clause)
            for clause in self.clauses
        )


def _labels(values: Iterable[int], name: str) -> frozenset[int]:
    values = tuple(values)
    if any(type(value) is not int for value in values):
        raise ValueError(f"{name} contains a non-integer label")
    result = frozenset(values)
    if not result <= LABELS:
        raise ValueError(f"{name} contains a label outside Fin 13")
    return result


def normalize_raw_signature(
    orientation: str, z: int, k_i2: Iterable[int]
) -> RawCellSignature:
    if orientation not in ("direct", "mirror"):
        raise ValueError("orientation must be direct or mirror")
    if type(z) is not int or z not in I2:
        raise ValueError("z must be an I2 label")
    return RawCellSignature(orientation, z, _labels(k_i2, "k_i2"))


def source_catalog_member(signature: RawCellSignature) -> bool:
    """Check the finite catalog predicate stated by the Lean source catalog."""

    return (
        signature.orientation in ("direct", "mirror")
        and signature.z in I2
        and signature.z not in signature.k_i2
        and signature.k_i2 <= I2
        and len(signature.k_i2) in (2, 3)
    )


def is_direct_cell0_signature(orientation: str, z: int, k_i2: Iterable[int]) -> bool:
    try:
        signature = normalize_raw_signature(orientation, z, k_i2)
    except (TypeError, ValueError):
        return False
    return (
        source_catalog_member(signature)
        and (
            signature.orientation,
            signature.z,
            signature.k_i2,
        )
        == DIRECT_CELL0
    )


def direct_cell0_pin_literals(cnf: root.Cnf) -> tuple[int, ...]:
    """Return unit literals for direct orientation, z=8, and K∩I2={9,10}."""

    return (
        -cnf.names["orientation_mirror"],
        root.role(cnf, "z", 8),
        *(root.member(cnf, "K", point) for point in (9, 10)),
        *(-root.member(cnf, "K", point) for point in (8, 11, 12)),
    )


def build_direct_cell0_root() -> RestrictedRoot:
    """Build the corrected 432-variable root without old or new learned cuts."""

    cnf, projection = root.emit_root()
    original = tuple(cnf.clauses)
    guarded = tuple(wave3.guarded_clauses(cnf))
    if len(cnf.names) != EXPECTED_ROOT_VARIABLES:
        raise AssertionError("witnessed-Key variable count drifted")
    if len(original) != EXPECTED_ROOT_CLAUSES:
        raise AssertionError("corrected witnessed-Key root clause count drifted")
    if len(guarded) != EXPECTED_GUARDED_CLAUSES:
        raise AssertionError("guarded-clause count drifted")
    pins = direct_cell0_pin_literals(cnf)
    clauses = (*original, *guarded, *((literal,) for literal in pins))
    cnf.clauses.extend((*guarded, *((literal,) for literal in pins)))
    if tuple(cnf.clauses) != clauses:
        raise AssertionError("restricted CNF clauses drifted from the retained tuple")
    return RestrictedRoot(cnf, projection, original, guarded, pins, clauses)


def retained_witness_families(restricted: RestrictedRoot) -> tuple[str, ...]:
    """Return all existential witness families still represented in the root."""

    bits = restricted.projection.get("witness_bits")
    if not isinstance(bits, dict):
        raise TypeError("root projection lost its witness-bit map")
    if any(name not in bits for name in EXISTENTIAL_WITNESS_FAMILIES):
        raise AssertionError("root projection lost an existential witness family")
    return EXISTENTIAL_WITNESS_FAMILIES


def _row(value: Iterable[int], name: str) -> frozenset[int]:
    return _labels(value, name)


def occurrence_witnesses(
    K: Iterable[int],
    L: Iterable[int],
    C0: Iterable[int],
    C1: Iterable[int],
    z: int,
) -> tuple[OccurrenceWitness, ...]:
    r"""Enumerate exactly the finite witnesses in ``Key.OccurrenceValid``.

    Here ``U = univ \ (K ∪ L ∪ {0})``.  For every ``ell`` in ``L.erase z``
    and every two-subset ``E`` of ``U``, this checks
    ``C={0,ell}∪E`` and ``D=((L.erase z).erase ell)∪(U\E)``.  The selected
    ``other`` row must be ``D`` and the opposite C-row must be ``C``.
    """

    k, l, c0, c1 = (
        _row(value, name)
        for value, name in ((K, "K"), (L, "L"), (C0, "C0"), (C1, "C1"))
    )
    if type(z) is not int or z not in LABELS:
        return ()
    if SECOND_APEX == z or SECOND_APEX in k or SECOND_APEX in l:
        return ()
    U = LABELS - (k | l | {SECOND_APEX})
    l_without_z = l - {z}
    if len(U) != 4 or len(l_without_z) != 3:
        return ()
    result: list[OccurrenceWitness] = []
    for ell in sorted(l_without_z):
        pair = l_without_z - {ell}
        if len(pair) != 2:
            continue
        a, b = sorted(pair)
        for E_tuple in combinations(sorted(U), 2):
            E = frozenset(E_tuple)
            C = frozenset({SECOND_APEX, ell} | E)
            D = frozenset(pair | (U - E))
            if D == c0 and pair <= c0 and C == c1:
                result.extend(
                    (
                        OccurrenceWitness("C0", a, b, ell, E, C, D, U),
                        OccurrenceWitness("C0", b, a, ell, E, C, D, U),
                    )
                )
            if D == c1 and pair <= c1 and C == c0:
                result.extend(
                    (
                        OccurrenceWitness("C1", a, b, ell, E, C, D, U),
                        OccurrenceWitness("C1", b, a, ell, E, C, D, U),
                    )
                )
    return tuple(result)


def occurrence_witness_exists(*rows: Iterable[int], z: int) -> bool:
    if len(rows) != 4:
        raise TypeError("expected K, L, C0, and C1 rows")
    return bool(occurrence_witnesses(*rows, z=z))
