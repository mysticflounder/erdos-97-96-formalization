"""Reproduce the strict-Kalmanson n=11 remainder arithmetic and motif census."""

from __future__ import annotations

import hashlib
import itertools
import json
from collections.abc import Iterable
from dataclasses import dataclass
from pathlib import Path
from typing import Final

import generate_strict_kalmanson_known_clause_census as known

Atom = tuple[int, int]
Clause = tuple[Atom, ...]

REPO_ROOT: Final = Path(__file__).resolve().parents[1]
FOUR_EQUALITY_SOURCE: Final = Path(
    "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean"
)
FOUR_EQUALITY_SOURCE_SHA256: Final = (
    "72d39c2c9a1ab32ad4cd9d9bd25b5367da0fa20e123c1aa29cb0bc8c54d319e4"
)
FOUR_ROLE_K2_SOURCE: Final = Path(
    "lean/Erdos9796Proof/P97/ATail/FourRoleThreeRowK2Collapse.lean"
)
FOUR_ROLE_K2_SOURCE_SHA256: Final = (
    "75de8c0c9baf7bd18f263c049f0d86ef45bbac2afa86c8c53eda643d1a37df29"
)
ANNOUNCED_N11_BASE_COUNT: Final = 42_504
SCHEMA_VERSION: Final = "p97-strict-kalmanson-n11-remainder-forensics/v1"


@dataclass(frozen=True)
class OrbitSchema:
    """One checked selected-row schema and its supported role transforms."""

    name: str
    arity: int
    atoms: Clause
    transport: str


def canonical_clause(atoms: Iterable[Atom]) -> Clause:
    """Sort and deduplicate one positive-membership no-good."""

    return tuple(sorted(set(atoms)))


def _clause(*atoms: Atom) -> Clause:
    return canonical_clause(atoms)


# Role names use a=0, b=1, ... in the cited Lean source.  Schemas C--K have
# increasing, decreasing, cyclic-shift increasing, and cyclic-shift decreasing
# selected-row wrappers.  L and M have only increasing/decreasing wrappers.
FOUR_EQUALITY_SELECTED_SCHEMAS: Final = (
    OrbitSchema(
        "C",
        7,
        _clause(
            (0, 5), (0, 1), (5, 0), (5, 3), (5, 6),
            (2, 3), (2, 6), (4, 5), (4, 1),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "D",
        6,
        _clause(
            (0, 4), (0, 1), (4, 0), (4, 2), (4, 5),
            (1, 4), (1, 5), (3, 4), (3, 1), (3, 2),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "E",
        6,
        _clause(
            (0, 5), (0, 3), (4, 1), (4, 2), (1, 0),
            (1, 2), (1, 3), (2, 5), (2, 1),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "F",
        7,
        _clause(
            (0, 5), (0, 2), (5, 0), (5, 6), (5, 2),
            (1, 5), (1, 4), (3, 1), (3, 4), (3, 6),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "G",
        6,
        _clause(
            (0, 1), (0, 3), (1, 2), (1, 5),
            (2, 1), (2, 3), (4, 2), (4, 5),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "H",
        6,
        _clause(
            (0, 1), (0, 3), (2, 4), (2, 5),
            (4, 3), (4, 5), (5, 1), (5, 4),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "I",
        6,
        _clause(
            (0, 1), (0, 4), (3, 1), (3, 4),
            (1, 2), (1, 5), (4, 2), (4, 5),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "J",
        6,
        _clause(
            (0, 1), (0, 3), (1, 0), (1, 2),
            (4, 0), (4, 1), (5, 2), (5, 3),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "K",
        6,
        _clause(
            (4, 3), (4, 1), (4, 5), (3, 0), (3, 2),
            (0, 4), (0, 1), (0, 2), (1, 0), (1, 5),
        ),
        "dihedral",
    ),
    OrbitSchema(
        "L",
        7,
        _clause(
            (6, 3), (6, 0), (2, 4), (2, 1), (4, 6),
            (4, 1), (4, 3), (5, 4), (5, 0),
        ),
        "direct_reflected",
    ),
    OrbitSchema(
        "M",
        8,
        _clause(
            (0, 3), (0, 1), (0, 7), (6, 0), (6, 1),
            (3, 2), (3, 7), (4, 2), (4, 5), (1, 0), (1, 5),
        ),
        "direct_reflected",
    ),
)

FOUR_ROLE_K2_SEED: Final = _clause(
    (1, 2), (1, 3), (2, 0), (2, 3), (3, 0), (3, 2)
)


def verify_source_digest() -> None:
    """Reject stale hard-coded schemas when the Lean inventory changes."""

    expected = {
        FOUR_EQUALITY_SOURCE: FOUR_EQUALITY_SOURCE_SHA256,
        FOUR_ROLE_K2_SOURCE: FOUR_ROLE_K2_SOURCE_SHA256,
    }
    for path, expected_digest in expected.items():
        digest = hashlib.sha256((REPO_ROOT / path).read_bytes()).hexdigest()
        if digest != expected_digest:
            raise ValueError(f"source digest changed for {path}: {digest}")


def transform_clause(
    clause: Clause, arity: int, *, offset: int = 0, reflect: bool = False
) -> Clause:
    """Apply a cyclic role shift, optionally after reversing orientation."""

    def image(role: int) -> int:
        oriented = -role if reflect else role
        return (oriented + offset) % arity

    return canonical_clause(tuple((image(a), image(b)) for a, b in clause))


def schema_patterns(schema: OrbitSchema) -> tuple[Clause, ...]:
    """Enumerate exactly the role transforms backed by selected-row wrappers."""

    offsets = range(schema.arity) if schema.transport == "dihedral" else (0,)
    return tuple(
        sorted(
            {
                transform_clause(
                    schema.atoms, schema.arity, offset=offset, reflect=reflect
                )
                for offset in offsets
                for reflect in (False, True)
            }
        )
    )


def instantiate_pattern(pattern: Clause, labels: tuple[int, ...]) -> Clause:
    """Map role labels to one increasing subset of boundary indices."""

    return canonical_clause(tuple((labels[a], labels[b]) for a, b in pattern))


def instantiate_patterns(n: int, arity: int, patterns: tuple[Clause, ...]) -> set[Clause]:
    """Instantiate every pattern once on each increasing arity-subset."""

    return {
        instantiate_pattern(pattern, labels)
        for labels in itertools.combinations(range(n), arity)
        for pattern in patterns
    }


def current_known_union(n: int) -> set[Clause]:
    """Rebuild the four-family union from the existing authenticated census."""

    schemas = known.parse_three_equality_schemas()
    return set().union(
        known.three_equality_clauses(n, schemas),
        known.complete_berge_clauses(n, known.complete_berge_patterns(schemas)),
        known.shared_pair_clauses(n),
        known.complementary_arc_clauses(n),
    )


def build_audit() -> dict[str, object]:
    """Return the JSON-ready n=11 remainder and checked-family census."""

    verify_source_digest()
    n = 11
    current = current_known_union(n)
    known_census = known.build_census(n)
    baseline_count = known_census["announced_baseline_semantic_reconstruction"][
        "distinct_count"
    ]
    baseline_remainder = ANNOUNCED_N11_BASE_COUNT - baseline_count
    expanded_difference = ANNOUNCED_N11_BASE_COUNT - len(current)
    records: list[dict[str, object]] = []
    four_equality_union: set[Clause] = set()
    for schema in FOUR_EQUALITY_SELECTED_SCHEMAS:
        patterns = schema_patterns(schema)
        clauses = instantiate_patterns(n, schema.arity, patterns)
        four_equality_union.update(clauses)
        records.append(
            {
                "name": schema.name,
                "arity": schema.arity,
                "atom_count": len(schema.atoms),
                "transport": schema.transport,
                "pattern_count": len(patterns),
                "clause_count": len(clauses),
                "exact_current_overlap_count": len(clauses & current),
            }
        )

    k2_direct = instantiate_patterns(n, 4, (FOUR_ROLE_K2_SEED,))
    k2_orbit = instantiate_patterns(
        n,
        4,
        tuple(
            sorted(
                {
                    transform_clause(
                        FOUR_ROLE_K2_SEED, 4, offset=offset, reflect=reflect
                    )
                    for offset in range(4)
                    for reflect in (False, True)
                }
            )
        ),
    )
    block_counts = [record["clause_count"] for record in records]
    matching_family_subsets = [
        [records[index]["name"] for index in range(len(records)) if mask >> index & 1]
        for mask in range(1 << len(records))
        if sum(
            int(block_counts[index])
            for index in range(len(records))
            if mask >> index & 1
        )
        == expanded_difference
    ]
    return {
        "schema": SCHEMA_VERSION,
        "n": n,
        "announced_base_count": ANNOUNCED_N11_BASE_COUNT,
        "reconstructed_baseline_count": baseline_count,
        "announced_minus_reconstructed_baseline": baseline_remainder,
        "current_known_union_count": len(current),
        "announced_minus_current": expanded_difference,
        "arithmetic_fingerprint": {
            "combination_count_11_choose_5": len(
                list(itertools.combinations(range(n), 5))
            ),
            "combination_count_11_choose_6": len(
                list(itertools.combinations(range(n), 6))
            ),
            "template_multiple": 49,
            "global_orbit_residue": 22,
            "reconstructed_remainder": 49 * 462 + 22,
            "status": "arithmetic identity only; producer decomposition missing",
        },
        "four_equality_selected_rows": {
            "source_path": str(FOUR_EQUALITY_SOURCE),
            "source_sha256": FOUR_EQUALITY_SOURCE_SHA256,
            "schemas": records,
            "distinct_clause_count": len(four_equality_union),
            "exact_current_overlap_count": len(four_equality_union & current),
            "family_block_count_sums_matching_expanded_difference": (
                matching_family_subsets
            ),
        },
        "four_role_k2": {
            "direct_clause_count": len(k2_direct),
            "direct_exact_current_overlap_count": len(k2_direct & current),
            "full_dihedral_pattern_count": len(k2_orbit) // 330,
            "full_dihedral_clause_count": len(k2_orbit),
            "full_dihedral_exact_current_overlap_count": len(k2_orbit & current),
            "full_dihedral_status": "bookkeeping; source has no transport wrapper",
        },
    }


def main() -> None:
    """Print a compact deterministic JSON audit."""

    print(json.dumps(build_audit(), sort_keys=True, separators=(",", ":")))


if __name__ == "__main__":
    main()
