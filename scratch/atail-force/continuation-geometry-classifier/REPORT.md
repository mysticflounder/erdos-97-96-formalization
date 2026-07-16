# Continuation geometry classifier

Date: 2026-07-14

Status: **PROVEN scratch classifier; no contradiction claimed.**

## Result

`ContinuationGeometryClassifier.lean` kernel-checks a symmetric-apex packet
and the first branch-complete classifier for its two global continuation rows.
It is deliberately scratch-only.

Let `K₁` be a selected four-class centered at `oppApex1` and `K₂` one
centered at `oppApex2`.  The two adjacent one-hit bounds and exact-radius
covers give:

- distinct `a,b` in
  `K₁.support ∩ (oppCap1 \ (surplusCap ∪ oppCap2))`; and
- distinct `z₁,z₂` in
  `K₂.support ∩ (oppCap2 \ (surplusCap ∪ oppCap1))`.

Global K4 supplies selected rows `R₁` and `R₂` centered at `z₁` and
`z₂`.  This is packaged by
`SymmetricApexContinuationPacket` and produced by
`nonempty_symmetricApexContinuationPacket`.

## PROVEN facts

### Fixed first-apex pair is an immediate conditional terminal

`oppApex1` is an endpoint of `oppCap2`, while `a,b` are distinct carrier
points outside `oppCap2`.  Thus
`CapSelectedRowCounting.outsidePair_unique_capCenter` proves:

```text
not_both_mem_selectedRow_at_strictOppCap2:
  z ∈ strict(oppCap2) →
  R : SelectedFourClass A z →
  ¬ (a ∈ R.support ∧ b ∈ R.support).
```

Consequently each of `R₁,R₂` omits at least one of `a,b`.  The theorem
`firstPair_omitted_by_eachContinuationRow` exposes that exact two-row split.
This is the clean symmetric-apex adapter requested by the selector audit.

### Cap geometry of the two new rows

For each `Rᵢ`, selected-row cap counting gives at least two support points
outside `oppCap2`:

```text
2 ≤ (Rᵢ.support \ oppCap2).card.
```

The two distinct centers are in the same ordered cap.  Reapplying outside-pair
uniqueness to any hypothetical two common outside points gives:

```text
(((R₁.support ∩ R₂.support) \ oppCap2).card ≤ 1).
```

Therefore the rows genuinely diverge in both directions: each has an
outside-cap support witness omitted by the other.  This is kernel-checked as
`exists_divergent_outside_witnesses`.

### Pairwise-deletion classifier

For `d = dist z₁ z₂` and parent radius `r = K₂.radius`, the theorem
`cross_survival_or_metricResidual` proves exactly one of the following
branch-covering alternatives (the disjunction need not be exclusive):

1. K4 at `z₁` survives deletion of `z₂`;
2. K4 at `z₂` survives deletion of `z₁`; or
3. both selected rows contain the opposite continuation center and one of two
   residual metric arms holds:

   - **non-equilateral residual:** `d ≠ r`, both row radii equal `d`, and
     `oppApex2` is absent from both selected supports;
   - **equilateral residual:** `d = r`, both row radii equal `r`, and
     `oppApex2` belongs to both selected supports.

The equilateral membership conclusion is stronger than a distance-only
statement.  If the apex were at the right radius but omitted from either
four-support, it would be a fifth same-radius carrier point and would replace
the deleted continuation center, contradicting failure of that cross
deletion.

In the equilateral residual, the apex is exactly the unique common
outside-`oppCap2` support point:

```text
(R₁.support ∩ R₂.support) \ oppCap2 = {oppApex2}.
```

### Aggregate handoff

`exists_with_firstPair_omission_and_continuationGeometry` simultaneously
produces:

- the symmetric first-apex pair and second-apex continuation rows;
- omission of at least one fixed-pair label by each continuation row;
- two outside-cap support points per continuation row;
- common outside support cardinality at most one; and
- the cross-survival-or-metric-residual classifier.

All listed theorems elaborate with exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, `native_decide`, custom axiom, declared `axiom`,
`sorry`, or `admit` in the scratch source.

## Theorem-bank audit

Before deriving the classifier, this lane checked the required current and
archived registries and searched the indexed Lean corpora.  The immediately
relevant reusable current theorems were:

- `SelectedFourClass.inter_card_le_two`;
- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `Dumitrescu.perpBisector_apex_bound`;
- `eq_of_equidistant_three_noncollinear`; and
- the cross-deletion support lemmas in `ATail/CriticalPairFrontier.lean`.

The archived U5 incompatibility families and current source-pushout/rank/lap
consumers require richer named row incidence, endpoint-edge, rank, or U5 packet
data.  None consumes the residual above directly.  In particular, the
outside-pair theorem is now fully used: it gives the fixed-pair omission and
the no-common-outside-pair result, not an unconditional contradiction.

## OPEN

The next producer must classify the forced omissions/divergent outside
witnesses into an existing consumer.  The smallest explicit open split is:

1. identify which of `a,b` each of `R₁,R₂` omits (a row may omit both);
2. combine that label split with the two row-local outside witnesses; and
3. produce either a `SameCapIncompatibleEdge` plus rank/lap data, a repeated
   outside pair at another forced center, or a metric/U5 packet matching a
   banked incompatibility theorem.

The two `MetricResidual` arms also remain open unless a consumer is supplied.
No theorem in this file states `False` from the live packet alone.

## EMPIRICAL / HEURISTIC

No new computation or heuristic claim is used by this lane.  Every positive
claim above is Lean-kernel checked.  The exact 35-point SymPy regression that
motivated the global-K4 continuation remains a separate, external
exact-within-model result and is not used in these proofs.

## Validation

From the repository's `lean/` directory:

```bash
lake env lean \
  ../scratch/atail-force/continuation-geometry-classifier/ContinuationGeometryClassifier.lean
```

The final direct scratch elaboration exits zero.  The only non-Lean diagnostic
printed by the managed environment is `Not privileged to set domain
environment.`; all requested axiom probes report the three core axioms listed
above.

Only files under
`scratch/atail-force/continuation-geometry-classifier/` were created or
changed by this lane.  No production source, closure document, `SurplusM44`,
unique-row, `(6,5,4)`, or census file was edited.
