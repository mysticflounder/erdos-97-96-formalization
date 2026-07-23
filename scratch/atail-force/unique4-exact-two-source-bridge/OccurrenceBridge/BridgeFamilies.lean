/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import BridgeCore

/-!
# Per-family bridge: clause shapes, well-formedness, satisfaction

Each trimmed clause is recorded as a `BridgeEntry`: the stored signed
clause plus a `ClauseShape` naming its retained family's parameters.  The
Boolean `entryWF` kernel-checks that the shape parameters are in range and
that the shape's instantiated literals all occur in the stored clause;
`shape_sat` derives satisfaction of the instantiated literals from the
matching `DenseFamilySatisfaction` field, and the subset transfer of
`BridgeCore` moves it to the stored clause.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5OccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/- ## Shapes and literal builders -/

/-- Retained-family shape of one trimmed clause, with the parameters of
its emitting instance. -/
inductive ClauseShape where
  | transitivity (c w u v : Label)
  | cyclicAlternation (l r p q : Label)
  | rowAtLeastFour (c : Label) (ps : List Label)
  | rowSubsetRadius (c l r : Label)
  | mutualTriangle (a mid bc : Label)
  | apexRowEqClass (p : Label) (classToRow : Bool)
  | apexNotOwnClass
  | strictHitsPair (i j : Label)
  | leftAdjacent
  | rightAdjacent
  | endpointOwnCap (k : Fin 3) (c p q : Label)
  | ownCapAtMostTwo (k : Fin 3) (c p₁ p₂ p₃ : Label)
  | seededCut (idx : Nat) (targets : List Label)
  | bankCut (idx : Nat) (targets : List Label)

/-- Positive literal of an atom. -/
def posOf (a : DenseAtom) : Int := ((varOfAtom a : Nat) : Int)

/-- Negative literal of an atom. -/
def negOf (a : DenseAtom) : Int := -((varOfAtom a : Nat) : Int)

/-- CNF cap positions as lists (same content as `cnfCapPositions`). -/
def capList : Fin 3 → List Label
  | 0 => [0, 1, 2, 3, 4]
  | 1 => [4, 5, 6, 7, 8]
  | 2 => [8, 9, 10, 0]

theorem mem_capList : ∀ (k : Fin 3) (p : Label),
    p ∈ cnfCapPositions k → p ∈ capList k := by decide

/-- Instantiated literals of one shape. -/
def instLits : ClauseShape → List Int
  | .transitivity c w u v =>
      [negOf (sortedEq c w u), negOf (sortedEq c w v),
        posOf (sortedEq c u v)]
  | .cyclicAlternation l r p q =>
      [negOf (.eq l p q), negOf (.eq r p q)]
  | .rowAtLeastFour c ps => ps.map fun p => posOf (.m c p)
  | .rowSubsetRadius c l r =>
      [negOf (.m c l), negOf (.m c r), posOf (.eq c l r)]
  | .mutualTriangle a mid bc =>
      [negOf (.m a mid), negOf (.m a bc), negOf (.m mid a),
        negOf (.m mid bc), posOf (sortedEq bc a mid)]
  | .apexRowEqClass p classToRow =>
      match classToRow with
      | true => [posOf (.m 0 p), negOf (.classA p)]
      | false => [negOf (.m 0 p), posOf (.classA p)]
  | .apexNotOwnClass => [negOf (.classA 0)]
  | .strictHitsPair i j => [posOf (.classA i), posOf (.classA j)]
  | .leftAdjacent => (capList 0).map fun p => posOf (.classA p)
  | .rightAdjacent => (capList 2).map fun p => posOf (.classA p)
  | .endpointOwnCap _ c p q => [negOf (.m c p), negOf (.m c q)]
  | .ownCapAtMostTwo _ c p₁ p₂ p₃ =>
      [negOf (.m c p₁), negOf (.m c p₂), negOf (.m c p₃)]
  | .seededCut idx targets =>
      (seededCutSchemas[idx]!).2.map fun mem =>
        negOf (.m (rolePoint targets mem.1) (rolePoint targets mem.2))
  | .bankCut idx targets =>
      (retainedBankSchemas[idx]!).2.map fun mem =>
        negOf (.m (rolePoint targets mem.1) (rolePoint targets mem.2))

/-- Shape well-formedness: exactly the side conditions the matching
satisfaction field needs. -/
def shapeWF : ClauseShape → Bool
  | .transitivity c w u v =>
      decide (w ≠ u ∧ w ≠ v ∧ u ≠ v ∧ w ≠ c ∧ u ≠ c ∧ v ≠ c)
  | .cyclicAlternation l r p q =>
      decide (l < r ∧ p < q ∧ p ≠ l ∧ p ≠ r ∧ q ≠ l ∧ q ≠ r ∧
        ((l < p ∧ p < r) ↔ (l < q ∧ q < r)))
  | .rowAtLeastFour c ps =>
      decide (ps.length = 7 ∧ ps.Nodup ∧ c ∉ ps)
  | .rowSubsetRadius c l r => decide (l < r ∧ l ≠ c ∧ r ≠ c)
  | .mutualTriangle a mid bc =>
      decide (a ≠ mid ∧ a ≠ bc ∧ mid ≠ bc)
  | .apexRowEqClass p _ => decide (p ≠ 0)
  | .apexNotOwnClass => true
  | .strictHitsPair i j =>
      decide (i ∈ cnfStrictFirstOpposite ∧ j ∈ cnfStrictFirstOpposite ∧
        i ≠ j)
  | .leftAdjacent => true
  | .rightAdjacent => true
  | .endpointOwnCap k c p q =>
      decide (c ∈ cnfCapEndpoints k ∧ p ∈ cnfCapPositions k ∧
        q ∈ cnfCapPositions k ∧ p ≠ c ∧ q ≠ c ∧ p ≠ q)
  | .ownCapAtMostTwo k c p₁ p₂ p₃ =>
      decide (c ∈ cnfCapPositions k ∧ p₁ ∈ cnfCapPositions k ∧
        p₂ ∈ cnfCapPositions k ∧ p₃ ∈ cnfCapPositions k ∧
        p₁ ≠ c ∧ p₂ ≠ c ∧ p₃ ≠ c ∧ p₁ ≠ p₂ ∧ p₁ ≠ p₃ ∧ p₂ ≠ p₃)
  | .seededCut idx targets =>
      decide (idx < 8 ∧ targets.length = (seededCutSchemas[idx]!).1 ∧
        targets.IsChain (· < ·) ∧
        ∀ mem ∈ (seededCutSchemas[idx]!).2,
          rolePoint targets mem.1 ≠ rolePoint targets mem.2)
  | .bankCut idx targets =>
      decide (idx < 18 ∧ targets.length = (retainedBankSchemas[idx]!).1 ∧
        targets.IsChain (· < ·) ∧
        ∀ mem ∈ (retainedBankSchemas[idx]!).2,
          rolePoint targets mem.1 ≠ rolePoint targets mem.2)

/- ## Validity helpers -/

theorem validAtom_m {c p : Label} (h : c ≠ p) :
    validAtom (.m c p) = true := by simp [validAtom, h]

theorem validAtom_eq' {c l r : Label} (h1 : l < r) (h2 : l ≠ c)
    (h3 : r ≠ c) : validAtom (.eq c l r) = true := by
  simp [validAtom, h1, h2, h3]

theorem validAtom_class (p : Label) : validAtom (.classA p) = true := rfl

/- ## Per-family satisfaction of the instantiated literals -/

section FamilyLemmas

variable (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)

private theorem transitivitySat (hQ : DenseFamilySatisfaction Q σ)
    (c w u v : Label) (hwu : w ≠ u) (hwv : w ≠ v) (huv : u ≠ v)
    (hwc : w ≠ c) (huc : u ≠ c) (hvc : v ≠ c) :
    clauseSat (bridgeVal Q σ) (instLits (.transitivity c w u v)) := by
  by_cases h1 : radiusEq Q σ c w u
  · by_cases h2 : radiusEq Q σ c w v
    · refine ⟨posOf (sortedEq c u v), by simp [instLits], ?_⟩
      have huv' : radiusEq Q σ c u v :=
        hQ.radius_partition_transitivity c u w v
          ((radiusEq_comm Q σ c w u).mp h1) h2
      exact litSat_posAtom Q σ _ (validAtom_sortedEq c u v huv huc hvc)
        ((interpAtom_sortedEq Q σ c u v).mpr huv')
    · refine ⟨negOf (sortedEq c w v), by simp [instLits], ?_⟩
      exact litSat_negAtom Q σ _ (validAtom_sortedEq c w v hwv hwc hvc)
        fun hc => h2 ((interpAtom_sortedEq Q σ c w v).mp hc)
  · refine ⟨negOf (sortedEq c w u), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_sortedEq c w u hwu hwc huc)
      fun hc => h1 ((interpAtom_sortedEq Q σ c w u).mp hc)

private theorem cyclicSat (hQ : DenseFamilySatisfaction Q σ)
    (l r p q : Label) (hlr : l < r) (hpq : p < q) (hpl : p ≠ l)
    (hpr : p ≠ r) (hql : q ≠ l) (hqr : q ≠ r)
    (hiff : (l < p ∧ p < r) ↔ (l < q ∧ q < r)) :
    clauseSat (bridgeVal Q σ) (instLits (.cyclicAlternation l r p q)) := by
  have hnot := hQ.full_class_cyclic_alternation l r p q hlr hpq hpl hpr
    hql hqr hiff
  by_cases hA : radiusEq Q σ l p q
  · refine ⟨negOf (.eq r p q), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_eq' hpq hpr hqr)
      fun hB => hnot ⟨hA, hB⟩
  · refine ⟨negOf (.eq l p q), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_eq' hpq hpl hql) hA

private theorem rowAtLeastFourSat' (hQ : DenseFamilySatisfaction Q σ)
    (c : Label) (ps : List Label) (hlen : ps.length = 7)
    (hnodup : ps.Nodup) (hc : c ∉ ps) :
    clauseSat (bridgeVal Q σ) (instLits (.rowAtLeastFour c ps)) := by
  have hcard : ps.toFinset.card = 7 := by
    rw [List.toFinset_card_of_nodup hnodup, hlen]
  have hcT : c ∉ ps.toFinset := by simpa using hc
  obtain ⟨p, hpT, hrow⟩ := hQ.row_at_least_4 c ps.toFinset hcT hcard
  have hp : p ∈ ps := by simpa using hpT
  refine ⟨posOf (.m c p), ?_, ?_⟩
  · simp only [instLits]
    exact List.mem_map.mpr ⟨p, hp, rfl⟩
  · exact litSat_posAtom Q σ _
      (validAtom_m fun h => hc (by rw [h]; exact hp)) hrow

private theorem rowSubsetRadiusSat (hQ : DenseFamilySatisfaction Q σ)
    (c l r : Label) (hlr : l < r) (hlc : l ≠ c) (hrc : r ≠ c) :
    clauseSat (bridgeVal Q σ) (instLits (.rowSubsetRadius c l r)) := by
  by_cases h1 : rowMem Q σ c l
  · by_cases h2 : rowMem Q σ c r
    · refine ⟨posOf (.eq c l r), by simp [instLits], ?_⟩
      exact litSat_posAtom Q σ _ (validAtom_eq' hlr hlc hrc)
        (hQ.selected_row_subset_radius_class c l r h1 h2)
    · refine ⟨negOf (.m c r), by simp [instLits], ?_⟩
      exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm hrc)) h2
  · refine ⟨negOf (.m c l), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm hlc)) h1

private theorem mutualTriangleSat (hQ : DenseFamilySatisfaction Q σ)
    (a mid bc : Label) (hamid : a ≠ mid) (habc : a ≠ bc)
    (hmidbc : mid ≠ bc) :
    clauseSat (bridgeVal Q σ) (instLits (.mutualTriangle a mid bc)) := by
  by_cases h1 : rowMem Q σ a mid
  · by_cases h2 : rowMem Q σ a bc
    · by_cases h3 : rowMem Q σ mid a
      · by_cases h4 : rowMem Q σ mid bc
        · refine ⟨posOf (sortedEq bc a mid), by simp [instLits], ?_⟩
          exact litSat_posAtom Q σ _
            (validAtom_sortedEq bc a mid hamid habc hmidbc)
            ((interpAtom_sortedEq Q σ bc a mid).mpr
              (hQ.mutual_triangle_cross_center_radius_transport
                a mid bc h1 h2 h3 h4))
        · refine ⟨negOf (.m mid bc), by simp [instLits], ?_⟩
          exact litSat_negAtom Q σ _ (validAtom_m hmidbc) h4
      · refine ⟨negOf (.m mid a), by simp [instLits], ?_⟩
        exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm hamid)) h3
    · refine ⟨negOf (.m a bc), by simp [instLits], ?_⟩
      exact litSat_negAtom Q σ _ (validAtom_m habc) h2
  · refine ⟨negOf (.m a mid), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_m hamid) h1

private theorem apexRowEqClassSat' (hQ : DenseFamilySatisfaction Q σ)
    (p : Label) (dir : Bool) (hp : p ≠ 0) :
    clauseSat (bridgeVal Q σ) (instLits (.apexRowEqClass p dir)) := by
  have hiff := hQ.first_apex_row_eq_class p hp
  cases dir with
  | true =>
      by_cases hcl : classHit Q σ p
      · refine ⟨posOf (.m 0 p), by simp [instLits], ?_⟩
        exact litSat_posAtom Q σ _ (validAtom_m (Ne.symm hp))
          (hiff.mpr hcl)
      · refine ⟨negOf (.classA p), by simp [instLits], ?_⟩
        exact litSat_negAtom Q σ _ (validAtom_class p) hcl
  | false =>
      by_cases hrow : rowMem Q σ 0 p
      · refine ⟨posOf (.classA p), by simp [instLits], ?_⟩
        exact litSat_posAtom Q σ _ (validAtom_class p) (hiff.mp hrow)
      · refine ⟨negOf (.m 0 p), by simp [instLits], ?_⟩
        exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm hp)) hrow

private theorem apexNotOwnClassSat (hQ : DenseFamilySatisfaction Q σ) :
    clauseSat (bridgeVal Q σ) (instLits .apexNotOwnClass) :=
  ⟨negOf (.classA 0), by simp [instLits],
    litSat_negAtom Q σ _ (validAtom_class 0)
      hQ.first_apex_not_in_own_class⟩

private theorem strictHitsPairSat (hQ : DenseFamilySatisfaction Q σ)
    (i j : Label) (hi : i ∈ cnfStrictFirstOpposite)
    (hj : j ∈ cnfStrictFirstOpposite) (hij : i ≠ j) :
    clauseSat (bridgeVal Q σ) (instLits (.strictHitsPair i j)) := by
  rcases hQ.exact_two_strict_hits_at_least_2 i hi j hj hij with h | h
  · exact ⟨posOf (.classA i), by simp [instLits],
      litSat_posAtom Q σ _ (validAtom_class i) h⟩
  · exact ⟨posOf (.classA j), by simp [instLits],
      litSat_posAtom Q σ _ (validAtom_class j) h⟩

private theorem leftAdjacentSat (hQ : DenseFamilySatisfaction Q σ) :
    clauseSat (bridgeVal Q σ) (instLits .leftAdjacent) := by
  obtain ⟨p, hp, hcl⟩ := hQ.exact_two_left_adjacent_hit_at_least_1
  refine ⟨posOf (.classA p), ?_, litSat_posAtom Q σ _ (validAtom_class p)
    hcl⟩
  simp only [instLits]
  exact List.mem_map.mpr ⟨p, mem_capList 0 p hp, rfl⟩

private theorem rightAdjacentSat (hQ : DenseFamilySatisfaction Q σ) :
    clauseSat (bridgeVal Q σ) (instLits .rightAdjacent) := by
  obtain ⟨p, hp, hcl⟩ := hQ.exact_two_right_adjacent_hit_at_least_1
  refine ⟨posOf (.classA p), ?_, litSat_posAtom Q σ _ (validAtom_class p)
    hcl⟩
  simp only [instLits]
  exact List.mem_map.mpr ⟨p, mem_capList 2 p hp, rfl⟩

private theorem endpointOwnCapSat (hQ : DenseFamilySatisfaction Q σ)
    (k : Fin 3) (c p q : Label) (hc : c ∈ cnfCapEndpoints k)
    (hp : p ∈ cnfCapPositions k) (hq : q ∈ cnfCapPositions k)
    (hpc : p ≠ c) (hqc : q ≠ c) (hpq : p ≠ q) :
    clauseSat (bridgeVal Q σ) (instLits (.endpointOwnCap k c p q)) := by
  have hnot := hQ.selected_row_endpoint_own_cap_at_most_one k c hc p hp
    q hq hpc hqc hpq
  by_cases h1 : rowMem Q σ c p
  · refine ⟨negOf (.m c q), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm hqc))
      fun h2 => hnot ⟨h1, h2⟩
  · refine ⟨negOf (.m c p), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm hpc)) h1

private theorem ownCapAtMostTwoSat (hQ : DenseFamilySatisfaction Q σ)
    (k : Fin 3) (c p₁ p₂ p₃ : Label) (hc : c ∈ cnfCapPositions k)
    (hp₁ : p₁ ∈ cnfCapPositions k) (hp₂ : p₂ ∈ cnfCapPositions k)
    (hp₃ : p₃ ∈ cnfCapPositions k) (h1c : p₁ ≠ c) (h2c : p₂ ≠ c)
    (h3c : p₃ ≠ c) (h12 : p₁ ≠ p₂) (h13 : p₁ ≠ p₃) (h23 : p₂ ≠ p₃) :
    clauseSat (bridgeVal Q σ)
      (instLits (.ownCapAtMostTwo k c p₁ p₂ p₃)) := by
  have hnot := hQ.selected_row_own_cap_at_most_two k c hc p₁ hp₁ p₂ hp₂
    p₃ hp₃ h1c h2c h3c h12 h13 h23
  by_cases h1 : rowMem Q σ c p₁
  · by_cases h2 : rowMem Q σ c p₂
    · refine ⟨negOf (.m c p₃), by simp [instLits], ?_⟩
      exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm h3c))
        fun h3 => hnot ⟨h1, h2, h3⟩
    · refine ⟨negOf (.m c p₂), by simp [instLits], ?_⟩
      exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm h2c)) h2
  · refine ⟨negOf (.m c p₁), by simp [instLits], ?_⟩
    exact litSat_negAtom Q σ _ (validAtom_m (Ne.symm h1c)) h1

private theorem cutSat {roleCount : Nat} {schema : List Membership}
    (hfam : kalmansonFamilySat Q σ roleCount schema)
    (targets : List Label) (hlen : targets.length = roleCount)
    (hchain : targets.IsChain (· < ·))
    (hdist : ∀ mem ∈ schema,
      rolePoint targets mem.1 ≠ rolePoint targets mem.2) :
    clauseSat (bridgeVal Q σ)
      (schema.map fun mem =>
        negOf (.m (rolePoint targets mem.1) (rolePoint targets mem.2))) := by
  have hcut := hfam targets hlen hchain
  unfold kalmansonCutSat at hcut
  push_neg at hcut
  obtain ⟨mem, hmem, hnrow⟩ := hcut
  refine ⟨negOf (.m (rolePoint targets mem.1) (rolePoint targets mem.2)),
    List.mem_map.mpr ⟨mem, hmem, rfl⟩, ?_⟩
  exact litSat_negAtom Q σ _ (validAtom_m (hdist mem hmem)) hnrow

end FamilyLemmas

/- ## Dispatcher, entries, and the entry-list theorem -/

/-- Any well-formed shape's instantiated literals are satisfied by the
bridge valuation. -/
theorem shape_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hQ : DenseFamilySatisfaction Q σ)
    (s : ClauseShape) (hwf : shapeWF s = true) :
    clauseSat (bridgeVal Q σ) (instLits s) := by
  cases s with
  | transitivity c w u v =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hwf
      exact transitivitySat Q σ hQ c w u v h1 h2 h3 h4 h5 h6
  | cyclicAlternation l r p q =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3, h4, h5, h6, h7⟩ := hwf
      exact cyclicSat Q σ hQ l r p q h1 h2 h3 h4 h5 h6 h7
  | rowAtLeastFour c ps =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3⟩ := hwf
      exact rowAtLeastFourSat' Q σ hQ c ps h1 h2 h3
  | rowSubsetRadius c l r =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3⟩ := hwf
      exact rowSubsetRadiusSat Q σ hQ c l r h1 h2 h3
  | mutualTriangle a mid bc =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3⟩ := hwf
      exact mutualTriangleSat Q σ hQ a mid bc h1 h2 h3
  | apexRowEqClass p dir =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      exact apexRowEqClassSat' Q σ hQ p dir hwf
  | apexNotOwnClass => exact apexNotOwnClassSat Q σ hQ
  | strictHitsPair i j =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3⟩ := hwf
      exact strictHitsPairSat Q σ hQ i j h1 h2 h3
  | leftAdjacent => exact leftAdjacentSat Q σ hQ
  | rightAdjacent => exact rightAdjacentSat Q σ hQ
  | endpointOwnCap k c p q =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hwf
      exact endpointOwnCapSat Q σ hQ k c p q h1 h2 h3 h4 h5 h6
  | ownCapAtMostTwo k c p₁ p₂ p₃ =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10⟩ := hwf
      exact ownCapAtMostTwoSat Q σ hQ k c p₁ p₂ p₃ h1 h2 h3 h4 h5 h6 h7
        h8 h9 h10
  | seededCut idx targets =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨hidx, hlen, hchain, hdist⟩ := hwf
      have hlt : idx < seededCutSchemas.length := by
        have h8 : seededCutSchemas.length = 8 := rfl
        omega
      have hget : seededCutSchemas[idx]! = seededCutSchemas[idx] :=
        getElem!_pos seededCutSchemas idx hlt
      rw [hget] at hlen hdist
      simp only [instLits, hget]
      exact cutSat Q σ
        (hQ.seeded_full_linear_kalmanson_cut _ (List.getElem_mem hlt))
        targets hlen hchain hdist
  | bankCut idx targets =>
      simp only [shapeWF, decide_eq_true_eq] at hwf
      obtain ⟨hidx, hlen, hchain, hdist⟩ := hwf
      have hlt : idx < retainedBankSchemas.length := by
        have h18 : retainedBankSchemas.length = 18 := rfl
        omega
      have hget : retainedBankSchemas[idx]! = retainedBankSchemas[idx] :=
        getElem!_pos retainedBankSchemas idx hlt
      rw [hget] at hlen hdist
      simp only [instLits, hget]
      exact cutSat Q σ
        (hQ.verified_kalmanson_order_schema_cut _ (List.getElem_mem hlt))
        targets hlen hchain hdist

/-- One trimmed clause: the stored signed literals plus the shape of its
emitting instance. -/
structure BridgeEntry where
  clause : List Int
  shape : ClauseShape

/-- Entry well-formedness: shape side conditions hold and every
instantiated literal occurs in the stored clause. -/
def entryWF (e : BridgeEntry) : Bool :=
  shapeWF e.shape && litsSubset (instLits e.shape) e.clause

theorem entry_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hQ : DenseFamilySatisfaction Q σ)
    (e : BridgeEntry) (hwf : entryWF e = true) :
    clauseSat (bridgeVal Q σ) e.clause := by
  simp only [entryWF, Bool.and_eq_true] at hwf
  exact clauseSat_of_subset hwf.2 (shape_sat Q σ hQ e.shape hwf.1)

/-- Every stored clause of a well-formed entry list is satisfied by the
bridge valuation. -/
theorem entryList_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (hQ : DenseFamilySatisfaction Q σ)
    (es : List BridgeEntry) (hwf : es.all entryWF = true) :
    ∀ clause ∈ es.map BridgeEntry.clause,
      clauseSat (bridgeVal Q σ) clause := by
  intro clause hclause
  obtain ⟨e, he, rfl⟩ := List.mem_map.mp hclause
  exact entry_sat Q σ hQ e (List.all_eq_true.mp hwf e he)

end P5OccurrenceBridgeScratch
end Problem97

#print axioms Problem97.P5OccurrenceBridgeScratch.shape_sat
#print axioms Problem97.P5OccurrenceBridgeScratch.entryList_sat
