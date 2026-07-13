# ATAIL-FORCE shared-radius producer plan (2026-07-13)

## Status and lane authorization

Adam explicitly authorized this ATAIL work as genuine parallel closure
research. The live pair declaration is stated under `9 < D.A.card`; the two
large-cap hypotheses imply only `11 ≤ D.A.card`. No current theorem closes its
card-11 slice. Therefore ATAIL must be uniform from card 11, or the separate
A11 Census cover/consumer must return as a dependency for that slice. The
card-11 Census process is stopped at a nonterminal bank and is not resumed
implicitly. The released compute pool is available for a freshly manifested
successor.

That authorization includes proof-local analysis files, scratch Lean/Python
artifacts, bounded theorem-discovery computations, theorem-bank searches, and
closure-document synchronization needed to pursue this proof without
per-artifact permission. It does not transfer ownership of the separately
worked Route-B/LIVE-T1 source and does not authorize destructive or unrelated
external actions.

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
- `ATAIL-CAP-KERNELS-1`: CHECKED-SCRATCH; two order-free scalar
  incompatibilities have explicit Lean proofs. Together with
  `ATAIL-ORDER-FAN-1`, the exact union matcher reaches 129 of 167,782 systems
  across 45 joint classes, with no overlap among the three cuts.
- `ATAIL-LIVE-PROVENANCE`: CHECKED-SCRATCH; the outer wrapper's common
  `CriticalShellSystem` is retained through the five source rows and the extra
  `f2` row. An exact source-contract census covers all 35 helpers and all 79
  textual holes. The same current contracts also force a two-point
  off-dangerous subset of the `f2` support in all seven LIVE-C helpers. A
  corrected finite incidence census gives explicit witnesses for all seven
  families and forces none of the three modeled incidence sinks.
- `ATAIL-JOINT-FIBER-SINK`: CHECKED-SCRATCH; every fixed pair of opposite-apex
  radii has at most one carrier point outside the surplus cap. Each apex also
  has a K4 radius with at least three off-surplus points, so marginal K4 counts
  cannot produce the required collision without additional cross-apex
  correlation.
- `ATAIL-BLOCKER-GRAPH-GATE`: DONE-NEGATIVE at the blocker abstraction. Exact
  finite and Euclidean non-convex witnesses show that global K4, deletion
  criticality, blocker cycles, and overlap at most two do not force the fixed
  opposite-apex joint pair.
- `ATAIL-SAME-CAP-BOUNDARY`: CHECKED-SCRATCH; the dangerous `p` row supplies
  two points outside any indexed cap containing `p`, the `u` row is proved to
  have center different from `p`, and an exact proposition packages the only
  remaining datum: a second distinct center in the same cap equidistant from
  that outside pair. Its `.false` theorem immediately applies
  `outsidePair_unique_capCenter`. All audited endpoints use only the standard
  core axioms.
- `ATAIL-FORCE`: OPEN-RESEARCH and load-bearing for `K-A-PAIR`.

At this checkpoint, session `019f5a3d` is durably anchored at
`Problem97.u1_largeCap_routeB_tail_liveData_false`; session `019f4dd4`
separately owns LIVE-T1. Anchor state is maintained with `proof-blueprint
anchor`, not by editing generated `docs/live-blueprint.md`. The checked T1/T3
relabel adapters reduce that orbit to the
shared-radius K-A-PAIR residual, which is reachable from the umbrella through
`false_of_center_p_t2_t20`; this lane does not edit the shared Route-B source
or introduce a new off-spine `sorry`.

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

The sink has now been repackaged in the exact finite-set vocabulary in
`scratch/atail-force/apex_filters/joint_fiber_upper_bound.lean`. The checked
theorem `doubleApexJointFiber_sdiff_surplus_card_le_one` proves that every such
fixed joint fiber has cardinality at most one. The same module proves that K4
still supplies, separately at each opposite apex, a radius with at least three
carrier points outside the surplus cap and at least two in the strict interior
of its own opposite cap. On each three-point marginal, distance to the other
apex is injective. Thus the target lower bound is not a pigeonhole consequence
of the two marginal K4 classes: it must use a hypothesis that correlates the
two apex partitions. The complete theorem, axiom, applicability, and
circularity audit is
`docs/audits/2026-07-13-atail-apex-filter-assessment.md`.

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
kernel-checked in the unimported scratch module. Card 11 remains open on the
live Front-A spine: no `D.A.card = 11 → False` theorem is imported
by the leaf. The helper has no Census dependency, but a proof that starts only
at card 12 would still require A11-CONSUME and leaf wiring. It is not marked
landed until the pair-theorem owner can consume it on-spine without overwriting
concurrent work. The content-bearing milestone remains the lower bound itself.
On the
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

The complete bounded m=6 edge-fan diagnostic then checked all seven S3 class
representatives, all 25 representative order decorations, and all nine
oriented edges per decoration: 225 queries at 250 ms each. The order-free
base histogram was 7 `SAT`, 12 `UNKNOWN`, and 6 `UNSAT`; the edge-fan
histogram was 26 `SAT`, 155 `UNKNOWN`, and 44 `UNSAT`. These are solver
diagnostics only. The six base `UNSAT` rows were exactly four decorations of
class 2422 and two of class 2472, and both orbit proposals were independently
reduced and proved instead of being promoted from solver output.

`Problem97.ATAILForceScratch.bisectorCapKernel` proves the eight-hypothesis
class-2472 core: equal-radius equations put two points on the same base
perpendicular bisector, making the two strict cap signs additive inverses.
`Problem97.ATAILForceScratch.twoCircleCapKernel` proves the eleven-hypothesis
class-2422 core: one cap witness forces the Moser apex left of the base
midpoint while the second two-circle/cap witness forces it right. Both proofs
are solver-free and live in `scratch/atail-force/`.

The exact simultaneous-S3 union matcher scans all 167,782 decorations. The
three disjoint cuts reach 39 systems / 21 classes for `orderFanKernel`, 66 / 18
for `bisectorCapKernel`, and 24 / 6 for `twoCircleCapKernel`: 129 systems in 45
classes total, leaving 167,653 systems. This proves useful local theorem-bank
content but also supplies a stopping rule: blind selected-four kernel mining
is no longer the primary lane unless a new forcing theorem makes one of these
patterns unavoidable. The next content-bearing target is the full-filter or
critical-row producer on the actual K-A-PAIR/K-A-LIVE hypothesis surface.

## Retained critical-system provenance and LIVE-C delta

The seven LIVE-C helper contracts were first audited directly against
`CriticalRowPacket.center_ne_source`, K-A-PAIR's actual hypotheses, the bank
registries, and an indexed-corpus search. Center/source equality kills only
subcells where the extra `f2 := t2[0]` source is identified with its blocker
center; none of the seven helper contracts supplies that equality. They also
lack the p-centered exact-dangerous `t2Row` hypotheses required by K-A-PAIR.
This is a negative structural checkpoint, not a proof that no new LIVE-C
producer exists. LIVE-C therefore remains a separate six-row target.

The outer Route-B wrapper does carry more information than those helper
signatures expose: it constructs `rows` and `f2CriticalRow` from the same
`CriticalShellSystem`. The checked scratch packet
`U1Depth5.LiveCriticalRowProvenance` retains the constructor equalities and
recovers every row's deletion-blocker fact. Its support coupling reuses the
existing theorem-bank result
`CriticalShellSystem.selectedFourClass_support_eq_shell`: two system rows with
the same blocker center have the same complete support, without a source
collision or selected-slot equality.

The exact audit in
`scratch/atail-force/provenance_contract_audit.py` pins the current boundary:

- all 35 helpers receive only an unlinked
  `Nonempty (CriticalShellSystem D.A)` and none receives the provenance packet
  or the `f2` deletion-blocker fact;
- the 28 p-centered LIVE-Q/T1/T3 helpers already transfer full support through
  their current comparison maps, so provenance rederives rather than enlarges
  that part of their contracts;
- all 35 would regain `f2Row_no_qfree` from the retained packet;
- six named-center LIVE-C helpers become instances of the statement that every
  selected K4 row at the `f2` blocker center contains the `f2` source and is
  exactly the `f2` critical support; the fresh-center helper has the same
  blocker statement without a packet-label name.

This is not itself a contradiction. It positively realizes the f2-critical
branch of the global-K4 dichotomy: asking for another selected class at the
same center cannot produce a different row. The checked adapter
`f2Row_to_qCriticalTriple` packages `f2Row.support.erase f2` directly as the
existing `U5QCriticalTripleClass`; it exposes the surviving arm in the U5
consumer vocabulary but does not close it. The reusable positive output is
instead the checked theorem
`two_le_f2Row_support_sdiff_dangerousBase`. Since every LIVE-C blocker center
is distinct from `p`, the two-circle intersection bound gives at least two
points in
`f2Row.support \ {q,t1,t2,t3}`. The contract census confirms that this applies
to all seven LIVE-C helpers without widening their current signatures; the
witness form `exists_two_f2Row_support_off_dangerousBase` extracts two distinct
support points explicitly.

The bounded incidence-only follow-up is now **DONE-NEGATIVE, exact within its
stated finite model**. `scratch/atail-force/incidence_delta_census.py` retains
four-point supports, source membership, the actual `f := t2[0]` and
`f5 := t2[1]` placements in the `t2` source row, center/source separation,
equal-center support coupling, all distinct-center two-circle overlap bounds,
the conditional comparison maps, all seven center branches, and the two
special `t2` subbranches. It stores one explicit witness per family. All 7/7
validate as `SAT_INCIDENCE_ONLY`, with zero forced second center collision,
zero support containing `q` plus two dangerous points, and zero five-source
support. The witness digest is
`78d6ea82c294e8dd2943f1dec50e9bf51a6de88bbef91c34f649c2f28a115a3e`.
The witnesses deliberately choose `f` distinct from the five packet sources,
so the live conditional comparison maps are valid vacuously; unlike the first
draft, they correctly place both `f` and `f5` in the `t2` row.

This is not a Euclidean or convex realization and does not model the metric
fields of existing consumers. It terminates only the attempt to force a sink
from the enumerated incidence facts alone. Any next producer must use
additional cap/order/full-filter or metric content.

The next producer must add one of the facts the row census still lacks:

1. prove that those two off-dangerous points are outside the relevant surplus
   cap and co-radial from both opposite Moser apices (either by identifying the
   f2 center with one apex and proving the other radius, or independently),
   which would turn them into the K-A-PAIR witness; or
2. confine the two points to a bounded anchor/support inventory and supply the
   missing class-center equalities needed by a banked U5 incidence consumer; or
3. derive a second, distinct-center full-filter class whose overlap with the
   f2 support is forced beyond the two-circle bound.

The checked artifacts are
`scratch/atail-force/live_critical_provenance.lean` and
`scratch/atail-force/provenance_contract_audit.py`; the bounded negative census
is `scratch/atail-force/incidence_delta_census.py`. They remain off-spine while
the shared Route-B source and LIVE-T1 are separately owned.

## Critical-row finite-shadow metric discriminator

A stronger saved-row follow-up retained one selected four-point row at every
center, pairwise support overlap at most two, a common cyclic order satisfying
every shared-pair separation, and avoidance of all currently formalized metric
cores. It produced one candidate for each of the `(4,5,6)` and `(5,5,5)`
internal card-12 block-profile labels; `(4,5,6)` is not the closure matrix's
labeled-cap tuple order. These are finite-shadow witnesses, not Euclidean
models, and no profile-orientation bridge is claimed.

`scratch/atail-force/critical_row_metric_discriminator.py` now gives the exact
metric-model computation. Singular returns `UNIT` over `QQ` for an eight-row,
24-equality subsystem of the `(4,5,6)` candidate and a seven-row,
20-equality subsystem of the `(5,5,5)` candidate. Hence both full
36-equality systems are excluded by a trusted exact-arithmetic CAS computation
in the normalized distinct-point gauge. No Nullstellensatz certificate was
independently replayed. The result is exact within this algebraic model for
the two saved candidates but is not an exhaustive critical-row census or a new
Lean theorem.

Equality-level deletion exposed large rigidity networks rather than a small
common core, and a certificate-lift attempt timed out at 180 seconds. This
rejects verbatim formalization and further blind core mining from the two
examples. Their useful output is a sharper producer target: start from the two
off-dangerous `f2`-support points already forced by retained provenance, then
use actual convex/cap localization to put that pair in the required second
full-filter class and consume
`CapSelectedRowCounting.outsidePair_unique_capCenter`, or identify the two
centers with the opposite Moser apices and prove K-A-PAIR directly. A generic
second-center or blocker-cycle statement is insufficient. Full scope and the
`msolve` raw-parser regression are recorded in
`docs/audits/2026-07-13-atail-critical-row-metric-discriminator.md`.

## Blocker-graph gate and marginal anti-pigeonhole boundary

The blocker-map route has now been tested at the strongest relaxed interface
that it naturally supplies. `scratch/atail-force/blocker_graph/countermodel.py`
checks a 12-vertex symmetric distance-equality structure with a spanning
blocker cycle, one exact four-class at every center, global deletion
criticality, and distinct-center support overlap at most two. Even with both
fixed centers on the cycle, every two-center joint fiber has cardinality one.

The independent
`scratch/atail-force/blocker_graph/euclidean_countermodel.py` checks a fixed
33-point integer-coordinate Euclidean set with global K4, failure of global K4
after every single deletion, genuine blocker cycles, and an injective
two-center distance map. This second witness is deliberately not convex
independent, so it is not a counterexample to K-A-PAIR. It proves exactly that
Euclidean realizability plus blocker structure still does not replace the
live convex/Moser/cap hypotheses.

Therefore no further cycle-length, spanning, or blocker-surjectivity
classification is a closure step. Any blocker-based successor must explicitly
derive an off-surplus overlap of cardinality at least two for exact shells at
the two fixed opposite Moser apices from convexity, cap sizes/order, no-M44, or
the actual critical-row packet. Otherwise it merely renames K-A-PAIR. Full
hypothesis mapping and replay commands are in
`docs/audits/2026-07-13-atail-blocker-graph-assessment.md`.

## Closure priority and fallback

ATAIL-FORCE is the primary proof lane. The preferred theorem is uniform from
card 11 and uses full exact-radius filters together with convexity, global
order, no-M44, the actual five-row pair interface, or the stronger six-row live
interface. Every proposed relaxed intermediate must be checked against the
W16/W20 bank and the new blocker-graph witnesses; it must name the live
convex/cap/full-filter hypothesis that excludes them. A statement in the same
equality/pattern vocabulary cannot be promoted merely because a bounded sample
dies.

AHEAD CEGAR remains a bounded cards-12--14 fallback. Census554 no longer holds
the compute pool, but the permanent runner is still software-gated: safe
execution requires the cardinality-generic mining worker, a validated bank
snapshot/CNF adapter, a cross-profile lifetime lock, and runner orchestration;
the current witnessed-versus-banked fresh-shape accounting must also be split
before the staleness stop is trusted. Its declared wall, bank-growth, and
shape-staleness stops remain binding, and a policy-stopped run is a durable
nonterminal result rather than a reason to extend the budget. If the
uniform producer naturally requires card at least 15, a checked AHEAD cover may
discharge cards 12--14 before that threshold is introduced on-spine, but card
11 still needs A11-CONSUME. If the producer works from card 11, both finite
census splits are unnecessary for closure.

Any further bounded subsystem is justified only by a forcing principle from
the actual full-filter or critical-row hypotheses and must also be tested as a
shared producer for the LIVE-Q/T1/T3 permutation orbits and the seven LIVE-C
branches. The intended consumption unit is a complete orbit family, not one
of the 79 textual holes in isolation.

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
