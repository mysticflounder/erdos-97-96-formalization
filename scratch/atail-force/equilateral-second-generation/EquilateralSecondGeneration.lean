/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U2.WitnessReflectionKernel
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Erdos9796Proof.P97.U5GlobalIncidenceKernels
import Erdos9796Proof.P97.WitnessPacketInterface

/-!
# Scratch: one further global-K4 generation at divergent continuation witnesses

This file is intentionally scratch-only.  It isolates what one honest use of
global K4 at an outside witness of a continuation row supplies.

Suppose `source` belongs to an opposite continuation row `R`, while the new
center is omitted from `R`.  At the new center, deleting `source` either
preserves K4 or produces an exact critical four-shell through `source`.  In
the critical arm, the new shell and `R` have distinct centers and already
share `source`.  The two-circle intersection bound therefore leaves at least
two members of `R` outside the critical shell.  Deleting either omitted member
preserves K4 at the new center, and each survival can be packaged as an exact
q-deleted U5 row.

No contradiction is claimed: the two omitted members are not identified with
fixed packet labels by global K4 alone.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailEquilateralSecondGenerationScratch

attribute [local instance] Classical.propDecidable

private theorem criticalSelectedFourClass_at_of_no_source_free
    {A : Finset ℝ²} {source center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hcenter : center ∈ A)
    (hcenter_ne_source : center ≠ source)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    Nonempty (CriticalSelectedFourClass A source center) := by
  have hcenterErase : center ∈ A.erase source :=
    Finset.mem_erase.mpr ⟨hcenter_ne_source, hcenter⟩
  rcases selectedClass_erase_witness_or_exact_erased_pin
      hK4 hcenterErase with
    ⟨radius, hradius, hsurvives⟩ |
      ⟨radius, hradius, hcard, hsourceClass⟩
  · exact False.elim (hblocked ⟨radius, hradius, by
      simpa [SelectedClass] using hsurvives⟩)
  · exact CriticalSelectedFourClass.exists_of_exactSelectedClass
      hcenter hradius hcard hsourceClass

private theorem erase_source_survives_or_critical_at
    {A : Finset ℝ²} {source center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hcenter : center ∈ A)
    (hcenter_ne_source : center ≠ source) :
    HasNEquidistantPointsAt 4 (A.erase source) center ∨
      ∃ _C : CriticalSelectedFourClass A source center,
        ¬ HasNEquidistantPointsAt 4 (A.erase source) center := by
  by_cases hsurvives :
      HasNEquidistantPointsAt 4 (A.erase source) center
  · exact Or.inl hsurvives
  · exact Or.inr
      ⟨Classical.choice
          (criticalSelectedFourClass_at_of_no_source_free
            hK4 hcenter hcenter_ne_source hsurvives),
        hsurvives⟩

private theorem deletion_survives_of_not_mem_critical_support
    {A : Finset ℝ²} {source center deleted : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (hdeleted : deleted ∉ C.toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  refine ⟨C.toCriticalFourShell.radius,
    C.toCriticalFourShell.radius_pos, ?_⟩
  calc
    4 = C.toCriticalFourShell.support.card :=
      C.toCriticalFourShell.support_card.symm
    _ ≤ ((A.erase deleted).filter fun x =>
        dist center x = C.toCriticalFourShell.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun h => hdeleted (h ▸ hx),
              C.toCriticalFourShell.support_subset_A hx⟩,
          C.toCriticalFourShell.support_eq_radius x hx⟩

/-- Selected-class form of the banked U5 tetrahedron obstruction.

This is the small adapter proved independently in
`scratch/atail-force/tetrahedron-bank-adapter`.  It is repeated locally so
this scratch file depends only on production modules. -/
private theorem false_of_three_selected_classes_tetrahedron
    {A : Finset ℝ²} {x y a b : ℝ²}
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (Kb : SelectedFourClass A b)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support)
    (hxKb : x ∈ Kb.support)
    (hyKb : y ∈ Kb.support)
    (haKb : a ∈ Kb.support) : False := by
  let r := Kx.radius
  have hxy : dist x y = r := Kx.support_eq_radius y hyKx
  have hxa : dist x a = r := Kx.support_eq_radius a haKx
  have hyr : Ky.radius = r := by
    calc
      Ky.radius = dist y x := (Ky.support_eq_radius x hxKy).symm
      _ = dist x y := dist_comm y x
      _ = r := hxy
  have hya : dist y a = r := by
    rw [Ky.support_eq_radius a haKy, hyr]
  have hyb : dist y b = r := by
    rw [Ky.support_eq_radius b hbKy, hyr]
  have hbr : Kb.radius = r := by
    calc
      Kb.radius = dist b y := (Kb.support_eq_radius y hyKb).symm
      _ = dist y b := dist_comm b y
      _ = r := hyb
  have hxb : dist x b = r := by
    calc
      dist x b = dist b x := dist_comm x b
      _ = Kb.radius := Kb.support_eq_radius x hxKb
      _ = r := hbr
  have hab : dist a b = r := by
    calc
      dist a b = dist b a := dist_comm a b
      _ = Kb.radius := Kb.support_eq_radius a haKb
      _ = r := hbr
  exact u5_unit_triangle_on_p_circle_incompatibility
    Kx.radius_pos hxy hxa hxb hya hyb hab

/-- Two selected circles cannot have two distinct common support points on
the same strict side of their center chord. -/
private theorem false_of_two_selected_classes_common_pair_of_sameSide
    {A : Finset ℝ²} {q v u y : ℝ²}
    (Kq : SelectedFourClass A q)
    (Kv : SelectedFourClass A v)
    (huKq : u ∈ Kq.support)
    (hyKq : y ∈ Kq.support)
    (huKv : u ∈ Kv.support)
    (hyKv : y ∈ Kv.support)
    (huy : u ≠ y)
    (hsame :
      0 < signedArea2 u q v * signedArea2 y q v) : False := by
  have huq : dist u q = Kq.radius := by
    simpa only [dist_comm] using Kq.support_eq_radius u huKq
  have hyq : dist y q = Kq.radius := by
    simpa only [dist_comm] using Kq.support_eq_radius y hyKq
  have huv : dist u v = Kv.radius := by
    simpa only [dist_comm] using Kv.support_eq_radius u huKv
  have hyv : dist y v = Kv.radius := by
    simpa only [dist_comm] using Kv.support_eq_radius y hyKv
  have huAreaNe : signedArea2 u q v ≠ 0 := by
    intro hzero
    rw [hzero, zero_mul] at hsame
    exact (lt_irrefl 0) hsame
  exact Problem97.twoCircle_sameSide_reflection_false
    (q := q) (v2 := v) (apex := u) (y := y) (u := u)
    (rq := Kq.radius) (rv := Kv.radius)
    huq hyq huv hyv huy (mul_self_pos.mpr huAreaNe)
      (by simpa [mul_comm] using hsame)

/-- The exact support classifier once a generated row hits at least two of
the three equilateral anchors.  The all-three profile is the tetrahedron
terminal, so exactly one of the three two-hit profiles remains. -/
theorem exact_two_hit_profile_of_pair_hit
    {A : Finset ℝ²} {x y a b : ℝ²}
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (Kb : SelectedFourClass A b)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support)
    (hpair :
      (x ∈ Kb.support ∧ y ∈ Kb.support) ∨
      (x ∈ Kb.support ∧ a ∈ Kb.support) ∨
      (y ∈ Kb.support ∧ a ∈ Kb.support)) :
    (x ∈ Kb.support ∧ y ∈ Kb.support ∧ a ∉ Kb.support) ∨
      (x ∈ Kb.support ∧ a ∈ Kb.support ∧ y ∉ Kb.support) ∨
      (y ∈ Kb.support ∧ a ∈ Kb.support ∧ x ∉ Kb.support) := by
  have hnotAll :
      ¬ (x ∈ Kb.support ∧ y ∈ Kb.support ∧ a ∈ Kb.support) := by
    rintro ⟨hx, hy, ha⟩
    exact false_of_three_selected_classes_tetrahedron Kx Ky Kb
      hyKx haKx hxKy haKy hbKy hx hy ha
  rcases hpair with ⟨hx, hy⟩ | ⟨hx, ha⟩ | ⟨hy, ha⟩
  · exact Or.inl ⟨hx, hy, fun ha => hnotAll ⟨hx, hy, ha⟩⟩
  · exact Or.inr (Or.inl
      ⟨hx, ha, fun hy => hnotAll ⟨hx, hy, ha⟩⟩)
  · exact Or.inr (Or.inr
      ⟨hy, ha, fun hx => hnotAll ⟨hx, hy, ha⟩⟩)

/-- Under the live cap-block same-side fact for `x,y` relative to the chord
`a-b`, the `{x,y}` two-hit profile is impossible.  The two apex-pair
profiles remain; no claim is made that either one is impossible. -/
theorem apex_pair_profiles_of_pair_hit_and_xy_sameSide
    {A : Finset ℝ²} {x y a b : ℝ²}
    (Ka : SelectedFourClass A a)
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (Kb : SelectedFourClass A b)
    (hxKa : x ∈ Ka.support)
    (hyKa : y ∈ Ka.support)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support)
    (hxy : x ≠ y)
    (hxySame :
      0 < signedArea2 x a b * signedArea2 y a b)
    (hpair :
      (x ∈ Kb.support ∧ y ∈ Kb.support) ∨
      (x ∈ Kb.support ∧ a ∈ Kb.support) ∨
      (y ∈ Kb.support ∧ a ∈ Kb.support)) :
    (x ∈ Kb.support ∧ a ∈ Kb.support ∧ y ∉ Kb.support) ∨
      (y ∈ Kb.support ∧ a ∈ Kb.support ∧ x ∉ Kb.support) := by
  rcases exact_two_hit_profile_of_pair_hit Kx Ky Kb
      hyKx haKx hxKy haKy hbKy hpair with hxyHit | hxaHit | hyaHit
  · exact False.elim
      (false_of_two_selected_classes_common_pair_of_sameSide
        Ka Kb hxKa hyKa hxyHit.1 hxyHit.2.1 hxy hxySame)
  · exact Or.inl hxaHit
  · exact Or.inr hyaHit

/-- One global-K4 generation at a member `b` of `Ky` must survive deletion of
one of the three fixed anchors `y`, `x`, or `a`.

Indeed, if deleting `y` blocks, the exact critical shell at `b` contains
`y`.  If it also contained both `x` and `a`, the three rows `Kx`, `Ky`, and
that shell would realize the banked tetrahedron obstruction.  Therefore one
of `x,a` is omitted from the shell, and deleting that omitted anchor
survives. -/
theorem member_row_three_anchor_deletion_survival
    (D : CounterexampleData)
    {x y a b : ℝ²}
    (Kx : SelectedFourClass D.A x)
    (Ky : SelectedFourClass D.A y)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support) :
    HasNEquidistantPointsAt 4 (D.A.erase y) b ∨
      HasNEquidistantPointsAt 4 (D.A.erase x) b ∨
      HasNEquidistantPointsAt 4 (D.A.erase a) b := by
  have hbA : b ∈ D.A := Ky.support_subset_A hbKy
  have hbNeY : b ≠ y := by
    intro h
    exact Ky.center_not_mem (by simpa [h] using hbKy)
  rcases erase_source_survives_or_critical_at
      D.K4 hbA hbNeY with hsurvives | ⟨C, _hblocked⟩
  · exact Or.inl hsurvives
  · by_cases hxC : x ∈ C.toCriticalFourShell.support
    · by_cases haC : a ∈ C.toCriticalFourShell.support
      · exact False.elim (false_of_three_selected_classes_tetrahedron
          Kx Ky C.toSelectedFourClass
          hyKx haKx hxKy haKy hbKy hxC
          C.toCriticalFourShell.q_mem_support haC)
      · exact Or.inr (Or.inr
          (deletion_survives_of_not_mem_critical_support C haC))
    · exact Or.inr (Or.inl
        (deletion_survives_of_not_mem_critical_support C hxC))

/-- Bank-ready output of the fixed-anchor classifier: one exact four-row in a
carrier with one of the three anchors deleted. -/
structure ThreeAnchorDeletedK4Row
    (D : CounterexampleData) (x y a center : ℝ²) where
  deleted : ℝ²
  deleted_eq_anchor : deleted = x ∨ deleted = y ∨ deleted = a
  support : Finset ℝ²
  row : U5QDeletedK4Class D deleted center support
  support_card : support.card = 4

private theorem nonempty_threeAnchorDeletedK4Row_of_survival
    (D : CounterexampleData)
    {x y a center deleted : ℝ²}
    (hdeleted : deleted = x ∨ deleted = y ∨ deleted = a)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center) :
    Nonempty (ThreeAnchorDeletedK4Row D x y a center) := by
  have hskeleton :
      HasNEquidistantPointsAt 4 (D.skeleton deleted) center := by
    simpa [CounterexampleData.skeleton] using hsurvives
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
      hskeleton with ⟨B, ⟨R⟩, hB⟩
  exact ⟨{
    deleted := deleted
    deleted_eq_anchor := hdeleted
    support := B
    row := R
    support_card := hB }⟩

/-- Exact producer form of `member_row_three_anchor_deletion_survival`.
The generated row is immediately consumable by the q-deleted U5 bank. -/
theorem nonempty_member_row_threeAnchorDeletedK4Row
    (D : CounterexampleData)
    {x y a b : ℝ²}
    (Kx : SelectedFourClass D.A x)
    (Ky : SelectedFourClass D.A y)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support) :
    Nonempty (ThreeAnchorDeletedK4Row D x y a b) := by
  rcases member_row_three_anchor_deletion_survival D Kx Ky
      hyKx haKx hxKy haKy hbKy with hy | hx | ha
  · exact nonempty_threeAnchorDeletedK4Row_of_survival D
      (Or.inr (Or.inl rfl)) hy
  · exact nonempty_threeAnchorDeletedK4Row_of_survival D
      (Or.inl rfl) hx
  · exact nonempty_threeAnchorDeletedK4Row_of_survival D
      (Or.inr (Or.inr rfl)) ha

/-- Paired fixed-anchor producer at arbitrary chosen members of the two
continuation rows.  In the equilateral residual, instantiate `a` with the
opposite apex and `u,v` with the divergent outside witnesses. -/
theorem nonempty_paired_threeAnchorDeletedK4Rows
    (D : CounterexampleData)
    {x y a u v : ℝ²}
    (Kx : SelectedFourClass D.A x)
    (Ky : SelectedFourClass D.A y)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (huKx : u ∈ Kx.support)
    (hvKy : v ∈ Ky.support) :
    Nonempty (ThreeAnchorDeletedK4Row D y x a u) ∧
      Nonempty (ThreeAnchorDeletedK4Row D x y a v) := by
  constructor
  · exact nonempty_member_row_threeAnchorDeletedK4Row D Ky Kx
      hxKy haKy hyKx haKx huKx
  · exact nonempty_member_row_threeAnchorDeletedK4Row D Kx Ky
      hyKx haKx hxKy haKy hvKy

/-- The exact critical arm after one new global-K4 generation.

Besides the source-critical shell, it records two distinct points of the
opposite continuation row whose deletions preserve K4 at the new center.  The
two survival facts are also exposed as exact q-deleted U5 rows. -/
structure TwoOppositeRowDeletionSurvivors
    (D : CounterexampleData)
    (source center oppositeCenter : ℝ²)
    (R : SelectedFourClass D.A oppositeCenter) where
  source_mem_opposite : source ∈ R.support
  center_mem_A : center ∈ D.A
  center_not_mem_opposite : center ∉ R.support
  centers_ne : center ≠ oppositeCenter
  critical : CriticalSelectedFourClass D.A source center
  source_blocks :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center
  critical_radius_eq_source :
    critical.toCriticalFourShell.radius = dist center source
  q : ℝ²
  w : ℝ²
  q_mem_opposite : q ∈ R.support
  w_mem_opposite : w ∈ R.support
  q_ne_w : q ≠ w
  q_not_mem_critical : q ∉ critical.toCriticalFourShell.support
  w_not_mem_critical : w ∉ critical.toCriticalFourShell.support
  q_survives : HasNEquidistantPointsAt 4 (D.A.erase q) center
  w_survives : HasNEquidistantPointsAt 4 (D.A.erase w) center
  Bq : Finset ℝ²
  Bw : Finset ℝ²
  qDeletedRow : U5QDeletedK4Class D q center Bq
  wDeletedRow : U5QDeletedK4Class D w center Bw
  Bq_card : Bq.card = 4
  Bw_card : Bw.card = 4

/-- One additional global-K4 generation at `center` has a branch-complete
outcome relative to a source already lying in an opposite row.

If the source deletion blocks, the exact critical shell can share at most one
further member with the opposite row.  Hence at least two opposite-row members
are deletion survivors at the new center. -/
theorem deletion_survives_or_two_oppositeRow_deletions_survive
    (D : CounterexampleData)
    {source center oppositeCenter : ℝ²}
    (R : SelectedFourClass D.A oppositeCenter)
    (hsourceR : source ∈ R.support)
    (hcenterA : center ∈ D.A)
    (hcenterNotR : center ∉ R.support)
    (hcenters : center ≠ oppositeCenter) :
    HasNEquidistantPointsAt 4 (D.A.erase source) center ∨
      Nonempty (TwoOppositeRowDeletionSurvivors
        D source center oppositeCenter R) := by
  have hcenterNeSource : center ≠ source := by
    intro h
    apply hcenterNotR
    simpa [h] using hsourceR
  rcases erase_source_survives_or_critical_at
      D.K4 hcenterA hcenterNeSource with
    hsurvives | ⟨C, hblocked⟩
  · exact Or.inl hsurvives
  · right
    have hinter :
        (C.toCriticalFourShell.support ∩ R.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two
        C.toSelectedFourClass R hcenters
    have hinter' :
        (R.support ∩ C.toCriticalFourShell.support).card ≤ 2 := by
      simpa [Finset.inter_comm] using hinter
    have hsplit := Finset.card_sdiff_add_card_inter
      R.support C.toCriticalFourShell.support
    have hdiff :
        2 ≤ (R.support \ C.toCriticalFourShell.support).card := by
      rw [R.support_card] at hsplit
      omega
    have hone :
        1 < (R.support \ C.toCriticalFourShell.support).card := by
      omega
    rcases Finset.one_lt_card.mp hone with
      ⟨q, hq, w, hw, hqw⟩
    have hqR : q ∈ R.support := (Finset.mem_sdiff.mp hq).1
    have hwR : w ∈ R.support := (Finset.mem_sdiff.mp hw).1
    have hqNot : q ∉ C.toCriticalFourShell.support :=
      (Finset.mem_sdiff.mp hq).2
    have hwNot : w ∉ C.toCriticalFourShell.support :=
      (Finset.mem_sdiff.mp hw).2
    have hqSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase q) center :=
      deletion_survives_of_not_mem_critical_support C hqNot
    have hwSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase w) center :=
      deletion_survives_of_not_mem_critical_support C hwNot
    have hqSkeleton :
        HasNEquidistantPointsAt 4 (D.skeleton q) center := by
      simpa [CounterexampleData.skeleton] using hqSurvives
    have hwSkeleton :
        HasNEquidistantPointsAt 4 (D.skeleton w) center := by
      simpa [CounterexampleData.skeleton] using hwSurvives
    rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hqSkeleton with
      ⟨Bq, ⟨Kq⟩, hBq⟩
    rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hwSkeleton with
      ⟨Bw, ⟨Kw⟩, hBw⟩
    exact ⟨{
      source_mem_opposite := hsourceR
      center_mem_A := hcenterA
      center_not_mem_opposite := hcenterNotR
      centers_ne := hcenters
      critical := C
      source_blocks := hblocked
      critical_radius_eq_source :=
        (C.toCriticalFourShell.support_eq_radius source
          C.toCriticalFourShell.q_mem_support).symm
      q := q
      w := w
      q_mem_opposite := hqR
      w_mem_opposite := hwR
      q_ne_w := hqw
      q_not_mem_critical := hqNot
      w_not_mem_critical := hwNot
      q_survives := hqSurvives
      w_survives := hwSurvives
      Bq := Bq
      Bw := Bw
      qDeletedRow := Kq
      wDeletedRow := Kw
      Bq_card := hBq
      Bw_card := hBw }⟩

/-- The retained critical-shell system adds exact blocker avoidance for both
new deletion survivors.  It does not identify either blocker with a
continuation center. -/
theorem TwoOppositeRowDeletionSurvivors.chosen_blockers_avoid_center
    {D : CounterexampleData}
    {source center oppositeCenter : ℝ²}
    {R : SelectedFourClass D.A oppositeCenter}
    (H : CriticalShellSystem D.A)
    (P : TwoOppositeRowDeletionSurvivors
      D source center oppositeCenter R) :
    H.centerAt P.q (R.support_subset_A P.q_mem_opposite) ≠ center ∧
      H.centerAt P.w (R.support_subset_A P.w_mem_opposite) ≠ center := by
  constructor
  · intro hcenter
    have hblocked := H.no_qfree_at P.q
      (R.support_subset_A P.q_mem_opposite)
    rw [hcenter] at hblocked
    exact hblocked P.q_survives
  · intro hcenter
    have hblocked := H.no_qfree_at P.w
      (R.support_subset_A P.w_mem_opposite)
    rw [hcenter] at hblocked
    exact hblocked P.w_survives

/-- Paired form used by the equilateral continuation residual.

`u` is a row-1 support point omitted by row 2, while `v` is a row-2
support point omitted by row 1.  The equilateral residual supplies the two
cross memberships `z₁ ∈ R₂` and `z₂ ∈ R₁`; no further metric
hypothesis is needed for this second-generation classifier. -/
theorem paired_divergent_second_generation
    (D : CounterexampleData)
    {z₁ z₂ u v : ℝ²}
    (R₁ : SelectedFourClass D.A z₁)
    (R₂ : SelectedFourClass D.A z₂)
    (hz₁R₂ : z₁ ∈ R₂.support)
    (hz₂R₁ : z₂ ∈ R₁.support)
    (huR₁ : u ∈ R₁.support)
    (huNotR₂ : u ∉ R₂.support)
    (huNeZ₂ : u ≠ z₂)
    (hvR₂ : v ∈ R₂.support)
    (hvNotR₁ : v ∉ R₁.support)
    (hvNeZ₁ : v ≠ z₁) :
    (HasNEquidistantPointsAt 4 (D.A.erase z₁) u ∨
      Nonempty (TwoOppositeRowDeletionSurvivors D z₁ u z₂ R₂)) ∧
    (HasNEquidistantPointsAt 4 (D.A.erase z₂) v ∨
      Nonempty (TwoOppositeRowDeletionSurvivors D z₂ v z₁ R₁)) := by
  constructor
  · exact deletion_survives_or_two_oppositeRow_deletions_survive
      D R₂ hz₁R₂ (R₁.support_subset_A huR₁) huNotR₂ huNeZ₂
  · exact deletion_survives_or_two_oppositeRow_deletions_survive
      D R₁ hz₂R₁ (R₂.support_subset_A hvR₂) hvNotR₁ hvNeZ₁

end ATailEquilateralSecondGenerationScratch
end Problem97

#print axioms Problem97.ATailEquilateralSecondGenerationScratch.deletion_survives_or_two_oppositeRow_deletions_survive
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.TwoOppositeRowDeletionSurvivors.chosen_blockers_avoid_center
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.paired_divergent_second_generation
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.exact_two_hit_profile_of_pair_hit
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.apex_pair_profiles_of_pair_hit_and_xy_sameSide
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.member_row_three_anchor_deletion_survival
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.nonempty_member_row_threeAnchorDeletedK4Row
#print axioms Problem97.ATailEquilateralSecondGenerationScratch.nonempty_paired_threeAnchorDeletedK4Rows
