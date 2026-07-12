"""Exact Python replica of the committed Lean native-classifier DFS.

M1 STOP-gate PRE-STAGE for the ERASE card-11 finite closure
(scratch/erase-classifier-design/DESIGN.md, section 6 M1).  EMPIRICAL ONLY:
this replica licenses no Lean claim.  Its purpose is an early read on risk R2
("the searches may not all kill") while the Lean build freeze is active.

Replicated sources (committed, read from the tree this session):

  lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClassifier.lean
      localCandidateOK, candidateRows, rowsCompatible, pairBoundOK,
      compatibleWith, equality closure (union-find over 121 edge codes),
      duplicateCenterCore, exactPinnedOffCircleCore, perpendicularBisectorCore,
      convexFivePointCore, hasPrefixCore, sortDomains, restrictDomain,
      allKilled, fixedPinnedRow, variableCenters, placementCheck.
  lean/Erdos9796Proof/P97/EndpointCertificate/EndpointNativeClassifier.lean
      fixedEndpointLeft/RightRow, variableCentersRight,
      exactEndpointOffCircleCoreAt2, hasPrefixCoreRight, allKilledRight,
      endpointLeft/RightPlacementCheck.
  lean/Erdos9796Proof/P97/Census554/CapSelectedBVRoleBank.lean
      labels, pairCodes, tripleCodes (regenerated combinatorially; run_smoke.py
      parses the Lean literals and asserts set equality).

The ERASE-facing entry point is `erased_placement_check(c0, support, deleted)`
-- the parametric `erasedPlacementCheckAt` of DESIGN.md section 2.1.  At
c0 = 1 it coincides definitionally with the committed `placementCheck` shape
(same variable centers [0,2,...,10], same center-1-keyed off-circle detector),
and at c0 = 2 with `endpointRightPlacementCheck`'s shape; the smoke tests
exploit this to validate the exact code path the main run uses.

Notes on rigor:
  * Every quantity is a Python int / bool.  The committed classifier is purely
    combinatorial (Nat masks + union-find); no rational or floating arithmetic
    exists anywhere in the decision path.
  * Two detector implementations are provided: LITERAL (direct transcription
    of the Lean code, iterating tripleCodes/pairCodes with edgesEqual) and
    OPTIMIZED (root-group based, provably equivalent).  run_smoke.py
    cross-checks them on randomly sampled closures; the searches use the
    optimized ones.
  * Deviations from literal Lean structure, each with an equivalence argument
    in comments at the site:
      (D1) restrictDomain is applied incrementally (new row only) instead of
           re-filtering against the whole assigned list;
      (D2) pairBoundOK iterates the row's own 6 contained pair codes instead
           of all 55 pairCodes;
      (D3) the redundant `compatibleWith assigned row` re-check at expansion
           is asserted (debug mode) rather than recomputed in the main run;
      (D4) detector cores use root-group scans instead of code-list scans.
"""

from __future__ import annotations

import time

# ---------------------------------------------------------------------------
# Role bank (CapSelectedBVRoleBank.lean).
# labels : List Nat := [0, ..., 10]
# pairCodes = { 11*a + b | 0 <= a < b <= 10 }        (55 codes, verified by
# tripleCodes = { 121*p + 11*q + r | p < q < r }     run_smoke.py against the
#                                                    Lean literals)
# fiveRoleCodes / sixRoleCodes are NOT used by hasPrefixCore and are omitted.
# ---------------------------------------------------------------------------

LABELS = list(range(11))
PAIR_CODES = [11 * a + b for a in range(11) for b in range(a + 1, 11)]
TRIPLE_CODES = [
    121 * p + 11 * q + r
    for p in range(11)
    for q in range(p + 1, 11)
    for r in range(q + 1, 11)
]

# hullPosition (CapSelectedNativeClassifier.lean:56-68), label -> hull slot.
HULL_POS = {0: 0, 9: 1, 10: 2, 1: 3, 3: 4, 4: 5, 5: 6, 6: 7, 2: 8, 7: 9, 8: 10}

# cyclicOffset l r = (hullPosition r + 11 - hullPosition l) % 11
OFFSET = [
    [(HULL_POS[r] + 11 - HULL_POS[l]) % 11 for r in range(11)] for l in range(11)
]


def edge_code(left: int, right: int) -> int:
    """edgeCode (line 165): 11*min + max."""
    return 11 * left + right if left < right else 11 * right + left


EDGE = [[edge_code(l, r) for r in range(11)] for l in range(11)]

INTS_MASK = (1 << 3) | (1 << 4) | (1 << 5) | (1 << 6)  # intS = {3,4,5,6}

# ---------------------------------------------------------------------------
# Row-level predicates (CapSelectedNativeClassifier.lean:42-121).
# A row is a pair (center, support-mask).
# ---------------------------------------------------------------------------


def has(mask: int, point: int) -> bool:
    return (mask >> point) & 1 == 1


def count_points(mask: int, points) -> int:
    return sum((mask >> p) & 1 for p in points)


def support_points(mask: int):
    """supportPoints: ascending label order (labels.filter)."""
    return [p for p in LABELS if (mask >> p) & 1]


def moser_one_hit_ok(center: int, support: int) -> bool:
    if center == 0:
        return (
            count_points(support, (2, 7, 8)) <= 1
            and count_points(support, (1, 9, 10)) <= 1
        )
    if center == 1:
        return (
            count_points(support, (2, 3, 4, 5, 6)) <= 1
            and count_points(support, (0, 9, 10)) <= 1
        )
    if center == 2:
        return (
            count_points(support, (1, 3, 4, 5, 6)) <= 1
            and count_points(support, (0, 7, 8)) <= 1
        )
    return True


def cap_selected_count_ok(center: int, support: int) -> bool:
    if 1 <= center <= 6:
        return count_points(support, (1, 2, 3, 4, 5, 6)) == (1 if center <= 2 else 2)
    return True


def local_candidate_ok(center: int, deleted: int, support: int) -> bool:
    """localCandidateOK (line 108)."""
    return (
        count_points(support, LABELS) == 4
        and not has(support, center)
        and moser_one_hit_ok(center, support)
        and (count_points(support, (0, 1, 2)) <= 2 if 3 <= center else True)
        and cap_selected_count_ok(center, support)
        and (has(support, deleted) if center == 0 else True)
    )


def candidate_rows(center: int, deleted: int):
    """candidateRows (line 116): ascending support order over range 2048."""
    return [
        (center, support)
        for support in range(2048)
        if local_candidate_ok(center, deleted, support)
    ]


# ---------------------------------------------------------------------------
# Pairwise row compatibility (lines 123-163).
# ---------------------------------------------------------------------------


def all_empty_common(left: int, right: int, points) -> bool:
    common = left & right
    return all(not ((common >> p) & 1) for p in points)


def q3_pair_ok(c: int, d: int, L: int, R: int) -> bool:
    if (c == 0 and d == 1) or (c == 1 and d == 0):
        return all_empty_common(L, R, (9, 10)) and (
            all_empty_common(L, R, (3, 4, 5, 6)) or all_empty_common(L, R, (7, 8))
        )
    if (c == 0 and d == 2) or (c == 2 and d == 0):
        return all_empty_common(L, R, (7, 8)) and (
            all_empty_common(L, R, (3, 4, 5, 6)) or all_empty_common(L, R, (9, 10))
        )
    if (c == 1 and d == 2) or (c == 2 and d == 1):
        return all_empty_common(L, R, (3, 4, 5, 6)) and (
            all_empty_common(L, R, (7, 8)) or all_empty_common(L, R, (9, 10))
        )
    return True


def cyclic_between(left: int, right: int, point: int) -> bool:
    point_off = OFFSET[left][point]
    right_off = OFFSET[left][right]
    return 0 < point_off < right_off


def cyclic_separated(left: int, right: int, first: int, second: int) -> bool:
    return cyclic_between(left, right, first) != cyclic_between(left, right, second)


def cross_separation_ok(cL: int, cR: int, L: int, R: int) -> bool:
    """crossSeparationOK: keys off the first two common points in ascending
    label order (commonPoints filters `labels`, which is ascending)."""
    common = L & R
    pts = [p for p in LABELS if (common >> p) & 1]
    if len(pts) >= 2:
        return cyclic_separated(cL, cR, pts[0], pts[1])
    return True


def rows_compatible(left, right) -> bool:
    """rowsCompatible (line 146).  countPoints L (supportPoints R) = |L & R|."""
    cL, L = left
    cR, R = right
    return (
        (L & R).bit_count() <= 2
        and q3_pair_ok(cL, cR, L, R)
        and cross_separation_ok(cL, cR, L, R)
    )


# Memo: rowsCompatible is a pure function of the two rows.
_COMPAT: dict = {}


def rows_compatible_memo(left, right) -> bool:
    key = (left[0] * 2048 + left[1], right[0] * 2048 + right[1])
    v = _COMPAT.get(key)
    if v is None:
        v = rows_compatible(left, right)
        _COMPAT[key] = v
    return v


def row_pairs(support: int):
    """The pair codes contained in a 4-point support (exactly C(4,2) = 6).

    (D2) pairBoundOK (line 157) iterates all 55 pairCodes and skips codes the
    row does not contain; a 4-point row contains exactly the 6 codes
    {11a+b : a<b, both in support} and every such code is in pairCodes, so
    iterating the row's own pairs is equivalent.
    """
    pts = support_points(support)
    return tuple(
        11 * pts[i] + pts[j]
        for i in range(len(pts))
        for j in range(i + 1, len(pts))
    )


_ROW_PAIRS: dict = {}


def row_pairs_memo(support: int):
    v = _ROW_PAIRS.get(support)
    if v is None:
        v = row_pairs(support)
        _ROW_PAIRS[support] = v
    return v


# ---------------------------------------------------------------------------
# Equality closure: union-find over the 121 edge codes (lines 168-201).
# ---------------------------------------------------------------------------


def uf_root(parents: list, e: int) -> int:
    """root (line 176).  The Lean fuel (121) only guards termination; parent
    chains are acyclic, so a plain walk is equivalent.  Path compression
    preserves the partition; no state leaks across DFS nodes because every
    node rebuilds its closure fresh (equality_closure starts from
    list(range(121)) and assigned lists are never mutated in place)."""
    r = e
    while parents[r] != r:
        r = parents[r]
    while parents[e] != r:
        parents[e], e = r, parents[e]
    return r


def union_edges(parents: list, left: int, right: int) -> None:
    """unionEdges (line 179): parents[rightRoot] := leftRoot."""
    lr = uf_root(parents, left)
    rr = uf_root(parents, right)
    if lr != rr:
        parents[rr] = lr


def add_row_equalities(parents: list, row) -> None:
    """addRowEqualities (line 184): union edge(center, first) with
    edge(center, p) for every later support point, in ascending order."""
    center, support = row
    pts = support_points(support)
    if not pts:
        return
    first_edge = EDGE[center][pts[0]]
    for p in pts[1:]:
        union_edges(parents, first_edge, EDGE[center][p])


def equality_closure(rows) -> list:
    """equalityClosure (line 193): fold over rows in list order."""
    parents = list(range(121))
    for row in rows:
        add_row_equalities(parents, row)
    return parents


def normalized_roots(parents: list) -> list:
    """normalizedRoots (line 196)."""
    return [uf_root(parents, e) for e in range(121)]


# ---------------------------------------------------------------------------
# Detector cores -- OPTIMIZED versions (used by the searches).
#
# (D4) Equivalence arguments:
#   * Same-root <=> edgesEqual, and same-root is transitive, so "p,q,r all
#     satisfy edgesEqual roots c p c q / c p c r" <=> p,q,r lie in one
#     root-group of {edge(c, .)}.
#   * Loop edges edge(x,x) = 12x never enter unionEdges (rows exclude their
#     own center), so a loop edge is always a singleton root-class and can
#     never witness an edgesEqual with a non-loop edge.  Group scans therefore
#     agree with the Lean code even where the code-list scans range over
#     degenerate label choices (center = p, point = a, ...).
# ---------------------------------------------------------------------------


def _groups_at(roots: list, c: int) -> dict:
    """Root-groups of the 11 points at center c: root -> [points]."""
    groups: dict = {}
    ec = EDGE[c]
    for p in LABELS:
        groups.setdefault(roots[ec[p]], []).append(p)
    return groups


def duplicate_center_core(roots: list) -> bool:
    """duplicateCenterCore (line 206): some triple p<q<r co-circular (same
    root-group) at >= 2 centers.  Within one center the groups partition the
    points, so a triple appears at most once per center; a second hit in
    `seen` is therefore a second center."""
    seen: set = set()
    for c in LABELS:
        for g in _groups_at(roots, c).values():
            n = len(g)
            if n >= 3:
                for i in range(n - 2):
                    for j in range(i + 1, n - 1):
                        for k in range(j + 1, n):
                            t = (g[i], g[j], g[k])
                            if t in seen:
                                return True
                            seen.add(t)
    return False


def exact_off_circle_core_at(roots: list, c0: int, pinned: int) -> bool:
    """exactPinnedOffCircleCore (line 215) with the center literal `1`
    parametrized to c0 (the R4 fork; the committed endpoint copy
    exactEndpointOffCircleCoreAt2 is this at c0 = 2).  Fires iff some
    root-group at c0 contains both a pinned and an unpinned point."""
    for g in _groups_at(roots, c0).values():
        if len(g) >= 2:
            any_on = any((pinned >> p) & 1 for p in g)
            any_off = any(not ((pinned >> p) & 1) for p in g)
            if any_on and any_off:
                return True
    return False


def bisector_lists(roots: list):
    """Per pairCode (a, b): the labels point with
    edgesEqual roots point a point b (the `bisectors` of
    fivePointCoreAtEndpoints, and the counted set of
    perpendicularBisectorCore; point = a / b never qualifies, loop edges)."""
    out = []
    for code in PAIR_CODES:
        a, b = code // 11, code % 11
        ea, eb = EDGE[a], EDGE[b]
        bis = [p for p in LABELS if roots[ea[p]] == roots[eb[p]]]
        out.append((a, b, bis))
    return out


def perpendicular_bisector_core(bis_list) -> bool:
    """perpendicularBisectorCore (line 220): some pair with >= 3 equidistant
    points."""
    return any(len(bis) >= 3 for _a, _b, bis in bis_list)


def cyclic_five(a: int, x: int, b: int, c: int, y: int) -> bool:
    oa = OFFSET[a]
    return 0 < oa[x] < oa[b] < oa[c] < oa[y]


def cyclic_five_up_to_orientation(a: int, x: int, b: int, c: int, y: int) -> bool:
    return cyclic_five(a, x, b, c, y) or cyclic_five(a, y, c, b, x)


def five_point_core_at_endpoints(roots: list, a: int, b: int, bis) -> bool:
    """fivePointCoreAtEndpoints (line 226).  `bis` is the bisector set of the
    unordered pair {a,b} (edgesEqual is symmetric in a,b so both orientations
    share it)."""
    for x in bis:
        for y in bis:
            if x != y:
                for c in LABELS:
                    if (
                        cyclic_five_up_to_orientation(a, x, b, c, y)
                        and roots[EDGE[c][b]] == roots[EDGE[c][x]]
                        and roots[EDGE[c][b]] == roots[EDGE[c][y]]
                    ):
                        return True
    return False


def convex_five_point_core(roots: list, bis_list) -> bool:
    """convexFivePointCore (line 234): both endpoint orientations per pair."""
    for a, b, bis in bis_list:
        if len(bis) >= 2 and (
            five_point_core_at_endpoints(roots, a, b, bis)
            or five_point_core_at_endpoints(roots, b, a, bis)
        ):
            return True
    return False


def has_prefix_core_at(c0: int, assigned) -> str | None:
    """hasPrefixCoreAt c0 (parametric hasPrefixCore, line 260 / endpoint
    hasPrefixCoreRight): returns the name of the first detector that fires in
    the Lean or-order, else None.

    find? (.center == c0): first row in list order (assigned is newest-first,
    but at most one row -- the seed -- ever has center c0)."""
    roots = normalized_roots(equality_closure(assigned))
    if duplicate_center_core(roots):
        return "dup"
    pinned = next((r for r in assigned if r[0] == c0), None)
    if pinned is not None and exact_off_circle_core_at(roots, c0, pinned[1]):
        return "offcircle"
    bis_list = bisector_lists(roots)
    if perpendicular_bisector_core(bis_list):
        return "perp"
    if convex_five_point_core(roots, bis_list):
        return "five"
    return None


# ---------------------------------------------------------------------------
# Detector cores -- LITERAL versions (reference transcription; cross-checked
# against the optimized ones by run_smoke.py, never used in searches).
# ---------------------------------------------------------------------------


def _edges_equal(roots, l1, r1, l2, r2) -> bool:
    return roots[edge_code(l1, r1)] == roots[edge_code(l2, r2)]


def duplicate_center_core_literal(roots) -> bool:
    for code in TRIPLE_CODES:
        p, q, r = code // 121, (code // 11) % 11, code % 11
        n = 0
        for center in LABELS:
            if _edges_equal(roots, center, p, center, q) and _edges_equal(
                roots, center, p, center, r
            ):
                n += 1
        if n >= 2:
            return True
    return False


def exact_off_circle_core_at_literal(roots, c0, pinned) -> bool:
    for on in LABELS:
        if has(pinned, on):
            for off in LABELS:
                if not has(pinned, off) and _edges_equal(roots, c0, on, c0, off):
                    return True
    return False


def perpendicular_bisector_core_literal(roots) -> bool:
    for code in PAIR_CODES:
        a, b = code // 11, code % 11
        n = sum(1 for p in LABELS if _edges_equal(roots, p, a, p, b))
        if n >= 3:
            return True
    return False


def convex_five_point_core_literal(roots) -> bool:
    def at_endpoints(a, b):
        bis = [p for p in LABELS if _edges_equal(roots, p, a, p, b)]
        for x in bis:
            for y in bis:
                if x != y:
                    for c in LABELS:
                        if (
                            cyclic_five_up_to_orientation(a, x, b, c, y)
                            and _edges_equal(roots, c, b, c, x)
                            and _edges_equal(roots, c, b, c, y)
                        ):
                            return True
        return False

    for code in PAIR_CODES:
        a, b = code // 11, code % 11
        if at_endpoints(a, b) or at_endpoints(b, a):
            return True
    return False


# ---------------------------------------------------------------------------
# DFS driver (lines 270-321), parametric in the seed center c0.
# ---------------------------------------------------------------------------


class NodeCapExceeded(Exception):
    pass


def sort_domains(domains):
    """sortDomains (line 278) = foldr insertDomain []: insert each domain
    (right-to-left) before the first element with >= as many rows."""
    result: list = []
    for domain in reversed(domains):
        n = len(domain[1])
        for i, nxt in enumerate(result):
            if n <= len(nxt[1]):
                result.insert(i, domain)
                break
        else:
            result.append(domain)
    return result


def variable_centers_at(c0: int):
    """variableCentersAt (DESIGN 2.1): the 10 centers != c0, ascending.
    At c0 = 1 this is the committed variableCenters [0,2,...,10]; at c0 = 2
    the committed variableCentersRight [0,1,3,...,10]."""
    return [c for c in LABELS if c != c0]


class SearchStats:
    __slots__ = (
        "nodes",
        "max_depth",
        "kills_by_detector",
        "kills_by_depth",
        "empty_prunes",
        "survivor",
    )

    def __init__(self):
        self.nodes = 0
        self.max_depth = 0
        self.kills_by_detector = {"dup": 0, "offcircle": 0, "perp": 0, "five": 0}
        self.kills_by_depth: dict = {}
        self.empty_prunes = 0
        self.survivor = None


def _pair_ok(paircount, pairs) -> bool:
    """pairBoundOK against the counts of the (would-be) assigned list."""
    return all(paircount[p] < 2 for p in pairs)


def all_killed_at(
    c0: int,
    fuel: int,
    assigned,
    domains,
    paircount,
    stats: SearchStats,
    node_cap: int,
    debug_checks: bool = False,
) -> bool:
    """allKilledAt (parametric allKilled, line 284).

    assigned: newest-first list of rows, seed last (mirrors row :: assigned).
    paircount: 121-slot array, paircount[code] = how many assigned rows
    contain pair `code`.
    depth = len(assigned) (seed included) at the current node.
    """
    stats.nodes += 1
    if stats.nodes > node_cap:
        raise NodeCapExceeded()
    depth = len(assigned)
    if depth > stats.max_depth:
        stats.max_depth = depth

    fired = has_prefix_core_at(c0, assigned)

    if fuel == 0:
        # `| 0, assigned, _ => hasPrefixCore assigned`
        if fired is not None:
            stats.kills_by_detector[fired] += 1
            stats.kills_by_depth[depth] = stats.kills_by_depth.get(depth, 0) + 1
            return True
        stats.survivor = list(assigned)
        return False

    if fired is not None:
        stats.kills_by_detector[fired] += 1
        stats.kills_by_depth[depth] = stats.kills_by_depth.get(depth, 0) + 1
        return True

    ordered = sort_domains(domains)
    if not ordered:
        # `| [] => false` -- unreachable in placement drivers (fuel counts
        # domains exactly), mirrored for fidelity.
        stats.survivor = list(assigned)
        return False

    (_, rows), rest = ordered[0], ordered[1:]
    for row in rows:
        # (D3) `if compatibleWith assigned row` is provably redundant: `rows`
        # was produced by restrictDomain against this exact assigned list.
        if debug_checks:
            assert _pair_ok(paircount, row_pairs_memo(row[1])) and all(
                rows_compatible_memo(row, prev) for prev in assigned
            ), "restrictDomain invariant violated"

        new_pairs = row_pairs_memo(row[1])
        npaircount = paircount.copy()
        for p in new_pairs:
            npaircount[p] += 1
        nassigned = [row] + assigned

        # (D1) restrictDomain nextAssigned, incrementally: every surviving row
        # r already satisfies pairwise compatibility with `assigned`, so the
        # new filter is rowsCompatible(r, row) plus pairBoundOK against the
        # updated counts.
        ndomains = []
        empty = False
        for dc, drows in rest:
            filtered = [
                r
                for r in drows
                if _pair_ok(npaircount, row_pairs_memo(r[1]))
                and rows_compatible_memo(r, row)
            ]
            if not filtered:
                empty = True
                # keep building? Lean maps all domains then checks any-empty;
                # the verdict is identical, short-circuit for speed.
                break
            ndomains.append((dc, filtered))
        if empty:
            stats.empty_prunes += 1
            continue  # this branch is killed (true)

        if not all_killed_at(
            c0, fuel - 1, nassigned, ndomains, npaircount, stats, node_cap, debug_checks
        ):
            return False  # List.all short-circuits on the first survivor
    return True


def erased_placement_check(
    c0: int,
    support: int,
    deleted: int,
    node_cap: int = 50_000_000,
    debug_checks: bool = False,
):
    """erasedPlacementCheckAt c0 support deleted (DESIGN 2.1): the committed
    placementCheck shape (line 310) with fixed row (c0, support).

    Returns (verdict, stats, seconds):
      verdict in {"killed", "survived", "gate_false", "capped"}.
    """
    t0 = time.monotonic()
    stats = SearchStats()
    if not local_candidate_ok(c0, deleted, support):
        return "gate_false", stats, time.monotonic() - t0

    fixed = (c0, support)
    assigned = [fixed]
    paircount = [0] * 121
    for p in row_pairs_memo(support):
        paircount[p] += 1

    domains = []
    for center in variable_centers_at(c0):
        rows = [
            r
            for r in candidate_rows_cached(center, deleted)
            if _pair_ok(paircount, row_pairs_memo(r[1]))
            and rows_compatible_memo(r, fixed)
        ]
        domains.append((center, rows))
    # `if domains.any (rows.isEmpty) then true`
    if any(not rows for _c, rows in domains):
        stats.empty_prunes += 1
        return "killed", stats, time.monotonic() - t0

    try:
        verdict = all_killed_at(
            c0,
            len(domains),
            assigned,
            domains,
            paircount,
            stats,
            node_cap,
            debug_checks,
        )
    except NodeCapExceeded:
        return "capped", stats, time.monotonic() - t0
    return ("killed" if verdict else "survived"), stats, time.monotonic() - t0


_CAND: dict = {}


def candidate_rows_cached(center: int, deleted: int):
    key = (center, deleted) if center == 0 else center
    v = _CAND.get(key)
    if v is None:
        v = candidate_rows(center, deleted)
        _CAND[key] = v
    return v


# ---------------------------------------------------------------------------
# Committed entry points for the smoke tests.
# ---------------------------------------------------------------------------


def mask_of(points) -> int:
    m = 0
    for p in points:
        m |= 1 << p
    return m


def placement_check(pin_source: int, deleted: int, **kw):
    """placementCheck (line 310): fixed pinned row {0,7,8,pinSource} at
    center 1.  Definitionally erasedPlacementCheckAt 1 (mask) deleted."""
    return erased_placement_check(1, mask_of((0, 7, 8, pin_source)), deleted, **kw)


def endpoint_left_placement_check(escapee: int, fourth: int, deleted: int, **kw):
    """endpointLeftPlacementCheck: row {7,8,escapee,fourth} at center 1."""
    return erased_placement_check(1, mask_of((7, 8, escapee, fourth)), deleted, **kw)


def endpoint_right_placement_check(escapee: int, fourth: int, deleted: int, **kw):
    """endpointRightPlacementCheck: row {9,10,escapee,fourth} at center 2,
    variableCentersRight + center-2-keyed off-circle detector = the
    parametric path at c0 = 2."""
    return erased_placement_check(2, mask_of((9, 10, escapee, fourth)), deleted, **kw)


# ---------------------------------------------------------------------------
# Survivor serialization: the exact combinatorial state of a surviving leaf.
# ---------------------------------------------------------------------------


def survivor_payload(assigned):
    """Rows (oldest-first, seed first) plus the nontrivial equality-closure
    classes of the leaf, as lists of point-pair edges."""
    rows_oldest_first = list(reversed(assigned))
    roots = normalized_roots(equality_closure(assigned))
    classes: dict = {}
    for a in range(11):
        for b in range(a + 1, 11):
            e = EDGE[a][b]
            classes.setdefault(roots[e], []).append([a, b])
    return {
        "rows": [
            {"center": c, "support": support_points(s), "mask": s}
            for c, s in rows_oldest_first
        ],
        "closure_classes": [g for g in classes.values() if len(g) >= 2],
    }
