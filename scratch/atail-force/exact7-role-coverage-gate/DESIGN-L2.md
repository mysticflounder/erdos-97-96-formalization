# L2 design: unused-critical-row dimension (2026-07-19, questions resolved)

Status: PROVENANCE PINNED, all three open questions from the 2026-07-19
stub resolved against the production sources.  The no_qfree sublayer is
censused (Finding 12: inert).  Remaining: the L2u equality probe.

## Why this dimension is sound for the exact-seven branch

`S.oppCap2` is the closed physical cap `{EA, W, s0, b0, s1, b1, s2}`
(card 7 in this branch, so `6 ≤ S.oppCap2.card` holds outright), and
`nonempty_largeCapUniqueFiveUnusedCriticalRow`
(LargeCapUniqueFive.lean:227) is UNCONDITIONAL given the profile +
shell system — every survivor configuration carries the structure.
Adding it to the census is a sound refinement, not a case split.

Stronger: `CriticalShellSystem` (U1CarrierInjection.lean:1015) supplies
a full critical shell through EVERY carrier point with a `no_qfree`
blocker; the unused-point instance is the one whose extra structure
(center ≠ O) is proven.  For any q, `centerAt q ≠ O` also follows
directly: erasing one point leaves class(O) with ≥ 4 members, so K4 at
O survives every single deletion while `no_qfree` fails at the blocker.

## Production facts (all read at source, 2026-07-19)

The row is `CriticalSelectedFourClass A u c` = `CriticalFourShell` + 4
distinct labels (U1CarrierInjection.lean:547-561, 635-652):

- `center_mem : c ∈ A.erase u` — c ∈ A, **c ≠ u**;
- `support_eq : support = A.filter (dist c · = radius)` — the row is
  the FULL radius class: every named point off the row is at a
  different distance from c (exactness excludes, same treatment the
  retro schemas give reverse rows);
- `support_card = 4`, `q_mem_support : u ∈ support`, `radius_pos`;
- `blocker_ne_physicalApex : c ≠ O`; `blocker_mem_A : c ∈ A`;
- `source_deletion_blocked_at_blocker` (= `H.no_qfree_at u`): no
  4-subset of A ∖ {u} is co-radial at c at ANY radius → `no_k4` family
  (avoid = {u}).

### Q1 (u-candidate set) — RESOLVED

`u ∈ S.oppCap2 ∖ class(O)`.  class(O) = {s0,s1,s2,e1,e2}; an e-extra
landing at a cap endpoint puts that endpoint in class(O).  Per
surviving e-pattern:

| e-pattern | u candidates |
|---|---|
| eS-O1  | EA, W, b0, b1 |
| eS-W   | EA, b0, b1 |
| eO1-EA | W, b0, b1 |
| eEA-W  | b0, b1 |

### Q2 (center placement) — RESOLVED

A `floating` uc is provably toothless: its distance variables occur
only in row/no_k4/exclusion constraints and any assignment extends by
d(uc,x) = M + ε_x (row members exactly M) satisfying lower + triangle.
So the L2-coarse level is skipped entirely.  Teeth require uc placed:

- **named**: uc ∈ named ∖ {O, u} — separate schema per identification
  (pairwise-distinctness contract).  m = O is allowed as a row MEMBER
  (no production exclusion) — and O-coupling is where Laws A/B lived.
- **fresh in a bag**: uc joins the S-bag or O1-bag block; conditional
  Kalmanson handles interleavings without schema splits.  A fresh uc
  cannot sit in the physical arc: oppCap2 has card exactly 7 here and
  all 7 points are named.

### Q3 (TwoCommonDeletionSources content) — RESOLVED

`actualUnusedRow_physicalInterior_inter_card_le_one` (LowHit.lean:46)
bounds `(class(O) ∩ physical interior) ∩ row` — i.e. **the row carries
at most ONE source** (s0/s1/s2).  The 2026-07-19 stub misread this as
"row ∩ physical interior ≤ 1"; b0/b1 are NOT class members and are not
limited by it.  `nonempty_twoCommonDeletionSources_of_unusedCriticalRow`
(LowHit.lean:142) yields two sources off the row whose survival fields
are DERIVED from off-row membership (no independent censal content);
its `CommonDeletionTwoCenterPacket.overlap_le_two` rests on
`U5QDeletedK4Class.inter_card_le_two` — the citable two-circle bound:

- row ∩ class(O) ≤ 2 (uc ≠ O always);
- row ∩ r_i ≤ 2 when uc ≠ center(r_i); row ∩ r_i = ∅ when
  uc = center(r_i) (same center, different radius since u ∉ r_i:
  r_i ∩ closed cap = {source, successor} and u ∉ sources).

These are enumeration budgets on the named members M.

## Census layering

- **L2n (DONE, Finding 12)**: `no_k4` at the three named reverse-row
  centers (b0∖s0, b1∖s1, s1∖s2) on all 876 survivors — 876/876 SAT.
  Pure-disequality family, inert, consistent with Law C.
- **L2u probe (NEXT)**: bare single equalities d(uc,u) = d(uc,m) —
  the factored named-part of the unused row (a kill transfers a
  fortiori to every completion, exactly the l1f logic).  Stratified
  survivor sample × all (uc, u, m) patterns; uc over named ∖ {O,u}
  plus one fresh-bag variant per arc.  Scale only killing patterns to
  the full 876/324.
- **L2u full (CONDITIONAL)**: if the probe kills, factor the killing
  pattern classes and census them against all survivors; decorate with
  |M| ≥ 2, budgets (≤1 source, two-circle ≤2s), and no_k4 only for
  Lean-port core extraction, not for coverage (Law C).

## Lean-port shape for any L2u kill

Same assembly as the Finding 10 note: the unused-row equality supplies
one radius equation at a placed center; the base schema's Kalmanson
kernels supply the ordered-terminal contradiction.  Producer side is
unconditional: `nonempty_largeCapUniqueFiveUnusedCriticalRow` +
Round 188 alignment to place uc among the named/arc positions.
