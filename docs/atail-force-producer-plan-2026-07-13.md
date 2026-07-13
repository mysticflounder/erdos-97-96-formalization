# ATAIL-FORCE shared-radius producer plan (2026-07-13)

## Status and lane authorization

Adam explicitly authorized this card-at-least-12 work as genuine parallel
closure research. It remains required even if Census-554 closes card 11. The
card-11 owner may therefore continue A11-WIRE-PAIR independently; this lane
does not edit that source split or launch card-head work.

Current status:

- `ATAIL-SUB2`: PROVEN, audited, and landed in Lean.
- `ATAIL-Q3`: DONE-NEGATIVE within its stated selected-four/two-center
  abstraction.
- `ATAIL-FORCE`: OPEN-RESEARCH and load-bearing for `K-A-PAIR`.

The proof-blueprint session anchor remains
`Problem97.u1_largeCap_routeB_tail_liveData_false`. The shared-radius theorem
is reachable from that parent through `false_of_center_p_t2_t20`; no new
off-spine `sorry` is permitted.

## Exact on-spine consumer

Let

```text
S := leafSurplusPacket (D := D) (MT := MT) (hCirc := hCirc)
       (CP := CP) (i := i) (hM := hM) (hsurplus := hsurplus).
```

The existing theorem
`DoubleApexOffSurplusSharedRadiusPair` must produce two distinct points of
`D.A`, both outside `S.surplusCap`, at common radii from both
`S.oppApex1` and `S.oppApex2`. The downstream theorem
`U2NonSurplusSqueeze.oppCap2_escape_gen` is already proved and immediately
turns such a pair into `False` by the two-circle reflection/sign argument.
The missing work is therefore a producer, not another geometric sink.

The preferred selection-robust producer target is the following cardinality
statement (pseudocode, not yet a Lean declaration):

```lean
∃ r ρ : ℝ,
  2 ≤ (((D.A.filter (fun x => dist x S.oppApex1 = r)) ∩
          (D.A.filter (fun x => dist x S.oppApex2 = ρ))) \
        S.surplusCap).card
```

This is exactly strong enough. A two-element extraction supplies `x`, `w'`,
membership, distinctness, both off-surplus facts, and the four radius
equalities consumed by `oppCap2_escape_gen`. It is also honest about the
mathematical crux: the overlap must be forced for full exact-radius filters,
not for one arbitrarily truncated selected-four support.

## What ATAIL-Q3 decided

The historical Q3 sweep in `census/q3_two_center/` is complete:

- 87 mirror-reduced joint classes;
- 68 exact rational realizations;
- 4 exact realizations over `Q(sqrt(3))`;
- 15 classes reported killed by K-Q3-1/K-Q3-5; and
- zero unclassified classes.

Applying the Q3 joint kills simultaneously to all three Moser pairs leaves a
stored SAT assignment for every unordered cap profile at each card 12--16:
22 profiles under the base proved cuts and the same 22 after the SUB2 cuts.
This is an exact statement about the finite token model, not a real
configuration counterexample.

The permanent checkpoint is:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run --with sympy python -m census.q3_two_center.checkpoint --check
```

It exact-replays all 72 realized windows, rejects a radius mutation in every
case, validates all 44 stored profile/tier assignments against C1/C2/C4/H1,
the per-type cuts, and both Q3 joint kills, pins every input digest, and runs
the repaired falsifier gate. The falsifier gate covers 9 banked configurations
and 396 nonobtuse boundary triangles with no hit; that gate is explicitly
guard-banded floating evidence. The checkpoint does not independently replay
the 15 hand/Z3 kill proofs.

Consequently, a single selected-four `{V,W}` window is terminal as a closure
mechanism. Re-running or enlarging that same class menu is not ATAIL-FORCE.

## First three-center successor checkpoint

`census/atail_force/` now restores the first piece of information omitted by
Q3: the selected-four classes at all three Moser vertices use the same support
points and must fit one global convex order. The permanent preflight:

```bash
UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run --with sympy python -m census.atail_force.checkpoint --check
```

independently parses and replays every row in the pinned 3,375-class
L2/full-participant inventory. It checks the three selected-four counts,
own-center exclusion, H1, pairwise overlap, the mask-7 consequence of C4, and
both proved Q3 joint kills for all three Moser pairs. It then restores all
membership-distinct permutations inside the three cap blocks. The exact count
is 167,782 global-order systems, with 6--12 interior support points, 19--31
variables, exactly 14 equalities, 9--15 weak inequalities, and 106--495 strict
inequalities. The largest single class has 1,728 order decorations.

`three_center_surface.py` constructs the exact rational polynomial generators,
including the common MEC frame, all three class radii, disk/nonobtuse/cap-sign
constraints, and every cyclic triple in the single order. It also exposes the
pairwise-distinctness and triangle-area separators needed by a future
equality-ideal engine. The checkpoint pins the source inventory and generator
digests and materializes representative systems as a construction gate.

No solver was invoked, no geometric row was classified, and no Lean
leaf-to-inventory extraction was proved. In particular, the checkpoint does
not upgrade representative-surface completeness into geometric coverage and
does not force the full-filter overlap. Its status is
`PREFLIGHT_COMPLETE_NO_SOLVER_RUN`, while ATAIL-FORCE remains OPEN-RESEARCH.

The exact finite reduction is also complete at the combinatorial boundary.
All six simultaneous Moser-vertex/center relabelings act on the inventory and
the cyclic decorations. The 3,375 classes form 590 S3 orbits; keeping every
order of one representative leaves 30,997 cases. Independently, cap/order
forgetting leaves 343 distinct 14-equation skeletons, or 70 S3 orbits. All
20,250 class/permutation edges and canonical-order inverse round trips are
checked. This does not classify any system. The fixed-gauge
similarity/reflection transfer is mathematically standard and documented in
the Q3 formulation, but the checkpoint honestly records that it has no
independent algebraic transfer certificate yet.

The bare 14-equation layer is already a proved negative terminal, without a
solver. Put the Moser triangle at unit equilateral coordinates, set all three
class radii to one, and place each interior support point at a Moser vertex
omitted by its membership mask. K-Q3-5 leaves no mask 7, so such a vertex
always exists. The checkpoint exact-replays this `Q(sqrt(3))` substitution for
all 343 raw equality skeletons and rejects three radius mutations per skeleton
(1,029/1,029). These are intentionally collapsed witnesses: they do not pass
pairwise-distinctness separators or the strict cap/order inequalities. Thus an
unsaturated equality-ideal sweep cannot kill any case and should not be run.

## Existing-theorem-bank audit

The required registry and indexed-corpus searches were run before formulating
the new target.

Reusable results already present include:

- `SelectedFourClass.inter_card_le_two`: selected classes at distinct centers
  overlap in at most two points;
- `eq_of_equidistant_three_noncollinear`: three common noncollinear points
  force the two centers equal;
- `outsidePair_unique_capCenter` and
  `U2NonSurplusSqueeze.oppCap2_escape_gen`: the desired two-point outside pair
  is already contradictory; and
- the Census-554 equality and cyclic-separation cores, which consume an
  already-present shared pair but do not produce one.

The sibling-only theorem
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
is genuinely source-proved. It rules out a particular five-point/seven-
equality pattern, but prior constrained-cube work found that pattern absent in
3,713 of 4,000 cubes. It is another sink unless a completeness theorem forces
its seven equalities.

The sibling declaration
`RVOL.P97.U1LargeCapRouteBTail.DoubleApexOffSurplusSharedRadiusPair` is not an
independent proof: its body is a `simpa` re-export of the inner declaration
that still contains `sorry`. The mining registry's source-proved label on the
wrapper therefore cannot be used as closure evidence.

No searched bank theorem forces the required full-filter overlap from the
current two-large-cap, no-M44, critical-shell, and convexity hypotheses.

## Required strengthening beyond Q3

Any viable producer must add information lost by the selected-four Q3
abstraction. At least one of these must become a theorem:

1. **Full-filter coupling.** Choose the K4 radii at both opposite apices but
   retain the entire exact-radius filters. Use cap cardinalities, convex order,
   and the no-M44 alternative to force their off-surplus intersection to card
   at least two.
2. **Order-coupled multi-window forcing.** Couple more than one decorated
   Moser-pair window through shared point identities and one global convex
   order. Independent per-pair Q3 predicates are insufficient; the stored
   token assignments already satisfy all three simultaneously. The
   `census/atail_force/` surface now gives this route a fixed 167,782-case
   decision boundary, but none of those cases has been solver-classified.
3. **Critical-row producer.** Use the live `rows`, `hcenter`, `hsupport`, and
   `H` hypotheses to force either the full-filter overlap directly or the
   seven equalities consumed by `u1TwoLargeCapObstruction`.
4. **Direct contradiction.** Derive `False` from the same on-spine hypotheses
   without naming the pair, then eliminate into the existing existential.

The first concrete theorem-facing milestone is an extraction lemma from the
cardinality target above to the exact `DoubleApexOffSurplusSharedRadiusPair`
conclusion. Card 11 is independently closed, so this routine helper is now the
immediate Lean milestone and has no Census554/A11 dependency. Before editing
the shared source file, refresh `proof-blueprint anchor list` and inspect its
current diff. The content-bearing milestone is the lower bound itself. On the
geometric-decision branch, the symmetry/equality-skeleton reduction is now
done. The bounded separator-saturated exact pilot is now
**DONE-NEGATIVE-TRACTABILITY**: all seven deterministic strata hit their
20-second limit, produced no output, and consumed 141.357 seconds in total.
This gives no emptiness, dimension, or mathematical verdict, and increasing
the same `msolve` budget is rejected.

`ATAIL-DISTINCT-REPLAY` is now complete. The exact checkpoint constructs one
separator-satisfying algebraic witness for every one of the 343 raw equality
skeletons and verifies 4,802 equalities plus 19,978 pairwise-distinctness and
nondegenerate-triangle separators. All coordinates are proved real in all 343
rows. The checkpoint checks no disk, nonobtuse, cap, or global-order inequality
and proves no full configuration, full-filter pair, or Lean claim.

Therefore both the bare and separator-saturated equality-only routes are
**DONE-NEGATIVE**, including over real algebraic coordinates. This is
theorem-discovery evidence, not a counterexample to ATAIL-FORCE or a substitute
for the lower-bound theorem. The next candidate must use real
cap/disk/nonobtuse/global-order inequalities or a direct full-filter or
critical-row producer. No bulk 30,997- or 167,782-case nonlinear run is
authorized.

## Closure priority and fallback

ATAIL-FORCE is the primary proof lane. The preferred theorem is uniform from
card 12 and uses full exact-radius filters together with convexity, global
order, no-M44, or the six critical rows. Every proposed relaxed intermediate
must be checked against the W16/W20 non-convex witness bank; a statement in the
same equality/pattern vocabulary cannot be promoted merely because a bounded
sample dies.

AHEAD CEGAR remains a bounded cards-12--14 fallback. Its declared wall,
bank-growth, and shape-staleness stops are binding, and a policy-stopped run is
a durable nonterminal result rather than a reason to extend the budget. If the
uniform producer naturally requires card at least 15, a checked AHEAD cover may
discharge the head before that threshold is introduced on-spine. If the
producer works from card 12, the head census is unnecessary for closure.

Any bounded forced subsystem found here must also be tested as a shared
producer for the LIVE-Q/T1/T3 permutation orbits and the seven LIVE-C branches.
The intended consumption unit is a complete orbit family, not one of the 79
textual holes in isolation.

## Acceptance gates

- The producer is stated only from hypotheses actually present at the current
  shared-radius declaration.
- No selected-four or finite-token SAT result is promoted to a full geometric
  statement.
- Any solver-derived impossibility has exact generator fidelity and an
  independently replayed certificate before it is called proved.
- Banked witnesses remain regression gates for every new universal lemma.
- No new `sorry`, axiom, or unconsumed theorem is introduced.
- Completion means the existing shared-radius declaration is sorry-free,
  target-build clean, and absent from `proof-blueprint symbols --with-sorry`.
