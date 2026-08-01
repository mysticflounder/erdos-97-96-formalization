/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Census554.NineCenterEighteenEqualityCertificate
import Erdos9796Proof.P97.Phase3SurvivorSingularSystem00
import Erdos9796Proof.P97.Phase3SurvivorSingularSystem01
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Finite row algebraic collision cores

This module turns three exact rational unit-ideal certificates into
ambient-label-type-independent geometric obstruction theorems.  Each core
retains only the equalities whose certificate cofactors are nonzero.  The
external algebra has therefore been reduced to exact Boolean polynomial
identities checked with `native_decide`, while the public statements mention
only equality closure and injective plane realization.  Consequently these
theorems are `sorry`-free but retain Lean's native compiler trust boundary.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

open U5GramCert

/-- Coordinates of points `2,...,9` in the two-point normal-axis gauge. -/
private def tenPointCoordinateValuation
    (q : Fin 10 → ℝ²) : ℕ → ℝ
  | 0 => q 2 0
  | 1 => q 2 1
  | 2 => q 3 0
  | 3 => q 3 1
  | 4 => q 4 0
  | 5 => q 4 1
  | 6 => q 5 0
  | 7 => q 5 1
  | 8 => q 6 0
  | 9 => q 6 1
  | 10 => q 7 0
  | 11 => q 7 1
  | 12 => q 8 0
  | 13 => q 8 1
  | 14 => q 9 0
  | 15 => q 9 1
  | _ => 0

namespace EightCenterSeventeenEquality

/-- Original generator indices with nonzero cofactors in the exact identity. -/
private def activeIndices : List ℕ :=
  [0, 1, 2, 3, 4, 10, 11, 12, 13, 14, 17, 22, 23, 24, 25, 28, 29]

/-- The seventeen algebraically active squared-distance differences. -/
private def facts : List SparsePoly :=
  activeIndices.map fun i =>
    Problem97.Phase3SurvivorSingularSystem01.facts.getD i []

/-- Cofactors reindexed against `facts`. -/
private def cofactors : List (ℕ × SparsePoly) :=
  Problem97.Phase3SurvivorSingularSystem01.cofactors.mapIdx fun i c => (i, c.2)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Exact normalization expands the independently generated QQ identity.
private theorem checker :
    unitIdealCertCheckerNormalized facts cofactors = true := by
  native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- The finite case split unfolds the exact generated fact polynomials.
private theorem normalized_incompatible
    (q : Fin 10 → ℝ²)
    (hq0 : q 0 = pt 0 0)
    (hq1 : q 1 = pt 1 0)
    (h0 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 4))
    (h1 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 7))
    (h2 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 8))
    (h3 : coordSqDist (q 1) (q 0) = coordSqDist (q 1) (q 4))
    (h4 : coordSqDist (q 1) (q 0) = coordSqDist (q 1) (q 5))
    (h5 : coordSqDist (q 3) (q 0) = coordSqDist (q 3) (q 8))
    (h6 : coordSqDist (q 3) (q 0) = coordSqDist (q 3) (q 9))
    (h7 : coordSqDist (q 4) (q 2) = coordSqDist (q 4) (q 7))
    (h8 : coordSqDist (q 4) (q 2) = coordSqDist (q 4) (q 8))
    (h9 : coordSqDist (q 4) (q 2) = coordSqDist (q 4) (q 9))
    (h10 : coordSqDist (q 5) (q 0) = coordSqDist (q 5) (q 9))
    (h11 : coordSqDist (q 7) (q 1) = coordSqDist (q 7) (q 3))
    (h12 : coordSqDist (q 7) (q 1) = coordSqDist (q 7) (q 9))
    (h13 : coordSqDist (q 8) (q 1) = coordSqDist (q 8) (q 3))
    (h14 : coordSqDist (q 8) (q 1) = coordSqDist (q 8) (q 4))
    (h15 : coordSqDist (q 9) (q 1) = coordSqDist (q 9) (q 5))
    (h16 : coordSqDist (q 9) (q 1) = coordSqDist (q 9) (q 8)) :
    False := by
  simp [coordSqDist, pt, hq0, hq1] at h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10
  simp [coordSqDist, pt, hq1] at h11 h12 h13 h14 h15 h16
  apply false_of_unitIdealCertCheckerNormalized
    (tenPointCoordinateValuation q) facts cofactors checker
  simp only [facts, activeIndices, List.map_cons, List.map_nil, List.mem_cons,
    List.not_mem_nil, or_false, forall_eq_or_imp, forall_eq]
  repeat' apply And.intro
  all_goals
    simp [Problem97.Phase3SurvivorSingularSystem01.facts,
      tenPointCoordinateValuation, eval, evalMono]
  · nlinarith only [h0]
  · nlinarith only [h1]
  · nlinarith only [h2]
  · nlinarith only [h3]
  · nlinarith only [h4]
  · nlinarith only [h5]
  · nlinarith only [h6]
  · nlinarith only [h7]
  · nlinarith only [h8]
  · nlinarith only [h9]
  · nlinarith only [h10]
  · nlinarith only [h11]
  · nlinarith only [h12]
  · nlinarith only [h13]
  · nlinarith only [h14]
  · nlinarith only [h15]
  · nlinarith only [h16]

end EightCenterSeventeenEquality

/-- An eight-center, seventeen-equality subsystem certified to have no
injective planar realization.  The ten labels are arbitrary and need not form
the whole ambient pattern. -/
structure EightCenterSeventeenEqualityCollisionCore
    {α : Type*} (P : RowPattern α) where
  label : Fin 10 → α
  h01 : label 0 ≠ label 1
  e0 : EdgeClosure P (label 0, label 1) (label 0, label 4)
  e1 : EdgeClosure P (label 0, label 1) (label 0, label 7)
  e2 : EdgeClosure P (label 0, label 1) (label 0, label 8)
  e3 : EdgeClosure P (label 1, label 0) (label 1, label 4)
  e4 : EdgeClosure P (label 1, label 0) (label 1, label 5)
  e5 : EdgeClosure P (label 3, label 0) (label 3, label 8)
  e6 : EdgeClosure P (label 3, label 0) (label 3, label 9)
  e7 : EdgeClosure P (label 4, label 2) (label 4, label 7)
  e8 : EdgeClosure P (label 4, label 2) (label 4, label 8)
  e9 : EdgeClosure P (label 4, label 2) (label 4, label 9)
  e10 : EdgeClosure P (label 5, label 0) (label 5, label 9)
  e11 : EdgeClosure P (label 7, label 1) (label 7, label 3)
  e12 : EdgeClosure P (label 7, label 1) (label 7, label 9)
  e13 : EdgeClosure P (label 8, label 1) (label 8, label 3)
  e14 : EdgeClosure P (label 8, label 1) (label 8, label 4)
  e15 : EdgeClosure P (label 9, label 1) (label 9, label 5)
  e16 : EdgeClosure P (label 9, label 1) (label 9, label 8)

/-- The eight-center, seventeen-equality core has no injective planar
realization. -/
theorem not_realizes_of_eightCenterSeventeenEqualityCollisionCore
    {α : Type*} {P : RowPattern α}
    (core : EightCenterSeventeenEqualityCollisionCore P) :
    ¬ ∃ pointOf : α → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  let p : Fin 10 → ℝ² := fun i => pointOf (core.label i)
  have hp01 : p 0 ≠ p 1 := by
    intro h
    exact core.h01 (hreal.injective h)
  let q : Fin 10 → ℝ² := fun i => normalAxis (p 0) (p 1) (p i)
  have hq0 : q 0 = pt 0 0 := by
    ext j
    fin_cases j <;> simp [q, pt, normalAxis_self]
  have hq1 : q 1 = pt 1 0 := by
    ext j
    fin_cases j <;> simp [q, pt, normalAxis_witness hp01]
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have coord {c a b : Fin 10}
      (h : EdgeClosure P (core.label c, core.label a)
        (core.label c, core.label b)) :
      coordSqDist (q c) (q a) = coordSqDist (q c) (q b) := by
    apply normalAxis_coord_sqdist_eq_of_dist_eq hp01
    simpa [p, edgeDist] using sound h
  exact EightCenterSeventeenEquality.normalized_incompatible q hq0 hq1
    (coord core.e0) (coord core.e1) (coord core.e2) (coord core.e3)
    (coord core.e4) (coord core.e5) (coord core.e6) (coord core.e7)
    (coord core.e8) (coord core.e9) (coord core.e10) (coord core.e11)
    (coord core.e12) (coord core.e13) (coord core.e14) (coord core.e15)
    (coord core.e16)

namespace NineCenterEighteenEquality

/-- Original generator indices with nonzero cofactors in the exact identity. -/
private def activeIndices : List ℕ :=
  [0, 1, 2, 4, 5, 6, 8, 10, 12, 14, 15, 16, 17, 21, 22, 23, 26, 29]

/-- The eighteen algebraically active squared-distance differences. -/
private def facts : List SparsePoly :=
  activeIndices.map fun i =>
    Problem97.Census554.NineCenterEighteenEqualityCertificate.facts.getD i []

/-- Cofactors reindexed against `facts`. -/
private def cofactors : List (ℕ × SparsePoly) :=
  Problem97.Census554.NineCenterEighteenEqualityCertificate.cofactors.mapIdx
    fun i c => (i, c.2)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Exact normalization expands the independently generated QQ identity.
private theorem checker :
    unitIdealCertCheckerNormalized facts cofactors = true := by
  native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- The finite case split unfolds the exact generated fact polynomials.
private theorem normalized_incompatible
    (q : Fin 10 → ℝ²)
    (hq0 : q 0 = pt 0 0)
    (hq1 : q 1 = pt 1 0)
    (h0 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 2))
    (h1 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 4))
    (h2 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 8))
    (h3 : coordSqDist (q 1) (q 2) = coordSqDist (q 1) (q 5))
    (h4 : coordSqDist (q 1) (q 2) = coordSqDist (q 1) (q 7))
    (h5 : coordSqDist (q 2) (q 0) = coordSqDist (q 2) (q 3))
    (h6 : coordSqDist (q 2) (q 0) = coordSqDist (q 2) (q 5))
    (h7 : coordSqDist (q 3) (q 1) = coordSqDist (q 3) (q 5))
    (h8 : coordSqDist (q 4) (q 0) = coordSqDist (q 4) (q 2))
    (h9 : coordSqDist (q 4) (q 0) = coordSqDist (q 4) (q 9))
    (h10 : coordSqDist (q 5) (q 1) = coordSqDist (q 5) (q 3))
    (h11 : coordSqDist (q 5) (q 1) = coordSqDist (q 5) (q 7))
    (h12 : coordSqDist (q 5) (q 1) = coordSqDist (q 5) (q 9))
    (h13 : coordSqDist (q 7) (q 0) = coordSqDist (q 7) (q 1))
    (h14 : coordSqDist (q 7) (q 0) = coordSqDist (q 7) (q 8))
    (h15 : coordSqDist (q 7) (q 0) = coordSqDist (q 7) (q 9))
    (h16 : coordSqDist (q 8) (q 4) = coordSqDist (q 8) (q 9))
    (h17 : coordSqDist (q 9) (q 5) = coordSqDist (q 9) (q 8)) :
    False := by
  simp [coordSqDist, pt, hq0, hq1] at h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10
  simp [coordSqDist, pt, hq0, hq1] at h11 h12 h13 h14 h15 h16 h17
  apply false_of_unitIdealCertCheckerNormalized
    (tenPointCoordinateValuation q) facts cofactors checker
  simp only [facts, activeIndices, List.map_cons, List.map_nil, List.mem_cons,
    List.not_mem_nil, or_false, forall_eq_or_imp, forall_eq]
  repeat' apply And.intro
  all_goals
    simp [Problem97.Census554.NineCenterEighteenEqualityCertificate.facts,
      tenPointCoordinateValuation, eval, evalMono]
  · nlinarith only [h0]
  · nlinarith only [h1]
  · nlinarith only [h2]
  · nlinarith only [h3]
  · nlinarith only [h4]
  · nlinarith only [h5]
  · nlinarith only [h6]
  · nlinarith only [h7]
  · nlinarith only [h8]
  · nlinarith only [h9]
  · nlinarith only [h10]
  · nlinarith only [h11]
  · nlinarith only [h12]
  · nlinarith only [h13]
  · nlinarith only [h14]
  · nlinarith only [h15]
  · nlinarith only [h16]
  · nlinarith only [h17]

end NineCenterEighteenEquality

/-- A nine-center, eighteen-equality subsystem certified to have no injective
planar realization.  The ten labels are arbitrary and need not form the whole
ambient pattern. -/
structure NineCenterEighteenEqualityCollisionCore
    {α : Type*} (P : RowPattern α) where
  label : Fin 10 → α
  h01 : label 0 ≠ label 1
  e0 : EdgeClosure P (label 0, label 1) (label 0, label 2)
  e1 : EdgeClosure P (label 0, label 1) (label 0, label 4)
  e2 : EdgeClosure P (label 0, label 1) (label 0, label 8)
  e3 : EdgeClosure P (label 1, label 2) (label 1, label 5)
  e4 : EdgeClosure P (label 1, label 2) (label 1, label 7)
  e5 : EdgeClosure P (label 2, label 0) (label 2, label 3)
  e6 : EdgeClosure P (label 2, label 0) (label 2, label 5)
  e7 : EdgeClosure P (label 3, label 1) (label 3, label 5)
  e8 : EdgeClosure P (label 4, label 0) (label 4, label 2)
  e9 : EdgeClosure P (label 4, label 0) (label 4, label 9)
  e10 : EdgeClosure P (label 5, label 1) (label 5, label 3)
  e11 : EdgeClosure P (label 5, label 1) (label 5, label 7)
  e12 : EdgeClosure P (label 5, label 1) (label 5, label 9)
  e13 : EdgeClosure P (label 7, label 0) (label 7, label 1)
  e14 : EdgeClosure P (label 7, label 0) (label 7, label 8)
  e15 : EdgeClosure P (label 7, label 0) (label 7, label 9)
  e16 : EdgeClosure P (label 8, label 4) (label 8, label 9)
  e17 : EdgeClosure P (label 9, label 5) (label 9, label 8)

/-- The nine-center, eighteen-equality core has no injective planar
realization. -/
theorem not_realizes_of_nineCenterEighteenEqualityCollisionCore
    {α : Type*} {P : RowPattern α}
    (core : NineCenterEighteenEqualityCollisionCore P) :
    ¬ ∃ pointOf : α → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  let p : Fin 10 → ℝ² := fun i => pointOf (core.label i)
  have hp01 : p 0 ≠ p 1 := by
    intro h
    exact core.h01 (hreal.injective h)
  let q : Fin 10 → ℝ² := fun i => normalAxis (p 0) (p 1) (p i)
  have hq0 : q 0 = pt 0 0 := by
    ext j
    fin_cases j <;> simp [q, pt, normalAxis_self]
  have hq1 : q 1 = pt 1 0 := by
    ext j
    fin_cases j <;> simp [q, pt, normalAxis_witness hp01]
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have coord {c a b : Fin 10}
      (h : EdgeClosure P (core.label c, core.label a)
        (core.label c, core.label b)) :
      coordSqDist (q c) (q a) = coordSqDist (q c) (q b) := by
    apply normalAxis_coord_sqdist_eq_of_dist_eq hp01
    simpa [p, edgeDist] using sound h
  exact NineCenterEighteenEquality.normalized_incompatible q hq0 hq1
    (coord core.e0) (coord core.e1) (coord core.e2) (coord core.e3)
    (coord core.e4) (coord core.e5) (coord core.e6) (coord core.e7)
    (coord core.e8) (coord core.e9) (coord core.e10) (coord core.e11)
    (coord core.e12) (coord core.e13) (coord core.e14) (coord core.e15)
    (coord core.e16) (coord core.e17)

namespace TenCenterTwentySixEquality

/-- Original generator indices with nonzero cofactors in the exact identity. -/
private def activeIndices : List ℕ :=
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 15, 17, 18, 19, 20, 21, 22,
    23, 25, 26, 27, 28, 29]

/-- The twenty-six algebraically active squared-distance differences. -/
private def facts : List SparsePoly :=
  activeIndices.map fun i =>
    Problem97.Phase3SurvivorSingularSystem00.facts.getD i []

/-- Cofactors reindexed against `facts`. -/
private def cofactors : List (ℕ × SparsePoly) :=
  Problem97.Phase3SurvivorSingularSystem00.cofactors.mapIdx fun i c => (i, c.2)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Exact normalization expands the independently generated QQ identity.
private theorem checker :
    unitIdealCertCheckerNormalized facts cofactors = true := by
  native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- The finite case split unfolds the exact generated fact polynomials.
private theorem normalized_incompatible
    (q : Fin 10 → ℝ²)
    (hq0 : q 0 = pt 0 0)
    (hq1 : q 1 = pt 1 0)
    (h0 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 6))
    (h1 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 7))
    (h2 : coordSqDist (q 0) (q 1) = coordSqDist (q 0) (q 9))
    (h3 : coordSqDist (q 1) (q 0) = coordSqDist (q 1) (q 3))
    (h4 : coordSqDist (q 1) (q 0) = coordSqDist (q 1) (q 4))
    (h5 : coordSqDist (q 1) (q 0) = coordSqDist (q 1) (q 6))
    (h6 : coordSqDist (q 2) (q 0) = coordSqDist (q 2) (q 1))
    (h7 : coordSqDist (q 2) (q 0) = coordSqDist (q 2) (q 5))
    (h8 : coordSqDist (q 2) (q 0) = coordSqDist (q 2) (q 7))
    (h9 : coordSqDist (q 3) (q 4) = coordSqDist (q 3) (q 7))
    (h10 : coordSqDist (q 3) (q 4) = coordSqDist (q 3) (q 9))
    (h11 : coordSqDist (q 4) (q 1) = coordSqDist (q 4) (q 5))
    (h12 : coordSqDist (q 4) (q 1) = coordSqDist (q 4) (q 8))
    (h13 : coordSqDist (q 5) (q 0) = coordSqDist (q 5) (q 6))
    (h14 : coordSqDist (q 5) (q 0) = coordSqDist (q 5) (q 9))
    (h15 : coordSqDist (q 6) (q 2) = coordSqDist (q 6) (q 3))
    (h16 : coordSqDist (q 6) (q 2) = coordSqDist (q 6) (q 5))
    (h17 : coordSqDist (q 6) (q 2) = coordSqDist (q 6) (q 8))
    (h18 : coordSqDist (q 7) (q 1) = coordSqDist (q 7) (q 2))
    (h19 : coordSqDist (q 7) (q 1) = coordSqDist (q 7) (q 4))
    (h20 : coordSqDist (q 7) (q 1) = coordSqDist (q 7) (q 6))
    (h21 : coordSqDist (q 8) (q 2) = coordSqDist (q 8) (q 4))
    (h22 : coordSqDist (q 8) (q 2) = coordSqDist (q 8) (q 7))
    (h23 : coordSqDist (q 9) (q 3) = coordSqDist (q 9) (q 6))
    (h24 : coordSqDist (q 9) (q 3) = coordSqDist (q 9) (q 7))
    (h25 : coordSqDist (q 9) (q 3) = coordSqDist (q 9) (q 8)) :
    False := by
  simp [coordSqDist, pt, hq0, hq1] at h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10
  simp [coordSqDist, pt, hq0, hq1] at h11 h12 h13 h14 h15 h16 h17 h18
  simp [coordSqDist, pt, hq1] at h19 h20 h21 h22 h23 h24 h25
  apply false_of_unitIdealCertCheckerNormalized
    (tenPointCoordinateValuation q) facts cofactors checker
  simp only [facts, activeIndices, List.map_cons, List.map_nil, List.mem_cons,
    List.not_mem_nil, or_false, forall_eq_or_imp, forall_eq]
  repeat' apply And.intro
  all_goals
    simp [Problem97.Phase3SurvivorSingularSystem00.facts,
      tenPointCoordinateValuation, eval, evalMono]
  · nlinarith only [h0]
  · nlinarith only [h1]
  · nlinarith only [h2]
  · nlinarith only [h3]
  · nlinarith only [h4]
  · nlinarith only [h5]
  · nlinarith only [h6]
  · nlinarith only [h7]
  · nlinarith only [h8]
  · nlinarith only [h9]
  · nlinarith only [h10]
  · nlinarith only [h11]
  · nlinarith only [h12]
  · nlinarith only [h13]
  · nlinarith only [h14]
  · nlinarith only [h15]
  · nlinarith only [h16]
  · nlinarith only [h17]
  · nlinarith only [h18]
  · nlinarith only [h19]
  · nlinarith only [h20]
  · nlinarith only [h21]
  · nlinarith only [h22]
  · nlinarith only [h23]
  · nlinarith only [h24]
  · nlinarith only [h25]

end TenCenterTwentySixEquality

/-- A ten-center, twenty-six-equality subsystem certified to have no injective
planar realization.  The ten labels are arbitrary and need not form the whole
ambient pattern. -/
structure TenCenterTwentySixEqualityCollisionCore
    {α : Type*} (P : RowPattern α) where
  label : Fin 10 → α
  h01 : label 0 ≠ label 1
  e0 : EdgeClosure P (label 0, label 1) (label 0, label 6)
  e1 : EdgeClosure P (label 0, label 1) (label 0, label 7)
  e2 : EdgeClosure P (label 0, label 1) (label 0, label 9)
  e3 : EdgeClosure P (label 1, label 0) (label 1, label 3)
  e4 : EdgeClosure P (label 1, label 0) (label 1, label 4)
  e5 : EdgeClosure P (label 1, label 0) (label 1, label 6)
  e6 : EdgeClosure P (label 2, label 0) (label 2, label 1)
  e7 : EdgeClosure P (label 2, label 0) (label 2, label 5)
  e8 : EdgeClosure P (label 2, label 0) (label 2, label 7)
  e9 : EdgeClosure P (label 3, label 4) (label 3, label 7)
  e10 : EdgeClosure P (label 3, label 4) (label 3, label 9)
  e11 : EdgeClosure P (label 4, label 1) (label 4, label 5)
  e12 : EdgeClosure P (label 4, label 1) (label 4, label 8)
  e13 : EdgeClosure P (label 5, label 0) (label 5, label 6)
  e14 : EdgeClosure P (label 5, label 0) (label 5, label 9)
  e15 : EdgeClosure P (label 6, label 2) (label 6, label 3)
  e16 : EdgeClosure P (label 6, label 2) (label 6, label 5)
  e17 : EdgeClosure P (label 6, label 2) (label 6, label 8)
  e18 : EdgeClosure P (label 7, label 1) (label 7, label 2)
  e19 : EdgeClosure P (label 7, label 1) (label 7, label 4)
  e20 : EdgeClosure P (label 7, label 1) (label 7, label 6)
  e21 : EdgeClosure P (label 8, label 2) (label 8, label 4)
  e22 : EdgeClosure P (label 8, label 2) (label 8, label 7)
  e23 : EdgeClosure P (label 9, label 3) (label 9, label 6)
  e24 : EdgeClosure P (label 9, label 3) (label 9, label 7)
  e25 : EdgeClosure P (label 9, label 3) (label 9, label 8)

/-- The ten-center, twenty-six-equality core has no injective planar
realization. -/
theorem not_realizes_of_tenCenterTwentySixEqualityCollisionCore
    {α : Type*} {P : RowPattern α}
    (core : TenCenterTwentySixEqualityCollisionCore P) :
    ¬ ∃ pointOf : α → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  let p : Fin 10 → ℝ² := fun i => pointOf (core.label i)
  have hp01 : p 0 ≠ p 1 := by
    intro h
    exact core.h01 (hreal.injective h)
  let q : Fin 10 → ℝ² := fun i => normalAxis (p 0) (p 1) (p i)
  have hq0 : q 0 = pt 0 0 := by
    ext j
    fin_cases j <;> simp [q, pt, normalAxis_self]
  have hq1 : q 1 = pt 1 0 := by
    ext j
    fin_cases j <;> simp [q, pt, normalAxis_witness hp01]
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have coord {c a b : Fin 10}
      (h : EdgeClosure P (core.label c, core.label a)
        (core.label c, core.label b)) :
      coordSqDist (q c) (q a) = coordSqDist (q c) (q b) := by
    apply normalAxis_coord_sqdist_eq_of_dist_eq hp01
    simpa [p, edgeDist] using sound h
  exact TenCenterTwentySixEquality.normalized_incompatible q hq0 hq1
    (coord core.e0) (coord core.e1) (coord core.e2) (coord core.e3)
    (coord core.e4) (coord core.e5) (coord core.e6) (coord core.e7)
    (coord core.e8) (coord core.e9) (coord core.e10) (coord core.e11)
    (coord core.e12) (coord core.e13) (coord core.e14) (coord core.e15)
    (coord core.e16) (coord core.e17) (coord core.e18) (coord core.e19)
    (coord core.e20) (coord core.e21) (coord core.e22) (coord core.e23)
    (coord core.e24) (coord core.e25)

end EqualityCore
end Census554
end Problem97
