#!/usr/bin/env python3
"""Deterministic order audit for the live two-selected-row six-point packet."""

from itertools import permutations, product


POINTS = ("A", "B", "C", "D", "E", "F")
KNOWN_CLASSES = (
    {frozenset(("B", x)) for x in ("A", "C", "D")},
    {frozenset(("F", x)) for x in ("A", "D", "E")},
)
SIX_POINT_SCHEMAS = {
    "mirror": (
        (("a", "b"), ("a", "f")),
        (("a", "c"), ("a", "e")),
        (("d", "a"), ("d", "c"), ("d", "e")),
        (("e", "b"), ("e", "f")),
    ),
    "sparse": (
        (("a", "b"), ("a", "d"), ("a", "f")),
        (("c", "b"), ("c", "d"), ("c", "e")),
    ),
}

FIVE_POINT_SCHEMAS = {
    # FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows
    "five_direct": (
        (("b", "a"), ("b", "e")),
        (("c", "a"), ("c", "b"), ("c", "d")),
    ),
    # FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows
    "five_second": (
        (("d", "a"), ("d", "c"), ("d", "e")),
        (("e", "a"), ("e", "b")),
    ),
    # FivePointEuclideanObstruction.false_of_five_ccw_reversed_second_two_selected_rows
    "five_reversed_second": (
        (("b", "a"), ("b", "c"), ("b", "e")),
        (("a", "d"), ("a", "e")),
    ),
    # FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw
    "five_circle_isosceles": (
        (("a", "b"), ("a", "d"), ("a", "e")),
        (("e", "c"), ("e", "d")),
    ),
}


def canonical_dihedral(word):
    word = tuple(word)
    rotations = []
    for oriented in (word, tuple(reversed(word))):
        rotations.extend(
            oriented[i:] + oriented[:i] for i in range(len(oriented))
        )
    return min(rotations)


def schema_cycles(schema, variables):
    cycles = {}
    for image in permutations(POINTS, len(variables)):
        subst = dict(zip(variables, image, strict=True))
        if all(
            any(
                {
                    frozenset((subst[left], subst[right]))
                    for left, right in component
                }
                <= known
                for known in KNOWN_CLASSES
            )
            for component in schema
        ):
            cycles.setdefault(canonical_dihedral(image), image)
    return cycles


schema_cycles_by_name = {
    name: schema_cycles(schema, "abcdef")
    for name, schema in SIX_POINT_SCHEMAS.items()
}
five_schema_cycles_by_name = {
    name: schema_cycles(schema, "abcde")
    for name, schema in FIVE_POINT_SCHEMAS.items()
}


def matching_schemas(selected_cycle):
    cycle = canonical_dihedral(selected_cycle)
    matches = [
        name
        for name, cycles in schema_cycles_by_name.items()
        if cycle in cycles
    ]
    for drop in range(len(selected_cycle)):
        five_cycle = canonical_dihedral(
            selected_cycle[:drop] + selected_cycle[drop + 1 :]
        )
        matches.extend(
            name
            for name, cycles in five_schema_cycles_by_name.items()
            if five_cycle in cycles
        )
    return tuple(sorted(set(matches)))


print("selected six-point orders (A B D followed by complementary C/E/F order):")
for tail in permutations(("C", "E", "F")):
    cycle = ("A", "B", "D", *tail)
    schemas = matching_schemas(cycle)
    print(" ", "".join(tail), schemas)

print("\nfull complementary-arc multiset orders, modulo reversal:")
representatives = {}
for word in set(permutations("CCEEF")):
    reverse = tuple(reversed(word))
    representative = min(word, reverse)
    representatives.setdefault(representative, set()).add(word)

for word in sorted(representatives):
    successes = []
    for c_index, e_index in product(
        [i for i, x in enumerate(word) if x == "C"],
        [i for i, x in enumerate(word) if x == "E"],
    ):
        selected_tail = tuple(
            x
            for i, x in enumerate(word)
            if x == "F" or i == c_index or i == e_index
        )
        schemas = matching_schemas(("A", "B", "D", *selected_tail))
        if schemas:
            successes.append(("".join(selected_tail), schemas))
    status = "COVERED" if successes else "UNCOVERED"
    print(" ", "".join(word), status, sorted(set(successes)))
