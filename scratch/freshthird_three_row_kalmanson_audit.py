#!/usr/bin/env python3
"""Audit the FreshThird exact-support 3-row motif in the Kalmanson cone.

This enumerates relative orders of the eight named vertices only.  It is a
theorem-discovery aid: every order satisfying one of the four live order arms
and the three shared-pair separations is checked against all strict Kalmanson
inequalities and the three selected-row radius classes.
"""

from itertools import combinations, permutations
import subprocess


LABELS = ("o", "f", "e", "s", "x", "y", "r", "t")
SUPPORT = {
    "s": {"o", "e", "x", "y"},
    "f": {"o", "e", "r", "t"},
    "e": {"x", "y", "r", "t"},
}


def between(pos, a, b, p):
    return min(pos[a], pos[b]) < pos[p] < max(pos[a], pos[b])


def order_arm(pos):
    chains = (
        ("o", "f", "e", "s", "x"),
        ("e", "f", "o", "x", "s"),
        ("x", "s", "e", "f", "o"),
        ("s", "x", "o", "f", "e"),
    )
    return any(all(pos[a] < pos[b] for a, b in zip(c, c[1:])) for c in chains)


def separated(pos):
    return (
        between(pos, "s", "f", "e") != between(pos, "s", "f", "o")
        and between(pos, "s", "e", "x") != between(pos, "s", "e", "y")
        and between(pos, "f", "e", "r") != between(pos, "f", "e", "t")
    )


def edge(a, b):
    return "d_" + "_".join(sorted((a, b)))


def smt(order):
    edges = [edge(a, b) for a, b in combinations(LABELS, 2)]
    lines = ["(set-logic QF_LRA)"]
    lines.extend(f"(declare-const {d} Real)" for d in edges)
    lines.extend(f"(assert (>= {d} 0))" for d in edges)
    for center, support in (
        ("s", ("o", "e", "x", "y")),
        ("f", ("o", "e", "r", "t")),
        ("e", ("x", "y", "r", "t")),
    ):
        base = edge(center, support[0])
        lines.extend(f"(assert (= {base} {edge(center, p)}))" for p in support[1:])
    for a, b, c, d in combinations(order, 4):
        # K2: bc + ad < ac + bd.
        lines.append(
            f"(assert (< (+ {edge(b, c)} {edge(a, d)}) "
            f"(+ {edge(a, c)} {edge(b, d)})))"
        )
        # K1: ab + cd < ac + bd.
        lines.append(
            f"(assert (< (+ {edge(a, b)} {edge(c, d)}) "
            f"(+ {edge(a, c)} {edge(b, d)})))"
        )
    lines.append("(check-sat)")
    return "\n".join(lines) + "\n"


def rotations(order):
    for cut in range(len(order)):
        yield order[cut:] + order[:cut]


def euclidean_two_row_motif(order):
    """Return a banked five-point two-row motif, if one is visible."""
    for rotated in rotations(order):
        for picked in combinations(rotated, 5):
            a, b, c, d, e = picked
            # false_of_five_ccw_two_selected_rows
            if b in SUPPORT and c in SUPPORT:
                if {a, e} <= SUPPORT[b] and {a, b, d} <= SUPPORT[c]:
                    return ("first", rotated, picked, b, c)
            # false_of_five_ccw_second_two_selected_rows
            if d in SUPPORT and e in SUPPORT:
                if {a, c, e} <= SUPPORT[d] and {a, b} <= SUPPORT[e]:
                    return ("second", rotated, picked, d, e)
            # false_of_five_ccw_reversed_second_two_selected_rows
            if b in SUPPORT and a in SUPPORT:
                if {a, c, e} <= SUPPORT[b] and {d, e} <= SUPPORT[a]:
                    return ("second-reflected", rotated, picked, b, a)
    return None


def main():
    candidates = []
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    examples = {}
    sat_orders = []
    for order in permutations(LABELS):
        pos = {label: i for i, label in enumerate(order)}
        if not order_arm(pos) or not separated(pos):
            continue
        candidates.append(order)
        result = subprocess.run(
            ["z3", "-in"], input=smt(order), text=True,
            capture_output=True, check=True,
        ).stdout.strip().splitlines()[0]
        counts[result] += 1
        examples.setdefault(result, order)
        if result == "sat":
            sat_orders.append(order)
    print(f"relative orders: {len(candidates)}")
    print("results:", counts)
    for result, order in examples.items():
        print(f"first {result}: {' < '.join(order)}")
    for order in sat_orders:
        print("sat order:", " < ".join(order))
        print("  two-row motif:", euclidean_two_row_motif(order))


if __name__ == "__main__":
    main()
