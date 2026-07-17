/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Chosen blockers of a common-shell outside pair

This scratch module starts from two distinct sources with the same chosen
critical blocker.  It keeps the source identities while projecting their
common exact four-shell to an indexed cap containing that blocker.

The source-role split is essential: outside-pair extraction by itself works
for any carrier-centered selected row and therefore does not consume the
blocker collision.  If one collision source is outside the cap, its chosen
blocker is already the common blocker.  Only when both collision sources lie
inside the cap do the two complementary shell points give two genuinely new
sources whose chosen blockers might add information.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCollisionOutsidePairBlockersScratch

open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- Two distinct sources in one fiber of the retained critical blocker map. -/
structure CriticalBlockerCollision
    {D : CounterexampleData} (H : CriticalShellSystem D.A) : Type where
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  blockers_eq : H.blockerVertex source₁ = H.blockerVertex source₂

namespace CriticalBlockerCollision

/-- The common blocker, named using the first collision source. -/
def commonBlocker
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) : ℝ² :=
  H.centerAt N.source₁.1 N.source₁.2

/-- The common exact shell, named using the first collision source. -/
def commonSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) : Finset ℝ² :=
  (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support

theorem source_points_ne
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) :
    N.source₁.1 ≠ N.source₂.1 := by
  intro h
  exact N.sources_ne (Subtype.ext h)

theorem source₁_mem_commonSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) :
    N.source₁.1 ∈ N.commonSupport :=
  (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.q_mem_support

theorem centers_eq
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) :
    H.centerAt N.source₁.1 N.source₁.2 =
      H.centerAt N.source₂.1 N.source₂.2 :=
  congrArg Subtype.val N.blockers_eq

theorem source₂_mem_commonSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) :
    N.source₂.1 ∈ N.commonSupport := by
  apply ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
    (H.selectedAt N.source₁.1 N.source₁.2)
  intro hsurvives
  apply H.no_qfree_at N.source₂.1 N.source₂.2
  simpa only [N.centers_eq] using hsurvives

theorem commonSupport_card
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) :
    N.commonSupport.card = 4 :=
  (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support_card

theorem commonBlocker_mem_A
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) :
    N.commonBlocker ∈ D.A :=
  (Finset.mem_erase.mp
    (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.center_mem).2

theorem commonBlocker_equidistant
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H)
    {x y : ℝ²} (hx : x ∈ N.commonSupport) (hy : y ∈ N.commonSupport) :
    dist N.commonBlocker x = dist N.commonBlocker y := by
  let K := (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell
  exact (K.support_eq_radius x hx).trans (K.support_eq_radius y hy).symm

end CriticalBlockerCollision

/-- A cap containing the common blocker, together with two distinct common
shell points outside that cap.  The collision sources remain explicit. -/
structure CollisionCapOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (N : CriticalBlockerCollision H) : Type where
  capIndex : Fin 3
  commonBlocker_mem_cap : N.commonBlocker ∈ S.capByIndex capIndex
  outside₁ : ℝ²
  outside₂ : ℝ²
  outside₁_mem_commonSupport : outside₁ ∈ N.commonSupport
  outside₂_mem_commonSupport : outside₂ ∈ N.commonSupport
  outside_points_ne : outside₁ ≠ outside₂
  outside₁_not_mem_cap : outside₁ ∉ S.capByIndex capIndex
  outside₂_not_mem_cap : outside₂ ∉ S.capByIndex capIndex

namespace CollisionCapOutsidePair

theorem outside₁_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) :
    P.outside₁ ∈ D.A :=
  (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support_subset_A
    P.outside₁_mem_commonSupport

theorem outside₂_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) :
    P.outside₂ ∈ D.A :=
  (H.selectedAt N.source₁.1 N.source₁.2).toCriticalFourShell.support_subset_A
    P.outside₂_mem_commonSupport

theorem commonBlocker_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) :
    dist N.commonBlocker P.outside₁ =
      dist N.commonBlocker P.outside₂ :=
  N.commonBlocker_equidistant
    P.outside₁_mem_commonSupport P.outside₂_mem_commonSupport

/-- The chosen blocker of the first outside point. -/
def actualBlocker₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) : ℝ² :=
  H.centerAt P.outside₁ P.outside₁_mem_A

/-- The chosen blocker of the second outside point. -/
def actualBlocker₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) : ℝ² :=
  H.centerAt P.outside₂ P.outside₂_mem_A

/-- The first outside point's exact chosen critical support. -/
def actualSupport₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) : Finset ℝ² :=
  (H.selectedAt P.outside₁ P.outside₁_mem_A).toCriticalFourShell.support

/-- The second outside point's exact chosen critical support. -/
def actualSupport₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) : Finset ℝ² :=
  (H.selectedAt P.outside₂ P.outside₂_mem_A).toCriticalFourShell.support

private theorem false_of_distinct_capCenter_bisects_outsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N)
    {secondCenter : ℝ²}
    (hsecondCap : secondCenter ∈ S.capByIndex P.capIndex)
    (hsecondNe : secondCenter ≠ N.commonBlocker)
    (hsecondEq : dist secondCenter P.outside₁ = dist secondCenter P.outside₂) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex P.capIndex with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcommonImage : N.commonBlocker ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact P.commonBlocker_mem_cap
  have hsecondImage : secondCenter ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hsecondCap
  rcases Finset.mem_image.mp hcommonImage with ⟨i, _hi, hiCommon⟩
  rcases Finset.mem_image.mp hsecondImage with ⟨j, _hj, hjSecond⟩
  have hij : i ≠ j := by
    intro hij
    apply hsecondNe
    calc
      secondCenter = L.points j := hjSecond.symm
      _ = L.points i := by rw [hij]
      _ = N.commonBlocker := hiCommon
  have houtside₁ : P.outside₁ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₁_not_mem_cap
  have houtside₂ : P.outside₂ ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.outside₂_not_mem_cap
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij P.outside₁_mem_A P.outside₂_mem_A
      houtside₁ houtside₂ P.outside_points_ne
      (by simpa [hiCommon] using P.commonBlocker_equidistant)
      (by simpa [hjSecond] using hsecondEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji P.outside₁_mem_A P.outside₂_mem_A
      houtside₁ houtside₂ P.outside_points_ne
      (by simpa [hjSecond] using hsecondEq)
      (by simpa [hiCommon] using P.commonBlocker_equidistant)

/-- Exact residual after inspecting the chosen blockers of the two outside
points.  A cross-row through the pair cannot have a distinct center in the
common blocker's cap.  Hence either one chosen blocker is the common blocker,
a distinct cross-row center lies outside that cap, or the two chosen rows
mutually omit the opposite outside point. -/
def ActualBlockerPairOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) : Prop :=
  P.actualBlocker₁ = N.commonBlocker ∨
    P.actualBlocker₂ = N.commonBlocker ∨
    (P.actualBlocker₁ ≠ N.commonBlocker ∧
      P.actualBlocker₁ ∉ S.capByIndex P.capIndex ∧
      P.outside₂ ∈ P.actualSupport₁) ∨
    (P.actualBlocker₂ ≠ N.commonBlocker ∧
      P.actualBlocker₂ ∉ S.capByIndex P.capIndex ∧
      P.outside₁ ∈ P.actualSupport₂) ∨
    (P.outside₂ ∉ P.actualSupport₁ ∧
      P.outside₁ ∉ P.actualSupport₂)

theorem actualBlockerPairOutcome_total
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) :
    P.ActualBlockerPairOutcome := by
  by_cases hcross₁ : P.outside₂ ∈ P.actualSupport₁
  · by_cases hpinned₁ : P.actualBlocker₁ = N.commonBlocker
    · exact Or.inl hpinned₁
    · have hoff₁ : P.actualBlocker₁ ∉ S.capByIndex P.capIndex := by
        intro hcap₁
        apply false_of_distinct_capCenter_bisects_outsidePair P hcap₁ hpinned₁
        let K := (H.selectedAt P.outside₁ P.outside₁_mem_A).toCriticalFourShell
        exact (K.support_eq_radius P.outside₁ K.q_mem_support).trans
          (K.support_eq_radius P.outside₂ hcross₁).symm
      exact Or.inr (Or.inr (Or.inl ⟨hpinned₁, hoff₁, hcross₁⟩))
  · by_cases hcross₂ : P.outside₁ ∈ P.actualSupport₂
    · by_cases hpinned₂ : P.actualBlocker₂ = N.commonBlocker
      · exact Or.inr (Or.inl hpinned₂)
      · have hoff₂ : P.actualBlocker₂ ∉ S.capByIndex P.capIndex := by
          intro hcap₂
          apply false_of_distinct_capCenter_bisects_outsidePair P hcap₂ hpinned₂
          let K := (H.selectedAt P.outside₂ P.outside₂_mem_A).toCriticalFourShell
          exact (K.support_eq_radius P.outside₁ hcross₂).trans
            (K.support_eq_radius P.outside₂ K.q_mem_support).symm
        exact Or.inr (Or.inr (Or.inr (Or.inl ⟨hpinned₂, hoff₂, hcross₂⟩)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr ⟨hcross₁, hcross₂⟩)))

/-- If the first outside point is the first collision source, its chosen
blocker is definitionally the common blocker. -/
theorem actualBlocker₁_eq_commonBlocker_of_eq_source₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N)
    (hsource : P.outside₁ = N.source₁.1) :
    P.actualBlocker₁ = N.commonBlocker := by
  simp only [actualBlocker₁, CriticalBlockerCollision.commonBlocker]
  simp only [hsource]

/-- If the first outside point is the second collision source, its chosen
blocker is also the common blocker. -/
theorem actualBlocker₁_eq_commonBlocker_of_eq_source₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N)
    (hsource : P.outside₁ = N.source₂.1) :
    P.actualBlocker₁ = N.commonBlocker := by
  simp only [actualBlocker₁, CriticalBlockerCollision.commonBlocker]
  simpa only [hsource] using N.centers_eq.symm

/-- The collision-faithful cap-role split.  If both collision sources are in
the common blocker's cap, the outside pair consists of the other two shell
points.  Otherwise at least one collision source is itself outside. -/
def SourceCapRole
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) : Prop :=
  (N.source₁.1 ∈ S.capByIndex P.capIndex ∧
      N.source₂.1 ∈ S.capByIndex P.capIndex) ∨
    N.source₁.1 ∉ S.capByIndex P.capIndex ∨
    N.source₂.1 ∉ S.capByIndex P.capIndex

theorem sourceCapRole_total
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N) :
    SourceCapRole P := by
  by_cases h₁ : N.source₁.1 ∈ S.capByIndex P.capIndex
  · by_cases h₂ : N.source₂.1 ∈ S.capByIndex P.capIndex
    · exact Or.inl ⟨h₁, h₂⟩
    · exact Or.inr (Or.inr h₂)
  · exact Or.inr (Or.inl h₁)

/-- Every cap containing the common blocker leaves at least two points of the
common exact four-shell outside. -/
theorem two_le_commonSupport_sdiff_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} (N : CriticalBlockerCollision H)
    (k : Fin 3) (hcenter : N.commonBlocker ∈ S.capByIndex k) :
    2 ≤ (N.commonSupport \ S.capByIndex k).card := by
  let K : SelectedFourClass D.A N.commonBlocker :=
    (H.selectedAt N.source₁.1 N.source₁.2).toSelectedFourClass
  have hinter : (N.commonSupport ∩ S.capByIndex k).card ≤ 2 := by
    simpa [K, CriticalBlockerCollision.commonSupport,
      CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex k K hcenter
  have hsplit := Finset.card_sdiff_add_card_inter
    N.commonSupport (S.capByIndex k)
  have hfour := N.commonSupport_card
  omega

/-- If the first collision source lies outside the common blocker's cap, the
outside pair can be chosen to contain that source.  Its chosen blocker is then
already the common blocker, so it supplies no distinct second center. -/
theorem exists_outsidePair_anchored_source₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} (N : CriticalBlockerCollision H)
    (k : Fin 3) (hcenter : N.commonBlocker ∈ S.capByIndex k)
    (hsourceOutside : N.source₁.1 ∉ S.capByIndex k) :
    ∃ P : CollisionCapOutsidePair (S := S) N,
      P.capIndex = k ∧
      P.outside₁ = N.source₁.1 ∧
      P.actualBlocker₁ = N.commonBlocker := by
  have hsourceSdiff : N.source₁.1 ∈ N.commonSupport \ S.capByIndex k :=
    Finset.mem_sdiff.mpr ⟨N.source₁_mem_commonSupport, hsourceOutside⟩
  have hone : 1 < (N.commonSupport \ S.capByIndex k).card := by
    have htwo := two_le_commonSupport_sdiff_cap N k hcenter
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haSupport, haOutside⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbSupport, hbOutside⟩
  by_cases hasource : a = N.source₁.1
  · let P : CollisionCapOutsidePair (S := S) N := {
      capIndex := k
      commonBlocker_mem_cap := hcenter
      outside₁ := N.source₁.1
      outside₂ := b
      outside₁_mem_commonSupport := N.source₁_mem_commonSupport
      outside₂_mem_commonSupport := hbSupport
      outside_points_ne := by
        intro h
        exact hab (hasource.trans h)
      outside₁_not_mem_cap := hsourceOutside
      outside₂_not_mem_cap := hbOutside }
    refine ⟨P, rfl, rfl, ?_⟩
    exact P.actualBlocker₁_eq_commonBlocker_of_eq_source₁ rfl
  · let P : CollisionCapOutsidePair (S := S) N := {
      capIndex := k
      commonBlocker_mem_cap := hcenter
      outside₁ := N.source₁.1
      outside₂ := a
      outside₁_mem_commonSupport := N.source₁_mem_commonSupport
      outside₂_mem_commonSupport := haSupport
      outside_points_ne := Ne.symm hasource
      outside₁_not_mem_cap := hsourceOutside
      outside₂_not_mem_cap := haOutside }
    refine ⟨P, rfl, rfl, ?_⟩
    exact P.actualBlocker₁_eq_commonBlocker_of_eq_source₁ rfl

/-- Symmetric anchored extraction for the second collision source. -/
theorem exists_outsidePair_anchored_source₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} (N : CriticalBlockerCollision H)
    (k : Fin 3) (hcenter : N.commonBlocker ∈ S.capByIndex k)
    (hsourceOutside : N.source₂.1 ∉ S.capByIndex k) :
    ∃ P : CollisionCapOutsidePair (S := S) N,
      P.capIndex = k ∧
      P.outside₁ = N.source₂.1 ∧
      P.actualBlocker₁ = N.commonBlocker := by
  have hsourceSdiff : N.source₂.1 ∈ N.commonSupport \ S.capByIndex k :=
    Finset.mem_sdiff.mpr ⟨N.source₂_mem_commonSupport, hsourceOutside⟩
  have hone : 1 < (N.commonSupport \ S.capByIndex k).card := by
    have htwo := two_le_commonSupport_sdiff_cap N k hcenter
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haSupport, haOutside⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbSupport, hbOutside⟩
  by_cases hasource : a = N.source₂.1
  · let P : CollisionCapOutsidePair (S := S) N := {
      capIndex := k
      commonBlocker_mem_cap := hcenter
      outside₁ := N.source₂.1
      outside₂ := b
      outside₁_mem_commonSupport := N.source₂_mem_commonSupport
      outside₂_mem_commonSupport := hbSupport
      outside_points_ne := by
        intro h
        exact hab (hasource.trans h)
      outside₁_not_mem_cap := hsourceOutside
      outside₂_not_mem_cap := hbOutside }
    refine ⟨P, rfl, rfl, ?_⟩
    exact P.actualBlocker₁_eq_commonBlocker_of_eq_source₂ rfl
  · let P : CollisionCapOutsidePair (S := S) N := {
      capIndex := k
      commonBlocker_mem_cap := hcenter
      outside₁ := N.source₂.1
      outside₂ := a
      outside₁_mem_commonSupport := N.source₂_mem_commonSupport
      outside₂_mem_commonSupport := haSupport
      outside_points_ne := Ne.symm hasource
      outside₁_not_mem_cap := hsourceOutside
      outside₂_not_mem_cap := haOutside }
    refine ⟨P, rfl, rfl, ?_⟩
    exact P.actualBlocker₁_eq_commonBlocker_of_eq_source₂ rfl

/-- In the only cap-role branch where two new chosen blockers might occur,
both collision sources lie inside the cap and both extracted outside points
are different from both sources. -/
theorem outside_points_fresh_of_sources_mem_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {N : CriticalBlockerCollision H}
    (P : CollisionCapOutsidePair (S := S) N)
    (hsource₁ : N.source₁.1 ∈ S.capByIndex P.capIndex)
    (hsource₂ : N.source₂.1 ∈ S.capByIndex P.capIndex) :
    P.outside₁ ≠ N.source₁.1 ∧
      P.outside₁ ≠ N.source₂.1 ∧
      P.outside₂ ≠ N.source₁.1 ∧
      P.outside₂ ≠ N.source₂.1 := by
  exact ⟨
    fun h ↦ P.outside₁_not_mem_cap (h ▸ hsource₁),
    fun h ↦ P.outside₁_not_mem_cap (h ▸ hsource₂),
    fun h ↦ P.outside₂_not_mem_cap (h ▸ hsource₁),
    fun h ↦ P.outside₂_not_mem_cap (h ▸ hsource₂)⟩

end CollisionCapOutsidePair

#print axioms CriticalBlockerCollision.source₂_mem_commonSupport
#print axioms CollisionCapOutsidePair.sourceCapRole_total
#print axioms CollisionCapOutsidePair.actualBlockerPairOutcome_total
#print axioms CollisionCapOutsidePair.exists_outsidePair_anchored_source₁
#print axioms CollisionCapOutsidePair.exists_outsidePair_anchored_source₂
#print axioms CollisionCapOutsidePair.outside_points_fresh_of_sources_mem_cap

end ATailCollisionOutsidePairBlockersScratch
end Problem97
