/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U1Depth5Prefix
import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001
import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001F1QOmit3
import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001F1T1Omit3
import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001F1T2Omit3
import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001F1T3Omit3
import Erdos9796Proof.P97.U1Depth5HrowRecord001PostAll8Manifest
import Erdos9796Proof.P97.U1OppositeCapLowerBounds
import Erdos9796Proof.P97.U3ToU5Terminal
import Erdos9796Proof.P97.U2.WitnessReflectionKernel
import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# U1 large-cap Route-B tail

This module contains the extracted U1.2 large-cap Route-B tail consumed by
`RVOLSpine`.  The exact/non-exact split remains in the spine as a closed
exact-pair fast path; after a large-cap witness is supplied, this tail theorem
intentionally has no non-exactness hypothesis.

The remaining `sorry` is the current U1.2 spine leaf: it marks the
packet-label producer / manifest-certificate bridge still to be proved.
-/

open scoped EuclideanGeometry

namespace Problem97

private lemma pair_eq_or_swap_of_pair_finset_eq
    {α : Type*} [DecidableEq α] {a b c d : α}
    (hab : a ≠ b)
    (h : ({a, b} : Finset α) = ({c, d} : Finset α)) :
    (a = c ∧ b = d) ∨ (a = d ∧ b = c) := by
  have ha : a ∈ ({c, d} : Finset α) := by
    have ha' : a ∈ ({a, b} : Finset α) := by simp
    simpa [h] using ha'
  have hb : b ∈ ({c, d} : Finset α) := by
    have hb' : b ∈ ({a, b} : Finset α) := by simp
    simpa [h] using hb'
  simp only [Finset.mem_insert, Finset.mem_singleton] at ha hb
  rcases ha with hac | had
  · rcases hb with hbc | hbd
    · exact False.elim (hab (hac.trans hbc.symm))
    · exact Or.inl ⟨hac, hbd⟩
  · rcases hb with hbc | hbd
    · exact Or.inr ⟨had, hbc⟩
    · exact False.elim (hab (had.trans hbd.symm))

private lemma complement_pair_finset_eq_of_four_labels_eq
    {α : Type*} [DecidableEq α] {a b c d q t1 t2 t3 : α}
    (hlabels : ({a, b, c, d} : Finset α) = ({q, t1, t2, t3} : Finset α))
    (haq : a = q)
    (hbt1 : b = t1)
    (hac : a ≠ c)
    (had : a ≠ d)
    (hbc : b ≠ c)
    (hbd : b ≠ d)
    (hcd : c ≠ d)
    (ht2t3 : t2 ≠ t3) :
    ({c, d} : Finset α) = ({t2, t3} : Finset α) := by
  refine Finset.eq_of_subset_of_card_le ?_ ?_
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx ⊢
    rcases hx with hxc | hxd
    · have hmem : c ∈ ({q, t1, t2, t3} : Finset α) := by
        have hmem' : c ∈ ({a, b, c, d} : Finset α) := by
          simp
        simpa [hlabels] using hmem'
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
      rcases hmem with hcq | hct1 | hct2 | hct3
      · exact False.elim (hac (haq.trans hcq.symm))
      · exact False.elim (hbc (hbt1.trans hct1.symm))
      · exact Or.inl (hxc.trans hct2)
      · exact Or.inr (hxc.trans hct3)
    · have hmem : d ∈ ({q, t1, t2, t3} : Finset α) := by
        have hmem' : d ∈ ({a, b, c, d} : Finset α) := by
          simp
        simpa [hlabels] using hmem'
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
      rcases hmem with hdq | hdt1 | hdt2 | hdt3
      · exact False.elim (had (haq.trans hdq.symm))
      · exact False.elim (hbd (hbt1.trans hdt1.symm))
      · exact Or.inl (hxd.trans hdt2)
      · exact Or.inr (hxd.trans hdt3)
  · have hleft : ({c, d} : Finset α).card = 2 := by
      simp [hcd]
    have hright : ({t2, t3} : Finset α).card = 2 := by
      simp [ht2t3]
    omega

private lemma complement_pair_finset_eq_of_four_labels_mem
    {α : Type*} [DecidableEq α]
    {a b c d q t1 t2 t3 qa tb x y : α}
    (hlabels : ({a, b, c, d} : Finset α) = ({q, t1, t2, t3} : Finset α))
    (hqa : qa = q)
    (htb : tb = t1)
    (hxmem : x ∈ ({a, b, c, d} : Finset α))
    (hymem : y ∈ ({a, b, c, d} : Finset α))
    (hqa_x : qa ≠ x)
    (hqa_y : qa ≠ y)
    (htb_x : tb ≠ x)
    (htb_y : tb ≠ y)
    (hxy : x ≠ y)
    (ht2t3 : t2 ≠ t3) :
    ({x, y} : Finset α) = ({t2, t3} : Finset α) := by
  refine Finset.eq_of_subset_of_card_le ?_ ?_
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz ⊢
    rcases hz with hzx | hzy
    · have hmem : x ∈ ({q, t1, t2, t3} : Finset α) := by
        simpa [hlabels] using hxmem
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
      rcases hmem with hxq | hxt1 | hxt2 | hxt3
      · exact False.elim (hqa_x (hqa.trans hxq.symm))
      · exact False.elim (htb_x (htb.trans hxt1.symm))
      · exact Or.inl (hzx.trans hxt2)
      · exact Or.inr (hzx.trans hxt3)
    · have hmem : y ∈ ({q, t1, t2, t3} : Finset α) := by
        simpa [hlabels] using hymem
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
      rcases hmem with hyq | hyt1 | hyt2 | hyt3
      · exact False.elim (hqa_y (hqa.trans hyq.symm))
      · exact False.elim (htb_y (htb.trans hyt1.symm))
      · exact Or.inl (hzy.trans hyt2)
      · exact Or.inr (hzy.trans hyt3)
  · have hleft : ({x, y} : Finset α).card = 2 := by
      simp [hxy]
    have hright : ({t2, t3} : Finset α).card = 2 := by
      simp [ht2t3]
    omega

private lemma pair_order_or_swap_of_four_labels_mem
    {α : Type*} [DecidableEq α]
    {a b c d q t1 t2 t3 qa tb x y : α}
    (hlabels : ({a, b, c, d} : Finset α) = ({q, t1, t2, t3} : Finset α))
    (hqa : qa = q)
    (htb : tb = t1)
    (hxmem : x ∈ ({a, b, c, d} : Finset α))
    (hymem : y ∈ ({a, b, c, d} : Finset α))
    (hqa_x : qa ≠ x)
    (hqa_y : qa ≠ y)
    (htb_x : tb ≠ x)
    (htb_y : tb ≠ y)
    (hxy : x ≠ y)
    (ht2t3 : t2 ≠ t3) :
    (x = t2 ∧ y = t3) ∨ (x = t3 ∧ y = t2) :=
  pair_eq_or_swap_of_pair_finset_eq hxy
    (complement_pair_finset_eq_of_four_labels_mem hlabels hqa htb
      hxmem hymem hqa_x hqa_y htb_x htb_y hxy ht2t3)

private lemma pair_order_or_swap_of_four_labels_mem_excluding_t2
    {α : Type*} [DecidableEq α]
    {a b c d q t1 t2 t3 qa tb x y : α}
    (hlabels : ({a, b, c, d} : Finset α) = ({q, t1, t2, t3} : Finset α))
    (hqa : qa = q)
    (htb : tb = t2)
    (hxmem : x ∈ ({a, b, c, d} : Finset α))
    (hymem : y ∈ ({a, b, c, d} : Finset α))
    (hqa_x : qa ≠ x)
    (hqa_y : qa ≠ y)
    (htb_x : tb ≠ x)
    (htb_y : tb ≠ y)
    (hxy : x ≠ y)
    (ht1t3 : t1 ≠ t3) :
    (x = t1 ∧ y = t3) ∨ (x = t3 ∧ y = t1) := by
  have hpair :
      ({x, y} : Finset α) = ({t1, t3} : Finset α) := by
    refine Finset.eq_of_subset_of_card_le ?_ ?_
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz ⊢
      rcases hz with hzx | hzy
      · have hmem : x ∈ ({q, t1, t2, t3} : Finset α) := by
          simpa [hlabels] using hxmem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
        rcases hmem with hxq | hxt1 | hxt2 | hxt3
        · exact False.elim (hqa_x (hqa.trans hxq.symm))
        · exact Or.inl (hzx.trans hxt1)
        · exact False.elim (htb_x (htb.trans hxt2.symm))
        · exact Or.inr (hzx.trans hxt3)
      · have hmem : y ∈ ({q, t1, t2, t3} : Finset α) := by
          simpa [hlabels] using hymem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
        rcases hmem with hyq | hyt1 | hyt2 | hyt3
        · exact False.elim (hqa_y (hqa.trans hyq.symm))
        · exact Or.inl (hzy.trans hyt1)
        · exact False.elim (htb_y (htb.trans hyt2.symm))
        · exact Or.inr (hzy.trans hyt3)
    · have hleft : ({x, y} : Finset α).card = 2 := by
        simp [hxy]
      have hright : ({t1, t3} : Finset α).card = 2 := by
        simp [ht1t3]
      omega
  exact pair_eq_or_swap_of_pair_finset_eq hxy hpair

private lemma pair_order_or_swap_of_four_labels_mem_excluding_t3
    {α : Type*} [DecidableEq α]
    {a b c d q t1 t2 t3 qa tb x y : α}
    (hlabels : ({a, b, c, d} : Finset α) = ({q, t1, t2, t3} : Finset α))
    (hqa : qa = q)
    (htb : tb = t3)
    (hxmem : x ∈ ({a, b, c, d} : Finset α))
    (hymem : y ∈ ({a, b, c, d} : Finset α))
    (hqa_x : qa ≠ x)
    (hqa_y : qa ≠ y)
    (htb_x : tb ≠ x)
    (htb_y : tb ≠ y)
    (hxy : x ≠ y)
    (ht1t2 : t1 ≠ t2) :
    (x = t1 ∧ y = t2) ∨ (x = t2 ∧ y = t1) := by
  have hpair :
      ({x, y} : Finset α) = ({t1, t2} : Finset α) := by
    refine Finset.eq_of_subset_of_card_le ?_ ?_
    · intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz ⊢
      rcases hz with hzx | hzy
      · have hmem : x ∈ ({q, t1, t2, t3} : Finset α) := by
          simpa [hlabels] using hxmem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
        rcases hmem with hxq | hxt1 | hxt2 | hxt3
        · exact False.elim (hqa_x (hqa.trans hxq.symm))
        · exact Or.inl (hzx.trans hxt1)
        · exact Or.inr (hzx.trans hxt2)
        · exact False.elim (htb_x (htb.trans hxt3.symm))
      · have hmem : y ∈ ({q, t1, t2, t3} : Finset α) := by
          simpa [hlabels] using hymem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
        rcases hmem with hyq | hyt1 | hyt2 | hyt3
        · exact False.elim (hqa_y (hqa.trans hyq.symm))
        · exact Or.inl (hzy.trans hyt1)
        · exact Or.inr (hzy.trans hyt2)
        · exact False.elim (htb_y (htb.trans hyt3.symm))
    · have hleft : ({x, y} : Finset α).card = 2 := by
        simp [hxy]
      have hright : ({t1, t2} : Finset α).card = 2 := by
        simp [ht1t2]
      omega
  exact pair_eq_or_swap_of_pair_finset_eq hxy hpair

/-- Live large-cap tail data still available after the U3-to-U5 reduction.

This packages the exact U5-facing facts that remain in scope at the current
U1.2 leaf before any extra incidence theorem is applied.  COMP-1 shows this
depth-5 blocker-centered surface alone does not force the current
metric-residual fields on the no-collision cell; any producer for
`U1LargeCapRouteBTailMetricResidualTarget` must add a sixth critical row plus a
theorem that consumes it, `(Q)_C5`, or equivalent incidence/branch-split
content.  The older
`U1LargeCapRouteBTailF1TailCollisionTarget` remains only a fallback consumer
surface if an independent route recovers its two `f1`-tail equalities. -/
structure U1LargeCapRouteBTailLiveData
    (D : CounterexampleData) (p q t1 t2 t3 u : ℝ²) : Prop where
  dangerous :
    U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²)
  exactQDeletedRadius :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3
  selected :
    U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u

namespace U1LargeCapRouteBTailLiveData

/-- The selected candidate is off the dangerous `p`-circle. -/
theorem selected_off_circle
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    dist p u ≠ dist p q :=
  H.dangerous.selected_off_circle_of_exact H.selected H.exactQDeletedRadius

/-- The selected candidate cannot realize same-circle export. -/
theorem noSameCircleExport
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    ¬ U5SameCircleExport D q p ({t1, t2, t3} : Finset ℝ²) u := by
  intro hsame
  exact H.selected_off_circle hsame.2

end U1LargeCapRouteBTailLiveData

/-- Exact current metric-bridge target for the extracted U1 large-cap tail.

This remains a named alternate theorem-facing surface for the extracted
large-cap tail: canonical q/t1 shell data or an existing branch0 collision.
After the committed-tree `hocc` audit, it is no longer the primary live
producer target, but it remains useful for consumer-side packaging and fallback
search. -/
abbrev U1LargeCapRouteBTailMetricBridgeTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  U1Depth5SourceUnitGenerated.Record001QTGlobalK4ShellDataOrBranch0CollisionOfRows
    (baseP := p) (baseQ := q) (baseT1 := t1) (baseT2 := t2)
    (baseT3 := t3) (selectedU := u) rows

/-- Local q-centered shell subtarget for the extracted large-cap tail. -/
abbrev U1LargeCapRouteBTailQShellTarget
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  U1Depth5SourceUnitGenerated.Record001QTGlobalK4QShellData
    (baseQ := q) (baseT1 := t1) (baseT2 := t2) (baseT3 := t3) (selectedU := u)
    rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
    rows.t3Row.source_mem rows.uRow.source_mem

/-- Local t1-centered shell subtarget for the extracted large-cap tail. -/
abbrev U1LargeCapRouteBTailT1ShellTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  U1Depth5SourceUnitGenerated.Record001QTGlobalK4T1ShellData
    (baseP := p) (baseQ := q) (baseT1 := t1) (baseT2 := t2) (baseT3 := t3)
    (selectedU := u)
    rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
    rows.t3Row.source_mem rows.uRow.source_mem

set_option linter.style.longLine false in
/-- Local split form of the exact metric-bridge target.

This is the explicit split form of the alternate metric-bridge surface: either
the q-shell block, the t1-shell block, or the existing branch0 collision
alternative. -/
theorem u1_largeCap_routeB_metricBridgeTarget_iff_q_t1_shell_or_collision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u} :
    U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows ↔
      (U1LargeCapRouteBTailQShellTarget rows ∧
        U1LargeCapRouteBTailT1ShellTarget (p := p) rows) ∨
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p :=
  U1Depth5SourceUnitGenerated.record001QTGlobalK4ShellDataOrBranch0CollisionOfRows_iff_q_t1_shellData_or_collision

/-- Minimal existing branch0 collision bypass on the extracted large-cap tail.

The current imported collision route does not need the full branch0 choice
surface.  It already closes once the record001 `f1`-tail occurrence
`f2 = f1[0]` and placement `p = f1[3]` are available. -/
abbrev U1LargeCapRouteBTailF1TailCollisionTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0 ∧
    p = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3

/-- Smaller hocc-free no-collision target for the extracted large-cap tail.

This does not produce the record001 `f2 = f1[0]` occurrence equality.  It names
the alternative no-collision sink exposed by the prefix file: once branch 0
places `p` at the fourth `f1` slot, the no-collision side forces `u` to be the
first `f1` slot, so excluding that placement closes the no-collision branch. -/
abbrev U1LargeCapRouteBTailF1Slot0ExcludedTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  p = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3 ∧
    u ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0

/-- The minimal `f1`-tail collision target already discharges the local metric
bridge through the branch0 collision alternative.

This isolates the currently cheapest imported bypass around the missing
t1-shell producer: if the live tail can prove the record001 `f2 = f1[0]`
occurrence and `p = f1[3]` placement, the existing `f1`-source-row collision
theorem closes the branch0 alternative without any new q/t1 metric theorem. -/
theorem u1_largeCap_routeB_f1TailCollisionTarget_to_metricBridgeTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hF1Tail : U1LargeCapRouteBTailF1TailCollisionTarget (p := p) rows) :
    U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows := by
  rw [u1_largeCap_routeB_metricBridgeTarget_iff_q_t1_shell_or_collision]
  right
  rcases hF1Tail with ⟨hocc_f2_f1_0, hfix_p_f1_3⟩
  exact
    U1Depth5.RowSlotLabelPacket.record001Branch0Collision_of_f1Tail_source
      rows hP_U hocc_f2_f1_0 hfix_p_f1_3

/-- On the no-collision side, the live `f1`-tail source equalities already
close record001 branch 0.

This names the current minimal post-`hF1Tail` sink.  The larger
`U1LargeCapRouteBTailF1T2NoCollisionTarget` bundle is downstream of this:
its q/t1 transport rows, residual rows, and extra-incidence atom are not used
once the no-collision split and the two `f1`-tail source equalities are both
available. -/
theorem u1_largeCap_routeB_f1TailCollisionTarget_false_of_noCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p)
    (hF1Tail : U1LargeCapRouteBTailF1TailCollisionTarget (p := p) rows) :
    False := by
  rcases hF1Tail with ⟨hocc_f2_f1_0, hfix_p_f1_3⟩
  exact
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision.false_of_f1Tail_source
      hNoCollision hP_U hocc_f2_f1_0 hfix_p_f1_3

/-- The hocc-free no-collision target closes the no-collision side.

This is only a no-collision sink.  The collision side still needs the old
two-field target or a separate collision-side route. -/
theorem u1_largeCap_routeB_f1Slot0ExcludedTarget_false_of_noCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p)
    (hTarget : U1LargeCapRouteBTailF1Slot0ExcludedTarget (p := p) rows) :
    False := by
  rcases hTarget with ⟨hfix_p_f1_3, hU_f10⟩
  exact
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision.false_of_f1Slot0_ne
      hNoCollision hP_U hfix_p_f1_3 hU_f10

open U1Depth5.RowSlotLabelPacket in
/-- The branch-0 split after the `p = f1[3]` placement has only two live
outcomes: an existing named record001 collision, or the residual
`u = f1[0]` source placement. -/
theorem u1_largeCap_routeB_collision_or_f1Slot0_of_pPlacement
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hfix_p_f1_3 :
      p = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) :
    U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p ∨
      u = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0 :=
  record001Branch0_collision_or_selectedU_eq_f1Slot0_of_pPlacement rows hP_U
    hfix_p_f1_3

/-- Auxiliary off-dangerous target for the current `t2[0]` label.

If this fact is available for the original `rows`, it closes the
`center = p, q_named` subcase.  The current live leaf does not assume it:
relabeling can produce an off-dangerous first slot for a replayed `t2` row, but
that changes the record001 `f2 = t2[0]` label.  For the original rows, the
proved reduction of the `center = p` branch is the named
`Record001Branch0Collision` residual. -/
abbrev U1LargeCapRouteBTailT20OffDangerousTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  dist p
      (rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 }) ≠
    dist p q

/-- The off-dangerous target supplies exactly the four t20 exclusions needed
in the current branch. -/
theorem t20BaseExclusions_of_offDangerous
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hoff : U1LargeCapRouteBTailT20OffDangerousTarget (p := p) rows) :
    q ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t1 ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t2 ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t3 ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } := by
  let t20 :=
    rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 }
  have hq : q ≠ t20 := by
    intro hqt20
    exact hoff (by simp [t20, hqt20])
  have ht1 : t1 ≠ t20 := by
    intro ht1t20
    exact hoff (by simpa [U1LargeCapRouteBTailT20OffDangerousTarget, t20,
      ht1t20] using hfixed.t1_same_radius)
  have ht2 : t2 ≠ t20 := by
    intro ht2t20
    exact hoff (by simpa [U1LargeCapRouteBTailT20OffDangerousTarget, t20,
      ht2t20] using hfixed.t2_same_radius)
  have ht3 : t3 ≠ t20 := by
    intro ht3t20
    exact hoff (by simpa [U1LargeCapRouteBTailT20OffDangerousTarget, t20,
      ht3t20] using hfixed.t3_same_radius)
  simpa [t20] using ⟨hq, ht1, ht2, ht3⟩

/-- The no-collision side supplies the four `t2[0]` base exclusions needed by
the `f2CriticalRow.center = p` branch. -/
theorem t20BaseExclusions_of_noCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p) :
    q ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t1 ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t2 ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t3 ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } := by
  simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
    ⟨H.q_t20, H.t1_t20, H.t2_t20, H.t3_t20⟩

/-- The dangerous `p`-circle as a selected four-class on
`{q,t1,t2,t3}`. -/
noncomputable def dangerousBaseSelectedFourClass
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3) :
    SelectedFourClass D.A p where
  support := ({q, t1, t2, t3} : Finset ℝ²)
  support_subset_A := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact hfixed.q_mem
    · have ht1Skeleton := (Finset.mem_erase.mp hfixed.t1_mem).2
      have ht1EraseQ := by
        simpa [CounterexampleData.skeleton] using ht1Skeleton
      exact ht1EraseQ.2
    · have ht2Skeleton := (Finset.mem_erase.mp hfixed.t2_mem).2
      have ht2EraseQ := by
        simpa [CounterexampleData.skeleton] using ht2Skeleton
      exact ht2EraseQ.2
    · have ht3Skeleton := (Finset.mem_erase.mp hfixed.t3_mem).2
      have ht3EraseQ := by
        simpa [CounterexampleData.skeleton] using ht3Skeleton
      exact ht3EraseQ.2
  support_card := by
    have hbase := hfixed.base_distinct
    rcases hbase with
      ⟨hpq, hpt1, hpt2, hpt3, hqt1, hqt2, hqt3, ht1t2, ht1t3, ht2t3⟩
    simp [hqt1, hqt2, hqt3, ht1t2, ht1t3, ht2t3]
  radius := dist p q
  radius_pos := hfixed.q_radius_pos
  support_eq_radius := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · rfl
    · exact hfixed.t1_same_radius
    · exact hfixed.t2_same_radius
    · exact hfixed.t3_same_radius
  center_not_mem := by
    intro hp
    have hbase := hfixed.base_distinct
    rcases hbase with ⟨hpq, hpt1, hpt2, hpt3, _⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with hpq' | hpt1' | hpt2' | hpt3'
    · exact hpq hpq'
    · exact hpt1 hpt1'
    · exact hpt2 hpt2'
    · exact hpt3 hpt3'

/-- If the `t2` source row is not centered at the U3 apex `p`, then that row
has a support point off the dangerous `p`-circle.

The proof uses the two-circle intersection bound for the selected `t2` row
against the dangerous base four-class, and the exact dangerous radius class to
upgrade "not one of the four base labels" into the metric off-circle fact. -/
theorem exists_t2Row_support_offDangerous_of_center_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hcenter_ne : rows.t2Row.center ≠ p) :
    ∃ x ∈ rows.t2Row.selected.toCriticalFourShell.support,
      dist p x ≠ dist p q := by
  classical
  let Krow : SelectedFourClass D.A rows.t2Row.center :=
    rows.t2Row.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hinter_le :
      (Krow.support ∩ Kbase.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Krow Kbase hcenter_ne
  have hnot_subset : ¬ Krow.support ⊆ Kbase.support := by
    intro hsubset
    have hinter : Krow.support ∩ Kbase.support = Krow.support :=
      Finset.inter_eq_left.mpr hsubset
    have hcard : (Krow.support ∩ Kbase.support).card = 4 := by
      simpa [hinter, Krow] using Krow.support_card
    omega
  rcases Finset.not_subset.mp hnot_subset with ⟨x, hxrow, hxnotBase⟩
  refine ⟨x, by simpa [Krow] using hxrow, ?_⟩
  intro hxradius
  have hxBase : x ∈ Kbase.support := by
    by_cases hxq : x = q
    · simp [Kbase, dangerousBaseSelectedFourClass, hxq]
    · have hxp : x ≠ p := by
        intro hxp
        have hzero : dist p x = 0 := by simp [hxp]
        linarith [hfixed.q_radius_pos, hxradius, hzero]
      have hxA : x ∈ D.A := by
        exact Krow.support_subset_A hxrow
      have hxSkeleton : x ∈ D.skeleton q := by
        have hxEraseQ : x ∈ D.A.erase q :=
          Finset.mem_erase.mpr ⟨hxq, hxA⟩
        simpa [CounterexampleData.skeleton] using hxEraseQ
      have hxC :
          x ∈ ((D.skeleton q).erase p).filter
            (fun y => dist p y = dist p q) := by
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr ⟨hxp, hxSkeleton⟩, hxradius⟩
      have hCeq :=
        H.dangerous.exact_radius_class_eq H.exactQDeletedRadius
      have hxT : x ∈ ({t1, t2, t3} : Finset ℝ²) := by
        simpa [hCeq] using hxC
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxT
      rcases hxT with rfl | rfl | rfl
      · simp [Kbase, dangerousBaseSelectedFourClass]
      · simp [Kbase, dangerousBaseSelectedFourClass]
      · simp [Kbase, dangerousBaseSelectedFourClass]
  exact hxnotBase hxBase

/-- Relabel only the `t2` source row so that its first slot is off the
dangerous `p`-circle, assuming that row is not itself centered at `p`. -/
theorem exists_t2RelabeledRows_offDangerous_of_center_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hcenter_ne : rows.t2Row.center ≠ p) :
    ∃ rows' : U1Depth5.CriticalSourceRows D q t1 t2 t3 u,
      rows'.qRow = rows.qRow ∧
        rows'.t1Row = rows.t1Row ∧
        rows'.t2Row.center = rows.t2Row.center ∧
        rows'.t3Row = rows.t3Row ∧
        rows'.uRow = rows.uRow ∧
        U1LargeCapRouteBTailT20OffDangerousTarget (p := p) rows' := by
  rcases exists_t2Row_support_offDangerous_of_center_ne_p
      hfixed H hcenter_ne with
    ⟨x, hxrow, hxoff⟩
  rcases rows.t2Row.selected.exists_relabel_l1 hxrow with
    ⟨selected', hselected_shell, hselected_l1⟩
  let t2Row' : U1Depth5.CriticalRowPacket D t2 :=
    { source_mem := rows.t2Row.source_mem
      center := rows.t2Row.center
      selected := selected' }
  let rows' : U1Depth5.CriticalSourceRows D q t1 t2 t3 u :=
    { qRow := rows.qRow
      t1Row := rows.t1Row
      t2Row := t2Row'
      t3Row := rows.t3Row
      uRow := rows.uRow }
  refine ⟨rows', rfl, rfl, rfl, rfl, rfl, ?_⟩
  simpa [U1LargeCapRouteBTailT20OffDangerousTarget, rows', t2Row',
    U1Depth5.CriticalSourceRows.pointOfChoice,
    U1Depth5.CriticalSourceRows.rowAt, U1Depth5.CriticalRowPacket.slotPoint,
    hselected_l1] using hxoff

/-- A `p`-centered `t2` source row must select the deleted point `q`.

If it did not, its four selected points would survive in
`(D.skeleton q).erase p` as a four-point class centered at `p`, contradicting
the localized no-q-free packet. -/
theorem false_of_t2Row_center_p_q_not_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hcenter : rows.t2Row.center = p)
    (hq_not_named :
      ¬ (q = rows.t2Row.selected.l1 ∨ q = rows.t2Row.selected.l2 ∨
        q = rows.t2Row.selected.l3 ∨ q = rows.t2Row.selected.l4)) :
    False := by
  let S := rows.t2Row.selected.toCriticalFourShell.support
  let r := rows.t2Row.selected.toCriticalFourShell.radius
  have hq_not_support :
      q ∉ rows.t2Row.selected.toCriticalFourShell.support := by
    intro hqmem
    exact hq_not_named
      ((rows.t2Row.selected.mem_support_iff_named).mp hqmem)
  have hS_subset :
      S ⊆ ((D.skeleton q).erase p).filter fun y => dist p y = r := by
    intro x hx
    have hxSupport :
        x ∈ rows.t2Row.selected.toCriticalFourShell.support := by
      simpa [S] using hx
    have hxA : x ∈ D.A :=
      rows.t2Row.selected.toCriticalFourShell.support_subset_A hxSupport
    have hx_ne_q : x ≠ q := by
      intro hxq
      exact hq_not_support (by simpa [hxq] using hxSupport)
    have hx_ne_p : x ≠ p := by
      intro hxp
      exact rows.t2Row.selected.toCriticalFourShell.center_not_mem_support
        (by simpa [hcenter, hxp] using hxSupport)
    have hxSkeleton : x ∈ D.skeleton q := by
      have hxEraseQ : x ∈ D.A.erase q :=
        Finset.mem_erase.mpr ⟨hx_ne_q, hxA⟩
      simpa [CounterexampleData.skeleton] using hxEraseQ
    have hxEraseP : x ∈ (D.skeleton q).erase p :=
      Finset.mem_erase.mpr ⟨hx_ne_p, hxSkeleton⟩
    have hdist : dist p x = r := by
      have h :=
        rows.t2Row.selected.toCriticalFourShell.support_eq_radius x hxSupport
      simpa [hcenter, r] using h
    exact Finset.mem_filter.mpr ⟨hxEraseP, hdist⟩
  have hcard_filter :
      4 ≤ (((D.skeleton q).erase p).filter fun y => dist p y = r).card := by
    have hcard_support :
        S.card = 4 := by
      simpa [S] using rows.t2Row.selected.toCriticalFourShell.support_card
    have hle := Finset.card_le_card hS_subset
    omega
  exact hlocalNoQFree.no_qfree
    ⟨r, by simpa [r] using
      rows.t2Row.selected.toCriticalFourShell.radius_pos, hcard_filter⟩

/-- A `p`-centered `t2` source row selecting `q` puts its first slot in the
dangerous radius class, hence creates a named record001 branch-0 collision. -/
theorem branch0Collision_of_t2Row_center_p_q_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hq_named :
      q = rows.t2Row.selected.l1 ∨ q = rows.t2Row.selected.l2 ∨
        q = rows.t2Row.selected.l3 ∨ q = rows.t2Row.selected.l4) :
    U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p := by
  let t20 :=
    rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 }
  have hq_on :
      dist p q = rows.t2Row.selected.toCriticalFourShell.radius := by
    have h := rows.t2Row.point_on_shell_of_eq_named hq_named
    simpa [hcenter] using h
  have ht20_on :
      dist p t20 = rows.t2Row.selected.toCriticalFourShell.radius := by
    have h := rows.t2Row.slotPoint_on_shell 0
    simpa [hcenter, t20, U1Depth5.CriticalSourceRows.pointOfChoice,
      U1Depth5.CriticalSourceRows.rowAt] using h
  have ht20_radius : dist p t20 = dist p q :=
    ht20_on.trans hq_on.symm
  by_cases ht20q : t20 = q
  · exact
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.q_t20
        (by
          simpa [t20, U1Depth5.CriticalSourceRows.pointOfChoice,
            U1Depth5.CriticalSourceRows.rowAt] using ht20q.symm)
  · have ht20_support :
        t20 ∈ rows.t2Row.selected.toCriticalFourShell.support := by
      simpa [t20, U1Depth5.CriticalSourceRows.pointOfChoice,
        U1Depth5.CriticalSourceRows.rowAt,
        U1Depth5.CriticalRowPacket.slotPoint] using
        rows.t2Row.selected.l1_mem_support
    have ht20_ne_p : t20 ≠ p := by
      intro ht20p
      exact rows.t2Row.selected.toCriticalFourShell.center_not_mem_support
        (by simpa [hcenter, ht20p] using ht20_support)
    have ht20Skeleton : t20 ∈ D.skeleton q := by
      have ht20A : t20 ∈ D.A :=
        rows.pointOfChoice_mem { source := U1Depth5.CriticalSource.t2, slot := 0 }
      have ht20EraseQ : t20 ∈ D.A.erase q :=
        Finset.mem_erase.mpr ⟨ht20q, ht20A⟩
      simpa [CounterexampleData.skeleton] using ht20EraseQ
    have ht20C :
        t20 ∈ ((D.skeleton q).erase p).filter
          (fun y => dist p y = dist p q) := by
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr ⟨ht20_ne_p, ht20Skeleton⟩, ht20_radius⟩
    have hCeq :=
      H.dangerous.exact_radius_class_eq H.exactQDeletedRadius
    have ht20_mem : t20 ∈ ({t1, t2, t3} : Finset ℝ²) := by
      simpa [t20, hCeq] using ht20C
    simp only [Finset.mem_insert, Finset.mem_singleton] at ht20_mem
    rcases ht20_mem with ht20_eq_t1 | ht20_eq_t2 | ht20_eq_t3
    · exact
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t1_t20
          (by
            simpa [t20, U1Depth5.CriticalSourceRows.pointOfChoice,
              U1Depth5.CriticalSourceRows.rowAt] using ht20_eq_t1.symm)
    · exact
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t2_t20
          (by
            simpa [t20, U1Depth5.CriticalSourceRows.pointOfChoice,
              U1Depth5.CriticalSourceRows.rowAt] using ht20_eq_t2.symm)
    · exact
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t3_t20
          (by
            simpa [t20, U1Depth5.CriticalSourceRows.pointOfChoice,
              U1Depth5.CriticalSourceRows.rowAt] using ht20_eq_t3.symm)

/-- A `p`-centered original `t2` source row has exactly the dangerous
`{q,t1,t2,t3}` support.

The localized no-q-free packet first forces the deleted point `q` into the row;
then exactness of the q-deleted dangerous radius class identifies all remaining
selected points with the dangerous triple. -/
theorem t2Row_selected_support_eq_dangerous_of_center_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hcenter : rows.t2Row.center = p) :
    rows.t2Row.selected.toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  classical
  have hq_named :
      q = rows.t2Row.selected.l1 ∨ q = rows.t2Row.selected.l2 ∨
        q = rows.t2Row.selected.l3 ∨ q = rows.t2Row.selected.l4 := by
    by_contra hq_not_named
    exact false_of_t2Row_center_p_q_not_named
      hlocalNoQFree hcenter hq_not_named
  have hq_on :
      dist p q = rows.t2Row.selected.toCriticalFourShell.radius := by
    have h := rows.t2Row.point_on_shell_of_eq_named hq_named
    simpa [hcenter] using h
  have hsubset :
      rows.t2Row.selected.toCriticalFourShell.support ⊆
        ({q, t1, t2, t3} : Finset ℝ²) := by
    intro x hxSupport
    by_cases hxq : x = q
    · simp [hxq]
    · have hx_on :
          dist p x = rows.t2Row.selected.toCriticalFourShell.radius := by
        have h :=
          rows.t2Row.selected.toCriticalFourShell.support_eq_radius
            x hxSupport
        simpa [hcenter] using h
      have hx_radius : dist p x = dist p q := hx_on.trans hq_on.symm
      have hx_ne_p : x ≠ p := by
        intro hxp
        exact rows.t2Row.selected.toCriticalFourShell.center_not_mem_support
          (by simpa [hcenter, hxp] using hxSupport)
      have hxA : x ∈ D.A :=
        rows.t2Row.selected.toCriticalFourShell.support_subset_A hxSupport
      have hxSkeleton : x ∈ D.skeleton q := by
        have hxEraseQ : x ∈ D.A.erase q :=
          Finset.mem_erase.mpr ⟨hxq, hxA⟩
        simpa [CounterexampleData.skeleton] using hxEraseQ
      have hxC :
          x ∈ ((D.skeleton q).erase p).filter
            (fun y => dist p y = dist p q) := by
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr ⟨hx_ne_p, hxSkeleton⟩, hx_radius⟩
      have hCeq :=
        H.dangerous.exact_radius_class_eq H.exactQDeletedRadius
      have hxT : x ∈ ({t1, t2, t3} : Finset ℝ²) := by
        simpa [hCeq] using hxC
      simp only [Finset.mem_insert, Finset.mem_singleton]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxT
      exact Or.inr hxT
  refine Finset.eq_of_subset_of_card_le hsubset ?_
  have hbase_card :
      ({q, t1, t2, t3} : Finset ℝ²).card = 4 := by
    simpa [dangerousBaseSelectedFourClass] using
      (dangerousBaseSelectedFourClass hfixed).support_card
  rw [hbase_card,
    rows.t2Row.selected.toCriticalFourShell.support_card]

/-- The original `t2` row has a precise two-way outcome: either it can be
replayed with an off-dangerous first slot, or its current first slot is already
a named record001 branch-0 collision. -/
theorem exists_t2RelabeledRows_offDangerous_or_branch0Collision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    (∃ rows' : U1Depth5.CriticalSourceRows D q t1 t2 t3 u,
      rows'.qRow = rows.qRow ∧
        rows'.t1Row = rows.t1Row ∧
        rows'.t2Row.center = rows.t2Row.center ∧
        rows'.t3Row = rows.t3Row ∧
        rows'.uRow = rows.uRow ∧
        U1LargeCapRouteBTailT20OffDangerousTarget (p := p) rows') ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p := by
  classical
  by_cases hcenter : rows.t2Row.center = p
  · right
    by_cases hq_named :
        q = rows.t2Row.selected.l1 ∨ q = rows.t2Row.selected.l2 ∨
          q = rows.t2Row.selected.l3 ∨ q = rows.t2Row.selected.l4
    · exact branch0Collision_of_t2Row_center_p_q_named H hcenter hq_named
    · exact False.elim
        (false_of_t2Row_center_p_q_not_named
          hlocalNoQFree hcenter hq_named)
  · left
    exact exists_t2RelabeledRows_offDangerous_of_center_ne_p hfixed H hcenter

/-- Collision-exclusion side conditions for the hocc-free record001 branch-0
collision sink.

These are exactly the point inequalities consumed by the existing generated
`f1:t2` collision adapter.  They do not produce a packet-label branch; they
only make the already named `Record001Branch0Collision` alternative
contradictory. -/
structure U1LargeCapRouteBTailBranch0CollisionExclusionTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop where
  hcrossNoP :
    ∀ a ∈ [q, t1, t2, t3, u],
      ∀ b ∈ [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1], a ≠ b
  hp_f5 :
    p ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1
  hf11_t21 :
    (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 ≠
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1
  hf12_t21 :
    (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 ≠
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1

namespace U1LargeCapRouteBTailBranch0CollisionExclusionTarget

/-- The collision-exclusion inequality package already supplies the all-inequality
side of the branch-0 collision split. -/
theorem toNoCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows) :
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p := by
  refine
    { q_t20 := ?_, q_f11 := ?_, q_f12 := ?_, q_t21 := ?_,
      t1_t20 := ?_, t1_f11 := ?_, t1_f12 := ?_, t1_t21 := ?_,
      t2_t20 := ?_, t2_f11 := ?_, t2_f12 := ?_, t2_t21 := ?_,
      t3_t20 := ?_, t3_f11 := ?_, t3_f12 := ?_, t3_t21 := ?_,
      u_t20 := ?_, u_f11 := ?_, u_f12 := ?_, u_t21 := ?_,
      p_t21 := H.hp_f5, f11_t21 := H.hf11_t21, f12_t21 := H.hf12_t21 }
  all_goals
    first
    | exact H.hcrossNoP q (by simp) _ (by simp)
    | exact H.hcrossNoP t1 (by simp) _ (by simp)
    | exact H.hcrossNoP t2 (by simp) _ (by simp)
    | exact H.hcrossNoP t3 (by simp) _ (by simp)
    | exact H.hcrossNoP u (by simp) _ (by simp)

/-- The generated branch-0 no-collision package is the same inequality surface
as the local collision-exclusion target. -/
theorem ofNoCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p) :
    U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows := by
  refine
    { hcrossNoP := ?_
      hp_f5 := H.p_t21
      hf11_t21 := H.f11_t21
      hf12_t21 := H.f12_t21 }
  intro a ha b hb
  simp only [List.mem_cons, List.not_mem_nil, or_false] at ha hb
  rcases ha with rfl | rfl | rfl | rfl | rfl
  · rcases hb with rfl | rfl | rfl | rfl
    · exact H.q_t20
    · exact H.q_f11
    · exact H.q_f12
    · exact H.q_t21
  · rcases hb with rfl | rfl | rfl | rfl
    · exact H.t1_t20
    · exact H.t1_f11
    · exact H.t1_f12
    · exact H.t1_t21
  · rcases hb with rfl | rfl | rfl | rfl
    · exact H.t2_t20
    · exact H.t2_f11
    · exact H.t2_f12
    · exact H.t2_t21
  · rcases hb with rfl | rfl | rfl | rfl
    · exact H.t3_t20
    · exact H.t3_f11
    · exact H.t3_f12
    · exact H.t3_t21
  · rcases hb with rfl | rfl | rfl | rfl
    · exact H.u_t20
    · exact H.u_f11
    · exact H.u_f12
    · exact H.u_t21

/-- The local collision-exclusion target is equivalent to the generated
branch-0 no-collision package. -/
theorem iff_noCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u} :
    U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows ↔
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p :=
  ⟨toNoCollision, ofNoCollision⟩

/-- Classical branch split for the current collision-exclusion surface:
either all local collision-exclusion inequalities hold, or one of the named
record001 branch-0 collisions holds. -/
theorem or_branch0Collision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p := by
  rcases U1Depth5.RowSlotLabelPacket.record001Branch0_split rows p with
    hNoCollision | hCollision
  · exact Or.inl (ofNoCollision hNoCollision)
  · exact Or.inr hCollision

/-- The collision-exclusion inequality package directly contradicts every
constructor of the named branch-0 collision alternative. -/
theorem false_of_branch0Collision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p) :
    False := by
  cases hCollision with
  | q_t20 h => exact H.hcrossNoP q (by simp) _ (by simp) h
  | q_f11 h => exact H.hcrossNoP q (by simp) _ (by simp) h
  | q_f12 h => exact H.hcrossNoP q (by simp) _ (by simp) h
  | q_t21 h => exact H.hcrossNoP q (by simp) _ (by simp) h
  | t1_t20 h => exact H.hcrossNoP t1 (by simp) _ (by simp) h
  | t1_f11 h => exact H.hcrossNoP t1 (by simp) _ (by simp) h
  | t1_f12 h => exact H.hcrossNoP t1 (by simp) _ (by simp) h
  | t1_t21 h => exact H.hcrossNoP t1 (by simp) _ (by simp) h
  | t2_t20 h => exact H.hcrossNoP t2 (by simp) _ (by simp) h
  | t2_f11 h => exact H.hcrossNoP t2 (by simp) _ (by simp) h
  | t2_f12 h => exact H.hcrossNoP t2 (by simp) _ (by simp) h
  | t2_t21 h => exact H.hcrossNoP t2 (by simp) _ (by simp) h
  | t3_t20 h => exact H.hcrossNoP t3 (by simp) _ (by simp) h
  | t3_f11 h => exact H.hcrossNoP t3 (by simp) _ (by simp) h
  | t3_f12 h => exact H.hcrossNoP t3 (by simp) _ (by simp) h
  | t3_t21 h => exact H.hcrossNoP t3 (by simp) _ (by simp) h
  | u_t20 h => exact H.hcrossNoP u (by simp) _ (by simp) h
  | u_f11 h => exact H.hcrossNoP u (by simp) _ (by simp) h
  | u_f12 h => exact H.hcrossNoP u (by simp) _ (by simp) h
  | u_t21 h => exact H.hcrossNoP u (by simp) _ (by simp) h
  | p_t21 h => exact H.hp_f5 h
  | f11_t21 h => exact H.hf11_t21 h
  | f12_t21 h => exact H.hf12_t21 h

/-- Under the collision-exclusion package, the alternate branch in the local
metric-bridge target is impossible, so the target collapses to the public q/t1
transport package. -/
theorem toQTFacingTransportRows
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hMetric : U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows) :
    U1Depth5.Record001QTFacingTransportRows p q t1 t2 t3 u := by
  rw [u1_largeCap_routeB_metricBridgeTarget_iff_q_t1_shell_or_collision] at hMetric
  rcases hMetric with hShell | hCollision
  · rcases hShell with ⟨hqShell, ht1Shell⟩
    rcases hqShell with ⟨hq_t1, hq_t2, hq_f1⟩
    rcases ht1Shell with ⟨ht1_p, ht1_q, ht1_t3, ht1_f1⟩
    have hSupport :
        Nonempty (U1Depth5.Record001QTShellSupport D p q t1 t2 t3 u) :=
      U1Depth5.PacketLabelCenteredRows.record001QTShellSupport_ofGlobalK4
        rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
        rows.t3Row.source_mem rows.uRow.source_mem
        hq_t1 hq_t2 hq_f1 ht1_p ht1_q ht1_t3 ht1_f1
    exact
      U1Depth5.PacketLabelCenteredRows.record001QTFacingTransportRows_of_shellSupport
        hSupport.some
  · exact False.elim (H.false_of_branch0Collision hCollision)

/-- Tail-facing branch-data consumer after the collision-exclusion package has
been converted into the no-collision constructor surface expected by the banked
record001 consumer. -/
theorem false_of_fields
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (hrow_q_p_f1 : dist q p = dist q u)
    (hqt : U1Depth5.Record001QTFacingTransportRows p q t1 t2 t3 u)
    (hrow_t2_f5_f2 :
      dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist t2 p =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist t2 q =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist t3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist t3 u)
    (hrow_t3_p_f1 : dist t3 p = dist t3 u)
    (hrow_t3_t1_f1 : dist t3 t1 = dist t3 u)
    (hextra_f1_t2 :
      dist u t2 =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False :=
  U1Depth5SourceUnitGenerated.Record001Branch0ProducerData.false_of_fields
    hfixed hbase H.toNoCollision hrow_q_p_f1 hqt hrow_t2_f5_f2
    hrow_t2_p_f2 hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1
    hrow_t3_t1_f1 hextra_f1_t2

/-- Tail-facing branch-data consumer after replacing the explicit q/t1
transport package with the local metric-bridge target.

This is the current cheapest local reduction of the explicit branch0 consumer:
under collision exclusion, the branch0-collision side of the metric-bridge
target is already impossible, so the target supplies the public `hqt` package
for free. -/
theorem false_of_metricBridgeTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (hMetric : U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows)
    (hrow_q_p_f1 : dist q p = dist q u)
    (hrow_t2_f5_f2 :
      dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist t2 p =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist t2 q =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist t3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist t3 u)
    (hrow_t3_p_f1 : dist t3 p = dist t3 u)
    (hrow_t3_t1_f1 : dist t3 t1 = dist t3 u)
    (hextra_f1_t2 :
      dist u t2 =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False :=
  H.false_of_fields hfixed hbase hrow_q_p_f1
    (H.toQTFacingTransportRows hMetric) hrow_t2_f5_f2 hrow_t2_p_f2
    hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1 hextra_f1_t2

end U1LargeCapRouteBTailBranch0CollisionExclusionTarget

/-- The imported `f1:t2` adapter closes the named collision side under the
exact tail-facing collision-exclusion inequalities. -/
theorem u1_largeCap_routeB_branch0Collision_false_of_exclusion
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p) :
    False :=
  H.false_of_branch0Collision hCollision

/-- With collision-exclusion inequalities available, the hocc-free
`p = f1[3]` branch reduces to the single `u = f1[0]` residual; excluding that
residual closes both sides of the record001 branch-0 split. -/
theorem u1_largeCap_routeB_f1Slot0ExcludedTarget_false_of_collisionExclusion
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hTarget : U1LargeCapRouteBTailF1Slot0ExcludedTarget (p := p) rows) :
    False := by
  rcases hTarget with ⟨hfix_p_f1_3, hU_ne_f10⟩
  rcases u1_largeCap_routeB_collision_or_f1Slot0_of_pPlacement
      hP_U hfix_p_f1_3 with hCollision | hU_f10
  · exact u1_largeCap_routeB_branch0Collision_false_of_exclusion H hCollision
  · exact hU_ne_f10 hU_f10

/-- Under the collision-exclusion package, the older two-field `f1`-tail target
already contradicts directly.

This is stronger than the hocc-free `f1[0]` residual split: once the live route
recovers the old occurrence/placement pair `f2 = f1[0]` and `p = f1[3]`, the
collision-exclusion inequalities supply the no-collision side automatically, so
no additional q/t1 transport or residual-row facts are needed. -/
theorem u1_largeCap_routeB_f1TailCollisionTarget_false_of_collisionExclusion
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hF1Tail : U1LargeCapRouteBTailF1TailCollisionTarget (p := p) rows) :
    False :=
  u1_largeCap_routeB_f1TailCollisionTarget_false_of_noCollision
    hP_U H.toNoCollision hF1Tail

/-- With collision-exclusion inequalities available, the hocc-free branch split
forces the positive residual `u = f1[0]`.

This is the exact equality-side residual now targeted by the active #2255
faithful SAT/SMT check: once the branch-0 collision alternative is ruled out
and `p = f1[3]` is known, the remaining case is the first `f1` slot. -/
theorem u1_largeCap_routeB_f1Slot0_of_pPlacement_of_collisionExclusion
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (H : U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hfix_p_f1_3 :
      p = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) :
    u = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0 := by
  rcases u1_largeCap_routeB_collision_or_f1Slot0_of_pPlacement
      hP_U hfix_p_f1_3 with hCollision | hU_f10
  · exact False.elim
      (u1_largeCap_routeB_branch0Collision_false_of_exclusion H hCollision)
  · exact hU_f10

/-- Exact reduced no-collision target on the current `f1:t2` collision-product
lane.

This packages the theorem-facing branch-data still needed after the broad
record001 branch-0 residual surface was shrunk.  The collision side is already
named separately by `U1LargeCapRouteBTailF1TailCollisionTarget`; this target is
the no-collision consumer surface that the live large-cap tail now needs to
produce if it does not close by immediate branch0 collision.  In the current
tree this target is over-strong: `Record001Branch0NoCollision` together with
the embedded `U1LargeCapRouteBTailF1TailCollisionTarget` already contradicts
the named prefix theorem
`Record001Branch0NoCollision.false_of_f1Tail_source`, before any q/t1 or
residual-row fields are used. -/
structure U1LargeCapRouteBTailF1T2NoCollisionTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop where
  hNoCollision :
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p
  hF1Tail : U1LargeCapRouteBTailF1TailCollisionTarget (p := p) rows
  hrow_q_p_f1 : dist q p = dist q u
  hqt : U1Depth5.Record001QTFacingTransportRows p q t1 t2 t3 u
  hrow_t2_p_f2 :
    dist t2 p =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t2_q_f2 :
    dist t2 q =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t3_p_f1 : dist t3 p = dist t3 u
  hrow_t3_t1_f1 : dist t3 t1 = dist t3 u
  hextra_f1_t2 :
    dist u t2 =
      dist u
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })

/-- The reduced no-collision `f1:t2` target is already inconsistent at its
common `f1`-tail input: the no-collision split rules out the same three
`selectedU` collisions forced by the branch-0 occurrence/placement pattern. -/
theorem u1_largeCap_routeB_f1t2NoCollisionTarget_false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (T : U1LargeCapRouteBTailF1T2NoCollisionTarget (p := p) rows) :
    False := by
  exact
    u1_largeCap_routeB_f1TailCollisionTarget_false_of_noCollision
      hP_U T.hNoCollision T.hF1Tail

/-- Exact post-`hF1Tail` direct-extra consumer surface on the current
record001 branch-0 `f1:t2` lane.

This is downstream of the live producer target
`U1LargeCapRouteBTailF1TailCollisionTarget`: once the `f1`-tail occurrence and
placement are available, the no-collision branch already closes immediately by
`Record001Branch0NoCollision.false_of_f1Tail_source`.  The remaining generated
collision sink uses this direct-extra consumer surface, whose fields are the
literal q/t1 placement, residual-row, slot-metric, and extra-incidence inputs
still required by
`Record001Branch0Collision.false_of_f1t2_extra_omit3_f1_tail_source_direct_extra`.

This is a consumer package only.  It does not replace the live producer target
`U1LargeCapRouteBTailF1TailCollisionTarget`, and it is over-strong as a live
tail package: its t1-placement block already contradicts
`CriticalSourceRows.record001Branch0_t1Placements_absurd`. -/
structure U1LargeCapRouteBTailF1T2DirectExtraConsumerData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop where
  hfix_t1_q_2 :
    t1 = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2
  hfix_f1_q_0 :
    u = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0
  hfix_t2_q_3 :
    t2 = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3
  hfix_p_t1_1 :
    p = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1
  hfix_f1_t1_0 :
    u = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0
  hfix_q_t1_2 :
    q = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2
  hfix_t3_t1_3 :
    t3 = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3
  hrow_q_p_f1 : dist q p = dist q u
  hrow_t2_f5_f2 :
    dist t2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1) =
      dist t2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
  hrow_t2_p_f2 :
    dist t2 p =
      dist t2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
  hrow_t2_q_f2 :
    dist t2 q =
      dist t2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
  hrow_t3_f2_f1 :
    dist t3 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) =
      dist t3 u
  hrow_t3_p_f1 : dist t3 p = dist t3 u
  hrow_t3_t1_f1 : dist t3 t1 = dist t3 u
  hslot_q_t1_f1 :
    dist q ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
      dist q ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0)
  hslot_q_t2_f1 :
    dist q ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
      dist q ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0)
  hslot_t1_p_f1 :
    dist t1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
      dist t1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hslot_t1_q_f1 :
    dist t1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
      dist t1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hslot_t1_t3_f1 :
    dist t1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
      dist t1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hextra_f1_t2 :
    dist u t2 =
      dist u ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)

namespace U1LargeCapRouteBTailF1T2DirectExtraConsumerData

/-- The named direct-extra consumer surface is already contradictory on the
live tail: its t1-placement block alone is incompatible with the source-indexed
critical-row semantics, before the imported direct-extra replay is even used. -/
theorem false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hbase :
      List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailF1T2DirectExtraConsumerData (p := p) rows) :
    False := by
  exact
    U1Depth5.CriticalSourceRows.record001Branch0_t1Placements_absurd
      rows hbase B.hfix_f1_t1_0 B.hfix_p_t1_1 B.hfix_q_t1_2 B.hfix_t3_t1_3

end U1LargeCapRouteBTailF1T2DirectExtraConsumerData

/-- Scratch/artifact record001 branch-0 source-core producer surface for the
extracted U1 large-cap tail.

This mirrors the scratch `source_core_facts()` contract currently used to track
the live producer gap.  It packages the two `f1`-tail branch equalities
`f2 = f1[0]` and `p = f1[3]` together with the q/t1 source-row placements,
the remaining direct-extra row equalities, the q/t1 slot equalities, and the
live `f1:t2` extra-incidence atom.  This is intentionally stronger than the
minimal live target `U1LargeCapRouteBTailF1TailCollisionTarget`: several fields
remain scratch-only diagnostic source-row facts, and the bundle records a
concrete landing pad for solver/emitter work rather than a claim that the live
tail can already produce it.  The shared definition lives in
`U1Depth5QT3PilotRecord001F1T2Omit3.lean`; the tail module keeps only the local
projection helpers. -/
abbrev U1LargeCapRouteBTailSourceCoreProducerData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  U1Depth5SourceUnitGenerated.Record001Branch0SourceCoreProducerData
    (baseP := p) (baseQ := q) (baseT1 := t1) (baseT2 := t2)
    (baseT3 := t3) (selectedU := u) rows

namespace U1LargeCapRouteBTailSourceCoreProducerData

/-- The source-core producer package carries the two-field `f1`-tail collision
target used by the minimal branch0 collision bypass. -/
theorem toF1TailCollisionTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailSourceCoreProducerData (p := p) rows) :
    U1LargeCapRouteBTailF1TailCollisionTarget (p := p) rows :=
  ⟨B.hocc_f2_f1_0, B.hfix_p_f1_3⟩

/-- The source-core producer package also supplies the named direct-extra
consumer surface. -/
theorem toDirectExtraConsumerData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailSourceCoreProducerData (p := p) rows) :
    U1LargeCapRouteBTailF1T2DirectExtraConsumerData (p := p) rows where
  hfix_t1_q_2 := B.hfix_t1_q_2
  hfix_f1_q_0 := B.hfix_f1_q_0
  hfix_t2_q_3 := B.hfix_t2_q_3
  hfix_p_t1_1 := B.hfix_p_t1_1
  hfix_f1_t1_0 := B.hfix_f1_t1_0
  hfix_q_t1_2 := B.hfix_q_t1_2
  hfix_t3_t1_3 := B.hfix_t3_t1_3
  hrow_q_p_f1 := B.hrow_12
  hrow_t2_f5_f2 := B.hrow_20
  hrow_t2_p_f2 := B.hrow_21
  hrow_t2_q_f2 := B.hrow_22
  hrow_t3_f2_f1 := B.hrow_24
  hrow_t3_p_f1 := B.hrow_25
  hrow_t3_t1_f1 := B.hrow_26
  hslot_q_t1_f1 := B.hslot_q_t1_f1
  hslot_q_t2_f1 := B.hslot_q_t2_f1
  hslot_t1_p_f1 := B.hslot_t1_p_f1
  hslot_t1_q_f1 := B.hslot_t1_q_f1
  hslot_t1_t3_f1 := B.hslot_t1_t3_f1
  hextra_f1_t2 := B.hextra_f1_t2

/-- Any complete source-core producer bundle already contradicts the banked
record001 direct-extra branch consumer. -/
theorem false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hbase :
      List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailSourceCoreProducerData (p := p) rows) :
    False :=
  B.toDirectExtraConsumerData.false hbase

/-- The source-core producer package reaches the broader local metric-bridge
target through the minimal `f1`-tail collision bypass. -/
theorem toMetricBridgeTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailSourceCoreProducerData (p := p) rows) :
    U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows :=
  u1_largeCap_routeB_f1TailCollisionTarget_to_metricBridgeTarget hP_U
    B.toF1TailCollisionTarget

end U1LargeCapRouteBTailSourceCoreProducerData

/-- Local alias for the explicit branch-0 packet surface consumed by the
banked record001 `f1:t2` branch-data adapter.

This is the current theorem-facing fixed consumer after the pair-collision
screens were banked: if the live large-cap tail can produce this package, the
imported `Record001Branch0ProducerData.false_of_fields` theorem closes the
record001 branch directly.  The remaining U1.2 gap is precisely that live
producer route from blocker-centered tail data into these fields. -/
abbrev U1LargeCapRouteBTailBranch0ProducerData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  U1Depth5SourceUnitGenerated.Record001Branch0ProducerData (baseP := p) rows

namespace U1LargeCapRouteBTailBranch0ProducerData

/-- Tail-facing projection of the imported record001 branch-0 consumer. -/
theorem false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailBranch0ProducerData (p := p) rows)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u]) :
    False :=
  U1Depth5SourceUnitGenerated.Record001Branch0ProducerData.false
    B hfixed hbase

/-- Tail-facing field form of the imported record001 branch-0 consumer. -/
theorem false_of_fields
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (noCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows p)
    (hrow_q_p_f1 : dist q p = dist q u)
    (hqt : U1Depth5.Record001QTFacingTransportRows p q t1 t2 t3 u)
    (hrow_t2_f5_f2 :
      dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist t2 p =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist t2 q =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist t3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist t3 u)
    (hrow_t3_p_f1 : dist t3 p = dist t3 u)
    (hrow_t3_t1_f1 : dist t3 t1 = dist t3 u)
    (hextra_f1_t2 :
      dist u t2 =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False :=
  U1Depth5SourceUnitGenerated.Record001Branch0ProducerData.false_of_fields
    hfixed hbase noCollision hrow_q_p_f1 hqt hrow_t2_f5_f2
    hrow_t2_p_f2 hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1
    hrow_t3_t1_f1 hextra_f1_t2

end U1LargeCapRouteBTailBranch0ProducerData

/-- Exact current residual branch-data surface after the collision-exclusion
package and metric-bridge route are chosen.

This is the smallest named tail-local consumer contract on the current primary
U1.2 lane.  Under collision exclusion, `U1LargeCapRouteBTailMetricBridgeTarget`
already supplies the public q/t1 transport package, so the remaining explicit
fields are exactly the residual packet-label equal-distance facts plus the
`f1:t2` extra-incidence equality.  Producing this structure from the live
blocker-centered tail data would close the current leaf immediately. -/
structure U1LargeCapRouteBTailMetricResidualTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop where
  hCollisionExclusion :
    U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows
  hMetric : U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows
  hrow_q_p_f1 : dist q p = dist q u
  hrow_t2_f5_f2 :
    dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t2_p_f2 :
    dist t2 p =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t2_q_f2 :
    dist t2 q =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t3_f2_f1 :
    dist t3
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
      dist t3 u
  hrow_t3_p_f1 : dist t3 p = dist t3 u
  hrow_t3_t1_f1 : dist t3 t1 = dist t3 u
  hextra_f1_t2 :
    dist u t2 =
      dist u
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })

namespace U1LargeCapRouteBTailMetricResidualTarget

/-- Under the center identification for the extra record001 `f2` critical row,
being at the same `t2`-distance as the `f2` source is equivalent to being one
of the four selected labels of that critical row.

This is the exactness form behind the f2-row producer target: once the center
is identified with `t2`, each `t2:* = f2` residual hrow is the same obligation
as a selected-label placement in the f2 critical row. -/
theorem f2CriticalRow_hrow_iff_named
    {D : CounterexampleData} {q t1 t2 t3 u z : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = t2)
    (hzA : z ∈ D.A) :
    dist t2 z =
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) ↔
      z = f2CriticalRow.selected.l1 ∨
        z = f2CriticalRow.selected.l2 ∨
        z = f2CriticalRow.selected.l3 ∨
        z = f2CriticalRow.selected.l4 := by
  constructor
  · intro hrow
    have hf2_on :
        dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
          f2CriticalRow.selected.toCriticalFourShell.radius := by
      simpa [hcenter] using f2CriticalRow.source_on_shell
    have hzdist :
        dist f2CriticalRow.center z =
          f2CriticalRow.selected.toCriticalFourShell.radius := by
      have hdist_center : dist f2CriticalRow.center z = dist t2 z := by
        simp [hcenter]
      exact hdist_center.trans (hrow.trans hf2_on)
    exact f2CriticalRow.full_shell_exact hzA hzdist
  · intro hnamed
    have hz_on :
        dist t2 z =
          f2CriticalRow.selected.toCriticalFourShell.radius := by
      have h := f2CriticalRow.point_on_shell_of_eq_named hnamed
      simpa [hcenter] using h
    have hf2_on :
        dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
          f2CriticalRow.selected.toCriticalFourShell.radius := by
      simpa [hcenter] using f2CriticalRow.source_on_shell
    exact hz_on.trans hf2_on.symm

/-- Under the desired `center = t2` branch, any carrier point either is one of
the selected labels of the extra `f2` critical row, or it fails the corresponding
`t2:* = f2` metric row.

This is the local branch boundary for the f2-row placement obligations: the
positive side feeds `false_of_f2CriticalRow_named`, while the negative side is
the exact hrow-failure branch a later incidence/certificate argument must
route. -/
theorem f2CriticalRow_named_or_hrow_ne
    {D : CounterexampleData} {q t1 t2 t3 u z : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = t2)
    (hzA : z ∈ D.A) :
    (z = f2CriticalRow.selected.l1 ∨
        z = f2CriticalRow.selected.l2 ∨
        z = f2CriticalRow.selected.l3 ∨
        z = f2CriticalRow.selected.l4) ∨
      dist t2 z ≠
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) := by
  classical
  by_cases hnamed :
      z = f2CriticalRow.selected.l1 ∨
        z = f2CriticalRow.selected.l2 ∨
        z = f2CriticalRow.selected.l3 ∨
        z = f2CriticalRow.selected.l4
  · exact Or.inl hnamed
  · right
    intro hrow
    exact hnamed
      ((f2CriticalRow_hrow_iff_named f2CriticalRow hcenter hzA).mp hrow)

/-- Concrete f2-row placement split for the three labels needed by the
`t2:* = f2` residual hrows.

On the desired center branch, either the `f5`, `p`, and `q` placements needed
by `false_of_f2CriticalRow_named` all hold, or at least one of the corresponding
raw residual hrows is false. -/
theorem f2CriticalRow_all_named_or_t2ResidualHRowFailure
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = t2)
    (hpA : p ∈ D.A) :
    ((rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l1 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l2 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l3 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l4) ∧
      (p = f2CriticalRow.selected.l1 ∨ p = f2CriticalRow.selected.l2 ∨
        p = f2CriticalRow.selected.l3 ∨ p = f2CriticalRow.selected.l4) ∧
      (q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4)) ∨
      (dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) ≠
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) ∨
        dist t2 p ≠
          dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }) ∨
        dist t2 q ≠
          dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 })) := by
  classical
  rcases f2CriticalRow_named_or_hrow_ne
      f2CriticalRow hcenter
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 1 }) with
    hf5_named | hf5_fail
  · rcases f2CriticalRow_named_or_hrow_ne
        f2CriticalRow hcenter hpA with
      hp_named | hp_fail
    · rcases f2CriticalRow_named_or_hrow_ne
          f2CriticalRow hcenter rows.qRow.source_mem with
        hq_named | hq_fail
      · exact Or.inl ⟨hf5_named, hp_named, hq_named⟩
      · exact Or.inr (Or.inr (Or.inr hq_fail))
    · exact Or.inr (Or.inr (Or.inl hp_fail))
  · exact Or.inr (Or.inl hf5_fail)

/-- The blocker center of the extra record001 `f2` critical row is an ambient
carrier point distinct from the `f2` source label. -/
theorem f2CriticalRow_center_mem_and_ne_source
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    f2CriticalRow.center ∈ D.A ∧
      f2CriticalRow.center ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } := by
  have hmem :=
    Finset.mem_erase.mp
      f2CriticalRow.selected.toCriticalFourShell.center_mem
  exact ⟨hmem.2, hmem.1⟩

/-- Finite branch split for the blocker center of the extra record001 `f2`
critical row.

The desired producer branch is the `center = t2` case.  The complementary
cases are now explicit: the blocker center is another base-six label, or it is
a fresh carrier point distinct from the base-six labels and from the `f2`
source label. -/
theorem f2CriticalRow_center_baseSix_or_fresh
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    f2CriticalRow.center = p ∨
      f2CriticalRow.center = q ∨
      f2CriticalRow.center = t1 ∨
      f2CriticalRow.center = t2 ∨
      f2CriticalRow.center = t3 ∨
      f2CriticalRow.center = u ∨
      (f2CriticalRow.center ∈ D.A ∧
        f2CriticalRow.center ≠ p ∧
        f2CriticalRow.center ≠ q ∧
        f2CriticalRow.center ≠ t1 ∧
        f2CriticalRow.center ≠ t2 ∧
        f2CriticalRow.center ≠ t3 ∧
        f2CriticalRow.center ≠ u ∧
        f2CriticalRow.center ≠
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) := by
  by_cases hp : f2CriticalRow.center = p
  · exact Or.inl hp
  · by_cases hq : f2CriticalRow.center = q
    · exact Or.inr (Or.inl hq)
    · by_cases ht1 : f2CriticalRow.center = t1
      · exact Or.inr (Or.inr (Or.inl ht1))
      · by_cases ht2 : f2CriticalRow.center = t2
        · exact Or.inr (Or.inr (Or.inr (Or.inl ht2)))
        · by_cases ht3 : f2CriticalRow.center = t3
          · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ht3))))
          · by_cases hu : f2CriticalRow.center = u
            · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hu)))))
            · have hcenter := f2CriticalRow_center_mem_and_ne_source f2CriticalRow
              exact
                Or.inr
                  (Or.inr
                    (Or.inr
                      (Or.inr
                        (Or.inr
                          (Or.inr
                            ⟨hcenter.1, hp, hq, ht1, ht2, ht3, hu,
                              hcenter.2⟩)))))

/-- If the extra `f2` critical row is centered at the U3 apex `p`, then the
only way it avoids the localized no-q-free contradiction is by using the
deleted point `q` as one of its four selected labels.

When `q` is not selected, the full four-point critical shell survives in
`(D.skeleton q).erase p` and is a `p`-centered four-point same-distance class,
contradicting `U3LocalizedNoQFreePacket.no_qfree`. -/
theorem false_of_f2CriticalRow_center_p_q_not_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = p)
    (hq_not_named :
      ¬ (q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4)) :
    False := by
  let S := f2CriticalRow.selected.toCriticalFourShell.support
  let r := f2CriticalRow.selected.toCriticalFourShell.radius
  have hq_not_support :
      q ∉ f2CriticalRow.selected.toCriticalFourShell.support := by
    intro hqmem
    exact hq_not_named
      ((f2CriticalRow.selected.mem_support_iff_named).mp hqmem)
  have hS_subset :
      S ⊆ ((D.skeleton q).erase p).filter fun y => dist p y = r := by
    intro x hx
    have hxSupport :
        x ∈ f2CriticalRow.selected.toCriticalFourShell.support := by
      simpa [S] using hx
    have hxA : x ∈ D.A :=
      f2CriticalRow.selected.toCriticalFourShell.support_subset_A hxSupport
    have hx_ne_q : x ≠ q := by
      intro hxq
      exact hq_not_support (by simpa [hxq] using hxSupport)
    have hx_ne_p : x ≠ p := by
      intro hxp
      exact f2CriticalRow.selected.toCriticalFourShell.center_not_mem_support
        (by simpa [hcenter, hxp] using hxSupport)
    have hxSkeleton : x ∈ D.skeleton q := by
      have hxEraseQ : x ∈ D.A.erase q :=
        Finset.mem_erase.mpr ⟨hx_ne_q, hxA⟩
      simpa [CounterexampleData.skeleton] using hxEraseQ
    have hxEraseP : x ∈ (D.skeleton q).erase p :=
      Finset.mem_erase.mpr ⟨hx_ne_p, hxSkeleton⟩
    have hdist : dist p x = r := by
      have h :=
        f2CriticalRow.selected.toCriticalFourShell.support_eq_radius
          x hxSupport
      simpa [hcenter, r] using h
    exact Finset.mem_filter.mpr ⟨hxEraseP, hdist⟩
  have hcard_filter :
      4 ≤ (((D.skeleton q).erase p).filter fun y => dist p y = r).card := by
    have hcard_support :
        S.card = 4 := by
      simpa [S] using f2CriticalRow.selected.toCriticalFourShell.support_card
    have hle := Finset.card_le_card hS_subset
    omega
  exact hlocalNoQFree.no_qfree
    ⟨r, by simpa [r] using
      f2CriticalRow.selected.toCriticalFourShell.radius_pos, hcard_filter⟩

/-- In the remaining `center = p` branch, if the deleted point `q` is one of
the extra f2-row labels, then the f2 source `t20` lies on the dangerous
`p`-circle.  Hence either `t20 = q`, or exactness of the dangerous radius class
places `t20` among the dangerous triple labels. -/
theorem f2CriticalRow_source_eq_q_or_mem_dangerous_of_center_p_q_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : f2CriticalRow.center = p)
    (hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4) :
    rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } = q ∨
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∈
        ({t1, t2, t3} : Finset ℝ²) := by
  let t20 :=
    rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 }
  have hq_on :
      dist p q = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.point_on_shell_of_eq_named hq_named
    simpa [hcenter] using h
  have ht20_on :
      dist p t20 = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.source_on_shell
    simpa [hcenter, t20] using h
  have ht20_radius : dist p t20 = dist p q :=
    ht20_on.trans hq_on.symm
  by_cases ht20q : t20 = q
  · left
    simpa [t20] using ht20q
  · right
    have hp_ne_t20 : p ≠ t20 := by
      have h := f2CriticalRow.center_ne_source
      simpa [hcenter, t20] using h
    have ht20Skeleton : t20 ∈ D.skeleton q := by
      have ht20A : t20 ∈ D.A := by
        simpa [t20] using f2CriticalRow.source_mem
      have ht20EraseQ : t20 ∈ D.A.erase q :=
        Finset.mem_erase.mpr ⟨ht20q, ht20A⟩
      simpa [CounterexampleData.skeleton] using ht20EraseQ
    have ht20C :
        t20 ∈ ((D.skeleton q).erase p).filter
          (fun y => dist p y = dist p q) := by
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr ⟨hp_ne_t20.symm, ht20Skeleton⟩,
          ht20_radius⟩
    have hCeq :=
      H.dangerous.exact_radius_class_eq H.exactQDeletedRadius
    simpa [t20, hCeq] using ht20C

/-- In the `center = p, q_named` branch, the extra `f2` row is exactly the
dangerous base support as a finite set.

The row's selected shell is centered at `p` and contains `q`, so every selected
point lies on the dangerous `p`-circle.  Exactness of that circle after
deleting `q` forces all non-`q` support points into `{t1,t2,t3}`; the two
four-point cardinalities then give equality with `{q,t1,t2,t3}`. -/
theorem f2CriticalRow_selected_support_eq_dangerous_of_center_p_q_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : f2CriticalRow.center = p)
    (hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4) :
    f2CriticalRow.selected.toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  classical
  have hq_on :
      dist p q = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.point_on_shell_of_eq_named hq_named
    simpa [hcenter] using h
  have hsubset :
      f2CriticalRow.selected.toCriticalFourShell.support ⊆
        ({q, t1, t2, t3} : Finset ℝ²) := by
    intro x hxSupport
    by_cases hxq : x = q
    · simp [hxq]
    · have hx_on :
          dist p x = f2CriticalRow.selected.toCriticalFourShell.radius := by
        have h :=
          f2CriticalRow.selected.toCriticalFourShell.support_eq_radius
            x hxSupport
        simpa [hcenter] using h
      have hx_radius : dist p x = dist p q := hx_on.trans hq_on.symm
      have hx_ne_p : x ≠ p := by
        intro hxp
        exact f2CriticalRow.selected.toCriticalFourShell.center_not_mem_support
          (by simpa [hcenter, hxp] using hxSupport)
      have hxA : x ∈ D.A :=
        f2CriticalRow.selected.toCriticalFourShell.support_subset_A hxSupport
      have hxSkeleton : x ∈ D.skeleton q := by
        have hxEraseQ : x ∈ D.A.erase q :=
          Finset.mem_erase.mpr ⟨hxq, hxA⟩
        simpa [CounterexampleData.skeleton] using hxEraseQ
      have hxC :
          x ∈ ((D.skeleton q).erase p).filter
            (fun y => dist p y = dist p q) := by
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr ⟨hx_ne_p, hxSkeleton⟩, hx_radius⟩
      have hCeq :=
        H.dangerous.exact_radius_class_eq H.exactQDeletedRadius
      have hxT : x ∈ ({t1, t2, t3} : Finset ℝ²) := by
        simpa [hCeq] using hxC
      simp only [Finset.mem_insert, Finset.mem_singleton]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxT
      exact Or.inr hxT
  refine Finset.eq_of_subset_of_card_le hsubset ?_
  have hbase_card :
      ({q, t1, t2, t3} : Finset ℝ²).card = 4 := by
    simpa [dangerousBaseSelectedFourClass] using
      (dangerousBaseSelectedFourClass hfixed).support_card
  rw [hbase_card,
    f2CriticalRow.selected.toCriticalFourShell.support_card]

/-- The off-dangerous target directly closes the surviving
`center = p, q_named` branch.

If `q` is selected by the extra `f2` row centered at `p`, then the row source
`t2[0]` and `q` lie on the same selected shell about `p`, contradicting the
off-dangerous target. -/
theorem false_of_f2CriticalRow_center_p_q_named_offDangerous
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hoff : U1LargeCapRouteBTailT20OffDangerousTarget (p := p) rows)
    (hcenter : f2CriticalRow.center = p)
    (hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4) :
    False := by
  let t20 :=
    rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 }
  have hq_on :
      dist p q = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.point_on_shell_of_eq_named hq_named
    simpa [hcenter] using h
  have ht20_on :
      dist p t20 = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.source_on_shell
    simpa [hcenter, t20] using h
  exact hoff (by
    simpa [U1LargeCapRouteBTailT20OffDangerousTarget, t20] using
      ht20_on.trans hq_on.symm)

/-- The `center = p` branch reduces to a named branch-0 collision.

If the extra f2 critical row centered at `p` does not select deleted `q`, the
localized no-q-free packet gives an immediate contradiction.  If it does select
`q`, exactness of the dangerous p-circle forces the f2 source `t20` to be `q`,
`t1`, `t2`, or `t3`, which is exactly a named `Record001Branch0Collision`
constructor. -/
theorem branch0Collision_of_f2CriticalRow_center_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : f2CriticalRow.center = p) :
    U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p := by
  classical
  by_cases hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4
  · have ht20_eq_q_or_mem_dangerous :
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } = q ∨
          rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 } ∈
            ({t1, t2, t3} : Finset ℝ²) :=
      f2CriticalRow_source_eq_q_or_mem_dangerous_of_center_p_q_named
        f2CriticalRow H hcenter hq_named
    rcases ht20_eq_q_or_mem_dangerous with ht20_eq_q | ht20_mem
    · exact
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.q_t20
          (by
            simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
              ht20_eq_q.symm)
    · simp only [Finset.mem_insert, Finset.mem_singleton] at ht20_mem
      rcases ht20_mem with ht20_eq_t1 | ht20_eq_t2 | ht20_eq_t3
      · exact
          U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t1_t20
            (by
              simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
                ht20_eq_t1.symm)
      · exact
          U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t2_t20
            (by
              simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
                ht20_eq_t2.symm)
      · exact
          U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t3_t20
            (by
              simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
                ht20_eq_t3.symm)
  · exact False.elim
      (false_of_f2CriticalRow_center_p_q_not_named
        hlocalNoQFree f2CriticalRow hcenter hq_named)

/-- The `center = p` branch only needs the four `t2[0]` base exclusions.

This is weaker than the full branch0 no-collision package.  The local
`center = p` reduction can only put the record001 `f2 = t2[0]` label at one of
`q,t1,t2,t3`; excluding those four equalities discharges the branch directly. -/
theorem false_of_f2CriticalRow_center_p_t20BaseExclusions
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : f2CriticalRow.center = p)
    (hT20Base :
      q ≠ rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t1 ≠ rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t2 ≠ rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
      t3 ≠ rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) :
    False := by
  classical
  by_cases hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4
  · have ht20_eq_q_or_mem_dangerous :
        rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 } = q ∨
          rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 } ∈
            ({t1, t2, t3} : Finset ℝ²) :=
      f2CriticalRow_source_eq_q_or_mem_dangerous_of_center_p_q_named
        f2CriticalRow H hcenter hq_named
    rcases ht20_eq_q_or_mem_dangerous with ht20_eq_q | ht20_mem
    · exact hT20Base.1 ht20_eq_q.symm
    · simp only [Finset.mem_insert, Finset.mem_singleton] at ht20_mem
      rcases ht20_mem with ht20_eq_t1 | ht20_eq_t2 | ht20_eq_t3
      · exact hT20Base.2.1 ht20_eq_t1.symm
      · exact hT20Base.2.2.1 ht20_eq_t2.symm
      · exact hT20Base.2.2.2 ht20_eq_t3.symm
  · exact
      false_of_f2CriticalRow_center_p_q_not_named
        hlocalNoQFree f2CriticalRow hcenter hq_named

/-- The two caps opposite an indexed cap have at least four points each. -/
abbrev OppositeCapLowerBoundsAt
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) : Prop :=
  match i with
  | ⟨0, _⟩ => 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card
  | ⟨1, _⟩ => 4 ≤ CP.C1.card ∧ 4 ≤ CP.C3.card
  | _ => 4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card

/-- Every cap of the spine cap triple has at least four points
(`U1OppositeCapLowerBounds.capTriple_caps_card_ge_four`, the generic-`A` port
of the `n = 9` shell interior counts); in particular the opposite-cap lower
bounds hold at every index. -/
theorem oppositeCapLowerBoundsAt_of_circumscribed
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc) (i : Fin 3) :
    OppositeCapLowerBoundsAt CP i := by
  subst hM
  obtain ⟨h1, h2, h3⟩ :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four CP D.convex hncol
      D.K4 (CircumscribedMECPacket.ofNonObtuse MT hCirc)
  fin_cases i
  · exact ⟨h2, h3⟩
  · exact ⟨h1, h3⟩
  · exact ⟨h1, h2⟩

private lemma nat_eq_554_of_sum_eq_fourteen
    {a b c : Nat} (ha : 5 ≤ a) (hb : 5 ≤ b) (hc : 4 ≤ c)
    (hsum : a + b + c = 14) :
    a = 5 ∧ b = 5 ∧ c = 4 := by
  omega

/-- `Fin 3` always offers a label distinct from two given ones. -/
private lemma fin3_exists_ne : ∀ i j : Fin 3, ∃ k : Fin 3, k ≠ i ∧ k ≠ j := by
  decide

/-- Two labels avoiding both members of a distinct pair in `Fin 3` agree. -/
private lemma fin3_eq_of_ne_of_ne {i j k l : Fin 3}
    (hji : j ≠ i) (hki : k ≠ i) (hkj : k ≠ j)
    (hli : l ≠ i) (hlj : l ≠ j) : l = k := by
  revert i j k l
  decide

/-- Index-level `(5,5,4)` profile dispatch shared by the cap-profile lemmas:
with all three caps bounded below by `4`, total closed-cap mass `14`, and two
distinct large caps `i`, `j`, the indexed cap sizes are exactly `(5,5,4)`. -/
private lemma capAt_profile_eq_554
    {A : Finset ℝ²} {M : MoserTriangle A} (CP : CapTriple A M)
    {i j : Fin 3} (hji : j ≠ i)
    (hlower : 4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card)
    (hsum : CP.C1.card + CP.C2.card + CP.C3.card = 14)
    (hi5 : 5 ≤ (CP.capAt i).card) (hj5 : 5 ≤ (CP.capAt j).card) :
    (CP.capAt i).card = 5 ∧
      (CP.capAt j).card = 5 ∧
        ∀ k : Fin 3, k ≠ i → k ≠ j → (CP.capAt k).card = 4 := by
  obtain ⟨k, hki, hkj⟩ := fin3_exists_ne i j
  have hk4 : 4 ≤ (CP.capAt k).card := by
    fin_cases k
    · simpa [CapTriple.capAt] using hlower.1
    · simpa [CapTriple.capAt] using hlower.2.1
    · simpa [CapTriple.capAt] using hlower.2.2
  have hsum' :
      (CP.capAt i).card + (CP.capAt j).card + (CP.capAt k).card = 14 := by
    fin_cases i <;> fin_cases j <;> fin_cases k <;>
      first
        | exact absurd rfl hji
        | exact absurd rfl hki
        | exact absurd rfl hkj
        | (simp [CapTriple.capAt]; omega)
  have hprof := nat_eq_554_of_sum_eq_fourteen hi5 hj5 hk4 hsum'
  refine ⟨hprof.1, hprof.2.1, fun l hli hlj => ?_⟩
  rw [fin3_eq_of_ne_of_ne hji hki hkj hli hlj]
  exact hprof.2.2

/-- Strict cap interior selected by the same index convention as
`CapTriple.capAt`. -/
noncomputable def capInteriorAt
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) : Finset ℝ² :=
  match i with
  | ⟨0, _⟩ => U1OppositeCapLowerBounds.interior1 CP
  | ⟨1, _⟩ => U1OppositeCapLowerBounds.interior2 CP
  | _ => U1OppositeCapLowerBounds.interior3 CP

/-- The indexed strict cap interior omits exactly the two Moser endpoints of
its cap, uniformly in the `capAt` index convention. -/
private lemma capInteriorAt_card_add_two
    {A : Finset ℝ²} {M : MoserTriangle A} (CP : CapTriple A M) (k : Fin 3) :
    (capInteriorAt CP k).card + 2 = (CP.capAt k).card := by
  fin_cases k
  · simpa [capInteriorAt, CapTriple.capAt]
      using U1OppositeCapLowerBounds.interior1_card_add_two CP
  · simpa [capInteriorAt, CapTriple.capAt]
      using U1OppositeCapLowerBounds.interior2_card_add_two CP
  · simpa [capInteriorAt, CapTriple.capAt]
      using U1OppositeCapLowerBounds.interior3_card_add_two CP

/-- In the card-11 branch of the two-large-cap leaf, the cap sizes are exactly
`(5,5,4)` relative to the surplus cap `i` and the chosen second large cap `j`.

This is the finite profile handoff used by the `(5,5,4)` census: the cap-sum
identity gives total closed-cap mass `14`, while the two large caps contribute
at least `5` each and the remaining cap has the proven lower bound `4`. -/
theorem capProfile_eq_554_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {i j : Fin 3} (hji : j ≠ i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hcard11 : D.A.card = 11) :
    (CP.capAt i).card = 5 ∧
      (CP.capAt j).card = 5 ∧
        ∀ k : Fin 3, k ≠ i → k ≠ j → (CP.capAt k).card = 4 := by
  subst hM
  have hlower :
      4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four CP D.convex hncol
      D.K4 (CircumscribedMECPacket.ofNonObtuse MT hCirc)
  have hi5 : 5 ≤ (CP.capAt i).card := by omega
  have hsum : CP.C1.card + CP.C2.card + CP.C3.card = 14 := by
    have h := CP.cap_sum_identity
    omega
  exact capAt_profile_eq_554 CP hji hlower hsum hi5 hj5

/-- In the card-11 branch of the two-large-cap leaf, the strict cap interiors
have size `(3,3,2)` relative to the surplus cap `i`, the chosen second large
cap `j`, and the remaining cap. -/
theorem capInteriorProfile_eq_332_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {i j : Fin 3} (hji : j ≠ i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hcard11 : D.A.card = 11) :
    (capInteriorAt CP i).card = 3 ∧
      (capInteriorAt CP j).card = 3 ∧
        ∀ k : Fin 3, k ≠ i → k ≠ j → (capInteriorAt CP k).card = 2 := by
  obtain ⟨hi, hj, hrest⟩ :=
    capProfile_eq_554_of_card_eq_eleven MT hCirc CP hM hji hsurplus hj5
      hcard11
  obtain ⟨k, hki, hkj⟩ := fin3_exists_ne i j
  have hk4 : (CP.capAt k).card = 4 := hrest k hki hkj
  have hIi := capInteriorAt_card_add_two CP i
  have hIj := capInteriorAt_card_add_two CP j
  have hIk := capInteriorAt_card_add_two CP k
  refine ⟨by omega, by omega, fun l hli hlj => ?_⟩
  rw [fin3_eq_of_ne_of_ne hji hki hkj hli hlj]
  omega

/-- **`≥ 5` witness bridge.**  With the proven opposite-cap lower bounds,
the spine's no-`IsM44` exit fuel forces a *second* large cap: some cap other
than the surplus cap has at least five points.  (The packet built from
`(MT, hCirc, CP, i)` would otherwise be an `IsM44` witness.) -/
theorem exists_secondLargeCap_of_noM44
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc) {i : Fin 3}
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44) :
    ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card := by
  have hLower := oppositeCapLowerBoundsAt_of_circumscribed MT hCirc CP hM i
  subst hM
  fin_cases i
  · -- surplus cap `C1`; opposite pair `(C2, C3)`
    by_cases hc2 : CP.C2.card = 4
    · refine ⟨2, by decide, ?_⟩
      have hc3 : CP.C3.card ≠ 4 := fun hc3 =>
        hNoM44 ⟨⟨D.nonempty, hncol, MT, hCirc, CP, 0, hsurplus⟩, hc2, hc3⟩
      have h3 := hLower.2
      change 5 ≤ CP.C3.card
      omega
    · refine ⟨1, by decide, ?_⟩
      have h2 := hLower.1
      change 5 ≤ CP.C2.card
      omega
  · -- surplus cap `C2`; opposite pair `(C3, C1)`
    by_cases hc1 : CP.C1.card = 4
    · refine ⟨2, by decide, ?_⟩
      have hc3 : CP.C3.card ≠ 4 := fun hc3 =>
        hNoM44 ⟨⟨D.nonempty, hncol, MT, hCirc, CP, 1, hsurplus⟩, hc3, hc1⟩
      have h3 := hLower.2
      change 5 ≤ CP.C3.card
      omega
    · refine ⟨0, by decide, ?_⟩
      have h1 := hLower.1
      change 5 ≤ CP.C1.card
      omega
  · -- surplus cap `C3`; opposite pair `(C1, C2)`
    by_cases hc1 : CP.C1.card = 4
    · refine ⟨1, by decide, ?_⟩
      have hc2 : CP.C2.card ≠ 4 := fun hc2 =>
        hNoM44 ⟨⟨D.nonempty, hncol, MT, hCirc, CP, 2, hsurplus⟩, hc1, hc2⟩
      have h2 := hLower.2
      change 5 ≤ CP.C2.card
      omega
    · refine ⟨0, by decide, ?_⟩
      have h1 := hLower.1
      change 5 ≤ CP.C1.card
      omega

/-- The leaf packet built from the circumscribed MEC witness and the chosen
cap triple.  This is the exact packet that the residual and the final kill must
use so the CP-side large-cap leverage reaches the oppCap2 escape. -/
def leafSurplusPacket
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card) : SurplusCapPacket D.A := by
  subst hM
  refine
    { hA := D.nonempty
      hncol := hncol
      triangleNonObtuse := MT
      hCirc := hCirc
      partition := CP
      surplusIdx := i
      surplus := ?_ }
  simpa [CapTriple.capAt] using hsurplus

namespace U2NonSurplusSqueeze

theorem mem_surplusCap_iff_onArc_gen (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {x : ℝ²} (hxA : x ∈ D.A) :
    x ∈ S.surplusCap ↔ OnArcOpposite S.surplusApex S.oppApex1 S.oppApex2 x := by
  set CP := S.partition with hCP
  rcases hi : S.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).1
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).2.1
  · simpa [SurplusCapPacket.surplusCap, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).2.2

theorem signedArea2_mul_pos_of_not_mem_surplusCap_gen (D : CounterexampleData)
    (S : SurplusCapPacket D.A) {x : ℝ²} (hxA : x ∈ D.A) (hx : x ∉ S.surplusCap) :
    0 < signedArea2 x S.oppApex1 S.oppApex2 *
        signedArea2 S.surplusApex S.oppApex1 S.oppApex2 := by
  rw [mem_surplusCap_iff_onArc_gen D S hxA] at hx
  unfold OnArcOpposite at hx
  exact not_le.mp hx

theorem oppCap2_escape_gen (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r ρ : ℝ} {x w' : ℝ²}
    (hxA : x ∈ D.A) (hw'A : w' ∈ D.A)
    (hx_notsurp : x ∉ S.surplusCap)
    (hw'_notsurp : w' ∉ S.surplusCap)
    (hne : x ≠ w')
    (hxv : dist x S.oppApex1 = r) (hw'v : dist w' S.oppApex1 = r)
    (hxw : dist x S.oppApex2 = ρ) (hw'w : dist w' S.oppApex2 = ρ) :
    False := by
  have hmid :
      signedArea2 (midpoint ℝ w' x) S.oppApex1 S.oppApex2 = 0 :=
    twoCircle_midpoint_collinear hxv hw'v hxw hw'w hne
  have hflip :
      signedArea2 x S.oppApex1 S.oppApex2 =
        - signedArea2 w' S.oppApex1 S.oppApex2 :=
    signedArea2_reflection_neg hmid
  have hxpos := signedArea2_mul_pos_of_not_mem_surplusCap_gen D S hxA hx_notsurp
  have hw'pos := signedArea2_mul_pos_of_not_mem_surplusCap_gen D S hw'A hw'_notsurp
  have hkey :
      signedArea2 x S.oppApex1 S.oppApex2 *
          signedArea2 S.surplusApex S.oppApex1 S.oppApex2
        = -(signedArea2 w' S.oppApex1 S.oppApex2 *
          signedArea2 S.surplusApex S.oppApex1 S.oppApex2) := by
    rw [hflip]; ring
  linarith [hxpos, hw'pos, hkey]

end U2NonSurplusSqueeze

/-- Statement of the remaining cap/source-row content needed to delete the
`t2_t20` parent branch.

This is deliberately narrower than the older collision-exclusion surfaces: it
mentions the actual surplus cap witness, the non-Moser surplus point `q`, the
non-exact opposite-cap branch, and the exact dangerous support of the original
`t2` source row.

The `MT`/`hCirc`/`M = …toStructural` antecedents pin the Moser triangle to the
circumscribed-MEC witness actually constructed on the spine.  Without them the
statement quantifies over arbitrary `(M, CP)` and the cap hypotheses carry no
geometric force (2026-07-02 audit: adversarial cap splits such as
`(2, n-1, 2)` satisfy every `CapTriple` field, so the statement was
unprovable as previously written). -/
abbrev LargeCapPCenteredT2SourceExactDangerousRowStatement
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  M = MT.toMoserTriangle.toStructural hCirc →
  q ∈ CP.capAt i →
    4 < (CP.capAt i).card →
      q ∉ M.verts →
        ¬ CP.OppositePairExactAt i →
          ¬ (∃ S : SurplusCapPacket D.A, S.IsM44) →
          9 < D.A.card →
          (∀ x : ℝ², ¬ IsRemovableVertex D.A x) →
          Nonempty (CriticalShellSystem D.A) →
            U3LocalizedNoQFreePacket D q p →
              U3FixedTriplePacket D q p t1 t2 t3 →
                List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u] →
                  U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u →
                    (rows.rowAt U1Depth5.CriticalSource.t2).center = p →
                      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
                          ({q, t1, t2, t3} : Finset ℝ²) →
                        False

/-- Statement of the single remaining `t2_t20` obligation, in honest
`False`-form: the two-large-cap refutation.  On the p-centered
exact-dangerous-row branch the proven lower bounds plus the no-`IsM44` exit
fuel force a second cap of size `≥ 5` (`exists_secondLargeCap_of_noM44`), so
the branch data must refute the configuration "surplus cap `> 4` at `i` and
second cap `≥ 5` at `j ≠ i`" outright.  This replaces the 2026-07-02
upper-bounds formulation, whose antecedents refuted its own conclusion; the
`¬ OppositePairExactAt` antecedent is dropped as redundant (it follows from
the `j` witness).  At `n = 9` the analogous configuration is excluded by the
cap-sum identity; on the `9 < A.card` branch this is the U1 sub-lemma 2
descent content.

Deep-thinker verdict (2026-07-03, gpt-5.5 xhigh,
`docs/u-lane/97-u1-2-opposite-cap-upper-bounds-deep-thinker-verdict-2026-07-03.md`):
no proof route from current in-tree assets; the open content is the
incompatibility of the critical-shell system (`hcritical`, every carrier
point blocked by an exact-4 ambient class) with this two-large-cap
configuration.  Apollonius-alone, verbatim-N4e-port, and finite-label-SMT
routes are rejected. -/
abbrev LargeCapPCenteredT2SourceTwoLargeCapsStatement
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  M = MT.toMoserTriangle.toStructural hCirc →
  q ∈ CP.capAt i →
    4 < (CP.capAt i).card →
      q ∉ M.verts →
        j ≠ i →
        5 ≤ (CP.capAt j).card →
          ¬ (∃ S : SurplusCapPacket D.A, S.IsM44) →
        9 < D.A.card →
          (∀ x : ℝ², ¬ IsRemovableVertex D.A x) →
          Nonempty (CriticalShellSystem D.A) →
            U3LocalizedNoQFreePacket D q p →
              U3FixedTriplePacket D q p t1 t2 t3 →
                List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u] →
                  U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u →
                    (rows.rowAt U1Depth5.CriticalSource.t2).center = p →
                      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
                          ({q, t1, t2, t3} : Finset ℝ²) →
                        False

set_option linter.unusedVariables false in
/-- **Named residual — Route-A double-apex off-surplus shared-radius pair
(2026-07-05).**  The producer attack
(`docs/u-lane/97-u1-2-sharedchord-producer-PROVE-verdict-2026-07-05.md`, option
(b)) reduced the retired arbitrary-centre producer
`twoLargeCaps_sharedChord_sameSide` gap-free to THIS single pure-metric residual:
from the full two-large-cap leaf hypotheses, produce two distinct carrier points
`x, w'` off the surplus cap that are co-radial from BOTH opposite Moser apices
`D.packet.oppApex1`, `D.packet.oppApex2`.

The packet is now the CP-built `leafSurplusPacket` from `(MT, hCirc, CP, i, hM,
hsurplus)`, so the `CP.capAt i > 4` witness and the second-cap `≥ 5` bridge
(`exists_secondLargeCap_of_noM44`) apply to THIS packet's caps.  Downstream is
fully PROVEN (core axioms only): such a pair fires
`U2NonSurplusSqueeze.oppCap2_escape_gen` directly (the off-surplus membership
supplies the same-side sign via
`signedArea2_mul_pos_of_not_mem_surplusCap_gen`, and the two-circle reflection
kernel then contradicts it), so the leaf closes.  The retired producer's
arbitrary-centre existential and the `sharedChord_sameSide_false` certificate
were redundant wrappers around this apex-anchored statement and were dropped.

Open content: does `(≥5,≥5,4)` + center-`K4` + critical shell FORCE the pair?
The conclusion is unsatisfiable over ℝ² (the reflection kernel), so proving it
means deriving the leaf contradiction — the counting/metric-closure question of
whether the two `≥5` caps overflow the apex exact-radius classes into a forced
double-apex coincidence.  Attack surface: the PROVEN U2 squeeze scaffold
(`oppApex1_exactRadiusClass_cover`, `fourClass_of_cover`,
`oppApex{1,2}_interior_card_eq_two_of_isM44`), transferred from the M44 regime to
`hNoM44`, plus the `CP.capAt`-vs-`D.packet` cap linkage. -/
theorem DoubleApexOffSurplusSharedRadiusPair
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    ∃ x w' : ℝ², x ∈ D.A ∧ w' ∈ D.A ∧ x ≠ w' ∧
      x ∉ (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
          (hM := hM) (hsurplus := hsurplus)).surplusCap ∧
      w' ∉ (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
          (hM := hM) (hsurplus := hsurplus)).surplusCap ∧
      ∃ r ρ : ℝ,
        dist x (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex1 = r ∧
        dist w' (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex1 = r ∧
        dist x (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex2 = ρ ∧
        dist w' (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex2 = ρ := by
  sorry

set_option linter.unusedVariables false in
/-- **Named residual — adapted N4e cap-containment content (retargeted to
`∃ removable`, 2026-07-03).**  In the two-large-cap configuration (surplus cap
`> 4` at `i`, second cap `≥ 5` at `j ≠ i`, convex via `D`, Moser/`hCirc`
pinning, center-K4 via `D.K4`) some vertex of `D.A` is **removable** —
`IsRemovableVertex D.A x`, i.e. `x ∈ D.A` and `D.A.erase x` retains the
`4`-equidistant property.  This is exactly the negation of the leaf's `hnoRem`,
so it is the *minimal* obligation the leaf needs.

Retarget rationale (verdict
`docs/u-lane/97-u1-2-shellfree-residual-deep-thinker-verdict-2026-07-03.md`):
the previous conclusion "`∃` shell-free point" (no exact-four shell at any
center) is strictly stronger than removability and is not known to hold — the
`cap_arc_midpoint_inequality` route is empirically false as a local mechanism
(the repo's exact-rational `(5,5,4)` 11-point model carries an exact-four shell
through every point, failing only full center-K4).  Removability permits exact
shells through `x` provided each affected center keeps another `≥ 4` class after
deleting `x`; targeting it directly recovers that degree of freedom.  The
former `∃`-shell-free lemma implied this via `exists_criticalFourShell`, so this
is a strict weakening of the residual — the wiring simplifies accordingly.
Mechanism now open; all leaf hypotheses are carried (which are load-bearing is
undetermined).  See `docs/u-lane/97-u1-2-n4e-cap-containment-port-plan-2026-07-03.md`. -/
theorem exists_removableVertex_of_twoLargeCaps
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
  ∃ x : ℝ², IsRemovableVertex D.A x := by
  classical
  obtain ⟨x, w', hxA, hw'A, hne, hxOff, hw'Off, r, ρ, hxc1, hw'c1, hxc2, hw'c2⟩ :=
    Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair
      (D := D) (p := p) (q := q) (t1 := t1) (t2 := t2) (t3 := t3) (u := u)
      (hncol := hncol) MT hCirc (M := M) CP i j rows hM hqCap hsurplus
      hqNonMoser hjne hj5 hNoM44 hcard hcritical hlocalNoQFree hfixed hbase H
      hcenter hsupport
  exact (Problem97.U1LargeCapRouteBTailMetricResidualTarget.U2NonSurplusSqueeze.oppCap2_escape_gen
    (D := D)
    (S := leafSurplusPacket (D := D) (MT := MT) (hCirc := hCirc) (CP := CP)
      (i := i) (hM := hM) (hsurplus := hsurplus))
    hxA hw'A hxOff hw'Off hne hxc1 hw'c1 hxc2 hw'c2).elim

/-- **LEAF — U1.2 two-large-cap refutation.**  Successor residual after the
2026-07-03 reshape: the 2026-07-02 upper-bounds formulation was retired
because its antecedents refute its conclusion (the packet built from
`(MT, hCirc, CP, i)` with the proven lower bounds and `hNoM44` forces one
opposite cap to card `≥ 5`), so the obligation is stated directly as `False`
from the two-large-cap configuration.  Lineage: interiors-subset bridge
(retired 2026-07-02, exact-rational countermodel in `scratch/u1_2_faithful/`)
→ lower/upper bounds split (retired 2026-07-03) → this. -/
theorem false_of_twoLargeCaps_pCentered_t2Source
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    LargeCapPCenteredT2SourceTwoLargeCapsStatement
      (p := p) MT hCirc CP i j rows := by
  intro hM hqCap hsurplus hqNonMoser hjne hj5 hNoM44 hcard hnoRem hcritical
    hlocalNoQFree hfixed hbase H hcenter hsupport
  -- Residual (open geometric content): the two-large-cap configuration admits a
  -- removable vertex.  This is the direct negation of `hnoRem`.
  obtain ⟨x, hrem⟩ :=
    exists_removableVertex_of_twoLargeCaps (p := p) MT hCirc CP i j rows
      hM hqCap hsurplus hqNonMoser hjne hj5 hNoM44 hcard hcritical
      hlocalNoQFree hfixed hbase H hcenter hsupport
  exact hnoRem x hrem

/-- Cap/source-row incompatibility for the `t2_t20` parent branch, closed by
the `≥ 5` witness bridge (`exists_secondLargeCap_of_noM44`) plus the
two-large-cap residual: the non-exact branch fuel is not consumed here, since
the `j` witness already refutes opposite-pair exactness. -/
theorem false_of_largeCap_pCentered_t2Source_exactDangerousRow
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    LargeCapPCenteredT2SourceExactDangerousRowStatement
      (p := p) MT hCirc CP i rows := by
  intro hM hqCap hsurplus hqNonMoser _hnotOppExact hNoM44 hcard hnoRem hcritical
    hlocalNoQFree hfixed hbase H hcenter hsupport
  obtain ⟨j, hjne, hj5⟩ :=
    exists_secondLargeCap_of_noM44 MT hCirc CP hM hsurplus hNoM44
  exact
    false_of_twoLargeCaps_pCentered_t2Source (p := p) MT hCirc CP i j rows
      hM hqCap hsurplus hqNonMoser hjne hj5 hNoM44 hcard hnoRem hcritical
      hlocalNoQFree hfixed hbase H hcenter hsupport

/-- Parent-level deletion of the `t2_t20` branch, modulo the one real
cap/source-row incompatibility.

The local work here is the content-bearing narrowing: `ht2_t20` transfers the
extra f2-row center back to the original `t2` source row, the source-row lemma
identifies that row's support as `{q,t1,t2,t3}`, and the remaining contradiction
is exactly the surplus-cap/non-exact incompatibility named above. -/
theorem false_of_center_p_t2_t20
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) {i : Fin 3}
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase :
      List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.center = (rows.rowAt source).center)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter_p : f2CriticalRow.center = p)
    (ht2_t20 :
      t2 =
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) :
    False := by
  have ht2Row_center_p :
      (rows.rowAt U1Depth5.CriticalSource.t2).center = p := by
    have hcenter_eq :=
      hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t2
        (by
          simpa [U1Depth5.CriticalSourceRows.sourcePoint] using
            ht2_t20.symm)
    exact hcenter_eq.symm.trans hcenter_p
  have hrow_support :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) := by
    simpa [U1Depth5.CriticalSourceRows.rowAt] using
      t2Row_selected_support_eq_dangerous_of_center_p
        hlocalNoQFree hfixed H ht2Row_center_p
  exact
    false_of_largeCap_pCentered_t2Source_exactDangerousRow
      (p := p) MT hCirc CP i rows hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed hbase H
      ht2Row_center_p hrow_support

/-- Collision exclusion kills the only surviving `center = p` branch.

The localized no-q-free argument already handles the case where `q` is not one
of the four selected labels.  If `q` is selected, the f2 source `t20` lies on
the exact dangerous p-circle, hence `t20 = q` or `t20 ∈ {t1,t2,t3}`.  Each
alternative is one of the named branch-0 collisions forbidden by the
collision-exclusion package. -/
theorem false_of_f2CriticalRow_center_p_q_named_collisionExclusion
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hCollisionExclusion :
      U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : f2CriticalRow.center = p)
    (hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4) :
    False := by
  have hCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows p := by
    have ht20_eq_q_or_mem_dangerous :
        rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 } = q ∨
          rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 } ∈
            ({t1, t2, t3} : Finset ℝ²) :=
      f2CriticalRow_source_eq_q_or_mem_dangerous_of_center_p_q_named
        f2CriticalRow H hcenter hq_named
    rcases ht20_eq_q_or_mem_dangerous with ht20_eq_q | ht20_mem
    · exact
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.q_t20
          (by
            simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
              ht20_eq_q.symm)
    · simp only [Finset.mem_insert, Finset.mem_singleton] at ht20_mem
      rcases ht20_mem with ht20_eq_t1 | ht20_eq_t2 | ht20_eq_t3
      · exact
          U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t1_t20
            (by
              simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
                ht20_eq_t1.symm)
      · exact
          U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t2_t20
            (by
              simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
                ht20_eq_t2.symm)
      · exact
          U1Depth5.RowSlotLabelPacket.Record001Branch0Collision.t3_t20
            (by
              simpa [U1Depth5.CriticalSourceRows.pointOfChoice] using
                ht20_eq_t3.symm)
  exact hCollisionExclusion.false_of_branch0Collision hCollision

/-- Collision exclusion closes the entire `center = p` branch. -/
theorem false_of_f2CriticalRow_center_p_collisionExclusion
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (hCollisionExclusion :
      U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : f2CriticalRow.center = p) :
    False := by
  exact hCollisionExclusion.false_of_branch0Collision
    (branch0Collision_of_f2CriticalRow_center_p
      hlocalNoQFree f2CriticalRow H hcenter)

/-- The extra critical row for the record001 `f2 = t2[0]` label supplies the
three `t2` residual hrows once its blocker center is identified with `t2` and
the required packet labels are among its selected shell labels.

This is the smallest currently explicit consumer shape for the new
`f2CriticalRow` input: the hard remaining work is to produce the center
identification and the three named-label placements, or route a branch split
that supplies them. -/
theorem t2ResidualHRows_of_f2CriticalRow_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = t2)
    (hf5_named :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l1 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l2 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l3 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l4)
    (hp_named :
      p = f2CriticalRow.selected.l1 ∨ p = f2CriticalRow.selected.l2 ∨
        p = f2CriticalRow.selected.l3 ∨ p = f2CriticalRow.selected.l4)
    (hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4) :
    dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) ∧
    dist t2 p =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) ∧
    dist t2 q =
      dist t2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) := by
  have hf2_on :
      dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        f2CriticalRow.selected.toCriticalFourShell.radius := by
    simpa [hcenter] using f2CriticalRow.source_on_shell
  have hf5_on :
      dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.point_on_shell_of_eq_named hf5_named
    simpa [hcenter] using h
  have hp_on :
      dist t2 p = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.point_on_shell_of_eq_named hp_named
    simpa [hcenter] using h
  have hq_on :
      dist t2 q = f2CriticalRow.selected.toCriticalFourShell.radius := by
    have h := f2CriticalRow.point_on_shell_of_eq_named hq_named
    simpa [hcenter] using h
  exact ⟨hf5_on.trans hf2_on.symm, hp_on.trans hf2_on.symm,
    hq_on.trans hf2_on.symm⟩

/-- Tail sink with the three `t2` residual hrows supplied by the extra
critical row for the record001 `f2 = t2[0]` label.

This is the spine-facing form of `t2ResidualHRows_of_f2CriticalRow_named`: a
future producer may now target the f2-row center/placement facts instead of the
three raw `t2:*` metric equalities. -/
theorem false_of_f2CriticalRow_named
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = t2)
    (hf5_named :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l1 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l2 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l3 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 } =
            f2CriticalRow.selected.l4)
    (hp_named :
      p = f2CriticalRow.selected.l1 ∨ p = f2CriticalRow.selected.l2 ∨
        p = f2CriticalRow.selected.l3 ∨ p = f2CriticalRow.selected.l4)
    (hq_named :
      q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
        q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4)
    (hCollisionExclusion :
      U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows)
    (hMetric : U1LargeCapRouteBTailMetricBridgeTarget (p := p) rows)
    (hrow_q_p_f1 : dist q p = dist q u)
    (hrow_t3_f2_f1 :
      dist t3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist t3 u)
    (hrow_t3_p_f1 : dist t3 p = dist t3 u)
    (hrow_t3_t1_f1 : dist t3 t1 = dist t3 u)
    (hextra_f1_t2 :
      dist u t2 =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  rcases t2ResidualHRows_of_f2CriticalRow_named
      f2CriticalRow hcenter hf5_named hp_named hq_named with
    ⟨hrow_t2_f5_f2, hrow_t2_p_f2, hrow_t2_q_f2⟩
  exact
    hCollisionExclusion.false_of_metricBridgeTarget
      hfixed hbase hMetric hrow_q_p_f1 hrow_t2_f5_f2
      hrow_t2_p_f2 hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1
      hrow_t3_t1_f1 hextra_f1_t2

/-- The current metric-bridge residual target is already contradictory via the
banked collision-exclusion consumer. -/
theorem false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailMetricResidualTarget (p := p) rows) :
    False :=
  B.hCollisionExclusion.false_of_metricBridgeTarget
    hfixed hbase B.hMetric B.hrow_q_p_f1 B.hrow_t2_f5_f2
    B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1 B.hrow_t3_p_f1
    B.hrow_t3_t1_f1 B.hextra_f1_t2

/-- The metric-residual target also closes through the packet-label-centered
record001 consumer once the remaining pair-exclusion add-backs and the three
hard `f1` hrows are supplied.

This is an alternate finite sink retained for certificate-audit provenance.
It is not the current live producer target, because
`U1LargeCapRouteBTailMetricResidualTarget.false` already closes from
`MetricResidualTarget` itself.  The five pair-exclusion facts only matter if a
future route chooses to replay the packet-label-centered row-slot consumer
instead of the direct metric-residual consumer. -/
theorem false_of_pairExclusions_and_f1HardRows
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailMetricResidualTarget (p := p) rows)
    (hp_t20 :
      p ≠ rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
    (hp_f11 :
      p ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1)
    (hp_f12 :
      p ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2)
    (ht20_f11 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1)
    (ht20_f12 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2)
    (hrow_f1_f3_f2 :
      dist u ((rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_f1_f4_f2 :
      dist u ((rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_f1_p_f2 :
      dist u p =
        dist u
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  let packet : U1Depth5.RowSlotLabelPacket D p q t1 t2 t3 u :=
    U1Depth5.RowSlotLabelPacket.record001Branch0OfCrossRowNe
      rows hfixed.p_mem hbase
      (by
        intro a ha b hb
        have hmem :
            a = p ∨ a ∈ [q, t1, t2, t3, u] := by
          simpa [List.mem_cons] using ha
        rcases hmem with rfl | ha'
        · simp only [List.mem_cons, List.not_mem_nil, or_false] at hb
          rcases hb with rfl | rfl | rfl | rfl
          · exact hp_t20
          · exact hp_f11
          · exact hp_f12
          · exact B.hCollisionExclusion.hp_f5
        · exact B.hCollisionExclusion.hcrossNoP a ha' b hb)
      ht20_f11 ht20_f12
      B.hCollisionExclusion.hf11_t21
      B.hCollisionExclusion.hf12_t21
  let centered :
      U1Depth5.PacketLabelCenteredRows D q t1 t2 t3 u :=
    U1Depth5.PacketLabelCenteredRows.ofRecord001Branch0HRows
      hfixed.p_mem rows.qRow.source_mem rows.t1Row.source_mem
      rows.t2Row.source_mem rows.t3Row.source_mem rows.uRow.source_mem
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
      ((rows.rowAt U1Depth5.CriticalSource.f1).slotPoint_mem 1)
      ((rows.rowAt U1Depth5.CriticalSource.f1).slotPoint_mem 2)
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 1 })
      packet.labels_pairwise
      B.hrow_q_p_f1
      (B.hCollisionExclusion.toQTFacingTransportRows B.hMetric).hrow_q_t1_f1
      (B.hCollisionExclusion.toQTFacingTransportRows B.hMetric).hrow_q_t2_f1
      (B.hCollisionExclusion.toQTFacingTransportRows B.hMetric).hrow_t1_p_f1
      (B.hCollisionExclusion.toQTFacingTransportRows B.hMetric).hrow_t1_q_f1
      (B.hCollisionExclusion.toQTFacingTransportRows B.hMetric).hrow_t1_t3_f1
      B.hrow_t2_f5_f2 B.hrow_t2_p_f2 B.hrow_t2_q_f2
      B.hrow_t3_f2_f1 B.hrow_t3_p_f1 B.hrow_t3_t1_f1
      hrow_f1_f3_f2 hrow_f1_f4_f2 hrow_f1_p_f2
  let centeredQT :
      U1Depth5.Record001QTTwoCenteredRows D p q t1 t2 t3 u :=
    U1Depth5.PacketLabelCenteredRows.record001QTTwoCenteredRows centered
      (by rfl)
      (by rfl)
      (by rfl)
      (by rfl)
      (by rfl)
      (by rfl)
      (by rfl)
  exact
    U1Depth5SourceUnitGenerated.false_of_f1t2_extra_omit3_of_packet_label_centered_rows
      hfixed packet centeredQT
      (by simpa [packet] using B.hrow_q_p_f1)
      (by simpa [packet] using B.hrow_t2_f5_f2)
      (by simpa [packet] using B.hrow_t2_p_f2)
      (by simpa [packet] using B.hrow_t2_q_f2)
      (by simpa [packet] using B.hrow_t3_f2_f1)
      (by simpa [packet] using B.hrow_t3_p_f1)
      (by simpa [packet] using B.hrow_t3_t1_f1)
      (by simpa [packet] using B.hextra_f1_t2)

/-- The metric-residual target closes once the five remaining pair-exclusion
facts needed to build the record001 row-slot packet are supplied.

The generated `f1:t2` product-cycle consumer derives the three hard `f1` hrows
internally from the packet, q/t1 transport, residual hrows, and the
`f1:t2` extra-incidence equality.  This remains an alternate packet replay
route, not the current spine-shrinking target: the direct `.false` theorem
already discharges any completed `MetricResidualTarget`. -/
theorem false_of_pairExclusions
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailMetricResidualTarget (p := p) rows)
    (hp_t20 :
      p ≠ rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
    (hp_f11 :
      p ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1)
    (hp_f12 :
      p ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2)
    (ht20_f11 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1)
    (ht20_f12 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) :
    False := by
  let packet : U1Depth5.RowSlotLabelPacket D p q t1 t2 t3 u :=
    U1Depth5.RowSlotLabelPacket.record001Branch0OfCrossRowNe
      rows hfixed.p_mem hbase
      (by
        intro a ha b hb
        have hmem :
            a = p ∨ a ∈ [q, t1, t2, t3, u] := by
          simpa [List.mem_cons] using ha
        rcases hmem with rfl | ha'
        · simp only [List.mem_cons, List.not_mem_nil, or_false] at hb
          rcases hb with rfl | rfl | rfl | rfl
          · exact hp_t20
          · exact hp_f11
          · exact hp_f12
          · exact B.hCollisionExclusion.hp_f5
        · exact B.hCollisionExclusion.hcrossNoP a ha' b hb)
      ht20_f11 ht20_f12
      B.hCollisionExclusion.hf11_t21
      B.hCollisionExclusion.hf12_t21
  let hqt : U1Depth5.Record001QTFacingTransportRows p q t1 t2 t3 u :=
    B.hCollisionExclusion.toQTFacingTransportRows B.hMetric
  exact
    U1Depth5SourceUnitGenerated.false_of_f1t2_extra_omit3_of_row_slot_packet_hrows
      hfixed packet
      (by simpa [packet] using B.hrow_q_p_f1)
      (by simpa [packet] using hqt.hrow_q_t1_f1)
      (by simpa [packet] using hqt.hrow_q_t2_f1)
      (by simpa [packet] using hqt.hrow_t1_p_f1)
      (by simpa [packet] using hqt.hrow_t1_q_f1)
      (by simpa [packet] using hqt.hrow_t1_t3_f1)
      (by simpa [packet] using B.hrow_t2_f5_f2)
      (by simpa [packet] using B.hrow_t2_p_f2)
      (by simpa [packet] using B.hrow_t2_q_f2)
      (by simpa [packet] using B.hrow_t3_f2_f1)
      (by simpa [packet] using B.hrow_t3_p_f1)
      (by simpa [packet] using B.hrow_t3_t1_f1)
      (by simpa [packet] using B.hextra_f1_t2)

end U1LargeCapRouteBTailMetricResidualTarget

/-- Packet-label-centered consumer target for the current U1.2 tail.

This is the centered-row alternative to `U1LargeCapRouteBTailMetricResidualTarget`.
Instead of carrying the residual `q/t1/t2/t3` hrows directly, it assumes a
`PacketLabelCenteredRows` object together with the explicit centered slot
placements and the single remaining `f1:t2` radius incidence.  COMP-1 shows the
current surface is not instantiable on the no-collision cell as stated:
`hocc_f2_f1_0` contradicts the no-collision branch atoms together with the
`p = f1[3]` placement.  A future centered route must therefore restate this
surface or avoid that cell. -/
structure U1LargeCapRouteBTailCenteredIncidenceTarget
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) where
  hCollisionExclusion :
    U1LargeCapRouteBTailBranch0CollisionExclusionTarget (p := p) rows
  centered :
    U1Depth5.PacketLabelCenteredRows D q t1 t2 t3 u
  hocc_f2_f1_0 :
    rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0
  hfix_p_f1_3 :
    p = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3
  hfix_f1_q_0 : u = centered.qRow.slotPoint 0
  hfix_p_q_1 : p = centered.qRow.slotPoint 1
  hfix_t1_q_2 : t1 = centered.qRow.slotPoint 2
  hfix_t2_q_3 : t2 = centered.qRow.slotPoint 3
  hfix_f1_t1_0 : u = centered.t1Row.slotPoint 0
  hfix_p_t1_1 : p = centered.t1Row.slotPoint 1
  hfix_q_t1_2 : q = centered.t1Row.slotPoint 2
  hfix_t3_t1_3 : t3 = centered.t1Row.slotPoint 3
  hfix_f2_t2_0 :
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
      centered.t2Row.slotPoint 0
  hfix_f5_t2_1 :
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1 =
      centered.t2Row.slotPoint 1
  hfix_p_t2_2 : p = centered.t2Row.slotPoint 2
  hfix_q_t2_3 : q = centered.t2Row.slotPoint 3
  hfix_f1_t3_0 : u = centered.t3Row.slotPoint 0
  hfix_f2_t3_1 :
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
      centered.t3Row.slotPoint 1
  hfix_p_t3_2 : p = centered.t3Row.slotPoint 2
  hfix_t1_t3_3 : t1 = centered.t3Row.slotPoint 3
  hfix_f2_f1_0 :
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
      centered.uRow.slotPoint 0
  ht2_on_f1_radius : dist u t2 = centered.uRow.row.radius

namespace U1LargeCapRouteBTailCenteredIncidenceTarget

/-- The stronger centered-incidence target subsumes the explicit branch-0
producer surface consumed by the tail-local branch0 endpoint. -/
theorem toBranch0ProducerData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailCenteredIncidenceTarget (p := p) rows) :
    U1LargeCapRouteBTailBranch0ProducerData (p := p) rows := by
  refine
    { noCollision := B.hCollisionExclusion.toNoCollision
      hrow_q_p_f1 := ?_
      hqt := ?_
      hrow_t2_f5_f2 := ?_
      hrow_t2_p_f2 := ?_
      hrow_t2_q_f2 := ?_
      hrow_t3_f2_f1 := ?_
      hrow_t3_p_f1 := ?_
      hrow_t3_t1_f1 := ?_
      hextra_f1_t2 := ?_ }
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_q_p_f1
        B.centered B.hfix_p_q_1 B.hfix_f1_q_0
  · exact
      U1Depth5.PacketLabelCenteredRows.record001QTFacingTransportRows
        B.centered B.hfix_t1_q_2 B.hfix_f1_q_0 B.hfix_t2_q_3
        B.hfix_p_t1_1 B.hfix_f1_t1_0 B.hfix_q_t1_2 B.hfix_t3_t1_3
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_t2_f5_f2
        B.centered B.hfix_f5_t2_1 B.hfix_f2_t2_0
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_t2_p_f2
        B.centered B.hfix_p_t2_2 B.hfix_f2_t2_0
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_t2_q_f2
        B.centered B.hfix_q_t2_3 B.hfix_f2_t2_0
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_t3_f2_f1
        B.centered B.hfix_f2_t3_1 B.hfix_f1_t3_0
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_t3_p_f1
        B.centered B.hfix_p_t3_2 B.hfix_f1_t3_0
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_t3_t1_f1
        B.centered B.hfix_t1_t3_3 B.hfix_f1_t3_0
  · exact
      U1Depth5.PacketLabelCenteredRows.hrow_f1_t2_f2_of_radius
        B.centered B.hfix_f2_f1_0 B.ht2_on_f1_radius

/-- The current centered-incidence target is incompatible with the no-collision
cell before its centered metric rows are used.

This is the Lean form of the COMP-1 `hocc_f2_f1_0` obstruction: collision
exclusion gives the generated no-collision surface, and no-collision plus
`hocc_f2_f1_0` and `p = f1[3]` already contradicts the `f1` source row. -/
theorem false_of_hocc_noCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hP_U : p ≠ u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailCenteredIncidenceTarget (p := p) rows) :
    False :=
  U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision.false_of_f1Tail_source
    B.hCollisionExclusion.toNoCollision hP_U B.hocc_f2_f1_0 B.hfix_p_f1_3

/-- The centered-incidence target is already contradictory on the no-collision
cell. -/
theorem false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (_hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (B : U1LargeCapRouteBTailCenteredIncidenceTarget (p := p) rows) :
    False :=
  B.false_of_hocc_noCollision
    (U1Depth5.baseP_ne_selectedU_of_baseSixPairwise hbase)

end U1LargeCapRouteBTailCenteredIncidenceTarget

/-- Package the t1-shell split target into the native U5 q-critical triple
class at center `t1`.

This is the first theorem-facing bridge out of the split metric target: once
`p,q,t3,u` are known to lie on the same t1-centered global-K4 shell, the
existing U5 q-critical library can consume that shell as the exact triple
`{p,t3,u}` around the deleted point `q`. -/
theorem u1_largeCap_routeB_t1ShellTarget_to_qCriticalTripleClass
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (ht1Shell : U1LargeCapRouteBTailT1ShellTarget (p := p) rows) :
    Nonempty (U5QCriticalTripleClass D q t1 ({p, t3, u} : Finset ℝ²)) := by
  classical
  rcases ht1Shell with ⟨ht1_p, ht1_q, ht1_t3, ht1_u⟩
  have hu_ne_p : u ≠ p := (Finset.mem_erase.mp H.selected.candidate_mem).1
  have huSkelQ : u ∈ D.skeleton q := (Finset.mem_erase.mp H.selected.candidate_mem).2
  have huA : u ∈ D.A := by
    have huEraseQ : u ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using huSkelQ
    exact (Finset.mem_erase.mp huEraseQ).2
  have hu_ne_q : u ≠ q := by
    have huEraseQ : u ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using huSkelQ
    exact (Finset.mem_erase.mp huEraseQ).1
  have hu_ne_t1 : u ≠ t1 := by
    intro hut
    exact H.selected.candidate_notin_T (by simp [hut])
  have hu_ne_t3 : u ≠ t3 := by
    intro hut
    exact H.selected.candidate_notin_T (by simp [hut])
  have ht3A : t3 ∈ D.A := by
    have ht3Skeleton : t3 ∈ D.skeleton q := (Finset.mem_erase.mp hfixed.t3_mem).2
    have ht3EraseQ : t3 ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using ht3Skeleton
    exact (Finset.mem_erase.mp ht3EraseQ).2
  have hcard3 : ({p, t3, u} : Finset ℝ²).card = 3 := by
    rw [Finset.card_eq_three]
    exact ⟨p, t3, u, hfixed.p_ne_t3, hu_ne_p.symm, hu_ne_t3.symm, rfl⟩
  have hq_not_mem_pt3u : q ∉ ({p, t3, u} : Finset ℝ²) := by
    intro hqmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hqmem
    rcases hqmem with hqp | hqt3 | hqu
    · exact hfixed.p_ne_q hqp.symm
    · exact hfixed.q_ne_t3 hqt3
    · exact hu_ne_q hqu.symm
  have hcard : ({q, p, t3, u} : Finset ℝ²).card = 4 := by
    rw [Finset.card_eq_four]
    exact ⟨q, p, t3, u,
      hfixed.p_ne_q.symm, hfixed.q_ne_t3, hu_ne_q.symm,
      hfixed.p_ne_t3, hu_ne_p.symm, hu_ne_t3.symm, rfl⟩
  let K : U5QAllowedK4Class D t1 ({q, p, t3, u} : Finset ℝ²) :=
    { subset := by
        intro y hy
        have hy' : y = q ∨ y = p ∨ y = t3 ∨ y = u := by
          simpa [Finset.mem_insert, Finset.mem_singleton] using hy
        rcases hy' with rfl | rfl | rfl | rfl
        · exact Finset.mem_erase.mpr ⟨hfixed.q_ne_t1, hfixed.q_mem⟩
        · exact Finset.mem_erase.mpr ⟨hfixed.p_ne_t1, hfixed.p_mem⟩
        · exact Finset.mem_erase.mpr ⟨hfixed.t1_ne_t3.symm, ht3A⟩
        · exact Finset.mem_erase.mpr ⟨hu_ne_t1, huA⟩
      card_four := by
        rw [hcard]
      radius := dist t1 q
      radius_pos := dist_pos.mpr hfixed.q_ne_t1.symm
      same_radius := by
        intro y hy
        have hy' : y = q ∨ y = p ∨ y = t3 ∨ y = u := by
          simpa [Finset.mem_insert, Finset.mem_singleton] using hy
        rcases hy' with rfl | rfl | rfl | rfl
        · rfl
        · exact ht1_p.trans ht1_q.symm
        · exact ht1_t3.trans ht1_q.symm
        · exact ht1_u.trans ht1_q.symm }
  have hqB : q ∈ ({q, p, t3, u} : Finset ℝ²) := by simp
  have hcrit :
      Nonempty (U5QCriticalTripleClass D q t1 ((({q, p, t3, u} : Finset ℝ²).erase q))) :=
    U5QAllowedK4Class.qCriticalTriple_of_mem_q K hcard hqB
  simpa [show ({q, p, t3, u} : Finset ℝ²) = insert q ({p, t3, u} : Finset ℝ²) by rfl,
    hq_not_mem_pt3u] using hcrit

/-- Three pairwise-distinct elements, each landing in a pairwise-distinct
target triple `{x, y, z}`, exhaust that triple as a `Finset`.  Supplies the
`{l1, l2, l4} = {t1, t2, t3}` complement equality for the `hlabel_mem_base`
style `q_t20` cubes so that `perm_of_finset_eq_triple` can finish the split. -/
theorem triple_finset_eq_of_mem {α : Type*} [DecidableEq α]
    {a b c x y z : α}
    (ha : a = x ∨ a = y ∨ a = z)
    (hb : b = x ∨ b = y ∨ b = z)
    (hc : c = x ∨ c = y ∨ c = z)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    ({a, b, c} : Finset α) = ({x, y, z} : Finset α) := by
  refine Finset.eq_of_subset_of_card_le ?_ ?_
  · intro w hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw ⊢
    rcases hw with rfl | rfl | rfl
    · exact ha
    · exact hb
    · exact hc
  · have hs : ({a, b, c} : Finset α).card = 3 :=
      Finset.card_eq_three.mpr ⟨a, b, c, hab, hac, hbc, rfl⟩
    have ht : ({x, y, z} : Finset α).card = 3 :=
      Finset.card_eq_three.mpr ⟨x, y, z, hxy, hxz, hyz, rfl⟩
    omega

/-- A three-element `Finset` equality whose left triple is pairwise distinct
forces one of the six ordered assignments of `(a, b, c)` onto `(x, y, z)`.
Collapses the hand-enumerated `{l2, l3, l4} → {t1, t2, t3}` bijection case
splits in the `q_t20` cubes of `u1_largeCap_routeB_tail_liveData_false`. -/
theorem perm_of_finset_eq_triple {α : Type*} [DecidableEq α]
    {a b c x y z : α}
    (hset : ({a, b, c} : Finset α) = ({x, y, z} : Finset α))
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    (a = x ∧ b = y ∧ c = z) ∨ (a = x ∧ b = z ∧ c = y) ∨
      (a = y ∧ b = x ∧ c = z) ∨ (a = y ∧ b = z ∧ c = x) ∨
      (a = z ∧ b = x ∧ c = y) ∨ (a = z ∧ b = y ∧ c = x) := by
  have ha : a = x ∨ a = y ∨ a = z := by
    have hmem : a ∈ ({x, y, z} : Finset α) := hset ▸ (by simp)
    simpa [Finset.mem_insert, Finset.mem_singleton] using hmem
  have hb : b = x ∨ b = y ∨ b = z := by
    have hmem : b ∈ ({x, y, z} : Finset α) := hset ▸ (by simp)
    simpa [Finset.mem_insert, Finset.mem_singleton] using hmem
  have hc : c = x ∨ c = y ∨ c = z := by
    have hmem : c ∈ ({x, y, z} : Finset α) := hset ▸ (by simp)
    simpa [Finset.mem_insert, Finset.mem_singleton] using hmem
  rcases ha with rfl | rfl | rfl <;> rcases hb with rfl | rfl | rfl <;>
    rcases hc with rfl | rfl | rfl <;> simp_all


open U1LargeCapRouteBTailMetricResidualTarget in
/-- **LEAF — U1.2 large-cap Route-B structural bridge.**

This theorem names the entire remaining U1.2 leaf after the large-cap tail has
been reduced to live U5 data and the five critical source rows.  The imported
consumer side is now sharper than the older `hF1Tail` route:

* the hocc-free branch split
  `u1_largeCap_routeB_collision_or_f1Slot0_of_pPlacement` isolates the
  collision side from the `u = f1[0]` residual after `p = f1[3]`;
* `U1LargeCapRouteBTailBranch0CollisionExclusionTarget` closes the named
  `Record001Branch0Collision` branch;
* the exact current primary consumer contract is now named
  `U1LargeCapRouteBTailMetricResidualTarget`, whose `.false` theorem packages
  the collision-exclusion route plus the residual packet-label fields, with no
  separate pair-exclusion inputs.
* the fixed record001 `f1:t2` consumer also closes the five explicit branch-0
  pair-collision cases through
  `U1Depth5SourceUnitGenerated.false_of_f1t2_extra_omit3_of_branch0_pairCollision`;
  those equality branches are already banked support inventory, not the live
  producer target.
* the current packet-label-centered target is also named:
  `U1LargeCapRouteBTailCenteredIncidenceTarget`, and its `.false` theorem now
  records the COMP-1 obstruction that this surface is incompatible with the
  no-collision branch as stated.

So the next theorem-facing producer milestone inside this leaf is no longer a
generic `selectedU = f1[0]` contradiction, and COMP-1 rules out deriving the
metric-residual or current centered fields from depth-5 live data alone on the
no-collision cell.  A closing producer must add a sixth critical row together
with a theorem that consumes it, the `(Q)_C5` fragment, an equivalent
incidence theorem, or a complete branch split that feeds the metric-residual
sink. -/
theorem u1_largeCap_routeB_tail_liveData_false
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase :
      List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) {i : Fin 3}
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.center = (rows.rowAt source).center)
    (hf2Selected_l1_eq_rowAt_l1 :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.selected.l1 = (rows.rowAt source).selected.l1)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    False := by
  /-
  Exact current live target inside this leaf:

    1. branch0 collision side:
       package the surviving route as
       `U1LargeCapRouteBTailMetricResidualTarget (p := p) rows` and close it by
       `.false`.
    2. centered-incidence consumer:
       the current centered surface is already contradictory on the
       no-collision cell because of `hocc_f2_f1_0`; any future centered route
       must restate that surface or avoid this cell.

  The imported consumer path is already banked on the finite side:
  `MetricResidualTarget.false` closes once that structure is produced, and the
  five explicit pair-collision equality branches are handled by the generated
  `false_of_f1t2_extra_omit3_of_branch0_pairCollision` consumer if an alternate
  packet replay needs them.  The remaining gap is to add the incidence content
  that COMP-1 shows is missing from the depth-5 large-cap tail.  The critical
  row for the record001 `f2` label `t2[0]` is now available to this spine leaf
  as `f2CriticalRow`; this is only an input to the still-open consumer theorem.
  The remaining work is to turn that extra row into one of the named residual
  fields or into a complete branch split, not to build another fixed-surface
  consumer or pair-collision adapter.
  -/
  classical
  have hsource_ne_selected_of_target_ne_q
      {z l : ℝ²}
      (hz_t20 :
        z = rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
      (hq_ne_z : q ≠ z) (hq_l : q = l) :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠ l := by
    intro hsource_l
    exact hq_ne_z (hq_l.trans (hsource_l.symm.trans hz_t20.symm))
  have hsource_named_except_l1
      (hsource_ne_l1 :
        rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
          f2CriticalRow.selected.l1) :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l2 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l3 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l4 := by
    rcases f2CriticalRow.source_eq_named with hsource_l1 | hsource_l2 |
      hsource_l3 | hsource_l4
    · exact False.elim (hsource_ne_l1 hsource_l1)
    · exact Or.inl hsource_l2
    · exact Or.inr (Or.inl hsource_l3)
    · exact Or.inr (Or.inr hsource_l4)
  have hsource_named_except_l2
      (hsource_ne_l2 :
        rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
          f2CriticalRow.selected.l2) :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l1 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l3 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l4 := by
    rcases f2CriticalRow.source_eq_named with hsource_l1 | hsource_l2 |
      hsource_l3 | hsource_l4
    · exact Or.inl hsource_l1
    · exact False.elim (hsource_ne_l2 hsource_l2)
    · exact Or.inr (Or.inl hsource_l3)
    · exact Or.inr (Or.inr hsource_l4)
  have hsource_named_except_l3
      (hsource_ne_l3 :
        rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
          f2CriticalRow.selected.l3) :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l1 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l2 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l4 := by
    rcases f2CriticalRow.source_eq_named with hsource_l1 | hsource_l2 |
      hsource_l3 | hsource_l4
    · exact Or.inl hsource_l1
    · exact Or.inr (Or.inl hsource_l2)
    · exact False.elim (hsource_ne_l3 hsource_l3)
    · exact Or.inr (Or.inr hsource_l4)
  have hsource_named_except_l4
      (hsource_ne_l4 :
        rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
          f2CriticalRow.selected.l4) :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l1 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l2 ∨
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          f2CriticalRow.selected.l3 := by
    rcases f2CriticalRow.source_eq_named with hsource_l1 | hsource_l2 |
      hsource_l3 | hsource_l4
    · exact Or.inl hsource_l1
    · exact Or.inr (Or.inl hsource_l2)
    · exact Or.inr (Or.inr hsource_l3)
    · exact False.elim (hsource_ne_l4 hsource_l4)
  rcases
      U1LargeCapRouteBTailMetricResidualTarget.f2CriticalRow_center_baseSix_or_fresh
        (p := p) f2CriticalRow with
    hcenter_p | hcenter_q | hcenter_t1 | hcenter_t2 | hcenter_t3 |
    hcenter_u | hcenter_fresh
  · have hselected_support_eq_base_of_q_named
        (hq_named :
          q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
            q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4) :
        f2CriticalRow.selected.toCriticalFourShell.support =
          ({q, t1, t2, t3} : Finset ℝ²) :=
      f2CriticalRow_selected_support_eq_dangerous_of_center_p_q_named
        hfixed f2CriticalRow H hcenter_p hq_named
    by_cases hq_t20 :
        q = rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }
    · have hq_named :
          q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
            q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4 := by
        rcases f2CriticalRow.source_eq_named with h | h | h | h
        · exact Or.inl (hq_t20.trans h)
        · exact Or.inr (Or.inl (hq_t20.trans h))
        · exact Or.inr (Or.inr (Or.inl (hq_t20.trans h)))
        · exact Or.inr (Or.inr (Or.inr (hq_t20.trans h)))
      have hqRow_center_p :
          (rows.rowAt U1Depth5.CriticalSource.q).center = p := by
        have hcenter_eq :=
          hf2Center_eq_rowAt_center U1Depth5.CriticalSource.q
            (by
              simpa [U1Depth5.CriticalSourceRows.sourcePoint] using
                hq_t20.symm)
        exact hcenter_eq.symm.trans hcenter_p
      have hselected_support_eq_base :
          f2CriticalRow.selected.toCriticalFourShell.support =
            ({q, t1, t2, t3} : Finset ℝ²) :=
        hselected_support_eq_base_of_q_named hq_named
      rcases hq_named with hq_slot0 | hq_slot1 | hq_slot2 | hq_slot3
      · -- Remaining cube: `q_t20` with `q = f2CriticalRow.selected.l1`.
        have hlabels_base :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
              Finset ℝ²) =
              ({q, t1, t2, t3} : Finset ℝ²) := by
          simpa [f2CriticalRow.selected.support_eq_labels] using
            hselected_support_eq_base
        have hl1_ne_t1 : f2CriticalRow.selected.l1 ≠ t1 := by
          intro h
          exact hfixed.q_ne_t1 (hq_slot0.trans h)
        have hl1_ne_t2 : f2CriticalRow.selected.l1 ≠ t2 := by
          intro h
          exact hfixed.q_ne_t2 (hq_slot0.trans h)
        have hl1_ne_t3 : f2CriticalRow.selected.l1 ≠ t3 := by
          intro h
          exact hfixed.q_ne_t3 (hq_slot0.trans h)
        have htail_set :
            ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l3,
                f2CriticalRow.selected.l4} : Finset ℝ²) =
              ({t1, t2, t3} : Finset ℝ²) := by
          have h := congrArg
            (fun S : Finset ℝ² => S.erase f2CriticalRow.selected.l1)
            hlabels_base
          simpa [hq_slot0, f2CriticalRow.selected.l1_ne_l2,
            f2CriticalRow.selected.l1_ne_l3, f2CriticalRow.selected.l1_ne_l4,
            hl1_ne_t1, hl1_ne_t2, hl1_ne_t3] using h
        rcases perm_of_finset_eq_triple htail_set
            f2CriticalRow.selected.l2_ne_l3 f2CriticalRow.selected.l2_ne_l4
            f2CriticalRow.selected.l3_ne_l4 with
          ⟨hl2_t1, hl3_t2, hl4_t3⟩ | ⟨hl2_t1, hl3_t3, hl4_t2⟩ |
            ⟨hl2_t2, hl3_t1, hl4_t3⟩ | ⟨hl2_t2, hl3_t3, hl4_t1⟩ |
            ⟨hl2_t3, hl3_t1, hl4_t2⟩ | ⟨hl2_t3, hl3_t2, hl4_t1⟩
        · -- Ordered subcube: `q_t20`, `q = l1`, `l2 = t1`,
          -- `l3 = t2`, `l4 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l1`, `l2 = t1`,
          -- `l3 = t3`, `l4 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l1`, `l2 = t2`,
          -- `l3 = t1`, `l4 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l1`, `l2 = t2`,
          -- `l3 = t3`, `l4 = t1`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l1`, `l2 = t3`,
          -- `l3 = t1`, `l4 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l1`, `l2 = t3`,
          -- `l3 = t2`, `l4 = t1`.
          sorry
      · -- Remaining cube: `q_t20` with `q = f2CriticalRow.selected.l2`.
        have hlabels_base :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
              Finset ℝ²) =
              ({q, t1, t2, t3} : Finset ℝ²) := by
          simpa [f2CriticalRow.selected.support_eq_labels] using
            hselected_support_eq_base
        have hl2_ne_t1 : f2CriticalRow.selected.l2 ≠ t1 := by
          intro h
          exact hfixed.q_ne_t1 (hq_slot1.trans h)
        have hl2_ne_t2 : f2CriticalRow.selected.l2 ≠ t2 := by
          intro h
          exact hfixed.q_ne_t2 (hq_slot1.trans h)
        have hl2_ne_t3 : f2CriticalRow.selected.l2 ≠ t3 := by
          intro h
          exact hfixed.q_ne_t3 (hq_slot1.trans h)
        have hl2_ne_l1 :
            f2CriticalRow.selected.l2 ≠ f2CriticalRow.selected.l1 :=
          f2CriticalRow.selected.l1_ne_l2.symm
        have htail_set :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l3,
                f2CriticalRow.selected.l4} : Finset ℝ²) =
              ({t1, t2, t3} : Finset ℝ²) := by
          have h := congrArg
            (fun S : Finset ℝ² => S.erase f2CriticalRow.selected.l2)
            hlabels_base
          have hleft :
              ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                  f2CriticalRow.selected.l3,
                  f2CriticalRow.selected.l4} : Finset ℝ²).erase
                  f2CriticalRow.selected.l2 =
                ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l3,
                  f2CriticalRow.selected.l4} : Finset ℝ²) := by
            ext x
            simp only [Finset.mem_erase, Finset.mem_insert,
              Finset.mem_singleton]
            constructor
            · intro hx
              rcases hx with ⟨hx_ne_l2, hx_l1 | hx_l2 | hx_l3 | hx_l4⟩
              · exact Or.inl hx_l1
              · exact False.elim (hx_ne_l2 hx_l2)
              · exact Or.inr (Or.inl hx_l3)
              · exact Or.inr (Or.inr hx_l4)
            · intro hx
              rcases hx with hx_l1 | hx_l3 | hx_l4
              · exact
                  ⟨by
                    intro hx_l2
                    exact hl2_ne_l1 (hx_l2.symm.trans hx_l1),
                    Or.inl hx_l1⟩
              · exact
                  ⟨by
                    intro hx_l2
                    exact f2CriticalRow.selected.l2_ne_l3
                      (hx_l2.symm.trans hx_l3),
                    Or.inr (Or.inr (Or.inl hx_l3))⟩
              · exact
                  ⟨by
                    intro hx_l2
                    exact f2CriticalRow.selected.l2_ne_l4
                      (hx_l2.symm.trans hx_l4),
                    Or.inr (Or.inr (Or.inr hx_l4))⟩
          have hright :
              ({q, t1, t2, t3} : Finset ℝ²).erase
                  f2CriticalRow.selected.l2 =
                ({t1, t2, t3} : Finset ℝ²) := by
            ext x
            simp only [Finset.mem_erase, Finset.mem_insert,
              Finset.mem_singleton]
            constructor
            · intro hx
              rcases hx with ⟨hx_ne_l2, hx_q | hx_t1 | hx_t2 | hx_t3⟩
              · exact False.elim (hx_ne_l2 (hx_q.trans hq_slot1))
              · exact Or.inl hx_t1
              · exact Or.inr (Or.inl hx_t2)
              · exact Or.inr (Or.inr hx_t3)
            · intro hx
              rcases hx with hx_t1 | hx_t2 | hx_t3
              · exact
                  ⟨by
                    intro hx_l2
                    exact hl2_ne_t1 (hx_l2.symm.trans hx_t1),
                    Or.inr (Or.inl hx_t1)⟩
              · exact
                  ⟨by
                    intro hx_l2
                    exact hl2_ne_t2 (hx_l2.symm.trans hx_t2),
                    Or.inr (Or.inr (Or.inl hx_t2))⟩
              · exact
                  ⟨by
                    intro hx_l2
                    exact hl2_ne_t3 (hx_l2.symm.trans hx_t3),
                    Or.inr (Or.inr (Or.inr hx_t3))⟩
          simpa [hleft, hright] using h
        rcases perm_of_finset_eq_triple htail_set
            f2CriticalRow.selected.l1_ne_l3 f2CriticalRow.selected.l1_ne_l4
            f2CriticalRow.selected.l3_ne_l4 with
          ⟨hl1_t1, hl3_t2, hl4_t3⟩ | ⟨hl1_t1, hl3_t3, hl4_t2⟩ |
            ⟨hl1_t2, hl3_t1, hl4_t3⟩ | ⟨hl1_t2, hl3_t3, hl4_t1⟩ |
            ⟨hl1_t3, hl3_t1, hl4_t2⟩ | ⟨hl1_t3, hl3_t2, hl4_t1⟩
        · -- Ordered subcube: `q_t20`, `q = l2`, `l1 = t1`,
          -- `l3 = t2`, `l4 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l2`, `l1 = t1`,
          -- `l3 = t3`, `l4 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l2`, `l1 = t2`,
          -- `l3 = t1`, `l4 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l2`, `l1 = t2`,
          -- `l3 = t3`, `l4 = t1`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l2`, `l1 = t3`,
          -- `l3 = t1`, `l4 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l2`, `l1 = t3`,
          -- `l3 = t2`, `l4 = t1`.
          sorry
      · -- Remaining cube: `q_t20` with `q = f2CriticalRow.selected.l3`.
        have hlabels_base :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
              Finset ℝ²) =
              ({q, t1, t2, t3} : Finset ℝ²) := by
          simpa [f2CriticalRow.selected.support_eq_labels] using
            hselected_support_eq_base
        have hlabel_mem_base {x : ℝ²}
            (hx : x ∈
              ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                  f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                Finset ℝ²)) :
            x = q ∨ x = t1 ∨ x = t2 ∨ x = t3 := by
          have hx' : x ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
            simpa [hlabels_base] using hx
          simpa [Finset.mem_insert, Finset.mem_singleton] using hx'
        have hl1_mem :
            f2CriticalRow.selected.l1 = t1 ∨ f2CriticalRow.selected.l1 = t2 ∨
              f2CriticalRow.selected.l1 = t3 := by
          rcases hlabel_mem_base (x := f2CriticalRow.selected.l1) (by simp) with
            h1q | h1t1 | h1t2 | h1t3
          · exact absurd (h1q.trans hq_slot2) f2CriticalRow.selected.l1_ne_l3
          · exact Or.inl h1t1
          · exact Or.inr (Or.inl h1t2)
          · exact Or.inr (Or.inr h1t3)
        have hl2_mem :
            f2CriticalRow.selected.l2 = t1 ∨ f2CriticalRow.selected.l2 = t2 ∨
              f2CriticalRow.selected.l2 = t3 := by
          rcases hlabel_mem_base (x := f2CriticalRow.selected.l2) (by simp) with
            h2q | h2t1 | h2t2 | h2t3
          · exact absurd (h2q.trans hq_slot2) f2CriticalRow.selected.l2_ne_l3
          · exact Or.inl h2t1
          · exact Or.inr (Or.inl h2t2)
          · exact Or.inr (Or.inr h2t3)
        have hl4_mem :
            f2CriticalRow.selected.l4 = t1 ∨ f2CriticalRow.selected.l4 = t2 ∨
              f2CriticalRow.selected.l4 = t3 := by
          rcases hlabel_mem_base (x := f2CriticalRow.selected.l4) (by simp) with
            h4q | h4t1 | h4t2 | h4t3
          · exact absurd (h4q.trans hq_slot2).symm f2CriticalRow.selected.l3_ne_l4
          · exact Or.inl h4t1
          · exact Or.inr (Or.inl h4t2)
          · exact Or.inr (Or.inr h4t3)
        have htail_set :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                f2CriticalRow.selected.l4} : Finset ℝ²) =
              ({t1, t2, t3} : Finset ℝ²) :=
          triple_finset_eq_of_mem hl1_mem hl2_mem hl4_mem
            f2CriticalRow.selected.l1_ne_l2 f2CriticalRow.selected.l1_ne_l4
            f2CriticalRow.selected.l2_ne_l4
            hfixed.t1_ne_t2 hfixed.t1_ne_t3 hfixed.t2_ne_t3
        rcases perm_of_finset_eq_triple htail_set
            f2CriticalRow.selected.l1_ne_l2 f2CriticalRow.selected.l1_ne_l4
            f2CriticalRow.selected.l2_ne_l4 with
          ⟨hl1_t1, hl2_t2, hl4_t3⟩ | ⟨hl1_t1, hl2_t3, hl4_t2⟩ |
            ⟨hl1_t2, hl2_t1, hl4_t3⟩ | ⟨hl1_t2, hl2_t3, hl4_t1⟩ |
            ⟨hl1_t3, hl2_t1, hl4_t2⟩ | ⟨hl1_t3, hl2_t2, hl4_t1⟩
        · -- Ordered subcube: `q_t20`, `q = l3`, `l1 = t1`,
          -- `l2 = t2`, `l4 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l3`, `l1 = t1`,
          -- `l2 = t3`, `l4 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l3`, `l1 = t2`,
          -- `l2 = t1`, `l4 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l3`, `l1 = t2`,
          -- `l2 = t3`, `l4 = t1`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l3`, `l1 = t3`,
          -- `l2 = t1`, `l4 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l3`, `l1 = t3`,
          -- `l2 = t2`, `l4 = t1`.
          sorry
      · -- Remaining cube: `q_t20` with `q = f2CriticalRow.selected.l4`.
        have hlabels_base :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
              Finset ℝ²) =
              ({q, t1, t2, t3} : Finset ℝ²) := by
          simpa [f2CriticalRow.selected.support_eq_labels] using
            hselected_support_eq_base
        have hlabel_mem_base {x : ℝ²}
            (hx : x ∈
              ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                  f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                Finset ℝ²)) :
            x = q ∨ x = t1 ∨ x = t2 ∨ x = t3 := by
          have hx' : x ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
            simpa [hlabels_base] using hx
          simpa [Finset.mem_insert, Finset.mem_singleton] using hx'
        have hl1_mem :
            f2CriticalRow.selected.l1 = t1 ∨ f2CriticalRow.selected.l1 = t2 ∨
              f2CriticalRow.selected.l1 = t3 := by
          rcases hlabel_mem_base (x := f2CriticalRow.selected.l1) (by simp) with
            h1q | h1t1 | h1t2 | h1t3
          · exact absurd (h1q.trans hq_slot3) f2CriticalRow.selected.l1_ne_l4
          · exact Or.inl h1t1
          · exact Or.inr (Or.inl h1t2)
          · exact Or.inr (Or.inr h1t3)
        have hl2_mem :
            f2CriticalRow.selected.l2 = t1 ∨ f2CriticalRow.selected.l2 = t2 ∨
              f2CriticalRow.selected.l2 = t3 := by
          rcases hlabel_mem_base (x := f2CriticalRow.selected.l2) (by simp) with
            h2q | h2t1 | h2t2 | h2t3
          · exact absurd (h2q.trans hq_slot3) f2CriticalRow.selected.l2_ne_l4
          · exact Or.inl h2t1
          · exact Or.inr (Or.inl h2t2)
          · exact Or.inr (Or.inr h2t3)
        have hl3_mem :
            f2CriticalRow.selected.l3 = t1 ∨ f2CriticalRow.selected.l3 = t2 ∨
              f2CriticalRow.selected.l3 = t3 := by
          rcases hlabel_mem_base (x := f2CriticalRow.selected.l3) (by simp) with
            h3q | h3t1 | h3t2 | h3t3
          · exact absurd (h3q.trans hq_slot3) f2CriticalRow.selected.l3_ne_l4
          · exact Or.inl h3t1
          · exact Or.inr (Or.inl h3t2)
          · exact Or.inr (Or.inr h3t3)
        have htail_set :
            ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                f2CriticalRow.selected.l3} : Finset ℝ²) =
              ({t1, t2, t3} : Finset ℝ²) :=
          triple_finset_eq_of_mem hl1_mem hl2_mem hl3_mem
            f2CriticalRow.selected.l1_ne_l2 f2CriticalRow.selected.l1_ne_l3
            f2CriticalRow.selected.l2_ne_l3
            hfixed.t1_ne_t2 hfixed.t1_ne_t3 hfixed.t2_ne_t3
        rcases perm_of_finset_eq_triple htail_set
            f2CriticalRow.selected.l1_ne_l2 f2CriticalRow.selected.l1_ne_l3
            f2CriticalRow.selected.l2_ne_l3 with
          ⟨hl1_t1, hl2_t2, hl3_t3⟩ | ⟨hl1_t1, hl2_t3, hl3_t2⟩ |
            ⟨hl1_t2, hl2_t1, hl3_t3⟩ | ⟨hl1_t2, hl2_t3, hl3_t1⟩ |
            ⟨hl1_t3, hl2_t1, hl3_t2⟩ | ⟨hl1_t3, hl2_t2, hl3_t1⟩
        · -- Ordered subcube: `q_t20`, `q = l4`, `l1 = t1`,
          -- `l2 = t2`, `l3 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l4`, `l1 = t1`,
          -- `l2 = t3`, `l3 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l4`, `l1 = t2`,
          -- `l2 = t1`, `l3 = t3`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l4`, `l1 = t2`,
          -- `l2 = t3`, `l3 = t1`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l4`, `l1 = t3`,
          -- `l2 = t1`, `l3 = t2`.
          sorry
        · -- Ordered subcube: `q_t20`, `q = l4`, `l1 = t3`,
          -- `l2 = t2`, `l3 = t1`.
          sorry
    · by_cases ht1_t20 :
        t1 = rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }
      · by_cases hq_named :
              q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
                q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4
        · have hselected_support_eq_base :
              f2CriticalRow.selected.toCriticalFourShell.support =
                ({q, t1, t2, t3} : Finset ℝ²) :=
            hselected_support_eq_base_of_q_named hq_named
          have ht1Row_center_p :
              (rows.rowAt U1Depth5.CriticalSource.t1).center = p := by
            have hcenter_eq :=
              hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t1
                (by
                  simpa [U1Depth5.CriticalSourceRows.sourcePoint] using
                    ht1_t20.symm)
            exact hcenter_eq.symm.trans hcenter_p
          have hf2_l1_eq_t1Row_l1 :
              f2CriticalRow.selected.l1 =
                (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1 := by
            exact
              hf2Selected_l1_eq_rowAt_l1 U1Depth5.CriticalSource.t1
                (by
                  simpa [U1Depth5.CriticalSourceRows.sourcePoint] using
                    ht1_t20.symm)
          have hfalse_of_q_slot0_t1Row_l1
              (hq_slot0 : q = f2CriticalRow.selected.l1)
              (ht1Row_l1 :
                t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1) :
              False := by
            have hf2_l1_t1 : f2CriticalRow.selected.l1 = t1 :=
              hf2_l1_eq_t1Row_l1.trans ht1Row_l1.symm
            exact hfixed.q_ne_t1 (hq_slot0.trans hf2_l1_t1)
          have hfalse_of_l1_t1_not_t1Row_l1
              (hl1_t1 : f2CriticalRow.selected.l1 = t1)
              (ht1Row_l1 :
                ¬ t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1) :
              False := by
            have hrow_l1_t1 :
                (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1 = t1 :=
              hf2_l1_eq_t1Row_l1.symm.trans hl1_t1
            exact ht1Row_l1 hrow_l1_t1.symm
          have hfalse_of_l1_t2_t1Row_l1
              (hl1_t2 : f2CriticalRow.selected.l1 = t2)
              (ht1Row_l1 :
                t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1) :
              False := by
            have hf2_l1_t1 : f2CriticalRow.selected.l1 = t1 :=
              hf2_l1_eq_t1Row_l1.trans ht1Row_l1.symm
            exact hfixed.t1_ne_t2 (hf2_l1_t1.symm.trans hl1_t2)
          have hfalse_of_l1_t3_t1Row_l1
              (hl1_t3 : f2CriticalRow.selected.l1 = t3)
              (ht1Row_l1 :
                t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1) :
              False := by
            have hf2_l1_t1 : f2CriticalRow.selected.l1 = t1 :=
              hf2_l1_eq_t1Row_l1.trans ht1Row_l1.symm
            exact hfixed.t1_ne_t3 (hf2_l1_t1.symm.trans hl1_t3)
          rcases hq_named with hq_slot0 | hq_slot1 | hq_slot2 | hq_slot3
          · -- Remaining cube: `t1_t20` with `q = f2CriticalRow.selected.l1`.
            have hsource_ne_qSlot :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                  f2CriticalRow.selected.l1 :=
              hsource_ne_selected_of_target_ne_q
                ht1_t20 hfixed.q_ne_t1 hq_slot0
            have hsource_named_except :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l2 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l3 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l4 :=
              hsource_named_except_l1 hsource_ne_qSlot
            rcases hsource_named_except with
              hsource_l2 | hsource_l3 | hsource_l4
            · -- Source-slot subcube: `t1_t20`, `q = l1`, `t20 = l2`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl2_t1 : f2CriticalRow.selected.l2 = t1 :=
                hsource_l2.symm.trans ht1_t20.symm
              have htail_set :
                  ({f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({t2, t3} : Finset ℝ²) := by
                refine Finset.eq_of_subset_of_card_le ?_ ?_
                · intro x hx
                  simp only [Finset.mem_insert, Finset.mem_singleton] at hx ⊢
                  rcases hx with hxl3 | hxl4
                  · have hmem :
                        f2CriticalRow.selected.l3 ∈
                          ({q, t1, t2, t3} : Finset ℝ²) := by
                      have hmem' :
                          f2CriticalRow.selected.l3 ∈
                            ({f2CriticalRow.selected.l1,
                                f2CriticalRow.selected.l2,
                                f2CriticalRow.selected.l3,
                                f2CriticalRow.selected.l4} : Finset ℝ²) := by
                        simp
                      simpa [hlabels_base] using hmem'
                    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
                    rcases hmem with h3q | h3t1 | h3t2 | h3t3
                    · exact False.elim
                        (f2CriticalRow.selected.l1_ne_l3
                          (hq_slot0.symm.trans h3q.symm))
                    · exact False.elim
                        (f2CriticalRow.selected.l2_ne_l3
                          (hl2_t1.trans h3t1.symm))
                    · exact Or.inl (hxl3.trans h3t2)
                    · exact Or.inr (hxl3.trans h3t3)
                  · have hmem :
                        f2CriticalRow.selected.l4 ∈
                          ({q, t1, t2, t3} : Finset ℝ²) := by
                      have hmem' :
                          f2CriticalRow.selected.l4 ∈
                            ({f2CriticalRow.selected.l1,
                                f2CriticalRow.selected.l2,
                                f2CriticalRow.selected.l3,
                                f2CriticalRow.selected.l4} : Finset ℝ²) := by
                        simp
                      simpa [hlabels_base] using hmem'
                    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
                    rcases hmem with h4q | h4t1 | h4t2 | h4t3
                    · exact False.elim
                        (f2CriticalRow.selected.l1_ne_l4
                          (hq_slot0.symm.trans h4q.symm))
                    · exact False.elim
                        (f2CriticalRow.selected.l2_ne_l4
                          (hl2_t1.trans h4t1.symm))
                    · exact Or.inl (hxl4.trans h4t2)
                    · exact Or.inr (hxl4.trans h4t3)
                · have hleft :
                      ({f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²).card = 2 := by
                    simp [f2CriticalRow.selected.l3_ne_l4]
                  have hright :
                      ({t2, t3} : Finset ℝ²).card = 2 := by
                    simp [hfixed.t2_ne_t3]
                  omega
              rcases
                  pair_eq_or_swap_of_pair_finset_eq
                    f2CriticalRow.selected.l3_ne_l4 htail_set with
                hordered | hordered
              · rcases hordered with ⟨hl3_t2, hl4_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l1`,
                -- `t20 = l2`, `l3 = t2`, `l4 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_q_slot0_t1Row_l1 hq_slot0 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl3_t3, hl4_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l1`,
                -- `t20 = l2`, `l3 = t3`, `l4 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_q_slot0_t1Row_l1 hq_slot0 ht1Row_l1)
                · sorry
            · -- Source-slot subcube: `t1_t20`, `q = l1`, `t20 = l3`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl3_t1 : f2CriticalRow.selected.l3 = t1 :=
                hsource_l3.symm.trans ht1_t20.symm
              have htail_set :
                  ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({t2, t3} : Finset ℝ²) := by
                refine Finset.eq_of_subset_of_card_le ?_ ?_
                · intro x hx
                  simp only [Finset.mem_insert, Finset.mem_singleton] at hx ⊢
                  rcases hx with hxl2 | hxl4
                  · have hmem :
                        f2CriticalRow.selected.l2 ∈
                          ({q, t1, t2, t3} : Finset ℝ²) := by
                      have hmem' :
                          f2CriticalRow.selected.l2 ∈
                            ({f2CriticalRow.selected.l1,
                                f2CriticalRow.selected.l2,
                                f2CriticalRow.selected.l3,
                                f2CriticalRow.selected.l4} : Finset ℝ²) := by
                        simp
                      simpa [hlabels_base] using hmem'
                    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
                    rcases hmem with h2q | h2t1 | h2t2 | h2t3
                    · exact False.elim
                        (f2CriticalRow.selected.l1_ne_l2
                          (hq_slot0.symm.trans h2q.symm))
                    · exact False.elim
                        (f2CriticalRow.selected.l2_ne_l3
                          (h2t1.trans hl3_t1.symm))
                    · exact Or.inl (hxl2.trans h2t2)
                    · exact Or.inr (hxl2.trans h2t3)
                  · have hmem :
                        f2CriticalRow.selected.l4 ∈
                          ({q, t1, t2, t3} : Finset ℝ²) := by
                      have hmem' :
                          f2CriticalRow.selected.l4 ∈
                            ({f2CriticalRow.selected.l1,
                                f2CriticalRow.selected.l2,
                                f2CriticalRow.selected.l3,
                                f2CriticalRow.selected.l4} : Finset ℝ²) := by
                        simp
                      simpa [hlabels_base] using hmem'
                    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
                    rcases hmem with h4q | h4t1 | h4t2 | h4t3
                    · exact False.elim
                        (f2CriticalRow.selected.l1_ne_l4
                          (hq_slot0.symm.trans h4q.symm))
                    · exact False.elim
                        (f2CriticalRow.selected.l3_ne_l4
                          (hl3_t1.trans h4t1.symm))
                    · exact Or.inl (hxl4.trans h4t2)
                    · exact Or.inr (hxl4.trans h4t3)
                · have hleft :
                      ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l4} :
                        Finset ℝ²).card = 2 := by
                    simp [f2CriticalRow.selected.l2_ne_l4]
                  have hright :
                      ({t2, t3} : Finset ℝ²).card = 2 := by
                    simp [hfixed.t2_ne_t3]
                  omega
              rcases
                  pair_eq_or_swap_of_pair_finset_eq
                    f2CriticalRow.selected.l2_ne_l4 htail_set with
                hordered | hordered
              · rcases hordered with ⟨hl2_t2, hl4_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l1`,
                -- `t20 = l3`, `l2 = t2`, `l4 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_q_slot0_t1Row_l1 hq_slot0 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl2_t3, hl4_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l1`,
                -- `t20 = l3`, `l2 = t3`, `l4 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_q_slot0_t1Row_l1 hq_slot0 ht1Row_l1)
                · sorry
            · -- Source-slot subcube: `t1_t20`, `q = l1`, `t20 = l4`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl4_t1 : f2CriticalRow.selected.l4 = t1 :=
                hsource_l4.symm.trans ht1_t20.symm
              have htail_set :
                  ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l3} :
                    Finset ℝ²) =
                    ({t2, t3} : Finset ℝ²) := by
                refine Finset.eq_of_subset_of_card_le ?_ ?_
                · intro x hx
                  simp only [Finset.mem_insert, Finset.mem_singleton] at hx ⊢
                  rcases hx with hxl2 | hxl3
                  · have hmem :
                        f2CriticalRow.selected.l2 ∈
                          ({q, t1, t2, t3} : Finset ℝ²) := by
                      have hmem' :
                          f2CriticalRow.selected.l2 ∈
                            ({f2CriticalRow.selected.l1,
                                f2CriticalRow.selected.l2,
                                f2CriticalRow.selected.l3,
                                f2CriticalRow.selected.l4} : Finset ℝ²) := by
                        simp
                      simpa [hlabels_base] using hmem'
                    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
                    rcases hmem with h2q | h2t1 | h2t2 | h2t3
                    · exact False.elim
                        (f2CriticalRow.selected.l1_ne_l2
                          (hq_slot0.symm.trans h2q.symm))
                    · exact False.elim
                        (f2CriticalRow.selected.l2_ne_l4
                          (h2t1.trans hl4_t1.symm))
                    · exact Or.inl (hxl2.trans h2t2)
                    · exact Or.inr (hxl2.trans h2t3)
                  · have hmem :
                        f2CriticalRow.selected.l3 ∈
                          ({q, t1, t2, t3} : Finset ℝ²) := by
                      have hmem' :
                          f2CriticalRow.selected.l3 ∈
                            ({f2CriticalRow.selected.l1,
                                f2CriticalRow.selected.l2,
                                f2CriticalRow.selected.l3,
                                f2CriticalRow.selected.l4} : Finset ℝ²) := by
                        simp
                      simpa [hlabels_base] using hmem'
                    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
                    rcases hmem with h3q | h3t1 | h3t2 | h3t3
                    · exact False.elim
                        (f2CriticalRow.selected.l1_ne_l3
                          (hq_slot0.symm.trans h3q.symm))
                    · exact False.elim
                        (f2CriticalRow.selected.l3_ne_l4
                          (h3t1.trans hl4_t1.symm))
                    · exact Or.inl (hxl3.trans h3t2)
                    · exact Or.inr (hxl3.trans h3t3)
                · have hleft :
                      ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l3} :
                        Finset ℝ²).card = 2 := by
                    simp [f2CriticalRow.selected.l2_ne_l3]
                  have hright :
                      ({t2, t3} : Finset ℝ²).card = 2 := by
                    simp [hfixed.t2_ne_t3]
                  omega
              rcases
                  pair_eq_or_swap_of_pair_finset_eq
                    f2CriticalRow.selected.l2_ne_l3 htail_set with
                hordered | hordered
              · rcases hordered with ⟨hl2_t2, hl3_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l1`,
                -- `t20 = l4`, `l2 = t2`, `l3 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_q_slot0_t1Row_l1 hq_slot0 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl2_t3, hl3_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l1`,
                -- `t20 = l4`, `l2 = t3`, `l3 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_q_slot0_t1Row_l1 hq_slot0 ht1Row_l1)
                · sorry
          · -- Remaining cube: `t1_t20` with `q = f2CriticalRow.selected.l2`.
            have hsource_ne_qSlot :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                  f2CriticalRow.selected.l2 :=
              hsource_ne_selected_of_target_ne_q
                ht1_t20 hfixed.q_ne_t1 hq_slot1
            have hsource_named_except :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l1 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l3 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l4 :=
              hsource_named_except_l2 hsource_ne_qSlot
            rcases hsource_named_except with
              hsource_l1 | hsource_l3 | hsource_l4
            · -- Source-slot subcube: `t1_t20`, `q = l2`, `t20 = l1`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hlabels_ordered :
                  ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l1,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                calc
                  ({f2CriticalRow.selected.l2, f2CriticalRow.selected.l1,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3,
                          f2CriticalRow.selected.l4} : Finset ℝ²) := by
                    ext x
                    simp only [Finset.mem_insert, Finset.mem_singleton]
                    constructor
                    · intro hx
                      rcases hx with hxl2 | hxl1 | hxl3 | hxl4
                      · exact Or.inr (Or.inl hxl2)
                      · exact Or.inl hxl1
                      · exact Or.inr (Or.inr (Or.inl hxl3))
                      · exact Or.inr (Or.inr (Or.inr hxl4))
                    · intro hx
                      rcases hx with hxl1 | hxl2 | hxl3 | hxl4
                      · exact Or.inr (Or.inl hxl1)
                      · exact Or.inl hxl2
                      · exact Or.inr (Or.inr (Or.inl hxl3))
                      · exact Or.inr (Or.inr (Or.inr hxl4))
                  _ = ({q, t1, t2, t3} : Finset ℝ²) := hlabels_base
              have hl1_t1 : f2CriticalRow.selected.l1 = t1 :=
                hsource_l1.symm.trans ht1_t20.symm
              have htail_set :
                  ({f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({t2, t3} : Finset ℝ²) :=
                complement_pair_finset_eq_of_four_labels_eq
                  hlabels_ordered hq_slot1.symm hl1_t1
                  f2CriticalRow.selected.l2_ne_l3
                  f2CriticalRow.selected.l2_ne_l4
                  f2CriticalRow.selected.l1_ne_l3
                  f2CriticalRow.selected.l1_ne_l4
                  f2CriticalRow.selected.l3_ne_l4
                  hfixed.t2_ne_t3
              rcases
                  pair_eq_or_swap_of_pair_finset_eq
                    f2CriticalRow.selected.l3_ne_l4 htail_set with
                hordered | hordered
              · rcases hordered with ⟨hl3_t2, hl4_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l2`,
                -- `t20 = l1`, `l3 = t2`, `l4 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · sorry
                · exact False.elim
                    (hfalse_of_l1_t1_not_t1Row_l1 hl1_t1 ht1Row_l1)
              · rcases hordered with ⟨hl3_t3, hl4_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l2`,
                -- `t20 = l1`, `l3 = t3`, `l4 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · sorry
                · exact False.elim
                    (hfalse_of_l1_t1_not_t1Row_l1 hl1_t1 ht1Row_l1)
            · -- Source-slot subcube: `t1_t20`, `q = l2`, `t20 = l3`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl3_t1 : f2CriticalRow.selected.l3 = t1 :=
                hsource_l3.symm.trans ht1_t20.symm
              have htail_set :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({t2, t3} : Finset ℝ²) :=
                complement_pair_finset_eq_of_four_labels_mem
                  hlabels_base hq_slot1.symm hl3_t1 (by simp) (by simp)
                  (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                  f2CriticalRow.selected.l2_ne_l4
                  (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                  f2CriticalRow.selected.l3_ne_l4
                  f2CriticalRow.selected.l1_ne_l4
                  hfixed.t2_ne_t3
              rcases
                  pair_eq_or_swap_of_pair_finset_eq
                    f2CriticalRow.selected.l1_ne_l4 htail_set with
                hordered | hordered
              · rcases hordered with ⟨hl1_t2, hl4_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l2`,
                -- `t20 = l3`, `l1 = t2`, `l4 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t2_t1Row_l1 hl1_t2 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl1_t3, hl4_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l2`,
                -- `t20 = l3`, `l1 = t3`, `l4 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t3_t1Row_l1 hl1_t3 ht1Row_l1)
                · sorry
            · -- Source-slot subcube: `t1_t20`, `q = l2`, `t20 = l4`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl4_t1 : f2CriticalRow.selected.l4 = t1 :=
                hsource_l4.symm.trans ht1_t20.symm
              have htail_set :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l3} :
                    Finset ℝ²) =
                    ({t2, t3} : Finset ℝ²) :=
                complement_pair_finset_eq_of_four_labels_mem
                  hlabels_base hq_slot1.symm hl4_t1 (by simp) (by simp)
                  (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                  f2CriticalRow.selected.l2_ne_l3
                  (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                  (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                  f2CriticalRow.selected.l1_ne_l3
                  hfixed.t2_ne_t3
              rcases
                  pair_eq_or_swap_of_pair_finset_eq
                    f2CriticalRow.selected.l1_ne_l3 htail_set with
                hordered | hordered
              · rcases hordered with ⟨hl1_t2, hl3_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l2`,
                -- `t20 = l4`, `l1 = t2`, `l3 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t2_t1Row_l1 hl1_t2 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl1_t3, hl3_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l2`,
                -- `t20 = l4`, `l1 = t3`, `l3 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t3_t1Row_l1 hl1_t3 ht1Row_l1)
                · sorry
          · -- Remaining cube: `t1_t20` with `q = f2CriticalRow.selected.l3`.
            have hsource_ne_qSlot :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                  f2CriticalRow.selected.l3 :=
              hsource_ne_selected_of_target_ne_q
                ht1_t20 hfixed.q_ne_t1 hq_slot2
            have hsource_named_except :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l1 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l2 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l4 :=
              hsource_named_except_l3 hsource_ne_qSlot
            rcases hsource_named_except with
              hsource_l1 | hsource_l2 | hsource_l4
            · -- Source-slot subcube: `t1_t20`, `q = l3`, `t20 = l1`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl1_t1 : f2CriticalRow.selected.l1 = t1 :=
                hsource_l1.symm.trans ht1_t20.symm
              rcases
                  pair_order_or_swap_of_four_labels_mem
                    hlabels_base hq_slot2.symm hl1_t1 (by simp) (by simp)
                    (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                    f2CriticalRow.selected.l3_ne_l4
                    f2CriticalRow.selected.l1_ne_l2
                    f2CriticalRow.selected.l1_ne_l4
                    f2CriticalRow.selected.l2_ne_l4
                    hfixed.t2_ne_t3 with
                hordered | hordered
              · rcases hordered with ⟨hl2_t2, hl4_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l3`,
                -- `t20 = l1`, `l2 = t2`, `l4 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · sorry
                · exact False.elim
                    (hfalse_of_l1_t1_not_t1Row_l1 hl1_t1 ht1Row_l1)
              · rcases hordered with ⟨hl2_t3, hl4_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l3`,
                -- `t20 = l1`, `l2 = t3`, `l4 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · sorry
                · exact False.elim
                    (hfalse_of_l1_t1_not_t1Row_l1 hl1_t1 ht1Row_l1)
            · -- Source-slot subcube: `t1_t20`, `q = l3`, `t20 = l2`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl2_t1 : f2CriticalRow.selected.l2 = t1 :=
                hsource_l2.symm.trans ht1_t20.symm
              rcases
                  pair_order_or_swap_of_four_labels_mem
                    hlabels_base hq_slot2.symm hl2_t1 (by simp) (by simp)
                    (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                    f2CriticalRow.selected.l3_ne_l4
                    (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                    f2CriticalRow.selected.l2_ne_l4
                    f2CriticalRow.selected.l1_ne_l4
                    hfixed.t2_ne_t3 with
                hordered | hordered
              · rcases hordered with ⟨hl1_t2, hl4_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l3`,
                -- `t20 = l2`, `l1 = t2`, `l4 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t2_t1Row_l1 hl1_t2 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl1_t3, hl4_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l3`,
                -- `t20 = l2`, `l1 = t3`, `l4 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t3_t1Row_l1 hl1_t3 ht1Row_l1)
                · sorry
            · -- Source-slot subcube: `t1_t20`, `q = l3`, `t20 = l4`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl4_t1 : f2CriticalRow.selected.l4 = t1 :=
                hsource_l4.symm.trans ht1_t20.symm
              rcases
                  pair_order_or_swap_of_four_labels_mem
                    hlabels_base hq_slot2.symm hl4_t1 (by simp) (by simp)
                    (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                    (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                    (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                    (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                    f2CriticalRow.selected.l1_ne_l2
                    hfixed.t2_ne_t3 with
                hordered | hordered
              · rcases hordered with ⟨hl1_t2, hl2_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l3`,
                -- `t20 = l4`, `l1 = t2`, `l2 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t2_t1Row_l1 hl1_t2 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl1_t3, hl2_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l3`,
                -- `t20 = l4`, `l1 = t3`, `l2 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t3_t1Row_l1 hl1_t3 ht1Row_l1)
                · sorry
          · -- Remaining cube: `t1_t20` with `q = f2CriticalRow.selected.l4`.
            have hsource_ne_qSlot :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                  f2CriticalRow.selected.l4 :=
              hsource_ne_selected_of_target_ne_q
                ht1_t20 hfixed.q_ne_t1 hq_slot3
            have hsource_named_except :
                rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l1 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l2 ∨
                  rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                    f2CriticalRow.selected.l3 :=
              hsource_named_except_l4 hsource_ne_qSlot
            rcases hsource_named_except with
              hsource_l1 | hsource_l2 | hsource_l3
            · -- Source-slot subcube: `t1_t20`, `q = l4`, `t20 = l1`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl1_t1 : f2CriticalRow.selected.l1 = t1 :=
                hsource_l1.symm.trans ht1_t20.symm
              rcases
                  pair_order_or_swap_of_four_labels_mem
                    hlabels_base hq_slot3.symm hl1_t1 (by simp) (by simp)
                    (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                    (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                    f2CriticalRow.selected.l1_ne_l2
                    f2CriticalRow.selected.l1_ne_l3
                    f2CriticalRow.selected.l2_ne_l3
                    hfixed.t2_ne_t3 with
                hordered | hordered
              · rcases hordered with ⟨hl2_t2, hl3_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l4`,
                -- `t20 = l1`, `l2 = t2`, `l3 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · sorry
                · exact False.elim
                    (hfalse_of_l1_t1_not_t1Row_l1 hl1_t1 ht1Row_l1)
              · rcases hordered with ⟨hl2_t3, hl3_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l4`,
                -- `t20 = l1`, `l2 = t3`, `l3 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · sorry
                · exact False.elim
                    (hfalse_of_l1_t1_not_t1Row_l1 hl1_t1 ht1Row_l1)
            · -- Source-slot subcube: `t1_t20`, `q = l4`, `t20 = l2`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl2_t1 : f2CriticalRow.selected.l2 = t1 :=
                hsource_l2.symm.trans ht1_t20.symm
              rcases
                  pair_order_or_swap_of_four_labels_mem
                    hlabels_base hq_slot3.symm hl2_t1 (by simp) (by simp)
                    (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                    (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                    (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                    f2CriticalRow.selected.l2_ne_l3
                    f2CriticalRow.selected.l1_ne_l3
                    hfixed.t2_ne_t3 with
                hordered | hordered
              · rcases hordered with ⟨hl1_t2, hl3_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l4`,
                -- `t20 = l2`, `l1 = t2`, `l3 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t2_t1Row_l1 hl1_t2 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl1_t3, hl3_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l4`,
                -- `t20 = l2`, `l1 = t3`, `l3 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t3_t1Row_l1 hl1_t3 ht1Row_l1)
                · sorry
            · -- Source-slot subcube: `t1_t20`, `q = l4`, `t20 = l3`.
              have hlabels_base :
                  ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                      f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                    Finset ℝ²) =
                    ({q, t1, t2, t3} : Finset ℝ²) := by
                simpa [f2CriticalRow.selected.support_eq_labels] using
                  hselected_support_eq_base
              have hl3_t1 : f2CriticalRow.selected.l3 = t1 :=
                hsource_l3.symm.trans ht1_t20.symm
              rcases
                  pair_order_or_swap_of_four_labels_mem
                    hlabels_base hq_slot3.symm hl3_t1 (by simp) (by simp)
                    (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                    (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                    (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                    (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                    f2CriticalRow.selected.l1_ne_l2
                    hfixed.t2_ne_t3 with
                hordered | hordered
              · rcases hordered with ⟨hl1_t2, hl2_t3⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l4`,
                -- `t20 = l3`, `l1 = t2`, `l2 = t3`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t2_t1Row_l1 hl1_t2 ht1Row_l1)
                · sorry
              · rcases hordered with ⟨hl1_t3, hl2_t2⟩
                -- Ordered source-slot subcube: `t1_t20`, `q = l4`,
                -- `t20 = l3`, `l1 = t3`, `l2 = t2`.
                by_cases ht1Row_l1 :
                    t1 = (rows.rowAt U1Depth5.CriticalSource.t1).selected.l1
                · exact False.elim
                    (hfalse_of_l1_t3_t1Row_l1 hl1_t3 ht1Row_l1)
                · sorry
        · exact
            false_of_f2CriticalRow_center_p_q_not_named
              hlocalNoQFree f2CriticalRow hcenter_p hq_named
      · by_cases ht2_t20 :
          t2 = rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }
        · exact
            false_of_center_p_t2_t20 MT hCirc CP hM hqCap hsurplus hqNonMoser
              hnotOppExact hNoM44 hcard hnoRem hcritical hlocalNoQFree hfixed
              hbase rows f2CriticalRow
              hf2Center_eq_rowAt_center H hcenter_p ht2_t20
        · by_cases ht3_t20 :
            t3 = rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }
          · by_cases hq_named :
                q = f2CriticalRow.selected.l1 ∨ q = f2CriticalRow.selected.l2 ∨
                  q = f2CriticalRow.selected.l3 ∨ q = f2CriticalRow.selected.l4
            · have hselected_support_eq_base :
                  f2CriticalRow.selected.toCriticalFourShell.support =
                    ({q, t1, t2, t3} : Finset ℝ²) :=
                hselected_support_eq_base_of_q_named hq_named
              have ht3Row_center_p :
                  (rows.rowAt U1Depth5.CriticalSource.t3).center = p := by
                have hcenter_eq :=
                  hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t3
                    (by
                      simpa [U1Depth5.CriticalSourceRows.sourcePoint] using
                        ht3_t20.symm)
                exact hcenter_eq.symm.trans hcenter_p
              rcases hq_named with hq_slot0 | hq_slot1 | hq_slot2 | hq_slot3
              · -- Remaining cube: `t3_t20` with `q = f2CriticalRow.selected.l1`.
                have hsource_ne_qSlot :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                      f2CriticalRow.selected.l1 :=
                  hsource_ne_selected_of_target_ne_q
                    ht3_t20 hfixed.q_ne_t3 hq_slot0
                have hsource_named_except :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l2 ∨
                      rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l3 ∨
                        rows.pointOfChoice
                          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                          f2CriticalRow.selected.l4 :=
                    hsource_named_except_l1 hsource_ne_qSlot
                rcases hsource_named_except with
                  hsource_l2 | hsource_l3 | hsource_l4
                · -- Source-slot subcube: `t3_t20`, `q = l1`, `t20 = l2`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl2_t3 : f2CriticalRow.selected.l2 = t3 :=
                    hsource_l2.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot0.symm hl2_t3 (by simp) (by simp)
                        f2CriticalRow.selected.l1_ne_l3
                        f2CriticalRow.selected.l1_ne_l4
                        f2CriticalRow.selected.l2_ne_l3
                        f2CriticalRow.selected.l2_ne_l4
                        f2CriticalRow.selected.l3_ne_l4
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl3_t1, hl4_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l1`,
                    -- `t20 = l2`, `l3 = t1`, `l4 = t2`.
                    sorry
                  · rcases hordered with ⟨hl3_t2, hl4_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l1`,
                    -- `t20 = l2`, `l3 = t2`, `l4 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l1`, `t20 = l3`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl3_t3 : f2CriticalRow.selected.l3 = t3 :=
                    hsource_l3.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot0.symm hl3_t3 (by simp) (by simp)
                        f2CriticalRow.selected.l1_ne_l2
                        f2CriticalRow.selected.l1_ne_l4
                        (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                        f2CriticalRow.selected.l3_ne_l4
                        f2CriticalRow.selected.l2_ne_l4
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl2_t1, hl4_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l1`,
                    -- `t20 = l3`, `l2 = t1`, `l4 = t2`.
                    sorry
                  · rcases hordered with ⟨hl2_t2, hl4_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l1`,
                    -- `t20 = l3`, `l2 = t2`, `l4 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l1`, `t20 = l4`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl4_t3 : f2CriticalRow.selected.l4 = t3 :=
                    hsource_l4.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot0.symm hl4_t3 (by simp) (by simp)
                        f2CriticalRow.selected.l1_ne_l2
                        f2CriticalRow.selected.l1_ne_l3
                        (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                        f2CriticalRow.selected.l2_ne_l3
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl2_t1, hl3_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l1`,
                    -- `t20 = l4`, `l2 = t1`, `l3 = t2`.
                    sorry
                  · rcases hordered with ⟨hl2_t2, hl3_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l1`,
                    -- `t20 = l4`, `l2 = t2`, `l3 = t1`.
                    sorry
              · -- Remaining cube: `t3_t20` with `q = f2CriticalRow.selected.l2`.
                have hsource_ne_qSlot :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                      f2CriticalRow.selected.l2 :=
                  hsource_ne_selected_of_target_ne_q
                    ht3_t20 hfixed.q_ne_t3 hq_slot1
                have hsource_named_except :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l1 ∨
                      rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l3 ∨
                        rows.pointOfChoice
                          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                          f2CriticalRow.selected.l4 :=
                    hsource_named_except_l2 hsource_ne_qSlot
                rcases hsource_named_except with
                  hsource_l1 | hsource_l3 | hsource_l4
                · -- Source-slot subcube: `t3_t20`, `q = l2`, `t20 = l1`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl1_t3 : f2CriticalRow.selected.l1 = t3 :=
                    hsource_l1.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot1.symm hl1_t3 (by simp) (by simp)
                        f2CriticalRow.selected.l2_ne_l3
                        f2CriticalRow.selected.l2_ne_l4
                        f2CriticalRow.selected.l1_ne_l3
                        f2CriticalRow.selected.l1_ne_l4
                        f2CriticalRow.selected.l3_ne_l4
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl3_t1, hl4_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l2`,
                    -- `t20 = l1`, `l3 = t1`, `l4 = t2`.
                    sorry
                  · rcases hordered with ⟨hl3_t2, hl4_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l2`,
                    -- `t20 = l1`, `l3 = t2`, `l4 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l2`, `t20 = l3`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl3_t3 : f2CriticalRow.selected.l3 = t3 :=
                    hsource_l3.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot1.symm hl3_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                        f2CriticalRow.selected.l2_ne_l4
                        (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                        f2CriticalRow.selected.l3_ne_l4
                        f2CriticalRow.selected.l1_ne_l4
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl1_t1, hl4_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l2`,
                    -- `t20 = l3`, `l1 = t1`, `l4 = t2`.
                    sorry
                  · rcases hordered with ⟨hl1_t2, hl4_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l2`,
                    -- `t20 = l3`, `l1 = t2`, `l4 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l2`, `t20 = l4`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl4_t3 : f2CriticalRow.selected.l4 = t3 :=
                    hsource_l4.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot1.symm hl4_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                        f2CriticalRow.selected.l2_ne_l3
                        (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                        f2CriticalRow.selected.l1_ne_l3
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl1_t1, hl3_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l2`,
                    -- `t20 = l4`, `l1 = t1`, `l3 = t2`.
                    sorry
                  · rcases hordered with ⟨hl1_t2, hl3_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l2`,
                    -- `t20 = l4`, `l1 = t2`, `l3 = t1`.
                    sorry
              · -- Remaining cube: `t3_t20` with `q = f2CriticalRow.selected.l3`.
                have hsource_ne_qSlot :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                      f2CriticalRow.selected.l3 :=
                  hsource_ne_selected_of_target_ne_q
                    ht3_t20 hfixed.q_ne_t3 hq_slot2
                have hsource_named_except :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l1 ∨
                      rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l2 ∨
                        rows.pointOfChoice
                          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                          f2CriticalRow.selected.l4 :=
                    hsource_named_except_l3 hsource_ne_qSlot
                rcases hsource_named_except with
                  hsource_l1 | hsource_l2 | hsource_l4
                · -- Source-slot subcube: `t3_t20`, `q = l3`, `t20 = l1`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl1_t3 : f2CriticalRow.selected.l1 = t3 :=
                    hsource_l1.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot2.symm hl1_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                        f2CriticalRow.selected.l3_ne_l4
                        f2CriticalRow.selected.l1_ne_l2
                        f2CriticalRow.selected.l1_ne_l4
                        f2CriticalRow.selected.l2_ne_l4
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl2_t1, hl4_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l3`,
                    -- `t20 = l1`, `l2 = t1`, `l4 = t2`.
                    sorry
                  · rcases hordered with ⟨hl2_t2, hl4_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l3`,
                    -- `t20 = l1`, `l2 = t2`, `l4 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l3`, `t20 = l2`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl2_t3 : f2CriticalRow.selected.l2 = t3 :=
                    hsource_l2.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot2.symm hl2_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                        f2CriticalRow.selected.l3_ne_l4
                        (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                        f2CriticalRow.selected.l2_ne_l4
                        f2CriticalRow.selected.l1_ne_l4
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl1_t1, hl4_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l3`,
                    -- `t20 = l2`, `l1 = t1`, `l4 = t2`.
                    sorry
                  · rcases hordered with ⟨hl1_t2, hl4_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l3`,
                    -- `t20 = l2`, `l1 = t2`, `l4 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l3`, `t20 = l4`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl4_t3 : f2CriticalRow.selected.l4 = t3 :=
                    hsource_l4.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot2.symm hl4_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                        (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                        (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                        f2CriticalRow.selected.l1_ne_l2
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl1_t1, hl2_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l3`,
                    -- `t20 = l4`, `l1 = t1`, `l2 = t2`.
                    sorry
                  · rcases hordered with ⟨hl1_t2, hl2_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l3`,
                    -- `t20 = l4`, `l1 = t2`, `l2 = t1`.
                    sorry
              · -- Remaining cube: `t3_t20` with `q = f2CriticalRow.selected.l4`.
                have hsource_ne_qSlot :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
                      f2CriticalRow.selected.l4 :=
                  hsource_ne_selected_of_target_ne_q
                    ht3_t20 hfixed.q_ne_t3 hq_slot3
                have hsource_named_except :
                    rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l1 ∨
                      rows.pointOfChoice
                        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                        f2CriticalRow.selected.l2 ∨
                        rows.pointOfChoice
                          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
                          f2CriticalRow.selected.l3 :=
                    hsource_named_except_l4 hsource_ne_qSlot
                rcases hsource_named_except with
                  hsource_l1 | hsource_l2 | hsource_l3
                · -- Source-slot subcube: `t3_t20`, `q = l4`, `t20 = l1`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl1_t3 : f2CriticalRow.selected.l1 = t3 :=
                    hsource_l1.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot3.symm hl1_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                        f2CriticalRow.selected.l1_ne_l2
                        f2CriticalRow.selected.l1_ne_l3
                        f2CriticalRow.selected.l2_ne_l3
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl2_t1, hl3_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l4`,
                    -- `t20 = l1`, `l2 = t1`, `l3 = t2`.
                    sorry
                  · rcases hordered with ⟨hl2_t2, hl3_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l4`,
                    -- `t20 = l1`, `l2 = t2`, `l3 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l4`, `t20 = l2`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl2_t3 : f2CriticalRow.selected.l2 = t3 :=
                    hsource_l2.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot3.symm hl2_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l3_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l1_ne_l2 h.symm)
                        f2CriticalRow.selected.l2_ne_l3
                        f2CriticalRow.selected.l1_ne_l3
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl1_t1, hl3_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l4`,
                    -- `t20 = l2`, `l1 = t1`, `l3 = t2`.
                    sorry
                  · rcases hordered with ⟨hl1_t2, hl3_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l4`,
                    -- `t20 = l2`, `l1 = t2`, `l3 = t1`.
                    sorry
                · -- Source-slot subcube: `t3_t20`, `q = l4`, `t20 = l3`.
                  have hlabels_base :
                      ({f2CriticalRow.selected.l1, f2CriticalRow.selected.l2,
                          f2CriticalRow.selected.l3, f2CriticalRow.selected.l4} :
                        Finset ℝ²) =
                        ({q, t1, t2, t3} : Finset ℝ²) := by
                    simpa [f2CriticalRow.selected.support_eq_labels] using
                      hselected_support_eq_base
                  have hl3_t3 : f2CriticalRow.selected.l3 = t3 :=
                    hsource_l3.symm.trans ht3_t20.symm
                  rcases
                      pair_order_or_swap_of_four_labels_mem_excluding_t3
                        hlabels_base hq_slot3.symm hl3_t3 (by simp) (by simp)
                        (fun h => f2CriticalRow.selected.l1_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l2_ne_l4 h.symm)
                        (fun h => f2CriticalRow.selected.l1_ne_l3 h.symm)
                        (fun h => f2CriticalRow.selected.l2_ne_l3 h.symm)
                        f2CriticalRow.selected.l1_ne_l2
                        hfixed.t1_ne_t2 with
                    hordered | hordered
                  · rcases hordered with ⟨hl1_t1, hl2_t2⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l4`,
                    -- `t20 = l3`, `l1 = t1`, `l2 = t2`.
                    sorry
                  · rcases hordered with ⟨hl1_t2, hl2_t1⟩
                    -- Ordered source-slot subcube: `t3_t20`, `q = l4`,
                    -- `t20 = l3`, `l1 = t2`, `l2 = t1`.
                    sorry
            · exact
                false_of_f2CriticalRow_center_p_q_not_named
                  hlocalNoQFree f2CriticalRow hcenter_p hq_named
          · have hT20Base :
                q ≠ rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
                t1 ≠ rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
                t2 ≠ rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } ∧
                t3 ≠ rows.pointOfChoice
                    { source := U1Depth5.CriticalSource.t2, slot := 0 } :=
              ⟨hq_t20, ht1_t20, ht2_t20, ht3_t20⟩
            exact
              false_of_f2CriticalRow_center_p_t20BaseExclusions
                hlocalNoQFree f2CriticalRow H hcenter_p hT20Base
  · sorry
  · sorry
  · rcases
        U1LargeCapRouteBTailMetricResidualTarget.f2CriticalRow_all_named_or_t2ResidualHRowFailure
            f2CriticalRow hcenter_t2 hfixed.p_mem with
      hnamed | hrowFailure
    · rcases hnamed with ⟨hf5_named, hp_named, hq_named⟩
      sorry
    · sorry
  · sorry
  · sorry
  · sorry

/-- **LEAF — U1.2 large-cap Route-B tail.**  This is the extracted tail of the
current non-exact U1.2 branch.  It consumes the concrete surplus cap and the
opposite-pair non-exact witness because the live `t2_t20` parent residual now
uses that cap/source-row incompatibility directly. -/
theorem u1_largeCap_routeB_tail_false (D : CounterexampleData)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) {i : Fin 3}
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hnotOppExact : ¬ CP.OppositePairExactAt i) :
    False := by
  classical
  rcases CP.exists_nonMoser_mem_capAt_of_card_gt_four hsurplus with
    ⟨q, hqCap, hqNonMoser⟩
  have hqA : q ∈ D.A := CP.capAt_subset_A i hqCap
  rcases exists_localizedNoQFreePacket_of_not_removable_mem hqA
      (hnoRem q) with
    ⟨p, hlocalNoQFree⟩
  rcases hlocalNoQFree.exists_fixedTriplePacket with
    ⟨t1, t2, t3, hfixed⟩
  have hdanger :
      U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²) :=
    u5DangerousTriple_of_u3FixedTriplePacket hfixed
  have hExactQDeletedRadius :
      (((D.skeleton q).erase p).filter fun y =>
          dist p y = dist p q).card = 3 :=
    hlocalNoQFree.exact_radius_class_card_eq_three hfixed
  rcases hdanger.exists_selectedCandidateSkeleton_of_card_gt_nine hcard with
    ⟨u, hselectedCandidate⟩
  have huOffDangerousCircle : dist p u ≠ dist p q :=
    hlocalNoQFree.selected_off_circle_of_dangerousTriple
      hdanger hselectedCandidate
  have hNoSameCircleExport :
      ¬ U5SameCircleExport D q p ({t1, t2, t3} : Finset ℝ²) u :=
    hlocalNoQFree.not_sameCircleExport_of_dangerousTriple
      hdanger hselectedCandidate
  have hbaseDistinct :
      p ≠ q ∧ p ≠ t1 ∧ p ≠ t2 ∧ p ≠ t3 ∧
        q ≠ t1 ∧ q ≠ t2 ∧ q ≠ t3 ∧
        t1 ≠ t2 ∧ t1 ≠ t3 ∧ t2 ≠ t3 :=
    hfixed.base_distinct
  have ht1A : t1 ∈ D.A := by
    have ht1Skeleton : t1 ∈ D.skeleton q :=
      (Finset.mem_erase.mp hfixed.t1_mem).2
    have ht1EraseQ : t1 ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using ht1Skeleton
    exact (Finset.mem_erase.mp ht1EraseQ).2
  have ht2A : t2 ∈ D.A := by
    have ht2Skeleton : t2 ∈ D.skeleton q :=
      (Finset.mem_erase.mp hfixed.t2_mem).2
    have ht2EraseQ : t2 ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using ht2Skeleton
    exact (Finset.mem_erase.mp ht2EraseQ).2
  have ht3A : t3 ∈ D.A := by
    have ht3Skeleton : t3 ∈ D.skeleton q :=
      (Finset.mem_erase.mp hfixed.t3_mem).2
    have ht3EraseQ : t3 ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using ht3Skeleton
    exact (Finset.mem_erase.mp ht3EraseQ).2
  have huMemSkeleton : u ∈ D.skeleton q :=
    (Finset.mem_erase.mp hselectedCandidate.candidate_mem).2
  have huA : u ∈ D.A := by
    have huEraseQ : u ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using huMemSkeleton
    exact (Finset.mem_erase.mp huEraseQ).2
  have hu_ne_p : u ≠ p :=
    (Finset.mem_erase.mp hselectedCandidate.candidate_mem).1
  have hu_ne_q : u ≠ q := by
    have huEraseQ : u ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using huMemSkeleton
    exact (Finset.mem_erase.mp huEraseQ).1
  have hu_ne_t1 : u ≠ t1 := by
    intro hut
    exact hselectedCandidate.candidate_notin_T (by simp [hut])
  have hu_ne_t2 : u ≠ t2 := by
    intro hut
    exact hselectedCandidate.candidate_notin_T (by simp [hut])
  have hu_ne_t3 : u ≠ t3 := by
    intro hut
    exact hselectedCandidate.candidate_notin_T (by simp [hut])
  have hbaseSixPairwise :
      List.Pairwise (fun x y : ℝ² => x ≠ y)
        [p, q, t1, t2, t3, u] :=
    U1Depth5.baseSix_pairwise_of_fixedTriple_and_selected
      hbaseDistinct hu_ne_p hu_ne_q hu_ne_t1 hu_ne_t2 hu_ne_t3
  rcases hcritical with ⟨Hcritical⟩
  let Hdepth5Rows :=
    U1Depth5.CriticalSourceRows.ofCriticalShellSystem
      Hcritical hqA ht1A ht2A ht3A huA
  let Hf2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (Hdepth5Rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) :=
    U1Depth5.CriticalRowPacket.ofCriticalShellSystem Hcritical
      (Hdepth5Rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
  have hf2Center_eq_rowAt_center :
      ∀ source : U1Depth5.CriticalSource,
        Hdepth5Rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          Hdepth5Rows.sourcePoint source →
        Hf2CriticalRow.center = (Hdepth5Rows.rowAt source).center := by
    intro source hsource
    subst Hf2CriticalRow
    subst Hdepth5Rows
    cases source <;>
      simp [U1Depth5.CriticalSourceRows.pointOfChoice,
        U1Depth5.CriticalSourceRows.rowAt,
        U1Depth5.CriticalSourceRows.sourcePoint,
        U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
        U1Depth5.CriticalRowPacket.ofCriticalShellSystem] at hsource ⊢
    · subst q
      rfl
    · subst t1
      rfl
    · simp [hsource]
    · subst t3
      rfl
    · subst u
      rfl
  have hf2Selected_l1_eq_rowAt_l1 :
      ∀ source : U1Depth5.CriticalSource,
        Hdepth5Rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          Hdepth5Rows.sourcePoint source →
        Hf2CriticalRow.selected.l1 =
          (Hdepth5Rows.rowAt source).selected.l1 := by
    intro source hsource
    subst Hf2CriticalRow
    subst Hdepth5Rows
    cases source <;>
      simp only [Fin.isValue, U1Depth5.CriticalSourceRows.pointOfChoice,
        U1Depth5.CriticalSourceRows.rowAt,
        U1Depth5.CriticalSourceRows.sourcePoint,
        U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
        U1Depth5.CriticalRowPacket.ofCriticalShellSystem,
        U1Depth5.CriticalRowPacket.slotPoint_zero] at hsource ⊢
    · subst q
      rfl
    · subst t1
      rfl
    · simp only [U1Depth5.CriticalRowPacket.slotPoint, Fin.isValue,
        Matrix.cons_val_zero] at hsource ⊢
      have hsub :
          (⟨(Hcritical.selectedAt t2 ht2A).l1,
              (Hcritical.selectedAt t2 ht2A).l1_mem_A⟩ : {x : ℝ² // x ∈ D.A}) =
            ⟨t2, ht2A⟩ := by
        exact Subtype.ext hsource
      have hcongr_l1 := congrArg
        (fun x : {x : ℝ² // x ∈ D.A} =>
          (Hcritical.selectedAt x.1 x.2).l1)
        hsub
      simpa using hcongr_l1
    · subst t3
      rfl
    · subst u
      rfl
  -- The wrapper now stops at the exact live U1.2 leaf boundary:
  -- `u1_largeCap_routeB_tail_liveData_false` consumes the localized no-q-free
  -- provenance, fixed triple, base-six distinctness, blocker-centered critical
  -- rows, same-critical-system row provenance, and the live
  -- dangerous/exact/selected payload.  Older local branch0 scaffolding that is
  -- no longer consumed by the leaf has been removed from this wrapper to keep
  -- the on-spine residual aligned with the current route.
  exact
    u1_largeCap_routeB_tail_liveData_false hlocalNoQFree hfixed
      hbaseSixPairwise MT hCirc CP hM hqCap hsurplus hqNonMoser hnotOppExact
      hNoM44 hcard hnoRem ⟨Hcritical⟩ Hdepth5Rows Hf2CriticalRow
      hf2Center_eq_rowAt_center hf2Selected_l1_eq_rowAt_l1
      { dangerous := hdanger
        exactQDeletedRadius := hExactQDeletedRadius
        selected := hselectedCandidate }

end Problem97

open Problem97

namespace Erdos9796Proof.P97.U1LargeCapRouteBTail

theorem DoubleApexOffSurplusSharedRadiusPair
    {D : Problem97.CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    ∃ x w' : ℝ², x ∈ D.A ∧ w' ∈ D.A ∧ x ≠ w' ∧
      x ∉ (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
          (hM := hM) (hsurplus := hsurplus)).surplusCap ∧
      w' ∉ (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
          (hM := hM) (hsurplus := hsurplus)).surplusCap ∧
      ∃ r ρ : ℝ,
        dist x (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex1 = r ∧
        dist w' (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex1 = r ∧
        dist x (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex2 = ρ ∧
        dist w' (Problem97.U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
            (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
            (hM := hM) (hsurplus := hsurplus)).oppApex2 = ρ := by
  simpa using
    Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair
      (D := D) (p := p) (q := q) (t1 := t1) (t2 := t2) (t3 := t3) (u := u)
      (hncol := hncol) MT hCirc (M := M) CP i j rows hM hqCap hsurplus
      hqNonMoser hjne hj5 hNoM44 hcard hcritical hlocalNoQFree hfixed hbase H
      hcenter hsupport

theorem exists_removableVertex_of_twoLargeCaps
    {D : Problem97.CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    ∃ x : ℝ², IsRemovableVertex D.A x := by
  simpa using
    Problem97.U1LargeCapRouteBTailMetricResidualTarget.exists_removableVertex_of_twoLargeCaps
      (p := p) MT hCirc CP i j rows hM hqCap hsurplus hqNonMoser hjne hj5
      hNoM44 hcard hcritical hlocalNoQFree hfixed hbase H hcenter hsupport

theorem oppCap2_escape_gen (D : Problem97.CounterexampleData)
    (S : SurplusCapPacket D.A) {r ρ : ℝ} {x w' : ℝ²}
    (hxA : x ∈ D.A) (hw'A : w' ∈ D.A)
    (hx_notsurp : x ∉ S.surplusCap)
    (hw'_notsurp : w' ∉ S.surplusCap)
    (hne : x ≠ w')
    (hxv : dist x S.oppApex1 = r) (hw'v : dist w' S.oppApex1 = r)
    (hxw : dist x S.oppApex2 = ρ) (hw'w : dist w' S.oppApex2 = ρ) :
    False := by
  simpa using
    Problem97.U1LargeCapRouteBTailMetricResidualTarget.U2NonSurplusSqueeze.oppCap2_escape_gen
      (D := D) (S := S) hxA hw'A hx_notsurp hw'_notsurp hne hxv hw'v hxw hw'w

end Erdos9796Proof.P97.U1LargeCapRouteBTail
