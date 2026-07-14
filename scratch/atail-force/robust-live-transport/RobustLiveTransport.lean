import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# ATAIL robust-survival / live-row transport audit

Scratch-only Lean checks for the exact interaction between the arbitrary
critical-pair frontier and the named `p`-centered dangerous row available in
the live U1 tail.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLiveTransportScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

/-- The parent hypothesis `q ∈ CP.capAt i` is exactly membership in the
surplus cap of the CP-built leaf packet. -/
theorem live_q_mem_leafSurplusPacket
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    {q₀ : ℝ²} (hq₀ : q₀ ∈ CP.capAt i) :
    q₀ ∈
      (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
        (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
        (hM := hM) (hsurplus := hsurplus)).surplusCap := by
  subst M
  simpa [U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket,
    SurplusCapPacket.surplusCap, CapTriple.capAt] using hq₀

/-- The `t₂` row built in the actual parent is definitionally the row chosen
by the same `CriticalShellSystem`; there is no hidden provenance gap at this
step. -/
theorem parent_t2_row_provenance
    {D : CounterexampleData} {q₀ t₁ t₂ t₃ u : ℝ²}
    (H : CriticalShellSystem D.A)
    (hq₀A : q₀ ∈ D.A) (ht₁A : t₁ ∈ D.A)
    (ht₂A : t₂ ∈ D.A) (ht₃A : t₃ ∈ D.A)
    (huA : u ∈ D.A) :
    let rows := U1Depth5.CriticalSourceRows.ofCriticalShellSystem
      H hq₀A ht₁A ht₂A ht₃A huA
    (rows.rowAt U1Depth5.CriticalSource.t2).center =
        H.centerAt t₂ ht₂A ∧
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        (H.selectedAt t₂ ht₂A).toCriticalFourShell.support := by
  exact ⟨rfl, rfl⟩

/-- The named live source in the surplus cap cannot be either source chosen by
the off-surplus critical-pair frontier. -/
theorem live_surplus_source_ne_frontier_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {q₀ : ℝ²} (hq₀ : q₀ ∈ S.surplusCap) :
    P.q ≠ q₀ ∧ P.w ≠ q₀ := by
  constructor
  · intro h
    have hoff := (Finset.mem_sdiff.mp P.q_mem_marginal).2
    apply hoff
    rw [h]
    exact hq₀
  · intro h
    have hoff := (Finset.mem_sdiff.mp P.w_mem_marginal).2
    apply hoff
    rw [h]
    exact hq₀

/-- Two sources with the same chosen blocker center have the same exact
critical support.  This is a direct use of blocker-row uniqueness, not an
extra incidence assumption. -/
theorem selected_support_eq_of_centerAt_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {a b : ℝ²} (ha : a ∈ A) (hb : b ∈ A)
    (hcenter : H.centerAt a ha = H.centerAt b hb) :
    (H.selectedAt a ha).toCriticalFourShell.support =
      (H.selectedAt b hb).toCriticalFourShell.support := by
  let K : SelectedFourClass A (H.centerAt a ha) :=
    { support := (H.selectedAt b hb).toCriticalFourShell.support
      support_subset_A :=
        (H.selectedAt b hb).toCriticalFourShell.support_subset_A
      support_card :=
        (H.selectedAt b hb).toCriticalFourShell.support_card
      radius := (H.selectedAt b hb).toCriticalFourShell.radius
      radius_pos :=
        (H.selectedAt b hb).toCriticalFourShell.radius_pos
      support_eq_radius := by
        intro z hz
        rw [hcenter]
        exact (H.selectedAt b hb).toCriticalFourShell.support_eq_radius z hz
      center_not_mem := by
        intro hmem
        apply (H.selectedAt b hb).toCriticalFourShell.center_not_mem_support
        let T := (H.selectedAt b hb).toCriticalFourShell.support
        have hmemT : H.centerAt a ha ∈ T := hmem
        have hmemT' : H.centerAt b hb ∈ T := by
          rw [← hcenter]
          exact hmemT
        exact hmemT' }
  have hK := H.selectedFourClass_support_eq_shell a ha K
  exact hK.symm

/-- If the frontier source's blocker is the live `p`-centered dangerous-row
blocker, cross-deletion survival is *exactly* avoidance of the three named
dangerous points other than the surplus source.  Avoidance of the surplus
source itself is automatic because the frontier is off the surplus cap.

Thus blocker-center identification alone does not consume the robust branch;
one additionally needs incidence of the other frontier source with
`{t₁,t₂,t₃}`. -/
theorem cross_survival_iff_avoids_live_dangerous_triple
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {q₀ p t₁ t₂ t₃ : ℝ²}
    (hq₀ : q₀ ∈ S.surplusCap)
    (ht₂A : t₂ ∈ D.A)
    (hPcenter : H.centerAt P.q P.q_mem_A = p)
    (ht₂center : H.centerAt t₂ ht₂A = p)
    (ht₂support :
      (H.selectedAt t₂ ht₂A).toCriticalFourShell.support =
        ({q₀, t₁, t₂, t₃} : Finset ℝ²)) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ↔
      (P.w ≠ t₁ ∧ P.w ≠ t₂ ∧ P.w ≠ t₃) := by
  have hcenters :
      H.centerAt P.q P.q_mem_A = H.centerAt t₂ ht₂A :=
    hPcenter.trans ht₂center.symm
  have hsupport :
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support =
        ({q₀, t₁, t₂, t₃} : Finset ℝ²) :=
    (selected_support_eq_of_centerAt_eq H P.q_mem_A ht₂A hcenters).trans
      ht₂support
  have hwq₀ : P.w ≠ q₀ :=
    (live_surplus_source_ne_frontier_sources P hq₀).2
  rw [cross_deletion_survives_iff_not_mem_selected_support H P.q_mem_A,
    hsupport]
  simp [hwq₀]

/-- The same blocker alignment already identifies the *first* frontier source
with one of the three dangerous points.  The only remaining robust-survival
freedom is therefore whether the second source avoids that triple. -/
theorem frontier_source_mem_live_dangerous_of_blocker_alignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {q₀ p t₁ t₂ t₃ : ℝ²}
    (hq₀ : q₀ ∈ S.surplusCap)
    (ht₂A : t₂ ∈ D.A)
    (hPcenter : H.centerAt P.q P.q_mem_A = p)
    (ht₂center : H.centerAt t₂ ht₂A = p)
    (ht₂support :
      (H.selectedAt t₂ ht₂A).toCriticalFourShell.support =
        ({q₀, t₁, t₂, t₃} : Finset ℝ²)) :
    P.q ∈ ({t₁, t₂, t₃} : Finset ℝ²) := by
  have hcenters :
      H.centerAt P.q P.q_mem_A = H.centerAt t₂ ht₂A :=
    hPcenter.trans ht₂center.symm
  have hsupport :
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support =
        ({q₀, t₁, t₂, t₃} : Finset ℝ²) :=
    (selected_support_eq_of_centerAt_eq H P.q_mem_A ht₂A hcenters).trans
      ht₂support
  have hqmem : P.q ∈ ({q₀, t₁, t₂, t₃} : Finset ℝ²) := by
    rw [← hsupport]
    exact (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
  have hq_ne_q₀ : P.q ≠ q₀ :=
    (live_surplus_source_ne_frontier_sources P hq₀).1
  simp only [Finset.mem_insert, Finset.mem_singleton] at hqmem ⊢
  rcases hqmem with hq0 | hq1 | hq2 | hq3
  · exact False.elim (hq_ne_q₀ hq0)
  · exact Or.inl hq1
  · exact Or.inr (Or.inl hq2)
  · exact Or.inr (Or.inr hq3)

/-- Exact conditional consumer for the live-row route: once the blocker is
identified with the `p`-centered dangerous row, any incidence of the other
frontier source with the dangerous triple contradicts robust survival. -/
theorem false_of_cross_survival_and_live_dangerous_incidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {q₀ p t₁ t₂ t₃ : ℝ²}
    (hq₀ : q₀ ∈ S.surplusCap)
    (ht₂A : t₂ ∈ D.A)
    (hPcenter : H.centerAt P.q P.q_mem_A = p)
    (ht₂center : H.centerAt t₂ ht₂A = p)
    (ht₂support :
      (H.selectedAt t₂ ht₂A).toCriticalFourShell.support =
        ({q₀, t₁, t₂, t₃} : Finset ℝ²))
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A))
    (hwDangerous : P.w ∈ ({t₁, t₂, t₃} : Finset ℝ²)) :
    False := by
  have havoid :=
    (cross_survival_iff_avoids_live_dangerous_triple P hq₀ ht₂A
      hPcenter ht₂center ht₂support).mp hsurvives
  simp only [Finset.mem_insert, Finset.mem_singleton] at hwDangerous
  rcases hwDangerous with rfl | rfl | rfl
  · exact havoid.1 rfl
  · exact havoid.2.1 rfl
  · exact havoid.2.2 rfl

#print axioms live_surplus_source_ne_frontier_sources
#print axioms live_q_mem_leafSurplusPacket
#print axioms parent_t2_row_provenance
#print axioms selected_support_eq_of_centerAt_eq
#print axioms cross_survival_iff_avoids_live_dangerous_triple
#print axioms frontier_source_mem_live_dangerous_of_blocker_alignment
#print axioms false_of_cross_survival_and_live_dangerous_incidence

end ATailRobustLiveTransportScratch
end Problem97
