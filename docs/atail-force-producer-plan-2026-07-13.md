# ATAIL-FORCE shared-radius producer plan (2026-07-13)

## Status and lane authorization

Adam explicitly authorized this card-at-least-12 work as genuine parallel
closure research. It remains required even if Census-554 closes card 11. The
card-11 Census process is now stopped and is not a dependency of this lane;
this lane does not resume it or launch card-head work.

Current status:

- `ATAIL-SUB2`: PROVEN, audited, and landed in Lean.
- `ATAIL-Q3`: DONE-NEGATIVE within its stated selected-four/two-center
  abstraction.
- `ATAIL-DISTINCT-REPLAY`: DONE-NEGATIVE for all equality-only routes.
- `ATAIL-EQ-PILOT`, `ATAIL-INEQ-PILOT`, and `ATAIL-CVC5-PILOT`:
  DONE-NEGATIVE-TRACTABILITY.
- `ATAIL-ORDER-FAN-1`: CHECKED-SCRATCH; one 15-hypothesis scalar
  incompatibility has a solver-free Lean proof, but its exact selected-four
  orbit matcher reaches only 39 of 167,782 systems.
- `ATAIL-FORCE`: OPEN-RESEARCH and load-bearing for `K-A-PAIR`.

The active proof-blueprint session anchor is
`Problem97.liveData_T1_ql1_srcl2_false`. The checked T1/T3 relabel adapters
reduce that orbit to the shared-radius K-A-PAIR residual, which is reachable
from `Problem97.u1_largeCap_routeB_tail_liveData_false` through
`false_of_center_p_t2_t20`; no new off-spine `sorry` is permitted.

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

## Five-row pair surface versus six-row live surface

The current source interfaces are not interchangeable. The pair theorem takes
`CriticalSourceRows`, whose fields are exactly the five rows sourced at
`q,t1,t2,t3,u`. The liveData theorem additionally takes the sixth row sourced
at `f2 := t2[0]` plus two comparison maps that certify same-critical-system
agreement when `f2` equals one of those five sources. Those three live inputs
are absent from `DoubleApexOffSurplusSharedRadiusPair`.

In particular, `hcritical : Nonempty (CriticalShellSystem D.A)` in the pair
statement does not relate the abstract five supplied rows to a chosen global
system. A new row can be selected from it, but the live comparison maps cannot
be reconstructed. The existing `false_of_center_p_t2_t20` adapter uses the
sixth row and one comparison map first, then calls the narrower pair theorem in
the specialized collapse branch.

Therefore ATAIL has two honest proof surfaces: prove the current five-row pair
theorem from exactly its statement, or consume the six-row inputs directly at
`u1_largeCap_routeB_tail_liveData_false` (possibly widening and immediately
threading the pair interface). The completed three-center census contains
neither the dangerous `p` row nor the sixth `f2` row. Full audit:
`docs/audits/2026-07-13-atail-sixth-row-scope.md`.

The live comparison maps now have a kernel-checked scratch normalization. If
`f2 = rows.sourcePoint source`, equality of the two centers and selected `l1`
points forces equality of the complete exact four-shell supports. The proof is
in `scratch/atail-force/critical_row_coupling.lean` and checks without a
`sorry`. This is useful provenance extraction, but it is not the producer:
different slot permutations of the common support survive in the T1/T3 cells.
The same scratch module also checks the routine implication from a joint
full-filter card lower bound of two to the exact distinct off-surplus pair and
four radius equalities consumed by the existing sink.

A second kernel-checked scratch module,
`scratch/atail-force/triple_relabel_adapters.lean`, shows that those T1/T3 slot
permutations do not require separate geometry. When `f2` equals `t1` or `t3`,
permute the dangerous triple so the transferred row becomes the existing pair
consumer's `t2Row`. The fixed-triple, rows, live data, and base pairwise packet
all transport. Once wired, this replaces all 48 LIVE-T1/T3 textual holes by
two orbit adapters depending on K-A-PAIR. It does not close K-A-PAIR and it
does not address LIVE-Q or LIVE-C.

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
   decision boundary. A manifest-bound seven-case full-inequality pilot
   classified none of them: all seven reached the 30-second solver timeout.
3. **Critical-row producer.** On the pair surface, use the five `rows`,
   `hcenter`, `hsupport`, and `H` hypotheses. On the live surface, also consume
   `f2CriticalRow` and its same-system comparison maps. Force either the
   full-filter overlap directly or the seven equalities consumed by
   `u1TwoLargeCapObstruction`.
4. **Direct contradiction.** Derive `False` from the same on-spine hypotheses
   without naming the pair, then eliminate into the existing existential.

The first concrete theorem-facing milestone, extraction from the cardinality
target to the exact `DoubleApexOffSurplusSharedRadiusPair` conclusion, is now
kernel-checked in the unimported scratch module. Card 11 is independently
closed, so it has no Census554/A11 dependency. It is not marked landed until
the pair-theorem owner can consume it on-spine without overwriting concurrent
work. The content-bearing milestone remains the lower bound itself. On the
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

`ATAIL-INEQ-PILOT` is also complete as a
**DONE-NEGATIVE-TRACTABILITY** diagnostic. Its immutable manifest selected the
same seven representatives, one in each interior-support stratum 6 through 12,
and included every emitted disk, nonobtuse, cap-sign, and global-order
inequality. One sequential Z3 4.16.0 QF_NRA/NLSAT process ran for at most 30
seconds per case and 240 seconds overall. All seven cases returned `TIMEOUT`;
the run consumed 219.901 seconds and produced neither a model nor an UNSAT
proposal. The result is bound to every exact generator digest and gives no
mathematical verdict. Increasing this budget or extending the run to the
30,997- or 167,782-case surfaces is rejected. The useful next step is theorem
extraction from the full-filter/critical-row hypotheses, not a larger blind
nonlinear sweep.

The released Census-554 resources funded one same-budget cross-engine check,
not a larger surface. `ATAIL-CVC5-PILOT` replayed the exact seven frozen system
digests with cvc5 1.3.3 nonlinear coverings, one effective-nice-10 process,
30 seconds per case, and the same 240-second aggregate wall. The nice/smoke
preflights passed; all seven cases reached the exact cvc5 timeout diagnostic in
219.217 seconds, with no SAT or UNSAT status. The immutable raw artifact's
statusless-timeout parser bug is independently normalized by
`cvc5_pilot_checkpoint.py`, which validates every manifest/system/SMT2 digest,
constraint ledger, return code, elapsed bound, and diagnostic and reports 7/7
`TIMEOUT`. This is again no mathematical verdict and closes the blind
cross-engine escalation option at this granularity.

`ATAIL-ORDER-FAN-1` then tested the prescribed smaller-subsystem successor.
For the frozen six-interior-point case, the equality, disk, nonobtuse, and
cap-side base is immediately SAT. Adding only the first seven cyclic-order
inequalities, the edge fan based at `v2 -> s1`, is repeatably Z3-UNSAT.
Conservative deletion reduces that proposal to 15 scalar hypotheses involving
only the Moser frame and three support points. The independent, solver-free
theorem `Problem97.ATAILForceScratch.orderFanKernel` proves that implication
in `scratch/atail-force/order_fan_kernel.lean`: two ordered surplus points
shared with the two adjacent apex classes are incompatible with the indicated
opposite-cap member of the second class.

The exact S3 matcher in `order_fan_coverage.py` finds that hypothesis pattern
in only 39 of the 167,782 selected-four order decorations, across 21 of the
3,375 joint classes. This is exact combinatorial coverage of that decision
surface, not live-leaf inventory coverage and not a full-filter producer.
A five-second bounded replay of the analogous edge fan on the other six frozen
interior-size strata returned `UNKNOWN` throughout; that is no evidence of
realizability or impossibility. The checkpoint validates theorem extraction
from materially smaller order subsystems, but its present reach is far too
narrow to close K-A-PAIR and does not authorize a bulk scan.

The seven LIVE-C helper contracts were also audited directly against
`CriticalRowPacket.center_ne_source`, K-A-PAIR's actual hypotheses, the bank
registries, and an indexed-corpus search. Center/source equality kills only
subcells where the extra `f2 := t2[0]` source is identified with its blocker
center; none of the seven helper contracts supplies that equality. They also
lack the p-centered exact-dangerous `t2Row` hypotheses required by K-A-PAIR.
This is a negative structural checkpoint, not a proof that no new LIVE-C
producer exists. LIVE-C therefore remains a separate six-row target.

This session is anchored at LIVE-T1, while the shared Route-B parent remains
owned by another live session. This lane therefore does not overwrite that
source; the scratch relabel certificate and the new order-fan theorem remain
off-spine until their immediate consumers can be wired without an ownership
collision.

## Closure priority and fallback

ATAIL-FORCE is the primary proof lane. The preferred theorem is uniform from
card 12 and uses full exact-radius filters together with convexity, global
order, no-M44, the actual five-row pair interface, or the stronger six-row live
interface. Every proposed relaxed intermediate must be checked against the
W16/W20 non-convex witness bank; a statement in the same equality/pattern
vocabulary cannot be promoted merely because a bounded sample dies.

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
