import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# C-package bank (scratch)

Kernel-checked, `sorry`-free bank theorems for the derivations claimed in
`docs/solve-prompts/2026-07-28-c-round1-response.md` (lemmas C1.1–C1.3 and
C2.1–C2.5).

Every hypothesis list below is copied verbatim (up to binder renaming, which
only removes the `_` linter prefix where the hypothesis is actually used) from
the two live C leaves in
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`:

* C1 `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`,
* C2 `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`.

The C2 statements additionally name the collision pair `s`, `t` and their
carrier memberships; those are obtained inside the leaf by destructing the
leaf hypothesis `_hcollision` together with
`globalDeletion.deleted_subset_class`.

Nothing here is wired into the production files; these are BANK theorems only.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CPackageBank

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailFrontierLiveClosure
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/- ## Shared helpers -/

/-- Filtering a set difference by a distance condition is the difference of the
selected class. -/
theorem selectedClass_sdiff
    {A E : Finset ℝ²} {P : ℝ²} {r : ℝ} :
    ((A \ E).filter fun q ↦ dist P q = r) = SelectedClass A P r \ E := by
  classical
  ext q
  simp only [Finset.mem_filter, Finset.mem_sdiff, mem_selectedClass]
  tauto

#print axioms Problem97.CPackageBank.selectedClass_sdiff

/-- **Two-circle bound, carrier form.**  Selected classes at two distinct
centers (any radii) meet in at most two carrier points. -/
theorem selectedClass_inter_card_le_two
    {A : Finset ℝ²} {p q : ℝ²} {r₁ r₂ : ℝ} (hpq : p ≠ q) :
    (SelectedClass A p r₁ ∩ SelectedClass A q r₂).card ≤ 2 := by
  classical
  by_contra hle
  push_neg at hle
  have h3 : 3 ≤ (SelectedClass A p r₁ ∩ SelectedClass A q r₂).card := by omega
  obtain ⟨E, hEsub, hEcard⟩ :=
    Finset.exists_subset_card_eq (s := SelectedClass A p r₁ ∩ SelectedClass A q r₂) h3
  rw [Finset.card_eq_three] at hEcard
  obtain ⟨a, b, c, hab, hac, hbc, hEeq⟩ := hEcard
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have hmem : ∀ {x : ℝ²}, x ∈ E → dist p x = r₁ ∧ dist q x = r₂ := by
    intro x hx
    have hx' := hEsub hx
    rw [Finset.mem_inter] at hx'
    exact ⟨(mem_selectedClass.mp hx'.1).2, (mem_selectedClass.mp hx'.2).2⟩
  set s₁ : EuclideanGeometry.Sphere ℝ² := ⟨p, r₁⟩ with hs₁
  set s₂ : EuclideanGeometry.Sphere ℝ² := ⟨q, r₂⟩ with hs₂
  have hsne : s₁ ≠ s₂ := by
    intro h
    exact hpq (congrArg (fun s : EuclideanGeometry.Sphere ℝ² ↦ s.1) h)
  have hin₁ : ∀ {x : ℝ²}, x ∈ E → x ∈ s₁ := by
    intro x hx
    rw [EuclideanGeometry.mem_sphere]
    exact (dist_comm x p).trans (hmem hx).1
  have hin₂ : ∀ {x : ℝ²}, x ∈ E → x ∈ s₂ := by
    intro x hx
    rw [EuclideanGeometry.mem_sphere]
    exact (dist_comm x q).trans (hmem hx).2
  rcases
      two_circle_common_point_eq_endpoint hsne hab (hin₁ haE) (hin₁ hbE)
        (hin₂ haE) (hin₂ hbE) (hin₁ hcE) (hin₂ hcE) with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

#print axioms Problem97.CPackageBank.selectedClass_inter_card_le_two

/-- **Restoration forces the restored point onto the restored witness.**
If deleting `E` blocks the center `P` but deleting `E.erase s` does not, then
the restored witness class is the class at radius `dist P s`, and it retains at
least four points after `E.erase s` is removed. -/
theorem restored_class_card_ge_four
    {A E : Finset ℝ²} {P s : ℝ²}
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ E) P)
    (hrestore : HasNEquidistantPointsAt 4 (A \ E.erase s) P) :
    0 < dist P s ∧ 4 ≤ (SelectedClass A P (dist P s) \ E.erase s).card := by
  classical
  obtain ⟨r, hrpos, hcard⟩ := hrestore
  rw [selectedClass_sdiff] at hcard
  have hsmem : s ∈ SelectedClass A P r \ E.erase s := by
    by_contra hsnot
    refine hblocked ⟨r, hrpos, ?_⟩
    rw [selectedClass_sdiff]
    refine le_trans hcard (Finset.card_le_card ?_)
    intro x hx
    have hxs : x ≠ s := by
      rintro rfl
      exact hsnot hx
    rw [Finset.mem_sdiff] at hx ⊢
    refine ⟨hx.1, ?_⟩
    intro hxE
    exact hx.2 (Finset.mem_erase.mpr ⟨hxs, hxE⟩)
  have hdps : dist P s = r :=
    (mem_selectedClass.mp (Finset.mem_sdiff.mp hsmem).1).2
  refine ⟨by rw [hdps]; exact hrpos, ?_⟩
  rw [hdps]
  exact hcard

#print axioms Problem97.CPackageBank.restored_class_card_ge_four

/-- The `B₁` side of a common-deletion certificate whose first center is the
late blocker of a named source is exactly that source's full late row. -/
theorem commonDeletion_B₁_eq_lateRow
    {D : CounterexampleData} {Hs : CriticalShellSystem D.A}
    {q x center₂ : ℝ²} (hx : x ∈ D.A)
    (pk : CommonDeletionTwoCenterPacket D Hs q (Hs.centerAt x hx) center₂) :
    pk.B₁ = (Hs.selectedAt x hx).toCriticalFourShell.support := by
  classical
  obtain ⟨-, r₀, hr₀pos, hr₀card, huniq⟩ := isUniqueFourCenter_centerAt Hs x hx
  have hrowSub :
      pk.B₁ ⊆ SelectedClass D.A (Hs.centerAt x hx) pk.row₁.radius := by
    intro y hy
    refine mem_selectedClass.mpr ⟨?_, pk.row₁.same_radius y hy⟩
    have := pk.row₁.subset hy
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase this)
  have hrowFour :
      4 ≤ (SelectedClass D.A (Hs.centerAt x hx) pk.row₁.radius).card :=
    le_trans (le_of_eq pk.B₁_card.symm) (Finset.card_le_card hrowSub)
  have hrowEq : pk.row₁.radius = r₀ := huniq _ pk.row₁.radius_pos hrowFour
  have hsupportEq :
      (Hs.selectedAt x hx).toCriticalFourShell.support =
        SelectedClass D.A (Hs.centerAt x hx)
          (Hs.selectedAt x hx).toCriticalFourShell.radius := by
    rw [(Hs.selectedAt x hx).toCriticalFourShell.support_eq]
    rfl
  have hshellFour :
      4 ≤ (SelectedClass D.A (Hs.centerAt x hx)
        (Hs.selectedAt x hx).toCriticalFourShell.radius).card := by
    rw [← hsupportEq, (Hs.selectedAt x hx).toCriticalFourShell.support_card]
  have hshellEq : (Hs.selectedAt x hx).toCriticalFourShell.radius = r₀ :=
    huniq _ (Hs.selectedAt x hx).toCriticalFourShell.radius_pos hshellFour
  have hsub : pk.B₁ ⊆ (Hs.selectedAt x hx).toCriticalFourShell.support := by
    rw [hsupportEq, hshellEq, ← hrowEq]
    exact hrowSub
  exact
    Finset.eq_of_subset_of_card_le hsub
      (by rw [pk.B₁_card, (Hs.selectedAt x hx).toCriticalFourShell.support_card])

#print axioms Problem97.CPackageBank.commonDeletion_B₁_eq_lateRow

/-- The first opposite apex is a carrier point (local restatement: the project
copies of this fact are `private`). -/
theorem firstApex_mem_A {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

#print axioms Problem97.CPackageBank.firstApex_mem_A

/-- The two opposite apices are distinct Moser vertices (local restatement: the
project copies of this fact are `private`). -/
theorem oppApex1_ne_oppApex2 {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
      using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
      using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
      using S.triangle.v12_ne

#print axioms Problem97.CPackageBank.oppApex1_ne_oppApex2

/- ## Leaf C1 — physical apex (`globalDeletion.center = S.oppApex2`)

The hypothesis block below is verbatim C1
(`FrontierLiveClosure.lean:5315–5363`). -/

/-- **C1.1.**  At the physical apex the global blocking deletion has exactly two
points: one deletion leaves a four-point class (so blocking fails), and
restoring any deleted point rebuilds the radius-`rho` class to `6 - |D₀|`
points, which must still be at least four. -/
theorem c1_globalDeletion_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ _source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    globalDeletion.deleted.card = 2 := by
  classical
  have hEsub : globalDeletion.deleted ⊆ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class
  have hEle : globalDeletion.deleted.card ≤ 5 := by
    have := Finset.card_le_card hEsub
    omega
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ globalDeletion.deleted) S.oppApex2 := by
    rw [← hcenter]
    exact globalDeletion.blocked
  have hlow : 2 ≤ globalDeletion.deleted.card := by
    by_contra hcon
    push_neg at hcon
    refine hblocked ⟨rho, hrho, ?_⟩
    rw [selectedClass_sdiff]
    have hsd :
        (SelectedClass D.A S.oppApex2 rho \ globalDeletion.deleted).card =
          (SelectedClass D.A S.oppApex2 rho).card - globalDeletion.deleted.card := by
      rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hEsub]
    omega
  obtain ⟨s, hs⟩ := globalDeletion.deleted_nonempty
  have hrestore := globalDeletion.restores s hs
  rw [hcenter] at hrestore
  obtain ⟨_, hfour⟩ := restored_class_card_ge_four hblocked hrestore
  have hdist : dist S.oppApex2 s = rho := (mem_selectedClass.mp (hEsub hs)).2
  rw [hdist] at hfour
  have hEeraseSub :
      globalDeletion.deleted.erase s ⊆ SelectedClass D.A S.oppApex2 rho :=
    (Finset.erase_subset _ _).trans hEsub
  have hsd2 :
      (SelectedClass D.A S.oppApex2 rho \ globalDeletion.deleted.erase s).card =
        (SelectedClass D.A S.oppApex2 rho).card -
          (globalDeletion.deleted.erase s).card := by
    rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hEeraseSub]
  have hsd3 :
      (globalDeletion.deleted.erase s).card = globalDeletion.deleted.card - 1 :=
    Finset.card_erase_of_mem hs
  omega

#print axioms Problem97.CPackageBank.c1_globalDeletion_card_eq_two

/-- **C1.2.**  At the physical apex `rho` is the only K4 radius: a class at any
other radius is disjoint from the deleted set and would survive the global
deletion, contradicting blocking. -/
theorem c1_unique_K4_radius_at_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ _source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    ∀ r : ℝ, 0 < r → 4 ≤ (SelectedClass D.A S.oppApex2 r).card → r = rho := by
  classical
  intro r hr hrcard
  by_contra hne
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ globalDeletion.deleted) S.oppApex2 := by
    rw [← hcenter]
    exact globalDeletion.blocked
  refine hblocked ⟨r, hr, ?_⟩
  rw [selectedClass_sdiff]
  refine le_trans hrcard (Finset.card_le_card ?_)
  intro x hx
  refine Finset.mem_sdiff.mpr ⟨hx, ?_⟩
  intro hxE
  have hxC := globalDeletion.deleted_subset_class hxE
  exact hne ((mem_selectedClass.mp hx).2.symm.trans (mem_selectedClass.mp hxC).2)

#print axioms Problem97.CPackageBank.c1_unique_K4_radius_at_secondApex

/-- **C1.3.**  Exactification of every apex-side deleted witness: for a class
point `z`, the only four-point equidistant witness at the physical apex inside
`A \ {z}` is the punctured physical class itself. -/
theorem c1_apexWitness_exactification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ _source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)
    (z : ℝ²) (_hz : z ∈ SelectedClass D.A S.oppApex2 rho)
    (r : ℝ) (hrpos : 0 < r)
    (hwitness : 4 ≤ (SelectedClass (D.A.erase z) S.oppApex2 r).card) :
    SelectedClass (D.A.erase z) S.oppApex2 r =
      (SelectedClass D.A S.oppApex2 rho).erase z := by
  classical
  rw [selectedClass_erase_eq] at hwitness ⊢
  have hfull : 4 ≤ (SelectedClass D.A S.oppApex2 r).card :=
    le_trans hwitness Finset.card_erase_le
  have hreq : r = rho :=
    c1_unique_K4_radius_at_secondApex R _hcard _surface rho _source _other _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion hclassFive globalDeletion hcenter _hsourceBlockerClass
      _huNeSource _hsourceBlockerPlacement r hrpos hfull
  rw [hreq]

#print axioms Problem97.CPackageBank.c1_apexWitness_exactification

/-- **C1.3, corollary.**  Both joint-deletion certificates are pinned: their
apex-side four-sets are the punctured physical class, their blocker-side
four-sets are the full late rows of `u` resp. `v`, and the overlap inequality
`|B₁ ∩ B₂| ≤ 2` is saturated by the rigid two-point row traces. -/
theorem c1_jointDeletion_certificates_saturated
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ _source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    jointDeletion.uPacket.B₂ =
        (SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1 ∧
      jointDeletion.vPacket.B₂ =
        (SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1 ∧
      jointDeletion.uPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∧
      jointDeletion.vPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∧
      jointDeletion.uPacket.B₁ ∩ jointDeletion.uPacket.B₂ =
        ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho ∧
      jointDeletion.vPacket.B₁ ∩ jointDeletion.vPacket.B₂ =
        ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho := by
  classical
  have hzClass : jointDeletion.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho :=
    jointDeletion.deleted_mem_class
  have hzCard :
      ((SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1).card = 4 := by
    rw [Finset.card_erase_of_mem hzClass, hclassFive]
  -- The apex-side four-set of a certificate is the punctured physical class.
  have hapex :
      ∀ (B : Finset ℝ²) (row : U5QDeletedK4Class D jointDeletion.deleted.1 S.oppApex2 B),
        B.card = 4 → B = (SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1 := by
    intro B row hBcard
    have hsub : B ⊆ SelectedClass (D.A.erase jointDeletion.deleted.1) S.oppApex2 row.radius := by
      intro y hy
      refine mem_selectedClass.mpr ⟨?_, row.same_radius y hy⟩
      have hy' := row.subset hy
      have hy'' : y ∈ D.skeleton jointDeletion.deleted.1 :=
        Finset.mem_of_mem_erase hy'
      simpa [CounterexampleData.skeleton] using hy''
    have hwitness :
        4 ≤ (SelectedClass (D.A.erase jointDeletion.deleted.1) S.oppApex2 row.radius).card :=
      le_trans (le_of_eq hBcard.symm) (Finset.card_le_card hsub)
    have hexact :
        SelectedClass (D.A.erase jointDeletion.deleted.1) S.oppApex2 row.radius =
          (SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1 :=
      c1_apexWitness_exactification R _hcard _surface rho _source _other _hrho
        _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
        jointDeletion hclassFive globalDeletion hcenter _hsourceBlockerClass
        _huNeSource _hsourceBlockerPlacement jointDeletion.deleted.1 hzClass
        row.radius row.radius_pos hwitness
    rw [hexact] at hsub
    exact Finset.eq_of_subset_of_card_le hsub (by rw [hBcard, hzCard])
  have huB₂ :
      jointDeletion.uPacket.B₂ =
        (SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1 :=
    hapex _ jointDeletion.uPacket.row₂ jointDeletion.uPacket.B₂_card
  have hvB₂ :
      jointDeletion.vPacket.B₂ =
        (SelectedClass D.A S.oppApex2 rho).erase jointDeletion.deleted.1 :=
    hapex _ jointDeletion.vPacket.row₂ jointDeletion.vPacket.B₂_card
  have huB₁ :
      jointDeletion.uPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support :=
    commonDeletion_B₁_eq_lateRow u.2 jointDeletion.uPacket
  have hvB₁ :
      jointDeletion.vPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support :=
    commonDeletion_B₁_eq_lateRow v.2 jointDeletion.vPacket
  refine ⟨huB₂, hvB₂, huB₁, hvB₁, ?_, ?_⟩
  · rw [huB₁, huB₂]
    ext x
    simp only [Finset.mem_inter, Finset.mem_erase]
    constructor
    · rintro ⟨hx1, -, hx3⟩
      exact ⟨hx1, hx3⟩
    · rintro ⟨hx1, hx2⟩
      refine ⟨hx1, ?_, hx2⟩
      rintro rfl
      exact jointDeletion.deleted_not_mem_uRow hx1
  · rw [hvB₁, hvB₂]
    ext x
    simp only [Finset.mem_inter, Finset.mem_erase]
    constructor
    · rintro ⟨hx1, -, hx3⟩
      exact ⟨hx1, hx3⟩
    · rintro ⟨hx1, hx2⟩
      refine ⟨hx1, ?_, hx2⟩
      rintro rfl
      exact jointDeletion.deleted_not_mem_vRow hx1

/- ## Leaf C2 — nonphysical equal-radius collision
(`globalDeletion.center ≠ S.oppApex2`)

The hypothesis block below is verbatim C2
(`FrontierLiveClosure.lean:5487–5530`), except that the collision hypothesis
`_hcollision` is presented through its witnesses `s`, `t`; those are obtained
in the leaf by `obtain ⟨s, hs, t, ht, hst, hdist⟩ := _hcollision`. -/

#print axioms Problem97.CPackageBank.c1_jointDeletion_certificates_saturated

/-- **C2.1.**  The equal-radius collision produces a second *complete
five-point* circle class, centred at the nonphysical global center, meeting the
physical class in exactly the collision pair — and that pair is exactly the
part of the global deletion lying on it. -/
theorem c2_collisionClass_exact
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    0 < dist globalDeletion.center s ∧
      (SelectedClass D.A globalDeletion.center
        (dist globalDeletion.center s)).card = 5 ∧
      SelectedClass D.A globalDeletion.center (dist globalDeletion.center s) ∩
          SelectedClass D.A S.oppApex2 rho = ({s, t} : Finset ℝ²) ∧
      SelectedClass D.A globalDeletion.center (dist globalDeletion.center s) ∩
          globalDeletion.deleted = ({s, t} : Finset ℝ²) := by
  classical
  obtain ⟨hrpos, hfour⟩ :=
    restored_class_card_ge_four globalDeletion.blocked (globalDeletion.restores s hs)
  set K := SelectedClass D.A globalDeletion.center (dist globalDeletion.center s)
    with hKdef
  have hsC : s ∈ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class hs
  have htC : t ∈ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class ht
  have hsA : s ∈ D.A := (mem_selectedClass.mp hsC).1
  have htA : t ∈ D.A := (mem_selectedClass.mp htC).1
  have hsK : s ∈ K := mem_selectedClass.mpr ⟨hsA, rfl⟩
  have htK : t ∈ K := mem_selectedClass.mpr ⟨htA, hdist.symm⟩
  have htErase : t ∈ globalDeletion.deleted.erase s :=
    Finset.mem_erase.mpr ⟨Ne.symm hst, ht⟩
  have hnotSdiff : t ∉ K \ globalDeletion.deleted.erase s := by
    simp [Finset.mem_sdiff, htErase]
  have hins : insert t (K \ globalDeletion.deleted.erase s) ⊆ K := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact htK
    · exact (Finset.mem_sdiff.mp hx).1
  have hKfive : 5 ≤ K.card := by
    have h1 := Finset.card_le_card hins
    rw [Finset.card_insert_of_notMem hnotSdiff] at h1
    omega
  have hKC : (K ∩ SelectedClass D.A S.oppApex2 rho).card ≤ 2 :=
    selectedClass_inter_card_le_two hcenter
  have hpairCard : ({s, t} : Finset ℝ²).card = 2 := Finset.card_pair hst
  have hpairSub :
      ({s, t} : Finset ℝ²) ⊆ K ∩ SelectedClass D.A S.oppApex2 rho := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr ⟨hsK, hsC⟩
    · rw [Finset.mem_singleton] at hx
      subst hx
      exact Finset.mem_inter.mpr ⟨htK, htC⟩
  have hKCeq : K ∩ SelectedClass D.A S.oppApex2 rho = ({s, t} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hpairSub (by rw [hpairCard]; exact hKC)).symm
  have hKE : K ∩ globalDeletion.deleted = ({s, t} : Finset ℝ²) := by
    refine Finset.Subset.antisymm ?_ ?_
    · intro x hx
      rw [Finset.mem_inter] at hx
      have hx' : x ∈ K ∩ SelectedClass D.A S.oppApex2 rho :=
        Finset.mem_inter.mpr ⟨hx.1, globalDeletion.deleted_subset_class hx.2⟩
      rwa [hKCeq] at hx'
    · intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Finset.mem_inter.mpr ⟨hsK, hs⟩
      · rw [Finset.mem_singleton] at hx
        subst hx
        exact Finset.mem_inter.mpr ⟨htK, ht⟩
  have hblock : ¬ (4 ≤ (K \ globalDeletion.deleted).card) := by
    intro h
    refine globalDeletion.blocked ⟨dist globalDeletion.center s, hrpos, ?_⟩
    rw [selectedClass_sdiff]
    exact h
  have hsdcard : (K \ globalDeletion.deleted).card = K.card - 2 := by
    rw [Finset.card_sdiff, Finset.inter_comm, hKE, hpairCard]
  have hlt : (K \ globalDeletion.deleted).card < 4 := not_le.mp hblock
  exact ⟨hrpos, by omega, hKCeq, hKE⟩

#print axioms Problem97.CPackageBank.c2_collisionClass_exact

/-- **C2.2 (a).**  The nonphysical global center carries a five-point class, so
it is fully deletion robust. -/
theorem c2_center_fullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    FullyDeletionRobustAt D globalDeletion.center := by
  classical
  obtain ⟨hrpos, hKcard, -, -⟩ :=
    c2_collisionClass_exact R _hcard _surface rho _source _other _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion hcenter s t hs ht hst hdist
  exact fullyDeletionRobustAt_of_large_class hrpos (le_of_eq hKcard.symm)

#print axioms Problem97.CPackageBank.c2_center_fullyDeletionRobust

/-- **C2.2 (b).**  No late blocker is the nonphysical global center, and none is
the physical second apex: both centers are fully deletion robust, while every
late blocker is a unique-four center. -/
theorem c2_lateBlocker_ne_center_and_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    ∀ (x : ℝ²) (hx : x ∈ D.A),
      (lateFirstApexSystem R).centerAt x hx ≠ globalDeletion.center ∧
        (lateFirstApexSystem R).centerAt x hx ≠ S.oppApex2 := by
  classical
  have hrobP : FullyDeletionRobustAt D globalDeletion.center :=
    c2_center_fullyDeletionRobust R _hcard surface rho _source _other _hrho _hfive
      u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion hcenter s t hs ht hst hdist
  intro x hx
  have hunique := isUniqueFourCenter_centerAt (lateFirstApexSystem R) x hx
  refine ⟨?_, ?_⟩
  · intro heq
    exact not_isUniqueFourCenter_of_fullyDeletionRobust hrobP (heq ▸ hunique)
  · intro heq
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust surface.secondApex_robust
        (heq ▸ hunique)

#print axioms Problem97.CPackageBank.c2_lateBlocker_ne_center_and_secondApex

/-- **C2.3.**  The nonphysical global center is not the first apex: a five-point
K4 class there would have to sit at the unique first-apex radius, whose complete
class has exactly four members. -/
theorem c2_center_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    globalDeletion.center ≠ S.oppApex1 := by
  classical
  obtain ⟨hrpos, hKcard, -, -⟩ :=
    c2_collisionClass_exact R _hcard _surface rho _source _other _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion hcenter s t hs ht hst hdist
  intro heq
  rw [heq] at hrpos hKcard
  have hfour :
      4 ≤ (SelectedClass D.A S.oppApex1 (dist S.oppApex1 s)).card := by
    rw [hKcard]
    omega
  have hrad : dist S.oppApex1 s = radius := R.unique_K4_radius _ hrpos hfour
  rw [hrad, R.class_card_eq_four] at hKcard
  omega

#print axioms Problem97.CPackageBank.c2_center_ne_firstApex

/-- **C2.3, corollary.**  The global center, the first apex and the physical
second apex are three pairwise-distinct carrier points. -/
theorem c2_apexPair_distinct_carrier_centers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    globalDeletion.center ∈ D.A ∧ S.oppApex1 ∈ D.A ∧ S.oppApex2 ∈ D.A ∧
      globalDeletion.center ≠ S.oppApex1 ∧
        globalDeletion.center ≠ S.oppApex2 ∧ S.oppApex1 ≠ S.oppApex2 := by
  classical
  refine
    ⟨(Finset.mem_sdiff.mp globalDeletion.center_mem_remaining).1,
      firstApex_mem_A S, jointDeletion.uPacket.center₂_mem_A, ?_, hcenter,
      oppApex1_ne_oppApex2 S⟩
  exact
    c2_center_ne_firstApex R _hcard _surface rho _source _other _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion hcenter s t hs ht hst hdist

#print axioms Problem97.CPackageBank.c2_apexPair_distinct_carrier_centers

/-- **C2.4 (a).**  No late row contains both collision points: its center, the
physical second apex and the global center would be three distinct carrier
points on the perpendicular bisector of the collision pair. -/
theorem c2_no_lateRow_contains_collisionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    ∀ (x : ℝ²) (hx : x ∈ D.A),
      s ∈ ((lateFirstApexSystem R).selectedAt x hx).toCriticalFourShell.support →
        t ∉
          ((lateFirstApexSystem R).selectedAt x hx).toCriticalFourShell.support := by
  classical
  have hne :=
    c2_lateBlocker_ne_center_and_secondApex R _hcard surface rho _source _other
      _hrho _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion hcenter s t hs ht hst hdist
  have hsC : s ∈ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class hs
  have htC : t ∈ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class ht
  have hsA : s ∈ D.A := (mem_selectedClass.mp hsC).1
  have htA : t ∈ D.A := (mem_selectedClass.mp htC).1
  have hapexA : S.oppApex2 ∈ D.A := jointDeletion.uPacket.center₂_mem_A
  have hPA : globalDeletion.center ∈ D.A :=
    (Finset.mem_sdiff.mp globalDeletion.center_mem_remaining).1
  intro x hx hsRow htRow
  have hbA : (lateFirstApexSystem R).centerAt x hx ∈ D.A :=
    Finset.mem_of_mem_erase
      ((lateFirstApexSystem R).selectedAt x hx).toCriticalFourShell.center_mem
  have hbBis :
      dist ((lateFirstApexSystem R).centerAt x hx) s =
        dist ((lateFirstApexSystem R).centerAt x hx) t :=
    (((lateFirstApexSystem R).selectedAt x hx).toCriticalFourShell.support_eq_radius
        s hsRow).trans
      (((lateFirstApexSystem R).selectedAt x hx).toCriticalFourShell.support_eq_radius
        t htRow).symm
  have hapexBis : dist S.oppApex2 s = dist S.oppApex2 t :=
    (mem_selectedClass.mp hsC).2.trans (mem_selectedClass.mp htC).2.symm
  have hbound :
      (D.A.filter (fun p ↦ dist p s = dist p t)).card ≤ 2 :=
    Problem97.Dumitrescu.perpBisector_apex_bound D.convex hsA htA hst
  have hthree : 2 < (D.A.filter (fun p ↦ dist p s = dist p t)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨(lateFirstApexSystem R).centerAt x hx,
        Finset.mem_filter.mpr ⟨hbA, hbBis⟩,
        S.oppApex2, Finset.mem_filter.mpr ⟨hapexA, hapexBis⟩,
        globalDeletion.center, Finset.mem_filter.mpr ⟨hPA, hdist⟩,
        (hne x hx).2, (hne x hx).1, fun h ↦ hcenter h.symm⟩
  omega

#print axioms Problem97.CPackageBank.c2_no_lateRow_contains_collisionPair

/-- **C2.4 (b).**  The collision pair mutually omits its own late rows, and the
two collision points have distinct late blockers. -/
theorem c2_collision_mutual_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t)
    (hsA : s ∈ D.A) (htA : t ∈ D.A) :
    t ∉ ((lateFirstApexSystem R).selectedAt s hsA).toCriticalFourShell.support ∧
      s ∉ ((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt s hsA ≠
        (lateFirstApexSystem R).centerAt t htA := by
  classical
  have hnoRow :=
    c2_no_lateRow_contains_collisionPair R _hcard surface rho _source _other _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion hcenter s t hs ht hst hdist
  have hsRow :
      s ∈ ((lateFirstApexSystem R).selectedAt s hsA).toCriticalFourShell.support :=
    ((lateFirstApexSystem R).selectedAt s hsA).toCriticalFourShell.q_mem_support
  have htRow :
      t ∈ ((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.support :=
    ((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.q_mem_support
  have hfirst :
      t ∉
        ((lateFirstApexSystem R).selectedAt s hsA).toCriticalFourShell.support :=
    hnoRow s hsA hsRow
  refine ⟨hfirst, ?_, ?_⟩
  · intro hmem
    exact (hnoRow t htA hmem) htRow
  · intro heq
    have h1 :=
      uniqueFourClass_centerAt_eq_selectedAt_support (lateFirstApexSystem R) s hsA
    have h2 :=
      uniqueFourClass_centerAt_eq_selectedAt_support (lateFirstApexSystem R) t htA
    have hsupp :
        ((lateFirstApexSystem R).selectedAt s hsA).toCriticalFourShell.support =
          ((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.support :=
      h1.symm.trans ((congrArg (uniqueFourClass D.A) heq).trans h2)
    exact hfirst (by rw [hsupp]; exact htRow)

#print axioms Problem97.CPackageBank.c2_collision_mutual_omission

/-- **C2.5.**  Placement census of the collision pair inside the rigid
decomposition `Γ₂ = {z★} ⊔ I_u ⊔ I_v`: the pair is never contained in a single
two-point row trace, so it is either split across `I_u` and `I_v`, or it uses
`z★` together with one point of `I_u ∪ I_v`. -/
theorem c2_collision_placement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center ≠ S.oppApex2)
    (s t : ℝ²)
    (hs : s ∈ globalDeletion.deleted) (ht : t ∈ globalDeletion.deleted)
    (hst : s ≠ t)
    (hdist :
      dist globalDeletion.center s = dist globalDeletion.center t) :
    let Iu :=
      ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho
    let Iv :=
      ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho
    ¬ (s ∈ Iu ∧ t ∈ Iu) ∧ ¬ (s ∈ Iv ∧ t ∈ Iv) ∧
      ((s ∈ Iu ∧ t ∈ Iv) ∨ (s ∈ Iv ∧ t ∈ Iu) ∨
        (s = jointDeletion.deleted.1 ∧ (t ∈ Iu ∨ t ∈ Iv)) ∨
        (t = jointDeletion.deleted.1 ∧ (s ∈ Iu ∨ s ∈ Iv))) := by
  classical
  intro Iu Iv
  have hnoRow :=
    c2_no_lateRow_contains_collisionPair R _hcard surface rho _source _other _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion hcenter s t hs ht hst hdist
  have hnotU : ¬ (s ∈ Iu ∧ t ∈ Iu) := by
    rintro ⟨hsu, htu⟩
    exact
      hnoRow u.1 u.2 (Finset.mem_inter.mp hsu).1 (Finset.mem_inter.mp htu).1
  have hnotV : ¬ (s ∈ Iv ∧ t ∈ Iv) := by
    rintro ⟨hsv, htv⟩
    exact
      hnoRow v.1 v.2 (Finset.mem_inter.mp hsv).1 (Finset.mem_inter.mp htv).1
  refine ⟨hnotU, hnotV, ?_⟩
  obtain ⟨-, -, -, hCeq⟩ := globalDeletion.rigid
  have hsC : s ∈ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class hs
  have htC : t ∈ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class ht
  rw [hCeq] at hsC htC
  rcases Finset.mem_insert.mp hsC with hsz | hsUV
  · rcases Finset.mem_insert.mp htC with htz | htUV
    · exact absurd (hsz.trans htz.symm) hst
    · exact Or.inr (Or.inr (Or.inl ⟨hsz, Finset.mem_union.mp htUV⟩))
  · rcases Finset.mem_insert.mp htC with htz | htUV
    · exact Or.inr (Or.inr (Or.inr ⟨htz, Finset.mem_union.mp hsUV⟩))
    · rcases Finset.mem_union.mp hsUV with hsu | hsv
      · rcases Finset.mem_union.mp htUV with htu | htv
        · exact absurd ⟨hsu, htu⟩ hnotU
        · exact Or.inl ⟨hsu, htv⟩
      · rcases Finset.mem_union.mp htUV with htu | htv
        · exact Or.inr (Or.inl ⟨hsv, htu⟩)
        · exact absurd ⟨hsv, htv⟩ hnotV

#print axioms Problem97.CPackageBank.c2_collision_placement

end CPackageBank
end Problem97
