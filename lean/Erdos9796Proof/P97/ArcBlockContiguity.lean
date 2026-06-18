import Erdos9796Proof.P97.ConvexCyclicOrder.Basic
import Erdos9796Proof.P97.Cap.Structure

/-!
# Arc-block contiguity (the `glue` hard core for `U1n-b2b1c`)

**Work in progress — not yet imported by the `Erdos9796Proof` aggregator.**

The strict-lap nonreturn foreclosure `Problem97.strictLapPacket_nonreturn`
(`WitnessLapInterface.lean`) consumes a `glue` hypothesis: the three cap-local
orders embed order-preservingly into one global convex-polygon boundary order.
The geometric fact underneath is **arc-block contiguity** — each cap (the
`A`-points on one MEC arc, `CapTriple.arc_membership` via the signed-area chord
predicate `OnArcOpposite`) occupies a *contiguous index block* of the global CCW
enumeration `exists_isCcwConvexPolygon_of_convexIndep`.

The reduction (classical): a cap is exactly the polygon vertices on one side of
the line through two of its own (Moser) vertices, and "vertices on one side of a
chord, in a CCW convex polygon, form a contiguous arc" is affine-sign
unimodality — a line meets a convex boundary in at most two points.

This module isolates that core as `onArc_iff_between` and proves the immediate
direction (`signedArea2_pos_of_between`) from `IsCcwConvexPolygon.sign_oangle`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- **Between ⟹ +side.** In a CCW convex polygon, a vertex at a strictly-between
index lies on the positive side of the chord through the two bracketing vertices.
Immediate from `IsCcwConvexPolygon.sign_oangle` (central vertex `φ i`) bridged to
`signedArea2` by `signedArea2_sign_eq_oangle_sign`. -/
theorem signedArea2_pos_of_between {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {ia i ib : Fin n} (h1 : ia < i) (h2 : i < ib) :
    0 < Problem97.signedArea2 (φ i) (φ ia) (φ ib) := by
  have hane : φ ia ≠ φ i := hφ.ne (ne_of_lt h1)
  have hbne : φ ib ≠ φ i := (hφ.ne (ne_of_lt h2)).symm
  have hsign : SignType.sign (Problem97.signedArea2 (φ i) (φ ia) (φ ib)) = 1 := by
    rw [Problem97.signedArea2_sign_eq_oangle_sign (φ i) (φ ia) (φ ib) hane hbne]
    change (∡ (φ ia) (φ i) (φ ib)).sign = 1
    exact hccw.sign_oangle h1 h2
  exact sign_eq_one_iff.mp hsign

/-- **Cap-arc contiguity (target).** The polygon vertices strictly on the positive
side of the chord through two vertices `φ ia`, `φ ib` (`ia < ib`) are *exactly*
those at strictly-between indices.  The `→` for between-indices is
`signedArea2_pos_of_between`; the converse (outside indices give a non-positive
side, the second crossing of the chord) is the remaining affine-sign-unimodality
content. -/
theorem onArc_iff_between {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {ia ib : Fin n} (hab : ia < ib) (i : Fin n) :
    0 < Problem97.signedArea2 (φ i) (φ ia) (φ ib) ↔ (ia < i ∧ i < ib) := by
  constructor
  · -- `→`: contrapositive. `¬(ia < i ∧ i < ib)` is `i ≤ ia ∨ ib ≤ i`.
    intro hpos
    by_contra hcon
    push_neg at hcon
    -- Show `signedArea2 (φ i) (φ ia) (φ ib) ≤ 0`, contradicting `hpos`.
    have hle : Problem97.signedArea2 (φ i) (φ ia) (φ ib) ≤ 0 := by
      rcases le_or_gt i ia with hia | hia
      · -- `i ≤ ia`: either `i = ia` (degenerate, area `0`) or `i < ia`.
        rcases eq_or_lt_of_le hia with rfl | hlt
        · -- `i = ia`: vertex `φ i` coincides with `φ ia`, area `0`.
          unfold Problem97.signedArea2
          ring_nf
          rfl
        · -- `i < ia < ib`: the sign is `-1`.
          have hane : φ ia ≠ φ i := hφ.ne (ne_of_gt hlt)
          have hbne : φ ib ≠ φ i := hφ.ne (ne_of_gt (hlt.trans hab))
          have hsign : SignType.sign (Problem97.signedArea2 (φ i) (φ ia) (φ ib)) = -1 := by
            rw [Problem97.signedArea2_sign_eq_oangle_sign (φ i) (φ ia) (φ ib) hane hbne]
            change (∡ (φ ia) (φ i) (φ ib)).sign = -1
            rw [EuclideanGeometry.oangle_rev, Real.Angle.sign_neg,
                hccw.sign_oangle'' hlt hab]
          exact le_of_lt (sign_eq_neg_one_iff.mp hsign)
      · -- `ia < i`, so from `hcon` we get `ib ≤ i`.
        have hib : ib ≤ i := hcon hia
        rcases eq_or_lt_of_le hib with rfl | hlt
        · -- `ib = i`: vertex `φ i` coincides with `φ ib`, area `0`.
          unfold Problem97.signedArea2
          ring_nf
          rfl
        · -- `ia < ib < i`: the sign is `-1`.
          have hane : φ ia ≠ φ i := hφ.ne (ne_of_lt (hab.trans hlt))
          have hbne : φ ib ≠ φ i := hφ.ne (ne_of_lt hlt)
          have hsign : SignType.sign (Problem97.signedArea2 (φ i) (φ ia) (φ ib)) = -1 := by
            rw [Problem97.signedArea2_sign_eq_oangle_sign (φ i) (φ ia) (φ ib) hane hbne]
            change (∡ (φ ia) (φ i) (φ ib)).sign = -1
            rw [EuclideanGeometry.oangle_rev, Real.Angle.sign_neg,
                hccw.sign_oangle' hab hlt]
          exact le_of_lt (sign_eq_neg_one_iff.mp hsign)
    linarith
  · -- `←`: exactly `signedArea2_pos_of_between`.
    rintro ⟨h1, h2⟩
    exact signedArea2_pos_of_between hccw hφ h1 h2

/-- **Outside ⟹ −side.** In a CCW convex polygon, a vertex at an index
strictly outside the closed interval `[ia, ib]` (i.e. `i < ia` or `ib < i`)
lies on the *negative* side of the chord through the bracketing vertices.
The two index orderings invoke `sign_oangle''` / `sign_oangle'` respectively;
both are bridged through `oangle_rev`. -/
theorem signedArea2_neg_of_outside {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {ia i ib : Fin n} (hab : ia < ib) (hi : i < ia ∨ ib < i) :
    Problem97.signedArea2 (φ i) (φ ia) (φ ib) < 0 := by
  have hsign : SignType.sign (Problem97.signedArea2 (φ i) (φ ia) (φ ib)) = -1 := by
    rcases hi with hlt | hlt
    · -- `i < ia < ib`.
      have hane : φ ia ≠ φ i := hφ.ne (ne_of_gt hlt)
      have hbne : φ ib ≠ φ i := hφ.ne (ne_of_gt (hlt.trans hab))
      rw [Problem97.signedArea2_sign_eq_oangle_sign (φ i) (φ ia) (φ ib) hane hbne]
      change (∡ (φ ia) (φ i) (φ ib)).sign = -1
      rw [EuclideanGeometry.oangle_rev, Real.Angle.sign_neg,
          hccw.sign_oangle'' hlt hab]
    · -- `ia < ib < i`.
      have hane : φ ia ≠ φ i := hφ.ne (ne_of_lt (hab.trans hlt))
      have hbne : φ ib ≠ φ i := hφ.ne (ne_of_lt hlt)
      rw [Problem97.signedArea2_sign_eq_oangle_sign (φ i) (φ ia) (φ ib) hane hbne]
      change (∡ (φ ia) (φ i) (φ ib)).sign = -1
      rw [EuclideanGeometry.oangle_rev, Real.Angle.sign_neg,
          hccw.sign_oangle' hab hlt]
  exact sign_eq_neg_one_iff.mp hsign

/-- **Endpoint ⟹ degenerate.** When the observed vertex coincides (in index)
with one of the chord endpoints, the signed area is exactly `0`. -/
theorem signedArea2_eq_zero_of_endpoint {n : ℕ} {φ : Fin n → ℝ²}
    {ia ib i : Fin n} (hi : i = ia ∨ i = ib) :
    Problem97.signedArea2 (φ i) (φ ia) (φ ib) = 0 := by
  rcases hi with rfl | rfl <;> · unfold Problem97.signedArea2; ring

/-- **Signed-area trichotomy on the chord `(φ ia, φ ib)` (`ia < ib`).**
Exactly one of three regimes holds for the side of `φ i`:

* strictly *between* indices ⟹ strictly positive (interior of the arc);
* *at* an endpoint index ⟹ exactly zero (on the chord, the closed-cap boundary);
* strictly *outside* the index interval ⟹ strictly negative.

This packages `signedArea2_pos_of_between`, `signedArea2_eq_zero_of_endpoint`,
and `signedArea2_neg_of_outside` into the affine-sign-unimodality statement that
a chord meets the convex boundary in at most two points. -/
theorem signedArea2_trichotomy {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {ia ib : Fin n} (hab : ia < ib) (i : Fin n) :
    (0 < Problem97.signedArea2 (φ i) (φ ia) (φ ib) ↔ (ia < i ∧ i < ib)) ∧
    (Problem97.signedArea2 (φ i) (φ ia) (φ ib) = 0 ↔ (i = ia ∨ i = ib)) ∧
    (Problem97.signedArea2 (φ i) (φ ia) (φ ib) < 0 ↔ (i < ia ∨ ib < i)) := by
  refine ⟨onArc_iff_between hccw hφ hab i, ⟨?_, fun hi => signedArea2_eq_zero_of_endpoint hi⟩,
    ⟨?_, fun hi => signedArea2_neg_of_outside hccw hφ hab hi⟩⟩
  · -- `= 0 → endpoint`: rule out the strict-between (+) and strict-outside (−) regimes.
    intro hz
    by_contra hcon
    push_neg at hcon
    obtain ⟨hne_a, hne_b⟩ := hcon
    -- `i` is neither endpoint, so it is strictly between or strictly outside.
    rcases lt_trichotomy i ia with h | h | h
    · have := signedArea2_neg_of_outside hccw hφ hab (Or.inl h); linarith
    · exact hne_a h
    · rcases lt_trichotomy i ib with h2 | h2 | h2
      · have := signedArea2_pos_of_between hccw hφ h h2; linarith
      · exact hne_b h2
      · have := signedArea2_neg_of_outside hccw hφ hab (Or.inr h2); linarith
  · -- `< 0 → outside`: rule out the between (+) and endpoint (0) regimes.
    intro hn
    by_contra hcon
    push_neg at hcon
    obtain ⟨hge_a, hle_b⟩ := hcon
    -- `ia ≤ i` and `i ≤ ib`. Split into endpoint vs strictly between.
    rcases eq_or_lt_of_le hge_a with rfl | h
    · simp [signedArea2_eq_zero_of_endpoint (Or.inl rfl)] at hn
    · rcases eq_or_lt_of_le hle_b with rfl | h2
      · simp [signedArea2_eq_zero_of_endpoint (Or.inr rfl)] at hn
      · have := signedArea2_pos_of_between hccw hφ h h2; linarith

/-- **Cap-as-index-block (closed-cap form).**  Fix the global CCW enumeration
`φ`.  Take the chord through two vertices at indices `ia < ib`, and let `ic`
be a *reference* index strictly outside `[ia, ib]` — geometrically the opposite
Moser apex `v1`, which never lies between its own opposite cap endpoints.  Then
the closed cap `OnArcOpposite (φ ic) (φ ia) (φ ib)` (the `≤ 0`-product
chord-separation predicate, central chord `(φ ia, φ ib)`, reference `φ ic`) is
*exactly* the contiguous closed index block `[ia, ib]`:

    `OnArcOpposite (φ ic) (φ ia) (φ ib) (φ i)  ↔  ia ≤ i ∧ i ≤ ib`.

Read against `CapStructure.lean`: with `M.v1 = φ ic`, `M.v2 = φ ia`,
`M.v3 = φ ib` and `ia < ib`, the cap `C1 = {v ∈ A | OnArcOpposite v1 v2 v3 v}`
is precisely the φ-vertices at indices in `[ia, ib]`, i.e. those strictly
between `iv2` and `iv3` together with the two endpoints — a contiguous block,
on the side away from `v1`.

The hypothesis `hc : ic < ia ∨ ib < ic` is the faithful combinatorial shadow
of "the opposite apex `v1` is not between `v2` and `v3`"; it is exactly what
the Moser-triangle structure supplies (and is *not* derivable inside this
isolated module — see the residual note below). -/
theorem onArcOpposite_iff_index_block {n : ℕ} {φ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ) (hφ : Function.Injective φ)
    {ia ib ic : Fin n} (hab : ia < ib) (hc : ic < ia ∨ ib < ic) (i : Fin n) :
    Problem97.OnArcOpposite (φ ic) (φ ia) (φ ib) (φ i) ↔ (ia ≤ i ∧ i ≤ ib) := by
  -- The reference apex `φ ic` is on the strictly-negative side of the chord.
  have hcneg : Problem97.signedArea2 (φ ic) (φ ia) (φ ib) < 0 :=
    signedArea2_neg_of_outside hccw hφ hab hc
  obtain ⟨hpos, hzero, hneg⟩ := signedArea2_trichotomy hccw hφ hab i
  unfold Problem97.OnArcOpposite
  constructor
  · -- `product ≤ 0` with the second factor `< 0` forces the first factor `≥ 0`,
    -- i.e. `φ i` is between-or-at-endpoint ⟹ `ia ≤ i ≤ ib`.
    intro hprod
    have hge : 0 ≤ Problem97.signedArea2 (φ i) (φ ia) (φ ib) :=
      nonneg_of_mul_nonpos_left hprod hcneg
    rcases lt_or_eq_of_le hge with hgt | heq
    · -- strictly positive ⟹ strictly between.
      obtain ⟨h1, h2⟩ := hpos.mp hgt
      exact ⟨le_of_lt h1, le_of_lt h2⟩
    · -- exactly zero ⟹ at an endpoint.
      rcases hzero.mp heq.symm with rfl | rfl
      · exact ⟨le_refl _, le_of_lt hab⟩
      · exact ⟨le_of_lt hab, le_refl _⟩
  · -- `ia ≤ i ≤ ib` ⟹ first factor `≥ 0`; times the negative second factor `≤ 0`.
    rintro ⟨hia, hib⟩
    have hge : 0 ≤ Problem97.signedArea2 (φ i) (φ ia) (φ ib) := by
      rcases eq_or_lt_of_le hia with rfl | h1
      · exact le_of_eq (signedArea2_eq_zero_of_endpoint (Or.inl rfl)).symm
      · rcases eq_or_lt_of_le hib with rfl | h2
        · exact le_of_eq (signedArea2_eq_zero_of_endpoint (Or.inr rfl)).symm
        · exact le_of_lt (signedArea2_pos_of_between hccw hφ h1 h2)
    exact mul_nonpos_of_nonneg_of_nonpos hge (le_of_lt hcneg)

end Problem97
