# Exact-seven role-coverage gate

Date: 2026-07-18 (lane opened at session takeover fd7b0078)

Status: **FIXTURE UNSAT EVIDENCE DOWNGRADED; NAMED-INTERIOR NORMAL FORM
IDENTIFIED; GATE DESIGN FIXED; ENUMERATOR NOT YET BUILT.**

This lane owns only `scratch/atail-force/exact7-role-coverage-gate/`.  It
continues the exact-seven branch of `DoubleApexOffSurplusSharedRadiusPair`
from the Round 124-156 frontier (see
`~/scratch/docs/closure-round12*.md` through `closure-round156-*.md` and
`scratch/atail-force/exact7-global-coradial-producer/REPORT.md`).

## Finding 1: the fixed-fixture QF_LRA UNSAT is an equilateral-hinge accident

`extract_fixture_unsat_core.py` re-encodes the sibling lane's
`solve_linear_distance_shadow.py` fixture with one tracked marker per
assertion and asks Z3 for a minimized unsat core.  The result
(`fixture_unsat_core.json`) has exactly four constraints:

```text
cls_eq|7|4    dist(7,4) = dist(7,3)   (support-locked class at center 7)
cls_eq|7|8    dist(7,8) = dist(7,3)   (same class)
cls_eq|8|7    dist(8,7) = dist(8,4)   (support-locked class at center 8)
cls_ne|4|7    dist(4,7) != dist(4,8)  (completeness of the class at 4)
```

Centers 7 and 8 each carry the other plus the common point 4 on their
complete critical circles, so `d(7,4) = d(7,8) = d(8,4)` (the shared edge
`7-8` identifies the two radii), forcing `d(4,7) = d(4,8)`; the complete
class at 4 contains 8 and excludes 7.  This is the known equilateral-hinge
/ mutual-membership collapse.  No triangle, Kalmanson, convex-order, or K4
constraint enters the core.

Consequence: the UNSAT of the fixed fixture came from that fixture's
arbitrary `CRITICAL_SUPPORT` choices, not from exact-seven structure.  The
sibling REPORT's "positive evidence that the exact-seven role collision may
make the linear geometry load-bearing" should be read as: one arbitrary
support table happened to contain a hinge.  Coverage over source-faithful
support choices remains genuinely open, and the expected outcome now
includes SAT survivors.

Replay:

```bash
UV_CACHE_DIR=/Users/adam/scratch/.uv-cache \
uv run --no-project --with z3-solver python \
  scratch/atail-force/exact7-role-coverage-gate/extract_fixture_unsat_core.py
```

Verdict-bearing output: `solver_result=unsat`, `core_size=4`,
`families={'cls_eq': 3, 'cls_ne': 1}`, `k4_in_core=False`.

## Finding 2: the aligned exact-seven cap interior is fully named

The closed exact-six slice
(`false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six`)
dies by counting: `five_le_card_of_periodThree_straddles` needs five strict
interior slots and a six-cap has four.  At exact-seven the same counting
saturates instead of overflowing.  Combining the recorded round facts:

- sources `s0,s1,s2` lie in the strict physical cap and `s1` lies strictly
  between `s0` and `s2` in the common strict-cap order (Round 125);
- the three transition blockers are pairwise distinct, lie in the strict
  physical cap, and each straddles its edge (Round 136, production
  all-reverse localization);
- alignment identifies the predecessor blocker with `s1` (Round 119/124);

the five strict-interior slots of the seven-cap are exactly
`{s0, b0, s1, b1, s2}` in the order

```text
endpoint < s0 < b0 < s1 < b1 < s2 < endpoint
```

(up to reflection), with `s1` at the middle slot — matching the Round
109-119 "successor is index 3" occurrence.  The two endpoints are the two
Moser vertices of the physical cap.  PROVEN as a single Lean normal-form
theorem: `Problem97.Round188ExactSevenNamedInteriorNormalForm` in
`/Users/adam/scratch/Round188ExactSevenNamedInteriorNormalForm.lean`
(SHA-256 `6424bc903740a6a98ddaee2f951044722fb325ba47dfe8708fb81f33adeaaa33`,
axiom closure `propext, Classical.choice, Quot.sound`, warnings-as-errors
clean, independently recompiled at takeover session).  Main declarations:

- `aligned_namedInterior_normalForm`: collision `H.centerAt s0 = s1`, the
  ten pairwise inequalities, the five strict-interior memberships, the
  Finset identity `capInterior = {s0, b0, s1, b1, s2}`, and the
  two-orientation shared-order chain
  `s0 < b0 < s1 < b1 < s2  ∨  s2 < b1 < s1 < b0 < s0`;
- `exists_exactSeven_aligned_namedInterior_normalForm`: existential form
  with the strictly-inside-MEC fact, aligned index from Round 124.

No fresh placement fact was needed; sources localize by
`PhysicalVertex.mem_capInterior`, reverse centers by
`transition_successor_actualBlocker_mem_physicalCapInterior`.
Closure doc:
`~/scratch/docs/closure-round188-exact-seven-named-interior-2026-07-18.md`.

Consequence: at exact-seven there are NO anonymous points in the physical
cap.  A finite role-coverage gate over the named system is portable to a
Lean coverage theorem; anonymity is confined to the other two caps.

## Finding 3: no single forced five-point occurrence by hand

The forced membership table (three reverse rows, exact-five class at the
second apex, first-apex role rows) was checked by hand against the
`FivePointCircleIsoscelesOrderCore` pattern.  Every candidate assignment
leaves at least one membership or one cyclic-order premise unforced; the
nearest miss is `(O, e, w, s0, s1)`, which fires only under an arc-position
choice for one exact-five extra member and one outside-pair member.  The
pattern is therefore a sound cut for the gate, not a direct terminal.

## Gate design

Per-schema variables: membership atoms over the named roles (seven cap
points, second apex, exact-five extras, reverse-row outside pairs,
first-apex row members), arc positions of the non-cap roles, identification
pattern among non-cap roles, blockers of the two cap endpoints (Round 152
alternative), same/distinct first-apex radius arms.

Constraint sources, all already-proven and Lean-portable: support-locked
complete classes at blocker values, exact 2+2 reverse rows, cap-chain
strict monotonicity, crossing/ordinal comparisons, cross-cap bisector
injectivity, witness-circle crossing, at-most-two cap hits per row, K4 at
every named center, strict triangle and Kalmanson on the boundary order.

Cut banks (sound clauses, reused from the exact-six gate infrastructure):
equilateral-hinge collapse (this lane, Finding 1 — radius-free, order-free),
five-point circle-isosceles order (Round 186 + Round 183 cyclic transport),
six-point planar terminals (Rounds 170/177).  Survivors go to exact QF_LRA;
QF_LRA-SAT survivors are the branch's genuine residual and must be answered
by geometry the gate does not encode (rank+winding curvature or a new
cross-row occurrence, per Round 166).

## Next steps

1. Lean normal-form theorem for Finding 2 (assemble rounds 119/124/125/136
   into one named-interior placement statement on the production packet).
2. Enumerator + encoder with two smoke gates: the sibling fixed fixture
   must reproduce UNSAT via the hinge cut alone; deleting the hinge
   memberships must go SAT (Round 156-style escape).
3. Full run modulo dihedral symmetry; census of verdicts; unsat-core audit
   for named-role-only support on every UNSAT schema.
