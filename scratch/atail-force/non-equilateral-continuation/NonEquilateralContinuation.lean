/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FrontierContinuationDispatcher
import ContinuationCapOrderClassifier

/-!
# Scratch: non-equilateral continuation bank interface

This file studies only the non-equilateral output of the critical-frontier
continuation dispatcher.  It keeps the original selected rows, rather than
replacing them by arbitrary trimmed witnesses from the common-deletion
packet.  Consequently the mutual center hits, equal row radius, unequal
parent radius, and second-apex omissions remain visible on the exact
q-deleted U5 rows.

The checked consequences are deliberately negative/diagnostic:

* the two original rows are exact q-deleted rows for the common deletion;
* the critical shell at that deletion supplies a genuine U5 dangerous triple;
* the original row supports overlap in at most one point; and
* one common support point in strict `oppCap1` is already impossible by the
  existing ordered-cap distance-separation theorem.

Thus a single strict-`oppCap1` common hit is a sufficient additional producer
field.  This file does not claim that the live parent hypotheses produce that
hit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailNonEquilateralContinuationScratch

open ATailContinuationGeometryClassifier
open ATailContinuationCapOrderClassifierScratch
open ATailContinuationBankMatchScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- A selected four-class avoiding `q` is already an exact q-deleted U5 row
on its original support. -/
def qDeletedRow_of_selectedFourClass
    {D : CounterexampleData} {q center : ℝ²}
    (R : SelectedFourClass D.A center)
    (hq : q ∉ R.support) :
    U5QDeletedK4Class D q center R.support where
  subset := by
    intro y hy
    have hy_center : y ≠ center := by
      intro h
      subst y
      exact R.center_not_mem hy
    have hy_q : y ≠ q := by
      intro h
      subst y
      exact hq hy
    exact Finset.mem_erase.mpr
      ⟨hy_center, Finset.mem_erase.mpr ⟨hy_q, R.support_subset_A hy⟩⟩
  card_four := by rw [R.support_card]
  q_not_mem := hq
  radius := R.radius
  radius_pos := R.radius_pos
  same_radius := R.support_eq_radius

/-- The critical shell chosen at any source is a dangerous triple after the
source point is erased.  Convex independence supplies the noncollinearity of
the three remaining shell points. -/
theorem dangerousTriple_of_criticalShellSystem
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    {q : ℝ²} (hq : q ∈ D.A) :
    U5DangerousTriple D q (H.centerAt q hq)
      ((H.selectedAt q hq).toCriticalFourShell.support.erase q) := by
  let C := (H.selectedAt q hq).toCriticalFourShell
  let T := C.support.erase q
  have hTsubsetA : T ⊆ D.A := by
    intro x hx
    exact C.support_subset_A (Finset.mem_of_mem_erase hx)
  have hTcard : T.card = 3 := by
    dsimp [T]
    rw [Finset.card_erase_of_mem C.q_mem_support, C.support_card]
  refine
    { q_mem := hq
      p_mem := (Finset.mem_erase.mp C.center_mem).2
      p_ne_q := (Finset.mem_erase.mp C.center_mem).1
      T_subset := ?_
      T_card := hTcard
      T_noncollinear := ?_
      q_radius_pos := ?_
      T_same_radius := ?_ }
  · intro x hx
    have hxT : x ∈ T := hx
    have hxC : x ∈ C.support := Finset.mem_of_mem_erase hxT
    have hxq : x ≠ q := (Finset.mem_erase.mp hxT).1
    have hxc : x ≠ H.centerAt q hq := by
      intro h
      subst x
      exact C.center_not_mem_support hxC
    exact Finset.mem_erase.mpr
      ⟨hxc, Finset.mem_erase.mpr ⟨hxq, C.support_subset_A hxC⟩⟩
  · exact
      (ConvexIndep.mono hTsubsetA D.convex).not_collinear_of_card_ge_three
        (by omega)
  · have hqRadius := C.support_eq_radius q C.q_mem_support
    linarith [C.radius_pos]
  · intro x hx
    have hxRadius := C.support_eq_radius x (Finset.mem_of_mem_erase hx)
    have hqRadius := C.support_eq_radius q C.q_mem_support
    exact hxRadius.trans hqRadius.symm

private theorem nonEquilateral_apex_not_mem_row₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    S.oppApex2 ∉ P.row₁.support := by
  rcases N.residual with ⟨_hd, _hz₂, _hz₁, _hr₁, _hr₂, hapex, _⟩
  exact hapex

private theorem nonEquilateral_apex_not_mem_row₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    S.oppApex2 ∉ P.row₂.support := by
  rcases N.residual with ⟨_hd, _hz₂, _hz₁, _hr₁, _hr₂, _hapex, hapex⟩
  exact hapex

/-- The first original continuation row, with all residual incidences still
attached to its unchanged support, is an exact q-deleted row for deletion of
the second apex. -/
def nativeQDeletedRow₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    U5QDeletedK4Class (rebasePacket D S) S.oppApex2 P.z₁
      P.row₁.support :=
  qDeletedRow_of_selectedFourClass P.row₁
    (nonEquilateral_apex_not_mem_row₁ N)

/-- The second unchanged continuation row as an exact q-deleted row. -/
def nativeQDeletedRow₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    U5QDeletedK4Class (rebasePacket D S) S.oppApex2 P.z₂
      P.row₂.support :=
  qDeletedRow_of_selectedFourClass P.row₂
    (nonEquilateral_apex_not_mem_row₂ N)

/-- Every common support point of the two non-equilateral rows lies on the
perpendicular bisector of the continuation-center chord. -/
theorem commonSupport_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) {x : ℝ²}
    (hx₁ : x ∈ P.row₁.support) (hx₂ : x ∈ P.row₂.support) :
    dist x P.z₁ = dist x P.z₂ := by
  rcases N.residual with
    ⟨_hd, _hz₂, _hz₁, hradius₁, hradius₂, _hapex₁, _hapex₂⟩
  calc
    dist x P.z₁ = dist P.z₁ x := dist_comm _ _
    _ = P.row₁.radius := P.row₁.support_eq_radius x hx₁
    _ = dist P.z₁ P.z₂ := hradius₁
    _ = P.row₂.radius := hradius₂.symm
    _ = dist P.z₂ x := (P.row₂.support_eq_radius x hx₂).symm
    _ = dist x P.z₂ := dist_comm _ _

/-- The original row supports overlap in at most one point.  The parent apex
is already one carrier point on the `z₁,z₂` perpendicular bisector; two common
row points would make three, contradicting Dumitrescu L1. -/
theorem nativeRow_inter_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    (P.row₁.support ∩ P.row₂.support).card ≤ 1 := by
  classical
  rcases N.commonDeletion with ⟨C⟩
  rw [Finset.card_le_one]
  intro a ha b hb
  by_contra hab
  have ha₁ := (Finset.mem_inter.mp ha).1
  have ha₂ := (Finset.mem_inter.mp ha).2
  have hb₁ := (Finset.mem_inter.mp hb).1
  have hb₂ := (Finset.mem_inter.mp hb).2
  have hapexEq : dist S.oppApex2 P.z₁ = dist S.oppApex2 P.z₂ :=
    by simpa only [dist_comm] using P.apex_equidistant
  have haEq : dist a P.z₁ = dist a P.z₂ :=
    commonSupport_equidistant N ha₁ ha₂
  have hbEq : dist b P.z₁ = dist b P.z₂ :=
    commonSupport_equidistant N hb₁ hb₂
  have hapex_ne_a : S.oppApex2 ≠ a := by
    intro h
    subst a
    exact nonEquilateral_apex_not_mem_row₁ N ha₁
  have hapex_ne_b : S.oppApex2 ≠ b := by
    intro h
    subst b
    exact nonEquilateral_apex_not_mem_row₁ N hb₁
  have hbound := Dumitrescu.perpBisector_apex_bound
    (rebasePacket D S).convex P.z₁_mem_A P.z₂_mem_A P.z₁_ne_z₂
  have hapexFilter :
      S.oppApex2 ∈ (rebasePacket D S).A.filter
        (fun z => dist z P.z₁ = dist z P.z₂) :=
    Finset.mem_filter.mpr ⟨C.q_mem_A, hapexEq⟩
  have haFilter :
      a ∈ (rebasePacket D S).A.filter
        (fun z => dist z P.z₁ = dist z P.z₂) :=
    Finset.mem_filter.mpr ⟨P.row₁.support_subset_A ha₁, haEq⟩
  have hbFilter :
      b ∈ (rebasePacket D S).A.filter
        (fun z => dist z P.z₁ = dist z P.z₂) :=
    Finset.mem_filter.mpr ⟨P.row₁.support_subset_A hb₁, hbEq⟩
  have hthree :
      2 < ((rebasePacket D S).A.filter
        (fun z => dist z P.z₁ = dist z P.z₂)).card := by
    rw [Finset.two_lt_card]
    exact ⟨S.oppApex2, hapexFilter, a, haFilter, b, hbFilter,
      hapex_ne_a, hapex_ne_b, hab⟩
  omega

/-- Bank-facing normalization retaining the original rows and the actual
critical-shell dangerous triple at the common deletion. -/
structure NonEquilateralBankInterface
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Type where
  residual : NonEquilateralResidual P
  commonDeletion : Nonempty (CommonDeletionTwoCenterPacket
    (rebasePacket D S) H S.oppApex2 P.z₁ P.z₂)
  nativeRow₁ : U5QDeletedK4Class (rebasePacket D S)
    S.oppApex2 P.z₁ P.row₁.support
  nativeRow₂ : U5QDeletedK4Class (rebasePacket D S)
    S.oppApex2 P.z₂ P.row₂.support
  blockerTriple : U5DangerousTriple (rebasePacket D S) S.oppApex2
    (H.centerAt S.oppApex2 commonDeletion.some.q_mem_A)
    ((H.selectedAt S.oppApex2
      commonDeletion.some.q_mem_A).toCriticalFourShell.support.erase
        S.oppApex2)
  nativeOverlapLeOne : (P.row₁.support ∩ P.row₂.support).card ≤ 1

/-- Construct the exact bank interface without changing either selected row. -/
theorem nonempty_nonEquilateralBankInterface
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    Nonempty (NonEquilateralBankInterface H P) := by
  let C := N.commonDeletion.some
  exact ⟨
    { residual := N.residual
      commonDeletion := N.commonDeletion
      nativeRow₁ := nativeQDeletedRow₁ N
      nativeRow₂ := nativeQDeletedRow₂ N
      blockerTriple := dangerousTriple_of_criticalShellSystem
        (rebasePacket D S) H C.q_mem_A
      nativeOverlapLeOne := nativeRow_inter_card_le_one N }⟩

/-- The weakest producer-friendly ordered-cap terminal found in the current
bank: one strict-`oppCap1` point common to the two unchanged row supports. -/
def StrictOppCap1CommonHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  ∃ x : ℝ²,
    x ∈ P.row₁.support ∧
      x ∈ P.row₂.support ∧
      x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)

/-- A single common hit in strict `oppCap1` closes the non-equilateral arm.
The cap-order theorem says that such a point must distinguish `z₁,z₂` by
distance, while common row membership and the retained equal row radii say
that it is equidistant from them. -/
theorem false_of_nonEquilateral_of_strictOppCap1CommonHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (hit : StrictOppCap1CommonHit P) : False := by
  rcases hit with ⟨x, hx₁, hx₂, hxStrict⟩
  have hsep : dist x P.z₁ ≠ dist x P.z₂ := by
    simpa only [dist_comm] using
      firstCap_center_separates_secondApex_pair
        (rebasePacket D S) K P.z₁_mem P.z₂_mem P.z₁_ne_z₂ hxStrict
  exact hsep (commonSupport_equidistant N hx₁ hx₂)

#print axioms qDeletedRow_of_selectedFourClass
#print axioms dangerousTriple_of_criticalShellSystem
#print axioms nativeQDeletedRow₁
#print axioms nativeQDeletedRow₂
#print axioms commonSupport_equidistant
#print axioms nativeRow_inter_card_le_one
#print axioms nonempty_nonEquilateralBankInterface
#print axioms false_of_nonEquilateral_of_strictOppCap1CommonHit

end ATailNonEquilateralContinuationScratch
end Problem97
