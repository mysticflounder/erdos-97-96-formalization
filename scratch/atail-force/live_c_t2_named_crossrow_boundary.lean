/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# LIVE-C `center_t2_named`: the first cross-row boundary

This scratch module isolates the first genuinely new row needed after
`center_t2_named_equilateral_star`.

For the five-row circle-intersection core, use `O = p`, `A = t2`, and
`C = q`.  To produce `DA_DX5` from one of the five source-indexed critical
rows, it is enough to find a row whose blocker center is a dangerous label
`D`, and whose selected shell contains `A = t2`: the row's own source can be
used as `X5`.

The checked results below show why the two live comparison maps do not supply
that row.  Whenever their premise holds, they identify the compared row's
center with `t2`, so they only recover the already-used `A`-centered row.
Consequently a row centered at `D != t2` must be a genuinely cross-source
blocker alignment not covered by the current comparisons, and it must also
carry the missing full-shell membership of `t2`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILForceScratch

open U1Depth5

/-- Exact data needed to obtain the first dangerous-centered cross-row edge
from one of the five source rows.  The second point on the row is its own
source, so no separate `X5` membership field is necessary. -/
structure DangerousCenteredCrossRow
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (A dangerousCenter : Plane) where
  source : CriticalSource
  center_eq : (rows.rowAt source).center = dangerousCenter
  A_named :
    A = (rows.rowAt source).selected.l1 ∨
      A = (rows.rowAt source).selected.l2 ∨
        A = (rows.rowAt source).selected.l3 ∨
          A = (rows.rowAt source).selected.l4

namespace DangerousCenteredCrossRow

/-- The row's source is the canonical `X5` supplied by this packet. -/
def X5
    {D : CounterexampleData} {q t1 t2 t3 u A dangerousCenter : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (W : DangerousCenteredCrossRow rows A dangerousCenter) : Plane :=
  rows.sourcePoint W.source

/-- A dangerous-centered cross-row packet supplies the metric content of
`FiveRowCircleIntersectionOrderCore.Core.DA_DX5`. -/
theorem metric_DA_DX5
    {D : CounterexampleData} {q t1 t2 t3 u A dangerousCenter : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (W : DangerousCenteredCrossRow rows A dangerousCenter) :
    dist dangerousCenter A = dist dangerousCenter W.X5 := by
  have hA := (rows.rowAt W.source).point_on_shell_of_eq_named W.A_named
  have hX5 := (rows.rowAt W.source).source_on_shell
  calc
    dist dangerousCenter A = dist (rows.rowAt W.source).center A := by
      rw [W.center_eq]
    _ = (rows.rowAt W.source).selected.toCriticalFourShell.radius := hA
    _ = dist (rows.rowAt W.source).center (rows.sourcePoint W.source) := hX5.symm
    _ = dist dangerousCenter W.X5 := by simp [X5, W.center_eq]

/-- A blocker row centered at `dangerousCenter` cannot be the source row of
that same dangerous point.  Any such row must come from a different source. -/
theorem source_ne_dangerousCenter
    {D : CounterexampleData} {q t1 t2 t3 u A dangerousCenter : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (W : DangerousCenteredCrossRow rows A dangerousCenter) :
    rows.sourcePoint W.source ≠ dangerousCenter := by
  intro hsource
  exact (rows.rowAt W.source).center_ne_source
    (W.center_eq.trans hsource.symm)

end DangerousCenteredCrossRow

/-- When the live occurrence comparison fires, both comparison maps recover
the already-used `t2`-centered row (and one matching selected slot). -/
theorem comparison_maps_repeat_t2_center
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : CriticalSource,
        rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
            rows.sourcePoint source →
          f2Row.center = (rows.rowAt source).center)
    (hf2Selected_l1_eq_rowAt_l1 :
      ∀ source : CriticalSource,
        rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
            rows.sourcePoint source →
          f2Row.selected.l1 = (rows.rowAt source).selected.l1)
    (hcenter_t2 : f2Row.center = t2)
    (source : CriticalSource)
    (hocc :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        rows.sourcePoint source) :
    (rows.rowAt source).center = t2 ∧
      f2Row.selected.l1 = (rows.rowAt source).selected.l1 := by
  exact ⟨(hf2Center_eq_rowAt_center source hocc).symm.trans hcenter_t2,
    hf2Selected_l1_eq_rowAt_l1 source hocc⟩

/-- If a dangerous-centered row with center different from `t2` exists, its
source cannot be one on which the current occurrence comparison fires.  This
is the exact missing cross-source comparison boundary. -/
theorem dangerousCrossRow_requires_unmatched_source
    {D : CounterexampleData} {q t1 t2 t3 u dangerousCenter : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : CriticalSource,
        rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
            rows.sourcePoint source →
          f2Row.center = (rows.rowAt source).center)
    (hcenter_t2 : f2Row.center = t2)
    (hdangerous_ne_t2 : dangerousCenter ≠ t2)
    (W : DangerousCenteredCrossRow rows t2 dangerousCenter) :
    rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } ≠
      rows.sourcePoint W.source := by
  intro hocc
  have hrow_t2 : (rows.rowAt W.source).center = t2 :=
    (hf2Center_eq_rowAt_center W.source hocc).symm.trans hcenter_t2
  exact hdangerous_ne_t2 (W.center_eq.symm.trans hrow_t2)

/-- The named branch supplies exactly the first two equalities of the banked
`u1TwoLargeCapObstruction` under
`(c,a,d,f) = (t2,p,q,t2[1])`. -/
theorem center_t2_named_twoLargeCap_prefix
    {D : CounterexampleData} {q t1 t2 t3 u p : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hcenter_t2 : f2Row.center = t2)
    (hf5_named :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l1 ∨
        rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l2 ∨
        rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l3 ∨
        rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l4)
    (hp_named :
      p = f2Row.selected.l1 ∨ p = f2Row.selected.l2 ∨
        p = f2Row.selected.l3 ∨ p = f2Row.selected.l4)
    (hq_named :
      q = f2Row.selected.l1 ∨ q = f2Row.selected.l2 ∨
        q = f2Row.selected.l3 ∨ q = f2Row.selected.l4) :
    dist t2 p = dist t2 q ∧
      dist t2 p =
        dist t2
          (rows.pointOfChoice { source := CriticalSource.t2, slot := 1 }) := by
  rcases
      U1LargeCapRouteBTailMetricResidualTarget.t2ResidualHRows_of_f2CriticalRow_named
        f2Row hcenter_t2 hf5_named hp_named hq_named with
    ⟨hf5, hp, hq⟩
  exact ⟨hp.trans hq.symm, hp.trans hf5.symm⟩

/-- The named `q` source row cannot supply the next q-centered row of the
five-point obstruction: critical source rows are blocker-centered.  A
q-centered row must again be a cross-source blocker alignment. -/
theorem qRow_center_ne_q
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u) :
    rows.qRow.center ≠ q :=
  rows.qRow.center_ne_source

#print axioms DangerousCenteredCrossRow.metric_DA_DX5
#print axioms DangerousCenteredCrossRow.source_ne_dangerousCenter
#print axioms comparison_maps_repeat_t2_center
#print axioms dangerousCrossRow_requires_unmatched_source
#print axioms center_t2_named_twoLargeCap_prefix
#print axioms qRow_center_ne_q

end ATAILForceScratch
end Problem97
