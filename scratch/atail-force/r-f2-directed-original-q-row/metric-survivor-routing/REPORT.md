# Metric-survivor routing audit

Date: 2026-07-16

Status: **THE RAW METRIC ROUTING IS KERNEL CHECKED.  ITS LIVE-CENTER
PRODUCER ROUTES ARE SUPERSEDED: THE WHOLE EQUAL-SOURCE LIVE-CENTER
CONSTRUCTOR NOW CLOSES DIRECTLY BY ORDERED-CAP GEOMETRY.**

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

The later checked module
`../equal-source-metric-terminal/EqualSourceMetricTerminal.lean` is now the
authoritative live-center route.  This report's generic adapters remain
valid, but its proposed live-center producer boundary is historical.

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

The stronger follow-up does not enter this dichotomy at all.  A
`MetricResidual` already places the opposite named center in each completed
generated row.  Since those centers are not the deleted original point `q`,
the memberships descend to the raw supports.  With the equal source fixed to
`p`, the three points `p,x,y` lie in `oppCap2`, and one shared ordered-cap
argument gives `False`.

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
later live-center terminal closes that whole branch from strictly earlier
data, so neither callback should be mined there as an intermediate incidence
packet.

## Full-parent verdict

The live-heavy full-parent surface retains the same `W`, hence the exact
critical system `W.H`, together with the MEC/cap order, no-M44,
no-removability, frontier, anchored origin, aligned F2 packet, and generated
successor.  The paired construction at the same live-heavy reduction reaches
the five-way `SourceSplit`.

For the surviving second-apex arm, no retained field has the equilateral
consumer type:

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

Thus the corrected equal-source metric route is:

1. `equalSource_atLiveCenter` is closed uniformly by
   `false_of_equalSource_atLiveCenter_metricResidual`.
2. `equalSource_atSecondApex` is already equilateral.
   - The q-critical × q-critical instance is closed by the existing
     full-parent metric terminal.
   - With at least one q-deleted generated row, produce one realized
     `JointTransitionClosingSelection` or prove a stronger direct terminal;
     do not mine a second common outside-cap point.

The earlier surplus-heavy and three-reverse-equality live-center targets are
also retired.  Follow-up checked audits show that their smallest proposed
positive completions have the wrong polarity or are already contradictory.

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
