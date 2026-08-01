# G3 exact-blocker and no-qfree semantic proof recipe

Status: read-only design audit.  This note does not claim a compiled theorem or
kernel closure.

## Source clauses and available mathematical inputs

`probe.py` emits the two families as follows.

- `source-choice-implies-entire-blocker-radius-class`
  (`probe.py:272-288`) is actually guarded by **used center and selected row**:
  `[-U(c), -X(c,i), -E(c;a,z)]`, for `a` in the selected four-set and `z`
  outside it.  The family has `1949 * 4 * 6 = 46776` source clauses
  (`g3-family-emission-map.md:49`); the current retained semantic census has
  5083 such clauses.
- `source-choice-no-qfree-after-that-source-deletion`
  (`probe.py:290-310`) is
  `[-M(q,c), -E(c;a,b), -E(c;a,d), -E(c;a,e)]`, where
  `[a,b,d,e]` is a sorted four-subset of the nine labels other than `c,q`.
  The family has `92 * C(9,4) = 11592` source clauses
  (`g3-family-emission-map.md:50`); the current retained semantic census has
  426 such clauses.

The theorem-bank search found no whole-family clause theorem.  The needed
mathematical terminals are already imported locally:

- exact blocker: `CanonicalPacket.exactAt_usedCenter` and
  `CanonicalPacket.not_localEqHolds_of_exactAt`
  (`FullRadiusSemantics.lean:75-143,186-197`);
- no-qfree: `CriticalShellSystem.no_qfree_at`
  (`U1CarrierInjection.lean:1036-1039`) together with
  `CanonicalPacket.localFourHolds_to_hasNEquidistantPointsAt_erase`
  (`G3LocalFourGeometry.lean:61-71`).

Thus neither family needs a new geometric obligation.  What is missing is
typed row decoding plus Boolean-clause plumbing.

## Proposed declarations

Add the following import to `G3ClauseFamilySemantics.lean` (there is no import
cycle: `G3LocalFourGeometry` currently imports only `FullRadiusSemantics` and
the U5 kernel bank):

```lean
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3LocalFourGeometry
```

Add two generic all-negative clause helpers, proved by `by_cases` on the input
Booleans exactly as in `evalClauseD_three_to_one`:

```lean
theorem evalClauseD_three_negative
    (σ : Nat → Bool) {first second third : Nat}
    (hcontra :
      σ first = true → σ second = true → σ third = true → False) :
    evalClauseD σ
      [-Int.ofNat first, -Int.ofNat second, -Int.ofNat third] = true

theorem evalClauseD_four_negative
    (σ : Nat → Bool) {first second third fourth : Nat}
    (hcontra :
      σ first = true → σ second = true → σ third = true →
        σ fourth = true → False) :
    evalClauseD σ
      [-Int.ofNat first, -Int.ofNat second, -Int.ofNat third,
        -Int.ofNat fourth] = true
```

Use exact DIMACS payload definitions:

```lean
def exactBlockerClause
    (center : Label) (candidateIndex : Nat)
    (localEquality : Fin 495) : List Int :=
  [-Int.ofNat (encodeG3Var (.usedCenter center)),
    -Int.ofNat (xVar center.val candidateIndex),
    -Int.ofNat (encodeG3Var (.localEquality localEquality))]

def sourceCenterNoQFreeClause
    (sourceCenter : Fin 92)
    (first second third : Fin 495) : List Int :=
  [-Int.ofNat (encodeG3Var (.sourceCenter sourceCenter)),
    -Int.ofNat (encodeG3Var (.localEquality first)),
    -Int.ofNat (encodeG3Var (.localEquality second)),
    -Int.ofNat (encodeG3Var (.localEquality third))]
```

Factor the selected-row decoder currently embedded in
`CanonicalPacket.localEqHolds_of_selectedRow`:

```lean
theorem CanonicalPacket.selectedRowIndex_eq_baseIndex
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center : Label) (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (hselected :
      P.fullRadiusValuation shadow selected
        (xVar center.val candidateIndex) = true) :
    candidateIndex = P.baseIndex center.val
```

Its proof is the existing chain at
`G3ClauseFamilySemantics.lean:79-107`: transfer `fullRadiusValuation` to
`fullSourceChoiceValuation`, then to `separationValuation`, then
`baseValuation`, and finish with `baseValuation_x_iff`.  Refactor
`localEqHolds_of_selectedRow` to call this lemma rather than duplicate the
chain.

The exact-blocker family theorem should expose precisely the finite decoder
facts:

```lean
theorem CanonicalPacket.exactBlockerClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center inside outside : Label)
    (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (localEquality : Fin 495)
    (hrow :
      localEqRow localEquality = ⟨center, inside, outside⟩ ∨
      localEqRow localEquality = ⟨center, outside, inside⟩)
    (hinside :
      ((candMasks center.val).getD candidateIndex 0).testBit
        inside.val = true)
    (houtside :
      ((candMasks center.val).getD candidateIndex 0).testBit
        outside.val = false) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (exactBlockerClause center candidateIndex localEquality) = true
```

Proof:

1. Unfold `exactBlockerClause` and apply
   `evalClauseD_three_negative`.
2. Rewrite the three true Boolean hypotheses with
   `fullRadiusValuation_usedCenter` and
   `fullRadiusValuation_localEquality`; use `of_decide_eq_true`.
3. Obtain exactness from `P.exactAt_usedCenter shadow center hused`.
4. Apply `P.selectedRowIndex_eq_baseIndex ... hselected`.  Rewrite
   `hinside,houtside` by that equality and
   `coverIndex_testBit_of_cubeOk hP`; convert with
   `of_decide_eq_true` and `of_decide_eq_false`.
5. Case-split `hrow`.  In the first orientation use
   `P.not_localEqHolds_of_exactAt` directly.  In the second orientation apply
   the same theorem to `⟨center,inside,outside⟩` and close with the symmetry of
   the decoded distance equality.

For no-qfree, first isolate the geometric terminal:

```lean
theorem CanonicalPacket.not_localFourHolds_of_sourceCenterHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (sourceCenter : SourceCenterRow) (localFour : Fin 2310)
    (hcenter :
      (localFourRow localFour).center = sourceCenter.center)
    (hdeleted :
      sourceCenter.source ∉ (localFourRow localFour).support)
    (hmap : P.sourceCenterHolds shadow sourceCenter) :
    ¬ P.localFourHolds (localFourRow localFour)
```

Proof: feed `localFourRow_mem_encoderLocalFourRows localFour`, `hdeleted`, and
the assumed local-four semantics to
`P.localFourHolds_to_hasNEquidistantPointsAt_erase`.  Establish

```lean
L.pointOf (localFourRow localFour).center =
  H.centerAt (L.pointOf sourceCenter.source)
    (L.mem_carrier sourceCenter.source)
```

by rewriting with `hcenter`, then `← hmap`, then applying
`shadow.center_point_eq sourceCenter.source`.  Rewriting the resulting K4
witness by this equality contradicts
`H.no_qfree_at (L.pointOf sourceCenter.source)
  (L.mem_carrier sourceCenter.source)`.

Finally prove the family theorem:

```lean
theorem CanonicalPacket.sourceCenterNoQFreeClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (sourceCenter : Fin 92) (localFour : Fin 2310)
    (first second third : Fin 495)
    (source center anchor point₁ point₂ point₃ : Label)
    (hsourceCenter :
      sourceCenterRow sourceCenter = ⟨source, center⟩)
    (hfour :
      localFourRow localFour =
        ⟨center, [anchor, point₁, point₂, point₃]⟩)
    (hfirst :
      localEqRow first = ⟨center, anchor, point₁⟩)
    (hsecond :
      localEqRow second = ⟨center, anchor, point₂⟩)
    (hthird :
      localEqRow third = ⟨center, anchor, point₃⟩)
    (hdeleted : source ∉ [anchor, point₁, point₂, point₃]) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (sourceCenterNoQFreeClause sourceCenter first second third) = true
```

Proof:

1. Unfold the clause and apply `evalClauseD_four_negative`.
2. Decode the map atom with `fullRadiusValuation_sourceCenter`, and the three
   equality atoms with `fullRadiusValuation_localEquality`.
3. Reuse the construction at
   `G3ClauseFamilySemantics.lean:529-543` to prove
   `P.localFourHolds ⟨center,[anchor,point₁,point₂,point₃]⟩`: simplify list
   membership and dispatch the anchor case by reflexivity and the other three
   cases by the decoded equalities.  Rewriting by `hfour` yields
   `P.localFourHolds (localFourRow localFour)`.
4. Rewrite `hsourceCenter` in the map fact and rewrite `hfour` in
   `hdeleted`.  Apply
   `P.not_localFourHolds_of_sourceCenterHolds shadow
     ⟨source,center⟩ localFour`.

The finite retained-clause ledger then only needs to authenticate the supplied
`hrow`/mask facts for exact-blocker instances and the
`hsourceCenter`/`hfour`/three equality-row/`hdeleted` facts for no-qfree
instances.

## Pitfalls

- `equality_key` sorts the two endpoints (`probe.py:141-144`).  An
  exact-blocker clause generated from `(inside,outside)` may decode with the
  outside endpoint first.  Do not state only
  `localEqRow = ⟨center,inside,outside⟩`; retain the two-orientation
  disjunction and use equality symmetry.
- The exact-blocker guard is `U(c) ∧ X(c,i)`, not a source-choice variable.
  `exactAt_usedCenter` is therefore the direct consumer; routing through
  `sourceChoiceHolds` is unnecessary.
- The no-qfree guard is `M(q,c)`, not `U(c)`.  The proof needs the actual
  source label so that `shadow.center_point_eq q` aligns the decoded center
  with `H.centerAt q`.
- The no-qfree four-set is drawn from `incident_labels(c) \ {q}`.  Keep
  `q ∉ support` as an explicit authenticated decoder fact; it is the premise
  required by the erase bridge.
- The no-qfree equality rows have a fixed orientation because the quad is
  sorted and `anchor = quad[0]`; unlike exact-blocker, no symmetry case split
  is required there.
- Do not infer no-qfree merely from three equalities without authenticating
  that they are the three star edges of one decoded `localFourRow`.

## Verification status

No production Lean was edited.  A targeted build was attempted, but current
shared-worktree elaboration is blocked upstream by the unrelated syntax error

```text
Erdos9796Proof/P97/Census554/CapSelectedNativeClassifier.lean:92:35:
unexpected token '='; expected ':=', 'where' or '|'
```

Consequently the theorem bodies above remain a concrete source-level recipe,
not a compilation claim.
