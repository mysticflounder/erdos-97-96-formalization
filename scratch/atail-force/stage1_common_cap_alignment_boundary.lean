import outside_source_cap_multiplicity

/-!
# ATAIL Stage-I common-cap alignment boundary

This scratch module isolates the first cap-facing Stage-I sublemma on the
actual `SurplusCapPacket` / live critical-row surface.  Separate cap coverage
does not lose information silently: it gives an exact dichotomy between the
desired common-cap alignment and a named separated-cap packet.

The separated packet is not consumed by any current contradiction theorem.
Consequently the dichotomy is a dependency boundary, not a closure theorem:
a successful live producer must rule out `URowSeparatedCapPlacement` using
additional MEC/full-filter/all-center-`K4` geometry, or refine it to an
already-consumed metric/order alternate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneCommonCap

open U1Depth5
open ATAILOutsideSourceScratch

/-- The desired first Stage-I cap field. -/
def URowCommonCapAlignment
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧ rows.uRow.center ∈ S.capByIndex k

/-- The exact branch left when the two independently covered carrier points
do not share an indexed cap.  The universal field records genuine failure of
alignment; `kp ≠ kc` is then derived rather than postulated. -/
def URowSeparatedCapPlacement
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ kp kc : Fin 3,
    p ∈ S.capByIndex kp ∧
    rows.uRow.center ∈ S.capByIndex kc ∧
    (∀ k : Fin 3,
      ¬ (p ∈ S.capByIndex k ∧ rows.uRow.center ∈ S.capByIndex k)) ∧
    kp ≠ kc

/-- Individual cap coverage yields exactly common alignment or a separated
placement.  This theorem uses the actual live `p` and `u`-row center and does
not weaken them to abstract labels. -/
theorem commonCapAlignment_or_separatedCapPlacement
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    URowCommonCapAlignment S p q t1 t2 t3 u rows ∨
      URowSeparatedCapPlacement S p q t1 t2 t3 u rows := by
  classical
  by_cases hcommon : URowCommonCapAlignment S p q t1 t2 t3 u rows
  · exact Or.inl hcommon
  · right
    rcases exists_capByIndex_for_p S hfixed with ⟨kp, hp⟩
    rcases exists_capByIndex_for_uRow_center S rows with ⟨kc, hc⟩
    have hno : ∀ k : Fin 3,
        ¬ (p ∈ S.capByIndex k ∧ rows.uRow.center ∈ S.capByIndex k) := by
      intro k hk
      exact hcommon ⟨k, hk⟩
    have hk_ne : kp ≠ kc := by
      intro hkp
      exact hno kp ⟨hp, by simpa [← hkp] using hc⟩
    exact ⟨kp, kc, hp, hc, hno, hk_ne⟩

/-- Adapter to the exact `leafSurplusPacket` used by K-A-PAIR.  The other
two-large-cap binders do not occur because none of them currently refines the
separated branch. -/
theorem leaf_commonCapAlignment_or_separatedCapPlacement
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    {hncol : ¬ Collinear ℝ (D.A : Set Plane)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    let S := U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      (D := D) MT hCirc CP i hM hsurplus
    URowCommonCapAlignment S p q t1 t2 t3 u rows ∨
      URowSeparatedCapPlacement S p q t1 t2 t3 u rows := by
  dsimp only
  exact commonCapAlignment_or_separatedCapPlacement _ hfixed rows

/-- The separated branch is exactly the negation of common-cap alignment once
the routine live carrier coverage is available. -/
theorem separatedCapPlacement_iff_not_commonCapAlignment
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    URowSeparatedCapPlacement S p q t1 t2 t3 u rows ↔
      ¬ URowCommonCapAlignment S p q t1 t2 t3 u rows := by
  constructor
  · intro hsep hcommon
    rcases hsep with ⟨_kp, _kc, _hp, _hc, hno, _hne⟩
    rcases hcommon with ⟨k, hk⟩
    exact hno k hk
  · intro hnot
    rcases commonCapAlignment_or_separatedCapPlacement S hfixed rows with
      hcommon | hsep
    · exact False.elim (hnot hcommon)
    · exact hsep

/-- Exact additional geometric antecedent which closes sublemma 1: it is
enough to exclude the named separated placement.  No current theorem derives
this exclusion from the published K-A-PAIR binders. -/
theorem commonCapAlignment_of_not_separatedCapPlacement
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hgeometry : ¬ URowSeparatedCapPlacement S p q t1 t2 t3 u rows) :
    URowCommonCapAlignment S p q t1 t2 t3 u rows := by
  rcases commonCapAlignment_or_separatedCapPlacement S hfixed rows with
    hcommon | hsep
  · exact hcommon
  · exact False.elim (hgeometry hsep)

#print axioms commonCapAlignment_or_separatedCapPlacement
#print axioms leaf_commonCapAlignment_or_separatedCapPlacement
#print axioms separatedCapPlacement_iff_not_commonCapAlignment
#print axioms commonCapAlignment_of_not_separatedCapPlacement

end ATAILStageOneCommonCap
end Problem97
