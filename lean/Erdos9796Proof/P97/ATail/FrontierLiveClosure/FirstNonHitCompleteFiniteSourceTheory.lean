/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCompleteFiniteSourceTheoryCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCompleteFiniteSourceTheoryBranches
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitCompleteFiniteSourceTheoryContext

/-!
# Aggregate finite source theory for the FreshThird FirstNonHit leaf

This module packages the kernel-derived finite facts that the source-total
solver encoding may use.  It is a sound relaxation of the live leaf, not a
finite-to-universal reduction and not a contradiction theorem.

The projection deliberately does not encode the tri-apex rich-class packet,
the aligned two-point-deletion minimal cores, or an identification of the
independent common-radius witness with the named canonical surface.  Those
boundaries are recorded by `FirstNonHitFiniteProjectionGap` below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open Census554.GeneralCarrierBridge

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)

/-- The finite carrier points lying in a closed indexed cap. -/
def firstNonHitFiniteCapIndices
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) (cap : Fin 3) :
    Finset (Fin A.boundary.n) :=
  Finset.univ.filter fun source ↦ A.inCap source cap

@[simp] theorem mem_firstNonHitFiniteCapIndices_iff
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (cap : Fin 3) (source : Fin A.boundary.n) :
    source ∈ firstNonHitFiniteCapIndices P Pρ C Q A cap ↔
      A.boundary.boundary source ∈ S.capByIndex cap := by
  simp [firstNonHitFiniteCapIndices, A.inCap_iff]

/-- Finite cap cardinalities agree exactly with their geometric source caps. -/
theorem firstNonHitFiniteCapIndices_card_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) (cap : Fin 3) :
    (firstNonHitFiniteCapIndices P Pρ C Q A cap).card =
      (S.capByIndex cap).card := by
  have himage :
      (firstNonHitFiniteCapIndices P Pρ C Q A cap).image
          A.boundary.boundary = S.capByIndex cap := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨source, hsource, rfl⟩
      exact (mem_firstNonHitFiniteCapIndices_iff P Pρ C Q A cap source).mp hsource
    · intro hx
      have hxA : x ∈ D.A := S.capByIndex_subset cap hx
      have hxImage : x ∈ Finset.univ.image A.boundary.boundary := by
        rw [A.boundary.boundary_image]
        exact hxA
      rcases Finset.mem_image.mp hxImage with ⟨source, _, rfl⟩
      exact Finset.mem_image.mpr
        ⟨source,
          (mem_firstNonHitFiniteCapIndices_iff P Pρ C Q A cap source).mpr hx,
          rfl⟩
  calc
    (firstNonHitFiniteCapIndices P Pρ C Q A cap).card =
        ((firstNonHitFiniteCapIndices P Pρ C Q A cap).image
          A.boundary.boundary).card :=
      (Finset.card_image_of_injective _ A.boundary.boundary_injective).symm
    _ = (S.capByIndex cap).card := congrArg Finset.card himage

/-- The three finite closed caps satisfy the exact source cap-sum identity. -/
theorem firstNonHitFiniteCapIndices_sum
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    (firstNonHitFiniteCapIndices P Pρ C Q A S.surplusIdx).card +
        (firstNonHitFiniteCapIndices P Pρ C Q A S.oppIndex1).card +
          (firstNonHitFiniteCapIndices P Pρ C Q A S.oppIndex2).card =
      A.boundary.n + 3 := by
  rw [firstNonHitFiniteCapIndices_card_eq P Pρ C Q A,
    firstNonHitFiniteCapIndices_card_eq P Pρ C Q A,
    firstNonHitFiniteCapIndices_card_eq P Pρ C Q A]
  have hcard : A.boundary.n = D.A.card := by
    calc
      A.boundary.n = (Finset.univ : Finset (Fin A.boundary.n)).card := by simp
      _ = (Finset.univ.image A.boundary.boundary).card :=
        (Finset.card_image_of_injective _ A.boundary.boundary_injective).symm
      _ = D.A.card := congrArg Finset.card A.boundary.boundary_image
  rw [hcard]
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using S.capSum

private def firstNonHitFinitePullback
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) (U : Finset ℝ²) :
    Finset (Fin A.boundary.n) :=
  Finset.univ.filter fun source ↦ A.boundary.boundary source ∈ U

@[simp] private theorem mem_firstNonHitFinitePullback_iff
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (U : Finset ℝ²) (source : Fin A.boundary.n) :
    source ∈ firstNonHitFinitePullback P Pρ C Q A U ↔
      A.boundary.boundary source ∈ U := by
  simp [firstNonHitFinitePullback]

private theorem firstNonHitFinitePullback_image_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (U : Finset ℝ²) (hU : U ⊆ D.A) :
    (firstNonHitFinitePullback P Pρ C Q A U).image A.boundary.boundary = U := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨source, hsource, rfl⟩
    exact (mem_firstNonHitFinitePullback_iff P Pρ C Q A U source).mp hsource
  · intro hx
    have hxImage : x ∈ Finset.univ.image A.boundary.boundary := by
      rw [A.boundary.boundary_image]
      exact hU hx
    rcases Finset.mem_image.mp hxImage with ⟨source, _, rfl⟩
    exact Finset.mem_image.mpr
      ⟨source,
        (mem_firstNonHitFinitePullback_iff P Pρ C Q A U source).mpr hx,
        rfl⟩

private theorem selectedSupport_eq_of_point_eq
    (q p : ℝ²) (hq : q ∈ D.A) (hp : p ∈ D.A) (heq : q = p) :
    (H.selectedAt q hq).toCriticalFourShell.support =
      (H.selectedAt p hp).toCriticalFourShell.support := by
  subst p
  rfl

/-- Finite form of the source-entitled independent triple-shell escape row. -/
structure FirstNonHitFiniteIndependentEscape
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) where
  support : Finset (Fin A.boundary.n)
  support_card : support.card = 4
  witness : Fin A.boundary.n
  witness_mem : witness ∈ support
  witness_not_mem_seed :
    witness ∉
      (A.row (A.roleIndex .firstRetainedSourceOne) ∪
        A.row (A.roleIndex .secondRetainedSourceOne)) ∪
          A.row (A.roleIndex .freshSourceOne)
  qOverlap_card_le_two :
    (support ∩ A.row (A.roleIndex .freshSourceOne)).card ≤ 2

/-- Project the geometric triple-shell escape onto the complete finite carrier. -/
noncomputable def firstNonHitFiniteIndependentEscape_of_assignment
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    FirstNonHitFiniteIndependentEscape P Pρ C Q A := by
  classical
  let EscapeData :=
    Σ center : ℝ²,
      Σ K : SelectedFourClass D.A center,
        {z : ℝ² //
          z ∈ K.support ∧
            z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ ∧
              (K.support ∩
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.support).card ≤ 2}
  have hdata : Nonempty EscapeData := by
    rcases A.tripleShellEscape with ⟨center, K, z, hzK, hzSeed, hq⟩
    exact ⟨⟨center, K, ⟨z, hzK, hzSeed, hq⟩⟩⟩
  let data := Classical.choice hdata
  let center := data.1
  let K : SelectedFourClass D.A center := data.2.1
  let z : ℝ² := data.2.2.1
  have hzK : z ∈ K.support := data.2.2.2.1
  have hzSeed : z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ :=
    data.2.2.2.2.1
  have hq :
      (K.support ∩
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card ≤
        2 :=
    data.2.2.2.2.2
  let support := firstNonHitFinitePullback P Pρ C Q A K.support
  let witness := A.boundary.indexOf ⟨z, K.support_subset_A hzK⟩
  have hwitnessPoint : A.boundary.boundary witness = z := by
    exact A.boundary.point_eq ⟨z, K.support_subset_A hzK⟩
  have hsupportImage : support.image A.boundary.boundary = K.support := by
    exact firstNonHitFinitePullback_image_eq P Pρ C Q A K.support
      K.support_subset_A
  have hsupportCard : support.card = 4 := by
    calc
      support.card = (support.image A.boundary.boundary).card :=
        (Finset.card_image_of_injective _ A.boundary.boundary_injective).symm
      _ = K.support.card := congrArg Finset.card hsupportImage
      _ = 4 := K.support_card
  have hwitnessMem : witness ∈ support := by
    exact (mem_firstNonHitFinitePullback_iff P Pρ C Q A K.support witness).mpr
      (by simpa [hwitnessPoint] using hzK)
  let seed :=
    (A.row (A.roleIndex .firstRetainedSourceOne) ∪
      A.row (A.roleIndex .secondRetainedSourceOne)) ∪
        A.row (A.roleIndex .freshSourceOne)
  have hfirstPoint :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceOne) = P.source₁ := by
    simpa only [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .firstRetainedSourceOne
  have hsecondPoint :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceOne) = Pρ.source₁ := by
    simpa only [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .secondRetainedSourceOne
  have hfreshPoint :
      A.boundary.boundary (A.roleIndex .freshSourceOne) = Q.source₁.1 := by
    simpa only [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .freshSourceOne
  have hfirstShell :
      (H.selectedAt
        (A.boundary.boundary (A.roleIndex .firstRetainedSourceOne))
        (A.boundary_mem (A.roleIndex .firstRetainedSourceOne))).toCriticalFourShell.support =
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support :=
    selectedSupport_eq_of_point_eq
      (A.boundary.boundary (A.roleIndex .firstRetainedSourceOne)) P.source₁
      (A.boundary_mem (A.roleIndex .firstRetainedSourceOne)) P.source₁_mem_A
      hfirstPoint
  have hsecondShell :
      (H.selectedAt
        (A.boundary.boundary (A.roleIndex .secondRetainedSourceOne))
        (A.boundary_mem (A.roleIndex .secondRetainedSourceOne))).toCriticalFourShell.support =
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support :=
    selectedSupport_eq_of_point_eq
      (A.boundary.boundary (A.roleIndex .secondRetainedSourceOne)) Pρ.source₁
      (A.boundary_mem (A.roleIndex .secondRetainedSourceOne)) Pρ.source₁_mem_A
      hsecondPoint
  have hfreshShell :
      (H.selectedAt
        (A.boundary.boundary (A.roleIndex .freshSourceOne))
        (A.boundary_mem (A.roleIndex .freshSourceOne))).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support :=
    selectedSupport_eq_of_point_eq
      (A.boundary.boundary (A.roleIndex .freshSourceOne)) Q.source₁.1
      (A.boundary_mem (A.roleIndex .freshSourceOne)) Q.source₁.2 hfreshPoint
  have hseedImage :
      seed.image A.boundary.boundary =
        freshThirdCriticalTripleShellSeed P Pρ Q.source₁ := by
    simp only [seed, Finset.image_union, freshThirdCriticalTripleShellSeed]
    rw [A.row_image_eq_shell, A.row_image_eq_shell, A.row_image_eq_shell]
    rw [hfirstShell, hsecondShell, hfreshShell]
  have hwitnessNotSeed : witness ∉ seed := by
    intro hwitness
    apply hzSeed
    rw [← hseedImage]
    exact Finset.mem_image.mpr ⟨witness, hwitness, hwitnessPoint⟩
  have hoverlapImage :
      (support ∩ A.row (A.roleIndex .freshSourceOne)).image A.boundary.boundary =
        K.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨source, hsource, rfl⟩
      rcases Finset.mem_inter.mp hsource with ⟨hsourceSupport, hsourceRow⟩
      exact Finset.mem_inter.mpr
        ⟨by rw [← hsupportImage];
            exact Finset.mem_image.mpr ⟨source, hsourceSupport, rfl⟩,
          by
            have hxRowImage :
                A.boundary.boundary source ∈
                  (A.row (A.roleIndex .freshSourceOne)).image
                    A.boundary.boundary :=
              Finset.mem_image.mpr ⟨source, hsourceRow, rfl⟩
            rw [A.row_image_eq_shell, hfreshShell] at hxRowImage
            exact hxRowImage⟩
    · intro hx
      rcases Finset.mem_inter.mp hx with ⟨hxSupportK, hxQ⟩
      have hxSupport : x ∈ support.image A.boundary.boundary := by
        rw [hsupportImage]
        exact hxSupportK
      rcases Finset.mem_image.mp hxSupport with ⟨source, hsource, rfl⟩
      apply Finset.mem_image.mpr
      refine ⟨source, Finset.mem_inter.mpr ⟨hsource, ?_⟩, rfl⟩
      have hxRowImage :
          A.boundary.boundary source ∈
            (A.row (A.roleIndex .freshSourceOne)).image A.boundary.boundary := by
        rw [A.row_image_eq_shell, hfreshShell]
        exact hxQ
      rcases Finset.mem_image.mp hxRowImage with ⟨other, hother, heq⟩
      have hotherEq : other = source := A.boundary.boundary_injective heq
      simpa [hotherEq] using hother
  have hoverlap : (support ∩ A.row (A.roleIndex .freshSourceOne)).card ≤ 2 := by
    rw [← Finset.card_image_of_injective
      (support ∩ A.row (A.roleIndex .freshSourceOne))
      A.boundary.boundary_injective, hoverlapImage]
    exact hq
  exact
    { support := support
      support_card := hsupportCard
      witness := witness
      witness_mem := hwitnessMem
      witness_not_mem_seed := hwitnessNotSeed
      qOverlap_card_le_two := hoverlap }

/-- Source families intentionally outside this finite relaxation. -/
inductive FirstNonHitFiniteProjectionGap where
  | triApexRichClasses
  | alignedTwoDeletionCore
  | commonRadiusNamedSurface
  deriving DecidableEq, Fintype

/-- Kernel-facing aggregate of all currently projected finite source families. -/
structure FirstNonHitCompleteFiniteSourceTheory
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) where
  roleIndex_exact : ∀ role, ∃! index, A.roleIndex role = index
  blockerMap_exact : ∀ source, ∃! center, A.blockerMap source = center
  capBlocks :
    FirstNonHitFiniteDirectBlocks P Pρ C Q A ∨
      FirstNonHitFiniteMirrorBlocks P Pρ C Q A
  capCard : ∀ cap,
    (firstNonHitFiniteCapIndices P Pρ C Q A cap).card =
      (S.capByIndex cap).card
  capSum :
    (firstNonHitFiniteCapIndices P Pρ C Q A S.surplusIdx).card +
        (firstNonHitFiniteCapIndices P Pρ C Q A S.oppIndex1).card +
          (firstNonHitFiniteCapIndices P Pρ C Q A S.oppIndex2).card =
      A.boundary.n + 3
  namedFacts : FirstNonHitNamedSourceFiniteFacts P Pρ C Q A
  firstInteraction : FirstNonHitFiniteFirstInteraction P Pρ C Q A
  secondInteraction : FirstNonHitFiniteSecondInteraction P Pρ C Q A
  hingress : FirstNonHitFiniteHingress P Pρ C Q A
  retainedContext : FirstNonHitCompleteFiniteSourceTheoryContext P Pρ A
  independentEscape : FirstNonHitFiniteIndependentEscape P Pρ C Q A

namespace FirstNonHitCompleteFiniteSourceTheory

/-- Assemble the declared finite source theory from the live FirstNonHit packet. -/
noncomputable def ofSource
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (hρne : ρ ≠ radius)
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩ S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩ S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    (hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²) {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    FirstNonHitCompleteFiniteSourceTheory P Pρ C Q A where
  roleIndex_exact role := ⟨A.roleIndex role, rfl, fun _ h ↦ h.symm⟩
  blockerMap_exact source := ⟨A.blockerMap source, rfl, fun _ h ↦ h.symm⟩
  capBlocks := A.finite_capBlocks
  capCard := firstNonHitFiniteCapIndices_card_eq P Pρ C Q A
  capSum := firstNonHitFiniteCapIndices_sum P Pρ C Q A
  namedFacts := firstNonHitNamedSourceFiniteFacts_of_assignment P Pρ C Q A
  firstInteraction := firstNonHitFiniteFirstInteraction_of_assignment P Pρ C Q A
  secondInteraction := firstNonHitFiniteSecondInteraction_of_assignment P Pρ C Q A
  hingress := firstNonHitFiniteHingress_of_assignment P Pρ C Q A
  retainedContext := FirstNonHitCompleteFiniteSourceTheoryContext.ofSource
    P Pρ A hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
  independentEscape := firstNonHitFiniteIndependentEscape_of_assignment P Pρ C Q A

end FirstNonHitCompleteFiniteSourceTheory

end

#print axioms FirstNonHitCompleteFiniteSourceTheory.ofSource

end


end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
