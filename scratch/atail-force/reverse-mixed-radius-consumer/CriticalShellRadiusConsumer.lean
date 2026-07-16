/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DeletedApexOmissionProducer
import ReverseMixedResidualReduction

/-!
# Scratch: the generic radius content of a deletion-critical shell

For an exact critical four-shell through a source point, a selected four-row
at the same center can omit that source exactly when it lies on a second
K4-capable radius.  If deleting the source blocks K4, neither object exists
and the shell radius is the unique positive K4-capable radius at that center.

This is a generic consumer for all four aligned reverse-mixed arms.  It is a
rigidity conclusion, not a contradiction: the current reverse-mixed surface
does not produce the forbidden second radius.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailReverseMixedRadiusConsumerScratch

open ATailDeletedApexOmissionProducerScratch
open ATailJointTransitionCoreScratch
open ATailReverseMixedResidualReductionScratch
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

/-- A selected four-row at the critical center that omits the shell source. -/
structure CriticalShellOmissionRow
    {A : Finset ℝ²} {source center : ℝ²}
    (_C : CriticalSelectedFourClass A source center) where
  row : SelectedFourClass A center
  source_not_mem : source ∉ row.support

/-- A positive K4-capable radius at the critical center distinct from the
exact shell radius. -/
structure CriticalShellDistinctRadiusClass
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center) where
  radius : ℝ
  radius_pos : 0 < radius
  card_ge_four : 4 ≤ (SelectedClass A center radius).card
  radius_ne_shell : radius ≠ C.toCriticalFourShell.radius

/-- A second K4-capable radius produces a selected row omitting the critical
source, since that source lies at the shell radius. -/
theorem nonempty_omissionRow_of_distinctRadiusClass
    {A : Finset ℝ²} {source center : ℝ²}
    {C : CriticalSelectedFourClass A source center}
    (W : CriticalShellDistinctRadiusClass C) :
    Nonempty (CriticalShellOmissionRow C) := by
  rcases exists_selectedFourClass_at_radius_of_four_le_selectedClass
      W.radius_pos W.card_ge_four with ⟨K, hKradius⟩
  refine ⟨{ row := K, source_not_mem := ?_ }⟩
  intro hsource
  apply W.radius_ne_shell
  calc
    W.radius = K.radius := hKradius.symm
    _ = dist center source :=
      (K.support_eq_radius source hsource).symm
    _ = C.toCriticalFourShell.radius :=
      C.toCriticalFourShell.support_eq_radius source
        C.toCriticalFourShell.q_mem_support

/-- A selected row omitting the critical source must lie on a radius distinct
from the exact shell radius. -/
theorem nonempty_distinctRadiusClass_of_omissionRow
    {A : Finset ℝ²} {source center : ℝ²}
    {C : CriticalSelectedFourClass A source center}
    (P : CriticalShellOmissionRow C) :
    Nonempty (CriticalShellDistinctRadiusClass C) := by
  have hsubset :
      P.row.support ⊆ SelectedClass A center P.row.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨P.row.support_subset_A hz, P.row.support_eq_radius z hz⟩
  have hfour :
      4 ≤ (SelectedClass A center P.row.radius).card := by
    have hle := Finset.card_le_card hsubset
    simpa [P.row.support_card] using hle
  have hne : P.row.radius ≠ C.toCriticalFourShell.radius := by
    intro hradius
    have hclass :
        SelectedClass A center C.toCriticalFourShell.radius =
          C.toCriticalFourShell.support := by
      simpa [SelectedClass] using C.toCriticalFourShell.support_eq.symm
    have hrowSubset :
        P.row.support ⊆
          SelectedClass A center C.toCriticalFourShell.radius := by
      intro z hz
      exact mem_selectedClass.mpr
        ⟨P.row.support_subset_A hz,
          (P.row.support_eq_radius z hz).trans hradius⟩
    have hrowFull :
        P.row.support =
          SelectedClass A center C.toCriticalFourShell.radius := by
      apply Finset.eq_of_subset_of_card_le hrowSubset
      rw [hclass, C.toCriticalFourShell.support_card,
        P.row.support_card]
    apply P.source_not_mem
    rw [hrowFull, hclass]
    exact C.toCriticalFourShell.q_mem_support
  exact ⟨
    { radius := P.row.radius
      radius_pos := P.row.radius_pos
      card_ge_four := hfour
      radius_ne_shell := hne }⟩

/-- Generic exact equivalence: source omission at the critical center is the
same finite-radius datum as a second K4-capable radius. -/
theorem criticalShellOmission_iff_distinctRadiusClass
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center) :
    Nonempty (CriticalShellOmissionRow C) ↔
      Nonempty (CriticalShellDistinctRadiusClass C) := by
  constructor
  · rintro ⟨P⟩
    exact nonempty_distinctRadiusClass_of_omissionRow P
  · rintro ⟨W⟩
    exact nonempty_omissionRow_of_distinctRadiusClass W

/-- A source-omitting selected row directly contradicts deletion criticality. -/
theorem false_of_blocked_and_omissionRow
    {A : Finset ℝ²} {source center : ℝ²}
    {C : CriticalSelectedFourClass A source center}
    (blocked : ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (P : CriticalShellOmissionRow C) : False := by
  apply blocked
  refine ⟨P.row.radius, P.row.radius_pos, ?_⟩
  have hsubset :
      P.row.support ⊆
        SelectedClass (A.erase source) center P.row.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨Finset.mem_erase.mpr
          ⟨by
            intro hzs
            subst z
            exact P.source_not_mem hz,
            P.row.support_subset_A hz⟩,
        P.row.support_eq_radius z hz⟩
  have hle := Finset.card_le_card hsubset
  simpa [P.row.support_card] using hle

/-- A deletion-critical shell admits no second K4-capable radius. -/
theorem no_distinctRadiusClass_of_blocked
    {A : Finset ℝ²} {source center : ℝ²}
    {C : CriticalSelectedFourClass A source center}
    (blocked : ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    ¬ Nonempty (CriticalShellDistinctRadiusClass C) := by
  rintro ⟨W⟩
  exact false_of_blocked_and_omissionRow blocked
    (Classical.choice (nonempty_omissionRow_of_distinctRadiusClass W))

/-- Radius-rigidity form convenient for downstream metric consumers. -/
theorem positive_fourCapableRadius_eq_shell_of_blocked
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (blocked : ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (radius : ℝ) (radius_pos : 0 < radius)
    (card_ge_four : 4 ≤ (SelectedClass A center radius).card) :
    radius = C.toCriticalFourShell.radius := by
  by_contra hne
  exact no_distinctRadiusClass_of_blocked blocked
    ⟨
      { radius := radius
        radius_pos := radius_pos
        card_ge_four := card_ge_four
        radius_ne_shell := hne }⟩

/-- The reusable packet furnished by any blocked critical shell.  It applies
unchanged after any of the four `AlignedKnownRowResidual` identifications. -/
structure CriticalShellRadiusRigidity
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center) : Prop where
  omission_iff_distinct :
    Nonempty (CriticalShellOmissionRow C) ↔
      Nonempty (CriticalShellDistinctRadiusClass C)
  no_omission : ¬ Nonempty (CriticalShellOmissionRow C)
  no_distinct_radius : ¬ Nonempty (CriticalShellDistinctRadiusClass C)
  unique_positive_four_radius :
    ∀ radius : ℝ, 0 < radius →
      4 ≤ (SelectedClass A center radius).card →
      radius = C.toCriticalFourShell.radius

/-- Package the generic equivalence and its deletion-critical consequences. -/
theorem criticalShellRadiusRigidity_of_blocked
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (blocked : ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    CriticalShellRadiusRigidity C := by
  have hnoDistinct := no_distinctRadiusClass_of_blocked (C := C) blocked
  exact
    { omission_iff_distinct :=
        criticalShellOmission_iff_distinctRadiusClass C
      no_omission := by
        rintro ⟨P⟩
        exact false_of_blocked_and_omissionRow blocked P
      no_distinct_radius := hnoDistinct
      unique_positive_four_radius :=
        positive_fourCapableRadius_eq_shell_of_blocked C blocked }

/-- Attach the generic radius-rigidity packet to the late-chosen reverse-mixed
critical shell.  This sharpens the existing five-way reduction, but it does
not eliminate any arm without a new omission/distinct-radius producer. -/
theorem nonempty_reverseMixedApexShellReduction_with_radiusRigidity
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (hnoRem : ∀ z : ℝ², ¬ IsRemovableVertex D.A z)
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    ∃ center : ℝ²,
      ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
        ∃ blocked :
            ¬ HasNEquidistantPointsAt 4
              (D.A.erase S.oppApex2) center,
          ReverseMixedApexShellReduction P Ku Kv C blocked ∧
            CriticalShellRadiusRigidity C := by
  rcases nonempty_reverseMixedApexShellReduction
      hnoRem J hxKv haKv hyKu haKu with
    ⟨center, C, blocked, reduction⟩
  exact ⟨center, C, blocked, reduction,
    criticalShellRadiusRigidity_of_blocked C blocked⟩

/-- Full-parent boundary after composing no-`IsM44`'s second-large-cap witness
with the late-installed reverse-mixed shell and its exact radius rigidity.
The two outputs remain parallel: the present bank has no theorem turning the
second cap into a distinct blocker radius or an apex-omitting blocker row. -/
theorem fullParent_installed_reverseMixedRadiusBoundary
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    {S : SurplusCapPacket D.A}
    (hS : S =
      U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
        MT hCirc CP i hM hsurplus)
    (H0 : CriticalShellSystem D.A)
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (hnoRem : ∀ z : ℝ², ¬ IsRemovableVertex D.A z)
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    (∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card) ∧
      ∃ center : ℝ²,
        ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
          ∃ blocked :
              ¬ HasNEquidistantPointsAt 4
                (D.A.erase S.oppApex2) center,
            ∃ Hfav : CriticalShellSystem D.A,
              Hfav = H0.overrideAt C blocked ∧
              Hfav.centerAt S.oppApex2
                  (Ku.support_subset_A haKu) = center ∧
              (Hfav.selectedAt S.oppApex2
                  (Ku.support_subset_A haKu)).toCriticalFourShell.support =
                C.toCriticalFourShell.support ∧
              ReverseMixedApexShellReduction P Ku Kv C blocked ∧
              CriticalShellRadiusRigidity C := by
  rcases fullParent_installed_reverseMixedApexShellReduction
      MT hCirc CP i hM hsurplus hNoM44 hS H0 hnoRem J
        hxKv haKv hyKu haKu with
    ⟨hsecond, center, C, blocked, Hfav, hHfav, hcenter,
      hsupport, reduction⟩
  exact ⟨hsecond, center, C, blocked, Hfav, hHfav, hcenter,
    hsupport, reduction, criticalShellRadiusRigidity_of_blocked C blocked⟩

#print axioms criticalShellOmission_iff_distinctRadiusClass
#print axioms false_of_blocked_and_omissionRow
#print axioms positive_fourCapableRadius_eq_shell_of_blocked
#print axioms criticalShellRadiusRigidity_of_blocked
#print axioms nonempty_reverseMixedApexShellReduction_with_radiusRigidity
#print axioms fullParent_installed_reverseMixedRadiusBoundary

end ATailReverseMixedRadiusConsumerScratch
end Problem97
