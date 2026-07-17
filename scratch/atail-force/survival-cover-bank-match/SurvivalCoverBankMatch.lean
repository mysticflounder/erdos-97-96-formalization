/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredDoubleDeletionProducer
import ContinuationBankMatch

/-!
# Scratch: common-deletion packet extracted from the anchored survival cover

The known blocker fiber has cardinality at most four.  On a carrier of
cardinality at least eleven, its complement therefore has at least seven
sources.  Assign each such source one of the two frontier deletions that
survives at its actual blocker and one closed cap containing the source.
There are only six assignments, so two distinct sources have the same
survival color and lie in one common cap.

At cardinality at least fourteen, one survival color contains at least five
sources outside the known blocker fiber.  Since every actual-blocker source
fiber has cardinality at most four, two of those sources have distinct actual
blockers and therefore produce an existing `CommonDeletionTwoCenterPacket`.
The conclusion remains source-faithful and does not claim that the two actual
blocker centers lie in the sources' cap or have prescribed physical roles.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSurvivalCoverBankMatchScratch

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open ATailAnchoredDoubleDeletionProducerScratch
open ATailContinuationBankMatchScratch

attribute [local instance] Classical.propDecidable

/-- Every ambient point belongs to at least one indexed closed cap. -/
theorem exists_mem_capByIndex_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A) :
    ∃ i : Fin 3, x ∈ S.capByIndex i := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨i, hxInterior⟩
  · have hxCases :
        x = S.triangle.v1 ∨ x = S.triangle.v2 ∨ x = S.triangle.v3 := by
      simpa [MoserTriangle.verts] using hxMoser
    rcases hxCases with rfl | rfl | rfl
    · exact ⟨1, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2⟩
    · exact ⟨0, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1⟩
    · exact ⟨0, by
        simpa [SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1⟩
  · exact ⟨i, S.capInteriorByIndex_subset_capByIndex i hxInterior⟩

/-- Cardinality eleven leaves at least seven source vertices outside the
four-element known-blocker fiber. -/
theorem seven_le_sources_outside_qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : 11 ≤ D.A.card) :
    7 ≤ (Finset.univ \ qBlockerFiber P).card := by
  have hfiber := qBlockerFiber_card_le_four P
  have hsplit := Finset.card_sdiff_add_card_inter
    (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A))
    (qBlockerFiber P)
  have htotal :
      Fintype.card (CriticalShellSystem.CarrierVertex D.A) = D.A.card := by
    simp [CriticalShellSystem.CarrierVertex, Fintype.card_coe]
  simp only [Finset.inter_eq_right.mpr (Finset.subset_univ _),
    Finset.card_univ, htotal] at hsplit
  omega

/-- Cardinality fourteen leaves at least ten source vertices outside the
four-element known-blocker fiber. -/
theorem ten_le_sources_outside_qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : 14 ≤ D.A.card) :
    10 ≤ (Finset.univ \ qBlockerFiber P).card := by
  have hfiber := qBlockerFiber_card_le_four P
  have hsplit := Finset.card_sdiff_add_card_inter
    (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A))
    (qBlockerFiber P)
  have htotal :
      Fintype.card (CriticalShellSystem.CarrierVertex D.A) = D.A.card := by
    simp [CriticalShellSystem.CarrierVertex, Fintype.card_coe]
  simp only [Finset.inter_eq_right.mpr (Finset.subset_univ _),
    Finset.card_univ, htotal] at hsplit
  omega

/-- After discarding the three Moser vertices, cardinality fourteen still
leaves at least seven sources outside the known-blocker fiber. -/
theorem seven_le_nonMoser_sources_outside_qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : 14 ≤ D.A.card) :
    7 ≤ ((Finset.univ \ qBlockerFiber P).filter fun source =>
      source.1 ∉ S.triangle.verts).card := by
  let outside : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    Finset.univ \ qBlockerFiber P
  let moserSources := outside.filter fun source =>
    source.1 ∈ S.triangle.verts
  let moserPoints : Finset ℝ² :=
    moserSources.image fun source => source.1
  have houtside : 10 ≤ outside.card := by
    simpa [outside] using ten_le_sources_outside_qBlockerFiber P hcard
  have hmoserPoints : moserPoints ⊆ S.triangle.verts := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsource, rfl⟩
    exact (Finset.mem_filter.mp hsource).2
  have hmoser : moserSources.card ≤ 3 := by
    calc
      moserSources.card = moserPoints.card :=
        (Finset.card_image_of_injective _ Subtype.val_injective).symm
      _ ≤ S.triangle.verts.card := Finset.card_le_card hmoserPoints
      _ = 3 := S.triangle.verts_card
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := outside) (fun source => source.1 ∈ S.triangle.verts)
  have hseven :
      7 ≤ (outside.filter fun source => source.1 ∉ S.triangle.verts).card := by
    change (outside.filter fun source => source.1 ∈ S.triangle.verts).card +
      (outside.filter fun source => source.1 ∉ S.triangle.verts).card =
        outside.card at hsplit
    change (outside.filter fun source =>
      source.1 ∈ S.triangle.verts).card ≤ 3 at hmoser
    omega
  simpa [outside] using hseven

/-- A non-Moser carrier point lies in a unique strict cap interior. -/
theorem exists_unique_capInteriorByIndex_of_mem_not_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A) (hxNotMoser : x ∉ S.triangle.verts) :
    ∃! i : Fin 3, x ∈ S.capInteriorByIndex i := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨i, hxInterior⟩
  · exact False.elim (hxNotMoser hxMoser)
  · refine ⟨i, hxInterior, ?_⟩
    intro j hxInteriorJ
    by_contra hij
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hxInteriorJ hij
      (S.capInteriorByIndex_subset_capByIndex i hxInterior)

/-- The unique strict-cap index of a non-Moser carrier source. -/
noncomputable def strictSourceCapIndex
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceNotMoser : source.1 ∉ S.triangle.verts) : Fin 3 :=
  Classical.choose
    (exists_unique_capInteriorByIndex_of_mem_not_mem_triangle_verts
      S source.2 hsourceNotMoser)

theorem source_mem_chosenCapInterior
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceNotMoser : source.1 ∉ S.triangle.verts) :
    source.1 ∈ S.capInteriorByIndex
      (strictSourceCapIndex S source hsourceNotMoser) :=
  (Classical.choose_spec
    (exists_unique_capInteriorByIndex_of_mem_not_mem_triangle_verts
      S source.2 hsourceNotMoser)).1

/-- A deterministic closed-cap choice for a carrier source.  At a Moser
vertex the choice is arbitrary among the two incident closed caps. -/
noncomputable def sourceCapIndex
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) : Fin 3 :=
  Classical.choose (exists_mem_capByIndex_of_mem S source.2)

theorem source_mem_chosenCap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    source.1 ∈ S.capByIndex (sourceCapIndex S source) :=
  Classical.choose_spec (exists_mem_capByIndex_of_mem S source.2)

/-- Color zero records survival after deleting the first frontier source;
color one is used otherwise. -/
noncomputable def survivalColor
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (source : CriticalShellSystem.CarrierVertex D.A) : Fin 2 :=
  if HasNEquidistantPointsAt 4 (D.A.erase P.q)
      (H.centerAt source.1 source.2) then 0 else 1

theorem survivalColor_eq_zero_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    survivalColor P source = 0 ↔
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source.1 source.2) := by
  simp [survivalColor]

theorem survivalColor_eq_one_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    survivalColor P source = 1 ↔
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source.1 source.2) := by
  simp [survivalColor]

private theorem finTwo_eq_one_of_ne_zero (color : Fin 2)
    (hcolor : color ≠ 0) : color = 1 := by
  fin_cases color <;> simp_all

/-- A source outside the known blocker fiber satisfies the honest two-color
cover: deletion of `P.q` or deletion of `P.w` survives at its actual blocker. -/
theorem deletionSurvival_cover_of_mem_outside_qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceOutside : source ∈ Finset.univ \ qBlockerFiber P) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt source.1 source.2) := by
  have hsourceNotFiber : source ∉ qBlockerFiber P :=
    (Finset.mem_sdiff.mp hsourceOutside).2
  have hcenterNe :
      H.centerAt source.1 source.2 ≠ H.centerAt P.q P.q_mem_A := by
    intro hcenter
    apply hsourceNotFiber
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, ?_⟩
    apply Subtype.ext
    exact hcenter
  rcases frontierDeletion_survival_or_actualBlocker_eq_qBlocker
      P hnotFour hwSupport source.2 with hq | hw | hcenter
  · exact Or.inl hq
  · exact Or.inr hw
  · exact False.elim (hcenterNe hcenter)

/-- Same-center rigidity for two source-indexed rows in one critical system. -/
theorem selectedSupports_eq_of_actualBlockers_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ A) (hsource₂ : source₂ ∈ A)
    (hcenters :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
  let K : SelectedFourClass A (H.centerAt source₁ hsource₁) :=
    { support :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support
      support_subset_A :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support_subset_A
      support_card :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support_card
      radius :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.radius
      radius_pos :=
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.radius_pos
      support_eq_radius := by
        intro z hz
        rw [hcenters]
        exact
          (H.selectedAt source₂ hsource₂).toCriticalFourShell.support_eq_radius z hz
      center_not_mem := by
        intro hmem
        apply
          (H.selectedAt source₂ hsource₂).toCriticalFourShell.center_not_mem_support
        let T :=
          (H.selectedAt source₂ hsource₂).toCriticalFourShell.support
        have hmemT : H.centerAt source₁ hsource₁ ∈ T := hmem
        have hmemT' : H.centerAt source₂ hsource₂ ∈ T := by
          rw [← hcenters]
          exact hmemT
        exact hmemT' }
  exact (H.selectedFourClass_support_eq_shell source₁ hsource₁ K).symm

/-- The source fiber of one actual blocker in a concrete critical system. -/
noncomputable def actualBlockerFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A) :
    Finset (CriticalShellSystem.CarrierVertex A) :=
  Finset.univ.filter fun source =>
    H.blockerVertex source = H.blockerVertex anchor

/-- Same-center support locking bounds every actual-blocker source fiber by
the four points in the anchor's selected critical support. -/
theorem actualBlockerFiber_card_le_four
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A) :
    (actualBlockerFiber H anchor).card ≤ 4 := by
  let points : Finset ℝ² :=
    (actualBlockerFiber H anchor).image fun source => source.1
  have hpoints :
      points ⊆
        (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceFiber, rfl⟩
    have hblockerVertex := (Finset.mem_filter.mp hsourceFiber).2
    have hcenter :
        H.centerAt source.1 source.2 = H.centerAt anchor.1 anchor.2 :=
      congrArg Subtype.val hblockerVertex
    have hsupport :=
      selectedSupports_eq_of_actualBlockers_eq H source.2 anchor.2 hcenter
    have hsourceSupport :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
    rw [hsupport] at hsourceSupport
    exact hsourceSupport
  calc
    (actualBlockerFiber H anchor).card = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support.card :=
      Finset.card_le_card hpoints
    _ = 4 :=
      (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support_card

/-- Five carrier sources contain two whose actual blockers are distinct. -/
theorem exists_pair_distinct_actualBlockers_of_five_le_card
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (T : Finset (CriticalShellSystem.CarrierVertex A))
    (hfive : 5 ≤ T.card) :
    ∃ source₁ ∈ T, ∃ source₂ ∈ T,
      H.centerAt source₁.1 source₁.2 ≠
        H.centerAt source₂.1 source₂.2 := by
  by_contra hnone
  have hnonempty : T.Nonempty := Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨anchor, hanchor⟩
  have hsubset : T ⊆ actualBlockerFiber H anchor := by
    intro source hsource
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ source, Subtype.ext ?_⟩
    by_contra hcenters
    apply hnone
    exact ⟨source, hsource, anchor, hanchor, hcenters⟩
  have hle := Finset.card_le_card hsubset
  have hfiber := actualBlockerFiber_card_le_four H anchor
  omega

/-- The exact bank adapter for a monochromatic source pair.  Distinct actual
blockers produce the existing common-deletion packet.  Equal blockers instead
lock both same-cap sources into one exact critical support; that residual is
not a contradiction in the current bank. -/
theorem commonDeletionPacket_or_sameSupportPair_of_sameDeletionSurvival
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {deleted source₁ source₂ : ℝ²}
    (hdeleted : deleted ∈ D.A)
    (hsource₁ : source₁ ∈ D.A) (hsource₂ : source₂ ∈ D.A)
    (hsources : source₁ ≠ source₂)
    (hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (H.centerAt source₁ hsource₁))
    (hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (H.centerAt source₂ hsource₂)) :
    Nonempty (CommonDeletionTwoCenterPacket D H deleted
        (H.centerAt source₁ hsource₁) (H.centerAt source₂ hsource₂)) ∨
      (H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂ ∧
        source₁ ≠ source₂ ∧
        source₁ ∈
          (H.selectedAt source₁ hsource₁).toCriticalFourShell.support ∧
        source₂ ∈
          (H.selectedAt source₁ hsource₁).toCriticalFourShell.support) := by
  by_cases hcenters :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂
  · right
    refine ⟨hcenters, hsources,
      (H.selectedAt source₁ hsource₁).toCriticalFourShell.q_mem_support, ?_⟩
    rw [selectedSupports_eq_of_actualBlockers_eq H hsource₁ hsource₂ hcenters]
    exact (H.selectedAt source₂ hsource₂).toCriticalFourShell.q_mem_support
  · left
    apply nonempty_commonDeletionTwoCenterPacket H hdeleted
    · exact (Finset.mem_erase.mp
        (H.selectedAt source₁ hsource₁).toCriticalFourShell.center_mem).2
    · exact (Finset.mem_erase.mp
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.center_mem).2
    · exact hcenters
    · exact hsurvives₁
    · exact hsurvives₂

/-- Seven sources placed in the six boxes
`survival color × chosen closed cap` force a collision. -/
theorem exists_distinct_sameCap_sameDeletionSurvival_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 11 ≤ D.A.card) :
    ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
      ∃ i : Fin 3,
        source₁ ≠ source₂ ∧
        source₁ ∈ Finset.univ \ qBlockerFiber P ∧
        source₂ ∈ Finset.univ \ qBlockerFiber P ∧
        source₁.1 ∈ S.capByIndex i ∧
        source₂.1 ∈ S.capByIndex i ∧
        ((HasNEquidistantPointsAt 4 (D.A.erase P.q)
              (H.centerAt source₁.1 source₁.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.q)
              (H.centerAt source₂.1 source₂.2)) ∨
          (HasNEquidistantPointsAt 4 (D.A.erase P.w)
              (H.centerAt source₁.1 source₁.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.w)
              (H.centerAt source₂.1 source₂.2))) := by
  let outside : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    Finset.univ \ qBlockerFiber P
  let Box := Fin 2 × Fin 3
  let assignment : {σ // σ ∈ outside} → Box := fun source ↦
    (survivalColor P source.1, sourceCapIndex S source.1)
  have houtside : 7 ≤ outside.card := by
    simpa [outside] using seven_le_sources_outside_qBlockerFiber P hcard
  have hnotInjective : ¬ Function.Injective assignment := by
    intro hinjective
    have hle := Fintype.card_le_of_injective assignment hinjective
    have hdomain : Fintype.card {σ // σ ∈ outside} = outside.card := by
      simp
    have hbox : Fintype.card Box = 6 := by
      simp [Box]
    rw [hdomain, hbox] at hle
    omega
  have hcollision :
      ∃ source₁ source₂ : {σ // σ ∈ outside},
        source₁ ≠ source₂ ∧ assignment source₁ = assignment source₂ := by
    by_contra hnone
    push_neg at hnone
    exact hnotInjective fun source₁ source₂ heq ↦
      Classical.byContradiction fun hne ↦ hnone source₁ source₂ hne heq
  rcases hcollision with ⟨source₁, source₂, hne, hassignment⟩
  have hcolor :
      survivalColor P source₁.1 = survivalColor P source₂.1 :=
    congrArg Prod.fst hassignment
  have hcapIndex :
      sourceCapIndex S source₁.1 = sourceCapIndex S source₂.1 :=
    congrArg Prod.snd hassignment
  let i := sourceCapIndex S source₁.1
  have hcap₁ : source₁.1.1 ∈ S.capByIndex i :=
    source_mem_chosenCap S source₁.1
  have hcap₂ : source₂.1.1 ∈ S.capByIndex i := by
    change source₂.1.1 ∈ S.capByIndex (sourceCapIndex S source₁.1)
    rw [hcapIndex]
    exact source_mem_chosenCap S source₂.1
  have hsource₁Outside := source₁.2
  have hsource₂Outside := source₂.2
  change source₁.1 ∈ Finset.univ \ qBlockerFiber P at hsource₁Outside
  change source₂.1 ∈ Finset.univ \ qBlockerFiber P at hsource₂Outside
  have hsameSurvival :
      (HasNEquidistantPointsAt 4 (D.A.erase P.q)
            (H.centerAt source₁.1.1 source₁.1.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase P.q)
            (H.centerAt source₂.1.1 source₂.1.2)) ∨
        (HasNEquidistantPointsAt 4 (D.A.erase P.w)
            (H.centerAt source₁.1.1 source₁.1.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase P.w)
            (H.centerAt source₂.1.1 source₂.1.2)) := by
    by_cases hq₁ : HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source₁.1.1 source₁.1.2)
    · left
      refine ⟨hq₁, ?_⟩
      apply (survivalColor_eq_zero_iff P source₂.1).1
      rw [← hcolor]
      exact (survivalColor_eq_zero_iff P source₁.1).2 hq₁
    · right
      have hq₂ : ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source₂.1.1 source₂.1.2) := by
        apply (survivalColor_eq_one_iff P source₂.1).1
        rw [← hcolor]
        exact (survivalColor_eq_one_iff P source₁.1).2 hq₁
      exact ⟨
        (deletionSurvival_cover_of_mem_outside_qBlockerFiber
          P hnotFour hwSupport source₁.1 hsource₁Outside).resolve_left hq₁,
        (deletionSurvival_cover_of_mem_outside_qBlockerFiber
          P hnotFour hwSupport source₂.1 hsource₂Outside).resolve_left hq₂⟩
  exact ⟨source₁.1, source₂.1, i, Subtype.coe_injective.ne hne,
    hsource₁Outside, hsource₂Outside, hcap₁, hcap₂, hsameSurvival⟩

/-- At cardinality at least fourteen, the survival-cover collision can be
placed in one strict cap interior rather than merely one closed cap. -/
theorem exists_distinct_sameCapInterior_sameDeletionSurvival_sources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
      ∃ i : Fin 3,
        source₁ ≠ source₂ ∧
        source₁ ∈ Finset.univ \ qBlockerFiber P ∧
        source₂ ∈ Finset.univ \ qBlockerFiber P ∧
        source₁.1 ∈ S.capInteriorByIndex i ∧
        source₂.1 ∈ S.capInteriorByIndex i ∧
        ((HasNEquidistantPointsAt 4 (D.A.erase P.q)
              (H.centerAt source₁.1 source₁.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.q)
              (H.centerAt source₂.1 source₂.2)) ∨
          (HasNEquidistantPointsAt 4 (D.A.erase P.w)
              (H.centerAt source₁.1 source₁.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.w)
              (H.centerAt source₂.1 source₂.2))) := by
  let outside : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    Finset.univ \ qBlockerFiber P
  let eligible := outside.filter fun source =>
    source.1 ∉ S.triangle.verts
  let Box := Fin 2 × Fin 3
  let assignment : {σ // σ ∈ eligible} → Box := fun source ↦
    (survivalColor P source.1,
      strictSourceCapIndex S source.1
        (Finset.mem_filter.mp source.2).2)
  have heligible : 7 ≤ eligible.card := by
    simpa [eligible, outside] using
      seven_le_nonMoser_sources_outside_qBlockerFiber P hcard
  have hnotInjective : ¬ Function.Injective assignment := by
    intro hinjective
    have hle := Fintype.card_le_of_injective assignment hinjective
    have hdomain : Fintype.card {σ // σ ∈ eligible} = eligible.card := by
      simp
    have hbox : Fintype.card Box = 6 := by
      simp [Box]
    rw [hdomain, hbox] at hle
    omega
  have hcollision :
      ∃ source₁ source₂ : {σ // σ ∈ eligible},
        source₁ ≠ source₂ ∧ assignment source₁ = assignment source₂ := by
    by_contra hnone
    push_neg at hnone
    exact hnotInjective fun source₁ source₂ heq ↦
      Classical.byContradiction fun hne ↦ hnone source₁ source₂ hne heq
  rcases hcollision with ⟨source₁, source₂, hne, hassignment⟩
  have hsource₁Eligible := source₁.2
  have hsource₂Eligible := source₂.2
  have hsource₁Outside : source₁.1 ∈ outside :=
    (Finset.mem_filter.mp hsource₁Eligible).1
  have hsource₂Outside : source₂.1 ∈ outside :=
    (Finset.mem_filter.mp hsource₂Eligible).1
  have hsource₁NotMoser : source₁.1.1 ∉ S.triangle.verts :=
    (Finset.mem_filter.mp hsource₁Eligible).2
  have hsource₂NotMoser : source₂.1.1 ∉ S.triangle.verts :=
    (Finset.mem_filter.mp hsource₂Eligible).2
  have hcolor :
      survivalColor P source₁.1 = survivalColor P source₂.1 := by
    simpa [assignment] using congrArg Prod.fst hassignment
  have hcapIndex :
      strictSourceCapIndex S source₁.1 hsource₁NotMoser =
        strictSourceCapIndex S source₂.1 hsource₂NotMoser := by
    simpa [assignment] using congrArg Prod.snd hassignment
  let i := strictSourceCapIndex S source₁.1 hsource₁NotMoser
  have hcap₁ : source₁.1.1 ∈ S.capInteriorByIndex i :=
    source_mem_chosenCapInterior S source₁.1 hsource₁NotMoser
  have hcap₂ : source₂.1.1 ∈ S.capInteriorByIndex i := by
    change source₂.1.1 ∈ S.capInteriorByIndex
      (strictSourceCapIndex S source₁.1 hsource₁NotMoser)
    rw [hcapIndex]
    exact source_mem_chosenCapInterior S source₂.1 hsource₂NotMoser
  change source₁.1 ∈ Finset.univ \ qBlockerFiber P at hsource₁Outside
  change source₂.1 ∈ Finset.univ \ qBlockerFiber P at hsource₂Outside
  have hsameSurvival :
      (HasNEquidistantPointsAt 4 (D.A.erase P.q)
            (H.centerAt source₁.1.1 source₁.1.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase P.q)
            (H.centerAt source₂.1.1 source₂.1.2)) ∨
        (HasNEquidistantPointsAt 4 (D.A.erase P.w)
            (H.centerAt source₁.1.1 source₁.1.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase P.w)
            (H.centerAt source₂.1.1 source₂.1.2)) := by
    by_cases hq₁ : HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source₁.1.1 source₁.1.2)
    · left
      refine ⟨hq₁, ?_⟩
      apply (survivalColor_eq_zero_iff P source₂.1).1
      rw [← hcolor]
      exact (survivalColor_eq_zero_iff P source₁.1).2 hq₁
    · right
      have hq₂ : ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source₂.1.1 source₂.1.2) := by
        apply (survivalColor_eq_one_iff P source₂.1).1
        rw [← hcolor]
        exact (survivalColor_eq_one_iff P source₁.1).2 hq₁
      exact ⟨
        (deletionSurvival_cover_of_mem_outside_qBlockerFiber
          P hnotFour hwSupport source₁.1 hsource₁Outside).resolve_left hq₁,
        (deletionSurvival_cover_of_mem_outside_qBlockerFiber
          P hnotFour hwSupport source₂.1 hsource₂Outside).resolve_left hq₂⟩
  exact ⟨source₁.1, source₂.1, i, Subtype.coe_injective.ne hne,
    hsource₁Outside, hsource₂Outside, hcap₁, hcap₂, hsameSurvival⟩

/-- The card-at-least-fourteen survival cover forces a genuine common-deletion
packet with two distinct actual blockers.  The existential retains the two
source rows and records which frontier point is deleted. -/
theorem exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    ∃ deleted : ℝ², ∃ _hdeleted : deleted ∈ D.A,
      ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
        (deleted = P.q ∨ deleted = P.w) ∧
        source₁ ∈ Finset.univ \ qBlockerFiber P ∧
        source₂ ∈ Finset.univ \ qBlockerFiber P ∧
        H.centerAt source₁.1 source₁.2 ≠
          H.centerAt source₂.1 source₂.2 ∧
        HasNEquidistantPointsAt 4 (D.A.erase deleted)
          (H.centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase deleted)
          (H.centerAt source₂.1 source₂.2) ∧
        Nonempty (CommonDeletionTwoCenterPacket D H deleted
          (H.centerAt source₁.1 source₁.2)
          (H.centerAt source₂.1 source₂.2)) := by
  let outside : Finset (CriticalShellSystem.CarrierVertex D.A) :=
    Finset.univ \ qBlockerFiber P
  let qColor := outside.filter fun source => survivalColor P source = 0
  let notQColor := outside.filter fun source => survivalColor P source ≠ 0
  have houtside : 10 ≤ outside.card := by
    simpa [outside] using ten_le_sources_outside_qBlockerFiber P hcard
  have hsplit := Finset.card_filter_add_card_filter_not
    (s := outside) (fun source => survivalColor P source = 0)
  change qColor.card + notQColor.card = outside.card at hsplit
  by_cases hqFive : 5 ≤ qColor.card
  · rcases exists_pair_distinct_actualBlockers_of_five_le_card
      H qColor hqFive with
      ⟨source₁, hsource₁Color, source₂, hsource₂Color, hcenters⟩
    have hsource₁Outside : source₁ ∈ outside :=
      (Finset.mem_filter.mp hsource₁Color).1
    have hsource₂Outside : source₂ ∈ outside :=
      (Finset.mem_filter.mp hsource₂Color).1
    have hsurvives₁ :
        HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source₁.1 source₁.2) :=
      (survivalColor_eq_zero_iff P source₁).1
        (Finset.mem_filter.mp hsource₁Color).2
    have hsurvives₂ :
        HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source₂.1 source₂.2) :=
      (survivalColor_eq_zero_iff P source₂).1
        (Finset.mem_filter.mp hsource₂Color).2
    have hpacket :
        Nonempty (CommonDeletionTwoCenterPacket D H P.q
          (H.centerAt source₁.1 source₁.2)
          (H.centerAt source₂.1 source₂.2)) := by
      rcases commonDeletionPacket_or_sameSupportPair_of_sameDeletionSurvival
          H P.q_mem_A source₁.2 source₂.2
          (by exact fun heq => hcenters (by simp [heq]))
          hsurvives₁ hsurvives₂ with hpacket | hsame
      · exact hpacket
      · exact False.elim (hcenters hsame.1)
    change source₁ ∈ Finset.univ \ qBlockerFiber P at hsource₁Outside
    change source₂ ∈ Finset.univ \ qBlockerFiber P at hsource₂Outside
    exact ⟨P.q, P.q_mem_A, source₁, source₂, Or.inl rfl,
      hsource₁Outside, hsource₂Outside, hcenters,
      hsurvives₁, hsurvives₂, hpacket⟩
  · have hnotQFive : 5 ≤ notQColor.card := by omega
    rcases exists_pair_distinct_actualBlockers_of_five_le_card
      H notQColor hnotQFive with
      ⟨source₁, hsource₁Color, source₂, hsource₂Color, hcenters⟩
    have hsource₁Outside : source₁ ∈ outside :=
      (Finset.mem_filter.mp hsource₁Color).1
    have hsource₂Outside : source₂ ∈ outside :=
      (Finset.mem_filter.mp hsource₂Color).1
    have hsource₁NotQColor : survivalColor P source₁ ≠ 0 :=
      (Finset.mem_filter.mp hsource₁Color).2
    have hsource₂NotQColor : survivalColor P source₂ ≠ 0 :=
      (Finset.mem_filter.mp hsource₂Color).2
    have hsource₁ColorOne : survivalColor P source₁ = 1 :=
      finTwo_eq_one_of_ne_zero _ hsource₁NotQColor
    have hsource₂ColorOne : survivalColor P source₂ = 1 :=
      finTwo_eq_one_of_ne_zero _ hsource₂NotQColor
    have hqBlocked₁ :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source₁.1 source₁.2) :=
      (survivalColor_eq_one_iff P source₁).1 hsource₁ColorOne
    have hqBlocked₂ :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source₂.1 source₂.2) :=
      (survivalColor_eq_one_iff P source₂).1 hsource₂ColorOne
    change source₁ ∈ Finset.univ \ qBlockerFiber P at hsource₁Outside
    change source₂ ∈ Finset.univ \ qBlockerFiber P at hsource₂Outside
    have hsurvives₁ :
        HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source₁.1 source₁.2) :=
      (deletionSurvival_cover_of_mem_outside_qBlockerFiber
        P hnotFour hwSupport source₁ hsource₁Outside).resolve_left hqBlocked₁
    have hsurvives₂ :
        HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source₂.1 source₂.2) :=
      (deletionSurvival_cover_of_mem_outside_qBlockerFiber
        P hnotFour hwSupport source₂ hsource₂Outside).resolve_left hqBlocked₂
    have hpacket :
        Nonempty (CommonDeletionTwoCenterPacket D H P.w
          (H.centerAt source₁.1 source₁.2)
          (H.centerAt source₂.1 source₂.2)) := by
      rcases commonDeletionPacket_or_sameSupportPair_of_sameDeletionSurvival
          H P.w_mem_A source₁.2 source₂.2
          (by exact fun heq => hcenters (by simp [heq]))
          hsurvives₁ hsurvives₂ with hpacket | hsame
      · exact hpacket
      · exact False.elim (hcenters hsame.1)
    exact ⟨P.w, P.w_mem_A, source₁, source₂, Or.inr rfl,
      hsource₁Outside, hsource₂Outside, hcenters,
      hsurvives₁, hsurvives₂, hpacket⟩

#print axioms exists_mem_capByIndex_of_mem
#print axioms seven_le_sources_outside_qBlockerFiber
#print axioms ten_le_sources_outside_qBlockerFiber
#print axioms seven_le_nonMoser_sources_outside_qBlockerFiber
#print axioms exists_unique_capInteriorByIndex_of_mem_not_mem_triangle_verts
#print axioms deletionSurvival_cover_of_mem_outside_qBlockerFiber
#print axioms selectedSupports_eq_of_actualBlockers_eq
#print axioms actualBlockerFiber_card_le_four
#print axioms exists_pair_distinct_actualBlockers_of_five_le_card
#print axioms commonDeletionPacket_or_sameSupportPair_of_sameDeletionSurvival
#print axioms exists_distinct_sameCap_sameDeletionSurvival_sources
#print axioms exists_distinct_sameCapInterior_sameDeletionSurvival_sources
#print axioms exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen

end ATailSurvivalCoverBankMatchScratch
end Problem97
