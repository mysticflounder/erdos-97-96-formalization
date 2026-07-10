"""Self-contained deterministic smoke gates for motif-cover combinatorics."""

from __future__ import annotations

import random

from .combinatorics import (
    AUTOMORPHISMS,
    apply_mapping,
    embed_into_cube,
    orbit,
    serialize_pattern,
    unlabeled_key,
)


SEED = 97_96_554
PATTERNS = (
    {0: frozenset({1, 2}), 3: frozenset({0, 4})},
    {1: frozenset({3, 5, 7}), 6: frozenset({1, 8})},
    {2: frozenset({4, 9}), 5: frozenset({2, 8}), 8: frozenset({5, 10})},
    {0: frozenset({3, 4}), 3: frozenset({4, 8, 9}), 8: frozenset({0, 4})},
)


def _relabeling_gate():
    rng = random.Random(SEED)
    for pattern in PATTERNS:
        key = unlabeled_key(pattern)
        for _ in range(25):
            mapping = list(range(11))
            rng.shuffle(mapping)
            assert unlabeled_key(apply_mapping(pattern, mapping)) == key
    print("[smoke] relabeling invariance PASS")


def _separation_gate():
    first = {0: frozenset({1, 2}), 3: frozenset({0, 4})}
    isomorphic = apply_mapping(first, [5, 7, 2, 9, 0, 1, 3, 4, 6, 8, 10])
    larger = {0: frozenset({1, 2, 4}), 3: frozenset({0, 4})}
    shared = {0: frozenset({1, 2}), 3: frozenset({1, 4})}
    disjoint = {0: frozenset({1, 2}), 3: frozenset({4, 5})}
    assert unlabeled_key(first) == unlabeled_key(isomorphic)
    assert unlabeled_key(first) != unlabeled_key(larger)
    assert unlabeled_key(shared) != unlabeled_key(disjoint)
    print("[smoke] isomorphism/separation PASS")


def _embedding_gate():
    for pattern in PATTERNS:
        cube = {center: frozenset() for center in range(11)}
        cube.update(pattern)
        key = unlabeled_key(pattern)
        embeddings = embed_into_cube(key, cube)
        assert serialize_pattern(pattern) in embeddings
        for embedded in embeddings:
            assert unlabeled_key({c: frozenset(m) for c, m in embedded}) == key
            for center, members in embedded:
                assert set(members) <= cube[center]
        for image in orbit(pattern)[:6]:
            realizing = next(
                mapping for mapping in AUTOMORPHISMS
                if apply_mapping(pattern, mapping) == image
            )
            relabeled_cube = {
                realizing[center]: frozenset(realizing[member] for member in members)
                for center, members in cube.items()
            }
            assert serialize_pattern(image) in embed_into_cube(key, relabeled_cube)
    print("[smoke] orbit containment and embedding validity PASS")


def main() -> int:
    _relabeling_gate()
    _separation_gate()
    _embedding_gate()
    print("[smoke] ALL SELF-CONTAINED MOTIF GATES PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
