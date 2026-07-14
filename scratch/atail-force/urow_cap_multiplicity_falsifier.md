# U-row cap-multiplicity falsifier audit

Date: 2026-07-13

## Verdict

`URowCapMultiplicityFields` is **not implied by the strongest saved weakened
models**.  No target-faithful counterexample to the live theorem was found.

The most informative witness is the exact `(4,5,6)` residual.  It is a genuine
strictly convex Euclidean point configuration with exact four-point rows, the
saved source-indexed deletion-critical blocker map, and the three declared cap
arcs.  Its `p` and `u`-row center do share a cap, and the generic
selected-row/cap bound holds there, but only one dangerous row-support point
lies outside that cap.  Thus it refutes a genuine weaker Euclidean implication,
not just an incidence abstraction.  It does **not** refute the live producer:
the named Moser triangle is not a minimum-enclosing-circle frame, global K4
fails at eight centers, and the full live/no-M44/full-filter package is absent.

The exact live implication therefore remains **CONJECTURED**.  A proof must use
at least one field omitted by that residual—most plausibly MEC disk containment,
all-center K4, or stronger no-M44/live full-filter coupling.

## Predicate checked

For the chosen critical row at source `u`, with center `c`, support `R`, and
dangerous set `B = {q,t1,t2,t3}`, the checker substitutes each saved model into

```text
exists indexed cap C,
  p in C
  and c in C
  and 2 <= |R intersect (B \ C)|.
```

The report keeps the two open conjuncts separate:

1. **common-cap placement:** some cap contains both `p` and `c`;
2. **dangerous multiplicity:** in a common cap, at least two points of `R` are
   dangerous and outside that same cap.

It also records two already-known necessary consequences:

- at least two cap sizes are at least five, the cardinality consequence used
  from the no-M44/two-large-cap branch; and
- every cap containing the row center has at most two row-support points, the
  generic selected-row/cap bound.

## Results

| Saved artifact | common cap? | dangerous outside multiplicity | two caps `>= 5`? | generic center-cap `<= 2`? | Scope |
|---|---:|---:|---:|---:|---|
| exact residual `(4,5,6)` | yes, `O2` | **1** | yes | yes (`1` in each center cap) | exact strictly convex Euclidean weakened model |
| current common survivor `(4,5,6)` | yes, `O2` | **1** | yes | yes | finite necessary-condition shadow; real feasibility undecided |
| current common survivor `(5,5,5)` | **no** | not reached | yes | **no** (`3` in `S`) | finite necessary-condition shadow; visibly misses cap geometry |
| global-count shadow `(5,5,5)` | yes | **1** | yes | yes | strengthened exact incidence/order shadow |
| global-count shadow `(4,5,6)` | yes | **1** | yes | yes | strengthened exact incidence/order shadow |

The exact residual exposes the logical gap particularly cleanly.  Its common
cap is `O2`; the `u` row is `{0,2,5,6}` and the dangerous set is `{1,3,4,5}`.
At least two row points lie outside `O2`, as the generic cap-complement theorem
predicts, but only label `5` is both dangerous and outside.  The two complement
bounds cannot be identified: "outside the cap" does not imply "dangerous."

The strengthened global-count shadows make the same point while retaining
both the two-large-cap consequence and the generic center-cap bound.  Hence
those two facts, even together with the saved blocker provenance and finite
row/order consequences, do not force conjunct 2.

### W16/W20 bank

The old result files serialize 200 solutions per witness but only cap sizes.
The checker rematerializes the cap memberships from the exact witness source
coordinates and validates, before evaluation, that the dangerous row and
chosen `u` shell are the committed exact classes and that source membership
and center separation hold.

| Witness | total source solutions | serialized checked | no common cap | common cap but multiplicity `< 2` | fields hold |
|---|---:|---:|---:|---:|---:|
| W16a | 572 | 200 | 116 | 82 | 2 |
| W16b | 572 | 200 | 112 | 84 | 4 |
| W20 | 1020 | 200 | 137 | 63 | 0 |

These are **EMPIRICALLY VERIFIED** evaluations of the serialized exact-row
embeddings.  They are not live counterexamples: all three two-ring carriers
fail convex independence.  The named-Moser circumdisk check also varies (7,
0, and 10 outside points respectively), so the report records it without
claiming a complete MEC-frame adjudication.

The canonical falsifying solution `#0` in each of W16a, W16b, and W20 was also
replayed through `candidateB/sympy_verify.py` under a 60-second wall timeout.
All three passed exact minimal-polynomial checks for every committed class,
the dangerous `p` profile, total critical-shell coverage, and the named
noncollinearity predicate, with no near misses.

### Blocker-graph models

Both blocker-graph checkers still pass, but neither serializes a cap packet,
the live six-label placement, or a designated `u` row relative to those caps
and labels.  `URowCapMultiplicityFields` is therefore **PROVEN UNEVALUABLE**
from those artifacts.  Adding arbitrary cap or label choices would create a
new model rather than audit the saved one, so the checker refuses that move.

## Smallest honest model extension

No new SAT, SMT, CAS, or numerical search was needed.  The checker adds only
the two pieces omitted by serialization:

1. recover the fixed labels for the common-system checkpoints from
   `second_center_query/query.py::CASE_SEEDS` and reconstruct their canonical
   profile caps; and
2. rematch W16/W20 source cap coordinates to the saved exact-ring label order.

All subsequent work is bounded finite-set substitution.  Three hand-built
smoke cases check the positive, no-common-cap, and insufficient-multiplicity
branches.  Every saved candidate is rechecked against the pre-encoding row,
label, source-membership, and cap-membership predicates before its verdict is
counted.  The JSON pins every source digest and `--check` rejects byte-level
drift.

## Epistemic classification

- **PROVEN:** the blocker-graph files lack enough serialized fields to evaluate
  this proposition; the two open conjuncts are logically distinct; and the
  exact residual is not a live `CounterexampleData`/MEC model.
- **EMPIRICALLY VERIFIED, exact within the stated artifacts:** both common
  survivors, both global-count shadows, the exact residual's serialized
  finite predicate, and 600 saved W16/W20 embeddings have the reported
  outcomes.  The exact residual's Euclidean/convex status comes from its
  independent biquadratic and rational-interval checker.
- **CONJECTURED:** the full live hypotheses imply
  `URowCapMultiplicityFields`.  No artifact here proves or disproves that.

## Consequence for the proof route

Do not try to derive conjunct 2 by combining
`two_le_uRow_support_sdiff_dangerousBase` with
`two_le_uRow_support_sdiff_cap_of_center_mem`; the exact residual is a concrete
counterexample to that identification.  The next useful lemma must couple the
two complements.  A viable form would show, using MEC plus all-center K4 or
the stronger live/no-M44 data, that the non-dangerous part of the `u` row is
confined to a common cap.  That is precisely the sufficient condition already
named `URowCommonCapOffDangerousConfinement`.

Conjunct 1 also remains independently open: the current `(5,5,5)` common
survivor has no cap containing both centers.  A proof should therefore either
produce the common cap first and then prove non-dangerous confinement, or
replace both steps with a stronger producer whose geometric mechanism makes
the coupling explicit.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache PYTHONPATH=. \
  uv run python scratch/atail-force/urow_cap_multiplicity_falsifier.py --check

UV_CACHE_DIR=/tmp/codex-uv-cache PYTHONPATH=. \
  uv run python scratch/atail-force/residual_456_exact_witness.py --check
```

The first command performs no solver subprocess calls and terminates after the
pinned bounded replay.  The second independently refreshes the exact
biquadratic/convex residual certificate.
