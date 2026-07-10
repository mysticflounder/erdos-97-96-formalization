"""Small, dependency-free combinatorial core for the Census554 profile."""

from __future__ import annotations

from itertools import permutations
from typing import Iterable, Mapping


N = 11
FREE_BLOCKS = ((3, 4, 5), (6, 7, 8), (9, 10))


def automorphisms() -> tuple[tuple[int, ...], ...]:
    """The 72 label automorphisms fixing 0, 1, 2 and each cap interior."""

    result = []
    for first in permutations(FREE_BLOCKS[0]):
        for second in permutations(FREE_BLOCKS[1]):
            for third in permutations(FREE_BLOCKS[2]):
                mapping = list(range(N))
                for block, image in zip(FREE_BLOCKS, (first, second, third)):
                    for source, target in zip(block, image):
                        mapping[source] = target
                result.append(tuple(mapping))
    return tuple(result)


AUTOMORPHISMS = automorphisms()


def support(pattern: Mapping[int, Iterable[int]]) -> tuple[int, ...]:
    points = set(pattern)
    for members in pattern.values():
        points.update(members)
    return tuple(sorted(points))


def serialize_pattern(
    pattern: Mapping[int, Iterable[int]],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(sorted(
        (int(center), tuple(sorted(int(member) for member in members)))
        for center, members in pattern.items()
    ))


def apply_mapping(
    pattern: Mapping[int, Iterable[int]], mapping: Mapping[int, int] | tuple[int, ...]
) -> dict[int, frozenset[int]]:
    return {
        mapping[int(center)]: frozenset(mapping[int(member)] for member in members)
        for center, members in pattern.items()
    }


def canonical_pattern(
    pattern: Mapping[int | str, Iterable[int]],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    """Canonical pattern under the fixed 72-element profile group."""

    native = {int(center): tuple(int(member) for member in members)
              for center, members in pattern.items()}
    return min(
        serialize_pattern(apply_mapping(native, mapping))
        for mapping in AUTOMORPHISMS
    )


def orbit_with_maps(
    pattern: Mapping[int, Iterable[int]],
) -> tuple[tuple[dict[int, frozenset[int]], dict[int, int]], ...]:
    """Distinct fixed-profile images and deterministic support maps."""

    native = {int(center): frozenset(int(member) for member in members)
              for center, members in pattern.items()}
    points = support(native)
    images = {}
    for mapping in AUTOMORPHISMS:
        image = apply_mapping(native, mapping)
        key = serialize_pattern(image)
        point_map = {point: mapping[point] for point in points}
        old = images.get(key)
        if old is None or tuple(sorted(point_map.items())) < tuple(sorted(old[1].items())):
            images[key] = (image, point_map)
    return tuple(images[key] for key in sorted(images))


def orbit(pattern: Mapping[int, Iterable[int]]) -> tuple[dict[int, frozenset[int]], ...]:
    return tuple(image for image, _ in orbit_with_maps(pattern))


def _invariant(pattern: Mapping[int, frozenset[int]], point: int):
    out_degree = len(pattern.get(point, ()))
    in_degree = sum(point in members for members in pattern.values())
    memberships = tuple(sorted(
        len(members) for members in pattern.values() if point in members
    ))
    return out_degree, in_degree, memberships


def unlabeled_key_with_map(
    pattern: Mapping[int, Iterable[int]],
) -> tuple[tuple[tuple[int, tuple[int, ...]], ...], dict[int, int]]:
    """Canonical motif under arbitrary support relabeling, with its map."""

    native = {int(center): frozenset(int(member) for member in members)
              for center, members in pattern.items()}
    points = support(native)
    blocks = {}
    for point in points:
        blocks.setdefault(_invariant(native, point), []).append(point)
    block_keys = sorted(blocks)
    best = None
    best_map = None

    def search(block_index, label_of, next_label):
        nonlocal best, best_map
        if block_index == len(block_keys):
            serialized = serialize_pattern(apply_mapping(native, label_of))
            map_key = tuple(sorted(label_of.items()))
            if (best is None or serialized < best
                    or (serialized == best
                        and map_key < tuple(sorted(best_map.items())))):
                best = serialized
                best_map = dict(label_of)
            return
        for permuted in permutations(blocks[block_keys[block_index]]):
            extended = dict(label_of)
            label = next_label
            for point in permuted:
                extended[point] = label
                label += 1
            search(block_index + 1, extended, label)

    search(0, {}, 0)
    return best, best_map


def unlabeled_key(
    pattern: Mapping[int, Iterable[int]],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return unlabeled_key_with_map(pattern)[0]


def embed_into_cube_with_maps(
    key: tuple[tuple[int, tuple[int, ...]], ...],
    cube: Mapping[int, Iterable[int]],
) -> dict[tuple[tuple[int, tuple[int, ...]], ...], dict[int, int]]:
    """All candidate-feasible support injections of a canonical motif."""

    centers = {center: frozenset(members) for center, members in key}
    frozen_cube = {int(center): frozenset(members)
                   for center, members in cube.items()}
    nodes = support(centers)
    order = sorted(
        nodes,
        key=lambda node: -(len(centers.get(node, ()))
                           + (100 if node in centers else 0)),
    )

    def compatible(assignment):
        for center, members in centers.items():
            if center not in assignment:
                continue
            chosen = frozen_cube[assignment[center]]
            for member in members:
                if member in assignment and assignment[member] not in chosen:
                    return False
        return True

    output = {}
    assignment = {}
    used = set()

    def search(index):
        if index == len(order):
            image = apply_mapping(centers, assignment)
            serialized = serialize_pattern(image)
            point_map = dict(assignment)
            old = output.get(serialized)
            if (old is None
                    or tuple(sorted(point_map.items())) < tuple(sorted(old.items()))):
                output[serialized] = point_map
            return
        node = order[index]
        for target in range(N):
            if target in used:
                continue
            if (node in centers
                    and len(frozen_cube[target]) < len(centers[node])):
                continue
            assignment[node] = target
            used.add(target)
            if compatible(assignment):
                search(index + 1)
            used.remove(target)
            del assignment[node]

    search(0)
    return output


def embed_into_cube(key, cube):
    return set(embed_into_cube_with_maps(key, cube))
