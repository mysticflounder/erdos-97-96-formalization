"""Finite countermodel constructor/checker for the capture-insufficiency audit.

Builds a finite abstract incidence model of the R-branch frontier interface
exported by `DoubleSurvivalBranchProducer.lean` + `RobustLiveBankAdapter.lean`
+ the frontier structures in `CriticalPairFrontier.lean`, in which every
enumerated reachable incidence fact holds and no strict-surplus capture packet
exists.  The checker verifies every interface constraint exhaustively;
negative controls corrupt the model and require the checker to reject.

Point roles (17 points):
  0 = o1  (oppApex1, in surplus cap)
  1 = o2  (oppApex2)
  2 = z   (strict surplus interior center, in cap)
  3 = q   4 = w                  (terminal pair)
  5 = t1  6 = t2                 (rest of terminal first-apex row)
  7 = s1  8 = s2  9 = s3         (second-apex row, with z)
  10 = p1  11 = p2               (frontier erased pair, co-radial about o1)
  12 = e1  13 = e2               (descent-step erased pair, co-radial about o1)
  14,15,16 = k1,k2,k3            (extra surplus-cap points: cap card > 4)

Model data:
  A       = all 17 points
  cap     = {0, 2, 14, 15, 16}
  interior= {2}
  E       = {10, 11, 12, 13}   (ambient erased history)
  carrier = A \\ E              (terminal carrier)
  B0      = A \\ {10, 11}      (ambient minus frontier pair)

Distance table: symmetric; cells forced equal only by the per-center K4 rows
and the named o1-groups (terminal row rT, frontier pair rP, descent pair rE);
every other cell gets a globally fresh color, so every unforced class is a
singleton.

Interface constraints checked (strong readings — each has strictly fewer
hypotheses than its real Lean source, so satisfying these satisfies those):
  C1  symmetry
  C2  global K4 (HasNEquidistantProperty 4 A): every x in A has a class of
      size >= 4 about it
  C3  escape (oppCap2_escape_gen): distinct off-cap points co-radial about o1
      never share their o2-distance
  C4  one-hit (oppApex1_surplusCap_one_hit): every o1-class meets cap in <= 1
  C5  sink (false_of_surplusInterior_bisects_marginalPair): no interior center
      is equidistant to a distinct off-cap pair co-radial about o1
      == capture-freeness at every interior center
  C6  history (PairErasureHistory): E off-cap; every erased point has a
      distinct erased co-radial mate about o1
  C7  frontier erased pair recorded (CoradialErasedPair): (10,11)
  C8  terminal row: carrier o1-class at rT is exactly {3,4,5,6} (card 4) and
      is the unique carrier o1-class of size >= 4 (terminal_card/_unique)
  C9  terminal pair (3,4): distinct, in the carrier rT-marginal, off-cap
  C10 second row: carrier o2-class at rho2 = {2,7,8,9}, card >= 4, equal to
      the B0 o2-class at rho2 (second_row_eq_ambient), survives erasing {3,4}
  C11 firstApex_double: B0 has an o1-class of size >= 4
  C12 frontier pair fields (SurvivorPairRelocationPacket): 10,11 distinct, in
      the ambient rP-marginal, off-cap; secondApexDouble: B0 has an o2-class
      of size >= 4; q_survives/w_survives: o2-class of size >= 4 in
      A\\{p1} and in A\\{p2}
  C13 cap facts: o1 in cap, interior subset cap, o1 not in interior,
      cap subset A, cap card > 4 (surplus field)
  C14 shell system (CriticalShellSystem): every x in A has a center c(x) != x
      in A whose class at the shell color is the EXACT full class, has card
      exactly 4, and contains x (CriticalFourShell); criticality (no_qfree):
      every class about c(x) inside A\\{x} has card <= 3; blocker
      disequalities: c(p1) != o2, c(p2) != o2
"""

import copy
import json
import sys

N = 17
A = list(range(N))
O1, O2, Z = 0, 1, 2
Q, W, T1, T2 = 3, 4, 5, 6
S1, S2, S3 = 7, 8, 9
P1, P2, E1, E2 = 10, 11, 12, 13
K1, K2, K3 = 14, 15, 16

CAP = {O1, Z, K1, K2, K3}
INTERIOR = {Z}
ERASED = {P1, P2, E1, E2}
CARRIER = [x for x in A if x not in ERASED]
B0 = [x for x in A if x not in (P1, P2)]

# Named o1-groups: the only multi-point o1-classes.
GROUPS = {"rT": [Q, W, T1, T2], "rP": [P1, P2], "rE": [E1, E2]}

# Fixed rows: o1's row is the terminal row (color rT), o2's is the second
# row (color rho2); the interior center's row takes at most one point from
# each named o1-group so it contains no o1-co-radial off-cap pair.
FIXED_ROWS = {
    O1: [Q, W, T1, T2],
    O2: [Z, S1, S2, S3],
    Z:  [S1, T1, P1, E1],
}


def build_rows():
    """Complete FIXED_ROWS to one 4-row per center, conflict-free.

    Invariants: no cell is assigned twice (so y in row(x) forbids x in
    row(y), and o1 never appears in a row of a named-group member), and every
    point of A is covered by at least one row (shell coverage).
    """
    rows = {x: list(r) for x, r in FIXED_ROWS.items()}
    assigned = set()

    def cells_of(x, targets):
        return {frozenset((x, y)) for y in targets}

    for x, r in rows.items():
        assigned |= cells_of(x, r)
    for g in GROUPS.values():
        assigned |= cells_of(O1, g)

    covered = set()
    for r in rows.values():
        covered |= set(r)

    for x in A:
        if x in rows:
            continue
        row = []
        # prefer uncovered points so every point lands in some row
        for pref in (True, False):
            for y in A:
                if len(row) == 4:
                    break
                if y == x or y in row:
                    continue
                if pref and y in covered:
                    continue
                if frozenset((x, y)) in assigned:
                    continue
                row.append(y)
        if len(row) != 4:
            raise ValueError(f"cannot complete row for {x}")
        rows[x] = row
        assigned |= cells_of(x, row)
        covered |= set(row)

    missing = set(A) - covered
    if missing:
        raise ValueError(f"points not covered by any row: {missing}")
    return rows


def build_table(rows):
    """Fill the symmetric table; forced cells first, fresh colors after."""
    d = [[None] * N for _ in range(N)]
    next_color = [0]
    names = {}

    def fresh(name):
        c = next_color[0]
        next_color[0] += 1
        names[name] = c
        return c

    def assign(x, y, c, why):
        if x == y:
            raise ValueError(f"self-cell {x} in {why}")
        if d[x][y] is not None and d[x][y] != c:
            raise ValueError(
                f"conflict at cell ({x},{y}): {d[x][y]} vs {c} ({why})")
        d[x][y] = c
        d[y][x] = c

    for nm, group in GROUPS.items():
        c = fresh(nm)
        for y in group:
            assign(O1, y, c, f"group {nm}")
    names["rT"] = names["rT"]  # row(O1) == group rT by construction

    for x, row in rows.items():
        if x == O1:
            continue
        c = fresh(f"row{x}")
        for y in row:
            assign(x, y, c, f"row of {x}")
    names["rho2"] = names["row1"]

    for x in range(N):
        d[x][x] = fresh(f"diag{x}")
    for x in range(N):
        for y in range(x + 1, N):
            if d[x][y] is None:
                assign(x, y, fresh(f"free{x}_{y}"), "fill")
    return d, names


def build_shells(rows):
    """c(x) = some center whose row contains x, avoiding o2 for p1,p2."""
    shells = {}
    for x in A:
        cands = [c for c, r in rows.items() if x in r]
        if x in (P1, P2):
            cands = [c for c in cands if c != O2]
        if not cands:
            raise ValueError(f"no shell center for {x}")
        shells[x] = cands[0]
    return shells


def sel_class(d, carrier, center, color):
    return [x for x in carrier if d[center][x] == color]


def check(d, names, shells, verbose=False):
    """Return a list of violated constraint labels (empty = model valid)."""
    bad = []

    def note(label, msg):
        bad.append(label)
        if verbose:
            print(f"  VIOLATION {label}: {msg}")

    for x in range(N):
        for y in range(N):
            if d[x][y] != d[y][x]:
                note("C1", f"asym cell ({x},{y})")

    for x in A:
        best = max(
            len(sel_class(d, A, x, c)) for c in {d[x][y] for y in A if y != x})
        if best < 4:
            note("C2", f"point {x} has no 4-class (best {best})")

    for x in A:
        for y in A:
            if x < y and x not in CAP and y not in CAP:
                if d[O1][x] == d[O1][y] and d[O2][x] == d[O2][y]:
                    note("C3", f"off-cap pair ({x},{y}) shares o1+o2 colors")

    for c in {d[O1][x] for x in A}:
        hits = [x for x in sel_class(d, A, O1, c) if x in CAP]
        if len(hits) > 1:
            note("C4", f"o1-class {c} hits cap at {hits}")

    for zc in INTERIOR:
        for x in A:
            for y in A:
                if x < y and x not in CAP and y not in CAP:
                    if d[O1][x] == d[O1][y] and d[zc][x] == d[zc][y]:
                        note("C5",
                             f"interior {zc} bisects co-radial pair ({x},{y})")

    for x in ERASED:
        if x in CAP:
            note("C6", f"erased {x} in cap")
        mates = [y for y in ERASED if y != x and d[O1][y] == d[O1][x]]
        if not mates:
            note("C6", f"erased {x} has no co-radial erased mate")

    if not (P1 in ERASED and P2 in ERASED and d[O1][P1] == d[O1][P2]):
        note("C7", "frontier pair not an erased co-radial pair")

    rT = names["rT"]
    row = sorted(sel_class(d, CARRIER, O1, rT))
    if row != [Q, W, T1, T2]:
        note("C8", f"carrier rT-class is {row}")
    for c in {d[O1][x] for x in CARRIER}:
        if c != rT and len(sel_class(d, CARRIER, O1, c)) >= 4:
            note("C8", f"second large carrier o1-class at color {c}")

    if not (Q != W and Q not in CAP and W not in CAP
            and d[O1][Q] == rT and d[O1][W] == rT
            and Q in CARRIER and W in CARRIER):
        note("C9", "terminal pair not in carrier rT-marginal")

    rho2 = names["rho2"]
    row2 = sorted(sel_class(d, CARRIER, O2, rho2))
    row2_B0 = sorted(sel_class(d, B0, O2, rho2))
    if len(row2) < 4:
        note("C10", f"second row too small: {row2}")
    if row2 != row2_B0:
        note("C10", f"carrier row {row2} != B0 row {row2_B0}")
    if len([x for x in row2 if x not in (Q, W)]) < 4:
        note("C10", "second row does not survive terminal pair")

    if max(len(sel_class(d, B0, O1, c))
           for c in {d[O1][x] for x in B0}) < 4:
        note("C11", "no 4-class about o1 in B0")

    rP = names["rP"]
    if not (P1 != P2 and P1 not in CAP and P2 not in CAP
            and d[O1][P1] == rP and d[O1][P2] == rP):
        note("C12", "frontier pair not in ambient rP-marginal")
    if max(len(sel_class(d, B0, O2, c))
           for c in {d[O2][x] for x in B0}) < 4:
        note("C12", "no 4-class about o2 in B0 (secondApexDouble)")
    for src in (P1, P2):
        rest = [x for x in A if x != src]
        if max(len(sel_class(d, rest, O2, c))
               for c in {d[O2][x] for x in rest}) < 4:
            note("C12", f"no o2 4-class in A minus {src} (survives)")

    if O1 not in CAP:
        note("C13", "o1 not in cap")
    if not INTERIOR <= CAP:
        note("C13", "interior not subset of cap")
    if O1 in INTERIOR:
        note("C13", "o1 in interior")
    if not CAP <= set(A):
        note("C13", "cap not subset of A")
    if not len(CAP) > 4:
        note("C13", f"cap card {len(CAP)} not > 4 (surplus)")

    # C14 shell system
    for x in A:
        c = shells[x]
        if c == x or c not in A:
            note("C14", f"bad shell center {c} for {x}")
            continue
        shell_colors = [col for col in {d[c][y] for y in A if y != c}
                        if len(sel_class(d, A, c, col)) == 4
                        and x in sel_class(d, A, c, col)]
        if not shell_colors:
            note("C14", f"no exact-4 full class about c({x})={c} through {x}")
        rest = [y for y in A if y != x]
        for col in {d[c][y] for y in rest}:
            if len(sel_class(d, rest, c, col)) > 3:
                note("C14", f"criticality fails: c({x})={c} keeps a 4-class "
                            f"at color {col} after deleting {x}")
    if shells[P1] == O2 or shells[P2] == O2:
        note("C14", "blocker center equals o2")

    return bad


def negative_controls(d, names, shells):
    """Corrupt the model in targeted ways; checker must reject each."""
    results = {}

    # NC1: put an erased co-radial pair into the interior center's classes
    d1 = copy.deepcopy(d)
    d1[Z][P1] = d1[P1][Z] = 9990
    d1[Z][P2] = d1[P2][Z] = 9990
    results["NC1_capture_pair"] = "C5" in check(d1, names, shells)

    # NC2: destroy every 4-class through point S1 keeping named groups
    d2 = copy.deepcopy(d)
    base = 20000
    for y in A:
        if y != S1:
            d2[S1][y] = d2[y][S1] = base + y
    results["NC2_no_k4"] = set(check(d2, names, shells)) >= {"C2"}

    # NC3: two cap points on one o1-class
    d3 = copy.deepcopy(d)
    d3[O1][Z] = d3[Z][O1] = names["rT"]
    d3[O1][K1] = d3[K1][O1] = names["rT"]
    results["NC3_two_cap_hits"] = "C4" in check(d3, names, shells)

    # NC4: equal o2-colors inside the rT class (escape violation)
    d4 = copy.deepcopy(d)
    d4[O2][Q] = d4[Q][O2] = d4[O2][W]
    results["NC4_escape"] = "C3" in check(d4, names, shells)

    # NC5: second large o1-class on the carrier (uniqueness violation)
    d5 = copy.deepcopy(d)
    c5 = 30000
    for y in (S1, S2, S3, O2):
        d5[O1][y] = d5[y][O1] = c5
    results["NC5_uniqueness"] = "C8" in check(d5, names, shells)

    # NC6: break shell criticality (5-point class about a shell center)
    d6 = copy.deepcopy(d)
    c = shells[Q]
    col = None
    for cc in {d6[c][y] for y in A if y != c}:
        if len(sel_class(d6, A, c, cc)) == 4 and Q in sel_class(d6, A, c, cc):
            col = cc
            break
    extra = next(y for y in A
                 if y != c and d6[c][y] != col
                 and y not in sel_class(d6, A, c, col))
    d6[c][extra] = d6[extra][c] = col
    results["NC6_criticality"] = "C14" in check(d6, names, shells)

    return results


def main():
    rows = build_rows()
    d, names = build_table(rows)
    shells = build_shells(rows)
    bad = check(d, names, shells, verbose=True)
    ncs = negative_controls(d, names, shells)

    print(f"rows: {rows}")
    print(f"shells: {shells}")
    print(f"model constraints violated: {sorted(set(bad)) or 'NONE'}")
    print(f"negative controls (all must be True): {ncs}")

    ok = not bad and all(ncs.values())
    out = {
        "n": N,
        "cap": sorted(CAP),
        "interior": sorted(INTERIOR),
        "erased": sorted(ERASED),
        "carrier": CARRIER,
        "rows": {str(k): v for k, v in rows.items()},
        "shells": {str(k): v for k, v in shells.items()},
        "names": names,
        "n_colors": max(max(r) for r in d) + 1,
        "table": d,
        "valid": ok,
    }
    path = __file__.rsplit("/", 1)[0] + "/model.json"
    with open(path, "w") as f:
        json.dump(out, f, indent=1)
    print(f"model written to {path}; valid={ok}")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
