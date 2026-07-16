# Equal-source non-equilateral common-hit route correction

Date: 2026-07-16

Status: **KERNEL CHECKED.  `StrictOppCap1CommonHit` HAS THE WRONG
POLARITY ON THE `equalSource_atLiveCenter` NON-EQUILATERAL BRANCH.**

## Result

The requested strict-first-cap common hit is not a missing constructive
consequence of the retained parent fields.  On this exact branch it is false.

Let

```text
C = Q.generated.toTwoContinuationRows.
```

The source split supplies

```text
Q.at_x.source = Q.at_y.source
Q.at_x.source = p.
```

Each chosen source belongs to its corresponding full generated row, so `p`
belongs to both `C.row1.support` and `C.row2.support`.  For a
`NonEquilateralOutput W.H C`, the existing theorem
`nativeRow_inter_card_le_one` bounds the intersection by one.  Hence the new
checked theorem proves

```lean
row_inter_eq_singleton_liveCenter_of_equalSource_nonEquilateral ... :
  C.row1.support ∩ C.row2.support = {p}
```

The live-heavy cap theorem puts `p` in `strictSecondCap S`, hence in
`S.oppCap2`.  Two further checked theorems give

```lean
commonSupport_mem_oppCap2_of_equalSource_nonEquilateral ... :
  z ∈ C.row1.support → z ∈ C.row2.support → z ∈ S.oppCap2

not_strictOppCap1CommonHit_of_equalSource_atLiveCenter ... :
  ¬ StrictOppCap1CommonHit C
```

Therefore a callback of type

```text
NonEquilateralOutput W.H C -> StrictOppCap1CommonHit C
```

would already be a disguised proof that this whole branch is false.  It is
not an independently producible incidence packet.  In particular, the
non-equilateral field of `MetricConsumerSelections` and the corresponding
field of `UnifiedFrontierParentCoupling` remain valid *consumer contracts*,
but this live-center branch must not be mined as though their common-hit
conclusion were a realizable intermediate object.

## Corrected residual route

After `metricConsumerRoute_of_metricResidual` selects the non-equilateral
subarm, route it through the already checked
`nonEquilateralSupportDichotomy`, or its geometric refinement
`NonEquilateralGeometryTerminal`:

```text
one native row is surplus-heavy
or
there are distinct exclusive strict-oppCap1 witnesses x,y with the checked
metric hinge.
```

The equal source strengthens both residuals by fixing the complete native-row
intersection to `{p}`.  It does not eliminate either support-dichotomy arm:
no retained theorem couples surplus heaviness to a contradiction, and the
strict witnesses still need reverse metric incidences.

### Sibling obstruction improvement

The strict-witness route to the sibling
`u1TwoLargeCapObstruction` previously requested a
`StrictWitnessBankCompletion`, consisting of:

- a common point `f` and its two native-row memberships; and
- two `f`-centered reverse equalities plus one `y`-centered reverse equality.

Here the common point is forced to be `f = p`, and both memberships are
automatic.  The new checked adapter

```lean
u1TwoLargeCapHypotheses_of_equalSource_strictWitness_reverseEqualities
```

reduces the completion to exactly three remaining equations:

```text
dist p x = dist p z2
dist p x = dist p y
dist y x = dist y z1.
```

Supplying those equations produces the complete
`U1TwoLargeCapHypotheses x z1 z2 y p` packet.  This is a real reduction, but
not closure: none of the current retained MEC/cap/critical-map fields proves
the three reverse equalities.

The follow-up in `../equal-source-non-equilateral/` removes a reachability
distraction: that packet closes directly through the import-reachable
production theorem
`Problem97.u5_equilateral_opposite_point_metric_incompatibility`, so the
sibling obstruction need not be imported.  Its exhaustive fixed-`f = p`
role audit checks all 24 bijections and confirms that no alternative map
needs fewer than the same three equalities.

The immediate next mathematical targets are therefore:

1. eliminate a surplus-heavy native row using the second-large-cap and
   native critical-expansion data; or
2. on the strict-witness arm, produce the three displayed reverse equalities
   (or prove a direct contradiction using strictly weaker Euclidean input).

Do not resume mining for a strict-`oppCap1` point common to the two native
rows; the checked singleton theorem rules that object out.

## Bank and indexed-corpus preflight

Before formalizing the correction, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered
`StrictOppCap1CommonHit`, common selected-row support in a strict opposite
cap, two selected four-classes, and non-equilateral continuation rows.  The
closest hits were cap-localization lemmas such as
`oppApex1_other_hit_strict_of_not_oppCap1`, generic common-support incidence
classifiers, and `u1TwoLargeCapObstruction`.  None produces the impossible
strict common hit from this equal-source surface.  The bank result is thus a
route correction, not a missing reuse opportunity.

## Validation

`StrictOppCap1HitProducer.lean` was checked directly with Lean 4.27.0 from
`lean/`, using the current colon-joined `/private/tmp/p97-*-oleans` scratch
search path and emitting

```text
/private/tmp/p97-r-f2-strict-oppcap1-hit-producer-oleans/
  StrictOppCap1HitProducer.olean
```

The check exited successfully.  All four printed declarations depend only
on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or `unsafe`.  No full Lake build was run.
