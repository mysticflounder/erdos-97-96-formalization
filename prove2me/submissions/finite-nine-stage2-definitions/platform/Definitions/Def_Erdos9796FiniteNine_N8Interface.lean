/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796FiniteNine_Forms

/-! Definition-only final N4/N8 interface used by the nine public child statements. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry
open Finset

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

def N4eCapContainment {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v1 x = r)).card →
      A.filter (fun x => dist S.triangle.v1 x = r) ⊆ S.CP.C1) ∧
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v2 x = r)).card →
      A.filter (fun x => dist S.triangle.v2 x = r) ⊆ S.CP.C2) ∧
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v3 x = r)).card →
      A.filter (fun x => dist S.triangle.v3 x = r) ⊆ S.CP.C3)

@[reducible] noncomputable def capByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.CP.C1
  | 1 => S.CP.C2
  | _ => S.CP.C3
@[reducible] noncomputable def capInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I1
  | 1 => S.I2
  | _ => S.I3

end FiniteEndpointShell
end Problem97
end Batch3N9
