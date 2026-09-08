/- Generated theorem stub from Erdos9796Proof.P97.ConvexCyclicOrder.Basic by Stage 2 proof cut; source SHA-256 f1ec282e547e3f3ca8edca05b96111ec2591b61f6aeecd11c668396d093955a1 -/
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
open Problem97




/-!
# Convex cyclic order wrapper around `IsCcwConvexPolygon`

This module supplies a thin wrapper around the upstream predicate
`EuclideanGeometry.IsCcwConvexPolygon` (from
`FormalConjecturesForMathlib.Geometry.2d`) suited to the Nivasch–Pach–Pinchasi–Zerbib 2013
Lemma 6 sign-stability arguments consumed downstream by the CGN counting
bridge.

The key downstream consumer needs the statement "four points
`p, q, r, s` appear in this cyclic order on the convex-hull boundary
of `A`" plus an immediate algebraic API:

* `Problem97.ConvexCyclicOrder A p q r s` — the wrapper predicate.
* `oangle_sign_{pqr,qrs,pqs,prs}` — direct sign extraction for the
  four oriented angles whose central vertex is in the interior of
  the index sequence (immediate from `IsCcwConvexPolygon.sign_oangle`).
* `signedArea2_sign_stable_{pq, qr_chord}` — sign-stability of the
  `signedArea2` predicate as the third/first point varies along the
  cyclic order. Bridges via `signedArea2_sign_eq_oangle_sign` in
  `SignedAreaOangle`.

All proofs are mechanical composition of `IsCcwConvexPolygon.sign_oangle*`
with `signedArea2_sign_eq_oangle_sign`. No axioms are introduced.

## Step 1 scope

This file is the Step 1 wrapper.  It now includes the generic cyclic-shift
transport for `IsCcwConvexPolygon`, enough to change the linear cut of a
global boundary enumeration.  The higher-level
`ConvexCyclicOrder.rotate`/`ConvexCyclicOrder.reverse` wrapper API is still
deferred to Step 2.  Reversal flips chirality, so a faithful Step-2 reverse
should wrap upstream `IsConvexPolygon` (which already handles both
chiralities) rather than `IsCcwConvexPolygon`.
-/

open scoped EuclideanGeometry












theorem Problem97.hneg_cyclicShift {n : ℕ} {φ : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ i) (φ j) (φ k) < 0)
    (cut : Fin n) :
    ∀ {i j k : Fin n}, i < j → j < k →
      signedArea2 (φ (i + cut)) (φ (j + cut)) (φ (k + cut)) < 0 := by sorry









-- TODO Step 2: ConvexCyclicOrder.rotate — `ConvexCyclicOrder A p q r s
-- → ConvexCyclicOrder A q r s p`. The generic boundary-enumeration cyclic
-- shift above supplies the geometric transport; the remaining work is a
-- wrapper-level theorem that repacks the four witnesses.
--
-- TODO Step 2: ConvexCyclicOrder.reverse — reversing the cyclic order
-- flips CCW → CW. The faithful Step-2 form should be stated over
-- `IsConvexPolygon` (the chirality-agnostic predicate at
-- `FormalConjecturesForMathlib/Geometry/2d.lean`), not the CCW form.

/-! ### Direct oriented-angle sign extraction

For each triple `(x, y, z) ⊆ {p, q, r, s}` whose central vertex `y` is
in the *middle* of the cyclic index sequence, `IsCcwConvexPolygon.sign_oangle`
directly yields `(∡ x y z).sign = 1`. The four such triples are listed
below.
-/









/-! ### `signedArea2` sign-stability

Bridge the oriented-angle extraction above to the algebraic
`signedArea2` predicate via `Problem97.signedArea2_sign_eq_oangle_sign`.
Recall the convention `signedArea2 v vj vk ↔ ∡ vj v vk` (central vertex
is the *first* argument of `signedArea2`).
-/






