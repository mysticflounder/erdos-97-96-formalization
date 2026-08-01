/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Census554.SixPointFifteenIncidenceCertificate
import Erdos9796Proof.P97.Census554.SixPointSixteenIncidenceCertificate
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Six-point algebraic row collisions

Two small distance-class configurations cannot be realized by distinct points
in the Euclidean plane.  Each proof normalizes one distinguished pair to
`(0, 0)` and `(1, 0)`, translates the stated equal-distance classes into
squared-coordinate equations, and checks the resulting exact unit-ideal
certificate.

The certificate modules contain only exact generated polynomial data.  This
module is the theorem-facing geometric adapter.
-/

namespace Problem97
namespace Census554
namespace SixPointAlgebraicRowCollisions

open U5GramCert

/-- A six-label pattern with fifteen explicitly used class memberships.

The classes at `p0`, `p1`, `p2`, `p3`, `p4`, and `p7` contain respectively
`{p1,p2,p4}`, `{p2,p3,p4}`, `{p0,p3}`, `{p0,p1,p4}`, `{p0,p2}`, and
`{p0,p1}`. -/
structure FifteenIncidenceCore {α : Type*} (P : EqualityCore.RowPattern α) where
  p0 : α
  p1 : α
  p2 : α
  p3 : α
  p4 : α
  p7 : α
  p0_ne_p1 : p0 ≠ p1
  p1_mem_p0_class : p1 ∈ P p0
  p2_mem_p0_class : p2 ∈ P p0
  p4_mem_p0_class : p4 ∈ P p0
  p2_mem_p1_class : p2 ∈ P p1
  p3_mem_p1_class : p3 ∈ P p1
  p4_mem_p1_class : p4 ∈ P p1
  p0_mem_p2_class : p0 ∈ P p2
  p3_mem_p2_class : p3 ∈ P p2
  p0_mem_p3_class : p0 ∈ P p3
  p1_mem_p3_class : p1 ∈ P p3
  p4_mem_p3_class : p4 ∈ P p3
  p0_mem_p4_class : p0 ∈ P p4
  p2_mem_p4_class : p2 ∈ P p4
  p0_mem_p7_class : p0 ∈ P p7
  p1_mem_p7_class : p1 ∈ P p7

set_option maxHeartbeats 0 in
-- Expanding and normalizing the nine exact polynomial facts exceeds the default budget.
/-- The fifteen-incidence core has no injective Euclidean realization. -/
theorem FifteenIncidenceCore.not_realizes
    {α : Type*} {P : EqualityCore.RowPattern α}
    (core : FifteenIncidenceCore P)
    {pointOf : α → EuclideanSpace ℝ (Fin 2)} :
    ¬ EqualityCore.Realizes P pointOf := by
  intro hreal
  have hpq : pointOf core.p0 ≠ pointOf core.p1 := by
    intro h
    exact core.p0_ne_p1 (hreal.injective h)
  let ν : ℕ → ℝ := fun n =>
    match n with
    | 0 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p2) 0
    | 1 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p2) 1
    | 2 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p3) 0
    | 3 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p3) 1
    | 4 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p4) 0
    | 5 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p4) 1
    | 10 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p7) 0
    | 11 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p7) 1
    | _ => 0
  have h0_12 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p0 core.p1 core.p1_mem_p0_class
      core.p2 core.p2_mem_p0_class)
  have h0_14 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p0 core.p1 core.p1_mem_p0_class
      core.p4 core.p4_mem_p0_class)
  have h1_23 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p1 core.p2 core.p2_mem_p1_class
      core.p3 core.p3_mem_p1_class)
  have h1_24 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p1 core.p2 core.p2_mem_p1_class
      core.p4 core.p4_mem_p1_class)
  have h2_03 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p2 core.p0 core.p0_mem_p2_class
      core.p3 core.p3_mem_p2_class)
  have h3_01 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p3 core.p0 core.p0_mem_p3_class
      core.p1 core.p1_mem_p3_class)
  have h3_04 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p3 core.p0 core.p0_mem_p3_class
      core.p4 core.p4_mem_p3_class)
  have h4_02 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p4 core.p0 core.p0_mem_p4_class
      core.p2 core.p2_mem_p4_class)
  have h7_01 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p7 core.p0 core.p0_mem_p7_class
      core.p1 core.p1_mem_p7_class)
  simp [coordSqDist, normalAxis_self, normalAxis_witness hpq] at h0_12 h0_14 h1_23 h1_24
  simp [coordSqDist, normalAxis_self, normalAxis_witness hpq] at h2_03 h3_01 h3_04
  simp [coordSqDist, normalAxis_self, normalAxis_witness hpq] at h4_02 h7_01
  apply SixPointFifteenIncidenceCertificate.false_of_facts_eval_zero ν
  intro f hf
  simp only [SixPointFifteenIncidenceCertificate.facts, List.mem_cons,
    List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals simp [eval, evalMono, ν]
  · nlinarith [h0_12]
  · nlinarith [h0_14]
  · nlinarith [h1_23]
  · nlinarith [h1_24]
  · nlinarith [h2_03]
  · nlinarith [h3_01]
  · nlinarith [h3_04]
  · nlinarith [h4_02]
  · nlinarith [h7_01]

/-- A six-label pattern with sixteen explicitly used class memberships.

The classes at `p0`, `p1`, `p3`, `p5`, `p8`, and `p9` contain respectively
`{p3,p5,p9}`, `{p0,p5,p9}`, `{p0,p1,p8}`, `{p1,p3,p8}`, `{p1,p9}`, and
`{p1,p5}`. -/
structure SixteenIncidenceCore {α : Type*} (P : EqualityCore.RowPattern α) where
  p0 : α
  p1 : α
  p3 : α
  p5 : α
  p8 : α
  p9 : α
  p0_ne_p1 : p0 ≠ p1
  p3_mem_p0_class : p3 ∈ P p0
  p5_mem_p0_class : p5 ∈ P p0
  p9_mem_p0_class : p9 ∈ P p0
  p0_mem_p1_class : p0 ∈ P p1
  p5_mem_p1_class : p5 ∈ P p1
  p9_mem_p1_class : p9 ∈ P p1
  p0_mem_p3_class : p0 ∈ P p3
  p1_mem_p3_class : p1 ∈ P p3
  p8_mem_p3_class : p8 ∈ P p3
  p1_mem_p5_class : p1 ∈ P p5
  p3_mem_p5_class : p3 ∈ P p5
  p8_mem_p5_class : p8 ∈ P p5
  p1_mem_p8_class : p1 ∈ P p8
  p9_mem_p8_class : p9 ∈ P p8
  p1_mem_p9_class : p1 ∈ P p9
  p5_mem_p9_class : p5 ∈ P p9

set_option maxHeartbeats 0 in
-- Expanding and normalizing the ten exact polynomial facts exceeds the default budget.
/-- The sixteen-incidence core has no injective Euclidean realization. -/
theorem SixteenIncidenceCore.not_realizes
    {α : Type*} {P : EqualityCore.RowPattern α}
    (core : SixteenIncidenceCore P)
    {pointOf : α → EuclideanSpace ℝ (Fin 2)} :
    ¬ EqualityCore.Realizes P pointOf := by
  intro hreal
  have hpq : pointOf core.p0 ≠ pointOf core.p1 := by
    intro h
    exact core.p0_ne_p1 (hreal.injective h)
  let ν : ℕ → ℝ := fun n =>
    match n with
    | 2 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p3) 0
    | 3 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p3) 1
    | 6 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p5) 0
    | 7 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p5) 1
    | 12 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p8) 0
    | 13 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p8) 1
    | 14 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p9) 0
    | 15 => normalAxis (pointOf core.p0) (pointOf core.p1) (pointOf core.p9) 1
    | _ => 0
  have h0_35 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p0 core.p3 core.p3_mem_p0_class
      core.p5 core.p5_mem_p0_class)
  have h0_39 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p0 core.p3 core.p3_mem_p0_class
      core.p9 core.p9_mem_p0_class)
  have h1_05 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p1 core.p0 core.p0_mem_p1_class
      core.p5 core.p5_mem_p1_class)
  have h1_09 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p1 core.p0 core.p0_mem_p1_class
      core.p9 core.p9_mem_p1_class)
  have h3_01 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p3 core.p0 core.p0_mem_p3_class
      core.p1 core.p1_mem_p3_class)
  have h3_08 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p3 core.p0 core.p0_mem_p3_class
      core.p8 core.p8_mem_p3_class)
  have h5_13 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p5 core.p1 core.p1_mem_p5_class
      core.p3 core.p3_mem_p5_class)
  have h5_18 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p5 core.p1 core.p1_mem_p5_class
      core.p8 core.p8_mem_p5_class)
  have h8_19 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p8 core.p1 core.p1_mem_p8_class
      core.p9 core.p9_mem_p8_class)
  have h9_15 := normalAxis_coord_sqdist_eq_of_dist_eq hpq
    (hreal.equidist core.p9 core.p1 core.p1_mem_p9_class
      core.p5 core.p5_mem_p9_class)
  simp [coordSqDist, normalAxis_self, normalAxis_witness hpq] at h0_35 h0_39 h1_05
  simp [coordSqDist, normalAxis_self, normalAxis_witness hpq] at h1_09 h3_01
  simp [coordSqDist, normalAxis_self, normalAxis_witness hpq] at h3_08 h5_13 h5_18
  simp [coordSqDist, normalAxis_witness hpq] at h8_19 h9_15
  apply SixPointSixteenIncidenceCertificate.false_of_facts_eval_zero ν
  intro f hf
  simp only [SixPointSixteenIncidenceCertificate.facts, List.mem_cons,
    List.not_mem_nil, or_false] at hf
  rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals simp [eval, evalMono, ν]
  · nlinarith [h0_35]
  · nlinarith [h0_39]
  · nlinarith [h1_05]
  · nlinarith [h1_09]
  · nlinarith [h3_01]
  · nlinarith [h3_08]
  · nlinarith [h5_13]
  · nlinarith [h5_18]
  · nlinarith [h8_19]
  · nlinarith [h9_15]

end SixPointAlgebraicRowCollisions
end Census554
end Problem97
