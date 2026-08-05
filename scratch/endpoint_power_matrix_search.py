#!/usr/bin/env python3
"""Conservative power-pattern census for the source-faithful endpoint packet."""

from __future__ import annotations

import itertools
import json
import sys
from pathlib import Path

Z, N, U = "Z", "NZ", "U"

ROWS = (
    "O_retained",
    "Sigma_A",
    "Sigma_B",
    "Sigma_X",
    "erase_M_at_O",
    "erase_M_at_A",
    "erase_K_at_O",
    "erase_K_at_B",
)

# These anonymous columns are signature classes.  A second column with the
# same certified pattern can never occur in a unique perfect matching: swapping
# the two columns produces another possible matching.
ANON = (
    "anon_on_erase_M_at_O_off_Sigma_A",
    "anon_on_erase_K_at_O_off_Sigma_B",
)

IDENTICAL_CIRCLE_PAIRS = {
    frozenset(("Sigma_A", "erase_M_at_A")),
    frozenset(("Sigma_B", "erase_K_at_B")),
}
ACTIVE_IDENTICAL_CIRCLE_PAIRS = set(IDENTICAL_CIRCLE_PAIRS)
ACTIVE_CANONICAL_ROWS = {
    "erase_M_at_A": "Sigma_A",
    "erase_K_at_B": "Sigma_B",
}

MANDATORY_CIRCLE_GROUPS = (
    ("Sigma_A", "erase_M_at_A"),
    ("Sigma_B", "erase_K_at_B"),
)
O_RADIUS_CASES = {
    "pairwise_unidentified": (),
    "O_retained_eq_erase_M_at_O": (("O_retained", "erase_M_at_O"),),
    "O_retained_eq_erase_K_at_O": (("O_retained", "erase_K_at_O"),),
    "erase_M_at_O_eq_erase_K_at_O": (("erase_M_at_O", "erase_K_at_O"),),
    "all_three_O_centered_equal": (
        ("O_retained", "erase_M_at_O", "erase_K_at_O"),
    ),
}


def activate_circle_groups(groups):
    global ACTIVE_IDENTICAL_CIRCLE_PAIRS, ACTIVE_CANONICAL_ROWS
    ACTIVE_IDENTICAL_CIRCLE_PAIRS = set()
    ACTIVE_CANONICAL_ROWS = {}
    for group in groups:
        representative = group[0]
        for row in group:
            ACTIVE_CANONICAL_ROWS[row] = representative
        for a, b in itertools.combinations(group, 2):
            ACTIVE_IDENTICAL_CIRCLE_PAIRS.add(frozenset((a, b)))


def canonical_row(row):
    return ACTIVE_CANONICAL_ROWS.get(row, row)


def merge_circle_groups(points, facts, groups):
    merged = dict(facts)
    for group in groups:
        for point in points:
            statuses = {facts[row, point] for row in group} - {U}
            if statuses == {Z, N}:
                return None
            status = next(iter(statuses)) if statuses else U
            for row in group:
                merged[row, point] = status
    return merged


def representatives(aliases: tuple[tuple[str, str], ...]):
    parent = {x: x for x in "OCMKABJX"}

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    for a, b in aliases:
        ra, rb = find(a), find(b)
        parent[rb] = ra
    groups = {}
    for x in parent:
        groups.setdefault(find(x), []).append(x)
    names = ["=".join(v) for v in groups.values()]
    lookup = {x: "=".join(groups[find(x)]) for x in parent}
    return names, lookup


def packet(identity_name, aliases):
    named, rep = representatives(aliases)
    points = named + list(ANON)
    facts = {(r, p): U for r in ROWS for p in points}

    raw_z = {
        "O_retained": {"C", "M", "J"},
        "Sigma_A": {"C", "K"},
        "Sigma_B": {"C", "M"},
        "Sigma_X": {"J", "K"},
        "erase_M_at_A": {"C", "K"},
        "erase_K_at_B": {"C", "M"},
    }
    raw_n = {
        "O_retained": {"O"},
        "Sigma_A": {"A", "M"},
        "Sigma_B": {"B", "K"},
        "Sigma_X": {"X"},
        "erase_M_at_O": {"O"},
        "erase_M_at_A": {"A", "M"},
        "erase_K_at_O": {"O"},
        "erase_K_at_B": {"B", "K"},
    }
    for r, xs in raw_z.items():
        for x in xs:
            p = rep[x]
            if facts[r, p] == N:
                raise ValueError(f"inconsistent aliases in {identity_name}: {r},{p}")
            facts[r, p] = Z
    for r, xs in raw_n.items():
        for x in xs:
            p = rep[x]
            if facts[r, p] == Z:
                raise ValueError(f"inconsistent aliases in {identity_name}: {r},{p}")
            facts[r, p] = N
    anonymous_zero_rows = {
        "anon_on_erase_M_at_O_off_Sigma_A": ("erase_M_at_O",),
        "anon_on_erase_K_at_O_off_Sigma_B": ("erase_K_at_O",),
    }
    for point, rows in anonymous_zero_rows.items():
        for row in rows:
            facts[row, point] = Z

    # Packet overlap <= 2 plus both selected rows having cardinality four
    # supplies at least two row-1 witnesses outside the now-identified exact
    # row-2 shell.  One signature representative is enough for uniqueness:
    # two equal-signature columns would only create a column-swap matching.
    facts["Sigma_A", "anon_on_erase_M_at_O_off_Sigma_A"] = N
    facts["Sigma_B", "anon_on_erase_K_at_O_off_Sigma_B"] = N

    # The q-deleted boundary theorems identify these as the same physical
    # circles, so their complete certified status rows must stay identical.
    for point in points:
        facts["erase_M_at_A", point] = facts["Sigma_A", point]
        facts["erase_K_at_B", point] = facts["Sigma_B", point]

    # Each off-shell witness is certified distinct from O (own center), its
    # deleted endpoint, and C/K or C/M because those lie on the exact opposite
    # shell.  It is not certified fresh relative to A,B,J,X, nor is a witness
    # from one arm certified distinct from a witness from the other arm.
    safe_named_with_witness = {rep[x] for x in ("O", "C", "M", "K")}
    return points, facts, safe_named_with_witness


def columns_certified_distinct(cs, safe_named_with_witness):
    witnesses = [c for c in cs if c in ANON]
    if len(witnesses) > 1:
        return False
    if not witnesses:
        return True
    return all(c in safe_named_with_witness or c in ANON for c in cs)


def matchings(matrix, cap=16):
    n = len(matrix)
    out = []
    for perm in itertools.permutations(range(n)):
        if all(matrix[i][perm[i]] != Z for i in range(n)):
            out.append(perm)
            if cap is not None and len(out) > cap:
                break
    return out


def bounded_direct_completion(matrix, rs, cs, ms, max_total):
    """Find a completion using at most max_total primitive Z/NZ facts."""
    n = len(matrix)
    for total in range(max_total + 1):
        for target in ms:
            target_cells = {(i, target[i]) for i in range(n)}
            matching_upgrades = [(i, target[i]) for i in range(n)
                                 if matrix[i][target[i]] == U]
            if len(matching_upgrades) > total:
                continue
            alternatives = []
            for alt in ms:
                if alt != target:
                    alternatives.append({(i, alt[i]) for i in range(n)}
                                        - target_cells)
            eligible = {(i, j) for i in range(n) for j in range(n)
                        if (i, j) not in target_cells and matrix[i][j] == U}
            choices = [alt & eligible for alt in alternatives]
            if any(not x for x in choices):
                continue
            memo = set()

            def cover(uncovered, depth):
                if not uncovered:
                    return ()
                key = (tuple(sorted(uncovered)), depth)
                if key in memo or depth == 0:
                    memo.add(key)
                    return None
                pivot = min(uncovered, key=lambda k: len(choices[k]))
                for cell in choices[pivot]:
                    next_uncovered = tuple(k for k in uncovered if cell not in choices[k])
                    tail = cover(next_uncovered, depth - 1)
                    if tail is not None:
                        return (cell,) + tail
                memo.add(key)
                return None

            selected = cover(tuple(range(len(choices))), total - len(matching_upgrades))
            if selected is not None:
                return {
                    "total_new_facts": total,
                    "matching": [(rs[i], cs[target[i]], matrix[i][target[i]])
                                 for i in range(n)],
                    "nonzero_upgrades": [(rs[i], cs[j], "prove off-circle / power nonzero")
                                         for i, j in matching_upgrades],
                    "zero_upgrades": [(rs[i], cs[j], "prove on-circle / power zero")
                                      for i, j in selected],
                    "initial_possible_matchings": len(ms),
                }
    return None


def min_hitting_set(alternatives, candidates):
    """Minimum weighted candidate set meeting every alternative matching."""
    if not alternatives:
        return 0, []
    covers = {}
    for cell, weight, description in candidates:
        mask = 0
        for k, alt in enumerate(alternatives):
            if cell in alt:
                mask |= 1 << k
        if mask:
            covers[cell] = (mask, weight, description)
    full = (1 << len(alternatives)) - 1
    memo = {}

    def go(remaining):
        if not remaining:
            return 0, ()
        if remaining in memo:
            return memo[remaining]
        choices = None
        for k in range(len(alternatives)):
            if remaining & (1 << k):
                here = [cell for cell, (mask, _, _) in covers.items()
                        if mask & (1 << k)]
                if not here:
                    memo[remaining] = (10**6, ())
                    return memo[remaining]
                if choices is None or len(here) < len(choices):
                    choices = here
        best = (10**6, ())
        for cell in choices:
            mask, weight, _ = covers[cell]
            tail_cost, tail = go(remaining & ~mask)
            candidate = (weight + tail_cost, (cell,) + tail)
            if candidate[0] < best[0]:
                best = candidate
        memo[remaining] = best
        return best

    cost, cells = go(full)
    return cost, [(cell, covers[cell][2]) for cell in cells]


def direct_completion(matrix, rs, cs, ms):
    if len(ms) > 11:
        return None
    best = None
    for target in ms:
        target_cells = {(i, target[i]) for i in range(len(target))}
        matching_upgrades = [(rs[i], cs[target[i]], "prove off-circle / power nonzero")
                             for i in range(len(target))
                             if matrix[i][target[i]] == U]
        alternatives = []
        for alt in ms:
            if alt == target:
                continue
            alternatives.append({(i, alt[i]) for i in range(len(alt))}
                                - target_cells)
        candidates = []
        for i in range(len(target)):
            for j in range(len(target)):
                if (i, j) not in target_cells and matrix[i][j] == U:
                    candidates.append(((i, j), 1,
                        (rs[i], cs[j], "prove on-circle / power zero")))
        zero_cost, chosen = min_hitting_set(alternatives, candidates)
        if zero_cost >= 10**6:
            continue
        entry = {
            "total_new_facts": len(matching_upgrades) + zero_cost,
            "matching": [(rs[i], cs[target[i]], matrix[i][target[i]])
                         for i in range(len(target))],
            "nonzero_upgrades": matching_upgrades,
            "zero_upgrades": [description for _, description in chosen],
            "initial_possible_matchings": len(ms),
        }
        if best is None or entry["total_new_facts"] < best["total_new_facts"]:
            best = entry
    return best


def direct_search(points, facts, named_count, safe_named_with_witness):
    counts = {"submatrices": 0, "unique_possible": 0, "certificates": 0,
              "minimum_possible_matchings": 999,
              "minimum_positive_possible_matchings": 999}
    closest = []
    named = points[:named_count]
    named_counts = {"submatrices": 0, "unique_possible": 0, "certificates": 0,
                    "minimum_possible_matchings": 999,
                    "minimum_positive_possible_matchings": 999}
    for point_pool, dst in ((points, counts), (named, named_counts)):
        for rs in itertools.combinations(ROWS, 5):
            for cs in itertools.combinations(point_pool, 5):
                if not columns_certified_distinct(cs, safe_named_with_witness):
                    continue
                dst["submatrices"] += 1
                matrix = [[facts[r, c] for c in cs] for r in rs]
                ms = matchings(matrix, None)
                dst["minimum_possible_matchings"] = min(
                    dst["minimum_possible_matchings"], len(ms))
                if ms:
                    dst["minimum_positive_possible_matchings"] = min(
                        dst["minimum_positive_possible_matchings"], len(ms))
                if len(ms) != 1:
                    continue
                dst["unique_possible"] += 1
                perm = ms[0]
                unknown = [(rs[i], cs[perm[i]]) for i in range(5)
                           if matrix[i][perm[i]] != N]
                if not unknown:
                    dst["certificates"] += 1
    return counts, named_counts, closest[:12]


def global_direct_completion(points, facts):
    """Exact minimum completion over every 5-row/5-distinct-column minor.

    For a chosen target matching, uniqueness is equivalent to acyclicity of
    its alternating digraph.  Enumerating a topological order makes the cost
    column-separable; a small assignment DP then chooses five distinct points.
    """
    best = None
    for rs in itertools.combinations(ROWS, 5):
        if any(pair.issubset(rs) for pair in ACTIVE_IDENTICAL_CIRCLE_PAIRS):
            continue
        for order in itertools.permutations(range(5)):
            pos = {v: k for k, v in enumerate(order)}
            options = {}
            for vertex in range(5):
                for point in points:
                    match_status = facts[rs[vertex], point]
                    if match_status == Z:
                        continue
                    cost = 1 if match_status == U else 0
                    nonzero = ([(rs[vertex], point, "prove off-circle / power nonzero")]
                               if match_status == U else [])
                    zeros = []
                    valid = True
                    for other in range(5):
                        if pos[other] <= pos[vertex]:
                            continue
                        status = facts[rs[other], point]
                        if status == N:
                            valid = False
                            break
                        if status == U:
                            cost += 1
                            zeros.append((rs[other], point,
                                          "prove on-circle / power zero"))
                    if valid:
                        options[vertex, point] = (cost, nonzero, zeros)
            dp = {0: (0, [], [], [])}
            for point in points:
                new = dict(dp)
                for mask, state in dp.items():
                    for vertex in range(5):
                        if mask & (1 << vertex) or (vertex, point) not in options:
                            continue
                        extra, nonzero, zeros = options[vertex, point]
                        candidate = (state[0] + extra,
                                     state[1] + [(vertex, point)],
                                     state[2] + nonzero,
                                     state[3] + zeros)
                        newmask = mask | (1 << vertex)
                        if newmask not in new or candidate[0] < new[newmask][0]:
                            new[newmask] = candidate
                dp = new
            if 31 not in dp:
                continue
            cost, assignment, nonzero, zeros = dp[31]
            if best is None or cost < best["total_new_facts"]:
                by_vertex = dict(assignment)
                best = {
                    "total_new_facts": cost,
                    "rows": rs,
                    "points": [by_vertex[i] for i in range(5)],
                    "topological_order": [rs[i] for i in order],
                    "matching": [(rs[i], by_vertex[i], facts[rs[i], by_vertex[i]])
                                 for i in range(5)],
                    "nonzero_upgrades": nonzero,
                    "zero_upgrades": zeros,
                }
    return best


def witnessed_completion(points, facts, safe_named_with_witness, upper_bound):
    """Search sound witness-containing minors below the named-only optimum."""
    best = None
    for rs in itertools.combinations(ROWS, 5):
        if any(pair.issubset(rs) for pair in ACTIVE_IDENTICAL_CIRCLE_PAIRS):
            continue
        for cs in itertools.combinations(points, 5):
            if not any(c in ANON for c in cs):
                continue
            if not columns_certified_distinct(cs, safe_named_with_witness):
                continue
            matrix = [[facts[r, c] for c in cs] for r in rs]
            ms = matchings(matrix, None)
            candidate = bounded_direct_completion(
                matrix, rs, cs, ms, upper_bound - 1)
            if candidate is not None and (
                best is None or candidate["total_new_facts"] < best["total_new_facts"]
            ):
                best = candidate
                upper_bound = candidate["total_new_facts"]
    return best


def diff_status(a, b):
    if a == Z and b == Z:
        return Z
    if {a, b} == {Z, N}:
        return N
    return U


def difference_cell(facts, a, b, point):
    if frozenset((a, b)) in ACTIVE_IDENTICAL_CIRCLE_PAIRS:
        return Z
    return diff_status(facts[a, point], facts[b, point])


def diff_upgrade(a, b):
    if {a, b} == {Z, N}:
        return {"cost": 0, "need": "certified"}
    if a == Z and b == U:
        return {"cost": 1, "need": "second circle off point"}
    if a == U and b == Z:
        return {"cost": 1, "need": "first circle off point"}
    if a == N and b == U:
        return {"cost": 1, "need": "second circle on point"}
    if a == U and b == N:
        return {"cost": 1, "need": "first circle on point"}
    if a == U and b == U:
        return {"cost": 2, "need": "one on and the other off"}
    return {"cost": 1, "need": "direct inequality of the two nonzero powers"}


def compatible_bundle(selected, bundle):
    current = {(r, p): status for r, p, status in selected}
    return all((r, p) not in current or current[r, p] == status
               for r, p, status in bundle)


def nz_bundles(facts, a, b, point):
    """Primitive incidence additions that certify power(a)-power(b) != 0."""
    if frozenset((a, b)) in ACTIVE_IDENTICAL_CIRCLE_PAIRS:
        return []
    ca, cb = canonical_row(a), canonical_row(b)
    sa, sb = facts[a, point], facts[b, point]
    if {sa, sb} == {Z, N}:
        return [frozenset()]
    if sa == Z and sb == U:
        return [frozenset(((cb, point, N),))]
    if sa == U and sb == Z:
        return [frozenset(((ca, point, N),))]
    if sa == N and sb == U:
        return [frozenset(((cb, point, Z),))]
    if sa == U and sb == N:
        return [frozenset(((ca, point, Z),))]
    if sa == U and sb == U:
        return [frozenset(((ca, point, Z), (cb, point, N))),
                frozenset(((ca, point, N), (cb, point, Z)))]
    return []


def zero_bundles(facts, a, b, point):
    """Primitive incidence additions that certify power(a)-power(b) = 0."""
    if frozenset((a, b)) in ACTIVE_IDENTICAL_CIRCLE_PAIRS:
        return [frozenset()]
    ca, cb = canonical_row(a), canonical_row(b)
    sa, sb = facts[a, point], facts[b, point]
    if sa == Z and sb == Z:
        return [frozenset()]
    if sa == Z and sb == U:
        return [frozenset(((cb, point, Z),))]
    if sa == U and sb == Z:
        return [frozenset(((ca, point, Z),))]
    if sa == U and sb == U:
        return [frozenset(((ca, point, Z), (cb, point, Z)))]
    return []


def solve_bundle_clauses(clauses, upper_bound):
    best = None

    def go(selected):
        nonlocal best
        if len(selected) >= upper_bound or (best is not None and len(selected) >= len(best)):
            return
        unresolved = []
        for clause in clauses:
            if any(bundle.issubset(selected) for bundle in clause):
                continue
            options = [bundle for bundle in clause
                       if compatible_bundle(selected, bundle)]
            if not options:
                return
            unresolved.append(options)
        if not unresolved:
            best = frozenset(selected)
            return
        options = min(unresolved, key=lambda xs: min(
            len(bundle - selected) for bundle in xs))
        options.sort(key=lambda bundle: len(bundle - selected))
        for bundle in options:
            go(frozenset(set(selected) | set(bundle)))

    go(frozenset())
    return best


def difference_completion(points, facts, safe_named_with_witness, named_only,
                          upper_bound=99):
    best = None
    point_pool = [p for p in points if p not in ANON] if named_only else points
    for base in ROWS:
        others = [r for r in ROWS if r != base]
        for chosen in itertools.combinations(others, 4):
            circle_rows = (base,) + chosen
            if any(pair.issubset(circle_rows)
                   for pair in ACTIVE_IDENTICAL_CIRCLE_PAIRS):
                continue
            ds = tuple((r, base) for r in chosen)
            for cs in itertools.combinations(point_pool, 4):
                if not columns_certified_distinct(cs, safe_named_with_witness):
                    continue
                matrix = [[difference_cell(facts, a, b, c) for c in cs]
                          for a, b in ds]
                ms = matchings(matrix, None)
                for target in ms:
                    clauses = []
                    valid = True
                    for i in range(4):
                        bundles = nz_bundles(facts, *ds[i], cs[target[i]])
                        if not bundles:
                            valid = False
                            break
                        clauses.append(bundles)
                    if not valid:
                        continue
                    for alt in ms:
                        if alt == target:
                            continue
                        choices = []
                        for i in range(4):
                            if alt[i] == target[i]:
                                continue
                            choices.extend(zero_bundles(facts, *ds[i], cs[alt[i]]))
                        if not choices:
                            valid = False
                            break
                        clauses.append(choices)
                    if not valid:
                        continue
                    additions = solve_bundle_clauses(clauses, upper_bound)
                    if additions is not None:
                        completed = dict(facts)
                        for row, point, status in additions:
                            completed[row, point] = status
                            if row == "Sigma_A":
                                completed["erase_M_at_A", point] = status
                            if row == "Sigma_B":
                                completed["erase_K_at_B", point] = status
                        completed_matrix = [
                            [difference_cell(completed, a, b, c) for c in cs]
                            for a, b in ds
                        ]
                        completed_matchings = matchings(completed_matrix, None)
                        assert completed_matchings == [target]
                        assert all(completed_matrix[i][target[i]] == N
                                   for i in range(4))
                        upper_bound = len(additions)
                        best = {
                            "total_new_facts": len(additions),
                            "differences": ds,
                            "points": cs,
                            "matching": [(ds[i], cs[target[i]], matrix[i][target[i]])
                                         for i in range(4)],
                            "primitive_additions": sorted(additions),
                            "named_only": named_only,
                        }
                        if upper_bound == 1:
                            return best
    return best


def difference_search(points, facts, named_count, common_base,
                      safe_named_with_witness):
    pairs = []
    if common_base:
        row_sets = []
        for base in ROWS:
            others = [r for r in ROWS if r != base]
            for chosen in itertools.combinations(others, 4):
                row_sets.append(tuple((r, base) for r in chosen))
    else:
        raise ValueError("this census uses the canonical common-reference construction")

    counts = {"submatrices": 0, "unique_possible": 0, "certificates": 0,
              "minimum_possible_matchings": 999,
              "minimum_positive_possible_matchings": 999}
    named_counts = {"submatrices": 0, "unique_possible": 0, "certificates": 0,
                    "minimum_possible_matchings": 999,
                    "minimum_positive_possible_matchings": 999}
    closest = []
    named = points[:named_count]
    for point_pool, dst in ((points, counts), (named, named_counts)):
        for ds in row_sets if not common_base else list(row_sets):
            for cs in itertools.combinations(point_pool, 4):
                if not columns_certified_distinct(cs, safe_named_with_witness):
                    continue
                dst["submatrices"] += 1
                matrix = [[difference_cell(facts, a, b, c) for c in cs]
                          for a, b in ds]
                ms = matchings(matrix)
                dst["minimum_possible_matchings"] = min(
                    dst["minimum_possible_matchings"], len(ms))
                if ms:
                    dst["minimum_positive_possible_matchings"] = min(
                        dst["minimum_positive_possible_matchings"], len(ms))
                if len(ms) != 1:
                    continue
                dst["unique_possible"] += 1
                perm = ms[0]
                missing = []
                cost = 0
                for i in range(4):
                    c = cs[perm[i]]
                    if matrix[i][perm[i]] != N:
                        up = diff_upgrade(facts[ds[i][0], c], facts[ds[i][1], c])
                        cost += up["cost"]
                        missing.append({"difference": ds[i], "point": c,
                                        "powers": (facts[ds[i][0], c], facts[ds[i][1], c]),
                                        **up})
                if not missing:
                    dst["certificates"] += 1
                closest.append({
                    "differences": ds, "points": cs,
                    "matching": [(ds[i], cs[perm[i]], matrix[i][perm[i]])
                                 for i in range(4)],
                    "primitive_upgrade_cost": cost,
                    "missing_matching_entries": missing,
                    "named_only": point_pool is named,
                })
                if len(closest) > 256:
                    closest.sort(key=lambda x: (x["primitive_upgrade_cost"],
                                                len(x["missing_matching_entries"]),
                                                not x["named_only"],
                                                x["differences"], x["points"]))
                    del closest[128:]
    closest.sort(key=lambda x: (x["primitive_upgrade_cost"],
                                len(x["missing_matching_entries"]),
                                not x["named_only"],
                                x["differences"], x["points"]))
    return counts, named_counts, closest[:12]


def main():
    regimes = {
        "labels_unmerged": (),
        "A_eq_J": (("A", "J"),),
        "X_eq_C": (("X", "C"),),
        "A_eq_J_and_X_eq_C": (("A", "J"), ("X", "C")),
    }
    selected = sys.argv[1] if len(sys.argv) > 1 else None
    if selected is not None:
        regimes = {selected: regimes[selected]}
    result = {
        "schema": "endpoint-power-matrix-census-v2",
        "legend": {"Z": "certified zero", "NZ": "certified nonzero", "U": "unknown"},
        "method": {
            "direct": "all 5-row/5-column subsets; unique possible matching; sole matching all NZ",
            "difference": "four circle rows minus one common reference row; difference rank <= 3; zero for Z-Z or identical physical circles, and nonzero only Z-NZ",
            "anonymous": "only the two overlap-forced off-shell witness roles are admitted, and only beside named points from which they are certified distinct; cross-arm witnesses are never used together",
            "physical_circle_equalities": ["erase_M_at_A = Sigma_A", "erase_K_at_B = Sigma_B"],
            "overlap_consequences": [
                "at least two erase_M_at_O support points are off Sigma_A",
                "at least two erase_K_at_O support points are off Sigma_B",
            ],
            "selected_subset_warning": "the erased O-centered rows are selected four-subsets, so absence from them is not off-circle evidence",
        },
        "regimes": {},
    }
    for name, aliases in regimes.items():
        activate_circle_groups(MANDATORY_CIRCLE_GROUPS)
        points, facts, safe_named_with_witness = packet(name, aliases)
        named_count = len(points) - len(ANON)
        d_all, d_named, d_close = direct_search(
            points, facts, named_count, safe_named_with_witness)
        d_named_completion = global_direct_completion(points[:named_count], facts)
        d_witness_completion = witnessed_completion(
            points, facts, safe_named_with_witness,
            d_named_completion["total_new_facts"])
        d_completion = min(
            (x for x in (d_named_completion, d_witness_completion) if x is not None),
            key=lambda x: x["total_new_facts"])
        c_all, c_named, c_close = difference_search(
            points, facts, named_count, True, safe_named_with_witness)
        c_named_completion = difference_completion(
            points, facts, safe_named_with_witness, True)
        c_witness_completion = difference_completion(
            points, facts, safe_named_with_witness, False,
            c_named_completion["total_new_facts"])
        c_completion = min(
            (x for x in (c_named_completion, c_witness_completion) if x is not None),
            key=lambda x: x["total_new_facts"])
        radius_cases = {}
        for radius_name, extra_groups in O_RADIUS_CASES.items():
            groups = MANDATORY_CIRCLE_GROUPS + extra_groups
            activate_circle_groups(groups)
            radius_facts = merge_circle_groups(points, facts, groups)
            if radius_facts is None:
                radius_cases[radius_name] = {"consistent": False}
                continue
            rd_all, rd_named, _ = direct_search(
                points, radius_facts, named_count, safe_named_with_witness)
            rc_all, rc_named, _ = difference_search(
                points, radius_facts, named_count, True,
                safe_named_with_witness)
            radius_direct_completion = global_direct_completion(
                points[:named_count], radius_facts)
            radius_witness_direct_improvement = None
            radius_difference_improvement = None
            if radius_direct_completion is not None:
                radius_witness_direct_improvement = witnessed_completion(
                    points, radius_facts, safe_named_with_witness,
                    radius_direct_completion["total_new_facts"])
                radius_bound = min(
                    x["total_new_facts"] for x in
                    (radius_direct_completion, radius_witness_direct_improvement)
                    if x is not None)
                radius_difference_improvement = difference_completion(
                    points, radius_facts, safe_named_with_witness, False,
                    radius_bound)
            radius_cases[radius_name] = {
                "consistent": True,
                "direct_5x5": {"all": rd_all, "named_only": rd_named},
                "minimum_named_only_direct_completion": radius_direct_completion,
                "witness_direct_completion_below_named_minimum":
                    radius_witness_direct_improvement,
                "difference_completion_below_direct_minimum": radius_difference_improvement,
                "difference_4x4_common_base": {
                    "all": rc_all, "named_only": rc_named,
                },
            }
        activate_circle_groups(MANDATORY_CIRCLE_GROUPS)
        result["regimes"][name] = {
            "named_points": points[:named_count],
            "facts": {r: {p: facts[r, p] for p in points} for r in ROWS},
            "direct_5x5": {"all": d_all, "named_only": d_named,
                            "minimum_completion": d_completion,
                            "minimum_named_only_completion": d_named_completion,
                            "witness_completion_below_named_minimum": d_witness_completion,
                            "closest": d_close},
            "difference_4x4_common_base": {
                "all": c_all,
                "named_only": c_named,
                "minimum_completion": c_completion,
                "minimum_named_only_completion": c_named_completion,
                "witness_completion_below_named_minimum": c_witness_completion,
                "closest": c_close,
            },
            "possible_O_centered_radius_equalities": radius_cases,
        }
    suffix = f"_{selected}" if selected else ""
    out = Path(__file__).with_name(f"endpoint_power_matrix_census{suffix}.json")
    out.write_text(json.dumps(result, indent=2) + "\n")
    print(out)
    for regime, data in result["regimes"].items():
        print(regime,
              "direct", data["direct_5x5"]["all"],
              "diff", data["difference_4x4_common_base"]["all"])


if __name__ == "__main__":
    main()
