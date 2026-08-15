# Pinned-endpoint outside-seed proof attempt (2026-08-13)

Target:

```lean
Problem97.false_of_freshThird_pinnedEndpoint_outsideSeedResidual
```

Source:
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`.

## Result

No source-clean proof is available from the current hypotheses through the
import-reachable exact consumers.  This is not a claim that the proposition is
mathematically independent; it identifies the first missing Lean antecedents
on the current fan-to-consumer route.

After `exists_escaping_sourceFaithfulRow_of_endpoint_split`, the target has:

```lean
Row       : SelectedFourClass D.A center
hrowEscape : ∃ z ∈ Row.support, z ∉ seed
hfan      : SourceFaithfulSelectedFourDeletionFan D S H Row
```

The source-faithful fan normalizers then expose two unresolved stages.

## Stage 1: center-blocker arm

The weakest antecedent needed to enter the existing mutual-cross producer is

```lean
∀ (w : ℝ²) (hw : w ∈ Row.support),
  center ≠ H.centerAt w (Row.support_subset_A hw)
```

The current hypotheses only exclude the two named source and fresh centers:

```lean
hcenterNeSource
hcenterNeFresh
```

They do not classify all four canonical blocker centers of `Row`.  If one row
source has blocker center equal to `center`, `hfan` legitimately enters its
equal-support/nonrobust arm.  Neither `hcenterSeed`, `hcenterLocation`,
`hrowEscape`, nor `hmult` contradicts that arm: an exact four-row may have
three seed points and one outside-seed point.  The stronger sufficient
antecedent `FullyDeletionRobustAt D center` is also absent.

## Stage 2: exact Kalmanson ingress

Even after assuming the no-center-blocker antecedent, the existing producer
returns row sources `z != w` with:

```lean
z ∈ Row.support
w ∈ Row.support
w ∉ canonicalRow(blocker z)
z ∉ canonicalRow(blocker w)
blocker z ≠ blocker w
```

The nearest exact terminal is the support-first triangle (or one of its three
orientation variants) in `KalmansonThreeEqualitySchemas.lean`.  To instantiate
it one still needs a positive shared support point `u`:

```lean
u ∈ canonicalRow(blocker z).support
u ∈ canonicalRow(blocker w).support
```

together with six pairwise-distinct carrier roles and a `BoundaryIndexing`
placing

```text
u, z, w, blocker(w), center, blocker(z)
```

in one of the four accepted strict cyclic orders.  The current fan supplies
the two negative cross-incidences, not this positive common point or its cyclic
placement.

## Exact closure boundary

The first missing antecedent in proof order is therefore the all-support
no-center-blocker statement above (or the stronger
`FullyDeletionRobustAt D center`).  After that, the first missing antecedent
for the checked geometric terminal is the positive common-support witness
`u`; the strict six-index cyclic-order lift remains after it.

No production file was edited, no replacement `sorry` was introduced, and no
solver or broad theorem-search wave was run.
