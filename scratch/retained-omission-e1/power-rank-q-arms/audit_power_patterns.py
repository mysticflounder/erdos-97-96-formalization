#!/usr/bin/env python3
"""Audit the sound named-point power patterns in the two retained Q arms.

Z means a proved circle membership, N a proved nonmembership (or the
positive-radius center entry), and U genuinely unknown.  Possible matchings
use N and U; a determinant certificate additionally requires every selected
matching edge to be N.
"""

from __future__ import annotations

import itertools
import json


Z, N, U = "Z", "N", "U"

ROWS = ("K", "D", "F", "A1", "A2")

PATTERNS = {
    "paired": {
        "columns": ("k", "d", "a", "bk", "bd"),
        "matrix": {
            "K":  {"k": Z, "d": N, "a": U, "bk": N, "bd": U},
            "D":  {"k": N, "d": Z, "a": U, "bk": U, "bd": N},
            "F":  {"k": Z, "d": Z, "a": N, "bk": U, "bd": U},
            "A1": {"k": U, "d": U, "a": N, "bk": U, "bd": U},
            "A2": {"k": U, "d": U, "a": N, "bk": U, "bd": U},
        },
    },
    "fresh": {
        "columns": ("k", "d", "f", "a", "bk", "bd"),
        "matrix": {
            "K":  {"k": Z, "d": N, "f": U, "a": U, "bk": N, "bd": U},
            "D":  {"k": Z, "d": Z, "f": N, "a": U, "bk": U, "bd": N},
            "F":  {"k": Z, "d": Z, "f": U, "a": N, "bk": U, "bd": U},
            "A1": {"k": U, "d": U, "f": U, "a": N, "bk": U, "bd": U},
            "A2": {"k": U, "d": U, "f": U, "a": N, "bk": U, "bd": U},
        },
    },
}


def surviving_permutations(matrix: list[list[str]]) -> list[tuple[int, ...]]:
    n = len(matrix)
    return [
        perm
        for perm in itertools.permutations(range(n))
        if all(matrix[i][perm[i]] != Z for i in range(n))
    ]


def certified_unique(matrix: list[list[str]]) -> tuple[int, tuple[int, ...] | None]:
    surviving = surviving_permutations(matrix)
    if len(surviving) != 1:
        return len(surviving), None
    perm = surviving[0]
    if not all(matrix[i][perm[i]] == N for i in range(len(matrix))):
        return 1, None
    return 1, perm


def submatrix(table, rows, columns):
    return [[table[row][column] for column in columns] for row in rows]


def difference_status(left: str, base: str) -> str:
    if left == Z and base == Z:
        return Z
    if {left, base} == {Z, N}:
        return N
    return U


def max_unique_minor(table, columns):
    hits = []
    for size in range(1, min(len(ROWS), len(columns)) + 1):
        for rows in itertools.combinations(ROWS, size):
            for cols in itertools.combinations(columns, size):
                matrix = submatrix(table, rows, cols)
                count, matching = certified_unique(matrix)
                if matching is not None:
                    hits.append({
                        "size": size,
                        "rows": rows,
                        "columns": cols,
                        "matching": matching,
                    })
    maximum = max((hit["size"] for hit in hits), default=0)
    return maximum, [hit for hit in hits if hit["size"] == maximum]


def row_difference_audit(table, columns):
    hits = []
    lower_bound_hits = []
    for base in ROWS:
        rows = tuple(row for row in ROWS if row != base)
        diff = {
            row: {
                col: difference_status(table[row][col], table[base][col])
                for col in columns
            }
            for row in rows
        }
        for size in range(1, min(4, len(columns)) + 1):
            for chosen_rows in itertools.combinations(rows, size):
                for cols in itertools.combinations(columns, size):
                    matrix = submatrix(diff, chosen_rows, cols)
                    count, matching = certified_unique(matrix)
                    if matching is None:
                        continue
                    hit = {"size": size, "base": base, "rows": chosen_rows,
                           "columns": cols, "matching": matching}
                    lower_bound_hits.append(hit)
                    if size == 4:
                        hits.append(hit)
    maximum = max((hit["size"] for hit in lower_bound_hits), default=0)
    return hits, maximum, [
        hit for hit in lower_bound_hits if hit["size"] == maximum
    ]


def max_fooling_set(table, columns):
    hits = []
    for size in range(1, min(len(ROWS), len(columns)) + 1):
        for rows in itertools.combinations(ROWS, size):
            for cols in itertools.combinations(columns, size):
                for perm in itertools.permutations(cols):
                    if not all(table[row][col] == N for row, col in zip(rows, perm)):
                        continue
                    if all(
                        table[rows[i]][perm[j]] == Z or table[rows[j]][perm[i]] == Z
                        for i in range(size) for j in range(i + 1, size)
                    ):
                        hits.append({"size": size, "rows": rows, "columns": perm})
    maximum = max((hit["size"] for hit in hits), default=0)
    return maximum, [hit for hit in hits if hit["size"] == maximum]


def minimum_hitting_set(constraints):
    """Return a minimum set meeting every finite nonempty constraint."""
    constraints = [frozenset(item) for item in constraints]
    constraints = [item for item in constraints if item]
    best = None

    def visit(chosen, pending):
        nonlocal best
        if best is not None and len(chosen) >= len(best):
            return
        pending = [item for item in pending if item.isdisjoint(chosen)]
        if not pending:
            best = frozenset(chosen)
            return
        pivot = min(pending, key=len)
        for cell in sorted(pivot):
            visit(chosen | {cell}, pending)

    visit(set(), constraints)
    return best


def minimum_certificate_completion(table, columns):
    """Fewest new Z/N classifications yielding a corrected 5x5 certificate."""
    best = None
    for cols in itertools.combinations(columns, 5):
        matrix = submatrix(table, ROWS, cols)
        for matching in itertools.permutations(range(5)):
            if any(matrix[i][matching[i]] == Z for i in range(5)):
                continue
            matching_cells = {(i, matching[i]) for i in range(5)}
            add_nonzero = {
                (ROWS[i], cols[matching[i]])
                for i in range(5) if matrix[i][matching[i]] == U
            }
            constraints = []
            impossible = False
            for alternate in itertools.permutations(range(5)):
                if alternate == matching:
                    continue
                if any(matrix[i][alternate[i]] == Z for i in range(5)):
                    continue
                zeroable = {
                    (i, alternate[i])
                    for i in range(5)
                    if matrix[i][alternate[i]] == U
                    and (i, alternate[i]) not in matching_cells
                }
                if not zeroable:
                    impossible = True
                    break
                constraints.append(zeroable)
            if impossible:
                continue
            zero_cells = minimum_hitting_set(constraints)
            if zero_cells is None:
                continue
            add_zero = {(ROWS[i], cols[j]) for i, j in zero_cells}
            candidate = {
                "columns": cols,
                "matching": tuple((ROWS[i], cols[matching[i]]) for i in range(5)),
                "add_nonzero": tuple(sorted(add_nonzero)),
                "add_zero": tuple(sorted(add_zero)),
            }
            score = (len(add_nonzero) + len(add_zero), len(add_nonzero),
                     len(add_zero), candidate["matching"])
            if best is None or score < best[0]:
                best = (score, candidate)
    return None if best is None else best[1]


def audit(name, payload):
    columns = payload["columns"]
    table = payload["matrix"]
    five_hits = []
    for cols in itertools.combinations(columns, 5):
        matrix = submatrix(table, ROWS, cols)
        count, matching = certified_unique(matrix)
        if matching is not None:
            five_hits.append({"columns": cols, "matching": matching})
    max_minor, max_minor_hits = max_unique_minor(table, columns)
    max_fooling, max_fooling_hits = max_fooling_set(table, columns)
    difference_hits, difference_max, difference_max_hits = row_difference_audit(
        table, columns
    )
    n_neighbors = {
        row: [col for col in columns if table[row][col] == N] for row in ROWS
    }
    return {
        "arm": name,
        "rows": ROWS,
        "columns": columns,
        "status_matrix": table,
        "certified_nonzero_neighbors": n_neighbors,
        "five_by_five_certificate_count": len(five_hits),
        "five_by_five_certificates": five_hits,
        "max_certified_unique_minor": max_minor,
        "max_certified_unique_minor_examples": max_minor_hits[:10],
        "row_difference_four_by_four_certificate_count": len(difference_hits),
        "max_certified_unique_row_difference_minor": difference_max,
        "max_certified_unique_row_difference_minor_examples":
            difference_max_hits[:10],
        "max_named_fooling_set": max_fooling,
        "max_named_fooling_set_examples": max_fooling_hits[:10],
        "minimum_new_facts_for_a_named_five_by_five_certificate":
            minimum_certificate_completion(table, columns),
    }


def main():
    print(json.dumps({name: audit(name, payload) for name, payload in PATTERNS.items()},
                     indent=2))


if __name__ == "__main__":
    main()
