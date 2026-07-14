import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# ATAIL dangerous-class blocker collapse

The localized no-`q`-free hypothesis and the exact dangerous four-class make
the dangerous apex `p` a valid deletion blocker for every member of
`{q, t1, t2, t3}`.  Consequently any existing `CriticalShellSystem` can be
overridden so that all four dangerous sources choose `p` as their blocker.

This is an obstruction result for producer design: diversity of blocker
centers on the dangerous sources cannot be extracted from an arbitrary chosen
critical-shell system.  This scratch file introduces no axiom and no `sorry`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILForceScratch

/-- If deleting one member `q` of an exact four-point radius class blocks its
center, then deleting any member of that same class blocks the center. -/
theorem no_k4_after_delete_of_mem_exact_blocked_class
    {A : Finset ℝ²} {center q z : ℝ²} {radius : ℝ}
    (hqBlocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hqClass : q ∈ SelectedClass A center radius)
    (hcard : (SelectedClass A center radius).card = 4)
    (hzClass : z ∈ SelectedClass A center radius) :
    ¬ HasNEquidistantPointsAt 4 (A.erase z) center := by
  intro hK4
  rcases hK4 with ⟨rho, hrho, hfourErase⟩
  have hfourEraseClass :
      4 ≤ (SelectedClass (A.erase z) center rho).card := by
    simpa [SelectedClass] using hfourErase
  have hfourAmbient : 4 ≤ (SelectedClass A center rho).card := by
    refine le_trans hfourEraseClass (Finset.card_le_card ?_)
    rw [selectedClass_erase_eq]
    exact Finset.erase_subset z (SelectedClass A center rho)
  by_cases hqRho : q ∈ SelectedClass A center rho
  · have hrhoEq : rho = radius := by
      have hqDistRho := (mem_selectedClass.mp hqRho).2
      have hqDistRadius := (mem_selectedClass.mp hqClass).2
      exact hqDistRho.symm.trans hqDistRadius
    subst rho
    rw [selectedClass_erase_eq, Finset.card_erase_of_mem hzClass, hcard]
      at hfourEraseClass
    omega
  · apply hqBlocked
    refine ⟨rho, hrho, ?_⟩
    have hcardEraseQ :
        (SelectedClass (A.erase q) center rho).card =
          (SelectedClass A center rho).card :=
      selectedClass_erase_card_eq_of_not_mem hqRho
    have hfourEraseQ :
        4 ≤ (SelectedClass (A.erase q) center rho).card := by
      rw [hcardEraseQ]
      exact hfourAmbient
    simpa [SelectedClass] using hfourEraseQ

/-- The localized no-`q`-free packet blocks `p` after deleting `q` from the
ambient carrier, not only after additionally erasing the center. -/
theorem ambient_q_blocked_at_p
    {D : CounterexampleData} {q p : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q) p := by
  simpa [CounterexampleData.skeleton] using
    (not_hasNEquidistantPointsAt_of_no_erase_center
      hlocalNoQFree.no_qfree)

/-- The dangerous radius class has exactly four ambient points. -/
theorem dangerous_selectedClass_card_eq_four
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    (SelectedClass D.A p (dist p q)).card = 4 := by
  classical
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hsupportSubset :
      Kbase.support ⊆ SelectedClass D.A p (dist p q) := by
    intro z hz
    apply mem_selectedClass.mpr
    refine ⟨Kbase.support_subset_A hz, ?_⟩
    simpa [Kbase] using Kbase.support_eq_radius z hz
  have hfour : 4 ≤ (SelectedClass D.A p (dist p q)).card := by
    calc
      4 = Kbase.support.card := Kbase.support_card.symm
      _ ≤ (SelectedClass D.A p (dist p q)).card :=
        Finset.card_le_card hsupportSubset
  have hle : (SelectedClass D.A p (dist p q)).card ≤ 4 := by
    by_contra hnot
    have hfive : 5 ≤ (SelectedClass D.A p (dist p q)).card := by
      omega
    have hfourAfterQ :
        4 ≤ (SelectedClass (D.A.erase q) p (dist p q)).card :=
      selectedClass_erase_card_ge_of_succ_le hfive
    exact (ambient_q_blocked_at_p hlocalNoQFree)
      ⟨dist p q, hfixed.q_radius_pos,
        by simpa [SelectedClass] using hfourAfterQ⟩
  exact le_antisymm hle hfour

/-- The entire dangerous radius class is exactly the four named points. -/
theorem dangerous_selectedClass_eq_base
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    SelectedClass D.A p (dist p q) =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  classical
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hsubset :
      Kbase.support ⊆ SelectedClass D.A p (dist p q) := by
    intro z hz
    apply mem_selectedClass.mpr
    refine ⟨Kbase.support_subset_A hz, ?_⟩
    simpa [Kbase] using Kbase.support_eq_radius z hz
  have hcardBase : Kbase.support.card = 4 := Kbase.support_card
  have heq : Kbase.support = SelectedClass D.A p (dist p q) :=
    Finset.eq_of_subset_of_card_le hsubset (by
      rw [dangerous_selectedClass_card_eq_four hlocalNoQFree hfixed,
        hcardBase])
  simpa [Kbase] using heq.symm

/-- Deleting any dangerous-class member destroys every K4 witness at `p`. -/
theorem dangerous_member_blocks_p
    {D : CounterexampleData} {p q t1 t2 t3 z : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hz : z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) p := by
  have hclassEq := dangerous_selectedClass_eq_base hlocalNoQFree hfixed
  have hqClass : q ∈ SelectedClass D.A p (dist p q) := by
    rw [hclassEq]
    simp
  have hzClass : z ∈ SelectedClass D.A p (dist p q) := by
    rw [hclassEq]
    exact hz
  exact no_k4_after_delete_of_mem_exact_blocked_class
    (ambient_q_blocked_at_p hlocalNoQFree) hqClass
    (dangerous_selectedClass_card_eq_four hlocalNoQFree hfixed) hzClass

/-- Override a critical-shell system so every source in the dangerous exact
class chooses `p` as its blocker center. -/
noncomputable def collapseDangerousBlockers
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (Hsys : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    CriticalShellSystem D.A :=
  Hsys.overrideExactSelectedClass hfixed.p_mem hfixed.q_radius_pos
    (dangerous_selectedClass_card_eq_four hlocalNoQFree hfixed)
    (fun z hz => dangerous_member_blocks_p hlocalNoQFree hfixed
      (by
        rw [← dangerous_selectedClass_eq_base hlocalNoQFree hfixed]
        exact hz))

/-- Every dangerous source has blocker center `p` in the collapsed system. -/
theorem collapseDangerousBlockers_centerAt
    {D : CounterexampleData} {p q t1 t2 t3 z : ℝ²}
    (Hsys : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hzA : z ∈ D.A)
    (hz : z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    (collapseDangerousBlockers Hsys hlocalNoQFree hfixed).centerAt z hzA = p := by
  apply CriticalShellSystem.overrideExactSelectedClass_centerAt
  rw [dangerous_selectedClass_eq_base hlocalNoQFree hfixed]
  exact hz

/-- Existence form: any available critical-shell system can be replaced by
one which sends all four named dangerous sources to `p`. -/
theorem exists_criticalShellSystem_collapsing_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    ∃ Hsys : CriticalShellSystem D.A,
      ∀ z : ℝ², ∀ hzA : z ∈ D.A,
        z ∈ ({q, t1, t2, t3} : Finset ℝ²) →
          Hsys.centerAt z hzA = p := by
  rcases hcritical with ⟨Hsys⟩
  refine ⟨collapseDangerousBlockers Hsys hlocalNoQFree hfixed, ?_⟩
  intro z hzA hz
  exact collapseDangerousBlockers_centerAt
    Hsys hlocalNoQFree hfixed hzA hz

#print axioms dangerous_member_blocks_p
#print axioms exists_criticalShellSystem_collapsing_dangerousBase

end ATAILForceScratch
end Problem97
