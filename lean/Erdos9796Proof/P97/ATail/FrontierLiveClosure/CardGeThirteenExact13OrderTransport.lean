/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenValuation

/-!
# Exact-thirteen order transport

The finite valuation records the raw-label orders and the corresponding
raw-label-to-position maps separately.  This module records their finite
compatibility, so an orientation equation for a live ingress can be used
directly by positional certificate consumers.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactThirteenValuation

/-- The direct raw-label list maps to the canonical increasing positional list. -/
theorem directOrder_map_directIndex (p : Profile) :
    (directOrder p).map (directIndex p) = List.ofFn id := by
  cases p <;> decide

/-- The reflected raw-label list maps to the canonical increasing positional list. -/
theorem mirrorOrder_map_mirrorIndex (p : Profile) :
    (mirrorOrder p).map (mirrorIndex p) = List.ofFn id := by
  cases p <;> decide

/-- The direct order has strictly increasing positional labels. -/
theorem directOrder_pairwise_directIndex_lt (p : Profile) :
    (directOrder p).Pairwise (fun a b => directIndex p a < directIndex p b) := by
  cases p <;> decide

/-- The reflected order has strictly increasing positional labels. -/
theorem mirrorOrder_pairwise_mirrorIndex_lt (p : Profile) :
    (mirrorOrder p).Pairwise (fun a b => mirrorIndex p a < mirrorIndex p b) := by
  cases p <;> decide

/-- An ingress with the direct orientation transports its raw order to positions. -/
theorem directOrder_map_idx_of_eq {p : Profile} {idx : Fin 13 → Fin 13}
    (hidx : idx = directIndex p) :
    (directOrder p).map idx = List.ofFn id := by
  rw [hidx]
  exact directOrder_map_directIndex p

/-- An ingress with the reflected orientation transports its raw order to positions. -/
theorem mirrorOrder_map_idx_of_eq {p : Profile} {idx : Fin 13 → Fin 13}
    (hidx : idx = mirrorIndex p) :
    (mirrorOrder p).map idx = List.ofFn id := by
  rw [hidx]
  exact mirrorOrder_map_mirrorIndex p

/-- The direct orientation gives a strictly increasing positional raw order. -/
theorem directOrder_pairwise_idx_lt_of_eq {p : Profile} {idx : Fin 13 → Fin 13}
    (hidx : idx = directIndex p) :
    (directOrder p).Pairwise (fun a b => idx a < idx b) := by
  rw [hidx]
  exact directOrder_pairwise_directIndex_lt p

/-- The reflected orientation gives a strictly increasing positional raw order. -/
theorem mirrorOrder_pairwise_idx_lt_of_eq {p : Profile} {idx : Fin 13 → Fin 13}
    (hidx : idx = mirrorIndex p) :
    (mirrorOrder p).Pairwise (fun a b => idx a < idx b) := by
  rw [hidx]
  exact mirrorOrder_pairwise_mirrorIndex_lt p

end DRExactThirteenValuation
end ATailFrontierLiveClosure
end Problem97
