/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber

/-!
# Source-clean two-row six-point ingress

Two exact selected four-rows with a prescribed two-point intersection have two
fresh witnesses on each side.  The role-level six-point conclusion chooses
those witnesses away from the opposite centers inside the two-element
symmetric differences.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.GeneralCarrierBridge
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailBlockerMultiplicityGeometry
open TwoSourceExactCollisionRowsTerminal

attribute [local instance] Classical.propDecidable

theorem selectedFourClass_twoRow_sdiff_card_eq_two
    {A : Finset ℝ²} {B F : ℝ²}
    (KB : SelectedFourClass A B) (KF : SelectedFourClass A F)
    {a d : ℝ²} (had : a ≠ d)
    (hinter : KB.support ∩ KF.support = {a, d}) :
    (KB.support \ KF.support).card = 2 ∧
      (KF.support \ KB.support).card = 2 := by
  have hpair : ({a, d} : Finset ℝ²).card = 2 := by
    simp [had]
  have hinter_card : (KB.support ∩ KF.support).card = 2 := by
    rw [hinter, hpair]
  have hsumB := Finset.card_inter_add_card_sdiff KB.support KF.support
  have hsumF := Finset.card_inter_add_card_sdiff KF.support KB.support
  have hinter_card' : (KF.support ∩ KB.support).card = 2 := by
    rw [Finset.inter_comm, hinter_card]
  rw [KB.support_card, hinter_card] at hsumB
  rw [KF.support_card, hinter_card'] at hsumF
  constructor <;> omega

/-- The two row supports have exactly six points, with one fresh witness on
each side of their prescribed shared pair.  This support-level statement does
not need convexity: it is a finite incidence consequence of the two exact
four-cardinalities and the exact pair intersection. -/
theorem selectedFourClass_twoRow_support_six_point_ingress
    {A : Finset ℝ²} {B F : ℝ²}
    (KB : SelectedFourClass A B) (KF : SelectedFourClass A F)
    {a d : ℝ²} (had : a ≠ d)
    (haB : a ∈ KB.support) (hdB : d ∈ KB.support)
    (haF : a ∈ KF.support) (hdF : d ∈ KF.support)
    (hinter : KB.support ∩ KF.support = {a, d}) :
    ∃ C E,
      C ∈ KB.support ∧ C ∉ KF.support ∧
        E ∈ KF.support ∧ E ∉ KB.support ∧
        (KB.support ∪ KF.support).card = 6 ∧
        dist B a = dist B C ∧ dist B a = dist B d ∧
        dist F a = dist F d ∧ dist F a = dist F E := by
  classical
  have hcards := selectedFourClass_twoRow_sdiff_card_eq_two KB KF had hinter
  have hBnonempty : (KB.support \ KF.support).Nonempty := by
    rw [← Finset.card_pos, hcards.1]
    norm_num
  have hFnonempty : (KF.support \ KB.support).Nonempty := by
    rw [← Finset.card_pos, hcards.2]
    norm_num
  rcases hBnonempty with ⟨C, hC⟩
  rcases hFnonempty with ⟨E, hE⟩
  have hCmemB : C ∈ KB.support := (Finset.mem_sdiff.mp hC).1
  have hCnotF : C ∉ KF.support := (Finset.mem_sdiff.mp hC).2
  have hEmemF : E ∈ KF.support := (Finset.mem_sdiff.mp hE).1
  have hEnotB : E ∉ KB.support := (Finset.mem_sdiff.mp hE).2
  have hinter_card : (KB.support ∩ KF.support).card = 2 := by
    rw [hinter]
    simp [had]
  have hunion_card : (KB.support ∪ KF.support).card = 6 := by
    have hsum := Finset.card_union_add_card_inter KB.support KF.support
    rw [KB.support_card, KF.support_card, hinter_card] at hsum
    omega
  refine ⟨C, E, hCmemB, hCnotF, hEmemF, hEnotB, hunion_card, ?_, ?_, ?_, ?_⟩
  · exact (KB.support_eq_radius a haB).trans
      (KB.support_eq_radius C hCmemB).symm
  · exact (KB.support_eq_radius a haB).trans
      (KB.support_eq_radius d hdB).symm
  · exact (KF.support_eq_radius a haF).trans
      (KF.support_eq_radius d hdF).symm
  · exact (KF.support_eq_radius a haF).trans
      (KF.support_eq_radius E hEmemF).symm

/-- Two selected four-rows expose six pairwise-distinct roles
`a,B,C,d,E,F`.  Each remainder is chosen from a two-element symmetric
difference away from the opposite center.  The returned `Finset` card is the
compact pairwise-distinctness certificate used by downstream ingress. -/
theorem selectedFourClass_twoRow_six_point_ingress
    {A : Finset ℝ²} {B F : ℝ²}
    (KB : SelectedFourClass A B) (KF : SelectedFourClass A F)
    (hBF : B ≠ F) {a d : ℝ²} (had : a ≠ d)
    (haB : a ∈ KB.support) (hdB : d ∈ KB.support)
    (haF : a ∈ KF.support) (hdF : d ∈ KF.support)
    (hinter : KB.support ∩ KF.support = {a, d}) :
      ∃ C E,
      C ∈ KB.support ∧ C ∉ KF.support ∧
        E ∈ KF.support ∧ E ∉ KB.support ∧
        ({a, B, C, d, E, F} : Finset ℝ²).card = 6 ∧
        dist B a = dist B C ∧ dist B a = dist B d ∧
        dist F a = dist F d ∧ dist F a = dist F E := by
  classical
  have exists_mem_ne_of_card_eq_two :
      ∀ (s : Finset ℝ²) (p : ℝ²), s.card = 2 →
        ∃ x, x ∈ s ∧ x ≠ p := by
    intro s p hs
    have htwo : 1 < s.card := by omega
    rcases Finset.one_lt_card.mp htwo with ⟨x, hx, y, hy, hxy⟩
    by_cases hxp : x = p
    · refine ⟨y, hy, ?_⟩
      intro hyp
      exact hxy (hxp.trans hyp.symm)
    · exact ⟨x, hx, hxp⟩
  have hcards := selectedFourClass_twoRow_sdiff_card_eq_two KB KF had hinter
  rcases exists_mem_ne_of_card_eq_two (KB.support \ KF.support) F hcards.1 with
    ⟨C, hC, hCF⟩
  rcases exists_mem_ne_of_card_eq_two (KF.support \ KB.support) B hcards.2 with
    ⟨E, hE, hEB⟩
  have hCmemB : C ∈ KB.support := (Finset.mem_sdiff.mp hC).1
  have hCnotF : C ∉ KF.support := (Finset.mem_sdiff.mp hC).2
  have hEmemF : E ∈ KF.support := (Finset.mem_sdiff.mp hE).1
  have hEnotB : E ∉ KB.support := (Finset.mem_sdiff.mp hE).2
  have hBaC : dist B a = dist B C :=
    (KB.support_eq_radius a haB).trans (KB.support_eq_radius C hCmemB).symm
  have hBaD : dist B a = dist B d :=
    (KB.support_eq_radius a haB).trans (KB.support_eq_radius d hdB).symm
  have hFaD : dist F a = dist F d :=
    (KF.support_eq_radius a haF).trans (KF.support_eq_radius d hdF).symm
  have hFaE : dist F a = dist F E :=
    (KF.support_eq_radius a haF).trans (KF.support_eq_radius E hEmemF).symm
  have hab : a ≠ B := by
    intro h
    exact KB.center_not_mem (h ▸ haB)
  have hdb : d ≠ B := by
    intro h
    exact KB.center_not_mem (h ▸ hdB)
  have hcb : C ≠ B := by
    intro h
    exact KB.center_not_mem (h ▸ hCmemB)
  have haf : a ≠ F := by
    intro h
    exact KF.center_not_mem (h ▸ haF)
  have hdf : d ≠ F := by
    intro h
    exact KF.center_not_mem (h ▸ hdF)
  have hef : E ≠ F := by
    intro h
    exact KF.center_not_mem (h ▸ hEmemF)
  have hac : a ≠ C := by
    intro h
    exact hCnotF (h ▸ haF)
  have hdc : d ≠ C := by
    intro h
    exact hCnotF (h ▸ hdF)
  have hae : a ≠ E := by
    intro h
    exact hEnotB (h ▸ haB)
  have hde : d ≠ E := by
    intro h
    exact hEnotB (h ▸ hdB)
  have hbe : B ≠ E := hEB.symm
  have hcf : C ≠ F := hCF
  have hce : C ≠ E := by
    intro h
    exact hCnotF (h ▸ hEmemF)
  have hBc : B ≠ C := hcb.symm
  have hBd : B ≠ d := hdb.symm
  have hCd : C ≠ d := hdc.symm
  refine ⟨C, E, hCmemB, hCnotF, hEmemF, hEnotB, ?_, hBaC, hBaD, hFaD, hFaE⟩
  have ha_not_mem : a ∉ ({B, C, d, E, F} : Finset ℝ²) := by
    simp [hab, hac, had, hae, haf]
  have hB_not_mem : B ∉ ({C, d, E, F} : Finset ℝ²) := by
    simp [hBc, hBd, hbe, hBF]
  have hC_not_mem : C ∉ ({d, E, F} : Finset ℝ²) := by
    simp [hCd, hce, hcf]
  have hd_not_mem : d ∉ ({E, F} : Finset ℝ²) := by
    simp [hde, hdf]
  have hE_not_mem : E ∉ ({F} : Finset ℝ²) := by
    simp [hef]
  rw [Finset.card_insert_of_notMem ha_not_mem,
    Finset.card_insert_of_notMem hB_not_mem,
    Finset.card_insert_of_notMem hC_not_mem,
    Finset.card_insert_of_notMem hd_not_mem,
    Finset.card_insert_of_notMem hE_not_mem]
  simp

/-- A prescribed left-row remainder either coincides with the opposite row
center, or it can be used as the left fresh role in the six-point packet.
This is the form needed when the prescribed remainder has independent cap
placement data. -/
theorem selectedFourClass_twoRow_six_point_ingress_of_left_remainder
    {A : Finset ℝ²} {B C F : ℝ²}
    (KB : SelectedFourClass A B) (KF : SelectedFourClass A F)
    (hBF : B ≠ F) {a d : ℝ²} (had : a ≠ d)
    (haB : a ∈ KB.support) (hdB : d ∈ KB.support)
    (haF : a ∈ KF.support) (hdF : d ∈ KF.support)
    (hinter : KB.support ∩ KF.support = {a, d})
    (hCmemB : C ∈ KB.support) (hCnotF : C ∉ KF.support) :
    C = F ∨
      ∃ E,
        E ∈ KF.support ∧ E ∉ KB.support ∧
          ({a, B, C, d, E, F} : Finset ℝ²).card = 6 ∧
          dist B a = dist B C ∧ dist B a = dist B d ∧
          dist F a = dist F d ∧ dist F a = dist F E := by
  classical
  by_cases hCF : C = F
  · exact Or.inl hCF
  · have hcards := selectedFourClass_twoRow_sdiff_card_eq_two KB KF had hinter
    have hFdiff : 1 < (KF.support \ KB.support).card := by omega
    rcases Finset.one_lt_card.mp hFdiff with ⟨E, hE, E', hE', hEE'⟩
    have hEB_or : E ≠ B ∨ E' ≠ B := by
      by_contra h
      push_neg at h
      exact hEE' (h.1.trans h.2.symm)
    rcases hEB_or with hEB | hE'B
    · have hEmemF := (Finset.mem_sdiff.mp hE).1
      have hEnotB := (Finset.mem_sdiff.mp hE).2
      refine Or.inr ⟨E, hEmemF, hEnotB, ?_, ?_, ?_, ?_, ?_⟩
      · have hab : a ≠ B := fun h => KB.center_not_mem (h ▸ haB)
        have hdb : d ≠ B := fun h => KB.center_not_mem (h ▸ hdB)
        have hcb : C ≠ B := fun h => KB.center_not_mem (h ▸ hCmemB)
        have haf : a ≠ F := fun h => KF.center_not_mem (h ▸ haF)
        have hdf : d ≠ F := fun h => KF.center_not_mem (h ▸ hdF)
        have hef : E ≠ F := fun h => KF.center_not_mem (h ▸ hEmemF)
        have hac : a ≠ C := fun h => hCnotF (h ▸ haF)
        have hdc : d ≠ C := fun h => hCnotF (h ▸ hdF)
        have hae : a ≠ E := fun h => hEnotB (h ▸ haB)
        have hde : d ≠ E := fun h => hEnotB (h ▸ hdB)
        have hce : C ≠ E := fun h => hCnotF (h ▸ hEmemF)
        have ha_not_mem : a ∉ ({B, C, d, E, F} : Finset ℝ²) := by
          simp [hab, hac, had, hae, haf]
        have hB_not_mem : B ∉ ({C, d, E, F} : Finset ℝ²) := by
          simp [hcb.symm, hdb.symm, hEB.symm, hBF]
        have hC_not_mem : C ∉ ({d, E, F} : Finset ℝ²) := by
          simp [hdc.symm, hce, hCF]
        have hd_not_mem : d ∉ ({E, F} : Finset ℝ²) := by
          simp [hde, hdf]
        have hE_not_mem : E ∉ ({F} : Finset ℝ²) := by
          simp [hef]
        rw [Finset.card_insert_of_notMem ha_not_mem,
          Finset.card_insert_of_notMem hB_not_mem,
          Finset.card_insert_of_notMem hC_not_mem,
          Finset.card_insert_of_notMem hd_not_mem,
          Finset.card_insert_of_notMem hE_not_mem]
        simp
      · exact (KB.support_eq_radius a haB).trans
          (KB.support_eq_radius C hCmemB).symm
      · exact (KB.support_eq_radius a haB).trans
          (KB.support_eq_radius d hdB).symm
      · exact (KF.support_eq_radius a haF).trans
          (KF.support_eq_radius d hdF).symm
      · exact (KF.support_eq_radius a haF).trans
          (KF.support_eq_radius E hEmemF).symm
    · have hE'memF := (Finset.mem_sdiff.mp hE').1
      have hE'notB := (Finset.mem_sdiff.mp hE').2
      refine Or.inr ⟨E', hE'memF, hE'notB, ?_, ?_, ?_, ?_, ?_⟩
      · have hab : a ≠ B := fun h => KB.center_not_mem (h ▸ haB)
        have hdb : d ≠ B := fun h => KB.center_not_mem (h ▸ hdB)
        have hcb : C ≠ B := fun h => KB.center_not_mem (h ▸ hCmemB)
        have haf : a ≠ F := fun h => KF.center_not_mem (h ▸ haF)
        have hdf : d ≠ F := fun h => KF.center_not_mem (h ▸ hdF)
        have he'f : E' ≠ F := fun h => KF.center_not_mem (h ▸ hE'memF)
        have hac : a ≠ C := fun h => hCnotF (h ▸ haF)
        have hdc : d ≠ C := fun h => hCnotF (h ▸ hdF)
        have hae' : a ≠ E' := fun h => hE'notB (h ▸ haB)
        have hde' : d ≠ E' := fun h => hE'notB (h ▸ hdB)
        have hce' : C ≠ E' := fun h => hCnotF (h ▸ hE'memF)
        have ha_not_mem : a ∉ ({B, C, d, E', F} : Finset ℝ²) := by
          simp [hab, hac, had, hae', haf]
        have hB_not_mem : B ∉ ({C, d, E', F} : Finset ℝ²) := by
          simp [hcb.symm, hdb.symm, hE'B.symm, hBF]
        have hC_not_mem : C ∉ ({d, E', F} : Finset ℝ²) := by
          simp [hdc.symm, hce', hCF]
        have hd_not_mem : d ∉ ({E', F} : Finset ℝ²) := by
          simp [hde', hdf]
        have hE'_not_mem : E' ∉ ({F} : Finset ℝ²) := by
          simp [he'f]
        rw [Finset.card_insert_of_notMem ha_not_mem,
          Finset.card_insert_of_notMem hB_not_mem,
          Finset.card_insert_of_notMem hC_not_mem,
          Finset.card_insert_of_notMem hd_not_mem,
          Finset.card_insert_of_notMem hE'_not_mem]
        simp
      · exact (KB.support_eq_radius a haB).trans
          (KB.support_eq_radius C hCmemB).symm
      · exact (KB.support_eq_radius a haB).trans
          (KB.support_eq_radius d hdB).symm
      · exact (KF.support_eq_radius a haF).trans
          (KF.support_eq_radius d hdF).symm
      · exact (KF.support_eq_radius a haF).trans
          (KF.support_eq_radius E' hE'memF).symm

section FreshThirdSourceAdapter

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- The raw geometric fields of either `FreshThirdCapSourceInteraction`
constructor feed the generic two-row support ingress.  This adapter stays on
the base `TwoCapSourceThirdCanonicalRowSurface` and `FreshThirdBlockerFiber`
interfaces; it deliberately does not consume the retained/common-radius
dichotomy or any residual consumer. -/
theorem freshThird_secondSource_six_point_support_ingress_of_geometric_data
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.secondSource.1 C.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    ∃ X Y,
      X ∈ (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support ∧
        X ∉ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
        Y ∈ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
        Y ∉ (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support ∧
        ({Q.source₁.1, H.centerAt C.secondSource.1 C.secondSource.2, X,
            Q.source₂.1, Y, H.centerAt Q.source₁.1 Q.source₁.2} : Finset ℝ²).card = 6 ∧
        dist (H.centerAt C.secondSource.1 C.secondSource.2) Q.source₁.1 =
          dist (H.centerAt C.secondSource.1 C.secondSource.2) X ∧
        dist (H.centerAt C.secondSource.1 C.secondSource.2) Q.source₁.1 =
          dist (H.centerAt C.secondSource.1 C.secondSource.2) Q.source₂.1 ∧
        dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₁.1 =
          dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₂.1 ∧
        dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₁.1 =
          dist (H.centerAt Q.source₁.1 Q.source₁.2) Y := by
  let KB : SelectedFourClass D.A
      (H.centerAt C.secondSource.1 C.secondSource.2) :=
    (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.toSelectedFourClass
  let KF : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hsource₁_mem : Q.source₁.1 ∈ KB.support := by
    simpa [KB] using source₁_mem
  have hsource₂_mem : Q.source₂.1 ∈ KB.support := by
    simpa [KB] using source₂_mem
  have hQsource₁_mem : Q.source₁.1 ∈ KF.support := by
    simpa [KF] using
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support
  have hQsource₂_mem : Q.source₂.1 ∈ KF.support := by
    simpa [KF] using Q.source₂_mem_source₁_shell
  have hpoints_ne : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hinter : KB.support ∩ KF.support = {Q.source₁.1, Q.source₂.1} := by
    simpa [KB, KF] using overlap_eq
  rcases selectedFourClass_twoRow_six_point_ingress
      KB KF centers_ne hpoints_ne hsource₁_mem hsource₂_mem hQsource₁_mem
        hQsource₂_mem hinter with
    ⟨X, Y, hXKB, hXnotKF, hYKF, hYnotKB, hroles, hBX, hBX₂, hFY₂, hFY⟩
  exact ⟨X, Y, by simpa [KB] using hXKB, by simpa [KF] using hXnotKF,
    by simpa [KF] using hYKF, by simpa [KB] using hYnotKB,
    by simpa [KB, KF] using hroles,
    hBX, hBX₂, hFY₂, hFY⟩

/-- The second canonical cap source is a prescribed remainder of its own
selected row unless it is exactly the opposite row center.  In the proper
remainder arm this retains the source's first-cap placement, eliminating one
existential role from the six-point ingress.  The center-equality arm is kept
explicit: current source interfaces do not rule it out. -/
theorem freshThird_secondSource_prescribed_remainder_ingress_of_geometric_data
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.secondSource.1 C.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    C.secondSource.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
      (C.secondSource.1 = H.centerAt Q.source₁.1 Q.source₁.2 ∨
        ∃ Y,
          Y ∈ (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
            Y ∉
              (H.selectedAt C.secondSource.1
                C.secondSource.2).toCriticalFourShell.support ∧
            ({Q.source₁.1, H.centerAt C.secondSource.1 C.secondSource.2,
                C.secondSource.1, Q.source₂.1, Y,
                H.centerAt Q.source₁.1 Q.source₁.2} : Finset ℝ²).card = 6 ∧
            dist (H.centerAt C.secondSource.1 C.secondSource.2) Q.source₁.1 =
              dist (H.centerAt C.secondSource.1 C.secondSource.2) C.secondSource.1 ∧
            dist (H.centerAt C.secondSource.1 C.secondSource.2) Q.source₁.1 =
              dist (H.centerAt C.secondSource.1 C.secondSource.2) Q.source₂.1 ∧
            dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₁.1 =
              dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₂.1 ∧
            dist (H.centerAt Q.source₁.1 Q.source₁.2) Q.source₁.1 =
              dist (H.centerAt Q.source₁.1 Q.source₁.2) Y) := by
  classical
  let KB : SelectedFourClass D.A
      (H.centerAt C.secondSource.1 C.secondSource.2) :=
    (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.toSelectedFourClass
  let KF : SelectedFourClass D.A
      (H.centerAt Q.source₁.1 Q.source₁.2) :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hsource₁_mem : Q.source₁.1 ∈ KB.support := by
    simpa [KB] using source₁_mem
  have hsource₂_mem : Q.source₂.1 ∈ KB.support := by
    simpa [KB] using source₂_mem
  have hQsource₁_mem : Q.source₁.1 ∈ KF.support := by
    simpa [KF] using
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.q_mem_support
  have hQsource₂_mem : Q.source₂.1 ∈ KF.support := by
    simpa [KF] using Q.source₂_mem_source₁_shell
  have hpoints_ne : Q.source₁.1 ≠ Q.source₂.1 := by
    intro h
    exact Q.sources_ne (Subtype.ext h)
  have hinter : KB.support ∩ KF.support = {Q.source₁.1, Q.source₂.1} := by
    simpa [KB, KF] using overlap_eq
  have hCmemB : C.secondSource.1 ∈ KB.support := by
    simpa [KB] using
      (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.q_mem_support
  have hC_ne_source₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro h
    apply centers_ne
    simp [h]
  have hQcenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 := by
    exact congrArg Subtype.val Q.blockers_eq
  have hC_ne_source₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro h
    apply centers_ne
    calc
      H.centerAt C.secondSource.1 C.secondSource.2 =
          H.centerAt Q.source₂.1 Q.source₂.2 := by simp [h]
      _ = H.centerAt Q.source₁.1 Q.source₁.2 := hQcenters.symm
  have hCnotF : C.secondSource.1 ∉ KF.support := by
    intro hCmemF
    have hCinter : C.secondSource.1 ∈ KB.support ∩ KF.support :=
      Finset.mem_inter.mpr ⟨hCmemB, hCmemF⟩
    rw [hinter] at hCinter
    rcases Finset.mem_insert.mp hCinter with h | h
    · exact hC_ne_source₁ h
    · exact hC_ne_source₂ (Finset.mem_singleton.mp h)
  refine ⟨C.secondSource_data.2.1, ?_⟩
  rcases selectedFourClass_twoRow_six_point_ingress_of_left_remainder
      KB KF centers_ne hpoints_ne hsource₁_mem hsource₂_mem hQsource₁_mem
        hQsource₂_mem hinter hCmemB hCnotF with hcenter | hpacket
  · exact Or.inl hcenter
  · rcases hpacket with ⟨Y, hYF, hYnotB, hcard, hBX, hBD, hFD, hFY⟩
    exact Or.inr ⟨Y, by simpa [KF] using hYF, by simpa [KB] using hYnotB,
      by simpa [KB, KF] using hcard, hBX, hBD, hFD, hFY⟩

/-- Live-source cyclic separation for the second-source geometric row.  The
faithful `rowAt` is rebuilt from `D.K4`, so this adapter does not import the
residual consumer that packages a later FreshThird closure arm. -/
theorem freshThird_secondSource_sharedPairCyclicSeparation_atBoundary
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.secondSource.1 C.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.support)
    (qsource₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (qsource₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (boundaryIndexing : BoundaryIndexing D.A) :
    (SurplusCOMPGBank.btw
        (boundaryIndexing.indexOf
          ⟨H.centerAt C.secondSource.1 C.secondSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.center_mem).2⟩)
        (boundaryIndexing.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        (boundaryIndexing.indexOf ⟨Q.source₁.1, Q.source₁.2⟩) ↔
      ¬ SurplusCOMPGBank.btw
        (boundaryIndexing.indexOf
          ⟨H.centerAt C.secondSource.1 C.secondSource.2,
            (Finset.mem_erase.mp
              (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.center_mem).2⟩)
        (boundaryIndexing.indexOf
          ⟨H.centerAt Q.source₁.1 Q.source₁.2,
            (Finset.mem_erase.mp
              (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩)
        (boundaryIndexing.indexOf ⟨Q.source₂.1, Q.source₂.2⟩)) := by
  classical
  let sourceCenter : CarrierLabel D.A :=
    ⟨H.centerAt C.secondSource.1 C.secondSource.2,
      (Finset.mem_erase.mp
        (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.center_mem).2⟩
  let freshCenter : CarrierLabel D.A :=
    ⟨H.centerAt Q.source₁.1 Q.source₁.2,
      (Finset.mem_erase.mp
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
  let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
  let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
  let Ksource :=
    (H.selectedAt C.secondSource.1 C.secondSource.2).toCriticalFourShell.toSelectedFourClass
  let Kfresh :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.toSelectedFourClass
  have hsourceCenter_ne_freshCenter : sourceCenter ≠ freshCenter := by
    intro h
    exact centers_ne (congrArg Subtype.val h)
  have hsourceCenter_val_ne_freshCenter_val :
      sourceCenter.1 ≠ freshCenter.1 := by
    simpa [sourceCenter, freshCenter] using centers_ne
  have hpoints_ne : firstPoint ≠ secondPoint := by
    intro h
    apply Q.sources_ne
    exact Subtype.ext (congrArg Subtype.val h)
  rcases exists_faithfulCarrierPattern_with_two_classes D.K4
      sourceCenter.2 freshCenter.2 hsourceCenter_val_ne_freshCenter_val Ksource Kfresh with
    ⟨F, hFsource, hFfresh⟩
  let rowAt : (center : CarrierLabel D.A) → SelectedFourClass D.A center.1 :=
    fun center => F.classAt center.1 center.2
  have hsource₁_row : firstPoint.1 ∈ (rowAt sourceCenter).support := by
    rw [show (rowAt sourceCenter).support = Ksource.support by
      simpa [rowAt, sourceCenter] using hFsource]
    exact source₁_mem
  have hsource₂_row : secondPoint.1 ∈ (rowAt sourceCenter).support := by
    rw [show (rowAt sourceCenter).support = Ksource.support by
      simpa [rowAt, sourceCenter] using hFsource]
    exact source₂_mem
  have hqsource₁_row : firstPoint.1 ∈ (rowAt freshCenter).support := by
    rw [show (rowAt freshCenter).support = Kfresh.support by
      simpa [rowAt, freshCenter] using hFfresh]
    exact qsource₁_mem
  have hqsource₂_row : secondPoint.1 ∈ (rowAt freshCenter).support := by
    rw [show (rowAt freshCenter).support = Kfresh.support by
      simpa [rowAt, freshCenter] using hFfresh]
    exact qsource₂_mem
  simpa [sourceCenter, freshCenter, firstPoint, secondPoint] using
    (selectedFourClass_shared_pair_separated rowAt boundaryIndexing.boundary
      boundaryIndexing.indexOf boundaryIndexing.boundary_ccw
      boundaryIndexing.boundary_injective boundaryIndexing.index_injective
      boundaryIndexing.point_eq hsourceCenter_ne_freshCenter hpoints_ne
      hsource₁_row hsource₂_row hqsource₁_row hqsource₂_row)

end FreshThirdSourceAdapter

/-- Boundary-indexed form of the shared-pair cyclic separation theorem. -/
theorem selectedFourClass_twoRow_shared_pair_separation
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {firstCenter secondCenter firstPoint secondPoint : ↑A}
    (hcenters : firstCenter ≠ secondCenter)
    (hpoints : firstPoint ≠ secondPoint)
    (hfirstPoint_first :
      firstPoint.1 ∈ (rowAt firstCenter).support)
    (hsecondPoint_first :
      secondPoint.1 ∈ (rowAt firstCenter).support)
    (hfirstPoint_second :
      firstPoint.1 ∈ (rowAt secondCenter).support)
    (hsecondPoint_second :
      secondPoint.1 ∈ (rowAt secondCenter).support) :
    SurplusCOMPGBank.btw
        (B.indexOf firstCenter) (B.indexOf secondCenter) (B.indexOf firstPoint) ↔
      ¬ SurplusCOMPGBank.btw
        (B.indexOf firstCenter) (B.indexOf secondCenter) (B.indexOf secondPoint) := by
  apply selectedFourClass_shared_pair_separated rowAt B.boundary B.indexOf
    B.boundary_ccw B.boundary_injective B.index_injective
      (by simpa [pointOf] using B.point_eq)
  · exact hcenters
  · exact hpoints
  · exact hfirstPoint_first
  · exact hsecondPoint_first
  · exact hfirstPoint_second
  · exact hsecondPoint_second

end ATailFrontierLiveClosure
end Problem97
