# Anchored F2 generated metric sink

## Scope

This lane owns only:

```text
scratch/atail-force/r-f2-generated-metric-sink/
```

It starts from
`ExactGeneratedPair.cross_survival_or_metricResidual` and couples the exact
generated rows back to the provenance-bearing anchored F2 support-heavy
packet. No production source, closure document, proof-blueprint state, or
protected file was changed.

The implementation is:

```text
F2GeneratedMetricSink.lean
```

## Theorem-bank preflight

The required registries were checked before formalizing a new sink:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches included:

```text
two q critical generated rows common deleted source metric residual equal radii strict opposite cap
cross deletion survival selected four class prescribed deletion criticality contradiction
two continuation rows strict oppCap1 common hit non equilateral
```

The closest banked/imported declarations were:

- `U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`;
- `U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`;
- `false_of_nonEquilateral_of_strictOppCap1CommonHit`;
- `cross_deletion_survives_iff_not_mem_selected_support`; and
- `CrossSurvivalOutput` with
  `nonempty_qDeletedFourRow_of_survival`.

The two U5 incompatibilities are not direct sinks for the generic generated
pair. The adjacent theorem still requires the dangerous blocker in both
q-critical supports. The third-common theorem requires the common point to be
the remaining point of the original dangerous triple, in addition to the
dangerous blocker occurring in both supports.

The `CriticalPairFrontier` cross-deletion theorems are indexed by a source's
actual blocker `H.centerAt q`. The generated cross-survival centers here are
the named support-heavy points `s,t`; the anchored packet does not identify
either one as the other's actual blocker. Thus those theorems do not eliminate
the remaining cross-survival output.

## New kernel-checked sink

Let `X.point` be the actual fresh deleted source and `s,t` the two named
support-heavy centers.

In the both-q-critical constructor, each completed selected four-row is:

```text
insert X.point generated_qCritical_support.
```

Therefore:

```text
X.point ∈ full row at s
X.point ∈ full row at t.
```

This is formalized by:

```lean
BothQCriticalCase.deleted_mem_firstFullRow
BothQCriticalCase.deleted_mem_secondFullRow
```

Both arms of `MetricResidual` give equal continuation-row radii:

```lean
ExactGeneratedPair.rowRadii_eq_of_metricResidual
```

Actual support membership then gives:

```text
dist s X.point = row₁.radius
dist t X.point = row₂.radius,
```

so a metric residual would imply:

```text
dist X.point s = dist X.point t.
```

But the provenance-bearing anchored coupling already proves:

```text
dist X.point s ≠ dist X.point t
```

through
`AnchoredSupportHeavyCoupling.deletedSource_separates_supportPair`, whose
source is the ordered-cap theorem
`firstCap_center_separates_secondApex_pair`.

Hence:

```lean
false_of_bothQCritical_metricResidual
```

eliminates both the non-equilateral and equilateral metric residuals in one
argument.

This proof uses only radius equalities obtained from actual selected-support
membership. It does not infer a radius inequality or equality from omission
of a point from a selected support.

## Exact surviving branch

Applying the original classifier and eliminating its metric arm gives:

```lean
cross_survival_of_bothQCritical
```

with conclusion:

```text
HasNEquidistantPointsAt 4 (D.A.erase t) s
or
HasNEquidistantPointsAt 4 (D.A.erase s) t.
```

The remaining branch is packaged at the existing exact interface by:

```lean
crossSurvivalOutput_of_bothQCritical
```

so it also carries a `QDeletedFourRow` for the surviving deletion. This is a
genuine continuation packet, not a contradiction.

## Sharp remaining boundary

Proven:

- the anchored both-q-critical generated pair cannot satisfy
  `MetricResidual`;
- therefore that constructor necessarily reaches a cross-survival arm; and
- the surviving arm has an exact q-deleted four-row package.

Not proven:

- either cross-survival arm is contradictory;
- either support-heavy center is the other's actual critical-map blocker;
- prescribed deletion criticality at `s` after deleting `t`, or at `t` after
  deleting `s`; or
- the metric residual is impossible in the q-deleted/q-deleted or mixed
  q-deleted/q-critical constructors.

The first missing ingredient for the both-q-critical constructor is now a
cross-survival sink or an alignment producer connecting the surviving
q-deleted row to the retained critical map. More metric mining on that
constructor is unnecessary.

For the other three q-deleted/q-critical constructor combinations, the
deleted source is absent from at least one completed row, so the common-source
argument above does not apply. No banked theorem found in this audit closes
those metric residuals from the currently retained hypotheses.

## Validation

Validated from `lean/` with Lean 4.27.0:

```bash
env LEAN_PATH="/private/tmp/p97-r-f2-generated-metric-sink-oleans:/private/tmp/p97-r-f2-anchored-supportheavy-coupling-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-generated-metric-sink-oleans/F2GeneratedMetricSink.olean \
  ../scratch/atail-force/r-f2-generated-metric-sink/F2GeneratedMetricSink.lean
```

Result: exit status 0.

Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean source contains no `sorry` or `admit`.
