/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CaptureIncidenceInterface

/-!
# Finite countermodel for the R-branch capture frontier interface

GENERATED FILE — produced by `emit_lean.py` from the `model.json` built and
exhaustively checked by `search_model.py`.  Do not edit by hand; regenerate.

A concrete `CaptureFrontierInterface (Fin 17) (Fin 100)` instance: every
enumerated reachable incidence fact of the frontier holds simultaneously in a
17-point structure, checked by kernel `decide`.  Its existence shows the
interface facts are consistent, so no argument using only those facts can
derive `False` — and, since `false_of_abstractCapture` refutes the capture
packet from the interface facts alone, none can produce the capture packet.
-/

namespace Problem97
namespace ATailForce
namespace CaptureInsufficiency

set_option maxRecDepth 40000
set_option maxHeartbeats 8000000

/-- The 17-point distance table (symmetric; forced equalities only on the
per-center K4 rows and the named first-apex groups). -/
def dTab : Fin 17 → Fin 17 → Fin 100 :=
  ![![19, 36, 37, 0, 0, 0, 0, 9, 10, 11, 1, 1, 2, 2, 16, 17, 18],
    ![36, 20, 3, 5, 6, 7, 8, 3, 3, 3, 12, 13, 14, 15, 16, 17, 18],
    ![37, 3, 21, 38, 6, 4, 8, 4, 10, 11, 4, 13, 4, 15, 16, 17, 18],
    ![0, 5, 38, 22, 39, 7, 8, 9, 10, 11, 12, 5, 14, 5, 5, 17, 18],
    ![0, 6, 6, 39, 23, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 6, 6],
    ![0, 7, 4, 7, 7, 24, 7, 9, 40, 41, 12, 13, 14, 15, 42, 43, 44],
    ![0, 8, 8, 8, 8, 7, 25, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54],
    ![9, 3, 4, 9, 9, 9, 45, 26, 55, 56, 57, 58, 59, 60, 61, 62, 63],
    ![10, 3, 10, 10, 10, 40, 46, 55, 27, 64, 65, 66, 67, 68, 69, 70, 71],
    ![11, 3, 11, 11, 11, 41, 47, 56, 64, 28, 72, 73, 74, 75, 76, 77, 78],
    ![1, 12, 4, 12, 12, 12, 48, 57, 65, 72, 29, 79, 80, 81, 82, 83, 84],
    ![1, 13, 13, 5, 13, 13, 49, 58, 66, 73, 79, 30, 85, 86, 87, 88, 89],
    ![2, 14, 4, 14, 14, 14, 50, 59, 67, 74, 80, 85, 31, 90, 91, 92, 93],
    ![2, 15, 15, 5, 15, 15, 51, 60, 68, 75, 81, 86, 90, 32, 94, 95, 96],
    ![16, 16, 16, 5, 16, 42, 52, 61, 69, 76, 82, 87, 91, 94, 33, 97, 98],
    ![17, 17, 17, 17, 6, 43, 53, 62, 70, 77, 83, 88, 92, 95, 97, 34, 99],
    ![18, 18, 18, 18, 6, 44, 54, 63, 71, 78, 84, 89, 93, 96, 98, 99, 35]]

/-- Shell-center choice: each point lies on its center's exact 4-row. -/
def shellC : Fin 17 → Fin 17 := ![7, 3, 1, 0, 0, 0, 0, 1, 1, 1, 2, 3, 2, 3, 3, 4, 4]

/-- Shell radius: the row color of the chosen center. -/
def shellR : Fin 17 → Fin 100 := ![9, 5, 3, 0, 0, 0, 0, 3, 3, 3, 4, 5, 4, 5, 5, 6, 6]

/-- The countermodel.  Roles: 0 = o1, 1 = o2, 2 = interior center,
3/4 = terminal pair, 5/6 = rest of terminal row, 7–9 = second-apex row,
10/11 = frontier erased pair, 12/13 = descent erased pair,
14–16 = extra surplus-cap points. -/
def countermodel : CaptureFrontierInterface (Fin 17) (Fin 100) where
  rpos _ := True
  A := Finset.univ
  d := dTab
  o1 := 0
  o2 := 1
  cap := {0, 2, 14, 15, 16}
  interior := {2}
  p1 := 10
  p2 := 11
  q := 3
  w := 4
  rP := 1
  rT := 0
  rho2 := 3
  carrier := {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 14, 15, 16}
  shellCenter := shellC
  shellRadius := shellR
  symm := by decide
  escape := by decide
  one_hit := by decide
  sink := by decide
  k4 := by decide
  o1_mem_cap := by decide
  interior_subset_cap := by decide
  o1_not_mem_interior := by decide
  cap_subset_A := by decide
  four_lt_cap_card := by decide
  shell_center_mem := by decide
  shell_radius_pos := by decide
  shell_card := by decide
  shell_source_mem := by decide
  shell_critical := by decide
  p1_blocker_ne_o2 := by decide
  p2_blocker_ne_o2 := by decide
  p1_mem_marginal := by decide
  p2_mem_marginal := by decide
  p1_ne_p2 := by decide
  rP_pos := by decide
  p1_survives := by decide
  p2_survives := by decide
  first_apex_double := by decide
  second_apex_double := by decide
  carrier_subset := by decide
  erased_off_cap := by decide
  erased_mate := by decide
  erased_mate_B0 := by decide
  rT_pos := by decide
  terminal_card := by decide
  terminal_unique := by decide
  q_mem_marginal := by decide
  w_mem_marginal := by decide
  q_ne_w := by decide
  rho2_pos := by decide
  second_row_four := by decide
  second_row_eq_ambient := by decide
  second_row_survives := by decide

/-- The enumerated frontier interface facts are simultaneously satisfiable:
no incidence-only derivation of `False` (hence of the capture packet) exists
over this signature. -/
theorem countermodel_exists :
    Nonempty (CaptureFrontierInterface (Fin 17) (Fin 100)) :=
  ⟨countermodel⟩

/-- Sanity: as in every model, the abstract capture packet is empty here. -/
theorem countermodel_capture_free : IsEmpty (AbstractCapture countermodel) :=
  ⟨fun L => false_of_abstractCapture countermodel L⟩

#print axioms countermodel_exists
#print axioms countermodel_capture_free

end CaptureInsufficiency
end ATailForce
end Problem97
