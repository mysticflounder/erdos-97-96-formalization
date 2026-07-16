/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2LiveHeavyPlacementAudit
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Scratch: F2 live-heavy match against the named U5 bank

This file packages the strongest direct U5 view of the exact F2 live-heavy
packet.  Choosing one strict live witness as the deleted point turns both the
live row and the second-apex row into q-critical triple classes.  Their
surviving supports intersect in exactly one point.

Thus the packet saturates the ordinary two-circle intersection pattern.  It
does not supply the extra center incidence or third common point required by
`U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility` or
`U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2U5BankMatchScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailCriticalShellDangerousTripleScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2LiveHeavyPlacementScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- The exact direct U5 payload extracted from the F2 live-heavy arm.

The first q-critical class is centered at the live dangerous center `p`, and
the second is centered at `oppApex2`.  The canonical dangerous triple at the
chosen source is also centered at `p`; consequently this first q-critical
class is not one of the triple-centered classes required by the named U5 pair
incompatibilities. -/
structure LiveWitnessQCriticalPairAudit
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2) where
  x : ℝ²
  w : ℝ²
  x_ne_w : x ≠ w
  x_mem_dangerous_triple : x ∈ ({t1, t2, t3} : Finset ℝ²)
  w_mem_dangerous_triple : w ∈ ({t1, t2, t3} : Finset ℝ²)
  x_mem_second_row : x ∈ C.B₂
  w_mem_second_row : w ∈ C.B₂
  x_mem_strict_second_cap : x ∈ strictSecondCap S
  w_mem_strict_second_cap : w ∈ strictSecondCap S
  canonical_dangerous :
    U5DangerousTriple D x p
      (({q, t1, t2, t3} : Finset ℝ²).erase x)
  first_qcritical :
    Nonempty (U5QCriticalTripleClass D x p (C.B₁.erase x))
  second_qcritical :
    Nonempty
      (U5QCriticalTripleClass D x S.oppApex2 (C.B₂.erase x))
  row_inter_card_eq_two :
    (C.B₁ ∩ C.B₂).card = 2
  surviving_inter_card_eq_one :
    ((C.B₁.erase x) ∩ (C.B₂.erase x)).card = 1
  dangerous_center_not_mem_triple :
    p ∉ ({q, t1, t2, t3} : Finset ℝ²).erase x
  dangerous_center_not_mem_first_qcritical :
    p ∉ C.B₁.erase x

/-- Extract the exact direct U5 payload from two strict live-only witnesses.

The two q-critical classes share the implicit deleted point `x` and exactly
one surviving point `w`.  This is the sharp two-common-point geometry allowed
for distinct circles, rather than an instance of a banked incompatibility. -/
theorem nonempty_liveWitnessQCriticalPairAudit
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (hqSurplus : q ∈ S.surplusCap)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    Nonempty (LiveWitnessQCriticalPairAudit S W C) := by
  have hone :
      1 < (liveOnlyCell C.B₂ ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  have hxLiveOnly :=
    Finset.mem_inter.mp hx |>.1 |> Finset.mem_sdiff.mp
  have hwLiveOnly :=
    Finset.mem_inter.mp hw |>.1 |> Finset.mem_sdiff.mp
  have hxB₂ : x ∈ C.B₂ :=
    (Finset.mem_inter.mp hxLiveOnly.1).1
  have hwB₂ : w ∈ C.B₂ :=
    (Finset.mem_inter.mp hwLiveOnly.1).1
  have hxLive : x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp hxLiveOnly.1).2
  have hwLive : w ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (Finset.mem_inter.mp hwLiveOnly.1).2
  have hxStrict : x ∈ strictSecondCap S :=
    (Finset.mem_inter.mp hx).2
  have hwStrict : w ∈ strictSecondCap S :=
    (Finset.mem_inter.mp hw).2
  have hx_ne_q : x ≠ q := by
    intro hxq
    subst x
    exact (Finset.mem_sdiff.mp hxStrict).2
      (Finset.mem_union.mpr (Or.inl hqSurplus))
  have hw_ne_q : w ≠ q := by
    intro hwq
    subst w
    exact (Finset.mem_sdiff.mp hwStrict).2
      (Finset.mem_union.mpr (Or.inl hqSurplus))
  have hxTriple : x ∈ ({t1, t2, t3} : Finset ℝ²) := by
    rcases Finset.mem_insert.mp hxLive with hxq | hxTriple
    · exact False.elim (hx_ne_q hxq)
    · exact hxTriple
  have hwTriple : w ∈ ({t1, t2, t3} : Finset ℝ²) := by
    rcases Finset.mem_insert.mp hwLive with hwq | hwTriple
    · exact False.elim (hw_ne_q hwq)
    · exact hwTriple
  have hrow :
      C.B₁ = ({q, t1, t2, t3} : Finset ℝ²) :=
    commonDeletion_firstRow_eq_liveBase C
  have hxB₁ : x ∈ C.B₁ := by
    rw [hrow]
    exact hxLive
  have hwB₁ : w ∈ C.B₁ := by
    rw [hrow]
    exact hwLive
  have hxA : x ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₂.subset hxB₂)).2).2
  have hcenter : W.H.centerAt x hxA = p :=
    (W.centerAt_eq_p_iff x hxA).2 hxLive
  have hselected :
      (W.H.selectedAt x hxA).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) :=
    W.selectedAt_support x hxA hxLive
  have hdanger :
      U5DangerousTriple D x p
        (({q, t1, t2, t3} : Finset ℝ²).erase x) := by
    simpa [hcenter, hselected] using
      dangerousTriple_of_criticalShellSystem D W.H hxA
  have hfirst :
      Nonempty (U5QCriticalTripleClass D x p (C.B₁.erase x)) :=
    U5QAllowedK4Class.qCriticalTriple_of_mem_q
      C.row₁.toQAllowedK4Class C.B₁_card hxB₁
  have hsecond :
      Nonempty
        (U5QCriticalTripleClass D x S.oppApex2 (C.B₂.erase x)) :=
    U5QAllowedK4Class.qCriticalTriple_of_mem_q
      C.row₂.toQAllowedK4Class C.B₂_card hxB₂
  have hinter :
      (C.B₁ ∩ C.B₂).card = 2 := by
    rw [hrow]
    simpa [Finset.inter_comm] using F2.failure.inter_live_card
  have hxInter : x ∈ C.B₁ ∩ C.B₂ :=
    Finset.mem_inter.mpr ⟨hxB₁, hxB₂⟩
  have herase :
      (C.B₁.erase x) ∩ (C.B₂.erase x) =
        (C.B₁ ∩ C.B₂).erase x := by
    ext z
    simp only [Finset.mem_inter, Finset.mem_erase]
    tauto
  have herasedInter :
      ((C.B₁.erase x) ∩ (C.B₂.erase x)).card = 1 := by
    rw [herase, Finset.card_erase_of_mem hxInter, hinter]
  have hpNotTriple :
      p ∉ ({q, t1, t2, t3} : Finset ℝ²).erase x := by
    intro hp
    exact (Finset.mem_erase.mp (hdanger.T_subset hp)).1 rfl
  have hpNotFirst : p ∉ C.B₁.erase x := by
    intro hp
    have hpB₁ : p ∈ C.B₁ := (Finset.mem_erase.mp hp).2
    exact (Finset.mem_erase.mp (C.row₁.subset hpB₁)).1 rfl
  exact ⟨{
    x := x
    w := w
    x_ne_w := hxw
    x_mem_dangerous_triple := hxTriple
    w_mem_dangerous_triple := hwTriple
    x_mem_second_row := hxB₂
    w_mem_second_row := hwB₂
    x_mem_strict_second_cap := hxStrict
    w_mem_strict_second_cap := hwStrict
    canonical_dangerous := hdanger
    first_qcritical := hfirst
    second_qcritical := hsecond
    row_inter_card_eq_two := hinter
    surviving_inter_card_eq_one := herasedInter
    dangerous_center_not_mem_triple := hpNotTriple
    dangerous_center_not_mem_first_qcritical := hpNotFirst
  }⟩

/-- The canonical F2 extraction fails the two role fields common to both named
two-q-critical U5 incompatibilities: the first q-critical center is the
dangerous center itself, so it is neither a dangerous-triple point nor a
member of its own q-critical support. -/
theorem liveWitnessQCriticalPair_fails_named_U5_center_roles
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (A : LiveWitnessQCriticalPairAudit S W C) :
    p ∉ ({q, t1, t2, t3} : Finset ℝ²).erase A.x ∧
      p ∉ C.B₁.erase A.x :=
  ⟨A.dangerous_center_not_mem_triple,
    A.dangerous_center_not_mem_first_qcritical⟩

#print axioms nonempty_liveWitnessQCriticalPairAudit
#print axioms liveWitnessQCriticalPair_fails_named_U5_center_roles

end ATailRF2U5BankMatchScratch
end Problem97
