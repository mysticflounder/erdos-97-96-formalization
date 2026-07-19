import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting
import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Retained-radius matching: geometric gap audit

This scratch file records two distinct facts.

* The repaired twelve-label finite fixture is not geometrically realizable:
  its row equalities contain a `DuplicateCenterCore`.
* On the live geometric surface, blocker injectivity forces two actual
  retained-radius points in the strict first opposite-cap interior to have
  distinct blockers and at least one directed cross omission.

The first result is a fixture regression.  It does not prove that an arbitrary
`RetainedRadiusBlockerMatching` produces a duplicate-center core.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedMatchingGeometricGap

open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailOrientedPhysicalApexIngress
open Census554.EqualityCore

attribute [local instance] Classical.propDecidable

section FiniteFixture

/-- The selected-row pattern of the repaired twelve-label matching fixture. -/
def repairedFin12Rows : RowPattern (Fin 12) :=
  ![
    {1, 2, 3, 4},
    {0, 2, 8, 9},
    {1, 5, 9, 10},
    {2, 8, 10, 11},
    {0, 3, 5, 6},
    {1, 6, 7, 8},
    {1, 4, 7, 10},
    {3, 6, 9, 10},
    {0, 1, 5, 11},
    {2, 5, 7, 11},
    {3, 7, 8, 11},
    {0, 4, 6, 10}
  ]

private theorem centerTwo_zero_one :
    EdgeClosure repairedFin12Rows (2, 0) (2, 1) := by
  apply EdgeClosure.trans (EdgeClosure.flip 2 0)
  apply EdgeClosure.trans (EdgeClosure.row 0 2 1 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 0 1)
  apply EdgeClosure.trans (EdgeClosure.row 1 0 2 (by decide) (by decide))
  exact EdgeClosure.flip 1 2

private theorem centerTwo_zero_three :
    EdgeClosure repairedFin12Rows (2, 0) (2, 3) := by
  apply EdgeClosure.trans (EdgeClosure.flip 2 0)
  apply EdgeClosure.trans (EdgeClosure.row 0 2 4 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 0 4)
  apply EdgeClosure.trans (EdgeClosure.row 4 0 6 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 4 6)
  apply EdgeClosure.trans (EdgeClosure.row 6 4 7 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 6 7)
  apply EdgeClosure.trans (EdgeClosure.row 7 6 10 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 7 10)
  apply EdgeClosure.trans (EdgeClosure.row 10 7 3 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 10 3)
  apply EdgeClosure.trans (EdgeClosure.row 3 10 2 (by decide) (by decide))
  exact EdgeClosure.flip 3 2

private theorem centerEight_zero_one :
    EdgeClosure repairedFin12Rows (8, 0) (8, 1) :=
  EdgeClosure.row 8 0 1 (by decide) (by decide)

private theorem centerEight_zero_three :
    EdgeClosure repairedFin12Rows (8, 0) (8, 3) := by
  apply EdgeClosure.trans (EdgeClosure.row 8 0 1 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 8 1)
  apply EdgeClosure.trans (EdgeClosure.row 1 8 2 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 1 2)
  apply EdgeClosure.trans (EdgeClosure.row 2 1 9 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 2 9)
  apply EdgeClosure.trans (EdgeClosure.row 9 2 7 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 9 7)
  apply EdgeClosure.trans (EdgeClosure.row 7 9 10 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 7 10)
  apply EdgeClosure.trans (EdgeClosure.row 10 7 3 (by decide) (by decide))
  apply EdgeClosure.trans (EdgeClosure.flip 10 3)
  apply EdgeClosure.trans (EdgeClosure.row 3 10 8 (by decide) (by decide))
  exact EdgeClosure.flip 3 8

/-- Exact equality-closure obstruction in the repaired Fin12 fixture. -/
def repairedFin12DuplicateCenterCore : DuplicateCenterCore repairedFin12Rows where
  p := 0
  q := 1
  r := 3
  a := 2
  b := 8
  hpq := by decide
  hpr := by decide
  hqr := by decide
  hab := by decide
  ap_aq := centerTwo_zero_one
  ap_ar := centerTwo_zero_three
  bp_bq := centerEight_zero_one
  bp_br := centerEight_zero_three

/-- The repaired Fin12 fixture passes weaker finite checks but cannot realize
its selected-row equalities by distinct planar points. -/
theorem repairedFin12_not_realizable :
    ¬ ∃ pointOf : Fin 12 → ℝ², Realizes repairedFin12Rows pointOf :=
  not_realizes_of_duplicateCenterCore repairedFin12DuplicateCenterCore

end FiniteFixture

#print axioms repairedFin12_not_realizable

section LiveGeometry

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hqNe : F.pair.q ≠ S.oppApex1 := by
    intro h
    apply hqOff
    rw [h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hdist : 0 < dist F.pair.q S.oppApex1 := dist_pos.mpr hqNe
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [hqRadius] using hdist

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Two distinct retained-radius sources with mutual cross membership have
the same actual blocker.  The live proof uses the first-apex radius equality,
the robust deletion consequence keeping both blockers away from that apex,
and the convex perpendicular-bisector bound. -/
theorem blocker_centers_eq_of_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {x y : ℝ²} (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 radius)
    (hyx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hxy' : x ∈ (H.selectedAt y hyA).toCriticalFourShell.support) :
    H.centerAt x hxA = H.centerAt y hyA := by
  classical
  let cx := H.centerAt x hxA
  let cy := H.centerAt y hyA
  let o := S.oppApex1
  have hoA : o ∈ D.A := by simpa [o] using oppApex1_mem_A S
  have hcxA : cx ∈ D.A := by
    simpa [cx, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨y, hyA⟩).2
  have hcx_ne_o : cx ≠ o := by
    simpa [cx, o] using R.actualBlocker_ne_firstApex x hxA
  have hcy_ne_o : cy ≠ o := by
    simpa [cy, o] using R.actualBlocker_ne_firstApex y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (H.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt x hxA).toCriticalFourShell.support_eq_radius y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (H.selectedAt y hyA).toCriticalFourShell.support_eq_radius x hxy'
      |>.trans
        ((H.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (H.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcx_ne_o.symm, hcy_ne_o.symm, hcxcy⟩
  omega

/-- Honest live-geometric reduction of the blocker-matching arm.  The two
sources lie in the actual strict opposite-cap interior and complete retained
radius filter.  Their actual blockers are distinct, and in at least one
direction deleting the partner preserves K4 at the source's blocker. -/
structure RetainedInteriorDirectedOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) : Type where
  source₁ : ℝ²
  source₂ : ℝ²
  source₁_mem_A : source₁ ∈ D.A
  source₂_mem_A : source₂ ∈ D.A
  sources_ne : source₁ ≠ source₂
  source₁_mem_radius :
    source₁ ∈ SelectedClass D.A S.oppApex1 radius
  source₂_mem_radius :
    source₂ ∈ SelectedClass D.A S.oppApex1 radius
  source₁_mem_capInterior : source₁ ∈ S.capInteriorByIndex S.oppIndex1
  source₂_mem_capInterior : source₂ ∈ S.capInteriorByIndex S.oppIndex1
  blockers_ne :
    H.centerAt source₁ source₁_mem_A ≠
      H.centerAt source₂ source₂_mem_A
  directed_omission :
    (source₂ ∉
        (H.selectedAt source₁ source₁_mem_A).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase source₂)
        (H.centerAt source₁ source₁_mem_A)) ∨
    (source₁ ∉
        (H.selectedAt source₂ source₂_mem_A).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase source₁)
        (H.centerAt source₂ source₂_mem_A))

/-- Blocker injectivity on the complete retained class produces the cap-local
directed-omission packet above. -/
theorem exists_retainedInteriorDirectedOmission_of_matching
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (M : RetainedRadiusBlockerMatching R) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  classical
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    rw [hcenter]
    exact S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex1
      (frontierRadius_pos R) (by simpa [hcenter] using
        R.frontierRadius_class_card_ge_four)
  have hone :
      1 < (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, y, hy, hxy⟩
  rcases Finset.mem_inter.mp hx with ⟨hxRadius, hxInterior⟩
  rcases Finset.mem_inter.mp hy with ⟨hyRadius, hyInterior⟩
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxRadius).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hyRadius).1
  let sx : CriticalShellSystem.CarrierVertex D.A := ⟨x, hxA⟩
  let sy : CriticalShellSystem.CarrierVertex D.A := ⟨y, hyA⟩
  let rx : RetainedRadiusSource (S := S) radius := ⟨sx, hxRadius⟩
  let ry : RetainedRadiusSource (S := S) radius := ⟨sy, hyRadius⟩
  have hblockerVertices_ne : H.blockerVertex sx ≠ H.blockerVertex sy := by
    intro heq
    have hrxy : rx = ry := by
      apply M.injective
      simpa [retainedRadiusBlocker, rx, ry, sx, sy] using heq
    exact hxy (congrArg (fun z : RetainedRadiusSource (S := S) radius => z.1.1) hrxy)
  have hblockers_ne : H.centerAt x hxA ≠ H.centerAt y hyA := by
    intro heq
    apply hblockerVertices_ne
    exact Subtype.ext (by
      simpa [CriticalShellSystem.blockerVertex, sx, sy] using heq)
  refine ⟨{
    source₁ := x
    source₂ := y
    source₁_mem_A := hxA
    source₂_mem_A := hyA
    sources_ne := hxy
    source₁_mem_radius := hxRadius
    source₂_mem_radius := hyRadius
    source₁_mem_capInterior := hxInterior
    source₂_mem_capInterior := hyInterior
    blockers_ne := hblockers_ne
    directed_omission := ?_ }⟩
  by_cases hyx :
      y ∈ (H.selectedAt x hxA).toCriticalFourShell.support
  · have hxyOutside :
        x ∉ (H.selectedAt y hyA).toCriticalFourShell.support := by
      intro hxy'
      exact hblockers_ne
        (blocker_centers_eq_of_mutual_cross_membership R hxA hyA hxy
          hxRadius hyRadius hyx hxy')
    exact Or.inr ⟨hxyOutside,
      (cross_deletion_survives_iff_not_mem_selected_support H hyA).mpr
        hxyOutside⟩
  · exact Or.inl ⟨hyx,
      (cross_deletion_survives_iff_not_mem_selected_support H hxA).mpr hyx⟩

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The retained parent is not in the `(m,4,4)` regime, so at least one of
its two actual non-surplus opposite caps has cardinality at least five. -/
theorem oppositeLargeCap_disjunction_of_parent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    5 ≤ (S.capByIndex S.oppIndex1).card ∨
      5 ≤ (S.capByIndex S.oppIndex2).card := by
  rcases oppositeCaps_card_ge_four D S with ⟨hfirstFour, hsecondFour⟩
  by_cases hfirstFive : 5 ≤ (S.capByIndex S.oppIndex1).card
  · exact Or.inl hfirstFive
  · right
    by_contra hsecondNotFive
    have hfirstEq : (S.capByIndex S.oppIndex1).card = 4 := by omega
    have hsecondEq : (S.capByIndex S.oppIndex2).card = 4 := by omega
    apply R.noM44
    refine ⟨S, ?_⟩
    constructor
    · simpa [← capByIndex_oppIndex1_eq_oppCap1 S] using hfirstEq
    · simpa [← capByIndex_oppIndex2_eq_oppCap2 S] using hsecondEq

/-- Smallest checked parent-facing packet obtained here from the matching arm.
It combines the cap-local directed omission with the only immediate
cardinality force contributed by `noM44`. -/
structure RetainedMatchingGeometricReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  omission : RetainedInteriorDirectedOmission R
  oppositeLargeCap :
    5 ≤ (S.capByIndex S.oppIndex1).card ∨
      5 ≤ (S.capByIndex S.oppIndex2).card

/-- The injective blocker arm always reaches the checked geometric reduction,
but no current theorem consumes that packet to `False`. -/
theorem nonempty_retainedMatchingGeometricReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (M : RetainedRadiusBlockerMatching R) :
    Nonempty (RetainedMatchingGeometricReduction R) := by
  rcases exists_retainedInteriorDirectedOmission_of_matching R M with ⟨P⟩
  exact ⟨⟨P, oppositeLargeCap_disjunction_of_parent R⟩⟩

end LiveGeometry

#print axioms blocker_centers_eq_of_mutual_cross_membership
#print axioms exists_retainedInteriorDirectedOmission_of_matching
#print axioms oppositeLargeCap_disjunction_of_parent
#print axioms nonempty_retainedMatchingGeometricReduction

end ATailRetainedMatchingGeometricGap
end Problem97
