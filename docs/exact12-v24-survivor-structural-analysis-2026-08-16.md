# Exact-12 v24 survivor: direct structural analysis (2026-08-16)

Status: EMPIRICAL throughout — observations on one authenticated SAT model,
not theorems.  Source artifacts: preserved canary workdir
`scratch/arm-static-cell6-v24-live-5fc7ade0-20260815/` (survivor
classification `UNADMITTED_STRUCTURAL_SURVIVOR`, job `481226e1…`), the v24
all-order mining summary (sha `1b6ecc46…`), and the diagnostic certificate
(sha `959b160d…`).  Related commits: v24 mine `17a43fd8`; center-exchange
Lean producer `fd94b0f9`; 21st bank `72b776b5`.

## The survivor cube

One selected 4-element support row per center (the 12-literal cube of the
v24 cell-6 model):

| center | block | support |
|---|---|---|
| 0 | anchor | {1, 2, 3, 4} |
| 1 | anchor | {0, 3, 6, 8} |
| 2 | anchor | {0, 1, 10, 11} |
| 3 | surplus | {0, 5, 7, 9} |
| 4 | surplus | {0, 5, 6, 10} |
| 5 | surplus | {2, 7, 8, 11} |
| 6 | second | {1, 4, 5, 11} |
| 7 | second | {6, 8, 10, 11} |
| 8 | second | {5, 6, 9, 11} |
| 9 | second | {0, 3, 7, 11} |
| 10 | first-opp | {3, 5, 7, 8} |
| 11 | first-opp | {4, 5, 8, 10} |

Blocks: anchors {0, 1, 2}; second-opposite {6, 7, 8, 9} (2 internal
orders); surplus {3, 4, 5} (6 internal orders); first-opposite {10, 11}
(2 internal orders).  The frozen hypotheses leave 48 canonical boundary
orders (the "deck").

## Observations

1. **Degree concentration.**  Support-degree per label: 5 → 6, 11 → 6,
   0 → 5, 8 → 5, 3/6/7/10 → 4, 1/4 → 3, 2/9 → 2.  Labels 5 and 11 (one
   surplus, one first-opposite) each appear in half the rows.  The mined
   dominant core {5, 6, 7, 8, 11} sits on the heavy end and its pair
   support {a, b} = {5, 11} is exactly the two heaviest labels.

2. **Mutual triangle {5, 8, 11}.**  Of 48 membership arcs, 11 pairs are
   reciprocal: (0,1) (0,2) (0,3) (0,4) (1,6) (3,9) (4,6) (5,8) (5,11)
   (7,10) (8,11).  Three close a triangle: 5, 8, 11 each contain the
   other two.  A reciprocal containment 3-cycle echoes the survivor's own
   structural stage name (equality-three-triad-collision) but on a
   different label set than the certificate core — the model carries at
   least two triad-like structures and the current mine reports only the
   one its rule shape sees.

3. **Fully mutual star at the anchor.**  supp(0) = {1, 2, 3, 4} is
   completely reciprocated.  The certificate's closure paths reaching
   off-core centers {0, 1, 3} run along this star.

4. **Dispersion.**  No two supports share more than 2 elements
   (intersection histogram 0 → 9 pairs, 1 → 32, 2 → 25) and no support
   takes more than 2 labels from any one block.

5. **Reversible-block mechanism (the unifying observation).**  The v24
   escape used pair-centers 6 and 8 — a pair inside the reversible
   second block whose relative order flips with the block, which is
   precisely the center-exchange phenomenon proved and banked on
   2026-08-16.  The certificate core (6, 9, 7, 11, 8) consists entirely
   of reversible-position labels: the second block's endpoint pair
   {6, 9}, its middle pair {7, 8}, and first-opposite 11.  Together with
   observation 4, the model reads as systematically exploiting
   order-ambivalent pairs inside reversible blocks: the ≤2-per-block
   spread keeps every structural placement orientation-ambiguous across
   the 48-order deck.

## Prediction

CONJECTURED: if the v25 formula (21st bank chained) still admits a cell-6
model, the escape exploits a deck symmetry the pairwise x↔y widening does
not cover — surplus-block S₃ role cycling or an a↔b-type role flip (whose
rows differ under the flip, hence a genuinely different certificate
family) — rather than a new five-point shape.  Checkable on the next
model.

## Concrete actions (agreed 2026-08-16)

1. **Deck-closure gap measurement** — Python-only, against the live bank
   machinery: count realizable placements admissible up to the full
   48-order deck action (a↔b flip, surplus S₃) but outside every
   installed rule.  Zero kills the prediction cleanly; nonzero names the
   next gap classes before the solver finds them.
   **MEASURED 2026-08-16** (Klein widening {id, x↔y, a↔b, both};
   `scratch/rigid221-sourceheavy-anchor/center-exchange/measure_deck_closure_gap.py`,
   harness validated against the frozen 19,612/15,588/2,546 pins):
   because a↔b moves the triple row at c from {b, x, y} to {a, x, y} and
   the fired branch is order-dependent, a Klein certificate soundly blocks
   only the union pattern supp(x) ⊇ {a, b}, supp(y) ⊇ {a, b},
   supp(c) = {a, b, x, y}.  Result: 8,926 raw gap patterns, 6,991 with
   realizable union rows, 0 instances in the v24 survivor cube.  The
   predicted a↔b class is real and uncovered; every gap pattern genuinely
   mixes both branches (pure branches are already banked).
   **S₃ shape MEASURED 2026-08-20**
   (`scratch/rigid221-sourceheavy-anchor/core-pair/measure_s3_role_cycling_gap.py`,
   `docs/exact12-s3-role-cycling-gap-measurement-2026-08-20.md`): the
   fully-widened gap class is exactly the 36 five-label sets containing
   {3, 4, 5} — the predicted S₃ class is real and is the entire gap —
   but the v26 survivor holds no instance of it, and 0 of its 8 realized
   instances are coverable by any role-cycling widening (each has only
   its base and x↔y twin membership-valid, unorientable at 12–24 of the
   48 orders).  Both prediction branches are now refuted on the live
   survivors: a↔b for v25, surplus-S₃ for v26.
2. **Preview-solve the v25 CNF** as unauthenticated scratch diagnostics
   the moment the chaining lands, before the canary: a SAT preview model
   gets mined immediately for the uncovered exchanges; UNSAT predicts
   the canary outcome.  Authentication still flows only through the
   proved pipeline.
   **DONE 2026-08-16** (cadical on the v25 final CNF `81b4e2e2…`,
   680,299 clauses; SAT in 1.17 s; scripts and cube in
   `scratch/rigid221-sourceheavy-anchor/center-exchange/`): the decoded
   cube passes independent cube-ok, contains 0 installed strict and 0
   installed center-exchange instances (the new clauses bind), and 0
   Klein a↔b union instances — the model does NOT escape through the
   measured Klein gap class.  It realizes exactly 4 common-five
   row-instances, (8,5,9,0,7), (6,3,5,1,4), (9,7,4,3,10), (3,2,7,5,6)
   as (a,b,c,x,y), and every one is unorientable by every Klein variant
   at some canonical order.  EMPIRICAL, one unauthenticated model.
   Consequence for the prediction: the a↔b branch is refuted for this
   model; the surplus-S₃ / new-shape branch stands.  Consequence for
   action 3: the miner extensions are load-bearing for the v25 mine —
   the common-five orientation family (any widening) cannot refute this
   witness.
3. **Miner extensions for the next mine**: a reciprocal-triad detector
   (observation 2 is invisible to the current rule shape) and deck-aware
   core reporting (name the reversible-block positions a core occupies —
   this would have surfaced the center-exchange mechanism at v23).
4. **No speculative Lean**: the center-exchange bridge machinery
   generalizes (the order-extraction lemma is exchange-agnostic; each
   transfer variant is small), so prove additional exchange families
   only after actions 1–2 confirm the solver can reach them.

## Analysis-method gaps recorded in the same discussion

Beyond the above: steered survivors (MaxSAT minimizing overlap with known
rule shapes), projected model enumeration modulo symmetry (the 68 wave
witnesses collapse to 24 distinct models — the survivor space may be
small), and mining solver refutation streams (DRAT/learned clauses) as a
family-hypothesis source.  None started; recorded for prioritization.
