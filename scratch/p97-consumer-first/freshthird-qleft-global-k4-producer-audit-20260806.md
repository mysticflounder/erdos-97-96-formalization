# FreshThird `qLeft` global-K4 producer audit (2026-08-06)

## Scope and status

Target: the exceptional canonical-source/different-fresh-cap arm below
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

This is an audit and proposed source contract only.  It adds no Lean
declaration and proves no live theorem.

## What the current APIs prove

**PROVED.** Global K4 at a carrier point `qLeft` supplies

```lean
KLeft : SelectedFourClass D.A qLeft.1
```

via `exists_selectedFourClass_of_globalK4`; the packaged ingress is
`exists_globalK4Row_and_sourceFaithfulCriticalCover` in
`TwoSourceRetainedMinimalCore.lean`.

**PROVED.** If both named points lie on that row, then the missing equality is
immediate:

```lean
canonicalSource.1 ∈ KLeft.support ->
qRight.1 ∈ KLeft.support ->
dist qLeft.1 canonicalSource.1 = dist qLeft.1 qRight.1
```

by two uses of `SelectedFourClass.support_eq_radius`.

**PROVED.** The existing deletion API gives the precise way to force those
memberships.  `ATailStageOnePrescribedApexDichotomy.
criticalSelectedFourClass_at_of_no_qfree` constructs a critical selected row
at a prescribed carrier center when deleting its named source blocks K4.
Then `source_mem_critical_support_of_no_qfree` forces any second source whose
deletion blocks K4 at the same center into that row.

Consequently the following packet is sufficient:

```lean
def QLeftPinnedPair
    (qLeft canonicalSource qRight : CarrierLabel D.A) : Prop :=
  ¬ HasNEquidistantPointsAt 4
      (D.A.erase canonicalSource.1) qLeft.1 ∧
  ¬ HasNEquidistantPointsAt 4
      (D.A.erase qRight.1) qLeft.1
```

Given the already required strict named boundary order (hence
`qLeft != canonicalSource`), `D.K4`, and `qLeft.2`, the first conjunct builds a
critical row centered at `qLeft` through `canonicalSource`; the second puts
`qRight` on it.  Its two radius equations prove

```lean
dist qLeft.1 canonicalSource.1 = dist qLeft.1 qRight.1
```

This is weaker than requiring the two iterated blocker equalities

```lean
H.centerAt canonicalSource.1 canonicalSource.2 = qLeft.1
H.centerAt qRight.1 qRight.2 = qLeft.1
```

because those equalities merely supply the two `no_qfree` conjuncts after
rewriting with `H.no_qfree_at`.

## Weakest recommended producer contract

Refine the named Kalmanson bridge from
`freshthird-kalmanson-producer-audit-20260806.md` by replacing its raw metric
equality with `QLeftPinnedPair`:

```lean
theorem exists_freshThird_namedPinnedKalmansonBridge_of_exceptional ... :
  ∃ B cut qLeft qRight,
    EndpointSwap Q qLeft qRight ∧
    FreshThirdNamed012124314Order B cut
      sourceCenter qLeft canonicalSource freshCenter qRight ∧
    QLeftPinnedPair D qLeft canonicalSource qRight
```

The order component is still needed by the existing five-role Kalmanson
consumer.  The pinned-pair component is the smallest currently expressible
global-deletion ingress that forces the missing `124` equality without
assuming the equality itself or naming an unnecessarily strong selected row.

## Why the obvious global-K4 dichotomy is not enough

For an arbitrary `KLeft` supplied by global K4, classical logic gives only

```lean
(canonicalSource.1 ∈ KLeft.support ∧ qRight.1 ∈ KLeft.support) ∨
canonicalSource.1 ∉ KLeft.support ∨ qRight.1 ∉ KLeft.support.
```

The negative arm does not currently feed a proved FreshThird terminal.
Likewise, negating `QLeftPinnedPair` yields only K4 survival at `qLeft` after
one of the two named deletions.  No current same-cap alignment, distinct-cross-
rows, outside-overlap, common-radius, or Kalmanson terminal consumes that
survival fact.

In particular:

* `H.selectedAt qLeft` is centered at `H.centerAt qLeft`, not at `qLeft`, so it
  cannot be substituted for `KLeft`.
* `CriticalShellSystem.source_mem_selectedFourClass` applies to rows centered
  at a known blocker center; global K4 at `qLeft` alone supplies no such
  blocker equality.
* `FreshThirdSameCapCrossRowAlignment` and `HasDistinctCrossRows` concern the
  existing source-faithful rows.  They are not consequences of a missed point
  on an arbitrary `qLeft`-centered row.
* The anonymous triple-shell escape packet does not identify either named
  deletion at `qLeft`.

Therefore there is presently no honest two-arm theorem whose positive arm is
the `124` row hit and whose complement immediately enters an existing proved
terminal.  Adding such a disjunction as an assumption would merely hide the
same producer gap.

## Recommendation

Search or compute specifically for the universal named clause
`QLeftPinnedPair` (allowing the endpoint swap selected by the boundary order).
The encoder must retain the two named deletion predicates at the dynamically
chosen `qLeft`; a generic global-row variable is insufficient.  If the clause
is false in a source-faithful model, mine the surviving-deletion arm for a new
consumer before promoting a dichotomy.  Do not encode the complement as an
existing-terminal arm unless the exact Lean adapter has first been proved.

