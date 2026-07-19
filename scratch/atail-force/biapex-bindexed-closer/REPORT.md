# B-indexed bi-apex closer audit

Date: 2026-07-17

Status: **NO ROUTINE CLOSER EXISTS ON THE CURRENT EXTRACTED SURFACE.  A BARE
`FrontierBiApexRobustResidual` IS NOT THE LIVE LARGE-CAP INPUT: THE CLOSER
MUST ALSO RETAIN BOTH OPPOSITE-CAP-AT-LEAST-SIX BOUNDS.  EVEN WITH THOSE
BOUNDS, THE PAIR-PRESERVING FIRST-APEX SPLIT AND SHELL-CURVATURE INTERFACE DO
NOT PRODUCE A SHARED PAIR OR SOURCE-FAITHFUL CROSS ROW.  THE SMALLEST CURRENT
CLOSING CONTRACT IS A LARGE-CAP B-INDEXED `CriticalFiberClosingCore` PRODUCER;
ITS PRODUCTION CONSUMER IS ALREADY COMPLETE.  NO SOURCE `sorry` IS CLOSED.**

## Scope

The initially requested input was

```lean
B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R
```

where `R : FrontierCommonDeletionParentResidual F`.  Source review of the
post-small-cap route gives the stronger live input

```lean
(B : FrontierBiApexRobustResidual R)
(hcap1 : 6 <= S.oppCap1.card)
(hcap2 : 6 <= S.oppCap2.card).
```

The cap bounds live above `B` rather than as fields of it.  Consequently a
theorem quantified only over arbitrary `B` is overstrong and is no longer the
recommended contract.  The output must retain all three hypotheses: the
intended proof must use `B.secondApex_robust`, while the cap/order route may
need `hcap1` and `hcap2`.

This lane is source/read-only except for this report.  It did not change
production Lean, shared plans, `ShellCurvature`, `surplusM44`, or the protected
card-five consumer, and it did not run Lean or Lake.

## Required theorem-bank preflight

Before considering a new local row or metric contradiction, this audit checked
the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The JSON pass covered declarations mentioning `CriticalShellSystem`,
`blockerVertex`, outside pairs, common bisectors, and the two-triple-center
U5 incompatibilities.  Focused indexed-corpus searches covered:

- two robust omitted blocker values and two nontrivial blocker fibers;
- three distinct sources in one exact critical shell;
- two distinct actual centers sharing a pair;
- same-cap outside-pair uniqueness; and
- `CriticalFiberClosingCore` on a bi-apex robust residual.

The searches recover the current production multiplicity theorem, the
same-cap outside-pair terminal, and the production
`false_of_criticalFiberClosingCore`.  They do not recover a theorem producing
the missing cross incidence, physical-apex alignment, or cap/order placement
from `B`.

The sibling bank has only source/named-row projections involving the current
critical-shell interface.  Its nearby U5 consumers require a complete
dangerous-triple or q-deleted class packet.  The sibling
`DoubleApexOffSurplusSharedRadiusPair` is not independent evidence for this
step: it is the same open canonical chain.  Neither legacy registry contains
a `CriticalShellSystem`-shaped closer.

## Exact information forced by `B`

Production `ATail/BiApexBlockerMultiplicity.lean` uses the two robust physical
apices to omit two distinct values from the retained critical blocker endomap.
It proves

```lean
FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
```

and therefore supplies one nontrivial actual blocker fiber followed by exactly
one of:

1. a second nontrivial fiber with a different actual blocker; or
2. a third distinct source in the first blocker fiber.

The adjacent checked scratch reductions identify the geometric meaning
precisely.

### Two-fiber arm

There are two distinct actual centers `A != X` and exact critical rows

```text
A-row contains C,K
X-row contains J,E.
```

All four source memberships are source-faithful.  What is not forced is a
common pair between the rows, a physical-apex equality on either fiber pair,
or a favorable cyclic/cap placement.

### Larger-fiber arm

The three source-indexed rows do not give three circles.  Support locking
identifies them with one exact four-point shell:

```text
A-row contains C,K,E and one fourth point.
```

The carrier bound produces an external source `J` whose actual blocker
`X` differs from `A`, but initially gives only the own-row membership
`J in X-row`.  It gives no member of the `A`-shell in the `X`-row.

`biapex-triple-fiber-cap-order/BiApexTripleFiberCapOrder.lean` further proves
the sharp cap residual:

- if `A` is a Moser vertex, it is the surplus-opposite vertex and the shell
  has at least two points in the surplus cap, with one of the three sources in
  its strict interior;
- if `A` is in a strict cap interior, at least one of the three sources lies
  outside that cap.

Neither arm supplies a second equidistance center for a named shell pair.

## Immediate-consumer audit

| Existing consumer | What `B` already supplies | First missing antecedent |
| --- | --- | --- |
| `ATailCriticalFiberClosingCore.false_of_criticalFiberClosingCore` | The full indexed parent `R`; multiplicity supplies candidate critical fibers. | A chosen fiber reaching either existing constructor. |
| `OrderedCrossRowCore.false` | One actual equality `AC = AK`; a global CCW enumeration is available from convexity. | A first-apex row equality `OJ = OC`, an actual cross row `XJ = XK`, and their compatible six-role cyclic order. |
| `SameCapCollisionPairCore.false` | One actual equality `AC = AK` and `A` is distinct from both robust physical apices. | A source-faithful second center for the same pair, plus one cap containing both centers while excluding both pair points. |
| `RetainedCollisionCapLocalization.false_of_distinct_actualRow_contains_collisionSources` | An arbitrary blocker collision. | First, alignment of that collision pair in one retained first-apex radius class; then one genuinely distinct actual row containing both sources. |
| `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` | Two distinct exact rows on the two-fiber arm. | Two common support points and the required same-side boundary order. |
| `ThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair` | Two omitted apex values and arbitrary blocker collisions. | The consumer concerns the retained frontier pair and two already known centers; the multiplicity fibers name a different pair and do not supply the relocation packet or a third common-pair row. |
| sibling U5 common-bisector/triple consumers | Exact critical rows. | A dangerous noncollinear triple or q-deleted class, three common points, and the named cross incidences required by the U5 packet. |

The shortest possible local terminal would be the distinct-actual-row consumer:
once a collision pair is aligned at the first physical apex, any genuinely
third actual row containing both sources is immediately impossible by the
convex perpendicular-bisector bound.  The live B-indexed multiplicity theorem
does not provide either alignment or that cross row.  This is why selecting an
arbitrary multiplicity fiber and then asking for a terminal is not source
valid.

## Explicit pair-preserving-row test with the second robust apex

The requested cross-check used

```lean
Q : FirstApexTwoRemainderRow W
nonempty_pairRowActualShellOutcome Q
```

from `critical-fiber-producer-push/TwoRemainderFirstApexRow.lean`, together
with `B.secondApex_robust` and both cap bounds.  The outcome remains exact:
`PairRowCommonOmission Q` or `PairRowExactTwoPairCover Q`.

### Common-omission arm

Let `s` be the remainder omitted by the actual shells at `W.first` and
`W.second`, and write

```text
O1 = first physical apex
O2 = second physical apex
A1 = actual blocker of W.first
A2 = actual blocker of W.second.
```

The existing scratch packet already proves that deleting `s` preserves K4 at
`O1,A1` and at `O1,A2`.  Bi-apex robustness adds survival at `O2`.  The live
walk and blocker-omission lemmas make `O1,O2,A1,A2` pairwise distinct, so one
can routinely construct q-deleted common-deletion packets for any required
pair among these four centers.  Moreover the actual blocker of `s` is
different from all four, giving a fifth carrier center whose exact critical
row contains `s`.

This is a real strengthening, but it is not a current terminal.  The
q-deleted rows omit `s`; they do not contain one common pair, and the fifth
critical row is known only to contain its own source `s`.  The existing
three-center common-deletion audit is already nonterminal, and no registered
consumer makes one deletion surviving at four distinct centers
contradictory.  Neither cap lower bound changes those row incidences.

### Exact disjoint two-by-two cover arm

The exact cover is entirely about intersections of the two actual blocker
shells with the chosen first-apex four-row.  Second-apex robustness supplies a
q-deleted row at `O2` after deleting each of the four row members, but gives no
positive lower bound on the overlap of any such row with `Q.row`.  It
therefore neither eliminates the disjoint `2+2` cover nor selects a common
pair from it.

The actual blockers of `Q.J1` and `Q.J2` likewise give only own-source
membership.  `RobustClassifierTarget` can classify a blocker only after two
known centers already bisect the same pair; the `2+2` cover supplies no such
pair at `O1,O2` or at both actual blockers.  Thus the second-apex blocker map
does not turn either cover piece into a source-faithful cross row.

### Effect of the two cap bounds

`hcap1` and `hcap2` imply `14 <= D.A.card` and permit choosing carrier points
in either large cap outside any fixed four-point shell.  This repairs the
cardinality defect in older fixed-profile searches, but it does not close
either pair-row arm:

- a point chosen outside a shell has an actual critical row containing that
  point, not a prescribed pair from the shell;
- six cap points do not force two sources in that cap to have the same
  blocker, since the blocker codomain is much larger than the cap; and
- a large cap gives additional boundary positions, not a selected-row
  equality or a q-deleted-row overlap.

The exact deficit after this test is still one positive cross incidence for a
named pair, or an independent direct cap/MEC contradiction of one of the two
pair-row arms.

## Retained frontier pair `q,w`

The frontier pair is more aligned than an arbitrary multiplicity fiber at
the first apex: `q,w` are distinct members of one retained first-apex radius
class and both deletions survive at the second apex.  It nevertheless does
not supply the old double-apex shared-radius target.  Production proves

```lean
F.pair.oppApex2_dist_ne :
  dist S.oppApex2 F.pair.q != dist S.oppApex2 F.pair.w.
```

The common-deletion packet at `O1,O2` is indexed by a deleted source; its
q-deleted second-apex row does not contain the deleted point and does not say
that `O2` bisects `q,w`.  The third-center common-pair terminal would become
available if, for example, the actual row at `q` contained `w` and a genuinely
third actual row contained both.  Neither `B` nor the cap bounds produces the
first cross hit.  The retained pair therefore remains useful normalization,
but is not the missing producer.

## Shell-curvature and cap-placement reassessment

The large-cap bounds do not make the current shell-curvature results an
immediate consumer.

- In the triple-fiber arm, the three source-indexed rows still lock to one
  exact four-shell.  Each cap bound lets one choose external sources in a
  desired large cap, and support locking makes their blockers different from
  the common-shell blocker.  Their rows still carry only own-source
  membership; no common-shell pair is transported into them.
- The checked triple-fiber placement gives either a surplus-cap-heavy shell
  at the remaining Moser vertex or an interior-blocker shell with a source
  outside the blocker's cap.  These are inputs for a future curvature/cap
  packing theorem, not contradictions from cap cardinality alone.
- Production `ShellCurvature` proves quantitative consequences once a
  compatible lifted angle chart and ordered equal-radius roles are supplied.
  The source adapter/finite chart and a terminal shared packing consumer are
  still absent.  Cardinality `>= 6` provides neither one.
- Even two disjoint exact four-shells at one convex-boundary center have an
  exact rational strict-convex local realization in the existing regression.
  Any curvature closer must visibly use the retained cap/MEC/critical-map
  coupling, not only the two shells and large cap counts.

Thus shell curvature remains a plausible new geometric ingredient, but no
routine adapter from `(B,hcap1,hcap2)` reaches an existing immediate `False`
consumer.

## Regression boundary

The existing `BiApexFiniteBoundary.lean` and
`TripleFiberCapFiniteBoundary.lean` fixtures retain the corresponding finite
blocker-map, support-locking, omission, and cap-count information without the
needed named cross pair.  They are not Euclidean counterexamples, but they do
rule out deriving the missing incidence from the extracted finite fields
alone.  A successful proof must visibly use a full Euclidean/cap/MEC/full-
radius/deletion fact absent from those fixtures.

In particular, `B.secondApex_robust` cannot be used only to re-prove the
second omitted blocker value and then forgotten.  The next theorem must use
its deletion-survival content, or another full-parent geometric field, to
force one of the existing terminal packets.

## Smallest source-valid producer

Among the registered production consumers audited here, the production
closing contract is already the smallest exposed disjunction of checked
immediate terminals.  The corrected missing theorem must retain the live cap
bounds and should therefore be stated as follows:

```lean
theorem nonempty_criticalFiberClosingCore_of_biApexRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R)
    (hcap1 : 6 <= S.oppCap1.card)
    (hcap2 : 6 <= S.oppCap2.card) :
    Nonempty (CriticalFiberClosingCore R)
```

The production-facing name should preferably say `largeCapBiApexRobust` (or
the three hypotheses should be bundled into a structure with that name), so
future callers cannot silently instantiate an overstrong B-only statement.

Equivalently, the producer chooses its fiber after inspecting the complete
bi-apex geometry and returns either

```text
some P with OrderedCrossRowCore P
```

or

```text
some P with SameCapCollisionPairCore P.
```

It should not accept an arbitrary preselected collision fiber: the both-off
and unrelated-fiber regressions show why that stronger quantifier order is not
justified.

Once the producer exists, the B-indexed branch closer is routine and introduces
no new mathematical obligation:

```lean
theorem false_of_frontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R)
    (hcap1 : 6 <= S.oppCap1.card)
    (hcap2 : 6 <= S.oppCap2.card) : False :=
  ATailCriticalFiberClosingCore.false_of_criticalFiberClosingCore
    (nonempty_criticalFiberClosingCore_of_biApexRobust
      B hcap1 hcap2).some
```

No Lean wrapper was added in this lane because proving only this final
application would repackage the unchanged open producer and would not advance
the proof.

## Exact next mathematical obligation

The two multiplicity arms can share one producer theorem, but its proof must
establish at least one of the following source-faithful alternatives.

1. **Aligned common pair:** choose a blocker collision whose two sources also
   lie in one physical-apex radius class, then produce a genuinely distinct
   actual row containing both.  This closes immediately through the existing
   perpendicular-bisector consumer.
2. **Same-cap pair:** choose a collision fiber and a source-faithful second
   center for its pair, then localize both centers into one indexed cap with
   the pair outside.  This constructs `SameCapCollisionPairCore` directly.
3. **Ordered different pair:** choose a collision fiber, a physical-apex row
   through a fresh source, and one cross membership in that source's actual
   row, then prove one of the cyclic orders consumed by an existing ordered
   Kalmanson terminal.
4. **Triple-fiber cap contradiction:** use the exact triangle/interior cap
   residual together with full MEC or radius-filter information to contradict
   that residual directly.  The current cap cardinality facts alone are not
   enough.

This is the actual frontier.  Further blocker-fiber counting, anonymous row
selection, or Kalmanson-only mining does not fill any first missing antecedent
above.

## Validation status

- **SOURCE-CURRENT:** all production statements and scratch interfaces named
  above were checked against the working tree.
- **BANK PREFLIGHT COMPLETE:** all required Markdown/JSON registries and
  focused indexed Lean searches were checked.
- **NOT RE-ELABORATED HERE:** no Lean or Lake command was run, per the active
  no-build instruction.
- **NOT PROVED:** the B-indexed producer and robust branch closer.
- **NO CLOSURE CLAIM:** no production `sorry` or `sorryAx` dependency changed.
