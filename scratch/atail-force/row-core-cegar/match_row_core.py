#!/usr/bin/env python3
"""Match the fixed seven-role row core in total selected-row shadows.

The matcher treats a row system as a directed graph: ``c -> x`` means that
``x`` belongs to the selected equal-radius row at center ``c``.  It searches
for injective embeddings of the exact eleven-equality collision core.  Extra
row memberships are allowed, since the metric theorem only consumes the
displayed equalities.

This is a scratch CEGAR diagnostic.  It does not claim that the saved finite
shadows are Euclidean or that every live critical map contains the motif.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path


HERE = Path(__file__).resolve().parent
DEFAULT_SHADOWS = HERE.parent / "global_count_boundary" / "shadows.json"
SHADOW_SCHEMA = "p97-atail-global-count-boundary-shadows-v1"
PINNED_SHADOW_SHA256 = (
    "e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c"
)

ROLES = ("A", "B", "C", "D", "E", "F", "G")

# Coordinate-free form of the exact Singular core:
#
# B : E = F = G       C : E = A = D       A : G = B
# D : E = B = A       F : C = A = G       G : E = C = D
#
# Every tuple below is one chosen equal-radius support subset.  A triple gives
# two independent equalities when compared with its first member; the pair at
# A gives one.  Thus these 17 directed incidences encode the 11 equalities.
REQUIRED_SUPPORTS: dict[str, tuple[str, ...]] = {
    "A": ("G", "B"),
    "B": ("E", "F", "G"),
    "C": ("E", "A", "D"),
    "D": ("E", "B", "A"),
    "F": ("C", "A", "G"),
    "G": ("E", "C", "D"),
}
REQUIRED_EDGES = frozenset(
    (center, member)
    for center, members in REQUIRED_SUPPORTS.items()
    for member in members
)


class MatchError(AssertionError):
    """Fail-closed input or checkpoint error."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise MatchError(message)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_shadow_file(path: Path) -> dict[str, object]:
    with path.open() as handle:
        raw = json.load(handle)
    require(isinstance(raw, dict), "shadow file must contain an object")
    require(raw.get("schema") == SHADOW_SCHEMA, "unexpected shadow schema")
    require(isinstance(raw.get("cases"), list), "shadow cases must be a list")
    return raw


def parse_rows(raw: Mapping[str, Sequence[int]]) -> dict[int, frozenset[int]]:
    centers = {int(center) for center in raw}
    require(centers == set(range(len(centers))), "row centers are not 0..n-1")
    rows: dict[int, frozenset[int]] = {}
    for center in sorted(centers):
        support_list = [int(point) for point in raw[str(center)]]
        support = frozenset(support_list)
        require(len(support) == len(support_list), f"row {center} repeats a point")
        require(center not in support, f"row {center} contains its own center")
        require(support <= centers, f"row {center} leaves the carrier")
        rows[center] = support
    return rows


def motif_automorphisms() -> list[dict[str, str]]:
    """Return all role permutations preserving the directed required edges."""

    automorphisms: list[dict[str, str]] = []
    for image in itertools.permutations(ROLES):
        mapping = dict(zip(ROLES, image, strict=True))
        mapped_edges = {
            (mapping[center], mapping[member])
            for center, member in REQUIRED_EDGES
        }
        if mapped_edges == REQUIRED_EDGES:
            automorphisms.append(mapping)
    return automorphisms


def _partial_embedding_valid(
    assignment: Mapping[str, int], rows: Mapping[int, frozenset[int]]
) -> bool:
    for center, member in REQUIRED_EDGES:
        if center in assignment and member in assignment:
            if assignment[member] not in rows[assignment[center]]:
                return False
    return True


def find_embeddings(
    rows: Mapping[int, frozenset[int]], *, injective: bool = True,
) -> list[dict[str, int]]:
    """Enumerate non-induced embeddings, injectively unless requested otherwise."""

    vertices = tuple(sorted(rows))
    required_outdegree = {
        role: len(REQUIRED_SUPPORTS.get(role, ())) for role in ROLES
    }
    candidates = {
        role: tuple(
            vertex
            for vertex in vertices
            if len(rows[vertex]) >= required_outdegree[role]
        )
        for role in ROLES
    }
    # High-degree roles first.  Ties are broken by total motif incidence, then
    # name, making the enumeration deterministic without fixing shadow labels.
    indegree = {
        role: sum(member == role for _, member in REQUIRED_EDGES) for role in ROLES
    }
    order = sorted(
        ROLES,
        key=lambda role: (
            -required_outdegree[role],
            -(required_outdegree[role] + indegree[role]),
            role,
        ),
    )
    assignment: dict[str, int] = {}
    used: set[int] = set()
    embeddings: list[dict[str, int]] = []

    def search(index: int) -> None:
        if index == len(order):
            embeddings.append({role: assignment[role] for role in ROLES})
            return
        role = order[index]
        for vertex in candidates[role]:
            if injective and vertex in used:
                continue
            assignment[role] = vertex
            if injective:
                used.add(vertex)
            if _partial_embedding_valid(assignment, rows):
                search(index + 1)
            if injective:
                used.remove(vertex)
            assignment.pop(role)

    search(0)
    return embeddings


def canonical_embedding(
    embedding: Mapping[str, int], automorphisms: Iterable[Mapping[str, str]]
) -> tuple[int, ...]:
    """Canonicalize an embedding modulo motif automorphisms."""

    variants = []
    for automorphism in automorphisms:
        # Precomposing by an automorphism preserves the embedded edge set.
        variants.append(tuple(embedding[automorphism[role]] for role in ROLES))
    return min(variants)


def cegar_clause(embedding: Mapping[str, int]) -> list[tuple[int, int]]:
    """Return the directed row atoms whose conjunction must be forbidden."""

    return sorted(
        (embedding[center], embedding[member])
        for center, member in REQUIRED_EDGES
    )


def self_check() -> None:
    """Check positive, relabeled, missing-edge, and alias-only behavior."""

    role_to_vertex = {role: index for index, role in enumerate(ROLES)}
    rows = {index: set() for index in range(len(ROLES))}
    for center, member in REQUIRED_EDGES:
        rows[role_to_vertex[center]].add(role_to_vertex[member])
    parsed = {center: frozenset(support) for center, support in rows.items()}
    hits = find_embeddings(parsed)
    require(hits, "synthetic positive motif did not match")

    permutation = {index: (3 * index + 2) % 7 for index in range(7)}
    relabeled = {
        permutation[center]: frozenset(permutation[member] for member in support)
        for center, support in parsed.items()
    }
    require(find_embeddings(relabeled), "relabeling invariance check failed")

    removed_center, removed_member = sorted(REQUIRED_EDGES)[0]
    negative = {center: set(support) for center, support in parsed.items()}
    negative[role_to_vertex[removed_center]].remove(role_to_vertex[removed_member])
    negative_rows = {
        center: frozenset(support) for center, support in negative.items()
    }
    require(not find_embeddings(negative_rows), "missing-edge negative check failed")

    # Collapsing E and B makes the certificate conclusion E=B tautological.
    # Such a homomorphism is deliberately not a CEGAR hit: carrier roles must
    # be pairwise distinct for the collision conclusion to contradict them.
    collapsed = dict(role_to_vertex)
    collapsed["E"] = collapsed["B"]
    require(
        len(set(collapsed.values())) < len(ROLES),
        "alias-only self-check did not actually alias roles",
    )
    require(
        all(len(set(hit.values())) == len(ROLES) for hit in hits),
        "matcher emitted a non-injective embedding",
    )

    automorphisms = motif_automorphisms()
    require(automorphisms, "motif has no identity automorphism")
    require(
        all(set(automorphism) == set(ROLES) for automorphism in automorphisms),
        "malformed motif automorphism",
    )


def analyze(path: Path, pin_digest: bool) -> dict[str, object]:
    raw = load_shadow_file(path)
    # Match the digest convention used by the existing fixed-shadow query and
    # audit: SHA-256 of the exact saved file bytes, not a JSON reserialization.
    digest = file_sha256(path)
    if pin_digest:
        require(
            digest == PINNED_SHADOW_SHA256,
            f"shadow digest drift: expected {PINNED_SHADOW_SHA256}, got {digest}",
        )
    automorphisms = motif_automorphisms()
    cases = []
    for case in raw["cases"]:
        require(isinstance(case, dict), "shadow case must be an object")
        require(isinstance(case.get("rows"), dict), "shadow case has no row map")
        rows = parse_rows(case["rows"])
        embeddings = find_embeddings(rows)
        homomorphisms = find_embeddings(rows, injective=False)
        noninjective_homomorphisms = [
            item for item in homomorphisms if len(set(item.values())) < len(ROLES)
        ]
        orbit_representatives = sorted(
            {canonical_embedding(embedding, automorphisms) for embedding in embeddings}
        )
        rendered_embeddings = []
        for embedding in embeddings:
            rendered_embeddings.append(
                {
                    "roles": embedding,
                    "carrier_image": sorted(embedding.values()),
                    "cegar_row_atoms": [list(atom) for atom in cegar_clause(embedding)],
                }
            )
        cases.append(
            {
                "name": case.get("name"),
                "profile": case.get("profile"),
                "embedding_count": len(embeddings),
                "embedding_orbits_mod_motif_automorphism": len(orbit_representatives),
                "role_alias_homomorphism_count": len(homomorphisms),
                "noninjective_role_alias_homomorphism_count": len(
                    noninjective_homomorphisms
                ),
                "role_alias_policy": (
                    "diagnostic only; aliases cannot instantiate the distinct-"
                    "carrier contradiction and must not produce a CEGAR cut"
                ),
                "embeddings": rendered_embeddings,
            }
        )
    return {
        "schema": "p97-atail-row-core-cegar-match-v1",
        "input": str(path),
        "input_file_sha256": digest,
        "motif": {
            "roles": list(ROLES),
            "required_directed_row_atoms": [list(edge) for edge in sorted(REQUIRED_EDGES)],
            "directed_row_atom_count": len(REQUIRED_EDGES),
            "equal_distance_equation_count": sum(
                len(members) - 1 for members in REQUIRED_SUPPORTS.values()
            ),
            "automorphism_count": len(automorphisms),
            "embedding_policy": "injective non-induced directed-subgraph embedding",
        },
        "cases": cases,
        "scope": "EXACT_EXHAUSTIVE_FOR_THE_TWO_PINNED_SAVED_FINITE_SHADOWS_ONLY",
    }


def validate_pinned_result(result: Mapping[str, object]) -> None:
    cases = {
        tuple(case["profile"]): case  # type: ignore[arg-type]
        for case in result["cases"]  # type: ignore[union-attr]
    }
    require(set(cases) == {(5, 5, 5), (4, 5, 6)}, "profile result drift")
    case_555 = cases[(5, 5, 5)]
    case_456 = cases[(4, 5, 6)]
    require(case_555["embedding_count"] == 1, "555 embedding-count drift")
    require(case_456["embedding_count"] == 0, "456 embedding-count drift")
    require(
        case_555["noninjective_role_alias_homomorphism_count"] == 0
        and case_456["noninjective_role_alias_homomorphism_count"] == 0,
        "role-alias census drift",
    )
    require(
        case_555["embeddings"][0]["roles"]  # type: ignore[index]
        == {"A": 4, "B": 1, "C": 2, "D": 5, "E": 0, "F": 8, "G": 10},
        "unique 555 role map drift",
    )
    require(
        result["motif"]["automorphism_count"] == 1,  # type: ignore[index]
        "motif automorphism-count drift",
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--shadows", type=Path, default=DEFAULT_SHADOWS)
    parser.add_argument("--check", action="store_true", help="run matcher self-checks")
    parser.add_argument(
        "--no-pin",
        action="store_true",
        help="accept an input digest other than the pinned saved-shadow digest",
    )
    args = parser.parse_args()
    if args.check:
        self_check()
    result = analyze(args.shadows, pin_digest=not args.no_pin)
    if args.check and not args.no_pin:
        validate_pinned_result(result)
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
