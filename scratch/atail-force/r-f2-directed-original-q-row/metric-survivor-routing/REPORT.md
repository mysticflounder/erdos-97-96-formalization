# Metric-survivor routing audit

Date: 2026-07-16

Status: **THE RAW METRIC ROUTING IS KERNEL CHECKED.  A LATER
BRANCH-SPECIFIC CHECK PROVES THAT `StrictOppCap1CommonHit` HAS THE WRONG
POLARITY ON THE ACTUAL EQUAL-SOURCE LIVE-CENTER BRANCH; THE CORRECT
NON-EQUILATERAL TARGET IS THE EXISTING SUPPORT DICHOTOMY.**

## Scope and preflight

This lane owns only:

```text
scratch/atail-force/r-f2-directed-original-q-row/metric-survivor-routing/
```

It starts from the source and bank preflight already recorded in
`generated-successor-source-split-audit/REPORT.md`.  Per the task boundary,
no new broad mining was run.  No production file, closure document,
proof-blueprint state, protected file, or user-owned lane was changed.

The implementation is `MetricSurvivorRouting.lean`.

## Exact signature map

Write

```text
C = Q.generated.toTwoContinuationRows
H = W.H.
```

The `equalSource_atLiveCenter` constructor of
`OriginalQGeneratedSuccessorPair.SourceSplit` carries:

```text
Q.at_x.source = Q.at_y.source
C.MetricResidual
Q.at_x.source = p.
```

The `equalSource_atSecondApex` constructor carries:

```text
Q.at_x.source = Q.at_y.source
C.EquilateralResidual
Q.at_x.source = S.oppApex2.
```

The current consumer signatures are materially stronger than those source
equalities.

### Non-equilateral

```lean
def StrictOppCap1CommonHit (C : TwoContinuationRows ...) : Prop :=
  ∃ x,
    x ∈ C.row₁.support ∧
    x ∈ C.row₂.support ∧
    x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)

theorem false_of_nonEquilateral_of_strictOppCap1CommonHit
    (N : NonEquilateralOutput H C)
    (hit : StrictOppCap1CommonHit C) : False
```

`NonEquilateralOutput H C` is not merely the first arm of
`C.MetricResidual`: it additionally stores a
`CommonDeletionTwoCenterPacket` at deletion `S.oppApex2` and centers
`C.z₁,C.z₂`.

That apparent mismatch is now closed without a new assumption:

```lean
nonEquilateralOutput_of_residual
    D S H C : NonEquilateralResidual C → NonEquilateralOutput H C
```

The raw residual omits `S.oppApex2` from both selected supports.  Each
omission preserves the selected four-class after deleting the apex, and the
retained concrete `H` packages the two survival facts into the required
common-deletion packet.

For an arbitrary pair of continuation rows, the following remains a valid
sufficient terminal antecedent:

```text
StrictOppCap1CommonHit C.
```

It is not the producer target on the actual
`equalSource_atLiveCenter` branch.  The subsequent checked module
`strict-oppcap1-hit-producer/StrictOppCap1HitProducer.lean` proves:

```text
C.row₁.support ∩ C.row₂.support = {p}
p ∈ S.oppCap2
¬ StrictOppCap1CommonHit C.
```

The equal source belongs to both generated rows.  The non-equilateral
intersection bound therefore makes it their unique common support point, and
the live-heavy cap facts place that point in `strictSecondCap S`, hence in
`oppCap2`.  Asking for a strict-`oppCap1` common hit on this branch is asking
for an already contradictory packet.

### Equilateral

```lean
abbrev JointTransitionCoreEliminator D S H : Prop :=
  ∀ {K} (C : TwoContinuationRows ...) (h : C.EquilateralResidual)
      {u v} (Ku : SelectedFourClass D.A u)
      (Kv : SelectedFourClass D.A v),
    JointTransitionPacket D S H
      (equilateralRowsOfResidual C h) Ku Kv → False
```

This is a uniform eliminator over every displayed choice.  For one realized
equilateral residual, the existing theorem
`exists_jointTransitionPacket_of_equilateralResidual` already constructs
`u,v,Ku,Kv` and the corresponding `JointTransitionPacket`.  The first new
field is only a closing selection for one such packet:

```lean
def JointTransitionClosingSelection ... (J : JointTransitionPacket ...) : Prop :=
  (LowHit Ku ... ∧ LowHitFreshPairClosingProducer ... Ku) ∨
  (LowHit Kv ... ∧ LowHitFreshPairClosingProducer ... Kv) ∨
  (MixedResidualProfile ... ∧ HasThirdMixedPairBisectorCenter ...)
```

The new branch-local interface is:

```lean
RealizedJointTransitionClosingSelection D S H C h
```

It existentially retains the automatically constructible joint packet and
asks for `JointTransitionClosingSelection` only at that packet.  The checked
theorem

```lean
false_of_equilateralResidual_of_realizedClosingSelection
```

closes the realized equilateral residual from that strictly branch-local
field.  A `JointTransitionCoreEliminator D S H` remains a valid stronger,
uniform alternative.

In the `equalSource_atSecondApex` arm, the equal source does not provide a
closing selection.  The checked theorem

```text
TwoContinuationRows.
  common_support_outside_oppCap2_eq_singleton_of_equilateralResidual
```

instead says that `S.oppApex2` is the unique common support point outside
`oppCap2`, so the repeated-common-outside-point route is unavailable with
the opposite polarity.

## New exact route

The assumption-free normalization is:

```lean
metricConsumerRoute_of_metricResidual
    D S H C : C.MetricResidual →
      (NonEquilateralOutput H C ∨ C.EquilateralResidual)
```

where the displayed disjunction is represented by the named inductive
`MetricConsumerRoute`.

The generic two-field sufficient consumer adapter is:

```lean
structure MetricConsumerSelections H C where
  nonEquilateral :
    NonEquilateralOutput H C → StrictOppCap1CommonHit C
  equilateral :
    ∀ h : C.EquilateralResidual,
      RealizedJointTransitionClosingSelection D S H C h

theorem false_of_metricResidual_of_consumerSelections
    (hmetric : C.MetricResidual)
    (fields : MetricConsumerSelections H C) : False
```

This structure is a valid consumer adapter, not a claim that both fields are
realizable producer objects.  Its value is that all
residual/common-deletion/joint-packet bookkeeping has been removed.  The
later live-center audit shows that its non-equilateral callback is logically
equivalent to closing that whole branch, so it must not be mined as an
intermediate incidence packet.

## Full-parent verdict

The live-heavy full-parent surface retains the same `W`, hence the exact
critical system `W.H`, together with the MEC/cap order, no-M44,
no-removability, frontier, anchored origin, aligned F2 packet, and generated
successor.  The paired construction at the same live-heavy reduction reaches
the five-way `SourceSplit`.

No retained field has the equilateral consumer type:

```text
JointTransitionClosingSelection ... J.
```

No source-current theorem maps the retained full-parent hypotheses to that
field.  In particular:

- deletion survival supplies continuation rows, not common support
  incidence;
- global K4 supplies the joint packet's selected rows, but not a LowHit fresh
  pair or third mixed-pair bisector center; and
- no-M44 and cap order do not choose a joint-transition closing disjunct.

Thus neither whole survivor arm is mechanically contradictory from the
current full-parent surface.  The route is now exact, however:

1. `equalSource_atLiveCenter` splits its `MetricResidual`.
   - Non-equilateral: use `nonEquilateralSupportDichotomy`, or its
     `NonEquilateralGeometryTerminal` refinement.  The honest outputs are a
     surplus-heavy native row or two exclusive strict-`oppCap1` witnesses
     with a metric hinge.  In the latter arm, the equal source fixes the
     common point to `f = p`; only the three reverse equalities
     `dist p x = dist p z₂`, `dist p x = dist p y`, and
     `dist y x = dist y z₁` remain before the import-reachable production
     theorem `Problem97.u5_equilateral_opposite_point_metric_incompatibility`
     gives `False`.  The exhaustive fixed-`f = p` role audit finds no
     assignment with fewer missing equalities.
   - Equilateral: produce one realized `JointTransitionClosingSelection`.
2. `equalSource_atSecondApex` is already equilateral.
   - Produce one realized `JointTransitionClosingSelection`; do not mine a
     second common outside-cap point.

The q-critical × q-critical metric constructor remains separately closed by
the existing full-parent terminal.  This report concerns only the surviving
constructor combinations with at least one q-deleted generated row.

## Validation

Validated from `lean/` with Lean 4.27.0:

```bash
env LEAN_PATH=/private/tmp/p97-joint-transition-oleans \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-metric-survivor-routing-oleans/MetricSurvivorRouting.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/metric-survivor-routing/MetricSurvivorRouting.lean
```

Result: exit status 0.  Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean source contains no `sorry`, `admit`, declared axiom,
`unsafe`, or `native_decide`.  No full Lake build was run.

The superseding live-center correction was independently checked in
`strict-oppcap1-hit-producer/`; its four printed declarations have the same
three-axiom closure and its source is likewise clean.
