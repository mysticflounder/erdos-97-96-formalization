import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CanonicalRowOverrideRebase

open scoped EuclideanGeometry

open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberRetainedRadiusSelector
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailDeletionRobustness
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer

attribute [local instance] Classical.propDecidable

private theorem exists_second_outside_two_pairs
    {α : Type*} [DecidableEq α]
    (K : Finset α) (q a b c d : α)
    (hKcard : K.card = 4)
    (hqOutside : q ∉ ({a, b, c, d} : Finset α))
    (hfirst : ¬ (a ∈ K ∧ b ∈ K))
    (hsecond : ¬ (c ∈ K ∧ d ∈ K)) :
    ∃ v ∈ K, v ≠ q ∧ v ∉ ({a, b, c, d} : Finset α) := by
  let E : Finset α := ({a, b, c, d} : Finset α)
  have hfirstCard : (K ∩ ({a, b} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hfirst ⟨hx.1, hy.1⟩)
    · exact False.elim (hfirst ⟨hy.1, hx.1⟩)
    · rfl
  have hsecondCard : (K ∩ ({c, d} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hsecond ⟨hx.1, hy.1⟩)
    · exact False.elim (hsecond ⟨hy.1, hx.1⟩)
    · rfl
  have hinterEq :
      K ∩ E =
        (K ∩ ({a, b} : Finset α)) ∪
          (K ∩ ({c, d} : Finset α)) := by
    ext x
    simp only [E, Finset.mem_inter, Finset.mem_union,
      Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hinterCard : (K ∩ E).card ≤ 2 := by
    rw [hinterEq]
    calc
      ((K ∩ {a, b}) ∪ (K ∩ {c, d})).card
          ≤ (K ∩ {a, b}).card + (K ∩ {c, d}).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := Nat.add_le_add hfirstCard hsecondCard
      _ = 2 := rfl
  have hsplit := Finset.card_sdiff_add_card_inter K E
  have houtsideCard : 2 ≤ (K \ E).card := by
    rw [hKcard] at hsplit
    omega
  rcases Finset.exists_mem_ne (by omega : 1 < (K \ E).card) q with
    ⟨v, hv, hvq⟩
  exact ⟨v, (Finset.mem_sdiff.mp hv).1, hvq,
    by simpa [E] using (Finset.mem_sdiff.mp hv).2⟩

private theorem overrideAt_selectedSupport_eq_of_ne
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center z : ℝ²} (C : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hz : z ∈ A) (hzq : z ≠ q) :
    ((H.overrideAt C hblocked).selectedAt z hz).toCriticalFourShell.support =
      (H.selectedAt z hz).toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_neg hzq]

private theorem overrideAt_selectedSupport_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q center : ℝ²} (C : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hq : q ∈ A) :
    ((H.overrideAt C hblocked).selectedAt q hq).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

private def rebaseCrossPairDeletionView
    {D : CounterexampleData} {H H' : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (x y : ℝ²)
    (view : CrossPairDeletionView (H := H) source x y)
    (hsupport :
      (H'.selectedAt source.1
          source.2).toCriticalFourShell.support =
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    CrossPairDeletionView (H := H') source x y where
  survives :=
    (crossPairDeletionSurvival_iff_selectedSupportOmission
      (H := H') source x y).mpr (by
        have homits := view.omits
        simpa [CrossPairSelectedSupportOmission, hsupport] using homits)

private def rebaseRetainedInteriorBlockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (hcenter₁ :
      H'.centerAt P.source₁ P.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcenter₂ :
      H'.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₂ P.source₂_mem_A) :
    RetainedInteriorBlockerCollision R' where
  source₁ := P.source₁
  source₂ := P.source₂
  source₁_mem_A := P.source₁_mem_A
  source₂_mem_A := P.source₂_mem_A
  sources_ne := P.sources_ne
  source₁_mem_radius := P.source₁_mem_radius
  source₂_mem_radius := P.source₂_mem_radius
  source₁_mem_capInterior := P.source₁_mem_capInterior
  source₂_mem_capInterior := P.source₂_mem_capInterior
  blockers_eq := hcenter₁.trans (P.blockers_eq.trans hcenter₂.symm)

private def rebaseLocalizedCollisionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (LP : LocalizedCollisionCommonDeletion P)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (P' : RetainedInteriorBlockerCollision R')
    (hsource₁ : P'.source₁ = P.source₁)
    (hsource₂ : P'.source₂ = P.source₂)
    (hcenter :
      H'.centerAt P'.source₁ P'.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsupport :
      (H'.selectedAt P'.source₁
          P'.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) :
    LocalizedCollisionCommonDeletion P' where
  fresh := LP.fresh
  fresh_mem_capInterior := LP.fresh_mem_capInterior
  fresh_ne_source₁ := by simpa [hsource₁] using LP.fresh_ne_source₁
  fresh_ne_source₂ := by simpa [hsource₂] using LP.fresh_ne_source₂
  fresh_not_mem_shell := by simpa [hsupport] using LP.fresh_not_mem_shell
  packet := by
    simpa [hcenter] using rebaseCommonDeletionSystem LP.packet H'

private def rebaseLocalizedCollisionMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H H' : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (LP : LocalizedCollisionCommonDeletion P)
    (MP : LocalizedCollisionMutualOmissionCycle P LP)
    {F' : CriticalPairFrontier D S radius H'}
    {R' : FrontierCommonDeletionParentResidual F'}
    (P' : RetainedInteriorBlockerCollision R')
    (LP' : LocalizedCollisionCommonDeletion P')
    (hsource₁ : P'.source₁ = P.source₁)
    (hsource₂ : P'.source₂ = P.source₂)
    (hfresh : LP'.fresh = LP.fresh)
    (hcollisionCenter :
      H'.centerAt MP.collisionSource MP.collisionSource_mem_A =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A)
    (hfreshCenter :
      H'.centerAt LP.fresh LP.packet.q_mem_A =
        H.centerAt LP.fresh LP.packet.q_mem_A)
    (hcommonCenter :
      H'.centerAt P'.source₁ P'.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hcollisionSupport :
      (H'.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support)
    (hfreshSupport :
      (H'.selectedAt LP'.fresh
          LP'.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support) :
    LocalizedCollisionMutualOmissionCycle P' LP' where
  collisionSource := MP.collisionSource
  collisionSource_mem_A := MP.collisionSource_mem_A
  collisionSource_mem_capInterior := MP.collisionSource_mem_capInterior
  collisionSource_eq := by
    rcases MP.collisionSource_eq with h | h
    · exact Or.inl (h.trans hsource₁.symm)
    · exact Or.inr (h.trans hsource₂.symm)
  collisionSource_ne_fresh := by
    simpa [hfresh] using MP.collisionSource_ne_fresh
  collisionSource_blocker_eq_commonBlocker :=
    hcollisionCenter.trans
      (MP.collisionSource_blocker_eq_commonBlocker.trans hcommonCenter.symm)
  fresh_not_mem_collisionSource_shell := by
    simpa [hfresh, hcollisionSupport] using
      MP.fresh_not_mem_collisionSource_shell
  collisionSource_not_mem_fresh_shell := by
    simpa [hfresh, hfreshSupport] using
      MP.collisionSource_not_mem_fresh_shell
  blockers_ne := by
    simpa [hfresh, hcollisionCenter, hfreshCenter] using MP.blockers_ne
  freshPacket := by
    simpa [hfresh, hcollisionCenter] using
      rebaseCommonDeletionSystem MP.freshPacket H'
  collisionSourcePacket := by
    simpa [hfresh, hfreshCenter] using
      rebaseCommonDeletionSystem MP.collisionSourcePacket H'

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP

theorem false_of_freshCanonicalRowOverride
    (source q : CriticalShellSystem.CarrierVertex D.A)
    (hsource :
      TwoSourceExactCollisionRowsTerminal.FirstFiberCapSourceWitness
        P Pρ source)
    (hqFirst :
      q.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)
    (hqSecond :
      q.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support)
    (hqSource :
      q.1 ∉
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    False := by
  let K :=
    (H.selectedAt q.1 q.2).toCriticalFourShell
  let center := H.centerAt q.1 q.2
  have hcenterNeFirst :
      center ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      selectedSupports_eq_of_actualBlockers_eq
        H q.2 P.source₁_mem_A hcenter
    apply hqFirst
    rw [← hsupportEq]
    exact K.q_mem_support
  have hcenterNeSecond :
      center ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro hcenter
    have hsupportEq :=
      selectedSupports_eq_of_actualBlockers_eq
        H q.2 Pρ.source₁_mem_A hcenter
    apply hqSecond
    rw [← hsupportEq]
    exact K.q_mem_support
  have hcenterNeSource :
      center ≠ H.centerAt source.1 source.2 := by
    intro hcenter
    have hsupportEq :=
      selectedSupports_eq_of_actualBlockers_eq
        H q.2 source.2 hcenter
    apply hqSource
    rw [← hsupportEq]
    exact K.q_mem_support
  let QP : RetainedRadiusCollision (R := R) :=
    retainedRadiusCollisionOfInteriorCollision P
  let QPρ : RetainedRadiusCollision (R := Rρ) :=
    retainedRadiusCollisionOfInteriorCollision Pρ
  have hnotFirst :
      ¬ (P.source₁ ∈ K.support ∧ P.source₂ ∈ K.support) := by
    rintro ⟨h₁, h₂⟩
    exact false_of_distinct_actualRow_contains_collisionSources
      QP q.2 hcenterNeFirst h₁ h₂
  have hnotSecond :
      ¬ (Pρ.source₁ ∈ K.support ∧ Pρ.source₂ ∈ K.support) := by
    rintro ⟨h₁, h₂⟩
    exact false_of_distinct_actualRow_contains_collisionSources
      QPρ q.2 hcenterNeSecond h₁ h₂
  have hqNeFirst₁ : q.1 ≠ P.source₁ := by
    intro h
    apply hqFirst
    rw [h]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeFirst₂ : q.1 ≠ P.source₂ := by
    intro h
    apply hqFirst
    rw [h]
    exact P.source₂_mem_source₁_shell
  have hqNeSecond₁ : q.1 ≠ Pρ.source₁ := by
    intro h
    apply hqSecond
    rw [h]
    exact
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeSecond₂ : q.1 ≠ Pρ.source₂ := by
    intro h
    apply hqSecond
    rw [h]
    exact Pρ.source₂_mem_source₁_shell
  have hqOutside :
      q.1 ∉
        ({P.source₁, P.source₂, Pρ.source₁, Pρ.source₂} :
          Finset ℝ²) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨hqNeFirst₁, hqNeFirst₂, hqNeSecond₁, hqNeSecond₂⟩
  rcases
      exists_second_outside_two_pairs K.support q.1
        P.source₁ P.source₂ Pρ.source₁ Pρ.source₂
        K.support_card hqOutside hnotFirst hnotSecond with
    ⟨v, hvK, hvq, hvOutside⟩
  have hvA : v ∈ D.A := K.support_subset_A hvK
  have hvNeFirst₁ : v ≠ P.source₁ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeFirst₂ : v ≠ P.source₂ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeSecond₁ : v ≠ Pρ.source₁ := by
    intro h
    apply hvOutside
    simp [h]
  have hvNeSecond₂ : v ≠ Pρ.source₂ := by
    intro h
    apply hvOutside
    simp [h]
  let Kv : CriticalFourShell D.A v center := {
    center_mem := Finset.mem_erase.mpr
      ⟨by
        intro h
        subst v
        exact K.center_not_mem_support hvK,
       (Finset.mem_erase.mp K.center_mem).2⟩
    radius := K.radius
    radius_pos := K.radius_pos
    support := K.support
    support_eq := K.support_eq
    support_card := K.support_card
    q_mem_support := hvK }
  rcases CriticalSelectedFourClass.exists_of_shell Kv with
    ⟨Cv, hCv⟩
  have hvUnique :
      v ∈ uniqueFourClass D.A center := by
    rw [uniqueFourClass_centerAt_eq_selectedAt_support H q.1 q.2]
    exact hvK
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase v) center :=
    not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
      (isUniqueFourCenter_centerAt H q.1 q.2) hvUnique
  let H' : CriticalShellSystem D.A := H.overrideAt Cv hblocked
  have hcenterPreserved :
      ∀ (z : ℝ²) (hz : z ∈ D.A), z ≠ v →
        H'.centerAt z hz = H.centerAt z hz := by
    intro z hz hzv
    exact H.overrideAt_centerAt_of_ne Cv hblocked hz hzv
  have hsupportPreserved :
      ∀ (z : ℝ²) (hz : z ∈ D.A), z ≠ v →
        (H'.selectedAt z hz).toCriticalFourShell.support =
          (H.selectedAt z hz).toCriticalFourShell.support := by
    intro z hz hzv
    exact overrideAt_selectedSupport_eq_of_ne H Cv hblocked hz hzv
  have hcenterQ : H'.centerAt q.1 q.2 = center :=
    hcenterPreserved q.1 q.2 hvq.symm
  have hcenterV : H'.centerAt v hvA = center :=
    H.overrideAt_centerAt Cv hblocked hvA
  have hsupportQ :
      (H'.selectedAt q.1 q.2).toCriticalFourShell.support =
        K.support :=
    hsupportPreserved q.1 q.2 hvq.symm
  have hsupportV :
      (H'.selectedAt v hvA).toCriticalFourShell.support =
        K.support := by
    rw [overrideAt_selectedSupport_eq H Cv hblocked hvA, hCv]
  have hcenterFirst₁ :
      H'.centerAt P.source₁ P.source₁_mem_A =
        H.centerAt P.source₁ P.source₁_mem_A :=
    hcenterPreserved P.source₁ P.source₁_mem_A hvNeFirst₁.symm
  have hcenterFirst₂ :
      H'.centerAt P.source₂ P.source₂_mem_A =
        H.centerAt P.source₂ P.source₂_mem_A :=
    hcenterPreserved P.source₂ P.source₂_mem_A hvNeFirst₂.symm
  have hcenterSecond₁ :
      H'.centerAt Pρ.source₁ Pρ.source₁_mem_A =
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A :=
    hcenterPreserved Pρ.source₁ Pρ.source₁_mem_A hvNeSecond₁.symm
  have hcenterSecond₂ :
      H'.centerAt Pρ.source₂ Pρ.source₂_mem_A =
        H.centerAt Pρ.source₂ Pρ.source₂_mem_A :=
    hcenterPreserved Pρ.source₂ Pρ.source₂_mem_A hvNeSecond₂.symm
  have hsupportFirst₁ :
      (H'.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    hsupportPreserved P.source₁ P.source₁_mem_A hvNeFirst₁.symm
  have hsupportSecond₁ :
      (H'.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support =
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    hsupportPreserved Pρ.source₁ Pρ.source₁_mem_A hvNeSecond₁.symm
  let F' : CriticalPairFrontier D S radius H' :=
    rebaseCriticalPairFrontierSystem F H'
  let R' : FrontierCommonDeletionParentResidual F' :=
    rebaseFrontierCommonDeletionParentResidual R H'
  let Fρ' : CriticalPairFrontier D S ρ H' :=
    rebaseCriticalPairFrontierSystem Fρ H'
  let Rρ' : FrontierCommonDeletionParentResidual Fρ' :=
    rebaseFrontierCommonDeletionParentResidual Rρ H'
  let P' : RetainedInteriorBlockerCollision R' :=
    rebaseRetainedInteriorBlockerCollision P
      hcenterFirst₁ hcenterFirst₂
  let Pρ' : RetainedInteriorBlockerCollision Rρ' :=
    rebaseRetainedInteriorBlockerCollision Pρ
      hcenterSecond₁ hcenterSecond₂
  let B' : FrontierBiApexRobustResidual R' :=
    rebaseFrontierBiApexRobustResidual B H'
  let L' : FrontierLargeOppositeCapsBiApexRobustResidual B' :=
    rebaseFrontierLargeOppositeCapsBiApexRobustResidual L H'
  let N' : FrontierAllLargeCapsBiApexRobustResidual L' :=
    ⟨N.surplusCap_card_ge_six⟩
  let T' : FrontierAllLargeCapsTriApexRobustResidual N' :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  let LPρ' : LocalizedCollisionCommonDeletion P' :=
    rebaseLocalizedCollisionCommonDeletion P LPρ P'
      rfl rfl hcenterFirst₁ hsupportFirst₁
  let LP' : LocalizedCollisionCommonDeletion Pρ' :=
    rebaseLocalizedCollisionCommonDeletion Pρ LP Pρ'
      rfl rfl hcenterSecond₁ hsupportSecond₁
  have hLPρFreshNeV : LPρ.fresh ≠ v := by
    intro h
    exact hvNeSecond₁ (h.symm.trans hLPρ)
  have hLPFreshNeV : LP.fresh ≠ v := by
    intro h
    exact hvNeFirst₁ (h.symm.trans hLP)
  have hMPρCollisionNeV : MPρ.collisionSource ≠ v := by
    intro h
    rcases MPρ.collisionSource_eq with hs | hs
    · exact hvNeFirst₁ (h.symm.trans hs)
    · exact hvNeFirst₂ (h.symm.trans hs)
  have hMPCollisionNeV : MP.collisionSource ≠ v := by
    intro h
    rcases MP.collisionSource_eq with hs | hs
    · exact hvNeSecond₁ (h.symm.trans hs)
    · exact hvNeSecond₂ (h.symm.trans hs)
  have hMPρCollisionCenter :
      H'.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A =
        H.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A :=
    hcenterPreserved MPρ.collisionSource MPρ.collisionSource_mem_A
      hMPρCollisionNeV
  have hMPCollisionCenter :
      H'.centerAt MP.collisionSource MP.collisionSource_mem_A =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A :=
    hcenterPreserved MP.collisionSource MP.collisionSource_mem_A
      hMPCollisionNeV
  have hLPρFreshCenter :
      H'.centerAt LPρ.fresh LPρ.packet.q_mem_A =
        H.centerAt LPρ.fresh LPρ.packet.q_mem_A :=
    hcenterPreserved LPρ.fresh LPρ.packet.q_mem_A hLPρFreshNeV
  have hLPFreshCenter :
      H'.centerAt LP.fresh LP.packet.q_mem_A =
        H.centerAt LP.fresh LP.packet.q_mem_A :=
    hcenterPreserved LP.fresh LP.packet.q_mem_A hLPFreshNeV
  have hMPρCollisionSupport :
      (H'.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support :=
    hsupportPreserved MPρ.collisionSource MPρ.collisionSource_mem_A
      hMPρCollisionNeV
  have hMPCollisionSupport :
      (H'.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support :=
    hsupportPreserved MP.collisionSource MP.collisionSource_mem_A
      hMPCollisionNeV
  have hLPρFreshSupport :
      (H'.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support :=
    hsupportPreserved LPρ.fresh LPρ.packet.q_mem_A hLPρFreshNeV
  have hLPFreshSupport :
      (H'.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support :=
    hsupportPreserved LP.fresh LP.packet.q_mem_A hLPFreshNeV
  let MPρ' : LocalizedCollisionMutualOmissionCycle P' LPρ' :=
    rebaseLocalizedCollisionMutualOmissionCycle P LPρ MPρ P' LPρ'
      rfl rfl rfl hMPρCollisionCenter hLPρFreshCenter
      hcenterFirst₁ hMPρCollisionSupport hLPρFreshSupport
  let MP' : LocalizedCollisionMutualOmissionCycle Pρ' LP' :=
    rebaseLocalizedCollisionMutualOmissionCycle Pρ LP MP Pρ' LP'
      rfl rfl rfl hMPCollisionCenter hLPFreshCenter
      hcenterSecond₁ hMPCollisionSupport hLPFreshSupport
  have hLPρ' : LPρ'.fresh = Pρ'.source₁ := by
    simpa [LPρ', Pρ', rebaseLocalizedCollisionCommonDeletion,
      rebaseRetainedInteriorBlockerCollision] using hLPρ
  have hLP' : LP'.fresh = P'.source₁ := by
    simpa [LP', P', rebaseLocalizedCollisionCommonDeletion,
      rebaseRetainedInteriorBlockerCollision] using hLP
  have hblockersNe' :
      H'.centerAt Pρ'.source₁ Pρ'.source₁_mem_A ≠
        H'.centerAt P'.source₁ P'.source₁_mem_A := by
    change
      H'.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H'.centerAt P.source₁ P.source₁_mem_A
    rw [hcenterSecond₁, hcenterFirst₁]
    exact hblockersNe
  let third : FreshThirdBlockerFiber P' Pρ' := {
    source₁ := q
    source₂ := ⟨v, hvA⟩
    sources_ne := by
      intro h
      exact hvq (congrArg Subtype.val h).symm
    blockers_eq := by
      apply Subtype.ext
      exact hcenterQ.trans hcenterV.symm
    blocker_ne_first := by
      intro h
      apply hcenterNeFirst
      have hv := congrArg Subtype.val h
      change
        H'.centerAt q.1 q.2 =
          H'.centerAt P.source₁ P.source₁_mem_A at hv
      exact hcenterQ.symm.trans (hv.trans hcenterFirst₁)
    blocker_ne_second := by
      intro h
      apply hcenterNeSecond
      have hv := congrArg Subtype.val h
      change
        H'.centerAt q.1 q.2 =
          H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at hv
      exact hcenterQ.symm.trans (hv.trans hcenterSecond₁)
    source₁_ne_first₁ := by
      intro h
      exact hqNeFirst₁ (congrArg Subtype.val h)
    source₁_ne_first₂ := by
      intro h
      exact hqNeFirst₂ (congrArg Subtype.val h)
    source₁_ne_second₁ := by
      intro h
      exact hqNeSecond₁ (congrArg Subtype.val h)
    source₁_ne_second₂ := by
      intro h
      exact hqNeSecond₂ (congrArg Subtype.val h)
    source₂_ne_first₁ := by
      intro h
      exact hvNeFirst₁ (congrArg Subtype.val h)
    source₂_ne_first₂ := by
      intro h
      exact hvNeFirst₂ (congrArg Subtype.val h)
    source₂_ne_second₁ := by
      intro h
      exact hvNeSecond₁ (congrArg Subtype.val h)
    source₂_ne_second₂ := by
      intro h
      exact hvNeSecond₂ (congrArg Subtype.val h)
    source₁_mem_source₂_shell := by
      rw [hsupportV]
      exact K.q_mem_support
    source₂_mem_source₁_shell := by
      rw [hsupportQ]
      exact hvK }
  rcases hsource with
    ⟨hcapEight, hsourceInterior, hsourceOutside,
      hsourceCenterNeFirst, hsourceCenterNeSecond,
      hsourceCenterNeFirstApex, hsourceCenterNeSecondApex,
      hsourceMem, hsourceCard, hsourceFirstView, hsourceSecondView⟩
  have hsourceOutside' :
      source.1 ∉
        (({P'.source₁, P'.source₂} : Finset ℝ²) ∪
          {Pρ'.source₁, Pρ'.source₂}) := by
    change
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})
    exact hsourceOutside
  have hcapSource' : CapSourceThirdCanonicalRowSurface P' Pρ' := by
    by_cases hvSource : v = source.1
    · subst v
      have hcenterSource' :
          H'.centerAt source.1 source.2 = center := by
        exact hcenterV
      have hsupportSource' :
          (H'.selectedAt source.1
              source.2).toCriticalFourShell.support =
            K.support := by
        exact hsupportV
      have hsourceMemK : source.1 ∈ K.support := by
        exact hvK
      have homitFirstK :
          P.source₁ ∉ K.support ∨ P.source₂ ∉ K.support := by
        by_cases hmem : P.source₁ ∈ K.support
        · exact Or.inr (fun hmem₂ => hnotFirst ⟨hmem, hmem₂⟩)
        · exact Or.inl hmem
      have homitSecondK :
          Pρ.source₁ ∉ K.support ∨ Pρ.source₂ ∉ K.support := by
        by_cases hmem : Pρ.source₁ ∈ K.support
        · exact Or.inr (fun hmem₂ => hnotSecond ⟨hmem, hmem₂⟩)
        · exact Or.inl hmem
      have hsourceFirstView' :
          CrossPairDeletionView (H := H') source
            P'.source₁ P'.source₂ := by
        constructor
        apply
          (crossPairDeletionSurvival_iff_selectedSupportOmission
            (H := H') source P'.source₁ P'.source₂).mpr
        change
          P.source₁ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
            P.source₂ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support
        rw [hsupportSource']
        exact homitFirstK
      have hsourceSecondView' :
          CrossPairDeletionView (H := H') source
            Pρ'.source₁ Pρ'.source₂ := by
        constructor
        apply
          (crossPairDeletionSurvival_iff_selectedSupportOmission
            (H := H') source Pρ'.source₁ Pρ'.source₂).mpr
        change
          Pρ.source₁ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
            Pρ.source₂ ∉
              (H'.selectedAt source.1
                source.2).toCriticalFourShell.support
        rw [hsupportSource']
        exact homitSecondK
      refine
        ⟨hcapEight, source, hsourceInterior, hsourceOutside', ?_, ?_,
          ?_, ?_, ?_, ?_, hsourceFirstView', hsourceSecondView'⟩
      · intro h
        apply hcenterNeFirst
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt P.source₁ P.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterFirst₁)
      · intro h
        apply hcenterNeSecond
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterSecond₁)
      · exact
          R'.firstApexFullyDeletionRobust.centerAt_ne
            H' source.1 source.2
      · exact B'.secondApex_robust.centerAt_ne H' source.1 source.2
      · rw [hsupportSource']
        exact hsourceMemK
      · rw [hsupportSource']
        exact K.support_card
    · have hsourceNeV : source.1 ≠ v := by
        intro h
        exact hvSource h.symm
      have hcenterSource' :
          H'.centerAt source.1 source.2 =
            H.centerAt source.1 source.2 :=
        hcenterPreserved source.1 source.2 hsourceNeV
      have hsupportSource' :
          (H'.selectedAt source.1
              source.2).toCriticalFourShell.support =
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support :=
        hsupportPreserved source.1 source.2 hsourceNeV
      have hsourceFirstView' :
          CrossPairDeletionView (H := H') source
            P'.source₁ P'.source₂ := by
        change
          CrossPairDeletionView (H := H') source
            P.source₁ P.source₂
        exact
          rebaseCrossPairDeletionView source P.source₁ P.source₂
            hsourceFirstView hsupportSource'
      have hsourceSecondView' :
          CrossPairDeletionView (H := H') source
            Pρ'.source₁ Pρ'.source₂ := by
        change
          CrossPairDeletionView (H := H') source
            Pρ.source₁ Pρ.source₂
        exact
          rebaseCrossPairDeletionView source Pρ.source₁ Pρ.source₂
            hsourceSecondView hsupportSource'
      refine
        ⟨hcapEight, source, hsourceInterior, hsourceOutside', ?_, ?_,
          ?_, ?_, ?_, ?_, hsourceFirstView', hsourceSecondView'⟩
      · intro h
        apply hsourceCenterNeFirst
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt P.source₁ P.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterFirst₁)
      · intro h
        apply hsourceCenterNeSecond
        change
          H'.centerAt source.1 source.2 =
            H'.centerAt Pρ.source₁ Pρ.source₁_mem_A at h
        exact hcenterSource'.symm.trans (h.trans hcenterSecond₁)
      · intro h
        exact hsourceCenterNeFirstApex
          (hcenterSource'.symm.trans h)
      · intro h
        exact hsourceCenterNeSecondApex
          (hcenterSource'.symm.trans h)
      · rw [hsupportSource']
        exact hsourceMem
      · rw [hsupportSource']
        exact hsourceCard
  have hfrontierInteriorEq' :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P'.source₁, P'.source₂} := by
    change
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂}
    exact hfrontierInteriorEq
  have hρInteriorEq' :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ'.source₁, Pρ'.source₂} := by
    change
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂}
    exact hρInteriorEq
  have hpairsDisjoint' :
      Disjoint
        ({P'.source₁, P'.source₂} : Finset ℝ²)
        {Pρ'.source₁, Pρ'.source₂} := by
    change
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂}
    exact hpairsDisjoint
  exact
    TwoSourceExactCollisionRowsTerminal.false_of_capSource_freshThirdBlockerFiber
      (P := P') (Pρ := Pρ')
      (hρne := hρne)
      (hfrontierFour := hfrontierFour)
      (hρfour := hρfour)
      (hfrontierInteriorEq := hfrontierInteriorEq')
      (hρInteriorEq := hρInteriorEq')
      (T := T')
      (hpairsDisjoint := hpairsDisjoint')
      (hblockersNe := hblockersNe')
      (LPρ := LPρ') (hLPρ := hLPρ') (MPρ := MPρ')
      (LP := LP') (hLP := hLP') (MP := MP')
      hcapSource' ⟨third⟩

end

end CanonicalRowOverrideRebase
end ATailFrontierLiveClosure
end Problem97
