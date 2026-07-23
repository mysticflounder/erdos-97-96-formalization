/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GenericFamilies

/-!
# Direct-branch Kalmanson cut satisfaction

Families `seeded_full_linear_kalmanson_cut` and
`verified_kalmanson_order_schema_cut` on the direct branch
(`σ = directIndex`): a violated cut instance is a Boolean schema
occurrence over the core boundary's own `patternCode`, refuted by the
existing seeded terminals (`ExactTwoSchemaDecoder`) and the retained-bank
terminal (`RetainedKalmansonDecoder`).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- A fully-true cut instance on the direct branch is a Boolean schema
occurrence over the core boundary's `patternCode`. -/
private theorem schemaAt_eq_true_of_all
    (Q : ExactTwoBoundaryCore R distribution)
    {targets : List Label} {schema : List Membership}
    (hall : ∀ membership ∈ schema,
      rowMem Q directIndex (rolePoint targets membership.1)
        (rolePoint targets membership.2)) :
    schemaAt
      (patternCode Q.boundary (boundary_mem_carrier Q) Q.carrierPattern)
      targets schema = true := by
  unfold schemaAt
  rw [List.all_eq_true]
  intro m hm
  simp only [patternCode_eq_true_iff]
  exact hall m hm

/-- Retained-bank occurrence terminal specialized to the core boundary. -/
private theorem false_of_bank_occurrence
    (Q : ExactTwoBoundaryCore R distribution)
    (occ : RetainedOccurrence
      (patternCode Q.boundary (boundary_mem_carrier Q)
        Q.carrierPattern)) :
    False :=
  false_of_retainedOccurrence D.convex (carrier_card_eq_eleven Q)
    Q.boundary (boundary_mem_carrier Q) Q.boundary_injective
    Q.boundary_image Q.boundary_ccw Q.carrierPattern occ

/-! ## Sorted-list to ordered-tuple conversion -/

private theorem bankOrderedFour_of_sorted {targets : List Label}
    (hlen : targets.length = 4) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedFour,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3,
      _ | ⟨t4, rest⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, h01, h12, h23⟩, rfl⟩

private theorem bankOrderedFive_of_sorted {targets : List Label}
    (hlen : targets.length = 5) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedFive,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, rest⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, h01, h12, h23, h34⟩, rfl⟩

private theorem bankOrderedSix_of_sorted {targets : List Label}
    (hlen : targets.length = 6) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedSix,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, rest⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, t5, h01, h12, h23, h34, h45⟩, rfl⟩

private theorem bankOrderedSeven_of_sorted {targets : List Label}
    (hlen : targets.length = 7) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedSeven,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, _ | ⟨t7, rest⟩⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45, h56⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, t5, t6,
    h01, h12, h23, h34, h45, h56⟩, rfl⟩

private theorem bankOrderedEight_of_sorted {targets : List Label}
    (hlen : targets.length = 8) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedEight,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, _ | ⟨t7, _ | ⟨t8, rest⟩⟩⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45, h56, h67⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, t5, t6, t7,
    h01, h12, h23, h34, h45, h56, h67⟩, rfl⟩

private theorem seededOrderedSix_of_sorted {targets : List Label}
    (hlen : targets.length = 6) (hchain : targets.Chain' (· < ·)) :
    ∃ T : ATailUniqueFourExactTwoSchemaDecoderScratch.OrderedSix,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, rest⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, t5, h01, h12, h23, h34, h45⟩, rfl⟩

private theorem seededOrderedEight_of_sorted {targets : List Label}
    (hlen : targets.length = 8) (hchain : targets.Chain' (· < ·)) :
    ∃ T : ATailUniqueFourExactTwoSchemaDecoderScratch.OrderedEight,
      T.values = targets := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, _ | ⟨t7, _ | ⟨t8, rest⟩⟩⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45, h56, h67⟩ := hchain
  exact ⟨⟨t0, t1, t2, t3, t4, t5, t6, t7,
    h01, h12, h23, h34, h45, h56, h67⟩, rfl⟩

/-! ## Family 17: seeded cuts (direct) -/

/-- Family `seeded_full_linear_kalmanson_cut` on the direct branch. -/
theorem seededFullLinearKalmansonCutSat_direct
    (Q : ExactTwoBoundaryCore R distribution) :
    SeededFullLinearKalmansonCutSat Q directIndex := by
  intro entry hentry targets hlen hchain hall
  have hschema := schemaAt_eq_true_of_all Q hall
  simp only [seededCutSchemas, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · obtain ⟨T, hT⟩ := seededOrderedEight_of_sorted hlen hchain
    exact false_of_p4OrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inl hschema))
  · obtain ⟨T, hT⟩ := seededOrderedEight_of_sorted hlen hchain
    exact false_of_p4OrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inr hschema))
  · obtain ⟨T, hT⟩ := seededOrderedSix_of_sorted hlen hchain
    exact false_of_p5FourRowOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inl hschema))
  · obtain ⟨T, hT⟩ := seededOrderedSix_of_sorted hlen hchain
    exact false_of_p5FourRowOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inr hschema))
  · obtain ⟨T, hT⟩ := seededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleAOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inl hschema))
  · obtain ⟨T, hT⟩ := seededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleAOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inr hschema))
  · obtain ⟨T, hT⟩ := seededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleBOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inl hschema))
  · obtain ⟨T, hT⟩ := seededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleBOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) Q.boundary (boundary_mem_carrier Q)
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hlen]
          exact Bool.or_eq_true.mpr (Or.inr hschema))

/-! ## Family 18: retained-bank cuts (direct) -/

/-- Family `verified_kalmanson_order_schema_cut` on the direct branch. -/
theorem verifiedKalmansonOrderSchemaCutSat_direct
    (Q : ExactTwoBoundaryCore R distribution) :
    VerifiedKalmansonOrderSchemaCutSat Q directIndex := by
  intro entry hentry targets hlen hchain hall
  have hschema := schemaAt_eq_true_of_all Q hall
  simp only [retainedBankSchemas, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema0Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema0Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema1Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema1Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedFour_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema2Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedFour_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema2Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema3Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema3Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedFive_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema4Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedFive_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema4Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedFive_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema5Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema6Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema6Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSeven_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema7Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSeven_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema7Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedEight_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema8Reflected T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema9Normalized T
        (by rw [hT]; exact hschema))
  · obtain ⟨T, hT⟩ := bankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence Q
      (RetainedOccurrence.schema9Reflected T
        (by rw [hT]; exact hschema))

end P5IndexedSourceScratch
end Problem97

#print axioms
  Problem97.P5IndexedSourceScratch.seededFullLinearKalmansonCutSat_direct
#print axioms
  Problem97.P5IndexedSourceScratch.verifiedKalmansonOrderSchemaCutSat_direct
