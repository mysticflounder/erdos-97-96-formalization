# R-F2 cross-survival sink audit

Date: 2026-07-16

Status: **source-clean scratch result; no unconditional contradiction**

Lean artifact:
`scratch/atail-force/r-f2-cross-survival-sink/CrossSurvivalSink.lean`

## Question

Starting from
`F2GeneratedMetricSink.crossSurvivalOutput_of_bothQCritical`, does the
anchored support-heavy packet, together with the constructor-uniform genuine
escapes from `F2BoundaryAbsorption`, eliminate the exact q-deleted row in the
remaining cross-survival arm?

Answer: **not from the current interfaces**.

The genuine escapes do force new cross-row nonincidences, but the q-deleted
survivor is extracted independently from deletion survival. Nothing currently
identifies its support with the generated support at the same center, and
nothing transfers either the actual deleted source or the opposite generated
escape into it.

## Theorem-bank preflight

Before adding the scratch lemmas, the existing registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`;
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

The indexed Lean corpus was also searched with `nthdegree docs search --lean`
for:

- cross-deletion survivor / q-deleted row interactions;
- selected four-rows surviving another deletion;
- q-critical and q-deleted classes at one center;
- two rows with a common outside-cap pair;
- dangerous-triple incidence and fixed-class support;
- source/blocker and residual-center transport.

The closest reusable results were:

- `false_of_two_strictOppCap2_rows_common_outside_pair`;
- `SelectedFourClass.inter_card_le_two`;
- `U5QDeletedK4Class.inter_card_le_two`;
- `U5QAllowedK4Class.qCriticalTriple_of_mem_q`;
- `U5QAllowedK4Class.toQDeletedK4Class_of_not_mem_q`;
- the one-row bounds in `CrossSurvivalEliminator`.

No banked theorem consumes only the data present in
`CrossSurvivalOutput`. The U5 terminal families require additional directed
incidences or a support identification that this packet does not contain.

## Proven results

### 1. Named constructor-uniform escape

`GeneratedGenuineEscape G` retains:

- the exact point;
- membership in the actual generated support `G.support`;
- nonmembership in the actual deleted-source dangerous triple;
- nonmembership in `oppCap2`; and
- its `surplusCap` or strict-`oppCap1` role.

`nonempty_generatedGenuineEscape` is a named wrapper around
`ExactGeneratedAt.exists_genuineEscape`.

### 2. The two generated escapes diverge

For a both-q-critical pair, both completed generated rows contain the actual
deleted source `X.point`. The source is outside `oppCap2`. If the first
generated escape also lay on the second generated row, the two strict
`oppCap2` rows would share:

1. `X.point`; and
2. the first escape.

These are distinct outside-cap points, contradicting the ordered-cap
two-row theorem. The symmetric argument gives:

```text
BothQCriticalCase.firstEscape_not_mem_secondFullRow
BothQCriticalCase.secondEscape_not_mem_firstFullRow
```

`nonempty_bothQCriticalEscapePair` packages both escapes and proves:

```text
first.point ≠ second.point
first.point ∉ second generated full row
second.point ∉ first generated full row
```

This is unconditional under the anchored both-q-critical hypotheses.

### 3. Exact orientation is retained

`nonempty_first_or_secondCrossSurvivalPacket` refines
`crossSurvivalOutput_of_bothQCritical` to one of:

- `FirstCrossSurvivalPacket`: center `s` survives deletion of `t`, with an
  exact `QDeletedFourRow ... t s`; or
- `SecondCrossSurvivalPacket`: center `t` survives deletion of `s`, with an
  exact `QDeletedFourRow ... s t`.

Both packets retain the anchored `K` parameter, hence the actual source,
actual critical map/blocker, cap packet, MEC/convexity data, and the original
generated supports. No role is reconstructed from an anonymous point.

### 4. Exact existing ordered-cap terminal

In the first orientation, the existing ordered-cap theorem closes if the
independently extracted survivor contains:

```text
X.point
the genuine escape from the generated row at t
```

This is the two-field structure:

```text
FirstOtherGeneratedOutsidePairCoupling
```

and the compiled consumer is:

```text
false_of_firstCrossSurvival_otherGeneratedOutsidePair
```

The symmetric pair is:

```text
SecondOtherGeneratedOutsidePairCoupling
false_of_secondCrossSurvival_otherGeneratedOutsidePair
```

This is the smallest **named common-outside-pair bridge to the existing
opposite generated row**. It is not claimed to be the globally weakest
possible future theorem.

### 5. Complete source-incidence split for the survivor

`QDeletedFourRow.reclassify_at_source` proves that any exact survivor,
viewed at any other named source, is exactly one of the available U5 shapes:

```text
Nonempty (U5QCriticalTripleClass ... (support.erase source))
∨
Nonempty (U5QDeletedK4Class ... support)
```

The first branch occurs when the source is on the row; the second when it is
not. This is a bank-facing normalization, but neither branch is itself a
contradiction with the current data.

## Why the current data do not close

`nonempty_qDeletedFourRow_of_survival` starts from:

```text
HasNEquidistantPointsAt 4 (D.A.erase deleted) center
```

and chooses a four-point equidistant subset. The resulting support is not
definitionally the generated full-row support at that center. In particular,
the current packet proves neither:

```text
X.point ∈ survivor.support
```

nor:

```text
oppositeGeneratedEscape.point ∈ survivor.support
```

The generated escape theorem speaks only about the actual generated support.
Transferring that point into the independently chosen survivor would be an
invalid support substitution.

One membership alone does not activate the ordered-cap sink:

- if only `X.point` is shared, the rows have one named common outside point;
- if only the opposite escape is shared, they again have one named common
  outside point.

The existing geometry permits one common outside point. The terminal needs
two.

## Exact next producer choices

The direct producer surface is orientation-uniform:

```text
actual source belongs to the exact survivor
and
opposite generated escape belongs to the exact survivor
```

A stronger support-identification theorem would also suffice, for example:

```text
survivor.support = generatedFullRowAtSurvivingCenter.support
```

but that statement is not justified by the current extraction and appears
substantially stronger than the two named memberships.

The source reclassification theorem suggests the next theorem-discovery
split:

1. `X.point ∈ survivor.support`: exploit the resulting q-critical triple and
   seek one directed incidence placing the opposite escape on it;
2. `X.point ∉ survivor.support`: exploit the resulting q-deleted class and
   seek a U5 incompatibility with the generated q-critical row at the same
   center.

The current bank has no consumer for either branch without further
incidence data.

## Validation

Validated with Lean 4.27.0:

```bash
cd lean
mkdir -p /private/tmp/p97-r-f2-cross-survival-sink-oleans
LEAN_PATH="/private/tmp/p97-r-f2-boundary-absorption-oleans:/private/tmp/p97-r-f2-generated-metric-sink-oleans:/private/tmp/p97-r-f2-anchored-supportheavy-coupling-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$(lake env printenv LEAN_PATH)" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-cross-survival-sink-oleans/CrossSurvivalSink.olean \
  ../scratch/atail-force/r-f2-cross-survival-sink/CrossSurvivalSink.lean
```

The generated olean is present at:

```text
/private/tmp/p97-r-f2-cross-survival-sink-oleans/CrossSurvivalSink.olean
```

All local `#print axioms` checks report only:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `sorryAx`, or new axiom in the scratch source.

## Bottom line

This lane advanced the proof surface but did **not** close the parent sorry.
It rules out cross-row reuse of the generated escapes, preserves the exact
survival orientation and provenance, and identifies the precise current
ordered-cap bridge: two survivor-support memberships, source plus opposite
escape. Any unconditional closure must now produce those incidences or find a
different bank theorem for one of the exact source-reclassification branches.
