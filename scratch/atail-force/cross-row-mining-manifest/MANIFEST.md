# Source-faithful cross-row mining manifest

Date: 2026-07-17

Status: **DESIGN ONLY. THE RAW THREE-ROW TARGET IS REJECTED; THE CORRECTED
SOURCE-INDEXED COVERAGE OBJECT HAS IMMEDIATE CHECKED CONSUMERS. DO NOT START A
BROAD RUN FROM THIS FILE.**

## Decision

The following anonymous selected-row packet is not an acceptable mining
target by itself:

```text
O-row: C,J
A-row: C,K
X-row: J,K
cyclic order: O < A < X < J < C < K.
```

It is geometrically contradictory, but it does not consume the new
same-blocker collision.  Any global K4 row at `A` containing `C,K` gives the
same metric equality, and the Kalmanson proof never sees that `C` and `K` are
two deletion-critical sources mapped to `A`.  Likewise, projecting two
outside points from an arbitrary `A`-row does not use collision provenance.

The corrected object is an **existential source-indexed coverage theorem over
all fibers of the retained `CriticalShellSystem`**.  It must derive either the
cross-row core below or the same-cap collision-pair core below from the parent
residual.  It may not assume either core as extra live data.

## Live input and exact role map

The theorem-facing input is uniform in carrier cardinality:

```lean
{D : CounterexampleData}
{S : SurplusCapPacket D.A}
{radius : ℝ}
{H : CriticalShellSystem D.A}
{F : CriticalPairFrontier D S radius H}
(R : FrontierCommonDeletionParentResidual F)
```

Set `O := S.oppApex1`.  Production already proves

```lean
R.firstApexFullyDeletionRobust : FullyDeletionRobustAt D O
```

and therefore that `O` is omitted from `H.blockerVertex`.  Finite
noninjectivity supplies at least one fiber with two distinct sources.  The
coverage theorem must choose the fiber and the orientation of its two sources;
it must not accept an arbitrary collision chosen before the cap/order audit.

The intended six roles are:

| Role | Live meaning |
| --- | --- |
| `O` | the deletion-robust first physical apex |
| `C,K` | distinct carrier sources in one blocker fiber |
| `A` | `H.centerAt C = H.centerAt K`, the common actual blocker |
| `J` | a third carrier source |
| `X` | `H.centerAt J`, the actual blocker selected for `J` |

The critical provenance which must remain visible is:

```text
C != K
centerAt(C) = A
centerAt(K) = A
no_qfree_at(C) at A
no_qfree_at(K) at A
centerAt(J) = X
no_qfree_at(J) at X.
```

The first two critical rows are exact full four-shells.  Equal blockers lock
their supports, so the common `A` shell contains both `C` and `K`.  The `X`
shell contains `J` by construction.  The genuinely new incidence is

```text
K ∈ support(H.selectedAt J).
```

The other genuinely new incidence is one first-apex radius class containing
`C` and `J` (equivalently the equality `dist O C = dist O J`, with the live
positive-radius/class witness retained).  These two cross incidences must be
*derived using the two-source fiber criticality*, not simply installed as row
facts.

## Accepted terminal A: critical-fiber cross-row core

The target is existence of `C,K,J` and one shared injective CCW carrier
enumeration such that:

```text
1. C and K are distinct sources with centerAt(C) = centerAt(K) = A;
2. both source deletions are critical at A;
3. C and J lie in one positive first-apex O-radius class;
4. X = centerAt(J), J is deletion-critical at X, and K lies in J's exact X-shell;
5. O,A,X,J,C,K are distinct and occur as O < A < X < J < C < K.
```

This has an immediate kernel-checked consumer:

```text
scratch/atail-force/robust-two-fiber-kalmanson-consumer/
  RobustTwoFiberKalmansonConsumer.lean
```

Its `false_of_ordered_robust_twoFiberKalmansonCore` proves the contradiction
from the three row equalities and this order.  A production adapter may weaken
its `O` selected-row field to the positive radius-class equality actually
exported above; the proof is unchanged.  The consumer is not the missing
mathematics.  The source-indexed coverage producer is.

## Accepted terminal B: collision-pair same-cap bisector

The alternate terminal must use the collision pair `C,K` itself, not two
arbitrary points extracted from the common shell.  It consists of an indexed
cap and a second center `B` such that:

```text
A,B lie in the same indexed cap;
A != B;
C,K lie outside that cap;
dist A C = dist A K;
dist B C = dist B K.
```

The second center must be source-faithful: either `B = O` with `C,K` in a
retained first-apex radius class, or `B = centerAt J` for an actual critical
source `J`, with `C,K` in J's exact shell.  An arbitrary global selected row at
`B` is not accepted by this lane.

The immediate production consumer is
`CapSelectedRowCounting.outsidePair_unique_capCenter` (or the checked adapter
`false_of_secondCapCenter_bisecting_collisionOutsidePair`).

## Negated-terminal CEGAR query

For theorem discovery, encode the necessary consequences of the complete
live input and ask for

```text
live parent abstraction
AND no source-indexed cross-row terminal for any blocker fiber/orientation
AND no source-indexed same-cap collision-pair terminal
```

The query ranges over **every** nontrivial blocker fiber and scans both
orientations of its two source roles.  It does not freeze one pigeonhole
witness in advance.

Do not add Kalmanson inequalities to the base and then call base-UNSAT a
producer proof.  For this coverage experiment, occurrences of the two
terminal packets are the cuts.  A separate direct-`False` experiment may use
the inequalities, but must be reported under that different theorem shape.

Every SAT survivor must be independently replayed against:

- total fixed-point-free blocker map with `O` omitted;
- exact support locking for every blocker-image center;
- source membership and the two deletion-critical source identities;
- global K4 selected rows without conflating selected subsets with full exact
  radius classes;
- the actual shared boundary order and cap intervals;
- all currently proved cap, pair-center-capacity, crossing, and MEC
  consequences included in the encoding.

A CEGAR refinement is admissible only if it is a proved Lean consequence of
these binders and its declaration/source hash is stored with the cut.  MUS
cores, exact-coordinate failures, or a producer-bank match may suggest a
lemma, but none is itself an admissible coverage cut.

## Symmetry and canonicalization

- Cut the cyclic boundary at the distinguished `O` and use the genuine CCW
  orientation.  A reflected order is not licensed by the forward consumer
  unless a reflected Lean adapter is checked separately.
- Scan both assignments of the unordered collision sources to asymmetric
  roles `C` and `K`.  Do not quotient by their transposition before the
  `O`-row/`X`-row roles are transported.
- Treat row supports as sets.  Preserve the distinction between an arbitrary
  selected four-subset and the exact `CriticalSelectedFourClass` attached to
  a blocker source.
- A carrier relabeling is a symmetry only when it preserves `O`, the support
  triangle/cap indices, cyclic order, the blocker map, exactness flags, and
  source identities.  Arbitrary hypergraph isomorphism is too coarse.
- Do not fix cap sizes, total cardinality, a five-point first-apex class, or
  `A = S.oppApex2`.  Those are properties of the old fourteen-role fixture,
  not of the live collision.

## Existing-artifact audit

`audit_existing.py` pins and scans the existing artifacts without invoking a
solver.  Its current replay is:

```text
stored corrected prefix                         101 witnesses
literal C,K->A / J->X cross-row packet           28 witnesses
some source-indexed cross-row embedding           75 witnesses
source-faithful same-cap collision-pair packet      0 witnesses
neither accepted terminal                         26 witnesses

direct-schema avoider                              1 witness
literal/source-indexed cross-row packet             1 witness

fixed continuation status       UNSAT_EXHAUSTIVE_FINITE_DFS
DFS nodes                                                   0
zero singleton domains                                 F,I,X
```

This reconciles the apparently positive evidence:

- all 101 saved witnesses are ordinal-Kalmanson contradictory, but 26 do not
  contain either corrected terminal above, so the broader ordinal cores do
  not establish this producer;
- the direct-schema avoider contains the exact `O,A,X` core and is killed by
  its immediate consumer, which validates the consumer but not coverage; and
- the zero-node continuation is exhaustive only for the fixed fourteen-role
  `PROFILE=(8,4,5)` candidate domains and fixed prefix.  It uses broader rows
  and ordinal closure.  It neither extracts the source-indexed terminal nor
  covers other cardinalities/profiles.

The fixed fixture additionally identifies its physical second apex with the
common blocker `A`, fixes the first-apex class to
`{A,C,D,E,J}`, and fixes the hull order
`O,t1,I,F,A,X,Y,Z,D,J,E,C,G,K`.  None of these identifications follows from
`FrontierCommonDeletionParentResidual`.

## Bank preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches found the current critical-shell support-locking facts,
the Kalmanson consumers, `outsidePair_unique_capCenter`, and nearby six-point
order cores.  No banked theorem derives either missing cross incidence from a
two-source actual-blocker fiber.  The unimported source-unit bank and
`u1TwoLargeCapObstruction` remain consumers with different named metric
packets; they do not supply this producer.

## Acceptance and stop gates

Do not start a broad run until all smoke gates below pass:

1. **Positive fixture:** the pinned direct-schema avoider is detected with
   `C,K -> A`, `J -> X`, `K` in the `X` shell, and the forward six-role order.
2. **Criticality ablation:** replacing the `C,K` blocker fiber by an arbitrary
   `A` row, deleting either source-critical identity, or replacing `X=centerAt
   J` by an arbitrary `X` row must restore a terminal-avoiding fixture.  If it
   does not, reclassify the result as a generic row theorem; do not market it
   as the collision producer.
3. **Cross-incidence ablation:** deleting `K ∈ J`'s exact shell must make the
   cross-row matcher reject.
4. **Orientation gate:** the reflected six-role order must not be accepted by
   the forward consumer.
5. **Same-cap gate:** arbitrary outside support points or an arbitrary second
   row center must be rejected; the outside pair must be the critical sources
   `C,K`, and `B` must be robust or source-critical.
6. **Pinned replay:** the 101-prefix counts above and all three checkpoint
   hashes must match before a run.
7. **Profile gate:** any result fixing fourteen roles or `(8,4,5)` is labeled
   exact only within that abstraction.  It is not live coverage.
8. **Uniform-cardinality gate:** the parent has no finite upper bound in this
   interface.  A finite SAT exhaustion cannot close it unless accompanied by
   a proved cardinality split and complete consumers for every omitted range.
9. **Certificate gate:** SAT witnesses get an independent structural replay.
   UNSAT gets a checked LRAT/DRAT or rational Farkas endpoint as appropriate,
   plus a formal live-to-encoding theorem.  External solver `UNSAT` alone is
   theorem-discovery evidence.
10. **Coverage gate:** the final Lean theorem is existential over all blocker
    fibers and immediately feeds one of the two checked consumers.  A growing
    literal core bank without that theorem is not convergence.

Because cardinality is unbounded here, the preferred successful outcome of a
small search is a uniform geometric lemma explaining why the two-source
critical fiber forces one of the cross incidences.  The solver is a conjecture
and regression tool for that lemma, not the final proof engine.

## Exact next action

Run only the smoke/ablation replay first.  If it passes, enumerate the 26
stored terminal-avoiding witnesses by the first missing condition among:

```text
C shares an O-radius class with some critical source J;
K lies in J's exact blocker shell;
the six roles have the required forward cyclic order;
the collision pair has a source-faithful second same-cap bisector.
```

Mine a *uniform source/cap/order lemma* for the dominant missing condition.
Do not resume unconstrained `555/654`, literal MUS, or fixed-profile row
mining under this manifest.
