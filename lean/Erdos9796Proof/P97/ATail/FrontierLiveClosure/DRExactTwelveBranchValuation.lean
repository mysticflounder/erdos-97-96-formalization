/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveBoundaryIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelvePacketFamilies
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveFirstApexClass
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveIngressRows

/-!
# Valuation of the D-R exact-12 two-family CNF from the two-radius branch

Plan item P3.4b (final slice) of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.  The consumer is the
leaf `false_of_exactFourPostCardElevenTwoRadiusBranch`
(`ATail/FrontierLiveClosure/Rigid221Closure.lean`), which combines the
valuation of this module with the UNSAT certificate of P3.5.

## Interface

* `packetVal pt P quad`: the valuation of the encoder's variable layout.  A
  relation variable reads distance equality of its two edges on the labelled
  points `pt`; the selector variables read the packet data `P`; a `K4`
  selector is true exactly when its quad is the chosen quad `quad c` of its
  center.  The layout is decoded by the numeric ranges of the families
  (`1, …, 2145` relation, then `X`, `Y`, `U`, `K4`, `chi`, `src`, `deleted`,
  `B2:X`, `B2:Y`), each range checked by kernel `decide` on the mirror.
* `labelsOf pt T`: the labels whose points lie in `T`; `labelOf pt x`: the
  label of a carrier point.

## Theorems

* `k4Valuation_packetVal`: `packetVal` is a `K4Valuation` for any packet data
  and any choice of four-label quads equidistant from their centers.  The
  relation variables are decoded through the injectivity of `pairIndex 66` on
  ordered pairs (`pairIndex_inj`, from two `decide` facts on `Fin 66`) and of
  `edgeIndex` on `edges`.
* `exists_packetValuation_of_twoRadiusBranch_exactTwelve`: from the branch
  binders, `D.A.card = 12`, and a `LabelMap`, packet data `P` and quads
  `quad` with `PacketValuation pt (packetVal pt P quad) P`.  The rows, the
  first-apex class, the chosen row, and the shell are the label sets of
  `firstRow.support`, `secondRow.support`, `SelectedClass D.A S.oppApex1
  radius`, `packet.B₂`, `packet.B₁`; the blocker of a label is the label of
  its late blocker center; the source and the deleted label are the labels
  of the ingress source and deleted point.  The cap counts come from L3 and
  L4 through the closed-cap decompositions `mem_surplusCap_iff`,
  `mem_oppCap1_iff`, `mem_oppCap2_iff` (interior plus the two endpoint
  apexes, one of which is the row center and lies outside the row).
* `exists_valuation_of_twoRadiusBranch_exactTwelve`: every clause of
  `DRExactTwelveDimacs.clauses` holds under `packetVal`, from the eight
  family theorems of `DRExactTwelveValuation` and
  `DRExactTwelvePacketFamilies`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveValuation

open DRExactTwelveDimacs
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

/- ## The variable ranges of the layout -/

private theorem equalVar_le : ∀ e ∈ edges, ∀ e' ∈ edges, e ≠ e' →
    equalVar (edgeIndex e.1 e.2) (edgeIndex e'.1 e'.2) ≤ 2145 := by
  decide +kernel

private theorem edgeIndex_lt : ∀ e ∈ edges, edgeIndex e.1 e.2 < 66 := by decide +kernel

private theorem edgeIndex_injOn :
    ∀ e ∈ edges, ∀ e' ∈ edges, edgeIndex e.1 e.2 = edgeIndex e'.1 e'.2 → e = e' := by
  decide +kernel

private theorem xVar_range : ∀ z ∈ others secondApex, 2145 < xVar z ∧ xVar z ≤ 2156 := by
  decide

private theorem yVar_range : ∀ z ∈ others secondApex, 2156 < yVar z ∧ yVar z ≤ 2167 := by
  decide

private theorem uVar_range : ∀ z ∈ others firstApex, 2167 < uVar z ∧ uVar z ≤ 2178 := by
  decide

private theorem k4Selector_range : ∀ c ∈ labels, ∀ qs ∈ k4Selectors c,
    2178 + c * 330 < qs.2 ∧ qs.2 ≤ 2178 + (c + 1) * 330 := by
  decide +kernel

private theorem chiVar_range : ∀ z ∈ labels, ∀ c ∈ blockerCenters z,
    6138 < chiVar z c ∧ chiVar z c ≤ 6259 := by
  decide +kernel

private theorem chiVar_inj : ∀ z ∈ labels, ∀ c ∈ blockerCenters z, ∀ z' ∈ labels,
    ∀ c' ∈ blockerCenters z', chiVar z c = chiVar z' c' → z = z' ∧ c = c' := by
  decide +kernel

private theorem srcVar_range : ∀ z ∈ labels, 6259 < srcVar z ∧ srcVar z ≤ 6271 := by
  decide +kernel

private theorem deletedVar_range : ∀ p ∈ deletedVars, 6271 < p.2 ∧ p.2 ≤ 6279 := by
  decide +kernel

private theorem b2x_eq : b2x = 6280 := by decide +kernel

private theorem b2y_eq : b2y = 6281 := by decide +kernel

/- ## Injectivity of the relation-variable index -/

/-- The index of the first pair with left element `l` in `combinations(range(66), 2)`. -/
private def pairBase (l : ℕ) : ℕ := l * 65 - l * (l - 1) / 2

private theorem pairIndex_eq (l r : ℕ) : pairIndex 66 l r = pairBase l + (r - l - 1) := rfl

private theorem pairBase_succ :
    ∀ l : Fin 66, pairBase ((l : ℕ) + 1) = pairBase l + (65 - (l : ℕ)) := by
  decide +kernel

private theorem pairBase_succ_le :
    ∀ l l' : Fin 66, l < l' → pairBase ((l : ℕ) + 1) ≤ pairBase l' := by
  decide +kernel

private theorem pairIndex_lt_of_lt {l r l' r' : ℕ} (hlr : l < r) (hr : r < 66)
    (hl' : l' < r') (hr' : r' < 66) (h : l < l') :
    pairIndex 66 l r < pairIndex 66 l' r' := by
  rw [pairIndex_eq, pairIndex_eq]
  have h1 : pairBase (l + 1) = pairBase l + (65 - l) := pairBase_succ ⟨l, by omega⟩
  have h2 : pairBase (l + 1) ≤ pairBase l' :=
    pairBase_succ_le ⟨l, by omega⟩ ⟨l', by omega⟩ (Fin.mk_lt_mk.mpr h)
  omega

/-- `pairIndex 66` is injective on the ordered pairs below `66`. -/
private theorem pairIndex_inj {l r l' r' : ℕ} (hlr : l < r) (hr : r < 66) (hl' : l' < r')
    (hr' : r' < 66) (h : pairIndex 66 l r = pairIndex 66 l' r') : l = l' ∧ r = r' := by
  have hll : l = l' := by
    rcases Nat.lt_trichotomy l l' with hlt | heq | hgt
    · exact absurd h (ne_of_lt (pairIndex_lt_of_lt hlr hr hl' hr' hlt))
    · exact heq
    · exact absurd h (ne_of_gt (pairIndex_lt_of_lt hl' hr' hlr hr hgt))
  subst hll
  rw [pairIndex_eq, pairIndex_eq] at h
  omega

/-- A relation variable determines its two edge indices up to order. -/
private theorem equalVar_inj {i j i' j' : ℕ} (hij : i ≠ j) (hi : i < 66) (hj : j < 66)
    (hij' : i' ≠ j') (hi' : i' < 66) (hj' : j' < 66) (h : equalVar i j = equalVar i' j') :
    (i = i' ∧ j = j') ∨ (i = j' ∧ j = i') := by
  unfold equalVar at h
  have := pairIndex_inj (l := min i j) (r := max i j) (l' := min i' j') (r' := max i' j')
    (by omega) (by omega) (by omega) (by omega) (by omega)
  omega

/- ## The valuation of the variable layout -/

/-- The valuation of the encoder's variable layout: a relation variable reads distance
equality of its two edges on the labelled points, the selector variables read the packet
data `P`, and a `K4` selector is true exactly when its quad is the chosen quad of its
center.  The families are decoded by their numeric ranges. -/
def packetVal (pt : Fin 12 → ℝ²) (P : PacketData) (quad : ℕ → Finset ℕ) (v : ℕ) :
    Prop :=
  if v ≤ 2145 then
    ∃ e ∈ edges, ∃ e' ∈ edges, e ≠ e' ∧
      v = equalVar (edgeIndex e.1 e.2) (edgeIndex e'.1 e'.2) ∧
      dist (pt (label e.1)) (pt (label e.2)) = dist (pt (label e'.1)) (pt (label e'.2))
  else if v ≤ 2156 then ∃ z ∈ others secondApex, v = xVar z ∧ z ∈ P.firstRow
  else if v ≤ 2167 then ∃ z ∈ others secondApex, v = yVar z ∧ z ∈ P.secondRow
  else if v ≤ 2178 then ∃ z ∈ others firstApex, v = uVar z ∧ z ∈ P.apexClass
  else if v ≤ 6138 then
    ∃ c ∈ labels, ∃ qs ∈ k4Selectors c, v = qs.2 ∧ qs.1.toFinset = quad c
  else if v ≤ 6259 then
    ∃ z ∈ labels, ∃ c ∈ blockerCenters z, v = chiVar z c ∧ P.blocker z = c
  else if v ≤ 6271 then ∃ z ∈ labels, v = srcVar z ∧ z = P.source
  else if v ≤ 6279 then ∃ d w, (d, w) ∈ deletedVars ∧ v = w ∧ d = P.deleted
  else if v = 6280 then P.chosenRow = P.firstRow
  else if v = 6281 then P.chosenRow = P.secondRow
  else False

section PacketVal

variable {pt : Fin 12 → ℝ²} {P : PacketData} {quad : ℕ → Finset ℕ}

private theorem packetVal_relation {v : ℕ} (h : v ≤ 2145) :
    packetVal pt P quad v ↔ ∃ e ∈ edges, ∃ e' ∈ edges, e ≠ e' ∧
      v = equalVar (edgeIndex e.1 e.2) (edgeIndex e'.1 e'.2) ∧
      dist (pt (label e.1)) (pt (label e.2)) = dist (pt (label e'.1)) (pt (label e'.2)) := by
  unfold packetVal
  rw [if_pos h]

private theorem packetVal_x {v : ℕ} (h1 : 2145 < v) (h2 : v ≤ 2156) :
    packetVal pt P quad v ↔ ∃ z ∈ others secondApex, v = xVar z ∧ z ∈ P.firstRow := by
  unfold packetVal
  rw [if_neg (by omega), if_pos h2]

private theorem packetVal_y {v : ℕ} (h1 : 2156 < v) (h2 : v ≤ 2167) :
    packetVal pt P quad v ↔ ∃ z ∈ others secondApex, v = yVar z ∧ z ∈ P.secondRow := by
  unfold packetVal
  rw [if_neg (by omega), if_neg (by omega), if_pos h2]

private theorem packetVal_u {v : ℕ} (h1 : 2167 < v) (h2 : v ≤ 2178) :
    packetVal pt P quad v ↔ ∃ z ∈ others firstApex, v = uVar z ∧ z ∈ P.apexClass := by
  unfold packetVal
  rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos h2]

private theorem packetVal_k4 {v : ℕ} (h1 : 2178 < v) (h2 : v ≤ 6138) :
    packetVal pt P quad v ↔
      ∃ c ∈ labels, ∃ qs ∈ k4Selectors c, v = qs.2 ∧ qs.1.toFinset = quad c := by
  unfold packetVal
  rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos h2]

private theorem packetVal_chi {v : ℕ} (h1 : 6138 < v) (h2 : v ≤ 6259) :
    packetVal pt P quad v ↔
      ∃ z ∈ labels, ∃ c ∈ blockerCenters z, v = chiVar z c ∧ P.blocker z = c := by
  unfold packetVal
  rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega),
    if_neg (by omega), if_pos h2]

private theorem packetVal_src {v : ℕ} (h1 : 6259 < v) (h2 : v ≤ 6271) :
    packetVal pt P quad v ↔ ∃ z ∈ labels, v = srcVar z ∧ z = P.source := by
  unfold packetVal
  rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega),
    if_neg (by omega), if_neg (by omega), if_pos h2]

private theorem packetVal_deleted {v : ℕ} (h1 : 6271 < v) (h2 : v ≤ 6279) :
    packetVal pt P quad v ↔ ∃ d w, (d, w) ∈ deletedVars ∧ v = w ∧ d = P.deleted := by
  unfold packetVal
  rw [if_neg (by omega), if_neg (by omega), if_neg (by omega), if_neg (by omega),
    if_neg (by omega), if_neg (by omega), if_neg (by omega), if_pos h2]

theorem packetVal_b2x : packetVal pt P quad b2x ↔ P.chosenRow = P.firstRow := by
  rw [b2x_eq]
  unfold packetVal
  simp

theorem packetVal_b2y : packetVal pt P quad b2y ↔ P.chosenRow = P.secondRow := by
  rw [b2y_eq]
  unfold packetVal
  simp

theorem packetVal_xVar {z : ℕ} (hz : z ∈ others secondApex) :
    packetVal pt P quad (xVar z) ↔ z ∈ P.firstRow := by
  obtain ⟨h1, h2⟩ := xVar_range z hz
  rw [packetVal_x h1 h2]
  constructor
  · rintro ⟨z', hz', heq, hmem⟩
    rw [lookup_injOn hz hz' heq]
    exact hmem
  · intro h
    exact ⟨z, hz, rfl, h⟩

theorem packetVal_yVar {z : ℕ} (hz : z ∈ others secondApex) :
    packetVal pt P quad (yVar z) ↔ z ∈ P.secondRow := by
  obtain ⟨h1, h2⟩ := yVar_range z hz
  rw [packetVal_y h1 h2]
  constructor
  · rintro ⟨z', hz', heq, hmem⟩
    rw [lookup_injOn hz hz' heq]
    exact hmem
  · intro h
    exact ⟨z, hz, rfl, h⟩

theorem packetVal_uVar {z : ℕ} (hz : z ∈ others firstApex) :
    packetVal pt P quad (uVar z) ↔ z ∈ P.apexClass := by
  obtain ⟨h1, h2⟩ := uVar_range z hz
  rw [packetVal_u h1 h2]
  constructor
  · rintro ⟨z', hz', heq, hmem⟩
    rw [lookup_injOn hz hz' heq]
    exact hmem
  · intro h
    exact ⟨z, hz, rfl, h⟩

theorem packetVal_chiVar {z c : ℕ} (hz : z ∈ labels) (hc : c ∈ blockerCenters z) :
    packetVal pt P quad (chiVar z c) ↔ P.blocker z = c := by
  obtain ⟨h1, h2⟩ := chiVar_range z hz c hc
  rw [packetVal_chi h1 h2]
  constructor
  · rintro ⟨z', hz', c', hc', heq, hb⟩
    obtain ⟨rfl, rfl⟩ := chiVar_inj z hz c hc z' hz' c' hc' heq
    exact hb
  · intro h
    exact ⟨z, hz, c, hc, rfl, h⟩

theorem packetVal_srcVar {z : ℕ} (hz : z ∈ labels) :
    packetVal pt P quad (srcVar z) ↔ z = P.source := by
  obtain ⟨h1, h2⟩ := srcVar_range z hz
  rw [packetVal_src h1 h2]
  constructor
  · rintro ⟨z', hz', heq, hs⟩
    rw [srcVar_injOn hz hz' heq]
    exact hs
  · intro h
    exact ⟨z, hz, rfl, h⟩

theorem packetVal_deletedVar {d w : ℕ} (hdw : (d, w) ∈ deletedVars) :
    packetVal pt P quad w ↔ d = P.deleted := by
  obtain ⟨h1, h2⟩ := deletedVar_range (d, w) hdw
  rw [packetVal_deleted h1 h2]
  constructor
  · rintro ⟨d', w', hdw', rfl, hd⟩
    rw [fst_eq_of_mem_allocate hdw hdw']
    exact hd
  · intro h
    exact ⟨d, w, hdw, rfl, h⟩

/-- The relation variables of `packetVal` read distance equality on the labelled points. -/
theorem relationValuation_packetVal : RelationValuation pt (packetVal pt P quad) := by
  refine ⟨fun e he e' he' hne => ?_⟩
  rw [packetVal_relation (equalVar_le e he e' he' hne)]
  constructor
  · rintro ⟨f, hf, f', hf', hff', heq, hd⟩
    have hne₁ : edgeIndex e.1 e.2 ≠ edgeIndex e'.1 e'.2 :=
      fun h => hne (edgeIndex_injOn e he e' he' h)
    have hne₂ : edgeIndex f.1 f.2 ≠ edgeIndex f'.1 f'.2 :=
      fun h => hff' (edgeIndex_injOn f hf f' hf' h)
    rcases equalVar_inj hne₁ (edgeIndex_lt e he) (edgeIndex_lt e' he') hne₂ (edgeIndex_lt f hf)
        (edgeIndex_lt f' hf') heq with ⟨h1, h2⟩ | ⟨h1, h2⟩
    · rw [edgeIndex_injOn e he f hf h1, edgeIndex_injOn e' he' f' hf' h2]
      exact hd
    · rw [edgeIndex_injOn e he f' hf' h1, edgeIndex_injOn e' he' f hf h2]
      exact hd.symm
  · intro hd
    exact ⟨e, he, e', he', hne, rfl, hd⟩

/-- Every center has a true selector: the one whose quad is the chosen quad. -/
theorem packetVal_selected (hcard : ∀ c ∈ labels, (quad c).card = 4)
    (hsub : ∀ c ∈ labels, ∀ z ∈ quad c, z ∈ others c) :
    ∀ center ∈ labels, ∃ qs ∈ k4Selectors center, packetVal pt P quad qs.2 := by
  intro c hc
  have hc12 := mem_labels.mp hc
  have hs : ((others c).filter fun z => decide (z ∈ quad c)).Sublist (others c) :=
    List.filter_sublist
  have hnd := (others_nodup c).sublist hs
  have hL : ((others c).filter fun z => decide (z ∈ quad c)).toFinset = quad c := by
    ext z
    rw [List.mem_toFinset, List.mem_filter, decide_eq_true_eq]
    exact ⟨fun h => h.2, fun h => ⟨hsub c hc z h, h⟩⟩
  have hlen : ((others c).filter fun z => decide (z ∈ quad c)).length = 4 := by
    rw [← List.toFinset_card_of_nodup hnd, hL, hcard c hc]
  have hmem := mem_combinations_of_sublist hs
  rw [hlen] at hmem
  obtain ⟨v, hv⟩ := exists_mem_allocate (base := k4Base + c * quadCount) hmem
  refine ⟨(_, v), hv, ?_⟩
  obtain ⟨h1, h2⟩ := k4Selector_range c hc _ hv
  rw [packetVal_k4 (by omega) (by omega)]
  exact ⟨c, hc, (_, v), hv, rfl, hL⟩

/-- A true selector is the chosen quad of its center, hence equidistant from it. -/
theorem packetVal_equidistant
    (heq : ∀ c ∈ labels, ∀ a ∈ quad c, ∀ b ∈ quad c,
      dist (pt (label c)) (pt (label a)) = dist (pt (label c)) (pt (label b))) :
    ∀ center ∈ labels, ∀ qs ∈ k4Selectors center, packetVal pt P quad qs.2 →
      ∀ a ∈ qs.1, ∀ b ∈ qs.1,
        dist (pt (label center)) (pt (label a)) = dist (pt (label center)) (pt (label b)) := by
  rintro c hc ⟨q, v⟩ hqv hval a ha b hb
  have hc12 := mem_labels.mp hc
  obtain ⟨h1, h2⟩ := k4Selector_range c hc (q, v) hqv
  dsimp only at h1 h2 ha hb hval
  rw [packetVal_k4 (by omega) (by omega)] at hval
  obtain ⟨c', hc', ⟨q', v'⟩, hqv', hvv, hq'⟩ := hval
  obtain ⟨h1', h2'⟩ := k4Selector_range c' hc' (q', v') hqv'
  dsimp only at h1' h2' hvv hq'
  have hcc : c = c' := by omega
  subst hcc
  subst hvv
  have hqq : q = q' := fst_eq_of_mem_allocate hqv hqv'
  subst hqq
  exact heq c hc a (hq' ▸ List.mem_toFinset.mpr ha) b (hq' ▸ List.mem_toFinset.mpr hb)

/-- `packetVal` is a `K4Valuation` for four-label quads equidistant from their centers. -/
theorem k4Valuation_packetVal (hcard : ∀ c ∈ labels, (quad c).card = 4)
    (hsub : ∀ c ∈ labels, ∀ z ∈ quad c, z ∈ others c)
    (heq : ∀ c ∈ labels, ∀ a ∈ quad c, ∀ b ∈ quad c,
      dist (pt (label c)) (pt (label a)) = dist (pt (label c)) (pt (label b))) :
    K4Valuation pt (packetVal pt P quad) :=
  { toRelationValuation := relationValuation_packetVal
    selected := packetVal_selected hcard hsub
    equidistant := packetVal_equidistant heq }

end PacketVal

/- ## Labels of carrier points -/

open Classical in
/-- The labels whose points lie in `T`. -/
noncomputable def labelsOf (pt : Fin 12 → ℝ²) (T : Finset ℝ²) : Finset ℕ :=
  (Finset.range 12).filter fun z => pt (label z) ∈ T

theorem mem_labelsOf {pt : Fin 12 → ℝ²} {T : Finset ℝ²} {z : ℕ} :
    z ∈ labelsOf pt T ↔ z < 12 ∧ pt (label z) ∈ T := by
  simp [labelsOf]

theorem labelsOf_inter (pt : Fin 12 → ℝ²) (T T' : Finset ℝ²) :
    labelsOf pt (T ∩ T') = labelsOf pt T ∩ labelsOf pt T' := by
  ext z
  simp only [mem_labelsOf, Finset.mem_inter]
  tauto

/-- The label of a carrier point (`0` off the image of `pt`). -/
noncomputable def labelOf (pt : Fin 12 → ℝ²) (x : ℝ²) : ℕ :=
  if h : ∃ l : Fin 12, pt l = x then ((Classical.choose h : Fin 12) : ℕ) else 0

theorem labelOf_lt (pt : Fin 12 → ℝ²) (x : ℝ²) : labelOf pt x < 12 := by
  unfold labelOf
  split
  · exact Fin.isLt _
  · norm_num

theorem label_coe (l : Fin 12) : label (l : ℕ) = l := Fin.ext (label_val l.isLt)

theorem pt_label_labelOf {pt : Fin 12 → ℝ²} {x : ℝ²} (h : ∃ l : Fin 12, pt l = x) :
    pt (label (labelOf pt x)) = x := by
  unfold labelOf
  rw [dif_pos h, label_coe]
  exact Classical.choose_spec h

namespace LabelMap

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {pt : Fin 12 → ℝ²}

theorem mem_A (hL : LabelMap S pt) (l : Fin 12) : pt l ∈ D.A := by
  rw [← hL.image_eq]
  exact Finset.mem_image_of_mem pt (Finset.mem_univ l)

theorem exists_label (hL : LabelMap S pt) {x : ℝ²} (hx : x ∈ D.A) :
    ∃ l : Fin 12, pt l = x := by
  rw [← hL.image_eq] at hx
  obtain ⟨l, -, hl⟩ := Finset.mem_image.mp hx
  exact ⟨l, hl⟩

theorem pt_labelOf (hL : LabelMap S pt) {x : ℝ²} (hx : x ∈ D.A) :
    pt (label (labelOf pt x)) = x :=
  pt_label_labelOf (hL.exists_label hx)

theorem label_inj (hL : LabelMap S pt) {a b : ℕ} (ha : a < 12) (hb : b < 12)
    (h : pt (label a) = pt (label b)) : a = b :=
  label_injective ha hb (hL.injective h)

theorem labelOf_pt (hL : LabelMap S pt) {z : ℕ} (hz : z < 12) :
    labelOf pt (pt (label z)) = z :=
  hL.label_inj (labelOf_lt pt _) hz (hL.pt_labelOf (hL.mem_A _))

theorem card_labelsOf (hL : LabelMap S pt) {T : Finset ℝ²} (hT : T ⊆ D.A) :
    (labelsOf pt T).card = T.card := by
  have himg : (labelsOf pt T).image (fun z => pt (label z)) = T := by
    ext x
    constructor
    · intro hx
      obtain ⟨z, hz, rfl⟩ := Finset.mem_image.mp hx
      exact (mem_labelsOf.mp hz).2
    · intro hx
      obtain ⟨l, rfl⟩ := hL.exists_label (hT hx)
      exact Finset.mem_image.mpr ⟨l, mem_labelsOf.mpr ⟨l.isLt, by rw [label_coe]; exact hx⟩,
        by rw [label_coe]⟩
  calc (labelsOf pt T).card = ((labelsOf pt T).image (fun z => pt (label z))).card := by
        rw [Finset.card_image_of_injOn]
        intro a ha b hb hab
        exact hL.label_inj (mem_labelsOf.mp ha).1 (mem_labelsOf.mp hb).1 hab
    _ = T.card := by rw [himg]

/-- A label list with the right image is the label set of its image. -/
theorem toFinset_eq_labelsOf (hL : LabelMap S pt) {l : List ℕ} (hl : ∀ z ∈ l, z < 12)
    {T : Finset ℝ²} (himg : l.toFinset.image (fun z => pt (label z)) = T) :
    l.toFinset = labelsOf pt T := by
  ext z
  rw [mem_labelsOf, List.mem_toFinset]
  constructor
  · intro hz
    refine ⟨hl z hz, ?_⟩
    rw [← himg]
    exact Finset.mem_image_of_mem _ (List.mem_toFinset.mpr hz)
  · rintro ⟨hz12, hmem⟩
    rw [← himg] at hmem
    obtain ⟨z', hz', heq⟩ := Finset.mem_image.mp hmem
    rw [List.mem_toFinset] at hz'
    rw [← hL.label_inj (hl z' hz') hz12 heq]
    exact hz'

theorem card_toFinset_inter_labelsOf (hL : LabelMap S pt) {l : List ℕ} (hl : ∀ z ∈ l, z < 12)
    {I : Finset ℝ²} (himg : l.toFinset.image (fun z => pt (label z)) = I) {T : Finset ℝ²}
    (hT : T ⊆ D.A) : (l.toFinset ∩ labelsOf pt T).card = (I ∩ T).card := by
  rw [hL.toFinset_eq_labelsOf hl himg, ← labelsOf_inter,
    hL.card_labelsOf (Finset.inter_subset_right.trans hT)]

end LabelMap

theorem image_append_singleton {pt : Fin 12 → ℝ²} {l : List ℕ} {I : Finset ℝ²}
    (hI : l.toFinset.image (fun z => pt (label z)) = I) (a : ℕ) :
    (l ++ [a]).toFinset.image (fun z => pt (label z)) = I ∪ {pt (label a)} := by
  rw [← hI, List.toFinset_append, Finset.image_union]
  congr 1

/- ## Closed caps as interiors plus apexes -/

private theorem mem_iff_erase_erase {C : Finset ℝ²} {v w : ℝ²} (hv : v ∈ C) (hw : w ∈ C)
    (x : ℝ²) : x ∈ C ↔ x ∈ (C.erase v).erase w ∨ x = v ∨ x = w := by
  simp only [Finset.mem_erase]
  constructor
  · intro hx
    by_cases h1 : x = v
    · exact Or.inr (Or.inl h1)
    by_cases h2 : x = w
    · exact Or.inr (Or.inr h2)
    exact Or.inl ⟨h2, h1, hx⟩
  · rintro (⟨-, -, hx⟩ | rfl | rfl)
    · exact hx
    · exact hv
    · exact hw

/-- The closed surplus cap is its strict interior plus the two opposite apexes. -/
private theorem mem_surplusCap_iff {A : Finset ℝ²} (S : SurplusCapPacket A) (x : ℝ²) :
    x ∈ S.surplusCap ↔
      x ∈ S.capInteriorByIndex S.surplusIdx ∨ x = S.oppApex1 ∨ x = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
    exact mem_iff_erase_erase S.partition.v2_mem_C1 S.partition.v3_mem_C1 x
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
    exact mem_iff_erase_erase S.partition.v3_mem_C2 S.partition.v1_mem_C2 x
  · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi]
    exact mem_iff_erase_erase S.partition.v1_mem_C3 S.partition.v2_mem_C3 x

/-- The closed first opposite cap is its strict interior plus the second opposite apex
and the surplus apex. -/
private theorem mem_oppCap1_iff {A : Finset ℝ²} (S : SurplusCapPacket A) (x : ℝ²) :
    x ∈ S.oppCap1 ↔ x ∈ S.oppInterior1 ∨ x = S.oppApex2 ∨ x = S.surplusApex := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppInterior1,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, hi]
    exact mem_iff_erase_erase S.partition.v3_mem_C2 S.partition.v1_mem_C2 x
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppInterior1,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, hi]
    exact mem_iff_erase_erase S.partition.v1_mem_C3 S.partition.v2_mem_C3 x
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppInterior1,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex2, SurplusCapPacket.surplusApex, hi]
    exact mem_iff_erase_erase S.partition.v2_mem_C1 S.partition.v3_mem_C1 x

/-- The closed second opposite cap is its strict interior plus the surplus apex and the
first opposite apex. -/
private theorem mem_oppCap2_iff {A : Finset ℝ²} (S : SurplusCapPacket A) (x : ℝ²) :
    x ∈ S.oppCap2 ↔ x ∈ S.oppInterior2 ∨ x = S.surplusApex ∨ x = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppCap2, SurplusCapPacket.oppInterior2,
      SurplusCapPacket.oppIndex2, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]
    exact mem_iff_erase_erase S.partition.v1_mem_C3 S.partition.v2_mem_C3 x
  · simp only [SurplusCapPacket.oppCap2, SurplusCapPacket.oppInterior2,
      SurplusCapPacket.oppIndex2, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]
    exact mem_iff_erase_erase S.partition.v2_mem_C1 S.partition.v3_mem_C1 x
  · simp only [SurplusCapPacket.oppCap2, SurplusCapPacket.oppInterior2,
      SurplusCapPacket.oppIndex2, SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.surplusApex, hi]
    exact mem_iff_erase_erase S.partition.v3_mem_C2 S.partition.v1_mem_C2 x

/-- A closed cap seen from its second endpoint, which lies outside `T`. -/
private theorem inter_eq_of_cap_right {I T C : Finset ℝ²} {a b : ℝ²}
    (hC : ∀ x, x ∈ C ↔ x ∈ I ∨ x = a ∨ x = b) (hb : b ∉ T) :
    (I ∪ {a}) ∩ T = T ∩ C := by
  ext x
  simp only [Finset.mem_inter, Finset.mem_union, Finset.mem_singleton, hC]
  constructor
  · rintro ⟨h1, h2⟩
    exact ⟨h2, h1.imp_right Or.inl⟩
  · rintro ⟨h1, h2 | h2 | h2⟩
    · exact ⟨Or.inl h2, h1⟩
    · exact ⟨Or.inr h2, h1⟩
    · exact (hb (h2 ▸ h1)).elim

/-- A closed cap seen from its first endpoint, which lies outside `T`. -/
private theorem inter_eq_of_cap_left {I T C : Finset ℝ²} {a b : ℝ²}
    (hC : ∀ x, x ∈ C ↔ x ∈ I ∨ x = a ∨ x = b) (ha : a ∉ T) :
    (I ∪ {b}) ∩ T = T ∩ C := by
  ext x
  simp only [Finset.mem_inter, Finset.mem_union, Finset.mem_singleton, hC]
  constructor
  · rintro ⟨h1, h2⟩
    exact ⟨h2, h1.imp_right Or.inr⟩
  · rintro ⟨h1, h2 | h2 | h2⟩
    · exact ⟨Or.inl h2, h1⟩
    · exact (ha (h2 ▸ h1)).elim
    · exact ⟨Or.inr h2, h1⟩

/- ## The rows and the class as label sets -/

section Rows

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {pt : Fin 12 → ℝ²}

private theorem row_equidistant (hL : LabelMap S pt) (row : SelectedFourClass D.A S.oppApex2) :
    ∀ a ∈ others secondApex, ∀ b ∈ others secondApex,
      a ∈ labelsOf pt row.support → b ∈ labelsOf pt row.support →
      dist (pt (label secondApex)) (pt (label a)) =
        dist (pt (label secondApex)) (pt (label b)) := by
  intro a _ b _ ha hb
  rw [hL.secondApex_eq, row.support_eq_radius _ (mem_labelsOf.mp ha).2,
    row.support_eq_radius _ (mem_labelsOf.mp hb).2]

private theorem row_closed (hL : LabelMap S pt) (row : SelectedFourClass D.A S.oppApex2)
    (hrow : row.support = SelectedClass D.A S.oppApex2 row.radius) :
    ∀ a ∈ others secondApex, ∀ b ∈ others secondApex, a ∈ labelsOf pt row.support →
      dist (pt (label secondApex)) (pt (label a)) =
        dist (pt (label secondApex)) (pt (label b)) →
      b ∈ labelsOf pt row.support := by
  intro a _ b hb ha hd
  have ha' := mem_labelsOf.mp ha
  refine mem_labelsOf.mpr ⟨(mem_others.mp hb).1, ?_⟩
  rw [hrow, mem_selectedClass]
  refine ⟨hL.mem_A _, ?_⟩
  rw [hL.secondApex_eq] at hd
  rw [← hd]
  exact row.support_eq_radius _ ha'.2

/-- The L3 census of a row, read on labels: two labels in `I2`, one in the closed surplus
cap seen from `A2`, one in the closed first opposite cap seen from `A2`. -/
private theorem row_census (hL : LabelMap S pt)
    (h3 : (S.capInteriorByIndex S.surplusIdx).card = 3) (h2 : S.oppInterior1.card = 2)
    (h4 : S.oppInterior2.card = 4) (row : SelectedFourClass D.A S.oppApex2)
    (hc : (row.support ∩ S.oppInterior2).card = 2 ∧ (row.support ∩ S.surplusCap).card = 1 ∧
      (row.support ∩ S.oppCap1).card = 1 ∧ S.oppApex2 ∉ row.support) :
    (secondOppositeInterior.toFinset ∩ labelsOf pt row.support).card = 2 ∧
      ((surplusInterior ++ [firstApex]).toFinset ∩ labelsOf pt row.support).card = 1 ∧
      ((firstOppositeInterior ++ [thirdApex]).toFinset ∩ labelsOf pt row.support).card = 1 := by
  obtain ⟨hI2, hS, hO1, hnot⟩ := hc
  refine ⟨?_, ?_, ?_⟩
  · rw [hL.card_toFinset_inter_labelsOf (by decide) (hL.image_secondOppositeInterior h4)
      row.support_subset_A, Finset.inter_comm]
    exact hI2
  · rw [hL.card_toFinset_inter_labelsOf (by decide)
      (I := S.capInteriorByIndex S.surplusIdx ∪ {S.oppApex1})
      (by rw [image_append_singleton (hL.image_surplusInterior h3), hL.firstApex_eq])
      row.support_subset_A, inter_eq_of_cap_right (mem_surplusCap_iff S) hnot]
    exact hS
  · rw [hL.card_toFinset_inter_labelsOf (by decide) (I := S.oppInterior1 ∪ {S.surplusApex})
      (by rw [image_append_singleton (hL.image_firstOppositeInterior h2), hL.thirdApex_eq])
      row.support_subset_A, inter_eq_of_cap_left (mem_oppCap1_iff S) hnot]
    exact hO1

/-- Four labels pairwise equidistant from a carrier point `c` that lie outside the deletion
of a label `z` and avoid the label of `c` give a `K4` witness at `c` after deleting `z`. -/
private theorem false_of_four_labels (hL : LabelMap S pt) {z : ℕ} (hz : z ∈ labels) {c : ℝ²}
    (hc : c ∈ D.A) (hno : ¬ HasNEquidistantPointsAt 4 (D.A.erase (pt (label z))) c)
    (Q : Finset ℕ) (hQ : Q.card = 4)
    (hQmem : ∀ s ∈ Q, s ∈ labels ∧ s ≠ z ∧ s ≠ labelOf pt c)
    (hQeq : ∀ a ∈ Q, ∀ b ∈ Q, dist (pt (label (labelOf pt c))) (pt (label a)) =
      dist (pt (label (labelOf pt c))) (pt (label b))) : False := by
  rw [hL.pt_labelOf hc] at hQeq
  obtain ⟨z₀, hz₀⟩ := Finset.card_pos.mp (by rw [hQ]; norm_num)
  apply hno
  refine ⟨dist c (pt (label z₀)), ?_, ?_⟩
  · rw [gt_iff_lt, dist_pos]
    intro h
    have := hL.labelOf_pt (mem_labels.mp (hQmem z₀ hz₀).1)
    rw [← h] at this
    exact (hQmem z₀ hz₀).2.2 this.symm
  · show 4 ≤ _
    calc 4 = (Q.image (fun s => pt (label s))).card := by
          rw [Finset.card_image_of_injOn, hQ]
          intro a ha b hb hab
          exact hL.label_inj (mem_labels.mp (hQmem a ha).1) (mem_labels.mp (hQmem b hb).1) hab
      _ ≤ _ := by
          apply Finset.card_le_card
          intro x hx
          obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
          refine Finset.mem_filter.mpr
            ⟨Finset.mem_erase.mpr ⟨?_, hL.mem_A _⟩, hQeq y hy z₀ hz₀⟩
          intro h
          exact (hQmem y hy).2.1
            (hL.label_inj (mem_labels.mp (hQmem y hy).1) (mem_labels.mp hz) h)

end Rows

/- ## The late blocker centers and the ingress -/

private theorem centerAt_mem_A {A : Finset ℝ²} (H : CriticalShellSystem A) {q : ℝ²}
    (hq : q ∈ A) : H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp (H.selectedAt q hq).toCriticalFourShell.center_mem).2

private theorem centerAt_ne_self {A : Finset ℝ²} (H : CriticalShellSystem A) {q : ℝ²}
    (hq : q ∈ A) : H.centerAt q hq ≠ q :=
  (Finset.mem_erase.mp (H.selectedAt q hq).toCriticalFourShell.center_mem).1

private theorem centerAt_congr {A : Finset ℝ²} (H : CriticalShellSystem A) {x y : ℝ²}
    (hx : x ∈ A) (hy : y ∈ A) (h : x = y) : H.centerAt x hx = H.centerAt y hy := by
  subst h
  rfl

/-- The ingress source lies outside the first-apex class: its late blocker would otherwise
be the first apex, the late blocker of `F.pair.q`. -/
private theorem source_not_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (surface : ExactFourPostCardElevenRobustSurface R) :
    surface.ingress.source.1 ∉ SelectedClass D.A S.oppApex1 radius := by
  intro hclass
  have hout : surface.ingress.source ∈ outsideFirstApexFiber R :=
    (Finset.mem_sdiff.mp surface.ingress.source_mem_good).1
  have hnot : surface.ingress.source ∉
      actualBlockerFiber (lateFirstApexSystem R) ⟨F.pair.q, F.pair.q_mem_A⟩ :=
    (Finset.mem_sdiff.mp hout).2
  apply hnot
  refine Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩
  apply Subtype.ext
  exact (lateFirstApexSystem_centerAt_eq R surface.ingress.source.2 hclass).trans
    (lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A (frontier_pair_q_mem_firstApexClass F)).symm

/-- The shell of the source at its blocker, read on labels: the labels at the blocker's
distance to the source. -/
private theorem shell_iff_of {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {pt : Fin 12 → ℝ²} (hL : LabelMap S pt) (H : CriticalShellSystem D.A) {src : ℝ²}
    (hsrc : src ∈ D.A) {B : Finset ℝ²}
    (hB : B = (H.selectedAt src hsrc).toCriticalFourShell.support) {t : ℕ} (ht : t < 12) :
    t ∈ labelsOf pt B ↔
      dist (pt (label (labelOf pt (H.centerAt (pt (label (labelOf pt src))) (hL.mem_A _)))))
          (pt (label t)) =
        dist (pt (label (labelOf pt (H.centerAt (pt (label (labelOf pt src))) (hL.mem_A _)))))
          (pt (label (labelOf pt src))) := by
  rw [centerAt_congr H (hL.mem_A _) hsrc (hL.pt_labelOf hsrc),
    hL.pt_labelOf (centerAt_mem_A H hsrc), hL.pt_labelOf hsrc, mem_labelsOf, hB]
  constructor
  · rintro ⟨-, hmem⟩
    rw [(H.selectedAt src hsrc).toCriticalFourShell.support_eq_radius _ hmem,
      (H.selectedAt src hsrc).toCriticalFourShell.support_eq_radius _
        (H.selectedAt src hsrc).toCriticalFourShell.q_mem_support]
  · intro hd
    refine ⟨ht, (H.selectedAt src hsrc).toCriticalFourShell.off_row_named_label_forbidden
      (hL.mem_A _) ?_⟩
    rw [hd]
    exact (H.selectedAt src hsrc).toCriticalFourShell.support_eq_radius _
      (H.selectedAt src hsrc).toCriticalFourShell.q_mem_support

private theorem mem_deletedKeys_of {d : ℕ} (h12 : d < 12) (hIS : d ∉ surplusInterior)
    (h1 : d ≠ firstApex) : d ∈ deletedKeys := by
  interval_cases d <;> first | decide | exact absurd (by decide) hIS | exact absurd rfl h1

/- ## The packet valuation of the branch -/

/-- From the branch binders, `D.A.card = 12`, and a label map: packet data and chosen quads
whose `packetVal` is a `PacketValuation`. -/
theorem exists_packetValuation_of_twoRadiusBranch_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard12 : D.A.card = 12)
    {pt : Fin 12 → ℝ²} (hL : LabelMap S pt) :
    ∃ P : PacketData, ∃ quad : ℕ → Finset ℕ,
      PacketValuation pt (packetVal pt P quad) P := by
  classical
  -- the strict-interior profile
  obtain ⟨h3, h2, h4⟩ := exactTwelve_profile_of_twoRadiusBranch R surface rho otherRadius
    firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  -- the rows
  have hfirst := selectedFourClass_support_eq_selectedClass_of_card_lt_five firstRow
    (hnoFive _ firstRow.radius_pos)
  have hsecond := selectedFourClass_support_eq_selectedClass_of_card_lt_five secondRow
    (hnoFive _ secondRow.radius_pos)
  obtain ⟨hI2₁, hS₁, hO1₁⟩ := row_census hL h3 h2 h4 firstRow
    (secondApexRow_census_of_twoRadiusBranch_exactTwelve R surface rho otherRadius firstRow
      secondRow hradii hnoFive hfirstRadius hsecondRadius hcard12 firstRow (Or.inl hfirstRadius))
  obtain ⟨hI2₂, hS₂, hO1₂⟩ := row_census hL h3 h2 h4 secondRow
    (secondApexRow_census_of_twoRadiusBranch_exactTwelve R surface rho otherRadius firstRow
      secondRow hradii hnoFive hfirstRadius hsecondRadius hcard12 secondRow
      (Or.inr hsecondRadius))
  -- the first-apex class
  obtain ⟨-, hslice, hCS, hCO2, hnot1⟩ := firstApexClass_census_of_twoRadiusBranch_exactTwelve
    R surface rho otherRadius firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  have hCA : SelectedClass D.A S.oppApex1 radius ⊆ D.A := fun x hx => (mem_selectedClass.mp hx).1
  have hI1sub : S.oppInterior1 ⊆ SelectedClass D.A S.oppApex1 radius := by
    have heq : SelectedClass D.A S.oppApex1 radius ∩ S.oppInterior1 = S.oppInterior1 :=
      Finset.eq_of_subset_of_card_le Finset.inter_subset_right
        (by rw [hslice, Finset.card_pair R.interior_q_ne_w, h2])
    intro x hx
    rw [← heq] at hx
    exact (Finset.mem_inter.mp hx).1
  -- the deleted point
  have hdelC : surface.ingress.deleted ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases surface.ingress.deleted_is_pair with h | h <;> rw [h]
    · exact frontier_pair_q_mem_firstApexClass F
    · exact frontier_pair_w_mem_firstApexClass F
  have hdelA : surface.ingress.deleted ∈ D.A := (mem_selectedClass.mp hdelC).1
  have hdelS : surface.ingress.deleted ∉ S.surplusCap := by
    rcases surface.ingress.deleted_is_pair with h | h <;> rw [h]
    · exact (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
    · exact (Finset.mem_sdiff.mp F.pair.w_mem_marginal).2
  have hB₁A : surface.ingress.packet.B₁ ⊆ D.A := by
    rw [ingress_B₁_eq_shell_support R surface]
    exact CriticalFourShell.support_subset_A _
  -- the chosen quads
  have hquad_ex : ∀ c : ℕ, ∃ Q : Finset ℕ,
      Q.card = 4 ∧ (∀ z ∈ Q, z < 12 ∧ z ≠ c) ∧
      ∀ a ∈ Q, ∀ b ∈ Q,
        dist (pt (label c)) (pt (label a)) = dist (pt (label c)) (pt (label b)) := by
    intro c
    obtain ⟨r, hr, hcard⟩ := D.K4 (pt (label c)) (hL.mem_A _)
    obtain ⟨T, hTsub, hTcard⟩ := Finset.exists_subset_card_eq hcard
    refine ⟨labelsOf pt T, ?_, ?_, ?_⟩
    · rw [hL.card_labelsOf (hTsub.trans (Finset.filter_subset _ _)), hTcard]
    · intro z hz
      rw [mem_labelsOf] at hz
      refine ⟨hz.1, ?_⟩
      rintro rfl
      have := (Finset.mem_filter.mp (hTsub hz.2)).2
      rw [dist_self] at this
      exact absurd this (ne_of_lt hr)
    · intro a ha b hb
      rw [(Finset.mem_filter.mp (hTsub (mem_labelsOf.mp ha).2)).2,
        (Finset.mem_filter.mp (hTsub (mem_labelsOf.mp hb).2)).2]
  choose quad hquad using hquad_ex
  refine ⟨{ firstRow := labelsOf pt firstRow.support
            secondRow := labelsOf pt secondRow.support
            apexClass := labelsOf pt (SelectedClass D.A S.oppApex1 radius)
            blocker := fun z =>
              labelOf pt ((lateFirstApexSystem R).centerAt (pt (label z)) (hL.mem_A _))
            source := labelOf pt surface.ingress.source.1
            deleted := labelOf pt surface.ingress.deleted
            chosenRow := labelsOf pt surface.ingress.packet.B₂
            shell := labelsOf pt surface.ingress.packet.B₁ }, quad, ?_⟩
  refine
    { toK4Valuation := k4Valuation_packetVal (fun c _ => (hquad c).1)
        (fun c _ z hz => mem_others.mpr ((hquad c).2.1 z hz)) (fun c _ => (hquad c).2.2)
      xVar_iff := fun z hz => packetVal_xVar hz
      yVar_iff := fun z hz => packetVal_yVar hz
      firstRow_equidistant := row_equidistant hL firstRow
      firstRow_closed := row_closed hL firstRow hfirst
      secondRow_equidistant := row_equidistant hL secondRow
      secondRow_closed := row_closed hL secondRow hsecond
      firstRow_secondOpposite := hI2₁
      firstRow_surplus := hS₁
      firstRow_firstOpposite := hO1₁
      secondRow_secondOpposite := hI2₂
      secondRow_surplus := hS₂
      secondRow_firstOpposite := hO1₂
      rows_disjoint := fun z _ h =>
        Finset.disjoint_left.mp hdisjoint (mem_labelsOf.mp h.1).2 (mem_labelsOf.mp h.2).2
      uVar_iff := fun z hz => packetVal_uVar hz
      apexClass_equidistant := ?_
      apexClass_closed := ?_
      interiorQ_mem := mem_labelsOf.mpr
        ⟨by decide, hI1sub (hL.firstOppositeInterior_mem interiorQ (by decide))⟩
      interiorW_mem := mem_labelsOf.mpr
        ⟨by decide, hI1sub (hL.firstOppositeInterior_mem interiorW (by decide))⟩
      apexClass_surplus := ?_
      apexClass_secondOpposite := ?_
      apexClass_of_four := ?_
      blocker_mem := ?_
      chiVar_iff := fun z hz c hc => packetVal_chiVar hz hc
      blocker_noFour := fun z hz Q hQ hQmem hQeq =>
        false_of_four_labels hL hz (centerAt_mem_A _ _)
          ((lateFirstApexSystem R).no_qfree_at _ (hL.mem_A (label z))) Q hQ hQmem hQeq
      blocker_of_apexClass := ?_
      source_mem := mem_labels.mpr (labelOf_lt _ _)
      srcVar_iff := fun z hz => packetVal_srcVar hz
      blocker_source := ?_
      deleted_mem := ?_
      deleted_iff := fun d v hdv => packetVal_deletedVar hdv
      deleted_mem_apexClass := mem_labelsOf.mpr
        ⟨labelOf_lt _ _, by rw [hL.pt_labelOf hdelA]; exact hdelC⟩
      chosenRow_eq := (ingress_B₂_eq_row_support_of_twoRadiusBranch_exactTwelve R surface rho
        otherRadius firstRow secondRow hradii hnoFive hfirstRadius hsecondRadius hcard12).imp
        (congrArg (labelsOf pt)) (congrArg (labelsOf pt))
      b2x_iff := packetVal_b2x
      b2y_iff := packetVal_b2y
      deleted_not_mem_chosenRow := fun h => surface.ingress.packet.row₂.q_not_mem
        (by have := (mem_labelsOf.mp h).2; rwa [hL.pt_labelOf hdelA] at this)
      deleted_ne_source := ?_
      shell_iff := fun t ht => shell_iff_of hL (lateFirstApexSystem R)
        surface.ingress.source.2 (ingress_B₁_eq_shell_support R surface) (mem_others.mp ht).1
      deleted_not_mem_shell := fun h => surface.ingress.packet.row₁.q_not_mem
        (by have := (mem_labelsOf.mp h).2; rwa [hL.pt_labelOf hdelA] at this)
      overlap_le_two := ?_ }
  · -- the class is equidistant from the first apex
    intro a _ b _ ha hb
    rw [hL.firstApex_eq, (mem_selectedClass.mp (mem_labelsOf.mp ha).2).2,
      (mem_selectedClass.mp (mem_labelsOf.mp hb).2).2]
  · -- the class is closed
    intro a _ b hb ha hd
    have ha' := mem_labelsOf.mp ha
    refine mem_labelsOf.mpr ⟨(mem_others.mp hb).1, mem_selectedClass.mpr ⟨hL.mem_A _, ?_⟩⟩
    rw [hL.firstApex_eq] at hd
    rw [← hd]
    exact (mem_selectedClass.mp ha'.2).2
  · -- one class label in the closed surplus cap seen from the first apex
    show ((surplusInterior ++ [secondApex]).toFinset ∩
      labelsOf pt (SelectedClass D.A S.oppApex1 radius)).card = 1
    rw [hL.card_toFinset_inter_labelsOf (by decide)
      (I := S.capInteriorByIndex S.surplusIdx ∪ {S.oppApex2})
      (by rw [image_append_singleton (hL.image_surplusInterior h3), hL.secondApex_eq]) hCA,
      inter_eq_of_cap_left (mem_surplusCap_iff S) hnot1]
    exact hCS
  · -- one class label in the closed second opposite cap seen from the first apex
    show ((secondOppositeInterior ++ [thirdApex]).toFinset ∩
      labelsOf pt (SelectedClass D.A S.oppApex1 radius)).card = 1
    rw [hL.card_toFinset_inter_labelsOf (by decide) (I := S.oppInterior2 ∪ {S.surplusApex})
      (by rw [image_append_singleton (hL.image_secondOppositeInterior h4), hL.thirdApex_eq])
      hCA, inter_eq_of_cap_right (mem_oppCap2_iff S) hnot1]
    exact hCO2
  · -- four labels equidistant from the first apex lie in the class
    intro Q hQ hQsub hQeq z hz
    obtain ⟨z₀, hz₀⟩ := Finset.card_pos.mp (by rw [hQ]; norm_num)
    have hz₀12 := (mem_others.mp (hQsub z₀ hz₀)).1
    have hz₀1 := (mem_others.mp (hQsub z₀ hz₀)).2
    have hr : 0 < dist S.oppApex1 (pt (label z₀)) := by
      rw [dist_pos, ← hL.firstApex_eq]
      intro h
      exact hz₀1 (hL.label_inj (by decide) hz₀12 h).symm
    have hsub : Q.image (fun z => pt (label z)) ⊆
        SelectedClass D.A S.oppApex1 (dist S.oppApex1 (pt (label z₀))) := by
      intro x hx
      obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
      refine mem_selectedClass.mpr ⟨hL.mem_A _, ?_⟩
      have := hQeq y hy z₀ hz₀
      rwa [hL.firstApex_eq] at this
    have hcardT : (Q.image (fun z => pt (label z))).card = 4 := by
      rw [Finset.card_image_of_injOn, hQ]
      intro a ha b hb hab
      exact hL.label_inj (mem_others.mp (hQsub a ha)).1 (mem_others.mp (hQsub b hb)).1 hab
    have hrad := R.unique_K4_radius _ hr (hcardT ▸ Finset.card_le_card hsub)
    refine mem_labelsOf.mpr ⟨(mem_others.mp (hQsub z hz)).1, ?_⟩
    rw [← hrad]
    exact hsub (Finset.mem_image_of_mem _ hz)
  · -- the blocker of a label is a candidate blocker
    intro z hz
    show labelOf pt ((lateFirstApexSystem R).centerAt (pt (label z)) (hL.mem_A _)) ∈
      blockerCenters z
    have hpt := hL.pt_labelOf (centerAt_mem_A (lateFirstApexSystem R) (hL.mem_A (label z)))
    refine mem_blockerCenters.mpr ⟨labelOf_lt _ _, ?_, ?_⟩
    · intro h
      rw [h] at hpt
      exact centerAt_ne_self _ _ hpt.symm
    · intro h
      rw [h, hL.secondApex_eq] at hpt
      exact surface.secondApex_robust.centerAt_ne (lateFirstApexSystem R) _ _ hpt.symm
  · -- the late system sends the class to the first apex
    intro z hz hmem
    show labelOf pt ((lateFirstApexSystem R).centerAt (pt (label z)) (hL.mem_A _)) = firstApex
    rw [lateFirstApexSystem_centerAt_eq R (hL.mem_A _) (mem_labelsOf.mp hmem).2,
      ← hL.firstApex_eq, hL.labelOf_pt (by decide)]
  · -- the blocker of the source is not the first apex
    show labelOf pt ((lateFirstApexSystem R).centerAt
      (pt (label (labelOf pt surface.ingress.source.1))) (hL.mem_A _)) ≠ firstApex
    rw [centerAt_congr _ (hL.mem_A _) surface.ingress.source.2
      (hL.pt_labelOf surface.ingress.source.2)]
    intro h
    have hpt := hL.pt_labelOf (centerAt_mem_A (lateFirstApexSystem R) surface.ingress.source.2)
    rw [h, hL.firstApex_eq] at hpt
    exact source_not_mem_firstApexClass R surface
      ((lateFirstApexSystem_centerAt_eq_iff_mem_class R _).mp hpt.symm)
  · -- the deleted label is a deletion candidate
    show labelOf pt surface.ingress.deleted ∈ deletedKeys
    refine mem_deletedKeys_of (labelOf_lt _ _) ?_ ?_
    · intro h
      have := hL.surplusInterior_mem _ h
      rw [hL.pt_labelOf hdelA] at this
      exact hdelS ((mem_surplusCap_iff S _).mpr (Or.inl this))
    · intro h
      have := hL.pt_labelOf hdelA
      rw [h, hL.firstApex_eq] at this
      exact hnot1 (this ▸ hdelC)
  · -- the deleted label is not the source
    intro h
    dsimp only at h
    have := hL.pt_labelOf hdelA
    rw [h, hL.pt_labelOf surface.ingress.source.2] at this
    exact source_not_mem_firstApexClass R surface (this ▸ hdelC)
  · -- the shell and the chosen row share at most two labels
    show (labelsOf pt surface.ingress.packet.B₁ ∩
      labelsOf pt surface.ingress.packet.B₂).card ≤ 2
    rw [← labelsOf_inter, hL.card_labelsOf (Finset.inter_subset_left.trans hB₁A)]
    exact surface.ingress.packet.overlap_le_two

/- ## The valuation theorem -/

/-- Every clause of the two-family CNF holds under `packetVal` on the label map of the
boundary ingress, with the packet data and quads of the branch. -/
theorem exists_valuation_of_twoRadiusBranch_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard12 : D.A.card = 12) :
    ∃ val : ℕ → Prop, ∀ clause ∈ clauses, clauseHolds val clause := by
  obtain ⟨pt, φ, idx, hL, hB⟩ := exists_labelMap_boundaryEnumeration R surface rho otherRadius
    firstRow secondRow hradii hfirstRadius hsecondRadius hcard12
  obtain ⟨P, quad, hP⟩ := exists_packetValuation_of_twoRadiusBranch_exactTwelve R surface rho
    otherRadius firstRow secondRow hradii hnoFive hfirstRadius hsecondRadius hdisjoint hcard12 hL
  refine ⟨packetVal pt P quad, ?_⟩
  have hrel := hP.toRelationValuation
  show familyHolds _ clauses
  unfold clauses
  exact familyHolds_append (familyHolds_append (familyHolds_append (familyHolds_append
    (familyHolds_append (familyHolds_append (familyHolds_append (transitivity_holds hrel)
      (twoCircleSameArc_holds hrel hB)) (fivePointCircleIsoscelesOrder_holds hrel hB))
      (secondApexRows_holds hP)) (firstApexClass_holds hP)) (k4Everywhere_holds hP.toK4Valuation))
      (blockers_holds hP)) (ingress_holds hP)

end DRExactTwelveValuation
end ATailFrontierLiveClosure
end Problem97
