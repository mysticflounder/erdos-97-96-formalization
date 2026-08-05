# Fresh-third vs. first-fiber/five-center signatures (2026-08-03)

## Source-clean status

`lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean` contains no
`sorry`/`axiom`; direct `lake env lean` from `lean/` completed with an empty
log (the module is source-clean in this check).

## Exact interfaces

* `firstFiber_firstSourceHit_or_fiveCenterDeletion`
  (`FirstFiberOverlapDescent.lean:386-431`) takes retained collisions `P,
  Pρ`, **`Q : FreshOutsideFirstBlockerFiber P Pρ`**, a carrier `source`,
  center inequality `center(source) ≠ center(P.source₁)`, the omission
  disjunction `P.source₁ ∉ row(source) ∨ P.source₂ ∉ row(source)`, a
  localized common deletion `LP : LocalizedCollisionCommonDeletion Pρ` with
  `LP.fresh = P.source₁`, and two arbitrary robust centers
  `R₂,R₃ : FullyDeletionRobustAt D _`.  It returns either the first-source
  hit/partner omission plus omission of `Q.source` or `Q.otherOutsidePoint`,
  or a five-center K4-survival packet after deleting `P.source₁`.

* `firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion`
  (`...:528-562`, result continues at `563`) has the same ambient data but
  **`Q : FreshOutsideFirstBlockerFiber P Pρ`**, both omission disjunctions
  (for `P` and `Pρ`), both localized deletions/cycle fresh equalities
  (`LPρ.fresh = Pρ.source₁`, `LP.fresh = P.source₁`), and `R₂,R₃`.  It
  returns the two-anchor-hit residual (both first sources hit, both partners
  omitted, one named off-cap point omitted) or a five-center deletion packet
  deleting one of `P.source₁`/`Pρ.source₁`.

* `sixCenterDeletionSurvivalPacket_of_oneSided`
  (`FrontierLiveClosure.lean:13741-13756`) takes carrier vertices `source,
  source'`, complete **`FirstFiberCapSourceWitness`** data for each, and
  `TwoCapSourcesOneSidedDeletionSurvival source source'` (one source row
  survives deleting the other source).  It returns a disjunction of
  `SixCenterDeletionSurvivalPacket`, i.e. five-center survival plus the
  surviving source center and a six-point cardinality certificate.  Its
  section still supplies `D,S,H,P,Pρ,T` and `hblockersNe`; it intentionally
  omits `hρne`, frontier-cardinality/interior equalities, pair disjointness,
  and localized-cycle data.

## Applicability to `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`

The target (`FrontierLiveClosure.lean:11324-11331`) has `C :
TwoCapSourceThirdCanonicalRowSurface P Pρ`, **`Q : FreshThirdBlockerFiber P
Pρ`**, and one of three constructors in
`FreshThirdNormalizedResidualRemainingCase`: `firstNonHit`, `secondNonHit`,
or `equalCrossRowCenters` with two `FreshThirdNonCanonicalInteraction`s.

No theorem above applies directly to the target or any constructor:

1. `FreshThirdBlockerFiber` is not `FreshOutsideFirstBlockerFiber`.  It has
   two fresh sources sharing a blocker and mutual shell membership, but no
   `otherOutsidePoint`; there is no coercion/conversion in the source.
2. The first two theorems additionally require localized deletion packets,
   source-row omission disjunctions, and robust centers that are not fields
   of any `FreshThirdNormalizedResidualRemainingCase` constructor.  The
   `sourceRowOmission` branch of `FreshThirdCapSourceNonHit` only gives a
   deletion of `Q.source₁` or `Q.source₂` preserving the current source row;
   it does not provide the `FreshOutside...` fiber or the anchored-cycle
   hypotheses.
3. `equalCrossRowCenters` carries cross-row hits and noncanonical
   (different-cap/same-cap) interactions, not the first-fiber two-anchor-hit
   residual expected by theorem 2.
4. `sixCenterDeletionSurvivalPacket_of_oneSided` could be used only after
   independently supplying `FirstFiberCapSourceWitness` for `C.firstSource`
   and `C.secondSource` (available as `C.firstSource_data`/
   `secondSource_data`) **and** proving one-sided deletion survival between
   those two C-sources.  None of the three residual constructors supplies
   that latter disjunction: their omission/survival fields concern a C-source
   versus `Q.source₁`/`Q.source₂`.  Even when applicable, the theorem is a
   six-center producer, not a contradiction (`False`) by itself.

Consequently these are reusable only behind a new bridge that converts the
fresh-third packet to a `FreshOutside` packet or proves C-source one-sided
survival; they do not close the current normalized-remaining `sorry`.
