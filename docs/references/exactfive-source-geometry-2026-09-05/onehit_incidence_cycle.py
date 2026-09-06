"""Exact local incidence control for a two-step one-hit blocker return.

This is not a Euclidean realization, a total critical-shell system, or a
counterexample to the physical theorem. It tests only the listed finite row
conditions. Run with uv run --no-cache --no-sync python <this file>.
"""

from itertools import combinations


def check() -> dict[str, object]:
    anchors = frozenset({"q", "w", "e1", "e2", "e3"})
    rows = {
        "O": anchors - {"q"},
        "V": frozenset({"e1", "e2", "a", "d"}),
        "U": frozenset({"w", "x", "a", "b"}),
        "C": frozenset({"w", "f", "d", "g"}),
        "T": frozenset({"q", "e1", "b", "g"}),
    }
    # Partial choices only: each named source occurs in its chosen row.
    choices = {"q": "T", "w": "U", "f": "C", "x": "U"}
    original = choices.copy()
    assert len(anchors) == 5
    assert all(len(row) == 4 for row in rows.values())
    assert all(center not in row for center, row in rows.items())
    assert all(len(left & right) <= 2 for left, right in combinations(rows.values(), 2))
    assert not ({"q", "w", "f", "x"} & rows["V"])

    visited = [choices["w"]]
    for fresh, expected in [("f", "C"), ("x", "U")]:
        old_center = choices["w"]
        next_center = choices[fresh]
        assert next_center == expected
        assert all(source in rows[center] for source, center in choices.items())
        # Strict freshness relative to all three preserved rows.
        assert fresh != "q"
        assert fresh not in anchors
        assert fresh not in rows["O"] | rows[old_center] | rows["V"]
        # New actual row has exactly one original endpoint.
        assert "q" not in rows[next_center]
        assert "w" in rows[next_center]
        assert next_center not in {"O", "V", old_center, choices["q"]}
        before = choices.copy()
        choices["w"] = next_center
        assert all(choices[z] == before[z] for z in choices if z != "w")
        visited.append(next_center)

    assert choices == original
    # The exact row-cover condition that would forbid this immediate return fails.
    return_candidates = rows["U"] - (rows["O"] | rows["C"] | rows["V"])
    assert return_candidates == {"x", "b"}
    return {
        "scope": "local incidence only; no metric or global minimality claim",
        "center_cycle": visited,
        "partial_choices_restored": choices == original,
        "return_candidates": sorted(return_candidates),
        "rows": {center: sorted(row) for center, row in rows.items()},
    }


if __name__ == "__main__":
    import json

    print(json.dumps(check(), sort_keys=True))
