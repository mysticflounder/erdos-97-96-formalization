/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U2NonSurplusOneHit
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# oppCap2 adjacent-cap escape at `oppApex1` — reflection kill

This file discharges the **oppCap2 branch** of the first-apex escape disjunction
`U2NonSurplusSqueeze.StrictAdjacentEscapeAtOppApex1`.  That disjunction splits an
exact-radius escape witness `x` into

* the *surplus branch* `x ∈ surplusCap \ (oppCap1 ∪ oppCap2)`, left as the named
  residual `surplusEscapeExcludedAtOppApex1_holds`, and
* the *oppCap2 branch* `x ∈ oppCap2 \ (surplusCap ∪ oppCap1)`, discharged here.

## oppCap2 branch mechanism (SEP reflection)

`x` is an `oppCap2`-private point on the `oppApex1` circle `Γ` (radius `r`).
The proven squeeze at `oppApex2` (`oppApex2_squeeze_of_isM44`) forces both
`oppCap2`-private points onto the `oppApex2` circle `Δ` (radius `ρ`, the `K4`
radius at `oppApex2`), so `x ∈ Δ`, and pins a unique `oppCap1`-hit `w'` of `Δ`.

* **Private sub-case** (`w' ∈ oppCap1 \ (surplusCap ∪ oppCap2)`): the squeeze at
  `oppApex1` puts `w'` on `Γ` as well, so `x` and `w'` lie on two common circles
  centred at the data points `oppApex1`, `oppApex2`.  The two-circle midpoint
  kernel (`twoCircle_midpoint_collinear` + `signedArea2_reflection_neg`) makes
  them mirror images across the chord `(oppApex1, oppApex2)`, flipping the signed
  area.  But cap membership is the *closed* signed-area chord test, so a point
  off `surplusCap` sits strictly on the `surplusApex` side of that chord; both
  `x` and `w'` are off `surplusCap`, so their signed areas share a sign — a
  contradiction with the flip.  Fully kernel-clean.

* **Endpoint sub-case** (`w'` a shared cap endpoint): the partition
  combinatorics force `w' = surplusApex` (both cap intersections are single
  Moser vertices, and `0 < ρ` excludes `oppApex2`).  If `surplusApex` also lies
  on the `oppApex1` circle, the pair `{x, surplusApex}` sits on two common
  circles and dies by the same reflection kill (both points are off the surplus
  cap).  The residual — `surplusApex` strictly off the `oppApex1` circle, so the
  kernel has no second circle — is carried as the named obligation
  `oppCap2_endpointEscape_false`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U2NonSurplusSqueeze

/- ### Same-side dictionary from the closed-cap signed-area test -/

/-- Surplus-cap membership is the closed signed-area chord test of chord
`(oppApex1, oppApex2)` against `surplusApex`. -/
theorem mem_surplusCap_iff_onArc (D : CounterexampleData) {x : ℝ²}
    (hxA : x ∈ D.A) :
    x ∈ D.packet.surplusCap ↔
      OnArcOpposite D.packet.surplusApex D.packet.oppApex1 D.packet.oppApex2 x := by
  set CP := D.packet.partition with hCP
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
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

/-- A carrier point off the surplus cap lies strictly on the same side of the
chord `(oppApex1, oppApex2)` as `surplusApex` (strictly, by the closed-cap
convention: the complement of the closed cap is the strict open side). -/
theorem signedArea2_mul_pos_of_not_mem_surplusCap (D : CounterexampleData)
    {x : ℝ²} (hxA : x ∈ D.A) (hx : x ∉ D.packet.surplusCap) :
    0 < signedArea2 x D.packet.oppApex1 D.packet.oppApex2 *
        signedArea2 D.packet.surplusApex D.packet.oppApex1 D.packet.oppApex2 := by
  rw [mem_surplusCap_iff_onArc D hxA] at hx
  unfold OnArcOpposite at hx
  exact not_le.mp hx

/- ### The private sub-case reflection kill -/

/-- **oppCap2 escape, private sub-case.**  Two distinct carrier points `x`, `w'`,
both off the surplus cap, cannot lie on a common circle about `oppApex1`
(radius `r`) and a common circle about `oppApex2` (radius `ρ`).

The two-circle midpoint kernel makes `x`, `w'` mirror images across chord
`(oppApex1, oppApex2)`, flipping the signed area; but both lie strictly on the
`surplusApex` side of that chord, so their signed areas share a sign. -/
theorem oppCap2_escape_private_false (D : CounterexampleData)
    {r ρ : ℝ} {x w' : ℝ²}
    (hxA : x ∈ D.A) (hw'A : w' ∈ D.A)
    (hx_notsurp : x ∉ D.packet.surplusCap)
    (hw'_notsurp : w' ∉ D.packet.surplusCap)
    (hne : x ≠ w')
    (hxv : dist x D.packet.oppApex1 = r) (hw'v : dist w' D.packet.oppApex1 = r)
    (hxw : dist x D.packet.oppApex2 = ρ) (hw'w : dist w' D.packet.oppApex2 = ρ) :
    False := by
  have hmid :
      signedArea2 (midpoint ℝ w' x) D.packet.oppApex1 D.packet.oppApex2 = 0 :=
    twoCircle_midpoint_collinear hxv hw'v hxw hw'w hne
  have hflip :
      signedArea2 x D.packet.oppApex1 D.packet.oppApex2 =
        - signedArea2 w' D.packet.oppApex1 D.packet.oppApex2 :=
    signedArea2_reflection_neg hmid
  have hxpos := signedArea2_mul_pos_of_not_mem_surplusCap D hxA hx_notsurp
  have hw'pos := signedArea2_mul_pos_of_not_mem_surplusCap D hw'A hw'_notsurp
  have hkey :
      signedArea2 x D.packet.oppApex1 D.packet.oppApex2 *
          signedArea2 D.packet.surplusApex D.packet.oppApex1 D.packet.oppApex2
        = -(signedArea2 w' D.packet.oppApex1 D.packet.oppApex2 *
          signedArea2 D.packet.surplusApex D.packet.oppApex1 D.packet.oppApex2) := by
    rw [hflip]; ring
  linarith [hxpos, hw'pos, hkey]

/- ### The (U1) chord dictionary: oppCap2 against chord `(surplusApex, oppApex1)` -/

/-- `oppCap2` membership is the closed signed-area chord test of chord
`(surplusApex, oppApex1)` against `oppApex2`. -/
theorem mem_oppCap2_iff_onArc (D : CounterexampleData) {x : ℝ²}
    (hxA : x ∈ D.A) :
    x ∈ D.packet.oppCap2 ↔
      OnArcOpposite D.packet.oppApex2 D.packet.surplusApex D.packet.oppApex1 x := by
  set CP := D.packet.partition with hCP
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).2.2
  · simpa [SurplusCapPacket.oppCap2, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).1
  · simpa [SurplusCapPacket.oppCap2, SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, CP, hi]
      using (CP.arc_membership x hxA).2.1

/-- A carrier point off `oppCap2` lies strictly on the same side of the chord
`(surplusApex, oppApex1)` as `oppApex2`. -/
theorem signedArea2_mul_pos_of_not_mem_oppCap2 (D : CounterexampleData)
    {x : ℝ²} (hxA : x ∈ D.A) (hx : x ∉ D.packet.oppCap2) :
    0 < signedArea2 x D.packet.surplusApex D.packet.oppApex1 *
        signedArea2 D.packet.oppApex2 D.packet.surplusApex D.packet.oppApex1 := by
  rw [mem_oppCap2_iff_onArc D hxA] at hx
  unfold OnArcOpposite at hx
  exact not_le.mp hx

/-- **(U1) reflection kill against `oppCap2`.**  Two distinct carrier points
`x`, `w'`, both off `oppCap2`, cannot lie on a common circle about `oppApex1`
(radius `r`) and a common circle about `surplusApex` (radius `σ`).  Mirrors
`oppCap2_escape_private_false` with the chord `(surplusApex, oppApex1)` in
place of `(oppApex1, oppApex2)` and `oppCap2`-membership in place of
`surplusCap`-membership. -/
theorem oppCap2_private_false_of_surplusApexCircle (D : CounterexampleData)
    {r σ : ℝ} {x w' : ℝ²}
    (hxA : x ∈ D.A) (hw'A : w' ∈ D.A)
    (hx_notopp2 : x ∉ D.packet.oppCap2)
    (hw'_notopp2 : w' ∉ D.packet.oppCap2)
    (hne : x ≠ w')
    (hxv : dist x D.packet.oppApex1 = r) (hw'v : dist w' D.packet.oppApex1 = r)
    (hxu : dist x D.packet.surplusApex = σ) (hw'u : dist w' D.packet.surplusApex = σ) :
    False := by
  have hmid :
      signedArea2 (midpoint ℝ w' x) D.packet.surplusApex D.packet.oppApex1 = 0 :=
    twoCircle_midpoint_collinear hxu hw'u hxv hw'v hne
  have hflip :
      signedArea2 x D.packet.surplusApex D.packet.oppApex1 =
        - signedArea2 w' D.packet.surplusApex D.packet.oppApex1 :=
    signedArea2_reflection_neg hmid
  have hxpos := signedArea2_mul_pos_of_not_mem_oppCap2 D hxA hx_notopp2
  have hw'pos := signedArea2_mul_pos_of_not_mem_oppCap2 D hw'A hw'_notopp2
  have hkey :
      signedArea2 x D.packet.surplusApex D.packet.oppApex1 *
          signedArea2 D.packet.oppApex2 D.packet.surplusApex D.packet.oppApex1
        = -(signedArea2 w' D.packet.surplusApex D.packet.oppApex1 *
          signedArea2 D.packet.oppApex2 D.packet.surplusApex D.packet.oppApex1) := by
    rw [hflip]; ring
  linarith [hxpos, hw'pos, hkey]

/- ### Extraction helpers -/

/-- `oppApex2` lies in the carrier `A`. -/
theorem oppApex2_mem_A (D : CounterexampleData) : D.packet.oppApex2 ∈ D.A := by
  set CP := D.packet.partition with hCP
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppApex2, hi]; exact CP.C1_subset CP.v3_mem_C1
  · simp only [SurplusCapPacket.oppApex2, hi]; exact CP.C2_subset CP.v1_mem_C2
  · simp only [SurplusCapPacket.oppApex2, hi]; exact CP.C1_subset CP.v2_mem_C1

/-- Filter-predicate `dist_comm` swap (public replica of the private
`U2SqueezePort.filter_dist_comm`). -/
theorem filter_dist_comm' (A : Finset ℝ²) (p : ℝ²) (r : ℝ) :
    A.filter (fun q => dist p q = r) = A.filter (fun q => dist q p = r) := by
  apply Finset.filter_congr
  intro x _
  exact ⟨fun h => by rwa [dist_comm] at h, fun h => by rwa [dist_comm]⟩

private theorem mem_moserVerts_cases' {A : Finset ℝ²} {M : MoserTriangle A}
    {x : ℝ²} (hx : x ∈ M.verts) :
    x = M.v1 ∨ x = M.v2 ∨ x = M.v3 := by
  simpa [MoserTriangle.verts] using hx

/-- The two opposite caps meet only at their shared Moser endpoint
`surplusApex`.  Each cap is the closed arc opposite its own Moser apex, so their
only common vertex is the third triangle vertex — the surplus apex.  (Partition
combinatorics; mirrors the private `surplus_inter_oppCap{1,2}` lemmas.) -/
theorem oppCap1_inter_oppCap2_subset_surplusApex (D : CounterexampleData) :
    D.packet.oppCap1 ∩ D.packet.oppCap2 ⊆
      ({D.packet.surplusApex} : Finset ℝ²) := by
  intro x hx
  have hxOpp1 : x ∈ D.packet.oppCap1 := (Finset.mem_inter.mp hx).1
  have hxOpp2 : x ∈ D.packet.oppCap2 := (Finset.mem_inter.mp hx).2
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · -- surplusIdx = 0: oppCap1 = C2, oppCap2 = C3, surplusApex = v1.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hxOpp1 hxOpp2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases' hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (D.packet.partition.v2_notin_C2 hxOpp1)
      · exact False.elim (D.packet.partition.v3_notin_C3 hxOpp2)
    · have hxA : x ∈ D.A := D.packet.partition.C2_subset hxOpp1
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ D.packet.partition.C1
      · simp [hxC1, hxOpp1, hxOpp2] at hone
      · simp [hxC1, hxOpp1, hxOpp2] at hone
  · -- surplusIdx = 1: oppCap1 = C3, oppCap2 = C1, surplusApex = v2.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hxOpp1 hxOpp2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases' hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hxOpp2)
      · simp
      · exact False.elim (D.packet.partition.v3_notin_C3 hxOpp1)
    · have hxA : x ∈ D.A := D.packet.partition.C3_subset hxOpp1
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ D.packet.partition.C2
      · simp [hxC2, hxOpp1, hxOpp2] at hone
      · simp [hxC2, hxOpp1, hxOpp2] at hone
  · -- surplusIdx = 2: oppCap1 = C1, oppCap2 = C2, surplusApex = v3.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hxOpp1 hxOpp2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases' hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hxOpp1)
      · exact False.elim (D.packet.partition.v2_notin_C2 hxOpp2)
      · simp
    · have hxA : x ∈ D.A := D.packet.partition.C1_subset hxOpp1
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ D.packet.partition.C3
      · simp [hxC3, hxOpp1, hxOpp2] at hone
      · simp [hxC3, hxOpp1, hxOpp2] at hone

/-- The surplus apex is not a point of its own (opposite) cap.  Local replica of
`surplusApex_notin_surplusCap` (U6ModeBDescent) to avoid a cross-lane import. -/
private theorem surplusApex_notin_surplusCap' (D : CounterexampleData) :
    D.packet.surplusApex ∉ D.packet.surplusCap := by
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v1_notin_C1
  · simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v2_notin_C2
  · simpa [SurplusCapPacket.surplusApex, SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v3_notin_C3

/- ### The named residuals -/

/-- **Surplus-escape residual** (the branch that is NOT this task's target).
No surplus-cap-private point of the `oppApex1` exact-radius class escapes.  This
is the (m,4,4) surplus-selector obligation analysed in
`docs/u-lane/97-u2b-surplus-escape-branch-analysis-2026-07-01.md`. -/
def SurplusEscapeExcludedAtOppApex1 (D : CounterexampleData) : Prop :=
  D.IsM44 → ∀ r : ℝ, 0 < r →
    4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card →
    ∀ x, x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) →
      x ∈ D.packet.surplusCap \ (D.packet.oppCap1 ∪ D.packet.oppCap2) →
      False

/-- **LEAF (residual) — oppCap2 escape, endpoint sub-case, `surplusApex` off the
first circle.**  The forced second circle `Δ` at `oppApex2` has its unique
`oppCap1`-hit at the shared cap endpoint `surplusApex` (the identification
`w' = surplusApex` and the sub-case `dist surplusApex oppApex1 = r` — where the
reflection kernel kills the pair `{x, surplusApex}` on the two common circles —
are discharged in `no_oppCap2_escape`; narrowing 2026-07-02).  The residual
configuration has `surplusApex` strictly OFF the `oppApex1` circle `Γ`, so no
pair of `Γ ∩ Δ` points off the surplus cap is available and the reflection
kernel has no second circle.  This is the `(m,4,4)` analog of the n=9
`formA_v1_endpointPair_impossible` degenerate tier; it needs global incidence
input beyond the two squeezes (branch doc §4(b); unified combinatorial space =
the 117 endpoint patterns of the validated unpinned enumeration). -/
theorem oppCap2_endpointEscape_false (D : CounterexampleData)
    (hM44 : D.IsM44) {r ρ : ℝ} {x : ℝ²}
    (hr : 0 < r) (hρ : 0 < ρ)
    (hcard : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card)
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hxEsc : x ∈ D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hρcard : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex2 = ρ)).card)
    (hxΔ : dist x D.packet.oppApex2 = ρ)
    (huΔ : dist D.packet.surplusApex D.packet.oppApex2 = ρ)
    (huOff : dist D.packet.surplusApex D.packet.oppApex1 ≠ r) :
    False := sorry

/- ### The oppCap2 branch discharge -/

/-- The oppCap2 escape branch at `oppApex1` is impossible: the private sub-case
is the reflection kill, the endpoint sub-case is `oppCap2_endpointEscape_false`. -/
theorem no_oppCap2_escape (D : CounterexampleData) (hM44 : D.IsM44)
    (r : ℝ) (hr : 0 < r)
    (hcard : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card)
    (x : ℝ²)
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hxEsc : x ∈ D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1)) :
    False := by
  classical
  have hxA : x ∈ D.A := (Finset.mem_filter.mp hxT).1
  have hxv : dist x D.packet.oppApex1 = r := (Finset.mem_filter.mp hxT).2
  have hxnotSU : x ∉ D.packet.surplusCap ∪ D.packet.oppCap1 :=
    (Finset.mem_sdiff.mp hxEsc).2
  rw [Finset.mem_union, not_or] at hxnotSU
  have hx_notsurp : x ∉ D.packet.surplusCap := hxnotSU.1
  have hx_notopp1 : x ∉ D.packet.oppCap1 := hxnotSU.2
  -- K4 radius at oppApex2, converted to the squeeze filter form.
  obtain ⟨ρ, hρ_pos, hρ_card⟩ := D.K4 D.packet.oppApex2 (oppApex2_mem_A D)
  rw [filter_dist_comm'] at hρ_card
  have hsq2 := oppApex2_squeeze_of_isM44 D ρ hM44 hρ_card
  -- x, an oppCap2-private point, lands on the oppApex2 circle Δ.
  have hxΔ : x ∈ D.A.filter (fun y => dist y D.packet.oppApex2 = ρ) :=
    hsq2.2.1 hxEsc
  have hxw : dist x D.packet.oppApex2 = ρ := (Finset.mem_filter.mp hxΔ).2
  -- Extract the unique oppCap1-hit w' of Δ.
  obtain ⟨w', hw'sing⟩ := Finset.card_eq_one.mp hsq2.2.2.2
  have hw'mem : w' ∈ (D.A.filter (fun y => dist y D.packet.oppApex2 = ρ)) ∩
      D.packet.oppCap1 := by rw [hw'sing]; exact Finset.mem_singleton_self w'
  have hw'Δ : w' ∈ D.A.filter (fun y => dist y D.packet.oppApex2 = ρ) :=
    (Finset.mem_inter.mp hw'mem).1
  have hw'opp1 : w' ∈ D.packet.oppCap1 := (Finset.mem_inter.mp hw'mem).2
  have hw'A : w' ∈ D.A := (Finset.mem_filter.mp hw'Δ).1
  have hw'w : dist w' D.packet.oppApex2 = ρ := (Finset.mem_filter.mp hw'Δ).2
  have hsq1 := oppApex1_squeeze_of_isM44 D r hM44 hcard
  have hne : x ≠ w' := by rintro rfl; exact hx_notopp1 hw'opp1
  by_cases hw'priv : w' ∈ D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2)
  · -- Private sub-case: reflection kill.
    have hw'Γ : w' ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) :=
      hsq1.2.1 hw'priv
    have hw'v : dist w' D.packet.oppApex1 = r := (Finset.mem_filter.mp hw'Γ).2
    have hw'notSU : w' ∉ D.packet.surplusCap ∪ D.packet.oppCap2 :=
      (Finset.mem_sdiff.mp hw'priv).2
    rw [Finset.mem_union, not_or] at hw'notSU
    exact oppCap2_escape_private_false D hxA hw'A hx_notsurp hw'notSU.1 hne
      hxv hw'v hxw hw'w
  · -- Endpoint sub-case: w' is a shared cap endpoint, necessarily `surplusApex`.
    have hw'shared : w' ∈ D.packet.surplusCap ∪ D.packet.oppCap2 := by
      by_contra h
      exact hw'priv (Finset.mem_sdiff.mpr ⟨hw'opp1, h⟩)
    have hw'ne2 : w' ≠ D.packet.oppApex2 := by
      intro h
      rw [h, dist_self] at hw'w
      exact (ne_of_lt hρ_pos) hw'w
    have hw'u : w' = D.packet.surplusApex := by
      rcases Finset.mem_union.mp hw'shared with hsurp | hopp2
      · exact absurd (Finset.mem_singleton.mp
          (surplus_inter_oppCap1_subset_oppApex2 D
            (Finset.mem_inter.mpr ⟨hsurp, hw'opp1⟩))) hw'ne2
      · exact Finset.mem_singleton.mp
          (oppCap1_inter_oppCap2_subset_surplusApex D
            (Finset.mem_inter.mpr ⟨hw'opp1, hopp2⟩))
    subst hw'u
    by_cases hupin : dist D.packet.surplusApex D.packet.oppApex1 = r
    · -- `surplusApex` on Γ too: reflection kill on the pair {x, surplusApex}.
      exact oppCap2_escape_private_false D hxA hw'A hx_notsurp
        (surplusApex_notin_surplusCap' D) hne hxv hupin hxw hw'w
    · exact oppCap2_endpointEscape_false D hM44 hr hρ_pos hcard hxT hxEsc
        hρ_card hxw hw'w hupin

/- ### The surplus branch: pinned-family reduction -/

/-- **LEAF (residual) — pinned surplus-escape family, chord-separated.**
Strictly narrower than the unrestricted pinned family: carries the two
`oppCap1`-private interior points `p₁ ≠ p₂` of `Γ_r` explicitly, together with
the two (U1) Moser-chord non-equidistance facts forced on them — `hU1w`
(not `oppApex2`-equidistant, chord `(oppApex1, oppApex2)`) and `hU1u` (not
`surplusApex`-equidistant, chord `(surplusApex, oppApex1)`).  Both facts are
reflection kills already discharged upstream; the residual is what remains
after excluding co-membership of `{p₁, p₂}` at the centers `oppApex2` and
`surplusApex`. -/
theorem surplusEscape_pinnedFamily_sep_false (D : CounterexampleData)
    (hM44 : D.IsM44) {r : ℝ} (hr : 0 < r)
    (hcard : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card)
    (hrpin : dist D.packet.surplusApex D.packet.oppApex1 = r)
    (huGamma : D.packet.surplusApex ∈
      D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hInteriors : D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) ⊆
      D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hwOff : dist D.packet.oppApex2 D.packet.oppApex1 ≠ r)
    {x p₁ p₂ : ℝ²}
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hxEsc : x ∈ D.packet.surplusCap \
      (D.packet.oppCap1 ∪ D.packet.oppCap2))
    (hp₁ : p₁ ∈ D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2))
    (hp₂ : p₂ ∈ D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2))
    (hpne : p₁ ≠ p₂)
    (hpset : D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) = {p₁, p₂})
    (hU1w : dist p₁ D.packet.oppApex2 ≠ dist p₂ D.packet.oppApex2)
    (hU1u : dist p₁ D.packet.surplusApex ≠ dist p₂ D.packet.surplusApex) :
    False := sorry

/-- **LEAF (residual) — pinned surplus-escape family.**  The §2 residual of
`docs/u-lane/97-u2b-surplus-escape-branch-analysis-2026-07-01.md`, strictly
narrower than `SurplusEscapeExcludedAtOppApex1`:  the first-apex exact-radius
class is pinned to `Γ_r = {surplusApex, P_w, P_u, x}` with the class radius fixed
to the Moser side `r = dist surplusApex oppApex1` (`surplusApex ∈ Γ_r`), both
`oppCap1`-private interiors in `Γ_r`, the escapee `x` strictly interior to
`surplusCap`, and the far Moser vertex `oppApex2` off the class
(`dist oppApex2 oppApex1 ≠ r`).  Reduces to the (U1) chord-separated residual
`surplusEscape_pinnedFamily_sep_false` by extracting the two `oppCap1`-private
interiors `p₁ ≠ p₂` (`oppApex1_interior_card_eq_two_of_isM44`) and deriving
their forced non-equidistance at `oppApex2` and `surplusApex` from the two
reflection kills above. -/
theorem surplusEscape_pinnedFamily_false (D : CounterexampleData)
    (hM44 : D.IsM44) {r : ℝ} (hr : 0 < r)
    (hcard : 4 ≤ (D.A.filter (fun y => dist y D.packet.oppApex1 = r)).card)
    (hrpin : dist D.packet.surplusApex D.packet.oppApex1 = r)
    (huGamma : D.packet.surplusApex ∈
      D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hInteriors : D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) ⊆
      D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hwOff : dist D.packet.oppApex2 D.packet.oppApex1 ≠ r)
    {x : ℝ²}
    (hxT : x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r))
    (hxEsc : x ∈ D.packet.surplusCap \
      (D.packet.oppCap1 ∪ D.packet.oppCap2)) :
    False := by
  classical
  obtain ⟨p₁, p₂, hpne, hpset⟩ :=
    Finset.card_eq_two.mp (oppApex1_interior_card_eq_two_of_isM44 hM44)
  have hp₁ : p₁ ∈ D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) := by
    rw [hpset]; exact Finset.mem_insert_self p₁ {p₂}
  have hp₂ : p₂ ∈ D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) := by
    rw [hpset]; simp
  have hp₁Γ : p₁ ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) := hInteriors hp₁
  have hp₂Γ : p₂ ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) := hInteriors hp₂
  have hp₁A : p₁ ∈ D.A := (Finset.mem_filter.mp hp₁Γ).1
  have hp₂A : p₂ ∈ D.A := (Finset.mem_filter.mp hp₂Γ).1
  have hp₁r : dist p₁ D.packet.oppApex1 = r := (Finset.mem_filter.mp hp₁Γ).2
  have hp₂r : dist p₂ D.packet.oppApex1 = r := (Finset.mem_filter.mp hp₂Γ).2
  have hp₁_notsurp : p₁ ∉ D.packet.surplusCap :=
    fun h => (Finset.mem_sdiff.mp hp₁).2 (Finset.mem_union_left _ h)
  have hp₂_notsurp : p₂ ∉ D.packet.surplusCap :=
    fun h => (Finset.mem_sdiff.mp hp₂).2 (Finset.mem_union_left _ h)
  have hp₁_notopp2 : p₁ ∉ D.packet.oppCap2 :=
    fun h => (Finset.mem_sdiff.mp hp₁).2 (Finset.mem_union_right _ h)
  have hp₂_notopp2 : p₂ ∉ D.packet.oppCap2 :=
    fun h => (Finset.mem_sdiff.mp hp₂).2 (Finset.mem_union_right _ h)
  have hU1w : dist p₁ D.packet.oppApex2 ≠ dist p₂ D.packet.oppApex2 := by
    intro h
    exact oppCap2_escape_private_false D hp₁A hp₂A hp₁_notsurp hp₂_notsurp hpne
      hp₁r hp₂r h rfl
  have hU1u : dist p₁ D.packet.surplusApex ≠ dist p₂ D.packet.surplusApex := by
    intro h
    exact oppCap2_private_false_of_surplusApexCircle D hp₁A hp₂A
      hp₁_notopp2 hp₂_notopp2 hpne hp₁r hp₂r h rfl
  exact surplusEscape_pinnedFamily_sep_false D hM44 hr hcard hrpin huGamma
    hInteriors hwOff hxT hxEsc hp₁ hp₂ hpne hpset hU1w hU1u

/-- **Surplus-escape branch reduction.**  The surplus-cap-private escape at
`oppApex1` reduces to the pinned residual family `surplusEscape_pinnedFamily_false`.
The first-apex squeeze (`oppApex1_squeeze_of_isM44`) forces the exact-radius class
to have exactly one `oppCap2`-hit `t`.  If `t` is `oppCap2`-private it witnesses
the `oppCap2` branch, killed by `no_oppCap2_escape`; otherwise `t` is the shared
endpoint of `oppCap1` and `oppCap2`, hence `t = surplusApex`
(`oppCap1_inter_oppCap2_subset_surplusApex`).  That pins the class radius to
`dist surplusApex oppApex1` and, via the proven endpoint wrapper
`oppApex1_filter_subset_oppCap1_of_endpointRadius`, forces
`dist oppApex2 oppApex1 ≠ r` (both `oppCap1` endpoints at radius `r` would contain
the whole class in `oppCap1`, contradicting the escapee).  Only
`surplusEscape_pinnedFamily_false` remains. -/
theorem surplusEscapeExcludedAtOppApex1_holds (D : CounterexampleData) :
    SurplusEscapeExcludedAtOppApex1 D := by
  classical
  intro hM44 r hr hcard x hxT hxEsc
  have hsq := oppApex1_squeeze_of_isM44 D r hM44 hcard
  -- The exact-radius class has a unique `oppCap2`-hit `t`.
  obtain ⟨t, htsing⟩ := Finset.card_eq_one.mp hsq.2.2.2
  have htmem : t ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) ∩
      D.packet.oppCap2 := by rw [htsing]; exact Finset.mem_singleton_self t
  have htT : t ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) :=
    (Finset.mem_inter.mp htmem).1
  have htOpp2 : t ∈ D.packet.oppCap2 := (Finset.mem_inter.mp htmem).2
  by_cases htOpp1 : t ∈ D.packet.oppCap1
  · -- Shared-endpoint case: `t = surplusApex`, pinning the class radius.
    have htEq : t = D.packet.surplusApex :=
      Finset.mem_singleton.mp
        (oppCap1_inter_oppCap2_subset_surplusApex D
          (Finset.mem_inter.mpr ⟨htOpp1, htOpp2⟩))
    have huGamma : D.packet.surplusApex ∈
        D.A.filter (fun y => dist y D.packet.oppApex1 = r) := htEq ▸ htT
    have hrpin : dist D.packet.surplusApex D.packet.oppApex1 = r :=
      (Finset.mem_filter.mp huGamma).2
    have hxNotOpp1 : x ∉ D.packet.oppCap1 := by
      have hx := (Finset.mem_sdiff.mp hxEsc).2
      rw [Finset.mem_union, not_or] at hx
      exact hx.1
    have hwOff : dist D.packet.oppApex2 D.packet.oppApex1 ≠ r := by
      intro hOther
      exact hxNotOpp1
        (oppApex1_filter_subset_oppCap1_of_endpointRadius D hr hOther hrpin hxT)
    exact surplusEscape_pinnedFamily_false D hM44 hr hcard hrpin huGamma
      hsq.2.1 hwOff hxT hxEsc
  · -- Private case: `t` is an `oppCap2`-private escape, killed by the reflection.
    have htEsc : t ∈ D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1) :=
      oppApex1_other_hit_strict_of_not_oppCap1 D r hcard htT htOpp2 htOpp1
    exact no_oppCap2_escape D hM44 r hr hcard t htT htEsc

/-- **Leaf reduction.**  No strict adjacent-cap escape at `oppApex1`: split the
escape disjunction into the surplus residual and the (kernel-clean, modulo the
endpoint residual) oppCap2 kill. -/
theorem noStrictAdjacentEscapeAtOppApex1_reduction (D : CounterexampleData) :
    NoStrictAdjacentEscapeAtOppApex1 D := by
  intro hM44 r hr hcard hEsc
  obtain ⟨x, hxT, hxDisj⟩ := hEsc
  rcases hxDisj with hxSurp | hxOpp2
  · exact surplusEscapeExcludedAtOppApex1_holds D hM44 r hr hcard x hxT hxSurp
  · exact no_oppCap2_escape D hM44 r hr hcard x hxT hxOpp2

end U2NonSurplusSqueeze
end Problem97
