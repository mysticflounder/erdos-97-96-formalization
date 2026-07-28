import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# B2 arm 3 and the live B1 leaf (scratch bank)

Kernel-checked, `sorry`-free follow-up to `BFamilyBank.lean`.  The round-1
B-family report named exactly one open direction, "B2 arm 3"
(`z₁ = β(z₂)`), whose missing input was radius-uniqueness at the blocker
center `β(z₂)`.

This file

* banks that radius-uniqueness statement in public, general form for an
  arbitrary `CriticalShellSystem` (§1),
* instantiates it on B2 arm 3 and records exactly what arm 3 then yields
  (§2), and
* transports the same input to the **live** B1 leaf
  `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
  (`FrontierLiveClosure.lean:695`), showing that the four data the live leaf
  must "deliberately reconstruct" are one-step consequences of its own
  binders, and that the leaf therefore reduces exactly to (B1-gap) (§3).

Nothing here is wired into the production files; these are BANK theorems only.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace B2Arm3

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailFrontierLiveClosure
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/- ## §1 Radius uniqueness at an arbitrary blocker center

The only input is `CriticalShellSystem.no_qfree`: if a positive radius `s` at
the chosen blocker center of `q` carried four or more ambient points and `q`
were not one of them, the whole `s`-class would survive deleting `q`. -/

/-- **Radius uniqueness at a blocker center.**  At `H.centerAt q hq` the only
positive radius carrying four or more ambient points is the chosen critical
shell radius.  No exactness, minimality or cap hypothesis is used. -/
theorem criticalShell_radius_unique {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) {s : ℝ} (hs : 0 < s)
    (hfour : 4 ≤ (SelectedClass A (H.centerAt q hq) s).card) :
    s = (H.selectedAt q hq).toCriticalFourShell.radius := by
  classical
  have hqClass : q ∈ SelectedClass A (H.centerAt q hq) s := by
    by_contra hqClass
    refine H.no_qfree_at q hq ⟨s, hs, ?_⟩
    change 4 ≤ (SelectedClass (A.erase q) (H.centerAt q hq) s).card
    rw [selectedClass_erase_card_eq_of_not_mem hqClass]
    exact hfour
  calc
    s = dist (H.centerAt q hq) q := (mem_selectedClass.mp hqClass).2.symm
    _ = (H.selectedAt q hq).toCriticalFourShell.radius :=
      (H.selectedAt q hq).toCriticalFourShell.support_eq_radius q
        (H.selectedAt q hq).toCriticalFourShell.q_mem_support

/-- **Unique-four center.**  Every ambient radius class of size at least four
centred at a chosen blocker center *is* that center's canonical critical
shell.  In particular such a class has exactly four points. -/
theorem criticalShell_selectedClass_eq_support {A : Finset ℝ²}
    (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) {s : ℝ} (hs : 0 < s)
    (hfour : 4 ≤ (SelectedClass A (H.centerAt q hq) s).card) :
    SelectedClass A (H.centerAt q hq) s =
      (H.selectedAt q hq).toCriticalFourShell.support := by
  classical
  have hrad : s = (H.selectedAt q hq).toCriticalFourShell.radius :=
    criticalShell_radius_unique H q hq hs hfour
  ext x
  rw [mem_selectedClass]
  constructor
  · rintro ⟨hxA, hxdist⟩
    exact (H.selectedAt q hq).toCriticalFourShell.off_row_named_label_forbidden
      hxA (hrad ▸ hxdist)
  · intro hx
    exact ⟨(H.selectedAt q hq).toCriticalFourShell.support_subset_A hx,
      ((H.selectedAt q hq).toCriticalFourShell.support_eq_radius x hx).trans
        hrad.symm⟩

/-- **Erase criterion at a blocker center.**  Deleting `y` preserves a
four-point equidistant class at `H.centerAt q hq` exactly when `y` avoids the
canonical shell of `q`.

This restates the production lemma
`ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`
in the shape used below; it is banked here only so that the arm-3 and live-B1
instantiations are self-contained. -/
theorem criticalShell_survives_iff_not_mem_support {A : Finset ℝ²}
    (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) (y : ℝ²) :
    HasNEquidistantPointsAt 4 (A.erase y) (H.centerAt q hq) ↔
      y ∉ (H.selectedAt q hq).toCriticalFourShell.support :=
  cross_deletion_survives_iff_not_mem_selected_support H hq

/-- **Blocker fibers sit on one circle.**  If `y` and `q` have the same chosen
blocker center then `y` lies on the canonical shell of `q`; hence the fiber of
a blocker center is contained in a single four-point ambient radius class. -/
theorem mem_support_of_centerAt_eq {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) (y : ℝ²) (hy : y ∈ A)
    (hcenter : H.centerAt y hy = H.centerAt q hq) :
    y ∈ (H.selectedAt q hq).toCriticalFourShell.support := by
  by_contra hmem
  refine H.no_qfree_at y hy ?_
  rw [hcenter]
  exact (criticalShell_survives_iff_not_mem_support H q hq y).mpr hmem

/-- **Blocker multiplicity bound.**  At most four carrier points share any one
chosen blocker center. -/
theorem blockerFiber_card_le_four {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) :
    (A.filter fun y ↦ ∀ hy : y ∈ A, H.centerAt y hy = H.centerAt q hq).card
      ≤ 4 := by
  classical
  have hsub :
      (A.filter fun y ↦ ∀ hy : y ∈ A, H.centerAt y hy = H.centerAt q hq) ⊆
        (H.selectedAt q hq).toCriticalFourShell.support := by
    intro y hy
    rcases Finset.mem_filter.mp hy with ⟨hyA, hyc⟩
    exact mem_support_of_centerAt_eq H q hq y hyA (hyc hyA)
  calc
    _ ≤ (H.selectedAt q hq).toCriticalFourShell.support.card :=
      Finset.card_le_card hsub
    _ = 4 := (H.selectedAt q hq).toCriticalFourShell.support_card

/-- **Collision normal form.**  If a carrier point `c` *is* the chosen blocker
center of some source `x`, then `Row(x)` is the unique ambient radius class of
size at least four centred at `c`, `c` itself is off that class, and single
deletions survive at `c` exactly off that class.

This is the whole content a source–center coincidence supplies; it produces no
positive row incidence at `c`. -/
theorem criticalShell_collision_normalForm {A : Finset ℝ²}
    (H : CriticalShellSystem A) (x : ℝ²) (hx : x ∈ A) {c : ℝ²}
    (hc : c = H.centerAt x hx) :
    c ∉ (H.selectedAt x hx).toCriticalFourShell.support ∧
      (∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass A c s).card →
          SelectedClass A c s =
            (H.selectedAt x hx).toCriticalFourShell.support) ∧
      (∀ y : ℝ², HasNEquidistantPointsAt 4 (A.erase y) c ↔
          y ∉ (H.selectedAt x hx).toCriticalFourShell.support) := by
  subst hc
  exact ⟨(H.selectedAt x hx).toCriticalFourShell.center_not_mem_support,
    fun s hs hfour ↦ criticalShell_selectedClass_eq_support H x hx hs hfour,
    fun y ↦ criticalShell_survives_iff_not_mem_support H x hx y⟩

/- ## §2 B2 arm 3

The hypothesis block is verbatim B2
(`FrontierLiveClosure.lean:1150–1217`), except that the leaf's three-way
`_hcollision` disjunction is replaced by its third disjunct — that is exactly
"arm 3", the case any leaf proof must handle separately. -/

/-- **Arm-3 unique row.**  With `z₁ = β(z₂)`, the canonical shell of `z₂` is
the *only* ambient radius class of size at least four centred at `z₁`, it has
radius `d(z₁,z₂)`, and `z₁` itself is excluded from it. -/
theorem b2_arm3_unique_row
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
        S.oppApex2)
    -- arm 3 of `_hcollision`
    (hcollision :
      first.deleted.1 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support =
        SelectedClass D.A first.deleted.1
          (dist first.deleted.1 second.deleted.1) ∧
      (∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass D.A first.deleted.1 s).card →
          SelectedClass D.A first.deleted.1 s =
            ((lateFirstApexSystem R).selectedAt
              second.deleted.1 second.deleted.2).toCriticalFourShell.support) ∧
      first.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
  classical
  set K :=
    ((lateFirstApexSystem R).selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell with hK
  have hradius : K.radius = dist first.deleted.1 second.deleted.1 := by
    rw [hcollision]
    exact (K.support_eq_radius second.deleted.1 K.q_mem_support).symm
  refine ⟨?_, ?_, ?_⟩
  · ext x
    rw [mem_selectedClass]
    constructor
    · intro hx
      refine ⟨K.support_subset_A hx, ?_⟩
      calc
        dist first.deleted.1 x
            = dist ((lateFirstApexSystem R).centerAt
                second.deleted.1 second.deleted.2) x := by rw [hcollision]
        _ = K.radius := K.support_eq_radius x hx
        _ = dist first.deleted.1 second.deleted.1 := hradius
    · rintro ⟨hxA, hxdist⟩
      refine K.off_row_named_label_forbidden hxA ?_
      calc
        dist ((lateFirstApexSystem R).centerAt
              second.deleted.1 second.deleted.2) x
            = dist first.deleted.1 x := by rw [hcollision]
        _ = dist first.deleted.1 second.deleted.1 := hxdist
        _ = K.radius := hradius.symm
  · intro s hs hfour
    rw [hcollision] at hfour ⊢
    exact criticalShell_selectedClass_eq_support (lateFirstApexSystem R)
      second.deleted.1 second.deleted.2 hs hfour
  · rw [hcollision]
    exact K.center_not_mem_support

/-- **Arm-3 erase criterion.**  With `z₁ = β(z₂)`, deleting `y` preserves a
four-point equidistant class at `z₁` exactly when `y` avoids `Row(z₂)`. -/
theorem b2_arm3_survives_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hcollision :
      first.deleted.1 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ∀ y : ℝ²,
      HasNEquidistantPointsAt 4 (D.A.erase y) first.deleted.1 ↔
        y ∉
          ((lateFirstApexSystem R).selectedAt
            second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
  classical
  intro y
  rw [hcollision]
  exact criticalShell_survives_iff_not_mem_support (lateFirstApexSystem R)
    second.deleted.1 second.deleted.2 y

/-- **Arm-3 blocker fiber.**  With `z₁ = β(z₂)`, every carrier point whose
chosen blocker is `z₁` lies on `Row(z₂)`, so at most four points are blocked
at `z₁`. -/
theorem b2_arm3_blockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hcollision :
      first.deleted.1 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    (∀ y : ℝ², ∀ hy : y ∈ D.A,
        (lateFirstApexSystem R).centerAt y hy = first.deleted.1 →
          y ∈
            ((lateFirstApexSystem R).selectedAt
              second.deleted.1 second.deleted.2).toCriticalFourShell.support) ∧
      (D.A.filter fun y ↦ ∀ hy : y ∈ D.A,
          (lateFirstApexSystem R).centerAt y hy = first.deleted.1).card ≤ 4 := by
  classical
  constructor
  · intro y hy hcenter
    exact mem_support_of_centerAt_eq (lateFirstApexSystem R) second.deleted.1
      second.deleted.2 y hy (hcenter.trans hcollision)
  · have hrw :
        (D.A.filter fun y ↦ ∀ hy : y ∈ D.A,
            (lateFirstApexSystem R).centerAt y hy = first.deleted.1) =
          D.A.filter fun y ↦ ∀ hy : y ∈ D.A,
            (lateFirstApexSystem R).centerAt y hy =
              (lateFirstApexSystem R).centerAt second.deleted.1
                second.deleted.2 := by
      rw [hcollision]
    rw [hrw]
    exact blockerFiber_card_le_four (lateFirstApexSystem R) second.deleted.1
      second.deleted.2

/-- **B2 uniform collision normal form.**  Hypothesis list *verbatim* B2
(`FrontierLiveClosure.lean:1150–1217`), including the three-way `_hcollision`
disjunction as the leaf receives it.

All three arms collapse to one picture: the collided source `z₁` is the chosen
blocker center of some carrier point `x` (`x = u`, `x = v` or `x = z₂`), and
then `Row(x)` is the unique four-point ambient radius class at `z₁`, `z₁` is
off it, and a single deletion survives at `z₁` exactly off it.  No arm yields a
positive row incidence at `z₁`, and none yields `False`. -/
theorem b2_collision_uniform_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hcollision :
      first.deleted.1 = (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 = (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    ∃ x : CarrierVertex D.A,
      first.deleted.1 = (lateFirstApexSystem R).centerAt x.1 x.2 ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            x.1 x.2).toCriticalFourShell.support ∧
        (∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass D.A first.deleted.1 s).card →
            SelectedClass D.A first.deleted.1 s =
              ((lateFirstApexSystem R).selectedAt
                x.1 x.2).toCriticalFourShell.support) ∧
        (∀ y : ℝ²,
          HasNEquidistantPointsAt 4 (D.A.erase y) first.deleted.1 ↔
            y ∉
              ((lateFirstApexSystem R).selectedAt
                x.1 x.2).toCriticalFourShell.support) := by
  classical
  rcases hcollision with hc | hc | hc
  · exact ⟨u, hc,
      criticalShell_collision_normalForm (lateFirstApexSystem R) u.1 u.2 hc⟩
  · exact ⟨v, hc,
      criticalShell_collision_normalForm (lateFirstApexSystem R) v.1 v.2 hc⟩
  · exact ⟨second.deleted, hc,
      criticalShell_collision_normalForm (lateFirstApexSystem R)
        second.deleted.1 second.deleted.2 hc⟩

/-- **Arm-3 class survivals.**  In arm 3 at least three points of the physical
second-apex class lie off `Row(z₂)`, and deleting any of them preserves a
four-point equidistant class at `z₁ = β(z₂)`.  Positive information, not a
contradiction. -/
theorem b2_arm3_three_class_survivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠
        S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hcollision :
      first.deleted.1 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    3 ≤ (SelectedClass D.A S.oppApex2 rho \
          ((lateFirstApexSystem R).selectedAt
            second.deleted.1 second.deleted.2).toCriticalFourShell.support).card
      ∧ ∀ y ∈ SelectedClass D.A S.oppApex2 rho \
            ((lateFirstApexSystem R).selectedAt
              second.deleted.1 second.deleted.2).toCriticalFourShell.support,
          HasNEquidistantPointsAt 4 (D.A.erase y) first.deleted.1 := by
  classical
  set C := SelectedClass D.A S.oppApex2 rho with hC
  set Row :=
    ((lateFirstApexSystem R).selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.support with hRow
  have hinter : (Row ∩ C).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R surface second.deleted
  have hinter' : (C ∩ Row).card ≤ 2 := by
    rwa [Finset.inter_comm] at hinter
  have hcover : C ⊆ (C ∩ Row) ∪ (C \ Row) := by
    intro x hx
    by_cases hxRow : x ∈ Row
    · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hx, hxRow⟩)
    · exact Finset.mem_union_right _ (Finset.mem_sdiff.mpr ⟨hx, hxRow⟩)
  have hle : C.card ≤ (C ∩ Row).card + (C \ Row).card :=
    le_trans (Finset.card_le_card hcover)
      (Finset.card_union_le (C ∩ Row) (C \ Row))
  refine ⟨by omega, ?_⟩
  intro y hy
  refine (b2_arm3_survives_iff R _hcard surface rho _hrho hfive u v _huNeV
    _huClass _hvClass _hvOmitted _huOmitted first second _hdeletedNe
    _hdeletedBlockersNe _hfirstBlockerNeU _hfirstBlockerNeV
    _hfirstBlockerNeApex _hsecondBlockerNeU _hsecondBlockerNeV
    _hsecondBlockerNeApex _crossPacket hcollision y).mpr ?_
  exact (Finset.mem_sdiff.mp hy).2

/- ## §3 The live B1 leaf

Hypothesis block verbatim from the live leaf
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
(`FrontierLiveClosure.lean:695–726`); the only edits are dropping the `_`
linter prefix from binders the proofs use.

The leaf's docstring says support equality, cross-membership and the exact
intersection count are "deliberately reconstructed inside this leaf".  The
theorems below carry out that reconstruction. -/

/-- **Live B1 normal form.**  Blocker equality alone forces the two canonical
shells to coincide, each deleted source to lie on the other's shell, and the
common shell to meet the physical second-apex class in exactly the two deleted
sources. -/
theorem b1_live_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support ∧
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support ∧
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2) := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := fun h ↦
    hdeletedNe (Subtype.ext h)
  have hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support :=
    selectedSupports_eq_of_actualBlockers_eq (lateFirstApexSystem R)
      first.deleted.2 second.deleted.2 hblockersEq
  have hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
    rw [← hsupportsEq]
    exact ((lateFirstApexSystem R).selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
  have hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
    rw [hsupportsEq]
    exact ((lateFirstApexSystem R).selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.q_mem_support
  refine ⟨hsupportsEq, hfirstMemSecondRow, hsecondMemFirstRow, ?_⟩
  have hle :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card ≤ 2) :=
    actualLateRow_secondClass_card_le_two R surface first.deleted
  have hz₁ :
      first.deleted.1 ∈
        ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho)) :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support,
        first.deleted_mem_class⟩
  have hz₂ :
      second.deleted.1 ∈
        ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho)) :=
    Finset.mem_inter.mpr ⟨hsecondMemFirstRow, second.deleted_mem_class⟩
  have hge :
      2 ≤
        ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card) := by
    have hpair :
        ({first.deleted.1, second.deleted.1} : Finset ℝ²) ⊆
          ((((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)) := by
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hz₁
      · rw [Finset.mem_singleton] at hx
        exact hx ▸ hz₂
    calc
      2 = ({first.deleted.1, second.deleted.1} : Finset ℝ²).card :=
        (Finset.card_pair hne).symm
      _ ≤ _ := Finset.card_le_card hpair
  omega

/-- **Live B1 bisector saturation.**  Under the live leaf's own binders the
carrier points equidistant from the two deleted sources are exactly the common
actual blocker and the physical second apex. -/
theorem b1_live_bisectorSet_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    D.A.filter (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1) =
      ({(lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2,
          S.oppApex2} : Finset ℝ²) := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := fun h ↦
    hdeletedNe (Subtype.ext h)
  obtain ⟨_, _, hsecondMemFirstRow, _⟩ :=
    b1_live_normalForm R _hcard surface rho _hrho _hfive u v _huNeV _huClass
      _hvClass _hvOmitted _huOmitted first second hdeletedNe hblockersEq
  have hbNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2 := first.uPacket.actual_blocker_ne_center₂
  have hbA :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ∈ D.A :=
    (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem).2
  have haA : S.oppApex2 ∈ D.A := first.uPacket.center₂_mem_A
  have hbBisects :
      dist ((lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
          first.deleted.1 =
        dist ((lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2) second.deleted.1 := by
    have h₁ :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
        first.deleted.1
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
    have h₂ :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
        second.deleted.1 hsecondMemFirstRow
    exact h₁.trans h₂.symm
  have haBisects :
      dist S.oppApex2 first.deleted.1 = dist S.oppApex2 second.deleted.1 := by
    have h₁ := (mem_selectedClass.mp first.deleted_mem_class).2
    have h₂ := (mem_selectedClass.mp second.deleted_mem_class).2
    exact h₁.trans h₂.symm
  have hbound :
      (D.A.filter
        (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1)).card ≤ 2 :=
    Problem97.Dumitrescu.perpBisector_apex_bound D.convex first.deleted.2
      second.deleted.2 hne
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_filter.mpr ⟨hbA, hbBisects⟩
    · rw [Finset.mem_singleton] at hx
      exact hx ▸ Finset.mem_filter.mpr ⟨haA, haBisects⟩
  · rw [Finset.card_pair hbNeApex]
    exact hbound

/-- **Live B1 reduces exactly to (B1-gap).**  Under the live leaf's own
binders, any third carrier point equidistant from the two deleted sources
closes the leaf. -/
theorem b1_live_false_of_third_bisector_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    -- (B1-gap)
    (c : ℝ²) (hcA : c ∈ D.A)
    (hcNeBlocker :
      c ≠ (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
    (hcNeApex : c ≠ S.oppApex2)
    (hcBisects : dist c first.deleted.1 = dist c second.deleted.1) :
    False := by
  classical
  have hset :=
    b1_live_bisectorSet_eq_pair R _hcard surface rho _hrho _hfive u v _huNeV
      _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      hblockersEq
  have hc : c ∈ D.A.filter
      (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1) :=
    Finset.mem_filter.mpr ⟨hcA, hcBisects⟩
  rw [hset] at hc
  rcases Finset.mem_insert.mp hc with h | h
  · exact hcNeBlocker h
  · exact hcNeApex (Finset.mem_singleton.mp h)

/-- **Live B1 erase criterion.**  Under blocker equality, deleting `y`
preserves a four-point class at the common blocker exactly when `y` avoids the
common shell — a four-point set containing both deleted sources. -/
theorem b1_live_survives_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ∀ y : ℝ²,
      HasNEquidistantPointsAt 4 (D.A.erase y)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ↔
        y ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support :=
  fun y ↦
    criticalShell_survives_iff_not_mem_support (lateFirstApexSystem R)
      first.deleted.1 first.deleted.2 y

/- ## Axiom gate

Every bank theorem must show only Lean core axioms
(`propext`, `Classical.choice`, `Quot.sound`). -/

#print axioms criticalShell_radius_unique
#print axioms criticalShell_selectedClass_eq_support
#print axioms criticalShell_survives_iff_not_mem_support
#print axioms mem_support_of_centerAt_eq
#print axioms blockerFiber_card_le_four
#print axioms criticalShell_collision_normalForm
#print axioms b2_arm3_unique_row
#print axioms b2_arm3_survives_iff
#print axioms b2_arm3_blockerFiber
#print axioms b2_collision_uniform_normalForm
#print axioms b2_arm3_three_class_survivals
#print axioms b1_live_normalForm
#print axioms b1_live_bisectorSet_eq_pair
#print axioms b1_live_false_of_third_bisector_carrier
#print axioms b1_live_survives_iff

end B2Arm3
end Problem97
