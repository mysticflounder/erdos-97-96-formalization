/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Abstract incidence interface of the R-branch capture frontier

This scratch module states, over an arbitrary point type and an arbitrary
distance-value type, exactly the incidence-shaped facts reachable at the
`DoubleSurvivalBranchProducer` frontier — the hypotheses available to any
producer of `StrictSurplusRowCapturesErasedPair`.

Every field is the abstract image of one named reachable Lean fact; the
realization module instantiates the structure over `(ℝ², ℝ)` field-by-field
from those facts, and the countermodel module instantiates it over
`(Fin 17, Fin K)` by `decide`.  Together they prove:

* the enumerated interface facts are simultaneously satisfiable in a finite
  incidence structure (consistency), and
* the abstract capture packet is refuted by the interface facts alone in
  every model (`false_of_abstractCapture`), mirroring the proved sink
  `false_of_strictSurplusRowCapturesErasedPair`.

Hence no argument that uses only these facts can derive `False` — and since
capture implies `False`, none can produce the capture packet.  Any closing
argument must use content outside this signature (Euclidean/metric facts,
cap-triple structure beyond the listed fields, MEC or convex-position data,
or new production theorems).

Facts deliberately NOT in the signature (boundary of the claim): the
`FirstApexSplit`/`SecondApexSplit` disjunctions (their relevant arms are
already fields), the cap-triple partition beyond `cap`/`interior`/`o1`
membership facts, hull/convex order, exact `SelectedFourClass` label data,
and every theorem not consumed at this frontier.
-/

namespace Problem97
namespace ATailForce
namespace CaptureInsufficiency

/-- The incidence facts reachable at the R-branch capture frontier.

Realization dictionary (real source for each field):
* `symm` — `dist_comm`
* `escape` — `U2NonSurplusSqueeze.oppCap2_escape_gen`
* `one_hit` — `U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit`
* `sink` — `RobustLiveBankAdapter.false_of_surplusInterior_bisects_marginalPair`
* `k4` — `CounterexampleData.K4`
* `o1_mem_cap`, `interior_subset_cap`, `o1_not_mem_interior` — the
  `RobustLiveBankAdapter` cap lemmas
* `cap_subset_A` — `surplusCap_subset_A`; `four_lt_cap_card` — `surplus`
* `shell_*` — `CriticalShellSystem` via `CriticalFourShell`
  (`center_mem`, `radius_pos`, `support_eq` + `support_card`,
  `q_mem_support`) and `no_qfree`
* `p*_blocker_ne_o2` — `SurvivorPairRelocationPacket.q/w_blocker_ne_oppApex2`
* `p*_mem_marginal`, `p1_ne_p2` — `SurvivorPairRelocationPacket`
* `rP_pos` — `CriticalPairFrontier.radius_pos`
* `p*_survives` — `SurvivorPairRelocationPacket.q/w_survives`
* `first_apex_double` — the R-arm hypothesis of `FirstApexSplit`
* `second_apex_double` — `CriticalPairFrontier.secondApexDouble`
* `carrier_subset`, `erased_off_cap`, `erased_mate`, `erased_mate_B0` —
  `PairErasureHistory` (ambient and `B0`-level)
* terminal fields — `FirstApexTerminalWithHistory`

`first_k4` on the carrier and the `CoradialErasedPair` record are derivable
(`terminal_card` + `rT_pos`; `p1/p2` are an erased co-radial pair) and are
not separate fields. -/
structure CaptureFrontierInterface (Point R : Type*)
    [DecidableEq Point] [DecidableEq R] where
  /-- Abstract positivity predicate on distance values. -/
  rpos : R → Prop
  /-- Ambient carrier (abstracts `D.A`). -/
  A : Finset Point
  /-- Abstract distance, center-first (abstracts `dist`). -/
  d : Point → Point → R
  /-- First opposite apex (abstracts `S.oppApex1`). -/
  o1 : Point
  /-- Second opposite apex (abstracts `S.oppApex2`). -/
  o2 : Point
  /-- Surplus cap (abstracts `S.surplusCap`). -/
  cap : Finset Point
  /-- Strict surplus-cap interior (abstracts
  `S.capInteriorByIndex S.surplusIdx`). -/
  interior : Finset Point
  /-- Frontier pair (abstracts `F.pair.q`, `F.pair.w`). -/
  p1 : Point
  p2 : Point
  /-- Terminal pair (abstracts `N.terminal.q`, `N.terminal.w`). -/
  q : Point
  w : Point
  /-- Frontier radius, terminal first-apex radius, fixed second-apex
  radius. -/
  rP : R
  rT : R
  rho2 : R
  /-- Terminal carrier (abstracts `N.terminal.carrier`). -/
  carrier : Finset Point
  /-- Critical shell system choice data (abstracts `H.centerAt`,
  shell radius). -/
  shellCenter : Point → Point
  shellRadius : Point → R
  -- basic
  symm : ∀ x y, d x y = d y x
  -- bank kernels
  escape : ∀ x y, x ∈ A → y ∈ A → x ∉ cap → y ∉ cap → x ≠ y →
    d o1 x = d o1 y → d o2 x ≠ d o2 y
  one_hit : ∀ r : R, ((A.filter fun x => d o1 x = r) ∩ cap).card ≤ 1
  sink : ∀ z x y, z ∈ interior → x ∈ A → y ∈ A → x ∉ cap → y ∉ cap →
    x ≠ y → d o1 x = d o1 y → d z x ≠ d z y
  -- global K4
  k4 : ∀ p ∈ A, ∃ r : R, rpos r ∧ 4 ≤ (A.filter fun x => d p x = r).card
  -- cap facts
  o1_mem_cap : o1 ∈ cap
  interior_subset_cap : interior ⊆ cap
  o1_not_mem_interior : o1 ∉ interior
  cap_subset_A : cap ⊆ A
  four_lt_cap_card : 4 < cap.card
  -- shell system
  shell_center_mem : ∀ x ∈ A, shellCenter x ∈ A.erase x
  shell_radius_pos : ∀ x ∈ A, rpos (shellRadius x)
  shell_card : ∀ x ∈ A,
    (A.filter fun y => d (shellCenter x) y = shellRadius x).card = 4
  shell_source_mem : ∀ x ∈ A, d (shellCenter x) x = shellRadius x
  shell_critical : ∀ x ∈ A, ∀ r : R, rpos r →
    ((A.erase x).filter fun y => d (shellCenter x) y = r).card ≤ 3
  p1_blocker_ne_o2 : shellCenter p1 ≠ o2
  p2_blocker_ne_o2 : shellCenter p2 ≠ o2
  -- frontier pair
  p1_mem_marginal : p1 ∈ (A.filter fun x => d o1 x = rP) \ cap
  p2_mem_marginal : p2 ∈ (A.filter fun x => d o1 x = rP) \ cap
  p1_ne_p2 : p1 ≠ p2
  rP_pos : rpos rP
  p1_survives : ∃ r : R, rpos r ∧
    4 ≤ ((A.erase p1).filter fun x => d o2 x = r).card
  p2_survives : ∃ r : R, rpos r ∧
    4 ≤ ((A.erase p2).filter fun x => d o2 x = r).card
  -- R-arm entry
  first_apex_double : ∃ r : R, rpos r ∧
    4 ≤ (((A.erase p1).erase p2).filter fun x => d o1 x = r).card
  second_apex_double : ∃ r : R, rpos r ∧
    4 ≤ (((A.erase p1).erase p2).filter fun x => d o2 x = r).card
  -- terminal normal-form data
  carrier_subset : carrier ⊆ (A.erase p1).erase p2
  erased_off_cap : ∀ x, x ∈ A \ carrier → x ∉ cap
  erased_mate : ∀ x, x ∈ A \ carrier →
    ∃ y, y ∈ A \ carrier ∧ y ≠ x ∧ d o1 y = d o1 x
  erased_mate_B0 : ∀ x, x ∈ ((A.erase p1).erase p2) \ carrier →
    ∃ y, y ∈ ((A.erase p1).erase p2) \ carrier ∧ y ≠ x ∧ d o1 y = d o1 x
  rT_pos : rpos rT
  terminal_card : (carrier.filter fun x => d o1 x = rT).card = 4 ∨
    (carrier.filter fun x => d o1 x = rT).card = 5
  terminal_unique : ∀ r : R, rpos r →
    4 ≤ (carrier.filter fun x => d o1 x = r).card → r = rT
  q_mem_marginal : q ∈ (carrier.filter fun x => d o1 x = rT) \ cap
  w_mem_marginal : w ∈ (carrier.filter fun x => d o1 x = rT) \ cap
  q_ne_w : q ≠ w
  rho2_pos : rpos rho2
  second_row_four : 4 ≤ (carrier.filter fun x => d o2 x = rho2).card
  second_row_eq_ambient : carrier.filter (fun x => d o2 x = rho2) =
    ((A.erase p1).erase p2).filter fun x => d o2 x = rho2
  second_row_survives :
    4 ≤ (((carrier.erase q).erase w).filter fun x => d o2 x = rho2).card

variable {Point R : Type*} [DecidableEq Point] [DecidableEq R]

/-- The abstract capture packet: the exact image of
`StrictSurplusRowCapturesErasedPair` (an erased co-radial pair, a strict
surplus-interior center, and a card-four equidistant row at that center
containing both pair members). -/
structure AbstractCapture (M : CaptureFrontierInterface Point R) where
  x : Point
  y : Point
  x_mem_erased : x ∈ M.A \ M.carrier
  y_mem_erased : y ∈ M.A \ M.carrier
  x_ne_y : x ≠ y
  same_radius : M.d M.o1 x = M.d M.o1 y
  z : Point
  z_mem_interior : z ∈ M.interior
  support : Finset Point
  support_subset_A : support ⊆ M.A
  support_card : support.card = 4
  radius : R
  radius_pos : M.rpos radius
  support_eq_radius : ∀ u ∈ support, M.d z u = radius
  center_not_mem : z ∉ support
  x_mem_support : x ∈ support
  y_mem_support : y ∈ support

/-- The interface facts refute the abstract capture packet in every model —
the abstract mirror of `false_of_strictSurplusRowCapturesErasedPair`.
Consequently, producing the capture packet from the interface facts is
exactly producing `False` from them; the countermodel shows neither is
possible. -/
theorem false_of_abstractCapture (M : CaptureFrontierInterface Point R)
    (L : AbstractCapture M) : False := by
  have hxA : L.x ∈ M.A := (Finset.mem_sdiff.mp L.x_mem_erased).1
  have hyA : L.y ∈ M.A := (Finset.mem_sdiff.mp L.y_mem_erased).1
  have hxOff : L.x ∉ M.cap := M.erased_off_cap L.x L.x_mem_erased
  have hyOff : L.y ∉ M.cap := M.erased_off_cap L.y L.y_mem_erased
  have hzx : M.d L.z L.x = L.radius :=
    L.support_eq_radius L.x L.x_mem_support
  have hzy : M.d L.z L.y = L.radius :=
    L.support_eq_radius L.y L.y_mem_support
  exact M.sink L.z L.x L.y L.z_mem_interior hxA hyA hxOff hyOff
    L.x_ne_y L.same_radius (hzx.trans hzy.symm)

/-- The carrier-level first-apex K4 statement is derivable from the terminal
fields; recorded as a lemma so the signature carries no redundant field. -/
theorem carrier_first_k4 (M : CaptureFrontierInterface Point R) :
    ∃ r : R, M.rpos r ∧
      4 ≤ (M.carrier.filter fun x => M.d M.o1 x = r).card := by
  refine ⟨M.rT, M.rT_pos, ?_⟩
  rcases M.terminal_card with h | h <;> omega

/-- The `CoradialErasedPair` record is derivable: the frontier pair is an
erased co-radial pair. -/
theorem frontier_pair_erased_coradial (M : CaptureFrontierInterface Point R) :
    M.p1 ∈ M.A \ M.carrier ∧ M.p2 ∈ M.A \ M.carrier ∧ M.p1 ≠ M.p2 ∧
      M.d M.o1 M.p1 = M.d M.o1 M.p2 := by
  have hp1A : M.p1 ∈ M.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp M.p1_mem_marginal).1).1
  have hp2A : M.p2 ∈ M.A :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp M.p2_mem_marginal).1).1
  have hp1r : M.d M.o1 M.p1 = M.rP :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp M.p1_mem_marginal).1).2
  have hp2r : M.d M.o1 M.p2 = M.rP :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp M.p2_mem_marginal).1).2
  have hp1NotC : M.p1 ∉ M.carrier := fun hc =>
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (M.carrier_subset hc)).2).1 rfl
  have hp2NotC : M.p2 ∉ M.carrier := fun hc =>
    (Finset.mem_erase.mp (M.carrier_subset hc)).1 rfl
  exact ⟨Finset.mem_sdiff.mpr ⟨hp1A, hp1NotC⟩,
    Finset.mem_sdiff.mpr ⟨hp2A, hp2NotC⟩,
    M.p1_ne_p2, hp1r.trans hp2r.symm⟩

#print axioms false_of_abstractCapture
#print axioms carrier_first_k4
#print axioms frontier_pair_erased_coradial

end CaptureInsufficiency
end ATailForce
end Problem97
