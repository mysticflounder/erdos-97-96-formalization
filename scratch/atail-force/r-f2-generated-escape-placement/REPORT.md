# F2 generated-row escape placement

## Scope

This scratch lane retains the exact q-deleted/q-critical output of the
support-heavy global-K4 split and classifies its generated support relative
to

```text
T := (deletedCriticalSupport C).erase deleted,
live := {q, t1, t2, t3},
C.B₂,
S.oppCap2.
```

The implementation is
`F2GeneratedEscapePlacement.lean`.  It changes no production source,
closure documentation, proof-blueprint state, or other scratch lane.

## Bank preflight

Before proving new placement facts, this lane checked the theorem-bank
registries required by `AGENTS.md`, searched the indexed Lean corpus with
focused `nthdegree docs search --lean` queries, and inspected the closest
imported consumers:

- `U5QCriticalTripleClass.two_triple_points_incompatibility`;
- `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two`;
- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- the `ATailContinuationGeometryClassifier.TwoContinuationRows` suite; and
- the exact three-cap cover in
  `ATailNonEquilateralParentProducerScratch`.

No banked theorem directly contradicts the generated packet.  The useful
bank contribution is instead a sharp incidence upper bound, which becomes a
positive escape count after retaining the actual generated supports.

## Kernel-checked results

### Exact generated objects

`ExactGeneratedAt` preserves whether global K4 produced:

- an exact q-deleted four-row, with its support unchanged; or
- an exact q-critical three-row, whose ambient selected four-class is
  `insert deleted K.support`.

`F2SupportHeavyK4FourWay.toExactGeneratedPair` retains those exact objects at
both named support-heavy centers.  Every such pair is normalized, without
changing support, to the existing `TwoContinuationRows` interface.

### Pointwise live/middle placement

```lean
generated_offDangerous_middle_mem_live
```

proves that a generated support point outside `T` which lies in `C.B₂` must
lie in the live row.  Its contrapositive

```lean
generated_offDangerous_offLive_not_mem_middle
```

says that an off-`T`, off-live generated point cannot remain in `C.B₂`.

### Cap count

The two named support-heavy centers already occupy two of the three points
of `T` inside `oppCap2`.  Therefore:

```lean
dangerousTriple_sdiff_oppCap2_card_le_one
```

gives

```text
card (T \ oppCap2) ≤ 1.
```

The ordered-cap bank simultaneously gives at least two points outside
`oppCap2` in every completed generated four-row.

### Q-deleted output: genuine escape

```lean
qDeleted_exists_offDangerous_offOppCap2
```

proves that every exact q-deleted generated row contains a point `y` with

```text
y ∈ support,
y ∉ T,
y ∉ oppCap2,
y ∈ surplusCap ∨ y ∈ strictOppCap1Region.
```

This is a real source-faithful escape, not an anonymous cardinality deficit.

### Q-critical output: exact residual

```lean
qCritical_offDangerous_escape_or_uniqueBoundaryHit
```

proves the exact dichotomy:

1. the q-critical support has the same genuine off-`T`, off-`oppCap2`
   escape; or
2. it hits `T \ oppCap2`, and that boundary set has cardinality exactly one.

The no-escape branch is sharpened by

```lean
qCritical_noEscape_exact_cap_split
```

to:

```text
card (K.support \ oppCap2) = 1,
2 ≤ card ((K.support \ T) ∩ oppCap2).
```

Thus the unique point outside `oppCap2` is absorbed by the unique possible
dangerous-triple boundary point, while both guaranteed off-dangerous points
remain inside `oppCap2`.

If all off-`T` generated points are additionally confined to `C.B₂`, then

```lean
qCritical_exact_two_live_hits_of_offDangerous_middle_confined
```

proves

```text
card (K.support ∩ live) = 2.
```

This is sharp saturation of the two-circle bound, not a contradiction.

### Existing continuation DAG

For either constructor at either center, the exact pair feeds the existing
continuation classifier and yields:

```lean
ExactGeneratedPair.cross_survival_or_metricResidual
```

namely cross-deletion survival at one center, cross-deletion survival at the
other, or the existing metric residual.  The current bank has no theorem
turning that trichotomy into `False`.

## Consumer audit and precise missing antecedent

No production `sorry` closes from these facts alone.

For the q-critical U5 terminal, the contradiction adapter requires

```text
2 ≤ card (K.support ∩ T).
```

The exact generated row instead satisfies the banked upper bound

```text
card (K.support ∩ T) ≤ 1.
```

The remaining q-critical obstruction is therefore not another anonymous
support-count lemma.  A closing successor must supply at least one of:

1. exclusion of the unique possible hit in `T \ oppCap2`, producing a
   genuine off-`T`, off-`oppCap2` escape;
2. proof that one of the two off-`T` points is off live (equivalently, by the
   checked placement theorem, is not in `C.B₂`); or
3. an independent cross-incidence/rank fact that contradicts the exact
   two-live-hit or exact cap-split saturation.

The ordered-cap outside-pair theorem is not yet applicable: it needs two
distinct common points outside one ordered cap for the two distinct centers.
The exact continuation pair currently gives divergent outside witnesses,
not a shared outside pair.

## Validation

The file was checked directly with Lean 4.27 and a bounded 16 GiB memory
limit:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:${LEAN_PATH:-}" \
  lake env lean -M 16384 -R .. \
  -o /private/tmp/p97-r-f2-generated-escape-placement-oleans/F2GeneratedEscapePlacement.olean \
  ../scratch/atail-force/r-f2-generated-escape-placement/F2GeneratedEscapePlacement.lean
```

Result: exit status 0.

Every printed declaration depends only on:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in this lane.
