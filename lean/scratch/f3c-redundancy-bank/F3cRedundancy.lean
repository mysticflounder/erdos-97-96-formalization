/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Bank: (F3c)-redundancy for the first-fiber leaf

Kernel check of the round-1 CONJECTURE recorded as CONJECTURE-(i) in
`docs/solve-prompts/2026-07-27-f-bridge-second-cap-center.md` §7.1:

> modulo `Γ` and (F3b), the five-center-deletion hypothesis (F3c) of the F3
> leaf is derivable.

Here (F3b) is
`ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.FirstFiberCapSourceWitness`
(`FrontierLiveClosure.lean:7521`) and (F3c) is
`ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual P Pρ
source S.oppApex2 S.surplusApex` (`FirstFiberOverlapDescent.lean:85`), i.e. the
last hypothesis of the leaf
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`
(`FrontierLiveClosure.lean:7620`).

Contents.

* `fiveCenterDeletionSurvival_of_capSourceOmission_sSide` — the `s`-arm
  builder: a first-cap point omitted by the cap-source row and lying outside
  the second collision pair yields five-center deletion survival at
  `c(g), a₀, b′, a₁, a₂`.
* `fiveCenterDeletionSurvival_of_capSourceOmission_tSide` — the mirrored
  `t`-arm builder (third centre `b` instead of `b′`).
* `f3c_sArms_sharp` / `f3c_tArms_sharp` — the two *sharp* conclusions, each
  strictly stronger than (F3c): a two-arm disjunction rather than (F3c)'s
  four-arm one.
* `f3c_joint_sharp` — both sharp conclusions at once, i.e. two five-center
  surviving deletions at two distinct points with two different third centres.
* `f3c_of_f3b_sArms` / `f3c_of_f3b_tArms` — two independent derivations of the
  full (F3c) disjunction: from the `{s₁,s₂}`-omission conjunct of (F3b), and
  from the `{t₁,t₂}`-omission conjunct.
* `f3c_of_leaf_hypotheses` — the same conclusion stated with the leaf's own
  Γ section-variable context, verbatim and with the leaf's full `include`
  list, so that the statement is the leaf's statement with `(F3c)` deleted
  from the hypotheses and `False` replaced by `(F3c)`.
* `leaf_F3c_hypothesis_redundant` — the resulting equivalence of the two leaf
  statements (with and without the `(F3c)` hypothesis).

The enlarged first fiber `Q : FreshOutsideFirstBlockerFiber P Pρ`, i.e. (F3a),
is **not used**; it appears only in `f3c_of_leaf_hypotheses` /
`leaf_F3c_hypothesis_redundant` for statement fidelity with the leaf.

Nothing here touches the second blocker fiber (`FreshOutsideSecondBlockerFiber`,
the F4 side).
-/

namespace Problem97
namespace F3cRedundancyBank

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFirstFiberOverlapDescent
open ATailFrontierLiveClosure
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

attribute [local instance] Classical.propDecidable

/- ### Arm builders

Both builders are the step-2/3/4 chain of §7.1 for a single deleted point:

* (D4)+(X3)+(X10) — the deleted point sits in the first cap but not in the
  *other* collision pair, so the exact cap trace of the other collision row
  (`shell_inter_cap_eq_sources`) forces it out of that row;
* (D1) — `cross_deletion_survives_iff_not_mem_selected_support`, twice: at the
  cap-source blocker `c(g)` and at the other collision blocker;
* (D6)/(T4) — `firstApexFullyDeletionRobust` at `a₀ = S.oppApex1` and
  `fullyDeletionRobustAt_of_apexRichClassStructure` at `a₁ = S.oppApex2` and
  `a₂ = S.surplusApex`.
-/

/-- `s`-side arm builder.  A carrier point `s` of the first opposite cap that
is omitted by the cap-source row and is not one of the second collision pair
gives five-center deletion survival with third centre the **second** collision
blocker `b′ = H.centerAt Pρ.source₁ _`. -/
theorem fiveCenterDeletionSurvival_of_capSourceOmission_sSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hoppApex2Rich : ApexRichClassStructure D.A S.oppApex2)
    (hsurplusApexRich : ApexRichClassStructure D.A S.surplusApex)
    (source : CriticalShellSystem.CarrierVertex D.A)
    {s : ℝ²} (hsA : s ∈ D.A)
    (hsCap : s ∈ S.capByIndex S.oppIndex1)
    (hsNotSecondPair : s ∉ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (homit :
      s ∉ (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    FiveCenterDeletionSurvival D s
      (H.centerAt source.1 source.2) S.oppApex1
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) S.oppApex2 S.surplusApex := by
  have hsecondRowOmission :
      s ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    apply hsNotSecondPair
    rw [← Pρ.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hmem, hsCap⟩
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · exact (cross_deletion_survives_iff_not_mem_selected_support
      H source.2).2 homit
  · exact R.firstApexFullyDeletionRobust.survives s hsA
  · exact (cross_deletion_survives_iff_not_mem_selected_support
      H Pρ.source₁_mem_A).2 hsecondRowOmission
  · exact (fullyDeletionRobustAt_of_apexRichClassStructure
      hoppApex2Rich).survives s hsA
  · exact (fullyDeletionRobustAt_of_apexRichClassStructure
      hsurplusApexRich).survives s hsA

/-- `t`-side arm builder.  Mirror of the previous lemma with the roles of the
two collision pairs exchanged: third centre is the **first** collision blocker
`b = H.centerAt P.source₁ _`. -/
theorem fiveCenterDeletionSurvival_of_capSourceOmission_tSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (hfirstApexRobust : FullyDeletionRobustAt D S.oppApex1)
    (hoppApex2Rich : ApexRichClassStructure D.A S.oppApex2)
    (hsurplusApexRich : ApexRichClassStructure D.A S.surplusApex)
    (source : CriticalShellSystem.CarrierVertex D.A)
    {t : ℝ²} (htA : t ∈ D.A)
    (htCap : t ∈ S.capByIndex S.oppIndex1)
    (htNotFirstPair : t ∉ ({P.source₁, P.source₂} : Finset ℝ²))
    (homit :
      t ∉ (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    FiveCenterDeletionSurvival D t
      (H.centerAt source.1 source.2) S.oppApex1
      (H.centerAt P.source₁ P.source₁_mem_A) S.oppApex2 S.surplusApex := by
  have hfirstRowOmission :
      t ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    intro hmem
    apply htNotFirstPair
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hmem, htCap⟩
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · exact (cross_deletion_survives_iff_not_mem_selected_support
      H source.2).2 homit
  · exact hfirstApexRobust.survives t htA
  · exact (cross_deletion_survives_iff_not_mem_selected_support
      H P.source₁_mem_A).2 hfirstRowOmission
  · exact (fullyDeletionRobustAt_of_apexRichClassStructure
      hoppApex2Rich).survives t htA
  · exact (fullyDeletionRobustAt_of_apexRichClassStructure
      hsurplusApexRich).survives t htA

section

/- ### The Γ block

Copied verbatim from
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7421-7469`
(namespace `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`).
Section variables are not exported across files, so the block is restated here
rather than imported. -/

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
    (hcriticalShellUniqueFourCover :
      ∀ x : ℝ², ∀ hx : x ∈ D.A,
        H.centerAt x hx ≠ x ∧
          IsUniqueFourCenter D.A (H.centerAt x hx) ∧
            uniqueFourClass D.A (H.centerAt x hx) =
              (H.selectedAt x hx).toCriticalFourShell.support)
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

include T hpairsDisjoint

/-- **Sharp `s`-side conclusion.**  Strictly stronger than (F3c): the
`{s₁,s₂}`-omission conjunct of the cap-source witness supplies arm 1 (deleting
`s₁`) or arm 3 (deleting `s₂`) — the other two arms of (F3c) are never needed.

Uses only: (F3b) conjunct 10, `Pρ.shell_inter_cap_eq_sources`,
`hpairsDisjoint`, `cross_deletion_survives_iff_not_mem_selected_support`,
`R.firstApexFullyDeletionRobust`, `T.oppApex2_rich`, `T.surplusApex_rich`.
In particular the enlarged first fiber (F3a) is not used. -/
theorem f3c_sArms_sharp
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    FiveCenterDeletionSurvival D P.source₁
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex ∨
      FiveCenterDeletionSurvival D P.source₂
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        S.oppApex2 S.surplusApex := by
  obtain ⟨-, -, -, -, -, -, -, -, -, homitFirstPair, -⟩ := hsource
  rcases homitFirstPair.omits with homit₁ | homit₂
  · exact Or.inl
      (fiveCenterDeletionSurvival_of_capSourceOmission_sSide R Pρ
        T.oppApex2_rich T.surplusApex_rich source
        P.source₁_mem_A
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          P.source₁_mem_capInterior)
        (Finset.disjoint_left.mp hpairsDisjoint
          (Finset.mem_insert_self _ _))
        homit₁)
  · exact Or.inr
      (fiveCenterDeletionSurvival_of_capSourceOmission_sSide R Pρ
        T.oppApex2_rich T.surplusApex_rich source
        P.source₂_mem_A
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          P.source₂_mem_capInterior)
        (Finset.disjoint_left.mp hpairsDisjoint
          (Finset.mem_insert_of_mem (Finset.mem_singleton_self _)))
        homit₂)

/-- **Sharp `t`-side conclusion.**  Independent second derivation, from the
`{t₁,t₂}`-omission conjunct: arm 2 (deleting `t₁`) or arm 4 (deleting `t₂`). -/
theorem f3c_tArms_sharp
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    FiveCenterDeletionSurvival D Pρ.source₁
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex ∨
      FiveCenterDeletionSurvival D Pρ.source₂
        (H.centerAt source.1 source.2) S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex2 S.surplusApex := by
  obtain ⟨-, -, -, -, -, -, -, -, -, -, homitSecondPair⟩ := hsource
  rcases homitSecondPair.omits with homit₁ | homit₂
  · exact Or.inl
      (fiveCenterDeletionSurvival_of_capSourceOmission_tSide P
        R.firstApexFullyDeletionRobust
        T.oppApex2_rich T.surplusApex_rich source
        Pρ.source₁_mem_A
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          Pρ.source₁_mem_capInterior)
        (Finset.disjoint_right.mp hpairsDisjoint
          (Finset.mem_insert_self _ _))
        homit₁)
  · exact Or.inr
      (fiveCenterDeletionSurvival_of_capSourceOmission_tSide P
        R.firstApexFullyDeletionRobust
        T.oppApex2_rich T.surplusApex_rich source
        Pρ.source₂_mem_A
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          Pρ.source₂_mem_capInterior)
        (Finset.disjoint_right.mp hpairsDisjoint
          (Finset.mem_insert_of_mem (Finset.mem_singleton_self _)))
        homit₂)

/-- **Joint sharp residual — strictly stronger than (F3c).**  Both sharp
conclusions hold simultaneously under the same (F3b), so (F3b) supplies *two*
five-center surviving deletions, at two distinct deleted points (distinct by
`hpairsDisjoint`) and with two *different* third centres `b′` and `b`.

(F3c) only asserts that *one* of its four arms holds. -/
theorem f3c_joint_sharp
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    (FiveCenterDeletionSurvival D P.source₁
          (H.centerAt source.1 source.2) S.oppApex1
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          S.oppApex2 S.surplusApex ∨
        FiveCenterDeletionSurvival D P.source₂
          (H.centerAt source.1 source.2) S.oppApex1
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          S.oppApex2 S.surplusApex) ∧
      (FiveCenterDeletionSurvival D Pρ.source₁
          (H.centerAt source.1 source.2) S.oppApex1
          (H.centerAt P.source₁ P.source₁_mem_A)
          S.oppApex2 S.surplusApex ∨
        FiveCenterDeletionSurvival D Pρ.source₂
          (H.centerAt source.1 source.2) S.oppApex1
          (H.centerAt P.source₁ P.source₁_mem_A)
          S.oppApex2 S.surplusApex) :=
  ⟨f3c_sArms_sharp P Pρ T hpairsDisjoint source hsource,
    f3c_tArms_sharp P Pρ T hpairsDisjoint source hsource⟩

/-- **(F3c) from (F3b), via the `s`-arms.** -/
theorem f3c_of_f3b_sArms
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  rcases f3c_sArms_sharp P Pρ T hpairsDisjoint source hsource with
    harm₁ | harm₃
  · exact Or.inl harm₁
  · exact Or.inr (Or.inr (Or.inl harm₃))

/-- **(F3c) from (F3b), via the `t`-arms.**  Independent of
`f3c_of_f3b_sArms`: it consumes the other omission conjunct of (F3b). -/
theorem f3c_of_f3b_tArms
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex := by
  rcases f3c_tArms_sharp P Pρ T hpairsDisjoint source hsource with
    harm₂ | harm₄
  · exact Or.inr (Or.inl harm₂)
  · exact Or.inr (Or.inr (Or.inr harm₄))

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hcriticalShellUniqueFourCover hblockersNe
  LPρ hLPρ MPρ LP hLP MP

/-- **Leaf-context restatement.**  Exactly the hypothesis list of
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`
(`FrontierLiveClosure.lean:7620`) with the `(F3c)` hypothesis `hdeletion`
deleted and the conclusion `False` replaced by `(F3c)`.

`Q` (= (F3a)) is carried for statement fidelity only; the proof does not use
it. -/
theorem f3c_of_leaf_hypotheses
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source) :
    FirstFiberCollisionFiveCenterDeletionResidual
      P Pρ source S.oppApex2 S.surplusApex :=
  f3c_of_f3b_sArms P Pρ T hpairsDisjoint source hsource

/-- **(F3c) is a redundant leaf hypothesis.**  In the leaf's own Γ context the
statement of `false_of_capSource_firstFiber_collisionFiveCenterDeletion` is
equivalent to the same statement with the `(F3c)` hypothesis removed.

This is a statement *about* the two leaf shapes; it does not prove either of
them, and it is proved without invoking the (still `sorry`-backed) leaf. -/
theorem leaf_F3c_hypothesis_redundant :
    (∀ (_Q : FreshOutsideFirstBlockerFiber P Pρ)
        (source : CriticalShellSystem.CarrierVertex D.A),
        FirstFiberCapSourceWitness P Pρ source →
          FirstFiberCollisionFiveCenterDeletionResidual
              P Pρ source S.oppApex2 S.surplusApex →
            False) ↔
      (∀ (_Q : FreshOutsideFirstBlockerFiber P Pρ)
          (source : CriticalShellSystem.CarrierVertex D.A),
          FirstFiberCapSourceWitness P Pρ source → False) := by
  constructor
  · intro hwith Q source hsource
    exact hwith Q source hsource
      (f3c_of_f3b_sArms P Pρ T hpairsDisjoint source hsource)
  · intro hwithout Q source hsource _
    exact hwithout Q source hsource

end

/- ### Axiom gate

Every banked theorem must show only Lean core axioms: `propext`,
`Classical.choice`, `Quot.sound`.  No `sorryAx`, no `Lean.ofReduceBool`
(no `native_decide`), no project axiom. -/

#print axioms fiveCenterDeletionSurvival_of_capSourceOmission_sSide
#print axioms fiveCenterDeletionSurvival_of_capSourceOmission_tSide
#print axioms f3c_sArms_sharp
#print axioms f3c_tArms_sharp
#print axioms f3c_joint_sharp
#print axioms f3c_of_f3b_sArms
#print axioms f3c_of_f3b_tArms
#print axioms f3c_of_leaf_hypotheses
#print axioms leaf_F3c_hypothesis_redundant

/- ### Statement-fidelity check

`f3c_of_leaf_hypotheses` must have the leaf's hypothesis list verbatim, minus
the `(F3c)` hypothesis, with `False` replaced by `(F3c)`. -/

#check @f3c_of_leaf_hypotheses
#check @ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_collisionFiveCenterDeletion

end F3cRedundancyBank
end Problem97
