"""Emit CaptureIncidenceCountermodel.lean from the validated model.json."""

import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))

with open(os.path.join(HERE, "model.json")) as f:
    m = json.load(f)

assert m["valid"], "model.json is not marked valid; rerun search_model.py"

N = m["n"]
K = m["n_colors"]
table = m["table"]
names = m["names"]
rows = {int(k): v for k, v in m["rows"].items()}
shells = {int(k): v for k, v in m["shells"].items()}
cap = m["cap"]
interior = m["interior"]
carrier = m["carrier"]


def row_color(c):
    return names["rT"] if c == 0 else names[f"row{c}"]


def finset(elems):
    return "{" + ", ".join(str(e) for e in sorted(elems)) + "}"


d_rows = ",\n    ".join(
    "![" + ", ".join(str(v) for v in table[x]) + "]" for x in range(N))
shell_c = ", ".join(str(shells[x]) for x in range(N))
shell_r = ", ".join(str(row_color(shells[x])) for x in range(N))

prop_fields = [
    "symm", "escape", "one_hit", "sink", "k4", "o1_mem_cap",
    "interior_subset_cap", "o1_not_mem_interior", "cap_subset_A",
    "four_lt_cap_card", "shell_center_mem", "shell_radius_pos",
    "shell_card", "shell_source_mem", "shell_critical",
    "p1_blocker_ne_o2", "p2_blocker_ne_o2", "p1_mem_marginal",
    "p2_mem_marginal", "p1_ne_p2", "rP_pos", "p1_survives", "p2_survives",
    "first_apex_double", "second_apex_double", "carrier_subset",
    "erased_off_cap", "erased_mate", "erased_mate_B0", "rT_pos",
    "terminal_card", "terminal_unique", "q_mem_marginal", "w_mem_marginal",
    "q_ne_w", "rho2_pos", "second_row_four", "second_row_eq_ambient",
    "second_row_survives",
]
props = "\n".join(f"  {f} := by decide" for f in prop_fields)

out = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CaptureIncidenceInterface

/-!
# Finite countermodel for the R-branch capture frontier interface

GENERATED FILE — produced by `emit_lean.py` from the `model.json` built and
exhaustively checked by `search_model.py`.  Do not edit by hand; regenerate.

A concrete `CaptureFrontierInterface (Fin {N}) (Fin {K})` instance: every
enumerated reachable incidence fact of the frontier holds simultaneously in a
{N}-point structure, checked by kernel `decide`.  Its existence shows the
interface facts are consistent, so no argument using only those facts can
derive `False` — and, since `false_of_abstractCapture` refutes the capture
packet from the interface facts alone, none can produce the capture packet.
-/

namespace Problem97
namespace ATailForce
namespace CaptureInsufficiency

set_option maxRecDepth 40000
set_option maxHeartbeats 8000000

/-- The {N}-point distance table (symmetric; forced equalities only on the
per-center K4 rows and the named first-apex groups). -/
def dTab : Fin {N} → Fin {N} → Fin {K} :=
  ![{d_rows}]

/-- Shell-center choice: each point lies on its center's exact 4-row. -/
def shellC : Fin {N} → Fin {N} := ![{shell_c}]

/-- Shell radius: the row color of the chosen center. -/
def shellR : Fin {N} → Fin {K} := ![{shell_r}]

/-- The countermodel.  Roles: 0 = o1, 1 = o2, 2 = interior center,
3/4 = terminal pair, 5/6 = rest of terminal row, 7–9 = second-apex row,
10/11 = frontier erased pair, 12/13 = descent erased pair,
14–16 = extra surplus-cap points. -/
def countermodel : CaptureFrontierInterface (Fin {N}) (Fin {K}) where
  rpos _ := True
  A := Finset.univ
  d := dTab
  o1 := 0
  o2 := 1
  cap := {finset(cap)}
  interior := {finset(interior)}
  p1 := 10
  p2 := 11
  q := 3
  w := 4
  rP := {names["rP"]}
  rT := {names["rT"]}
  rho2 := {names["rho2"]}
  carrier := {finset(carrier)}
  shellCenter := shellC
  shellRadius := shellR
{props}

/-- The enumerated frontier interface facts are simultaneously satisfiable:
no incidence-only derivation of `False` (hence of the capture packet) exists
over this signature. -/
theorem countermodel_exists :
    Nonempty (CaptureFrontierInterface (Fin {N}) (Fin {K})) :=
  ⟨countermodel⟩

/-- Sanity: as in every model, the abstract capture packet is empty here. -/
theorem countermodel_capture_free : IsEmpty (AbstractCapture countermodel) :=
  ⟨fun L => false_of_abstractCapture countermodel L⟩

#print axioms countermodel_exists
#print axioms countermodel_capture_free

end CaptureInsufficiency
end ATailForce
end Problem97
"""

path = os.path.join(HERE, "CaptureIncidenceCountermodel.lean")
with open(path, "w") as f:
    f.write(out)
print(f"wrote {path} (N={N}, K={K})")
