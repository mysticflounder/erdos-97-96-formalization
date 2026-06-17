import Erdos9796Proof.P97.N4dFaithfulFrame

/-!
# W2 `q'=a₂` non-witness upper-arc row: the `a₃` K4 cover

This module consumes the banked `Problem97.bisectorKill`
(`N4dBisectorKill.lean`) and the v₂-anchor / v₁-anchor faithful frames
(`N4dFaithfulFrame.lean`) to close the residual `q'=a₂` row.

**The cover (settled mathematics).**  Per
`docs/n-lane/97-n4d-qeqe-spec-b-falsification-2026-06-10.md` §5 and the joint
K4-census §4.2/§4.3, the shell's per-vertex K4 demand at the `C₃`-interior
point `a₃` is unsatisfiable: no four of the other eight named points can be
equidistant from `a₃`.  We realize this as a **finite 9-point cover**: with the
zero-defect layout, `A = {v₁,v₂,v₃,a₁,b₁,a₂,b₂,a₃,b₃}` (nine distinct points);
K4 at `a₃` yields a ≥4-card same-radius subfamily of the other eight; and every
4-subset of those eight contains one of nine **dead pairs**, each killed by
`bisectorKill`:

* v₂-anchor (members on `circle(v₂,1)`): `{v₁,a₂}`, `{v₃,a₂}`, `{v₁,b₂}`,
  `{v₃,b₂}`, `{a₂,b₂}`, `{v₁,v₃}`;
* v₁-anchor (members on `circle(v₁,1)`, needs `hcard`): `{a₁,b₁}`, `{v₂,a₁}`,
  `{v₂,b₁}`.

These nine pairs cover all `C(8,4) = 70` candidate subsets in **every**
p-branch, so no branch dispatch is needed.  The kill is uniform.

No new `axiom`, no `native_decide`, no `decide` on any real/geometric fact.
The only `decide` is the pure index combinatorics of the 70-subset cover.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97
namespace FiniteEndpointShell

/- ### Cap classification of the nine named points -/

/-- A point `p ∈ I₁` is a non-Moser point lying in cap `C₁` alone. -/
private theorem classify_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I1) :
    p ∈ A ∧ p ∈ S.CP.C1 ∧ p ∉ S.CP.C2 ∧ p ∉ S.CP.C3 := by
  have hC1 : p ∈ S.CP.C1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hp).1
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne1 : p ≠ S.triangle.v1 := fun h => S.CP.v1_notin_C1 (h ▸ hC1)
  have hA : p ∈ A := S.CP.C1_subset hC1
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, hC1, ?_, ?_⟩
  · intro hC2; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone

/-- A point `p ∈ I₂` is a non-Moser point lying in cap `C₂` alone. -/
private theorem classify_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I2) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∈ S.CP.C2 ∧ p ∉ S.CP.C3 := by
  have hC2 : p ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp hp).1
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne2 : p ≠ S.triangle.v2 := fun h => S.CP.v2_notin_C2 (h ▸ hC2)
  have hA : p ∈ A := S.CP.C2_subset hC2
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, hC2, ?_⟩
  · intro hC1; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC2, hC3, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone

/-- A point `p ∈ I₃` is a non-Moser point lying in cap `C₃` alone. -/
private theorem classify_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I3) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∉ S.CP.C2 ∧ p ∈ S.CP.C3 := by
  have hC3 : p ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp hp).1
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne3 : p ≠ S.triangle.v3 := fun h => S.CP.v3_notin_C3 (h ▸ hC3)
  have hA : p ∈ A := S.CP.C3_subset hC3
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, ?_, hC3⟩
  · intro hC1; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC2, hC3, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone

/-- Two points distinguished by membership in a common finset are distinct. -/
private theorem ne_of_mem_not_mem {α : Type*} {C : Finset α} {p q : α}
    (hp : p ∈ C) (hq : q ∉ C) : p ≠ q := fun h => hq (h ▸ hp)

/- ### `A` is exactly the nine named points -/

/-- **The nine named points exhaust `A`.**  In the zero-defect `(4,4,4)` shell,
`A = {v₁, v₂, v₃, a₁, b₁, a₂, b₂, a₃, b₃}` — nine distinct points (three Moser
vertices, each in two caps; six cap-interior points, each in one cap).  This is
the finiteness backbone of the K4 cover: a K4-class at `a₃` draws from these
nine, and (excluding `a₃` itself) from the other eight. -/
theorem A_eq_named {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    A = ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.a3, Z.b3}
      : Finset ℝ²) := by
  classical
  have ha1 := S.classify_I1 (show Z.a1 ∈ S.I1 by rw [Z.hI1]; simp)
  have hb1 := S.classify_I1 (show Z.b1 ∈ S.I1 by rw [Z.hI1]; simp)
  have ha2 := S.classify_I2 (show Z.a2 ∈ S.I2 by rw [Z.hI2]; simp)
  have hb2 := S.classify_I2 (show Z.b2 ∈ S.I2 by rw [Z.hI2]; simp)
  have ha3 := S.classify_I3 (show Z.a3 ∈ S.I3 by rw [Z.hI3]; simp)
  have hb3 := S.classify_I3 (show Z.b3 ∈ S.I3 by rw [Z.hI3]; simp)
  -- vertex cap profiles
  have v1c1 : S.triangle.v1 ∉ S.CP.C1 := S.CP.v1_notin_C1
  have v1c2 : S.triangle.v1 ∈ S.CP.C2 := S.CP.v1_mem_C2
  have v1c3 : S.triangle.v1 ∈ S.CP.C3 := S.CP.v1_mem_C3
  have v2c1 : S.triangle.v2 ∈ S.CP.C1 := S.CP.v2_mem_C1
  have v2c2 : S.triangle.v2 ∉ S.CP.C2 := S.CP.v2_notin_C2
  have v2c3 : S.triangle.v2 ∈ S.CP.C3 := S.CP.v2_mem_C3
  have v3c1 : S.triangle.v3 ∈ S.CP.C1 := S.CP.v3_mem_C1
  have v3c2 : S.triangle.v3 ∈ S.CP.C2 := S.CP.v3_mem_C2
  have v3c3 : S.triangle.v3 ∉ S.CP.C3 := S.CP.v3_notin_C3
  obtain ⟨_, a1c1, a1c2, a1c3⟩ := ha1
  obtain ⟨_, b1c1, b1c2, b1c3⟩ := hb1
  obtain ⟨_, a2c1, a2c2, a2c3⟩ := ha2
  obtain ⟨_, b2c1, b2c2, b2c3⟩ := hb2
  obtain ⟨_, a3c1, a3c2, a3c3⟩ := ha3
  obtain ⟨_, b3c1, b3c2, b3c3⟩ := hb3
  -- same-cap interior disequalities
  have e_a1b1 : Z.a1 ≠ Z.b1 := by
    have h : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by simpa [Z.hI1] using S.I1_card_eq_two
    intro h'; simp [h'] at h
  have e_a2b2 : Z.a2 ≠ Z.b2 := by
    have h : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by simpa [Z.hI2] using S.I2_card_eq_two
    intro h'; simp [h'] at h
  have e_a3b3 : Z.a3 ≠ Z.b3 := by
    have h : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by simpa [Z.hI3] using S.I3_card_eq_two
    intro h'; simp [h'] at h
  -- the remaining 33 disequalities, each via a distinguishing cap
  have e_v1v2 : S.triangle.v1 ≠ S.triangle.v2 := ne_of_mem_not_mem v1c2 v2c2
  have e_v1v3 : S.triangle.v1 ≠ S.triangle.v3 := ne_of_mem_not_mem v1c3 v3c3
  have e_v1a1 : S.triangle.v1 ≠ Z.a1 := ne_of_mem_not_mem v1c2 a1c2
  have e_v1b1 : S.triangle.v1 ≠ Z.b1 := ne_of_mem_not_mem v1c2 b1c2
  have e_v1a2 : S.triangle.v1 ≠ Z.a2 := ne_of_mem_not_mem v1c3 a2c3
  have e_v1b2 : S.triangle.v1 ≠ Z.b2 := ne_of_mem_not_mem v1c3 b2c3
  have e_v1a3 : S.triangle.v1 ≠ Z.a3 := ne_of_mem_not_mem v1c2 a3c2
  have e_v1b3 : S.triangle.v1 ≠ Z.b3 := ne_of_mem_not_mem v1c2 b3c2
  have e_v2v3 : S.triangle.v2 ≠ S.triangle.v3 := ne_of_mem_not_mem v2c3 v3c3
  have e_v2a1 : S.triangle.v2 ≠ Z.a1 := ne_of_mem_not_mem v2c3 a1c3
  have e_v2b1 : S.triangle.v2 ≠ Z.b1 := ne_of_mem_not_mem v2c3 b1c3
  have e_v2a2 : S.triangle.v2 ≠ Z.a2 := ne_of_mem_not_mem v2c1 a2c1
  have e_v2b2 : S.triangle.v2 ≠ Z.b2 := ne_of_mem_not_mem v2c1 b2c1
  have e_v2a3 : S.triangle.v2 ≠ Z.a3 := ne_of_mem_not_mem v2c1 a3c1
  have e_v2b3 : S.triangle.v2 ≠ Z.b3 := ne_of_mem_not_mem v2c1 b3c1
  have e_v3a1 : S.triangle.v3 ≠ Z.a1 := ne_of_mem_not_mem v3c2 a1c2
  have e_v3b1 : S.triangle.v3 ≠ Z.b1 := ne_of_mem_not_mem v3c2 b1c2
  have e_v3a2 : S.triangle.v3 ≠ Z.a2 := ne_of_mem_not_mem v3c1 a2c1
  have e_v3b2 : S.triangle.v3 ≠ Z.b2 := ne_of_mem_not_mem v3c1 b2c1
  have e_v3a3 : S.triangle.v3 ≠ Z.a3 := ne_of_mem_not_mem v3c1 a3c1
  have e_v3b3 : S.triangle.v3 ≠ Z.b3 := ne_of_mem_not_mem v3c1 b3c1
  have e_a1a2 : Z.a1 ≠ Z.a2 := ne_of_mem_not_mem a1c1 a2c1
  have e_a1b2 : Z.a1 ≠ Z.b2 := ne_of_mem_not_mem a1c1 b2c1
  have e_a1a3 : Z.a1 ≠ Z.a3 := ne_of_mem_not_mem a1c1 a3c1
  have e_a1b3 : Z.a1 ≠ Z.b3 := ne_of_mem_not_mem a1c1 b3c1
  have e_b1a2 : Z.b1 ≠ Z.a2 := ne_of_mem_not_mem b1c1 a2c1
  have e_b1b2 : Z.b1 ≠ Z.b2 := ne_of_mem_not_mem b1c1 b2c1
  have e_b1a3 : Z.b1 ≠ Z.a3 := ne_of_mem_not_mem b1c1 a3c1
  have e_b1b3 : Z.b1 ≠ Z.b3 := ne_of_mem_not_mem b1c1 b3c1
  have e_a2a3 : Z.a2 ≠ Z.a3 := ne_of_mem_not_mem a2c2 a3c2
  have e_a2b3 : Z.a2 ≠ Z.b3 := ne_of_mem_not_mem a2c2 b3c2
  have e_b2a3 : Z.b2 ≠ Z.a3 := ne_of_mem_not_mem b2c2 a3c2
  have e_b2b3 : Z.b2 ≠ Z.b3 := ne_of_mem_not_mem b2c2 b3c2
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact S.triangle.v1_mem
    · exact S.triangle.v2_mem
    · exact S.triangle.v3_mem
    · exact S.CP.C1_subset a1c1
    · exact S.CP.C1_subset b1c1
    · exact S.CP.C2_subset a2c2
    · exact S.CP.C2_subset b2c2
    · exact S.CP.C3_subset a3c3
    · exact S.CP.C3_subset b3c3
  · rw [S.hcard9]
    have hcard :
        ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.a3, Z.b3}
          : Finset ℝ²).card = 9 := by
      rw [Finset.card_insert_of_notMem (by
            simp [e_v1v2, e_v1v3, e_v1a1, e_v1b1, e_v1a2, e_v1b2, e_v1a3, e_v1b3]),
          Finset.card_insert_of_notMem (by
            simp [e_v2v3, e_v2a1, e_v2b1, e_v2a2, e_v2b2, e_v2a3, e_v2b3]),
          Finset.card_insert_of_notMem (by
            simp [e_v3a1, e_v3b1, e_v3a2, e_v3b2, e_v3a3, e_v3b3]),
          Finset.card_insert_of_notMem (by simp [e_a1b1, e_a1a2, e_a1b2, e_a1a3, e_a1b3]),
          Finset.card_insert_of_notMem (by simp [e_b1a2, e_b1b2, e_b1a3, e_b1b3]),
          Finset.card_insert_of_notMem (by simp [e_a2b2, e_a2a3, e_a2b3]),
          Finset.card_insert_of_notMem (by simp [e_b2a3, e_b2b3]),
          Finset.card_insert_of_notMem (by simp [e_a3b3]),
          Finset.card_singleton]
    rw [hcard]

/- ### Transporting `hXeq` through the similarity chart

For a dead pair `{P, Q}` with `a₃` at distance `r` from both, the K4-equidistance
`dist a₃ P = dist a₃ Q` transports through the (positive-scale) chart `T` to the
chart equidistance `bisectorKill` consumes as `hXeq`. -/

/-- Transport `dist x P = dist x Q` through a v₂-anchor chart. -/
private theorem hXeq_transport_v2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.T x) (F.T P) = dist (F.T x) (F.T Q) := by
  rw [F.tau.dist_image, F.tau.dist_image, hP, hQ]

/-- Transport `dist x P = dist x Q` through a v₁-anchor chart. -/
private theorem hXeq_transport_v1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.base.T x) (F.base.T P) = dist (F.base.T x) (F.base.T Q) := by
  rw [F.base.tau.dist_image, F.base.tau.dist_image, hP, hQ]

/- ### The nine per-pair `bisectorKill` kills at `a₃`

Each takes the standing `a₃`-facts (`a₃ ∈ A`, the cap-`C₃` lower sign in the
relevant frame, and `a₃ ≠` the anchor) plus the two `circle(a₃, r)` distance
pins of the pair, and closes `False` via the banked `bisectorKill`. -/

/-- Kill the v₂-anchor dead pair `{v₁, a₂}` at `a₃`. -/
private theorem kill_v1a2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v1 = r) (hQ : dist Z.a3 Z.a2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1a2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.a2) (F.T Z.a3)
    hXdisk (hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₂-anchor dead pair `{v₃, a₂}` at `a₃`. -/
private theorem kill_v3a2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v3 = r) (hQ : dist Z.a3 Z.a2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3a2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v3) (F.T Z.a2) (F.T Z.a3)
    hXdisk (hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₂-anchor dead pair `{v₁, b₂}` at `a₃`. -/
private theorem kill_v1b2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v1 = r) (hQ : dist Z.a3 Z.b2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1b2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.b2) (F.T Z.a3)
    hXdisk (hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₂-anchor dead pair `{v₃, b₂}` at `a₃`. -/
private theorem kill_v3b2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v3 = r) (hQ : dist Z.a3 Z.b2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3b2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v3) (F.T Z.b2) (F.T Z.a3)
    hXdisk (hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₂-anchor dead pair `{a₂, b₂}` at `a₃`. -/
private theorem kill_a2b2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 Z.a2 = r) (hQ : dist Z.a3 Z.b2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a2b2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T Z.a2) (F.T Z.b2) (F.T Z.a3)
    hXdisk (hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₂-anchor dead pair `{v₁, v₃}` at `a₃`. -/
private theorem kill_v1v3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v1 = r) (hQ : dist Z.a3 S.triangle.v3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1v3 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T S.triangle.v3) (F.T Z.a3)
    hXdisk (hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₁-anchor dead pair `{a₁, b₁}` at `a₃`. -/
private theorem kill_a1b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    (hP : dist Z.a3 Z.a1 = r) (hQ : dist Z.a3 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a1b1 ha3A ha3y ha3v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T Z.a1) (F.base.T Z.b1) (F.base.T Z.a3)
    hXdisk (hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₁-anchor dead pair `{v₂, a₁}` at `a₃`. -/
private theorem kill_v2a1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    (hP : dist Z.a3 S.triangle.v2 = r) (hQ : dist Z.a3 Z.a1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2a1 ha3A ha3y ha3v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v2) (F.base.T Z.a1) (F.base.T Z.a3)
    hXdisk (hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/-- Kill the v₁-anchor dead pair `{v₂, b₁}` at `a₃`. -/
private theorem kill_v2b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    (hP : dist Z.a3 S.triangle.v2 = r) (hQ : dist Z.a3 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2b1 ha3A ha3y ha3v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v2) (F.base.T Z.b1) (F.base.T Z.a3)
    hXdisk (hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne

/- ### The 70-subset cover, factored through the two dead-pair cliques

The nine dead pairs split into two complete "cliques" plus a free vertex:

* `KA := {v₁, v₃, a₂, b₂}` — **all six** of its pairs are v₂-anchor dead pairs;
* `KB := {a₁, b₁, v₂}` — **all three** of its pairs are v₁-anchor dead pairs;
* `b₃` — in no dead pair.

So a `circle(a₃, r)` class `T` with no dead pair meets `KA` in ≤ 1 point and
`KB` in ≤ 1 point, hence `|T| ≤ |T∩KA| + |T∩KB| + |T∩{b₃}| ≤ 3`.  A K4-class
has `|T| ≥ 4`, so `T` meets one clique twice — yielding a dead pair, killed by
`bisectorKill`.  This is the entire `C(8,4) = 70` cover, branch-independent. -/

/-- Two distinct `KA`-members at common radius `r` from `a₃` give `False` (every
`KA` pair is a v₂-anchor dead pair). -/
private theorem kill_KA {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    {p q : ℝ²}
    (hp : p ∈ ({S.triangle.v1, S.triangle.v3, Z.a2, Z.b2} : Finset ℝ²))
    (hq : q ∈ ({S.triangle.v1, S.triangle.v3, Z.a2, Z.b2} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a3 p = r) (hqr : dist Z.a3 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl | rfl
  · exact hpq rfl
  · exact kill_v1v3 F ha3A ha3y ha3v2 hpr hqr
  · exact kill_v1a2 F ha3A ha3y ha3v2 hpr hqr
  · exact kill_v1b2 F ha3A ha3y ha3v2 hpr hqr
  · exact kill_v1v3 F ha3A ha3y ha3v2 hqr hpr
  · exact hpq rfl
  · exact kill_v3a2 F ha3A ha3y ha3v2 hpr hqr
  · exact kill_v3b2 F ha3A ha3y ha3v2 hpr hqr
  · exact kill_v1a2 F ha3A ha3y ha3v2 hqr hpr
  · exact kill_v3a2 F ha3A ha3y ha3v2 hqr hpr
  · exact hpq rfl
  · exact kill_a2b2 F ha3A ha3y ha3v2 hpr hqr
  · exact kill_v1b2 F ha3A ha3y ha3v2 hqr hpr
  · exact kill_v3b2 F ha3A ha3y ha3v2 hqr hpr
  · exact kill_a2b2 F ha3A ha3y ha3v2 hqr hpr
  · exact hpq rfl

/-- Two distinct `KB`-members at common radius `r` from `a₃` give `False` (every
`KB` pair is a v₁-anchor dead pair). -/
private theorem kill_KB {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    {p q : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hq : q ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a3 p = r) (hqr : dist Z.a3 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl
  · exact hpq rfl
  · exact kill_a1b1 F ha3A ha3y ha3v1 hpr hqr
  · exact kill_v2a1 F ha3A ha3y ha3v1 hqr hpr
  · exact kill_a1b1 F ha3A ha3y ha3v1 hqr hpr
  · exact hpq rfl
  · exact kill_v2b1 F ha3A ha3y ha3v1 hqr hpr
  · exact kill_v2a1 F ha3A ha3y ha3v1 hpr hqr
  · exact kill_v2b1 F ha3A ha3y ha3v1 hpr hqr
  · exact hpq rfl

/- ### The top-level cover theorem -/

/-- **The `a₃` K4 cover.**  From the row's frame inputs — `hexact` (giving the
v₂-anchor frame and the `circle(v₂,1)` pins of `v₁,v₃,a₂,b₂`), `hC3pin`+`hcard`
(giving the v₁-anchor frame and the `circle(v₁,1)` pins of `a₁,b₁,v₂`) — the
shell's per-vertex K4 demand at the cap-`C₃` interior point `a₃` is
unsatisfiable.

No four of the other eight named points are equidistant from `a₃`: the
`circle(a₃, r)` class meets the dead-pair clique `{v₁,v₃,a₂,b₂}` (all v₂-anchor
dead pairs) in ≤ 1 point and `{a₁,b₁,v₂}` (all v₁-anchor dead pairs) in ≤ 1
point, so it has ≤ 3 members — but K4 demands ≥ 4.  Branch-independent: no
`hpacket` / p-branch is consulted. -/
theorem a3_k4_cover {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC3pin : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    False := by
  classical
  -- the two faithful frames
  let F2 := S.v2AnchorFrame_of_hexact Z hexact
  let F1 := S.v1AnchorFrame_of_hexact Z hC3pin hcard hexact
  -- `a₃`'s standing facts (cap-`C₃` interior, off the two anchors)
  have ha3I3 : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
  obtain ⟨ha3A, _, _, _⟩ := S.classify_I3 ha3I3
  -- `a₃ ≠ v₁`, `a₃ ≠ v₂` from the `I₃ = (C₃.erase v₁).erase v₂` exclusion
  have ha3ne : Z.a3 ≠ S.triangle.v1 ∧ Z.a3 ≠ S.triangle.v2 := by
    have hne1 : Z.a3 ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha3I3).2).1
    have hne2 : Z.a3 ≠ S.triangle.v2 := (Finset.mem_erase.mp ha3I3).1
    exact ⟨hne1, hne2⟩
  -- K4 at `a₃`: a same-radius class `T` of size ≥ 4
  obtain ⟨r2, hr2pos, hTcard⟩ := S.hK4 Z.a3 ha3A
  set T : Finset ℝ² := A.filter (fun x => dist Z.a3 x = r2) with hTdef
  have hT4 : 4 ≤ T.card := hTcard
  have ha3notT : Z.a3 ∉ T := by
    rw [hTdef]; simp only [Finset.mem_filter]
    rintro ⟨_, hd⟩; rw [dist_self] at hd; exact absurd hd.symm (ne_of_gt hr2pos)
  -- `T ⊆ {8 named}` (the nine named points minus `a₃`)
  have hTsub : T ⊆ ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.b3}
      : Finset ℝ²) := by
    intro x hxT
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    have hxne_a3 : x ≠ Z.a3 := fun h => ha3notT (h ▸ hxT)
    have hx9 : x ∈ ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2,
        Z.a3, Z.b3} : Finset ℝ²) := by rw [← S.A_eq_named Z]; exact hxA
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx9 ⊢
    rcases hx9 with h|h|h|h|h|h|h|h|h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h)))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))))
    · exact absurd h hxne_a3
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))))
  -- pigeonhole over the two cliques
  set KA : Finset ℝ² := {S.triangle.v1, S.triangle.v3, Z.a2, Z.b2} with hKA
  set KB : Finset ℝ² := {Z.a1, Z.b1, S.triangle.v2} with hKB
  have hpigeon : 2 ≤ (T ∩ KA).card ∨ 2 ≤ (T ∩ KB).card := by
    by_contra h
    push_neg at h
    obtain ⟨hAlt, hBlt⟩ := h
    have hsub : T ⊆ KA ∪ KB ∪ {Z.b3} := by
      intro x hx
      have := hTsub hx
      simp only [hKA, hKB, Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at this ⊢
      tauto
    have h1 : T ⊆ (T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b3}) := by
      intro x hx
      have := hsub hx
      simp only [Finset.mem_union, Finset.mem_inter] at this ⊢
      tauto
    have hb : (T ∩ {Z.b3}).card ≤ 1 := by
      calc (T ∩ {Z.b3}).card ≤ ({Z.b3} : Finset ℝ²).card :=
            Finset.card_le_card Finset.inter_subset_right
        _ = 1 := Finset.card_singleton _
    have hle3 : T.card ≤ 3 := by
      calc T.card ≤ ((T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b3})).card := Finset.card_le_card h1
        _ ≤ (T ∩ KA).card + (T ∩ KB).card + (T ∩ {Z.b3}).card := by
            refine le_trans (Finset.card_union_le _ _) ?_
            exact Nat.add_le_add_right (Finset.card_union_le _ _) _
        _ ≤ 3 := by omega
    omega
  -- in either case, extract two distinct class-members of a clique, then kill
  have ha3yF2 : (F2.T Z.a3) 1 ≤ 0 := F2.ha3_y
  have ha3yF1 : (F1.base.T Z.a3) 1 ≤ 0 := F1.base.ha3_y
  rcases hpigeon with hKA2 | hKB2
  · obtain ⟨p, hpKA, q, hqKA, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KA).card)
    have hpT := Finset.mem_of_mem_inter_left hpKA
    have hqT := Finset.mem_of_mem_inter_left hqKA
    have hpKA' := Finset.mem_of_mem_inter_right hpKA
    have hqKA' := Finset.mem_of_mem_inter_right hqKA
    have hpr : dist Z.a3 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a3 q = r2 := (Finset.mem_filter.mp hqT).2
    exact kill_KA F2 ha3A ha3yF2 ha3ne.2 hpKA' hqKA' hpq hpr hqr
  · obtain ⟨p, hpKB, q, hqKB, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KB).card)
    have hpT := Finset.mem_of_mem_inter_left hpKB
    have hqT := Finset.mem_of_mem_inter_left hqKB
    have hpKB' := Finset.mem_of_mem_inter_right hpKB
    have hqKB' := Finset.mem_of_mem_inter_right hqKB
    have hpr : dist Z.a3 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a3 q = r2 := (Finset.mem_filter.mp hqT).2
    exact kill_KB F1 ha3A ha3yF1 ha3ne.1 hpKB' hqKB' hpq hpr hqr

end FiniteEndpointShell
end Problem97
