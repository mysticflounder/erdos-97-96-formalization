# FreshThird shared-pair adapter audit (2026-08-03)

## Verdict

`Phase3SharedPairSeparation.selectedFourClass_shared_pair_separated` is **not
an import-only/source-clean adapter** for the live FreshThird noncanonical
same-cap mixed-q pair.  Its geometric core, `SurplusCOMPGBank.btw_sep`, is proven and could
be reused only after adding a new boundary/index and blocker-centred-row
bridge.  The current FreshThird fields do not imply a cap-interval/order
contradiction; the mixed-q disjunction is compatible with the alternation
conclusion of `btw_sep`.

## Exact theorem obligations

`selectedFourClass_shared_pair_separated`
(`lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean:31`) requires:

* a total `rowAt : (center : ↑A) → SelectedFourClass A center.1`, so each
  row is centred at its **label point**;
* an injective CCW convex enumeration `boundary : Fin n → ℝ²`, an injective
  `indexOf : ↑A → Fin n`, and `boundary (indexOf label) = label.1`;
* distinct centre labels and distinct point labels; and
* both points in both rows.

The proof obtains equal distances from each centre and applies
`SurplusCOMPGBank.btw_sep`.

`SurplusCOMPGBank.btw` is only the strict-between predicate on a chosen linear
`Fin` cut (`SurplusCOMPGBankSep.lean:85`), and `btw_sep`
(`SurplusCOMPGBankSep.lean:100`) additionally needs CCW/injective boundary data,
indices, two distance equalities, and point non-degeneracy.  It has no cap
semantics by itself.

## FreshThird field comparison

For `FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:10557`), the available
data are:

* distinct blocker centres
  `H.centerAt source ≠ H.centerAt Q.source₁`;
* `Q.source₁` and `Q.source₂` in the `source` selected-four support;
* exact two-point support overlap with the `Q.source₁` selected row;
* both blocker centres in one `S.capInteriorByIndex capIndex`;
* `Q.source₁ ∈ S.capByIndex capIndex ∨ Q.source₂ ∈ S.capByIndex capIndex`; and
* `capIndex ≠ S.oppIndex1`.

The selected rows have type
`CriticalSelectedFourClass D.A q (H.centerAt q)`: their radius is about the
blocker centre `H.centerAt q`, not about the source label `q`.  Therefore they
cannot directly instantiate `rowAt ... : SelectedFourClass A center.1`, and
there is no total row map indexed by blocker centres.  A direct call to
`btw_sep` would still need a global CCW boundary and injective source-to-index
map; the FreshThird packet retains neither.  Constructing and transporting
such a map is a new producer/bridge, not theorem-bank reuse.

## Cap order does not close the mixed-q branch

`ArcBlockContiguity.onArc_iff_between` (`ArcBlockContiguity.lean:52`) needs an
ordered pair of cap-chord endpoint indices (`ia < ib`) together with the CCW
injective boundary.  The FreshThird packet stores only membership in the
abstract `capInteriorByIndex`/`capByIndex`; it does not store Moser cap endpoint
indices, their order, apex placement, or a translation to `onArc`/`btw`.

Even with that bridge, the live hypothesis is the disjunction
`Q.source₁ ∈ cap ∨ Q.source₂ ∈ cap` (one endpoint may be outside).  `btw_sep`
asserts opposite betweenness statuses for an equal-distance pair, which is
consistent with one-inside/one-outside; it does not force both endpoints to lie
on the same side of the cap chord.  Hence no contradiction follows from the
current cap interval/order facts.

## Import/status audit

`FrontierLiveClosure.lean` does not import `Phase3SharedPairSeparation` (nor
`Phase3StructuralConstraintBank`), so the named theorem is not import-reachable
from the live Frontier coordinator.  The theorem and `btw_sep` themselves are
**PROVEN/source-clean**, but **inapplicable** to this packet.  A
blocker-centred row API plus global boundary/cap-index transport would be an
explicit new open producer; no closure credit should be assigned to the
noncanonical same-cap residual from this audit.
