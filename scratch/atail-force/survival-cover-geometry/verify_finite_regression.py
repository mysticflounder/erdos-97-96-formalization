"""Exact finite regression for the card-14 survival-cover endpoint.

This is deliberately not a Euclidean or CriticalShellSystem model.  It keeps
only the data used after the fiber/counting reduction: ten outside sources,
two survival colors, blocker fibers of size at most four, a cap label for each
blocker, and one abstract four-support for each distinct-blocker continuation
row.  The model shows that the resulting two-center packet need not have its
centers in one cap and need not supply a common support pair.
"""

from collections import Counter


SOURCES = tuple(range(10))
COLOR = {source: 0 if source < 5 else 1 for source in SOURCES}

# The two five-source colors use blocker fibers (4,1) and (4,1).
BLOCKER = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 1,
    5: 2,
    6: 2,
    7: 2,
    8: 2,
    9: 3,
}

# Within either color, the two distinct blockers occupy different caps.
BLOCKER_CAP = {0: 0, 1: 1, 2: 1, 3: 2}

# Abstract survivor rows for the forced distinct-blocker pair of each color.
# Their intersections have size one, so there is no common support pair.
ROW_SUPPORT = {
    0: frozenset({"a", "b", "c", "d"}),
    1: frozenset({"a", "e", "f", "g"}),
    2: frozenset({"h", "i", "j", "k"}),
    3: frozenset({"h", "l", "m", "n"}),
}


def verify() -> None:
    assert len(SOURCES) == 10
    assert Counter(COLOR.values()) == Counter({0: 5, 1: 5})
    assert max(Counter(BLOCKER.values()).values()) == 4

    for color in (0, 1):
        color_sources = [source for source in SOURCES if COLOR[source] == color]
        blockers = sorted({BLOCKER[source] for source in color_sources})
        assert len(blockers) == 2
        left, right = blockers
        assert BLOCKER_CAP[left] != BLOCKER_CAP[right]
        assert len(ROW_SUPPORT[left]) == 4
        assert len(ROW_SUPPORT[right]) == 4
        assert len(ROW_SUPPORT[left] & ROW_SUPPORT[right]) == 1


if __name__ == "__main__":
    verify()
    print("finite survival-cover regression: PASS")
