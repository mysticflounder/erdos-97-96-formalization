# Exact-five first-cap-`>= 7` route audit

Date: 2026-07-21

Status: **SOURCE AUDIT. CARD-`>= 14` IS PROVEN, BUT THE EXISTING
CARD-`>= 14` CONSUMER RECURS TO BI-APEX ROBUSTNESS. THE FIRST TERMINAL
OCCURRENCE REMAINS OPEN. NO LEAN `sorry` IS CLOSED HERE.**

## Scope and preflight

The audited branch is

```lean
F       : CriticalPairFrontier D S radius H
R       : FrontierCommonDeletionParentResidual F
B       : FrontierBiApexRobustResidual R
Q       : FrontierBiApexRobustExactFiveSecondCapResidual B
profile : LargeCapUniqueFiveSecondApexRadius D S
outcome : ExactFiveGlobalCoverStarOutcome Q profile
hfirst  : 7 <= S.oppCap1.card
```

The audit retains the fixed total critical system `H`, `R.minimal`,
`R.noM44`, the actual parent rows, and the global-cover star.

The theorem-bank registries required by `AGENTS.md` and focused
`nthdegree docs search --lean` queries were checked first. They contain
downstream metric/incidence consumers, including `u1TwoLargeCapObstruction`,
but no aggregate producer for the occurrence isolated below.

## 1. Proven new force: `14 <= D.A.card`

The cap identity and live bounds give

```text
S.surplusCap.card >= 5
S.oppCap1.card     >= 7
S.oppCap2.card      = 5

S.surplusCap.card + S.oppCap1.card + S.oppCap2.card
  = D.A.card + 3
```

and therefore

```text
14 <= D.A.card.
```

This is **PROVEN** from `S.capSum`, `S.surplus_card_gt_four`, `hfirst`, and
`Q.secondOppCap_card_eq_five`, followed by arithmetic. The strict first cap
also has at least five points.

## 2. Exact existing card-`>= 14` chain

The applicable production producer is

```lean
ATailSurvivalCover
  .exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen
```

It retains an actual source and the fixed map `H`, but also requires the
directed frontier hypotheses

```lean
(SelectedClass D.A S.oppApex1 radius).card != 4
F.pair.w ∈ (H.selectedAt F.pair.q F.pair.q_mem_A)
  .toCriticalFourShell.support.
```

Its existing consumer is

```lean
ATailSurvivalCover
  .sourceFaithful_card_ge_fourteen_physicalSecondApex_consumer
```

whose conclusion is exactly

```lean
Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
Nonempty (PhysicalSecondApexCriticalResidual D S).
```

On the present branch, `B.secondApex_robust` already supplies the first
disjunct. Hence this chain can return the same robustness fact it started
with. The scratch uniform successor likewise has a robust arm and a swapped
unique-four arm; the robust arm is the same-level recurrence. The companion
constructor of `FrontierDirectedBlockerOutcome` produces another common
deletion, not a terminal.

**Conclusion:** card `>= 14` is a real strengthening, but the current
card-`>= 14` chain does not close exact five. Do not add another adapter around
it unless the robust return is given a new terminal consumer.

## 3. Strongest source-faithful packet available before new mathematics

Production already gives

```lean
ATailFirstApexShellRole.nonempty_firstApexShellRolePacket F R
```

and hence a `FirstApexShellRolePacket F R` containing:

- the retained first-apex row through `F.pair.q,F.pair.w`;
- a first-apex double-deletion row;
- two distinct strict-first-cap hits in each row;
- the exact cap-role covers;
- same radius implies a full class of cardinality at least six;
- distinct radii imply disjoint selected supports; and
- all parent singleton/double-deletion survival facts.

The fixed-`H` adaptive split

```lean
ATailCriticalFiberRetainedRadiusSelector
  .nonempty_retainedRadiusBlockerOutcome R
```

then returns a genuine retained-radius critical-fiber collision or an
injective blocker matching.

On collision, the existing checked terminals are already sufficient if one
can produce any of:

- `FirstApexCapSeparation collision`;
- `OrderedDifferentPairCrossHit collision`; or
- `AlternateOrderedDifferentPairCrossHit collision`.

For the two ordered structures, the only new row occurrence is that the other
fiber source lies in the actual row of the automatically chosen fresh
first-apex-row point, together with one of the two compatible boundary orders.

On matching, `nonempty_retainedMatchingLargeCapConsumerOutcome` produces a
paired common deletion, a fresh first-cap common deletion, or a localized
reverse hit. None is terminal. The extra first-cap points yield more sources
outside the exact reverse shell, but only more common-deletion packets, so
that is not the missing statement.

## 4. First missing positive occurrence: asymmetric arm

For either asymmetric constructor, production supplies

```lean
N : SourceTwoHitNormalForm Q profile M
```

with two distinct outside points `N.outside₁,N.outside₂` in one actual
row. The exact checked consumer is

```lean
N.false_of_firstApex_coRadial
```

and it needs only

```lean
dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂.
```

Thus the preferred missing occurrence is the first-apex return above. A
source-valid fallback is a genuine alternative short cap:

```lean
∃ (T : SurplusCapPacket D.A) (i : Fin 3),
  T.oppositeVertexByIndex i = S.oppApex2 ∧
  (T.capByIndex i).card = 4.
```

That fallback is consumed immediately by
`false_of_shortCap_at_largeCapUniqueFiveApex profile T i`. The exact producer
boundary should therefore be:

```lean
-- CONJECTURED
asymmetric_firstApexReturn_or_shortCap_of_firstOppCap_ge_seven :
  dist S.oppApex1 N.outside₁ = dist S.oppApex1 N.outside₂ ∨
    ∃ (T : SurplusCapPacket D.A) (i : Fin 3),
      T.oppositeVertexByIndex i = S.oppApex2 ∧
      (T.capByIndex i).card = 4
```

It must consume the full `F,R,B,Q,profile`, the appropriate global-cover
star, `hfirst`, and the corresponding `SourceTwoHitNormalForm`. Minimality
alone cannot prove it: the checked asymmetric deletion-core audit stutters at
the already known physical target.

## 5. First missing positive occurrence: all-one arm

For

```lean
star    : PhysicalGlobalCrossDeletionStar profile
all_one : AllPhysicalActualCriticalRowsOneHit H profile
```

the exact aggregate producer boundary is:

```lean
-- CONJECTURED
closingCore_or_shortCap_of_allOne_firstOppCap_ge_seven :
  Nonempty (CriticalFiberClosingCore R) ∨
    ∃ (T : SurplusCapPacket D.A) (i : Fin 3),
      T.oppositeVertexByIndex i = S.oppApex2 ∧
      (T.capByIndex i).card = 4
```

The first disjunct is consumed by `false_of_criticalFiberClosingCore`; the
second by the same unique-five short-cap terminal. Internally, the proof
should split late on `nonempty_retainedRadiusBlockerOutcome R`:

- collision must produce cap separation or a source-faithful ordered cross
  hit;
- matching must turn the complete matching outcome plus the global-cover star
  into a closing core or a genuine alternative support packet.

Both occurrence theorems are **CONJECTURED / OPEN**. No existing theorem bank
entry produces either output.

## 6. Why the extra cap point is not already a short-cap packet

The larger first cap provides the right combinatorial boundary rank for a
four-point subchain, but a `SurplusCapPacket` additionally requires an actual
MEC-boundary support vertex, a nonobtuse circumscribed support triangle, and
the full three-cap partition. No current theorem forces a strict first-cap
point onto the MEC boundary; the original three support vertices may be the
only carrier points there.

Therefore cardinality `>= 7` alone cannot manufacture the short-cap
alternative. The first geometric occurrence on that route is a correctly
ranked strict first-cap point on the MEC boundary together with the nonobtuse
support-triangle verification.

## Conclusion

The branch is now sharply localized:

- **PROVEN:** exact five plus first cap `>= 7` implies card `>= 14`.
- **PROVEN:** the full shell-role packet and collision/matching split are
  already source-faithful production inputs.
- **PROVEN:** every proposed output above has an immediate existing terminal.
- **OPEN:** the positive terminal occurrence itself.

The next proof should target the asymmetric first-apex return and the all-one
closing-core-or-short-cap occurrence directly. Another common-deletion or
card-`>= 14` adapter will not advance closure.
