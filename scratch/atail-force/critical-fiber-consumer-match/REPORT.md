# Critical-fiber consumer match

Date: 2026-07-17

Status: **SOURCE-CURRENT THEOREM-BANK AND IMPLICATION-DIRECTION AUDIT, WITH A
KERNEL-CHECKED CLOSING CONTRACT. NO EXISTING CONSUMER CLOSES THE FIXED
CRITICAL FIBER. TWO CONDITIONAL TERMINALS ARE EXACT MATCHES. THE MISSING RESULT
IS AN EXISTENTIAL FULL-GEOMETRY COVERAGE PRODUCER, NOT ANOTHER ROW
CONTRADICTION.**

## Question audited

The production theorem

```lean
ATailFirstApexCriticalFiber
  .nonempty_frontierCommonDeletionCriticalFiber
```

starts from

```lean
R : FrontierCommonDeletionParentResidual F
```

and produces a source-faithful fiber `P` with two distinct carrier sources
`C,K`, one common actual blocker `A`, one exact four-point support centered at
`A`, and both prescribed deletions critical at `A`:

```text
C != K
blockerVertex C = blockerVertex K
C,K in the common exact A-shell
not K4 (D.A.erase C) at A
not K4 (D.A.erase K) at A.
```

This audit asks whether a registered theorem or current production theorem
consumes exactly that packet, together with the full parent `R`, in the
direction needed for closure.

## Required preflight

The registries required by `AGENTS.md` were searched before proposing any new
row or metric lemma:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The exhaustive JSON pass included every declaration whose statement contains
`CriticalShellSystem`, `centerAt`, `blockerVertex`, `no_qfree`, critical-shell
support, or source erasure. Indexed `nthdegree docs search` queries covered:

- two distinct sources with one blocker;
- an exact common critical shell and two critical deletions;
- same-cap second centers through the source pair;
- three selected rows with pairwise overlaps;
- U5 common-bisector and q-critical incompatibilities; and
- the legacy ordered-cap blocker and endpoint banks.

No registered declaration has the fixed critical fiber, or an equivalent
same-blocker/two-critical-source packet, as an antecedent to `False`.

The only sibling declarations mentioning `CriticalShellSystem` are the
source/named-row projections, existence theorems, and the old open
`DoubleApexOffSurplusSharedRadiusPair` chain. The legacy registries contain no
`CriticalShellSystem` declaration. The 18 unimported U1 source-unit consumers
and `u1TwoLargeCapObstruction` remain packet consumers: none produces its
row-slot or metric antecedent from the critical fiber.

## Exact live source map

Let

```text
O := S.oppApex1
C := P.source₁.1
K := P.source₂.1
A := H.centerAt P.source₁.1 P.source₁.2.
```

Production supplies the following exact fields.

| Needed fact | Live source |
| --- | --- |
| `C,K in D.A` | subtype membership of `P.source₁`, `P.source₂` |
| `C != K` | `P.source_points_ne` |
| `centerAt(C) = centerAt(K)` | `congrArg Subtype.val P.blockers_eq` |
| common exact support | `P.supports_eq` |
| `C,K` in the common support | own-source membership plus `P.source₂_mem_commonSupport` (or the symmetric fields) |
| `dist A C = dist A K` | two applications of `CriticalFourShell.support_eq_radius` |
| deletion of `C` critical at `A` | `P.source₁_deletion_critical` |
| deletion of `K` critical at `A` | `P.source₂_deletion_critical` |
| `A != O` | `P.commonBlocker_ne_firstApex` |
| `O` fully deletion-robust | `P.firstApex_robust` |
| minimality, no-`IsM44`, cap packet, cardinal lower bounds | retained in `R` |

The new production row split

```lean
ATailFirstApexCriticalFiberRow.nonempty_outcome P
```

is source-faithful. For a fixed `P`, it gives either:

1. `BothOff P`: neither collision source lies in the retained `O`-radius
   class; or
2. `RowHit P`: one collision source and a distinct point `J` lie in one
   selected `O`-row.

The second arm supplies the first required cross-row equality. The first arm
is a genuine residual; it is not eliminated by the current parent fields.

## Exact consumer match A: same-cap collision pair

The production theorem

```lean
CapSelectedRowCounting.outsidePair_unique_capCenter
```

is an exact immediate consumer after proving one additional geometric packet:

```text
there is an indexed cap Q and a second center B such that
A,B in Q
A != B
C,K outside Q
dist B C = dist B K.
```

The first-center equality `dist A C = dist A K` is already forced by `P`.
The second center must be source-faithful: either `B=O` with `C,K` on one
retained first-apex radius, or `B=centerAt(J)` with both `C,K` in `J`'s exact
critical row.

The checked adapter

```lean
ATailSameCapBisectorProducerAudit
  .CriticalShellCapOutsidePair
  .false_of_secondActualCenter_sameCap_contains_outsidePair
```

has exactly this implication direction. It does **not** derive the cap
placement or the second row. The collision outside-pair blocker audit further
shows that applying the actual blockers of arbitrary outside points expels a
new center from the cap or leaves a mutual-omission branch; it does not
manufacture this packet.

## Exact consumer match B: ordered cross-row core

The checked terminal

```lean
ATailRobustTwoFiberKalmansonConsumerScratch
  .false_of_ordered_robust_twoFiberKalmansonCore
```

closes the source-indexed configuration

```text
O < A < X < J < C < K
O-row contains J,C
A-row contains C,K
X-row contains J,K.
```

For a fixed critical fiber, the entire `A`-row equality is already available.
On the `RowHit` arm, the `O`-row pair is also available after orienting the
fiber source as `C` and the other selected support point as `J`. If
`X := H.centerAt J`, then `J` belongs to the exact `X`-row automatically.

The remaining producer fields on this arm are precisely:

```text
K in (H.selectedAt J).support
and one shared CCW enumeration with O < A < X < J < C < K.
```

The terminal proves `AJ < AC < AJ` by two strict Kalmanson inequalities. It
does not use the two deletion-critical propositions in its proof. Those facts
must therefore be load-bearing in the missing producer of the cross
membership/order, rather than merely carried through an already contradictory
anonymous row packet.

## Rejected near-matches

### `MinimalDeletionCore`: wrong polarity

`exists_minimalDeletionCore` assumes that deleting all of `U` blocks K4 but
restoring any one member of `U` restores K4. For `U={C,K}` at the common
blocker, restoring `C` leaves `K` deleted and restoring `K` leaves `C`
deleted. Both configurations are already blocked by the two fields of `P`.
Thus the fixed critical fiber has the opposite polarity from a two-member
minimal deletion core. Global minimality may shrink `{C,K}` to a singleton;
it does not turn this collision into a two-shell core.

### `ThirdCenterCommonPair`: different pair

`false_of_thirdActualCenter_selectedRow_contains_frontierPair` consumes the
frontier pair `F.pair.q,F.pair.w`, two already-known bisector centers for that
pair, and a genuinely third selected-row center containing the same pair.
The critical fiber names `C,K`, not the frontier pair. Rebinding it would
require first producing the full `SurvivorPairRelocationPacket` surface for
`C,K`, including their first-apex and second-apex placement/survival. Applying
the theorem to the original frontier pair ignores the collision.

### U5 common-bisector/q-critical consumers: missing dangerous packet

The closest U5 results, including

```lean
U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility
u5_common_bisector_triple_incompatibility
```

consume two **distinct** centers sharing three named noncollinear points, or a
full dangerous/q-critical packet. Equal blockers in `P` give one identical
circle, not two distinct circles, and only name the pair `C,K`. No dangerous
triple or third common point is produced.

### Legacy U1k ordered-cap blockers: thin conditional

`ConsecutiveOppositeEndpointEdges.b2a1_fires_exit` and the same-cap
wrong-side contradictions require an ordered-cap chain, fixed deletion seed,
two parent-supplied blocker-core card-four facts, and the `MoserOnlyBlockers`
terminal flag. The fiber supplies none of those interfaces. In particular,
`MoserOnlyBlockers` is explicitly an opaque parent input, not a theorem that
can be recovered from `R`.

### Source-unit and `u1TwoLargeCapObstruction` consumers

These require their complete row-slot or seven-equality packet. Mapping
`C,K` to one row supplies only one equality. Treating them as producers would
reverse the implication.

## Smallest honest missing theorem

Do not quantify over an arbitrary `P` returned by finite noninjectivity. The
checked both-off regressions show that a fixed collision fiber can avoid the
retained first-apex class while all currently represented row/minimality
facts hold. The source-indexed search manifest likewise finds saved survivors
with neither accepted terminal.

The honest theorem must choose the nontrivial fiber **after** using the full
geometry. `CriticalFiberConsumerMatch.lean` packages that output as the exact
inductive contract

```lean
CriticalFiberClosingCore R
```

whose two constructors each retain their own chosen
`P : FrontierCommonDeletionCriticalFiber R` and then carry either an
`OrderedCrossRowCore P` or a `SameCapCollisionPairCore P`. The sole missing
producer can therefore be stated without weakening source provenance:

```lean
theorem nonempty_criticalFiberClosingCore
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (CriticalFiberClosingCore R)
```

where the two output structures are exactly the antecedents in the two
consumer sections above. A direct-`False` theorem is equivalent, but this
coverage form exposes which geometry did the work and prevents another
anonymous selected-row detour.

The downstream implication is now checked:

```lean
false_of_criticalFiberClosingCore : CriticalFiberClosingCore R -> False
```

For development, split this theorem at the existing production outcome:

1. **Row-hit arm:** orient `C` to the hit source and `J` to the other O-row
   point; prove `K` lies in `J`'s actual critical row and establish the six
   roles' cyclic order, or produce the same-cap terminal.
2. **All candidate fibers off the O-class:** prove a direct cap/MEC/no-`M44`
   contradiction or the same-cap terminal. Do not attempt to eliminate
   `BothOff P` for every arbitrarily preselected `P`.

This is the smallest source-valid gap. The immediate contradiction layer is
already proved. Any proof of the coverage theorem must visibly use geometry
not present in the finite row abstraction: the actual cap intervals and CCW
order, MEC placement/full filters, no-`IsM44`, or a new consequence of global
minimality. More blocker-fiber counting, strong connectivity, generic K4 row
selection, or anonymous Kalmanson mining cannot fill it.

## Rigor and validation

- **PROVEN / source-current:** exact fields exported by
  `FrontierCommonDeletionCriticalFiber` and the `BothOff | RowHit` split.
- **PROVEN / kernel-checked in this lane:** both source-faithful terminal
  adapters and `false_of_criticalFiberClosingCore`, with only `propext`,
  `Classical.choice`, and `Quot.sound` reported by Lean.
- **PROVEN dependency result:** no declaration in the required exhaustive
  registries has the fixed critical fiber as a contradiction antecedent.
- **NOT CLAIMED:** that either closing core follows from the full Euclidean
  parent.
- **MISSING:** `nonempty_criticalFiberClosingCore` (or an equivalent direct
  parent contradiction).

The scratch module was checked directly against the current project imports:

```text
lake env lean -R . \
  ../scratch/atail-force/critical-fiber-consumer-match/\
CriticalFiberConsumerMatch.lean
```

It elaborates successfully. The four printed axiom closures contain exactly
`propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` is present. This
does not close a production `sorry`: it makes the final producer boundary
exact and mechanically checks that either permitted output is terminal.
