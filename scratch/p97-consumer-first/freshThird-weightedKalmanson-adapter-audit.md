# FreshThird -> weighted Kalmanson consumer audit (2026-08-07)

## Result

**CONJECTURE / interface audit (negative):** the active FreshThird anchor
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_pinnedEndpoint_outsideSeedResidual`
cannot construct
`GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`
from any of the three nested outcomes of
`nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion`.
No direct adapter or import reachability exists in the active source.

## Exact weighted-consumer interface

Source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean:720-748`.
The theorem requires:

1. `hA : ConvexIndep A`;
2. a finite label size `n`, boundary `boundary : Fin n -> R^2`, and
   `himage : Finset.univ.image boundary = A`;
3. `hccw : IsCcwConvexPolygon boundary`;
4. a row pattern `P : RowPattern (Fin n)` and realization
   `hreal : Realizes P boundary` (injectivity plus every row's equal-distance
   incidences);
5. `choices : List (RowChoice (Fin n))` and
   `hpositive : PositiveRowsMatch P choices`;
6. explicit finite certificate data
   `data : WeightedKalmansonCancellationData (Fin n)` and executable
   `hcheck : data.check choices = true`.

The checked data itself must contain a nonempty list of positively weighted
strict Kalmanson terms, and pairings whose left/right edge lists are exact
permutations of the repeated term edges; every pairing needs a checked
`ClosurePathData` path.  (`WeightedKalmansonCancellationData.Valid` at
lines 634-642; `check` at lines 644-655.)

The checker module imports only
`Census554.EqualityCore` and `ATail.CapCrossingKalmanson` (lines 7-8).
The FreshThird file's imports (lines 7-12) do **not** include
`FrontierLiveClosure.GenericRowNogoodCertificate`; a direct `#check` after
importing `TwoSourceFreshThirdResidual` reports the weighted theorem as an
unknown identifier.  Importing GenericRowNogoodCertificate separately makes
the exact signature above available.

## FreshThird anchor and three outcomes

At `TwoSourceFreshThirdResidual.lean:3318-3424`, the anchor has geometric
FreshThird hypotheses (exact four-row overlap, cap placement, seed localization,
row-cap split, and `hterminal`).  Its final local steps are:

```lean
have hcenterA : center ∈ D.A := ...
rcases exists_escaping_sourceFaithfulRow_of_endpoint_split DRow hterminal
  with ⟨Row, hrowEscape, hfan⟩
have hfanOutcome :=
  nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletionRow
    hcenterA Row hfan
```

The `...Row` helper at lines 3272-3308 is only a lossless presentation adapter:
it calls the raw producer and turns each cross-deletion `HasNEquidistantPointsAt`
arm into an existential selected-four-class support-avoidance witness.  It does
not add any weighted Kalmanson data.

The producer's exact result is

```lean
¬ FullyDeletionRobustAt D center ∨
  ∃ z w, z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
    ∃ blockerCap,
      blocker(z) ∈ S.capInteriorByIndex blockerCap ∧
      blocker(w) ∈ S.capInteriorByIndex blockerCap ∧
      (blocker(z) = blocker(w) ∨
       HasNEquidistantPointsAt 4 (D.A.erase w.1) (blocker(z)) ∨
       HasNEquidistantPointsAt 4 (D.A.erase z.1) (blocker(w))).
```

Thus the raw producer's three terminal arms are: (1) non-robust center; (2)
same-cap blocker collision; (3) one of the two cross-deletion survivals.  The
row adapter's third presentation is an avoiding selected-four-class witness.
None of these supplies
any of the weighted consumer's finite label pattern, CCW boundary ordering,
positive weighted Kalmanson terms, edge-multiset permutation, or closure paths.

Hypothesis-by-hypothesis gap:

| Weighted requirement | FreshThird/outcome status |
|---|---|
| `ConvexIndep A`, `boundary`, `himage`, `hccw` | `D.A` and cap geometry are present, but no `Fin n` boundary labeling or CCW polygon theorem is exposed by the anchor. |
| `P`, `hreal` | No `RowPattern (Fin n)`/`Realizes`; `SelectedFourClass` and `SourceFaithfulSelectedFourDeletionFan` are geometric support classes, not a finite pattern realization. |
| `choices`, `PositiveRowsMatch` | No `RowChoice` list or positive-incidence adapter is constructed. A deletion fan gives blocker rows, not row-edge incidence paths. |
| nonempty weighted terms | None of the three outcomes asserts a strict Kalmanson inequality/order quadruple or a positive weight. |
| pairings + `data.check` | No weighted edge lists, permutation equalities, or checked `ClosurePathData`; blocker equality/deletion facts do not imply them. |

Consequently, no arm can be passed to the weighted consumer without a new
source-level producer and a universal lift.  The existing theorem body ends in
`sorry` immediately after `hfanOutcome` (line 3378); this is the precise
consumer/producer boundary, not a failed tactic conversion.

## Indexed/theorem-bank searches

`nthdegree docs search --corpus erdos-97-96-formalization-lean` finds the exact
weighted theorem (`3CGNP3`), FreshThird anchor (`2VMC52`), and producer
(`F996ZT`), but no adapter declaration.  The required canonical registries
were also searched (`docs/general-n-certificate-bank-mining-2026-07-09.md`,
the three `certificates/*general*n*mining.{md,json}` files); they contain no
FreshThird-to-weighted-cancellation bridge.  The general bank doc records the
weighted checker as a separate linear-terminal consumer and explicitly says
the live FreshThird frontier still needs a cardinality-independent
fan-to-consumer lift.
