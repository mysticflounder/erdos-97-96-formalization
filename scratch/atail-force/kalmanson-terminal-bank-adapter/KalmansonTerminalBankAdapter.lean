import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Selected-row adapter for the five-point Kalmanson terminal

This scratch module connects the checked convex-boundary consumer to the
actual `SelectedFourClass` interface used by finite row banks.  It assumes one
shared CCW boundary enumeration and six explicit support memberships; it does
not manufacture either the boundary placement or the rows.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ATailKalmansonTerminalBankAdapterScratch

/-- Three selected rows with the normalized incidences

```text
center Y: O,E
center O: E,C
center A: C,O
```

are impossible when the five displayed points occur in one shared CCW
boundary order `O < A < Y < E < C`.

The proof uses only `SelectedFourClass.support_eq_radius` to produce the three
metric equalities consumed by
`CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities`.
-/
theorem false_of_selected_rows_in_five_ccw_order
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {iO iA iY iE iC : Fin carrier.card}
    (hOA : iO < iA) (hAY : iA < iY) (hYE : iY < iE) (hEC : iE < iC)
    (ORow : SelectedFourClass carrier (boundary iO))
    (ARow : SelectedFourClass carrier (boundary iA))
    (YRow : SelectedFourClass carrier (boundary iY))
    (hO_mem_YRow : boundary iO ∈ YRow.support)
    (hE_mem_YRow : boundary iE ∈ YRow.support)
    (hE_mem_ORow : boundary iE ∈ ORow.support)
    (hC_mem_ORow : boundary iC ∈ ORow.support)
    (hC_mem_ARow : boundary iC ∈ ARow.support)
    (hO_mem_ARow : boundary iO ∈ ARow.support) : False := by
  exact
    CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order
      hcarrier hboundary_injective hboundary_image hboundary_ccw
      hOA hAY hYE hEC ORow ARow YRow
      hO_mem_YRow hE_mem_YRow hE_mem_ORow hC_mem_ORow
      hC_mem_ARow hO_mem_ARow

#print axioms false_of_selected_rows_in_five_ccw_order

end ATailKalmansonTerminalBankAdapterScratch
end Problem97
