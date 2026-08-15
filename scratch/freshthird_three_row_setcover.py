"""Minimize local-order motifs for the FreshThird three-row exact-support arm."""

from __future__ import annotations

from itertools import permutations
from pathlib import Path
import re


ROLES = ("S", "F", "E", "X", "A", "B", "R", "T")
ROWS = {
    "S": frozenset(("A", "B", "E", "X")),
    "F": frozenset(("E", "X", "R", "T")),
    "E": frozenset(("A", "B", "R", "T")),
}


def between(order: tuple[str, ...], u: str, v: str, w: str) -> bool:
    pos = {x: i for i, x in enumerate(order)}
    return min(pos[u], pos[v]) < pos[w] < max(pos[u], pos[v])


def separated(order: tuple[str, ...], u: str, v: str, p: str, q: str) -> bool:
    return between(order, u, v, p) != between(order, u, v, q)


def admissible(order: tuple[str, ...]) -> bool:
    return (
        separated(order, "S", "F", "E", "X")
        and separated(order, "S", "E", "A", "B")
        and separated(order, "F", "E", "R", "T")
    )


def equality_available(mapping: tuple[str, ...], code: str) -> bool:
    center, left, right = (mapping[int(x)] for x in code)
    return center in ROWS and left in ROWS[center] and right in ROWS[center]


def mapping_available(mapping: tuple[str, ...], codes: tuple[str, ...]) -> bool:
    return all(equality_available(mapping, code) for code in codes)


def cyclically_ordered(order: tuple[str, ...], mapping: tuple[str, ...]) -> bool:
    for cut in range(len(order)):
        rotated = order[cut:] + order[:cut]
        if tuple(sorted(mapping, key=rotated.index)) == mapping:
            return True
    return False


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    schemas = root / "lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean"
    text = schemas.read_text()
    found = sorted(set(re.findall(
        r"false_of_(four|five|six)_ccw_three_shell_equalities_([0-9_]+)", text
    )))
    sizes = {"four": 4, "five": 5, "six": 6}
    kinds: list[tuple[str, int, tuple[str, ...]]] = [
        (f"k_{word}_{codes}", sizes[word], tuple(codes.split("_")))
        for word, codes in found
    ]
    kinds += [
        ("direct_five_a", 5, ("104", "201", "203")),
        ("direct_five_b", 5, ("302", "324", "401")),
        ("direct_six", 6, ("102", "103", "503", "504")),
    ]

    # The Lean consumer cyclically re-cuts the ambient boundary at S, so S is
    # the first local role and only the remaining seven positions vary.
    universe = tuple(
        ("S", *tail)
        for tail in permutations(tuple(role for role in ROLES if role != "S"))
        if admissible(("S", *tail))
    )
    candidates: dict[tuple[str, tuple[str, ...]], frozenset[int]] = {}
    for kind, size, codes in kinds:
        for mapping in permutations(ROLES, size):
            if not mapping_available(mapping, codes):
                continue
            covered = frozenset(
                i for i, order in enumerate(universe)
                if cyclically_ordered(order, mapping)
            )
            if covered:
                candidates[(kind, mapping)] = covered

    uncovered = set(range(len(universe)))
    selected: list[tuple[tuple[str, tuple[str, ...]], frozenset[int]]] = []
    while uncovered:
        key, cover = max(
            candidates.items(),
            key=lambda item: (len(item[1] & uncovered), len(item[1]), item[0]),
        )
        gain = cover & uncovered
        if not gain:
            print(
                f"schemas={len(found)} orders={len(universe)} "
                f"candidates={len(candidates)} selected={len(selected)} "
                f"uncovered={len(uncovered)}"
            )
            for i in sorted(uncovered)[:20]:
                print("uncovered", " ".join(universe[i]))
            raise RuntimeError(f"uncovered orders remain: {len(uncovered)}")
        selected.append((key, cover))
        uncovered -= gain

    print(f"schemas={len(found)} orders={len(universe)} candidates={len(candidates)} motifs={len(selected)}")
    for index, ((kind, mapping), cover) in enumerate(selected):
        print(f"{index:02d} {kind:70s} {' '.join(mapping):15s} covers={len(cover)}")


if __name__ == "__main__":
    main()
