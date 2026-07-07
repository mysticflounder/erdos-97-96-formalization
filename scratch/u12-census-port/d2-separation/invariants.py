#!/usr/bin/env python3
"""D2 combinatorial invariants for equidistance frameworks (exact integer).

A framework is (P, C): P a set of labeled points, C a list of constraints
(c, a, b) meaning |p_c - p_a| = |p_c - p_b|.  In the u12 census data every
constraint has 3 distinct points and comes from the star generator map
gen_map(cube) = [(c, K_c[0], K_c[j]) for j in 1..3]; an induced framework on
S keeps exactly the generators with {c,a,b} <= S (the miner's INDUCED(P)).

Over-determination convention: delta(S) = R(S) - (2|S| - 4), where R(S) is
the number of constraints induced in S.  (2|S| - 4 = coordinate dof mod the
4-dimensional similarity group; a pure counting heuristic, used here as a
combinatorial invariant only.)

Invariants computed per framework (all exact ints / int tuples):
 (a) Laman-style sparsity profile over ALL subsets S <= P with R(S) >= 1:
     max_sub_delta_all, max_sub_delta_proper, n_sub_tight (delta(S)==0),
     n_sub_over (delta(S)>=1), argmax sizes.
 (b) sub_delta_hist: multiset {delta(S): count}, plus size-resolved variant.
 (c) circle_degree_profile: per center c, m_c = #constraints centered at c,
     sorted descending (class on the circle centered c has m_c + 1 members).
 (d) coordination-class data (Schulze-Serocold-Theran style): L = #circles
     (= #centers with >= 1 induced constraint), E = R + L (star edges:
     center-base + center-witness per constraint class), class_size_profile
     (sorted desc m_c+1), member_degree_profile (#circles each point lies ON,
     as base or witness, sorted desc), and min_L_at_max_delta (min L(S) among
     subsets attaining max_sub_delta_all).
     NOTE (proved in report): for star-induced systems the coordinated
     sparsity count E(S) - (2|S| - 3 + L(S)) == delta(S) - 1 identically,
     so SST coordinated counts add no information beyond delta + L jointly.
 (e) pair-contraction profile (Fekete-Jordan-Kaszanitzky / Guler-Jackson
     style): for each unordered pair {i,j} <= P, identify j:=i, map every
     constraint through sigma, drop vacuous (a'==b'), record collapse
     constraints (c'==a' or c'==b' => forces d==0) as z, dedupe the rest by
     (center, {a,b}).  delta'({i,j}) = R'_dedup - (2(k-1) - 4).
     Profile = sorted multiset of (delta', z); scalars max_contract_delta,
     max_contract_delta_z0, gauge_pair_contract (pair {0,1} when present),
     n_pairs_contract_over (delta' >= 1), n_pairs_z_pos (z >= 1).

Run `python invariants.py` to execute the MANDATORY hand-verified smoke.
"""
from itertools import combinations


def induced_constraints(gen_map, S):
    Ss = set(S)
    return [g for g in gen_map if g[0] in Ss and g[1] in Ss and g[2] in Ss]


def cube_gen_map(cube):
    """Star generator map, identical to _min_core_sound.gen_map."""
    m = []
    for c in sorted(cube):
        ks = cube[c]
        for k in ks[1:]:
            m.append((c, ks[0], k))
    return m


def _submasks_of(points):
    """All subsets (as frozensets) of a point list, size >= 3."""
    pts = sorted(points)
    for r in range(3, len(pts) + 1):
        for S in combinations(pts, r):
            yield S


def framework_invariants(P, C, gauge_pair=(0, 1)):
    """Compute invariants (a)-(e) for framework (P, C). Exact ints only.

    Point labels must be ints in 0..11 (12-bit masks used internally)."""
    P = sorted(P)
    k = len(P)
    R = len(C)
    delta = R - (2 * k - 4)

    used = set()
    for (c, a, b) in C:
        used.update((c, a, b))
    n_idle = sum(1 for p in P if p not in used)

    # --- (a)+(b): subset sweep via bitmask submask enumeration
    gen_masks = [(1 << c) | (1 << a) | (1 << b) for (c, a, b) in C]
    gen_center_bits = [1 << c for (c, _, _) in C]
    Pmask = 0
    for p in P:
        Pmask |= 1 << p

    sub_hist = {}          # delta -> count   (subsets with R(S) >= 1, incl. S = P)
    size_delta_hist = {}   # (|S|, delta) -> count
    max_all = None
    max_proper = None
    n_tight = 0
    n_over = 0
    argmax_sizes = set()
    # also track min L(S) among argmax subsets for (d)
    minL_at_max = None
    T = Pmask
    while True:
        sz = T.bit_count()
        if sz >= 3:
            rS = 0
            cbits = 0
            for gm_, cb_ in zip(gen_masks, gen_center_bits):
                if gm_ & T == gm_:
                    rS += 1
                    cbits |= cb_
            if rS:
                dS = rS - (2 * sz - 4)
                sub_hist[dS] = sub_hist.get(dS, 0) + 1
                key = (sz, dS)
                size_delta_hist[key] = size_delta_hist.get(key, 0) + 1
                if dS == 0:
                    n_tight += 1
                if dS >= 1:
                    n_over += 1
                if max_all is None or dS > max_all:
                    max_all = dS
                    argmax_sizes = {sz}
                    minL_at_max = cbits.bit_count()
                elif dS == max_all:
                    argmax_sizes.add(sz)
                    minL_at_max = min(minL_at_max, cbits.bit_count())
                if sz < k and (max_proper is None or dS > max_proper):
                    max_proper = dS
        if T == 0:
            break
        T = (T - 1) & Pmask

    # --- (c): circle degrees
    per_center = {}
    for (c, a, b) in C:
        per_center.setdefault(c, []).append((a, b))
    circle_deg = sorted((len(v) for v in per_center.values()), reverse=True)
    L = len(per_center)

    # --- (d): coordination classes
    E = R + L  # star edges: base edge + one witness edge per constraint, per center
    class_sizes = sorted((len(v) + 1 for v in per_center.values()), reverse=True)
    on_circle = {p: 0 for p in P}
    for c, pairs in per_center.items():
        members = set()
        for (a, b) in pairs:
            members.add(a)
            members.add(b)
        for m in members:
            if m in on_circle:
                on_circle[m] += 1
    member_deg = sorted(on_circle.values(), reverse=True)

    # --- (e): pair contractions
    contract_profile = []
    max_cd = None
    max_cd_z0 = None
    gauge_c = None
    n_pairs_over = 0
    n_pairs_zpos = 0
    for (i, j) in combinations(P, 2):
        sig = lambda x: i if x == j else x
        kept = set()
        zpairs = set()
        for (c, a, b) in C:
            c2, a2, b2 = sig(c), sig(a), sig(b)
            if a2 == b2:
                continue                      # vacuous
            if c2 == a2:
                zpairs.add(frozenset((c2, b2)))   # |c-b| forced 0
            elif c2 == b2:
                zpairs.add(frozenset((c2, a2)))
            else:
                kept.add((c2, frozenset((a2, b2))))
        Rp = len(kept)
        z = len(zpairs)
        dp = Rp - (2 * (k - 1) - 4)
        contract_profile.append((dp, z))
        if max_cd is None or dp > max_cd:
            max_cd = dp
        if z == 0 and (max_cd_z0 is None or dp > max_cd_z0):
            max_cd_z0 = dp
        if dp >= 1:
            n_pairs_over += 1
        if z >= 1:
            n_pairs_zpos += 1
        if gauge_pair is not None and {i, j} == set(gauge_pair):
            gauge_c = (dp, z)
    contract_profile.sort()

    return {
        "k": k, "R": R, "delta": delta, "n_idle": n_idle,
        # (a)
        "max_sub_delta_all": max_all,
        "max_sub_delta_proper": max_proper,
        "n_sub_tight": n_tight,
        "n_sub_over": n_over,
        "argmax_sizes": sorted(argmax_sizes),
        # (b)
        "sub_delta_hist": sorted([d, c] for d, c in sub_hist.items()),
        "sub_size_delta_hist": sorted([s, d, c] for (s, d), c in size_delta_hist.items()),
        # (c)
        "circle_degree_profile": circle_deg,
        "n_circles": L,
        "max_circle_degree": circle_deg[0] if circle_deg else 0,
        # (d)
        "E_star_edges": E,
        "class_size_profile": class_sizes,
        "member_degree_profile": member_deg,
        "min_L_at_max_delta": minL_at_max,
        # (e)
        "contraction_profile": [[d, z] for (d, z) in contract_profile],
        "max_contract_delta": max_cd,
        "max_contract_delta_z0": max_cd_z0,
        "gauge_pair_contract": list(gauge_c) if gauge_c is not None else None,
        "n_pairs_contract_over": n_pairs_over,
        "n_pairs_z_pos": n_pairs_zpos,
    }


# ----------------------------------------------------------------------------
# MANDATORY smoke: two tiny hand-computed frameworks.
# ----------------------------------------------------------------------------

def _assert_eq(name, got, want):
    assert got == want, f"SMOKE FAIL {name}: got {got!r} want {want!r}"


def smoke():
    # --- S1: single 3-member circle class. P={0,1,2,3}, C = star at 0
    #     over class [1,2,3]: constraints (0;1,2),(0;1,3).  R=2, delta=-2.
    #     Hand-computed profile in report.md section "Smoke checks".
    P1 = [0, 1, 2, 3]
    C1 = [(0, 1, 2), (0, 1, 3)]
    r = framework_invariants(P1, C1)
    _assert_eq("S1 k/R/delta", (r["k"], r["R"], r["delta"]), (4, 2, -2))
    _assert_eq("S1 n_idle", r["n_idle"], 0)
    _assert_eq("S1 max_sub_delta_all", r["max_sub_delta_all"], -1)
    _assert_eq("S1 max_sub_delta_proper", r["max_sub_delta_proper"], -1)
    _assert_eq("S1 n_sub_tight/over", (r["n_sub_tight"], r["n_sub_over"]), (0, 0))
    _assert_eq("S1 sub_delta_hist", r["sub_delta_hist"], [[-2, 1], [-1, 2]])
    _assert_eq("S1 circle_degree_profile", r["circle_degree_profile"], [2])
    _assert_eq("S1 n_circles/E", (r["n_circles"], r["E_star_edges"]), (1, 3))
    _assert_eq("S1 class_size_profile", r["class_size_profile"], [3])
    _assert_eq("S1 member_degree_profile", r["member_degree_profile"], [1, 1, 1, 0])
    _assert_eq("S1 contraction_profile", r["contraction_profile"],
               [[-2, 2], [-1, 0], [-1, 0], [-1, 0], [-1, 1], [-1, 1]])
    _assert_eq("S1 max_contract_delta", r["max_contract_delta"], -1)
    _assert_eq("S1 max_contract_delta_z0", r["max_contract_delta_z0"], -1)
    _assert_eq("S1 gauge_pair_contract", r["gauge_pair_contract"], [-2, 2])

    # --- S2: mutual-equidistance framework ("two equilateral triangles on a
    #     shared edge", REALIZABLE with all points distinct, delta=+2):
    #     P={0,1,2,3}, C=(0;1,2),(0;1,3),(1;0,2),(1;0,3),(2;0,1),(3;0,1).
    P2 = [0, 1, 2, 3]
    C2 = [(0, 1, 2), (0, 1, 3), (1, 0, 2), (1, 0, 3), (2, 0, 1), (3, 0, 1)]
    r = framework_invariants(P2, C2)
    _assert_eq("S2 k/R/delta", (r["k"], r["R"], r["delta"]), (4, 6, 2))
    _assert_eq("S2 max_sub_delta_all", r["max_sub_delta_all"], 2)
    _assert_eq("S2 max_sub_delta_proper", r["max_sub_delta_proper"], 1)
    _assert_eq("S2 n_sub_tight/over", (r["n_sub_tight"], r["n_sub_over"]), (0, 3))
    _assert_eq("S2 sub_delta_hist", r["sub_delta_hist"], [[1, 2], [2, 1]])
    _assert_eq("S2 argmax_sizes", r["argmax_sizes"], [4])
    _assert_eq("S2 circle_degree_profile", r["circle_degree_profile"], [2, 2, 1, 1])
    _assert_eq("S2 n_circles/E", (r["n_circles"], r["E_star_edges"]), (4, 10))
    _assert_eq("S2 class_size_profile", r["class_size_profile"], [3, 3, 2, 2])
    _assert_eq("S2 member_degree_profile", r["member_degree_profile"], [3, 3, 2, 2])
    _assert_eq("S2 min_L_at_max_delta", r["min_L_at_max_delta"], 4)
    _assert_eq("S2 contraction_profile", r["contraction_profile"],
               [[-2, 2], [1, 0], [1, 1], [1, 1], [1, 1], [1, 1]])
    _assert_eq("S2 max_contract_delta", r["max_contract_delta"], 1)
    _assert_eq("S2 max_contract_delta_z0", r["max_contract_delta_z0"], 1)
    _assert_eq("S2 gauge_pair_contract", r["gauge_pair_contract"], [-2, 2])
    _assert_eq("S2 n_pairs_contract_over", r["n_pairs_contract_over"], 5)
    _assert_eq("S2 n_pairs_z_pos", r["n_pairs_z_pos"], 5)

    # --- coordinated-count identity check (report note in (d)):
    #     E(S) - (2|S| - 3 + L(S)) == delta(S) - 1 for the full frameworks.
    for (P, C) in ((P1, C1), (P2, C2)):
        rr = framework_invariants(P, C)
        lhs = rr["E_star_edges"] - (2 * rr["k"] - 3 + rr["n_circles"])
        _assert_eq("coord identity", lhs, rr["delta"] - 1)

    print("[smoke] invariants.py OK: S1 and S2 match hand-computed values exactly")


if __name__ == "__main__":
    smoke()
