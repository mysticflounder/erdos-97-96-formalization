/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.SurvivalCover

/-!
# Geometric normalization of the three-omission blocker split

The finite-map theorem
`third_fiber_or_larger_known_fiber_of_three_omissions` has three arms.  This
file translates each arm into the exact geometry supplied by a critical-shell
system and two retained strict-cap collision packets.

* A genuinely new collision fiber gives two fresh carrier sources which lie
  in one another's canonical shells.
* A larger known fiber either gives a requested named cross hit, or identifies
  the complete two-point shell-minus-first-cap remainder; both points avoid
  the opposite collision sources.
* The two known-fiber arms are handled symmetrically.

No global contradiction follows from these facts alone.  In particular, the
new off-cap source is only known to occur in one of the two canonical shells.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerMultiplicityGeometry

open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

noncomputable section

/-- One of the four named cross-row incidences requested by the live
two-collision frontier. -/
def CollisionCrossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  Pρ.source₁ ∈
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support ∨
    Pρ.source₂ ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∨
      P.source₁ ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support ∨
        P.source₂ ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support

/-- The geometric content of a collision fiber whose blocker value differs
from both named collision blockers.  Both sources are automatically fresh
relative to all four named sources. -/
structure FreshThirdBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Type where
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  sources_ne : source₁ ≠ source₂
  blockers_eq :
    H.blockerVertex source₁ = H.blockerVertex source₂
  blocker_ne_first :
    H.blockerVertex source₁ ≠
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩
  blocker_ne_second :
    H.blockerVertex source₁ ≠
      H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  source₁_ne_first₁ :
    source₁ ≠ ⟨P.source₁, P.source₁_mem_A⟩
  source₁_ne_first₂ :
    source₁ ≠ ⟨P.source₂, P.source₂_mem_A⟩
  source₁_ne_second₁ :
    source₁ ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  source₁_ne_second₂ :
    source₁ ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  source₂_ne_first₁ :
    source₂ ≠ ⟨P.source₁, P.source₁_mem_A⟩
  source₂_ne_first₂ :
    source₂ ≠ ⟨P.source₂, P.source₂_mem_A⟩
  source₂_ne_second₁ :
    source₂ ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  source₂_ne_second₂ :
    source₂ ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  source₁_mem_source₂_shell :
    source₁.1 ∈
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  source₂_mem_source₁_shell :
    source₂.1 ∈
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support

/-- The geometric content of a third source in the first known blocker
fiber, after excluding a named cross hit. -/
structure FreshOutsideFirstBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Type where
  source : CriticalShellSystem.CarrierVertex D.A
  source_ne_first₁ :
    source ≠ ⟨P.source₁, P.source₁_mem_A⟩
  source_ne_first₂ :
    source ≠ ⟨P.source₂, P.source₂_mem_A⟩
  source_ne_second₁ :
    source ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  source_ne_second₂ :
    source ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  blockers_eq :
    H.blockerVertex source =
      H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩
  source_mem_shell :
    source.1 ∈
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support
  source_not_mem_firstCap :
    source.1 ∉ S.capByIndex S.oppIndex1
  otherOutsidePoint : ℝ²
  otherOutsidePoint_mem_A : otherOutsidePoint ∈ D.A
  otherOutsidePoint_ne_source : otherOutsidePoint ≠ source.1
  otherOutsidePoint_ne_second₁ : otherOutsidePoint ≠ Pρ.source₁
  otherOutsidePoint_ne_second₂ : otherOutsidePoint ≠ Pρ.source₂
  otherOutsidePoint_mem_shell :
    otherOutsidePoint ∈
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support
  otherOutsidePoint_not_mem_firstCap :
    otherOutsidePoint ∉ S.capByIndex S.oppIndex1
  outside_eq_pair :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1 =
      {source.1, otherOutsidePoint}

/-- The symmetric geometric content of a third source in the second known
blocker fiber, after excluding a named cross hit. -/
structure FreshOutsideSecondBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Type where
  source : CriticalShellSystem.CarrierVertex D.A
  source_ne_first₁ :
    source ≠ ⟨P.source₁, P.source₁_mem_A⟩
  source_ne_first₂ :
    source ≠ ⟨P.source₂, P.source₂_mem_A⟩
  source_ne_second₁ :
    source ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  source_ne_second₂ :
    source ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  blockers_eq :
    H.blockerVertex source =
      H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  source_mem_shell :
    source.1 ∈
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support
  source_not_mem_firstCap :
    source.1 ∉ S.capByIndex S.oppIndex1
  otherOutsidePoint : ℝ²
  otherOutsidePoint_mem_A : otherOutsidePoint ∈ D.A
  otherOutsidePoint_ne_source : otherOutsidePoint ≠ source.1
  otherOutsidePoint_ne_first₁ : otherOutsidePoint ≠ P.source₁
  otherOutsidePoint_ne_first₂ : otherOutsidePoint ≠ P.source₂
  otherOutsidePoint_mem_shell :
    otherOutsidePoint ∈
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support
  otherOutsidePoint_not_mem_firstCap :
    otherOutsidePoint ∉ S.capByIndex S.oppIndex1
  outside_eq_pair :
    (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1 =
      {source.1, otherOutsidePoint}

/-- A second-side enlarged blocker fiber is the first-side packet after
swapping the two collision rows. -/
def FreshOutsideSecondBlockerFiber.toSwappedFirst
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    {Pρ : RetainedInteriorBlockerCollision Rρ}
    (Q : FreshOutsideSecondBlockerFiber P Pρ) :
    FreshOutsideFirstBlockerFiber Pρ P where
  source := Q.source
  source_ne_first₁ := Q.source_ne_second₁
  source_ne_first₂ := Q.source_ne_second₂
  source_ne_second₁ := Q.source_ne_first₁
  source_ne_second₂ := Q.source_ne_first₂
  blockers_eq := Q.blockers_eq
  source_mem_shell := Q.source_mem_shell
  source_not_mem_firstCap := Q.source_not_mem_firstCap
  otherOutsidePoint := Q.otherOutsidePoint
  otherOutsidePoint_mem_A := Q.otherOutsidePoint_mem_A
  otherOutsidePoint_ne_source := Q.otherOutsidePoint_ne_source
  otherOutsidePoint_ne_second₁ := Q.otherOutsidePoint_ne_first₁
  otherOutsidePoint_ne_second₂ := Q.otherOutsidePoint_ne_first₂
  otherOutsidePoint_mem_shell := Q.otherOutsidePoint_mem_shell
  otherOutsidePoint_not_mem_firstCap :=
    Q.otherOutsidePoint_not_mem_firstCap
  outside_eq_pair := Q.outside_eq_pair

private theorem source_mem_other_shell_of_blockers_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source target : CriticalShellSystem.CarrierVertex A)
    (hblockers :
      H.blockerVertex source = H.blockerVertex target) :
    source.1 ∈
      (H.selectedAt target.1 target.2).toCriticalFourShell.support := by
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq H
      source.2 target.2 (congrArg Subtype.val hblockers)
  rw [← hsupports]
  exact
    (H.selectedAt source.1
      source.2).toCriticalFourShell.q_mem_support

theorem collisionShell_sdiff_firstCap_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1).card = 2 := by
  have hsplit :=
    Finset.card_sdiff_add_card_inter
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support
      (S.capByIndex S.oppIndex1)
  rw [P.shell_inter_cap_eq_sources,
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support_card] at hsplit
  simpa [P.sources_ne] using hsplit

private theorem exists_other_outsidePoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (x : ℝ²) :
    ∃ y ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support,
      y ∉ S.capByIndex S.oppIndex1 ∧ y ≠ x := by
  classical
  let outside :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1
  have hcard : outside.card = 2 := by
    simpa [outside] using collisionShell_sdiff_firstCap_card_eq_two P
  have hone : 1 < outside.card := by omega
  rcases Finset.one_lt_card.mp hone with
    ⟨u, hu, v, hv, huv⟩
  rcases Finset.mem_sdiff.mp hu with ⟨huShell, huOutside⟩
  rcases Finset.mem_sdiff.mp hv with ⟨hvShell, hvOutside⟩
  by_cases hux : u = x
  · refine ⟨v, hvShell, hvOutside, ?_⟩
    intro hvx
    exact huv (hux.trans hvx.symm)
  · exact ⟨u, huShell, huOutside, hux⟩

private theorem outside_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {x y : ℝ²}
    (hxShell :
      x ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)
    (hxOutside : x ∉ S.capByIndex S.oppIndex1)
    (hyShell :
      y ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support)
    (hyOutside : y ∉ S.capByIndex S.oppIndex1)
    (hyx : y ≠ x) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1 =
      {x, y} := by
  classical
  have hsubset :
      ({x, y} : Finset ℝ²) ⊆
        (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_sdiff.mpr ⟨hxShell, hxOutside⟩
    · exact Finset.mem_sdiff.mpr ⟨hyShell, hyOutside⟩
  exact
    (Finset.eq_of_subset_of_card_le hsubset (by
      rw [collisionShell_sdiff_firstCap_card_eq_two P]
      simp [Ne.symm hyx])).symm

/-- The three non-cross-hit outputs left after geometric normalization of the
three-omission blocker split. -/
abbrev GeometricMultiplicityResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Prop :=
  Nonempty (FreshThirdBlockerFiber P Pρ) ∨
    Nonempty (FreshOutsideFirstBlockerFiber P Pρ) ∨
      Nonempty (FreshOutsideSecondBlockerFiber P Pρ)

/-- Exact geometric normalization of the production three-omission
multiplicity disjunction.  This theorem adds no hypotheses and introduces no
conditional closer: every output field is derived from the finite-map arm,
critical support locking, and the two exact cap-intersection equations. -/
theorem collisionCrossHit_or_geometricMultiplicity
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hmultiplicity :
      (∃ x y : CriticalShellSystem.CarrierVertex D.A,
          x ≠ y ∧
            H.blockerVertex x = H.blockerVertex y ∧
            H.blockerVertex x ≠
              H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩ ∧
            H.blockerVertex x ≠
              H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) ∨
        (∃ x : CriticalShellSystem.CarrierVertex D.A,
          x ≠ ⟨P.source₁, P.source₁_mem_A⟩ ∧
            x ≠ ⟨P.source₂, P.source₂_mem_A⟩ ∧
            H.blockerVertex x =
              H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩) ∨
          ∃ x : CriticalShellSystem.CarrierVertex D.A,
            x ≠ ⟨Pρ.source₁, Pρ.source₁_mem_A⟩ ∧
              x ≠ ⟨Pρ.source₂, Pρ.source₂_mem_A⟩ ∧
              H.blockerVertex x =
                H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩) :
    CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ := by
  classical
  let a₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let a₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  let b₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
  let b₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
  have hfa : H.blockerVertex a₁ = H.blockerVertex a₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hfb : H.blockerVertex b₁ = H.blockerVertex b₂ := by
    apply Subtype.ext
    exact Pρ.blockers_eq
  rcases hmultiplicity with hthird | hlarger
  · rcases hthird with
      ⟨x, y, hxy, hblockers, hvalueA, hvalueB⟩
    have hxneA₁ : x ≠ a₁ := by
      intro hx
      exact hvalueA (congrArg H.blockerVertex hx)
    have hxneA₂ : x ≠ a₂ := by
      intro hx
      apply hvalueA
      calc
        H.blockerVertex x = H.blockerVertex a₂ :=
          congrArg H.blockerVertex hx
        _ = H.blockerVertex a₁ := hfa.symm
    have hxneB₁ : x ≠ b₁ := by
      intro hx
      exact hvalueB (congrArg H.blockerVertex hx)
    have hxneB₂ : x ≠ b₂ := by
      intro hx
      apply hvalueB
      calc
        H.blockerVertex x = H.blockerVertex b₂ :=
          congrArg H.blockerVertex hx
        _ = H.blockerVertex b₁ := hfb.symm
    have hyneA₁ : y ≠ a₁ := by
      intro hy
      apply hvalueA
      calc
        H.blockerVertex x = H.blockerVertex y := hblockers
        _ = H.blockerVertex a₁ := congrArg H.blockerVertex hy
    have hyneA₂ : y ≠ a₂ := by
      intro hy
      apply hvalueA
      calc
        H.blockerVertex x = H.blockerVertex y := hblockers
        _ = H.blockerVertex a₂ := congrArg H.blockerVertex hy
        _ = H.blockerVertex a₁ := hfa.symm
    have hyneB₁ : y ≠ b₁ := by
      intro hy
      apply hvalueB
      calc
        H.blockerVertex x = H.blockerVertex y := hblockers
        _ = H.blockerVertex b₁ := congrArg H.blockerVertex hy
    have hyneB₂ : y ≠ b₂ := by
      intro hy
      apply hvalueB
      calc
        H.blockerVertex x = H.blockerVertex y := hblockers
        _ = H.blockerVertex b₂ := congrArg H.blockerVertex hy
        _ = H.blockerVertex b₁ := hfb.symm
    exact Or.inr (Or.inl ⟨
      { source₁ := x
        source₂ := y
        sources_ne := hxy
        blockers_eq := hblockers
        blocker_ne_first := hvalueA
        blocker_ne_second := hvalueB
        source₁_ne_first₁ := by simpa [a₁] using hxneA₁
        source₁_ne_first₂ := by simpa [a₂] using hxneA₂
        source₁_ne_second₁ := by simpa [b₁] using hxneB₁
        source₁_ne_second₂ := by simpa [b₂] using hxneB₂
        source₂_ne_first₁ := by simpa [a₁] using hyneA₁
        source₂_ne_first₂ := by simpa [a₂] using hyneA₂
        source₂_ne_second₁ := by simpa [b₁] using hyneB₁
        source₂_ne_second₂ := by simpa [b₂] using hyneB₂
        source₁_mem_source₂_shell :=
          source_mem_other_shell_of_blockers_eq H x y hblockers
        source₂_mem_source₁_shell :=
          source_mem_other_shell_of_blockers_eq H y x hblockers.symm }⟩)
  · rcases hlarger with hfirst | hsecond
    · rcases hfirst with ⟨x, hxneA₁, hxneA₂, hblockers⟩
      have hxMem :
          x.1 ∈
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support := by
        exact
          source_mem_other_shell_of_blockers_eq H x a₁ hblockers
      by_cases hxb₁ : x = b₁
      · rw [hxb₁] at hxMem
        exact Or.inl (Or.inl (by simpa [b₁] using hxMem))
      · by_cases hxb₂ : x = b₂
        · rw [hxb₂] at hxMem
          exact Or.inl (Or.inr (Or.inl (by simpa [b₂] using hxMem)))
        · have hxOutside :
              x.1 ∉ S.capByIndex S.oppIndex1 := by
            intro hxCap
            have hxInter :
                x.1 ∈
                  (H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support ∩
                    S.capByIndex S.oppIndex1 :=
              Finset.mem_inter.mpr ⟨hxMem, hxCap⟩
            rw [P.shell_inter_cap_eq_sources] at hxInter
            simp only [Finset.mem_insert, Finset.mem_singleton] at hxInter
            rcases hxInter with hx | hx
            · exact hxneA₁ (Subtype.ext hx)
            · exact hxneA₂ (Subtype.ext hx)
          rcases exists_other_outsidePoint P x.1 with
            ⟨y, hyShell, hyOutside, hyx⟩
          have hyA : y ∈ D.A :=
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support_subset_A hyShell
          by_cases hyb₁ : y = Pρ.source₁
          · exact Or.inl (Or.inl (by simpa [hyb₁] using hyShell))
          · by_cases hyb₂ : y = Pρ.source₂
            · exact Or.inl
                (Or.inr (Or.inl (by simpa [hyb₂] using hyShell)))
            · exact Or.inr (Or.inr (Or.inl ⟨
                { source := x
                  source_ne_first₁ := by simpa [a₁] using hxneA₁
                  source_ne_first₂ := by simpa [a₂] using hxneA₂
                  source_ne_second₁ := by simpa [b₁] using hxb₁
                  source_ne_second₂ := by simpa [b₂] using hxb₂
                  blockers_eq := by simpa [a₁] using hblockers
                  source_mem_shell := hxMem
                  source_not_mem_firstCap := hxOutside
                  otherOutsidePoint := y
                  otherOutsidePoint_mem_A := hyA
                  otherOutsidePoint_ne_source := hyx
                  otherOutsidePoint_ne_second₁ := hyb₁
                  otherOutsidePoint_ne_second₂ := hyb₂
                  otherOutsidePoint_mem_shell := hyShell
                  otherOutsidePoint_not_mem_firstCap := hyOutside
                  outside_eq_pair :=
                    outside_eq_pair P hxMem hxOutside
                      hyShell hyOutside hyx }⟩))
    · rcases hsecond with ⟨x, hxneB₁, hxneB₂, hblockers⟩
      have hxMem :
          x.1 ∈
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support := by
        exact
          source_mem_other_shell_of_blockers_eq H x b₁ hblockers
      by_cases hxa₁ : x = a₁
      · rw [hxa₁] at hxMem
        exact Or.inl (Or.inr (Or.inr (Or.inl
          (by simpa [a₁] using hxMem))))
      · by_cases hxa₂ : x = a₂
        · rw [hxa₂] at hxMem
          exact Or.inl (Or.inr (Or.inr (Or.inr
            (by simpa [a₂] using hxMem))))
        · have hxOutside :
              x.1 ∉ S.capByIndex S.oppIndex1 := by
            intro hxCap
            have hxInter :
                x.1 ∈
                  (H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support ∩
                    S.capByIndex S.oppIndex1 :=
              Finset.mem_inter.mpr ⟨hxMem, hxCap⟩
            rw [Pρ.shell_inter_cap_eq_sources] at hxInter
            simp only [Finset.mem_insert, Finset.mem_singleton] at hxInter
            rcases hxInter with hx | hx
            · exact hxneB₁ (Subtype.ext hx)
            · exact hxneB₂ (Subtype.ext hx)
          rcases exists_other_outsidePoint Pρ x.1 with
            ⟨y, hyShell, hyOutside, hyx⟩
          have hyA : y ∈ D.A :=
            (H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hyShell
          by_cases hya₁ : y = P.source₁
          · exact Or.inl (Or.inr (Or.inr (Or.inl
              (by simpa [hya₁] using hyShell))))
          · by_cases hya₂ : y = P.source₂
            · exact Or.inl (Or.inr (Or.inr (Or.inr
                (by simpa [hya₂] using hyShell))))
            · exact Or.inr (Or.inr (Or.inr ⟨
                { source := x
                  source_ne_first₁ := by simpa [a₁] using hxa₁
                  source_ne_first₂ := by simpa [a₂] using hxa₂
                  source_ne_second₁ := by simpa [b₁] using hxneB₁
                  source_ne_second₂ := by simpa [b₂] using hxneB₂
                  blockers_eq := by simpa [b₁] using hblockers
                  source_mem_shell := hxMem
                  source_not_mem_firstCap := hxOutside
                  otherOutsidePoint := y
                  otherOutsidePoint_mem_A := hyA
                  otherOutsidePoint_ne_source := hyx
                  otherOutsidePoint_ne_first₁ := hya₁
                  otherOutsidePoint_ne_first₂ := hya₂
                  otherOutsidePoint_mem_shell := hyShell
                  otherOutsidePoint_not_mem_firstCap := hyOutside
                  outside_eq_pair :=
                    outside_eq_pair Pρ hxMem hxOutside
                      hyShell hyOutside hyx }⟩))


end

end ATailBlockerMultiplicityGeometry
end Problem97
