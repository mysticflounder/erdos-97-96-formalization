#!/usr/bin/env python3
"""Independent exact readback for the dangerous-triple shell-cut wave."""
from __future__ import annotations

import itertools
import json
import pathlib
import sys

LABELS = ("p", "q", "u", "a0", "a1", "t1", "t2", "t3")
CENTERS = ("u", "a0", "a1", "t1", "t2", "t3")
CIRCLE = frozenset(("q", "t1", "t2", "t3"))


def domain(mode: str, center: str) -> list[frozenset[str]]:
    rows = []
    for raw in itertools.combinations(LABELS, 4):
        support = frozenset(raw)
        if center in support:
            continue
        if mode == "Q" and "q" in support:
            continue
        if mode == "S" and "q" not in support:
            continue
        if len(support & CIRCLE) > 2 or len(support - CIRCLE) < 2:
            continue
        rows.append(support)
    return rows


def count(modes: str) -> int:
    domains = [domain(modes[i], CENTERS[i]) for i in range(6)]
    total = 0
    chosen: list[frozenset[str]] = []

    def go(i: int) -> None:
        nonlocal total
        if i == 6:
            if sum(modes[j] == "S" and "p" in chosen[j] for j in range(6)) >= 3:
                return
            total += 1
            return
        for support in domains[i]:
            if all(len(support & prior) <= 2 for prior in chosen):
                chosen.append(support)
                go(i + 1)
                chosen.pop()

    go(0)
    return total


def main(path: pathlib.Path) -> None:
    payload = json.loads(path.read_text())
    for row in payload["mode_rows"]:
        expected = count(row["modes"])
        assert expected == row["models_after_cut"], (row["modes"], expected, row)
        assert row["z3"] == ("sat" if expected else "unsat")
        assert row["cvc5"] == ("sat" if expected else "unsat")
        for example in row["examples"]:
            supports = [frozenset(item["support"]) for item in example]
            assert all(len(supports[i] & supports[j]) <= 2
                       for i, j in itertools.combinations(range(6), 2))
            assert sum(row["modes"][j] == "S" and "p" in supports[j]
                       for j in range(6)) <= 2
    assert sum(row["models_after_cut"] for row in payload["mode_rows"]) == \
        payload["totals"]["support_tuples_after_cut"]
    print("readback: PASS (64 mode assignments, exact counts and retained models)")


if __name__ == "__main__":
    target = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else pathlib.Path("results.json")
    main(target)
