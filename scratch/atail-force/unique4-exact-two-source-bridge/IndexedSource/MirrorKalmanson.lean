/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MirrorTransport
import MirrorSchema58

/-!
# Mirror-branch Kalmanson cut satisfaction

Families `seeded_full_linear_kalmanson_cut` and
`verified_kalmanson_order_schema_cut` on the mirror branch
(`σ = mirrorIndex`): a fully-true cut instance at strictly increasing CNF
targets becomes, through `ρ = (· + 1) ∘ ρ'`, an occurrence of the
role-reflected schema at the strictly increasing reversed targets over
the shifted boundary.  Retained forward orientations therefore terminate
at the reflected occurrence constructors and retained reflected
orientations at the normalized ones; the two reflected-only bank schemas
(`5` and `8`) terminate at the `MirrorSchema58` normalized consumers.
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

/-! ## Role reflection of a fully-true mirror cut instance -/

private theorem rolePoint_reflected {targets : List Label} {n : Nat}
    (hlen : targets.length = n) {j : Nat} (hj : j < n) :
    rolePoint ((targets.map reflFin).reverse) (n - 1 - j) =
      reflFin (rolePoint targets j) := by
  unfold rolePoint
  have hmaplen : (targets.map reflFin).length = n := by
    rw [List.length_map, hlen]
  have hrevlen : ((targets.map reflFin).reverse).length = n := by
    rw [List.length_reverse, hmaplen]
  rw [List.getElem!_pos _ _ (by omega : n - 1 - j < _),
    List.getElem!_pos _ _ (by omega : j < targets.length)]
  rw [List.getElem_reverse]
  rw [List.getElem_map]
  congr 1
  omega

/-- A fully-true mirror cut instance is a Boolean occurrence of the
role-reflected schema at the reversed targets over the shifted
boundary. -/
private theorem schemaAt_reflected_of_mirror
    (Q : ExactTwoBoundaryCore R distribution)
    {n : Nat} {targets : List Label} (hlen : targets.length = n)
    {schema : List Membership}
    (hroles : ∀ m ∈ schema, m.1 < n ∧ m.2 < n)
    (hall : ∀ m ∈ schema,
      rowMem Q mirrorIndex (rolePoint targets m.1)
        (rolePoint targets m.2)) :
    schemaAt
      (patternCode (shiftedBoundary Q) (shiftedBoundary_mem Q)
        Q.carrierPattern)
      ((targets.map reflFin).reverse) (reflectSchema n schema) = true := by
  unfold schemaAt
  rw [List.all_eq_true]
  intro m' hm'
  unfold reflectSchema at hm'
  rcases List.mem_map.mp hm' with ⟨m, hm, rfl⟩
  obtain ⟨ha, hb⟩ := hroles m hm
  have h := (rowMem_iff_patternCode Q mirrorIndex _ _).mp (hall m hm)
  simp only
  rw [rolePoint_reflected hlen ha, rolePoint_reflected hlen hb,
    patternCode_shifted_reflFin]
  exact h

/-- Retained-bank occurrence terminal specialized to the shifted
boundary. -/
private theorem false_of_bank_occurrence_mirror
    (Q : ExactTwoBoundaryCore R distribution)
    (occ : RetainedOccurrence
      (patternCode (shiftedBoundary Q) (shiftedBoundary_mem Q)
        Q.carrierPattern)) :
    False :=
  false_of_retainedOccurrence D.convex (carrier_card_eq_eleven Q)
    (shiftedBoundary Q) (shiftedBoundary_mem Q)
    (shiftedBoundary_injective Q) (shiftedBoundary_image Q)
    (shiftedBoundary_ccw Q) Q.carrierPattern occ

/-! ## Sorted-list to reflected ordered-tuple conversion -/

private theorem reflectedBankOrderedFour_of_sorted {targets : List Label}
    (hlen : targets.length = 4) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedFour,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3,
      _ | ⟨t4, rest⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23⟩ := hchain
  exact ⟨⟨reflFin t3, reflFin t2, reflFin t1, reflFin t0,
    reflFin_lt h23, reflFin_lt h12, reflFin_lt h01⟩, rfl⟩

private theorem reflectedBankOrderedFive_of_sorted {targets : List Label}
    (hlen : targets.length = 5) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedFive,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, rest⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34⟩ := hchain
  exact ⟨⟨reflFin t4, reflFin t3, reflFin t2, reflFin t1, reflFin t0,
    reflFin_lt h34, reflFin_lt h23, reflFin_lt h12, reflFin_lt h01⟩,
    rfl⟩

private theorem reflectedBankOrderedSix_of_sorted {targets : List Label}
    (hlen : targets.length = 6) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedSix,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, rest⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45⟩ := hchain
  exact ⟨⟨reflFin t5, reflFin t4, reflFin t3, reflFin t2, reflFin t1,
    reflFin t0, reflFin_lt h45, reflFin_lt h34, reflFin_lt h23,
    reflFin_lt h12, reflFin_lt h01⟩, rfl⟩

private theorem reflectedBankOrderedSeven_of_sorted {targets : List Label}
    (hlen : targets.length = 7) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedSeven,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, _ | ⟨t7, rest⟩⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45, h56⟩ := hchain
  exact ⟨⟨reflFin t6, reflFin t5, reflFin t4, reflFin t3, reflFin t2,
    reflFin t1, reflFin t0, reflFin_lt h56, reflFin_lt h45,
    reflFin_lt h34, reflFin_lt h23, reflFin_lt h12, reflFin_lt h01⟩,
    rfl⟩

private theorem reflectedBankOrderedEight_of_sorted {targets : List Label}
    (hlen : targets.length = 8) (hchain : targets.Chain' (· < ·)) :
    ∃ T : RetainedKalmansonDecoderScratch.OrderedEight,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, _ | ⟨t7, _ | ⟨t8, rest⟩⟩⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45, h56, h67⟩ := hchain
  exact ⟨⟨reflFin t7, reflFin t6, reflFin t5, reflFin t4, reflFin t3,
    reflFin t2, reflFin t1, reflFin t0, reflFin_lt h67, reflFin_lt h56,
    reflFin_lt h45, reflFin_lt h34, reflFin_lt h23, reflFin_lt h12,
    reflFin_lt h01⟩, rfl⟩

private theorem reflectedSeededOrderedSix_of_sorted {targets : List Label}
    (hlen : targets.length = 6) (hchain : targets.Chain' (· < ·)) :
    ∃ T : ATailUniqueFourExactTwoSchemaDecoderScratch.OrderedSix,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, rest⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45⟩ := hchain
  exact ⟨⟨reflFin t5, reflFin t4, reflFin t3, reflFin t2, reflFin t1,
    reflFin t0, reflFin_lt h45, reflFin_lt h34, reflFin_lt h23,
    reflFin_lt h12, reflFin_lt h01⟩, rfl⟩

private theorem reflectedSeededOrderedEight_of_sorted
    {targets : List Label}
    (hlen : targets.length = 8) (hchain : targets.Chain' (· < ·)) :
    ∃ T : ATailUniqueFourExactTwoSchemaDecoderScratch.OrderedEight,
      T.values = (targets.map reflFin).reverse := by
  rcases targets with _ | ⟨t0, _ | ⟨t1, _ | ⟨t2, _ | ⟨t3, _ | ⟨t4,
      _ | ⟨t5, _ | ⟨t6, _ | ⟨t7, _ | ⟨t8, rest⟩⟩⟩⟩⟩⟩⟩⟩⟩ <;>
    simp only [List.length_nil, List.length_cons] at hlen <;>
    try omega
  simp only [List.chain'_cons, List.chain'_singleton, and_true]
    at hchain
  obtain ⟨h01, h12, h23, h34, h45, h56, h67⟩ := hchain
  exact ⟨⟨reflFin t7, reflFin t6, reflFin t5, reflFin t4, reflFin t3,
    reflFin t2, reflFin t1, reflFin t0, reflFin_lt h67, reflFin_lt h56,
    reflFin_lt h45, reflFin_lt h34, reflFin_lt h23, reflFin_lt h12,
    reflFin_lt h01⟩, rfl⟩

/-! ## Family 17: seeded cuts (mirror) -/

/-- Family `seeded_full_linear_kalmanson_cut` on the mirror branch. -/
theorem seededFullLinearKalmansonCutSat_mirror
    (Q : ExactTwoBoundaryCore R distribution) :
    SeededFullLinearKalmansonCutSat Q mirrorIndex := by
  intro entry hentry targets hlen hchain hall
  have hrevlen : ((targets.map reflFin).reverse).length =
      targets.length := by
    rw [List.length_reverse, List.length_map]
  simp only [seededCutSchemas, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedEight_of_sorted hlen hchain
    exact false_of_p4OrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen]
          exact Bool.or_eq_true.mpr
            (Or.inr (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedEight_of_sorted hlen hchain
    exact false_of_p4OrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen,
            show p4FourEndpointK2Schema =
                reflectSchema 8 (reflectSchema 8 p4FourEndpointK2Schema)
              from by decide]
          exact Bool.or_eq_true.mpr
            (Or.inl (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedSix_of_sorted hlen hchain
    exact false_of_p5FourRowOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen]
          exact Bool.or_eq_true.mpr
            (Or.inr (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedSix_of_sorted hlen hchain
    exact false_of_p5FourRowOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen,
            show p5TwoK1TwoK2Schema =
                reflectSchema 6 (reflectSchema 6 p5TwoK1TwoK2Schema)
              from by decide]
          exact Bool.or_eq_true.mpr
            (Or.inl (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleAOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen]
          exact Bool.or_eq_true.mpr
            (Or.inr (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleAOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen,
            show p5TriangleASchema =
                reflectSchema 6 (reflectSchema 6 p5TriangleASchema)
              from by decide]
          exact Bool.or_eq_true.mpr
            (Or.inl (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleBOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen]
          exact Bool.or_eq_true.mpr
            (Or.inr (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))
  · obtain ⟨T, hT⟩ := reflectedSeededOrderedSix_of_sorted hlen hchain
    exact false_of_p5TriangleBOrientedSchemaAt D.convex
      (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by unfold orientedSchemaAt
          rw [hT, hrevlen, hlen,
            show p5TriangleBSchema =
                reflectSchema 6 (reflectSchema 6 p5TriangleBSchema)
              from by decide]
          exact Bool.or_eq_true.mpr
            (Or.inl (schemaAt_reflected_of_mirror Q hlen
              (by decide) hall)))

/-! ## Family 18: retained-bank cuts (mirror) -/

/-- Family `verified_kalmanson_order_schema_cut` on the mirror branch. -/
theorem verifiedKalmansonOrderSchemaCutSat_mirror
    (Q : ExactTwoBoundaryCore R distribution) :
    VerifiedKalmansonOrderSchemaCutSat Q mirrorIndex := by
  intro entry hentry targets hlen hchain hall
  simp only [retainedBankSchemas, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema0Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema0Normalized T
        (by rw [hT, show schema0 =
              reflectSchema 6 (reflectSchema 6 schema0) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema1Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema1Normalized T
        (by rw [hT, show schema1 =
              reflectSchema 6 (reflectSchema 6 schema1) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedFour_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema2Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedFour_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema2Normalized T
        (by rw [hT, show schema2 =
              reflectSchema 4 (reflectSchema 4 schema2) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema3Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema3Normalized T
        (by rw [hT, show schema3 =
              reflectSchema 6 (reflectSchema 6 schema3) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedFive_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema4Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedFive_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema4Normalized T
        (by rw [hT, show schema4 =
              reflectSchema 5 (reflectSchema 5 schema4) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedFive_of_sorted hlen hchain
    exact P5MirrorSchema58Scratch.false_of_schemaFive_normalized_at
      D.convex (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by rw [hT, show schema5 =
            reflectSchema 5 (reflectSchema 5 schema5) from by decide]
          exact schemaAt_reflected_of_mirror Q hlen (by decide) hall)
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema6Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema6Normalized T
        (by rw [hT, show schema6 =
              reflectSchema 6 (reflectSchema 6 schema6) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSeven_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema7Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSeven_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema7Normalized T
        (by rw [hT, show schema7 =
              reflectSchema 7 (reflectSchema 7 schema7) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedEight_of_sorted hlen hchain
    exact P5MirrorSchema58Scratch.false_of_schemaEight_normalized_at
      D.convex (carrier_card_eq_eleven Q) (shiftedBoundary Q)
      (shiftedBoundary_mem Q) (shiftedBoundary_injective Q)
      (shiftedBoundary_image Q) (shiftedBoundary_ccw Q)
      Q.carrierPattern T
      (by rw [hT, show schema8 =
            reflectSchema 8 (reflectSchema 8 schema8) from by decide]
          exact schemaAt_reflected_of_mirror Q hlen (by decide) hall)
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema9Reflected T
        (by rw [hT]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))
  · obtain ⟨T, hT⟩ := reflectedBankOrderedSix_of_sorted hlen hchain
    exact false_of_bank_occurrence_mirror Q
      (RetainedOccurrence.schema9Normalized T
        (by rw [hT, show schema9 =
              reflectSchema 6 (reflectSchema 6 schema9) from by decide]
            exact schemaAt_reflected_of_mirror Q hlen (by decide) hall))

end P5IndexedSourceScratch
end Problem97

#print axioms
  Problem97.P5IndexedSourceScratch.seededFullLinearKalmansonCutSat_mirror
#print axioms
  Problem97.P5IndexedSourceScratch.verifiedKalmansonOrderSchemaCutSat_mirror
