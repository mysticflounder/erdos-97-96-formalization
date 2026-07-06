/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Erdos9796Proof.P97.TwoCircleCrossing

/-!
# U5 global-incidence support helpers

This file contains lightweight support-payload lemmas for U5 global incidence.
It deliberately stays separate from `U5GlobalIncidenceKernels.lean`, whose
bounded-audit metric incompatibility proofs are slow to compile.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- Every center used by the bounded audit is present in the q-deleted
skeleton once the dangerous triple, selected candidate, and auxiliary vertices
are present there. -/
theorem U5DangerousTriple.audit_center_mem_skeleton
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u a0 a1 x : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ha0 : a0 ∈ (D.skeleton q).erase p)
    (ha1 : a1 ∈ (D.skeleton q).erase p)
    (hx : x ∈ U5BoundedAuditCenters D q p T u a0 a1) :
    x ∈ D.skeleton q := by
  rw [U5BoundedAuditCenters] at hx
  simp only [Finset.mem_insert] at hx
  rcases hx with rfl | rfl | rfl | hxT
  · exact (Finset.mem_erase.mp hsel.candidate_mem).2
  · exact (Finset.mem_erase.mp ha0).2
  · exact (Finset.mem_erase.mp ha1).2
  · exact (Finset.mem_erase.mp (htriple.T_subset hxT)).2

/-- Package the 4A q-critical alternative as an exact q-critical triple class.

The selected set is the whole q-deleted radius class at radius `dist center q`;
the q-critical hypothesis says that this class has exactly three points. -/
theorem U5QCriticalTripleClass.exists_card_three_of_qCritical
    {D : CounterexampleData} {q center : ℝ²}
    (hcritical :
      ∃ r : ℝ, 0 < r ∧ dist center q = r ∧
        ((((D.skeleton q).erase center).filter
          fun y => dist center y = r).card = 3)) :
    ∃ B : Finset ℝ², Nonempty (U5QCriticalTripleClass D q center B) ∧
      B.card = 3 := by
  classical
  rcases hcritical with ⟨r, hr_pos, hqr, hcard⟩
  let B : Finset ℝ² :=
    ((D.skeleton q).erase center).filter fun y => dist center y = r
  refine ⟨B, ⟨?_, ?_⟩⟩
  · refine ⟨?_, ?_, ?_, ?_⟩
    · intro y hy
      exact (Finset.mem_filter.mp hy).1
    · exact hcard
    · simpa [hqr] using hr_pos
    · intro y hy
      exact ((Finset.mem_filter.mp hy).2).trans hqr.symm
  · exact hcard

/-- A q-allowed four-point class containing `q` is a q-critical triple after
erasing `q`. -/
theorem U5QAllowedK4Class.qCriticalTriple_of_mem_q
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QAllowedK4Class D center B)
    (hcard : B.card = 4)
    (hqB : q ∈ B) :
    Nonempty (U5QCriticalTripleClass D q center (B.erase q)) := by
  classical
  refine ⟨{
    subset := ?_
    card_three := ?_
    q_radius_pos := ?_
    same_q_radius := ?_
  }⟩
  · intro y hy
    have hyErase := Finset.mem_erase.mp hy
    have hy_ne_q : y ≠ q := hyErase.1
    have hyB : y ∈ B := hyErase.2
    have hySkelCenter : y ∈ D.skeleton center := K.subset hyB
    change y ∈ D.A.erase center at hySkelCenter
    have hy_ne_center : y ≠ center := (Finset.mem_erase.mp hySkelCenter).1
    have hyA : y ∈ D.A := (Finset.mem_erase.mp hySkelCenter).2
    exact Finset.mem_erase.mpr
      ⟨hy_ne_center, Finset.mem_erase.mpr ⟨hy_ne_q, hyA⟩⟩
  · rw [Finset.card_erase_of_mem hqB, hcard]
  · have hqRadius : dist center q = K.radius := K.same_radius q hqB
    simpa [hqRadius] using K.radius_pos
  · intro y hy
    have hyB : y ∈ B := (Finset.mem_erase.mp hy).2
    exact (K.same_radius y hyB).trans (K.same_radius q hqB).symm

/-- A q-allowed four-point class not containing `q` is an exact q-deleted
class with the same carrier. -/
def U5QAllowedK4Class.toQDeletedK4Class_of_not_mem_q
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QAllowedK4Class D center B)
    (hqNotB : q ∉ B) :
    U5QDeletedK4Class D q center B where
  subset := by
    intro y hyB
    have hySkelCenter : y ∈ D.skeleton center := K.subset hyB
    change y ∈ D.A.erase center at hySkelCenter
    have hy_ne_center : y ≠ center := (Finset.mem_erase.mp hySkelCenter).1
    have hyA : y ∈ D.A := (Finset.mem_erase.mp hySkelCenter).2
    have hy_ne_q : y ≠ q := by
      intro hyq
      exact hqNotB (by simpa [hyq] using hyB)
    exact Finset.mem_erase.mpr
      ⟨hy_ne_center, Finset.mem_erase.mpr ⟨hy_ne_q, hyA⟩⟩
  card_four := K.card_four
  q_not_mem := hqNotB
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.same_radius

/-- A q-critical class at a non-`p` center can contain at most one dangerous
triple point.

The point `q` is implicit in a q-critical class.  If two distinct points of
`T` also belonged to the q-critical class, then the center circle and the
dangerous `p`-circle would share the three distinct points `q`, `t₁`, and
`t₂`, contradicting the two-circle intersection theorem. -/
theorem U5QCriticalTripleClass.two_triple_points_incompatibility
    {D : CounterexampleData} {q p center t₁ t₂ : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QCriticalTripleClass D q center B)
    (hcenter_ne_p : center ≠ p)
    (ht₁T : t₁ ∈ T) (ht₂T : t₂ ∈ T) (ht₁₂ : t₁ ≠ t₂)
    (ht₁B : t₁ ∈ B) (ht₂B : t₂ ∈ B) : False := by
  let sc : Sphere ℝ² := ⟨center, dist center q⟩
  let sp : Sphere ℝ² := ⟨p, dist p q⟩
  have hsne : sc ≠ sp := by
    intro h
    exact hcenter_ne_p (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hqsc : q ∈ sc := by
    rw [mem_sphere]
    exact dist_comm q center
  have ht₁sc : t₁ ∈ sc := by
    rw [mem_sphere]
    calc
      dist t₁ center = dist center t₁ := dist_comm t₁ center
      _ = dist center q := K.same_q_radius t₁ ht₁B
  have ht₂sc : t₂ ∈ sc := by
    rw [mem_sphere]
    calc
      dist t₂ center = dist center t₂ := dist_comm t₂ center
      _ = dist center q := K.same_q_radius t₂ ht₂B
  have hqsp : q ∈ sp := by
    rw [mem_sphere]
    exact dist_comm q p
  have ht₁sp : t₁ ∈ sp := by
    rw [mem_sphere]
    calc
      dist t₁ p = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁T
  have ht₂sp : t₂ ∈ sp := by
    rw [mem_sphere]
    calc
      dist t₂ p = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂T
  have hq_ne_t₁ : q ≠ t₁ := by
    have ht₁_skeleton : t₁ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₁T)).2
    have ht₁_erase_q : t₁ ∈ D.A.erase q := by
      change t₁ ∈ D.A.erase q at ht₁_skeleton
      exact ht₁_skeleton
    exact (Finset.mem_erase.mp ht₁_erase_q).1.symm
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂T)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  rcases two_circle_common_point_eq_endpoint
      hsne hq_ne_t₁ hqsc ht₁sc hqsp ht₁sp ht₂sc ht₂sp with
    ht₂q | ht₂t₁
  · exact hq_ne_t₂ ht₂q.symm
  · exact ht₁₂ ht₂t₁.symm

/-- q-critical/exact/q-critical chain incompatibility along the dangerous triple.

If a q-critical class at `left` contains `p` and `mid`, an exact q-free class
at `mid` contains `p` and `right`, and a q-critical class at `right` contains
`p`, then the `left`- and `right`-centered circles share `p`, `q`, and `mid`.
Distinct planar circles cannot share three points. -/
theorem U5QCriticalTripleClass.qcritical_exact_qcritical_chain_incompatibility
    {D : CounterexampleData} {q p left mid right : ℝ²}
    {T Bleft Bmid Bright : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hmidT : mid ∈ T) (hrightT : right ∈ T)
    (hleft_ne_right : left ≠ right)
    (Kleft : U5QCriticalTripleClass D q left Bleft)
    (Kmid : U5QDeletedK4Class D q mid Bmid)
    (Kright : U5QCriticalTripleClass D q right Bright)
    (hpBleft : p ∈ Bleft) (hmidBleft : mid ∈ Bleft)
    (hpBmid : p ∈ Bmid) (hrightBmid : right ∈ Bmid)
    (hpBright : p ∈ Bright) : False := by
  let sleft : Sphere ℝ² := ⟨left, dist left q⟩
  let sright : Sphere ℝ² := ⟨right, dist right q⟩
  have hsne : sleft ≠ sright := by
    intro h
    exact hleft_ne_right (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hpsleft : p ∈ sleft := by
    rw [mem_sphere]
    calc
      dist p left = dist left p := dist_comm p left
      _ = dist left q := Kleft.same_q_radius p hpBleft
  have hqsleft : q ∈ sleft := by
    rw [mem_sphere]
    exact dist_comm q left
  have hmidsleft : mid ∈ sleft := by
    rw [mem_sphere]
    calc
      dist mid left = dist left mid := dist_comm mid left
      _ = dist left q := Kleft.same_q_radius mid hmidBleft
  have hpsright : p ∈ sright := by
    rw [mem_sphere]
    calc
      dist p right = dist right p := dist_comm p right
      _ = dist right q := Kright.same_q_radius p hpBright
  have hqsright : q ∈ sright := by
    rw [mem_sphere]
    exact dist_comm q right
  have hmidsright : mid ∈ sright := by
    rw [mem_sphere]
    calc
      dist mid right = Kmid.radius := Kmid.same_radius right hrightBmid
      _ = dist mid p := (Kmid.same_radius p hpBmid).symm
      _ = dist p mid := dist_comm mid p
      _ = dist p q := htriple.T_same_radius mid hmidT
      _ = dist p right := (htriple.T_same_radius right hrightT).symm
      _ = dist right p := dist_comm p right
      _ = dist right q := Kright.same_q_radius p hpBright
  have hmid_ne_p : mid ≠ p := (Finset.mem_erase.mp (htriple.T_subset hmidT)).1
  have hmid_ne_q : mid ≠ q := by
    have hmid_skeleton : mid ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset hmidT)).2
    have hmid_erase_q : mid ∈ D.A.erase q := by
      change mid ∈ D.A.erase q at hmid_skeleton
      exact hmid_skeleton
    exact (Finset.mem_erase.mp hmid_erase_q).1
  rcases two_circle_common_point_eq_endpoint
      hsne htriple.p_ne_q hpsleft hqsleft hpsright hqsright
      hmidsleft hmidsright with hmidp | hmidq
  · exact hmid_ne_p hmidp
  · exact hmid_ne_q hmidq

/-- q-critical equilateral-bridge incompatibility.

Suppose a dangerous-triple center `a` is q-critical through `p`, another
dangerous-triple center `b`, and the selected point `x`; suppose the exact
q-free class at `b` contains `p` and `x`; and suppose the q-critical class at
`x` contains `a`.  Then the `b`-centered circle and the `q`-centered circle of
dangerous radius share `p`, `a`, and `x`, impossible for distinct centers. -/
theorem U5QCriticalTripleClass.qcritical_equilateral_bridge_incompatibility
    {D : CounterexampleData} {q p a b x : ℝ²}
    {T Ba Bb Bx : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T x)
    (haT : a ∈ T) (hbT : b ∈ T)
    (Ka : U5QCriticalTripleClass D q a Ba)
    (Kb : U5QDeletedK4Class D q b Bb)
    (Kx : U5QCriticalTripleClass D q x Bx)
    (hpBa : p ∈ Ba) (hbBa : b ∈ Ba) (hxBa : x ∈ Ba)
    (hpBb : p ∈ Bb) (hxBb : x ∈ Bb)
    (haBx : a ∈ Bx) : False := by
  let sb : Sphere ℝ² := ⟨b, dist p q⟩
  let sq : Sphere ℝ² := ⟨q, dist p q⟩
  have hb_ne_q : b ≠ q := by
    have hb_skeleton : b ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset hbT)).2
    have hb_erase_q : b ∈ D.A.erase q := by
      change b ∈ D.A.erase q at hb_skeleton
      exact hb_skeleton
    exact (Finset.mem_erase.mp hb_erase_q).1
  have hsne : sb ≠ sq := by
    intro h
    exact hb_ne_q (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hpsb : p ∈ sb := by
    rw [mem_sphere]
    calc
      dist p b = dist b p := dist_comm p b
      _ = dist p b := dist_comm b p
      _ = dist p q := htriple.T_same_radius b hbT
  have hasb : a ∈ sb := by
    rw [mem_sphere]
    calc
      dist a b = dist b a := dist_comm a b
      _ = dist a b := dist_comm b a
      _ = dist a p := (Ka.same_q_radius b hbBa).trans
          (Ka.same_q_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := htriple.T_same_radius a haT
  have hxsb : x ∈ sb := by
    rw [mem_sphere]
    calc
      dist x b = dist b x := dist_comm x b
      _ = Kb.radius := Kb.same_radius x hxBb
      _ = dist b p := (Kb.same_radius p hpBb).symm
      _ = dist p b := dist_comm b p
      _ = dist p q := htriple.T_same_radius b hbT
  have hpsq : p ∈ sq := by
    rw [mem_sphere]
  have hasq : a ∈ sq := by
    rw [mem_sphere]
    calc
      dist a q = dist a p := (Ka.same_q_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := htriple.T_same_radius a haT
  have hxsq : x ∈ sq := by
    rw [mem_sphere]
    calc
      dist x q = dist x a := (Kx.same_q_radius a haBx).symm
      _ = dist a x := dist_comm x a
      _ = dist a p := (Ka.same_q_radius x hxBa).trans
          (Ka.same_q_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := htriple.T_same_radius a haT
  have hp_ne_a : p ≠ a := by
    exact (Finset.mem_erase.mp (htriple.T_subset haT)).1.symm
  have hx_ne_p : x ≠ p := (Finset.mem_erase.mp hsel.candidate_mem).1
  have hx_ne_a : x ≠ a := by
    intro hxa
    exact hsel.candidate_notin_T (by simpa [← hxa] using haT)
  rcases two_circle_common_point_eq_endpoint
      hsne hp_ne_a hpsb hasb hpsq hasq hxsb hxsq with hxp | hxa
  · exact hx_ne_p hxp
  · exact hx_ne_a hxa

/-- Two exact q-deleted K4 classes centered at distinct points overlap in at
most two vertices.

This discharges the `two_circle_overlap` field of an audited support payload
once the selected classes have been supplied: the two witness classes lie on
two distinct Euclidean circles, and two distinct planar circles cannot share
three points. -/
theorem U5QDeletedK4Class.inter_card_le_two
    {D : CounterexampleData} {q x y : ℝ²} {Bx By : Finset ℝ²}
    (Kx : U5QDeletedK4Class D q x Bx)
    (Ky : U5QDeletedK4Class D q y By)
    (hxy : x ≠ y) :
    (Bx ∩ By).card ≤ 2 := by
  by_contra hle
  have h3 : 3 ≤ (Bx ∩ By).card := by omega
  rcases Finset.exists_subset_card_eq (s := Bx ∩ By) h3 with
    ⟨E, hEsubset, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have haBx : a ∈ Bx := (Finset.mem_inter.mp (hEsubset haE)).1
  have hbBx : b ∈ Bx := (Finset.mem_inter.mp (hEsubset hbE)).1
  have hcBx : c ∈ Bx := (Finset.mem_inter.mp (hEsubset hcE)).1
  have haBy : a ∈ By := (Finset.mem_inter.mp (hEsubset haE)).2
  have hbBy : b ∈ By := (Finset.mem_inter.mp (hEsubset hbE)).2
  have hcBy : c ∈ By := (Finset.mem_inter.mp (hEsubset hcE)).2
  let sx : Sphere ℝ² := ⟨x, Kx.radius⟩
  let sy : Sphere ℝ² := ⟨y, Ky.radius⟩
  have hsne : sx ≠ sy := by
    intro h
    exact hxy (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hasx : a ∈ sx := by
    rw [mem_sphere]
    calc
      dist a x = dist x a := dist_comm a x
      _ = Kx.radius := Kx.same_radius a haBx
  have hbsx : b ∈ sx := by
    rw [mem_sphere]
    calc
      dist b x = dist x b := dist_comm b x
      _ = Kx.radius := Kx.same_radius b hbBx
  have hcsx : c ∈ sx := by
    rw [mem_sphere]
    calc
      dist c x = dist x c := dist_comm c x
      _ = Kx.radius := Kx.same_radius c hcBx
  have hasy : a ∈ sy := by
    rw [mem_sphere]
    calc
      dist a y = dist y a := dist_comm a y
      _ = Ky.radius := Ky.same_radius a haBy
  have hbsy : b ∈ sy := by
    rw [mem_sphere]
    calc
      dist b y = dist y b := dist_comm b y
      _ = Ky.radius := Ky.same_radius b hbBy
  have hcsy : c ∈ sy := by
    rw [mem_sphere]
    calc
      dist c y = dist y c := dist_comm c y
      _ = Ky.radius := Ky.same_radius c hcBy
  rcases two_circle_common_point_eq_endpoint hsne hab
      hasx hbsx hasy hbsy hcsx hcsy with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

/-- The q-allowed analogue of `U5QDeletedK4Class.inter_card_le_two`.

The proof uses only the circle geometry, not the `q ∉ B` restriction, so the
same two-circle argument applies verbatim. -/
theorem U5QAllowedK4Class.inter_card_le_two
    {D : CounterexampleData} {x y : ℝ²} {Bx By : Finset ℝ²}
    (Kx : U5QAllowedK4Class D x Bx)
    (Ky : U5QAllowedK4Class D y By)
    (hxy : x ≠ y) :
    (Bx ∩ By).card ≤ 2 := by
  by_contra hle
  have h3 : 3 ≤ (Bx ∩ By).card := by omega
  rcases Finset.exists_subset_card_eq (s := Bx ∩ By) h3 with
    ⟨E, hEsubset, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have haBx : a ∈ Bx := (Finset.mem_inter.mp (hEsubset haE)).1
  have hbBx : b ∈ Bx := (Finset.mem_inter.mp (hEsubset hbE)).1
  have hcBx : c ∈ Bx := (Finset.mem_inter.mp (hEsubset hcE)).1
  have haBy : a ∈ By := (Finset.mem_inter.mp (hEsubset haE)).2
  have hbBy : b ∈ By := (Finset.mem_inter.mp (hEsubset hbE)).2
  have hcBy : c ∈ By := (Finset.mem_inter.mp (hEsubset hcE)).2
  let sx : Sphere ℝ² := ⟨x, Kx.radius⟩
  let sy : Sphere ℝ² := ⟨y, Ky.radius⟩
  have hsne : sx ≠ sy := by
    intro h
    exact hxy (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hasx : a ∈ sx := by
    rw [mem_sphere]
    calc
      dist a x = dist x a := dist_comm a x
      _ = Kx.radius := Kx.same_radius a haBx
  have hbsx : b ∈ sx := by
    rw [mem_sphere]
    calc
      dist b x = dist x b := dist_comm b x
      _ = Kx.radius := Kx.same_radius b hbBx
  have hcsx : c ∈ sx := by
    rw [mem_sphere]
    calc
      dist c x = dist x c := dist_comm c x
      _ = Kx.radius := Kx.same_radius c hcBx
  have hasy : a ∈ sy := by
    rw [mem_sphere]
    calc
      dist a y = dist y a := dist_comm a y
      _ = Ky.radius := Ky.same_radius a haBy
  have hbsy : b ∈ sy := by
    rw [mem_sphere]
    calc
      dist b y = dist y b := dist_comm b y
      _ = Ky.radius := Ky.same_radius b hbBy
  have hcsy : c ∈ sy := by
    rw [mem_sphere]
    calc
      dist c y = dist y c := dist_comm c y
      _ = Ky.radius := Ky.same_radius c hcBy
  rcases two_circle_common_point_eq_endpoint hsne hab
      hasx hbsx hasy hbsy hcsx hcsy with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

/-- An exact q-deleted K4 class at a non-`p` center can meet the dangerous
`p`-circle `{q} ∪ T` in at most two points.

This is the q-critical analogue of the pairwise two-circle overlap field used
by the bounded audit: the selected class lies on a circle centered at
`center`, while `{q} ∪ T` lies on the circle centered at `p` with radius
`dist p q`.  Distinct Euclidean circles cannot share three points. -/
theorem U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QDeletedK4Class D q center B)
    (hcenter_ne_p : center ≠ p) :
    (B ∩ insert q T).card ≤ 2 := by
  classical
  by_contra hle
  have h3 : 3 ≤ (B ∩ insert q T).card := by omega
  rcases Finset.exists_subset_card_eq (s := B ∩ insert q T) h3 with
    ⟨E, hEsubset, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have haB : a ∈ B := (Finset.mem_inter.mp (hEsubset haE)).1
  have hbB : b ∈ B := (Finset.mem_inter.mp (hEsubset hbE)).1
  have hcB : c ∈ B := (Finset.mem_inter.mp (hEsubset hcE)).1
  have haP : a ∈ insert q T := (Finset.mem_inter.mp (hEsubset haE)).2
  have hbP : b ∈ insert q T := (Finset.mem_inter.mp (hEsubset hbE)).2
  have hcP : c ∈ insert q T := (Finset.mem_inter.mp (hEsubset hcE)).2
  have hpCircle {z : ℝ²} (hz : z ∈ insert q T) :
      dist z p = dist p q := by
    rw [Finset.mem_insert] at hz
    rcases hz with rfl | hzT
    · simpa using dist_comm z p
    · calc
        dist z p = dist p z := dist_comm z p
        _ = dist p q := htriple.T_same_radius z hzT
  let sx : Sphere ℝ² := ⟨center, K.radius⟩
  let sp : Sphere ℝ² := ⟨p, dist p q⟩
  have hsne : sx ≠ sp := by
    intro h
    exact hcenter_ne_p (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hasx : a ∈ sx := by
    rw [mem_sphere]
    calc
      dist a center = dist center a := dist_comm a center
      _ = K.radius := K.same_radius a haB
  have hbsx : b ∈ sx := by
    rw [mem_sphere]
    calc
      dist b center = dist center b := dist_comm b center
      _ = K.radius := K.same_radius b hbB
  have hcsx : c ∈ sx := by
    rw [mem_sphere]
    calc
      dist c center = dist center c := dist_comm c center
      _ = K.radius := K.same_radius c hcB
  have hasp : a ∈ sp := by
    rw [mem_sphere]
    exact hpCircle haP
  have hbsp : b ∈ sp := by
    rw [mem_sphere]
    exact hpCircle hbP
  have hcsp : c ∈ sp := by
    rw [mem_sphere]
    exact hpCircle hcP
  rcases two_circle_common_point_eq_endpoint hsne hab
      hasx hbsx hasp hbsp hcsx hcsp with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

/-- A q-deleted four-point class centered away from the dangerous center cannot
contain all three dangerous-triple points. -/
theorem U5QDeletedK4Class.not_dangerous_triple_subset_of_ne_center
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QDeletedK4Class D q center B)
    (hcenter_ne_p : center ≠ p) :
    ¬ T ⊆ B := by
  intro hTB
  have hT_inter : T ⊆ B ∩ insert q T := by
    intro t ht
    exact Finset.mem_inter.mpr
      ⟨hTB ht, Finset.mem_insert.mpr (Or.inr ht)⟩
  have h3 : 3 ≤ (B ∩ insert q T).card := by
    have hcard := Finset.card_le_card hT_inter
    simpa [htriple.T_card] using hcard
  have hle2 :
      (B ∩ insert q T).card ≤ 2 :=
    U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
      htriple K hcenter_ne_p
  omega

/-- A q-allowed four-point class centered away from the dangerous center can
meet the dangerous `p`-circle `{q} ∪ T` in at most two points. -/
theorem U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QAllowedK4Class D center B)
    (hcenter_ne_p : center ≠ p) :
    (B ∩ insert q T).card ≤ 2 := by
  classical
  have hq_not_T : q ∉ T := by
    intro hqT
    have hqS : q ∈ (D.skeleton q).erase p := htriple.T_subset hqT
    have hqSkel : q ∈ D.skeleton q := (Finset.mem_erase.mp hqS).2
    have hqErase : q ∈ D.A.erase q := by
      rw [CounterexampleData.skeleton] at hqSkel
      exact hqSkel
    exact (Finset.mem_erase.mp hqErase).1 rfl
  let Kp : U5QAllowedK4Class D p (insert q T) := {
    subset := by
      intro y hy
      rw [Finset.mem_insert] at hy
      rcases hy with rfl | hyT
      · exact Finset.mem_erase.mpr ⟨htriple.p_ne_q.symm, htriple.q_mem⟩
      · have hyS : y ∈ (D.skeleton q).erase p := htriple.T_subset hyT
        have hy_ne_p : y ≠ p := (Finset.mem_erase.mp hyS).1
        have hySkel : y ∈ D.skeleton q := (Finset.mem_erase.mp hyS).2
        have hyEraseQ : y ∈ D.A.erase q := by
          simpa [CounterexampleData.skeleton] using hySkel
        have hyA : y ∈ D.A := (Finset.mem_erase.mp hyEraseQ).2
        exact Finset.mem_erase.mpr ⟨hy_ne_p, hyA⟩
    card_four := by
      rw [Finset.card_insert_of_notMem hq_not_T, htriple.T_card]
    radius := dist p q
    radius_pos := htriple.q_radius_pos
    same_radius := by
      intro y hy
      rw [Finset.mem_insert] at hy
      rcases hy with rfl | hyT
      · rfl
      · exact htriple.T_same_radius y hyT
  }
  exact U5QAllowedK4Class.inter_card_le_two K Kp hcenter_ne_p

/-- A q-allowed four-point class centered away from the dangerous center cannot
contain all three dangerous-triple points. -/
theorem U5QAllowedK4Class.not_dangerous_triple_subset_of_ne_center
    {D : CounterexampleData} {q p center : ℝ²} {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QAllowedK4Class D center B)
    (hcenter_ne_p : center ≠ p) :
    ¬ T ⊆ B := by
  intro hTB
  have hT_inter : T ⊆ B ∩ insert q T := by
    intro t ht
    exact Finset.mem_inter.mpr
      ⟨hTB ht, Finset.mem_insert.mpr (Or.inr ht)⟩
  have h3 : 3 ≤ (B ∩ insert q T).card := by
    have hcard := Finset.card_le_card hT_inter
    simpa [htriple.T_card] using hcard
  have hle2 :
      (B ∩ insert q T).card ≤ 2 :=
    U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two
      htriple K hcenter_ne_p
  omega

/-- Every selected q-deleted audited-support class has at most two points
on the dangerous circle support `{q} ∪ T`. -/
theorem U5BoundedAuditSupport.selected_inter_dangerous_p_circle_card_le_two
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5BoundedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    (((H.selected_classes x hx).1) ∩ insert q T).card ≤ 2 := by
  have hx_ne_p : x ≠ p := by
    have hxCenter := hx
    rw [U5BoundedAuditCenters] at hxCenter
    simp only [Finset.mem_insert] at hxCenter
    rcases hxCenter with rfl | rfl | rfl | hxT
    · exact (Finset.mem_erase.mp hsel.candidate_mem).1
    · exact (Finset.mem_erase.mp H.a0_mem).1
    · exact (Finset.mem_erase.mp H.a1_mem).1
    · exact (Finset.mem_erase.mp (htriple.T_subset hxT)).1
  exact U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
    htriple ((H.selected_classes x hx).2).1 hx_ne_p

/-- Every selected q-deleted audited-support class has at least two points off
the dangerous circle support `{q} ∪ T`. -/
theorem U5BoundedAuditSupport.two_le_selected_sdiff_dangerous_circle_card
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5BoundedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    2 ≤ (((H.selected_classes x hx).1) \ insert q T).card := by
  classical
  let B : Finset ℝ² := (H.selected_classes x hx).1
  let C : Finset ℝ² := insert q T
  have hsum : (B ∩ C).card + (B \ C).card = B.card :=
    Finset.card_inter_add_card_sdiff B C
  have hBcard : B.card = 4 := by
    simpa [B] using H.selected_card_four x hx
  have hle2 : (B ∩ C).card ≤ 2 := by
    simpa [B, C] using
      U5BoundedAuditSupport.selected_inter_dangerous_p_circle_card_le_two
        htriple hsel H hx
  have htwo : 2 ≤ (B \ C).card := by
    omega
  simpa [B, C] using htwo

/-- Points in a selected q-deleted audited-support class outside `{q} ∪ T`
must be non-center anchors. -/
theorem U5BoundedAuditSupport.selected_sdiff_dangerous_circle_subset_anchorSupport_erase_center
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (H : U5BoundedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    ((H.selected_classes x hx).1 \ insert q T) ⊆
      ((H.selected_classes x hx).1 ∩
        (({p, u, H.a0, H.a1} : Finset ℝ²).erase x)) := by
  classical
  let B : Finset ℝ² := (H.selected_classes x hx).1
  let C : Finset ℝ² := insert q T
  let A : Finset ℝ² := ({p, u, H.a0, H.a1} : Finset ℝ²).erase x
  intro y hy
  have hyB : y ∈ B := (Finset.mem_sdiff.mp hy).1
  have hy_not_C : y ∉ C := (Finset.mem_sdiff.mp hy).2
  have hy_not_circle : y ∉ insert q T := by
    simpa [C] using hy_not_C
  have hySupport :
      y ∈ U5BoundedSupport D q p T u H.a0 H.a1 :=
    ((H.selected_classes x hx).2).2 (by simpa [B] using hyB)
  have hyAnchor : y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²) := by
    rw [U5BoundedSupport] at hySupport
    simp only [Finset.mem_insert] at hySupport hy_not_circle
    rcases hySupport with hp | hq | hu | ha0 | ha1 | hyT
    · simp [hp]
    · exact False.elim (hy_not_circle (Or.inl hq))
    · simp [hu]
    · simp [ha0]
    · simp [ha1]
    · exact False.elim (hy_not_circle (Or.inr hyT))
  have hy_ne_x : y ≠ x :=
    (Finset.mem_erase.mp
      (((H.selected_classes x hx).2).1.subset (by simpa [B] using hyB))).1
  exact Finset.mem_inter.mpr
    ⟨hyB, by simpa [A] using Finset.mem_erase.mpr ⟨hy_ne_x, hyAnchor⟩⟩

/-- In native audited support, selected points off `{q} ∪ T` are exactly the
selected non-center anchors. -/
theorem U5BoundedAuditSupport.selected_sdiff_dangerous_circle_eq_anchor_inter
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5BoundedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    ((H.selected_classes x hx).1 \ insert q T) =
      ((H.selected_classes x hx).1 ∩
        (({p, u, H.a0, H.a1} : Finset ℝ²).erase x)) := by
  classical
  apply Finset.Subset.antisymm
  · exact
      U5BoundedAuditSupport.selected_sdiff_dangerous_circle_subset_anchorSupport_erase_center
        H hx
  · intro y hy
    have hyB : y ∈ (H.selected_classes x hx).1 := (Finset.mem_inter.mp hy).1
    have hyAnchorErase :
        y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²).erase x :=
      (Finset.mem_inter.mp hy).2
    have hyAnchor : y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²) :=
      (Finset.mem_erase.mp hyAnchorErase).2
    have hu_ne_q : u ≠ q := by
      have huSkel : u ∈ D.skeleton q :=
        (Finset.mem_erase.mp hsel.candidate_mem).2
      rw [CounterexampleData.skeleton] at huSkel
      exact (Finset.mem_erase.mp huSkel).1
    have ha0_ne_q : H.a0 ≠ q := by
      have ha0Skel : H.a0 ∈ D.skeleton q :=
        (Finset.mem_erase.mp H.a0_mem).2
      rw [CounterexampleData.skeleton] at ha0Skel
      exact (Finset.mem_erase.mp ha0Skel).1
    have ha1_ne_q : H.a1 ≠ q := by
      have ha1Skel : H.a1 ∈ D.skeleton q :=
        (Finset.mem_erase.mp H.a1_mem).2
      rw [CounterexampleData.skeleton] at ha1Skel
      exact (Finset.mem_erase.mp ha1Skel).1
    have hy_not_circle : y ∉ insert q T := by
      simp only [Finset.mem_insert] at hyAnchor ⊢
      rcases hyAnchor with hp | hu | ha0 | ha1
      · subst y
        intro hpCircle
        rcases hpCircle with hpq | hpT
        · exact htriple.p_ne_q hpq
        · exact (Finset.mem_erase.mp (htriple.T_subset hpT)).1 rfl
      · subst y
        intro huCircle
        rcases huCircle with huq | huT
        · exact hu_ne_q huq
        · exact hsel.candidate_notin_T huT
      · subst y
        intro ha0Circle
        rcases ha0Circle with ha0q | ha0T
        · exact ha0_ne_q ha0q
        · exact H.a0_notin_base (Finset.mem_insert.mpr (Or.inr ha0T))
      · simp only [Finset.mem_singleton] at ha1
        subst y
        intro ha1Circle
        rcases ha1Circle with ha1q | ha1T
        · exact ha1_ne_q ha1q
        · exact H.a1_notin_base
            (Finset.mem_insert.mpr
              (Or.inr (Finset.mem_insert.mpr (Or.inr ha1T))))
    exact Finset.mem_sdiff.mpr ⟨hyB, hy_not_circle⟩

/-- Every selected q-deleted audited-support class contains at least two
non-center anchors among `p,u,a0,a1`. -/
theorem U5BoundedAuditSupport.two_le_selected_inter_anchorSupport_erase_center_card
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5BoundedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    2 ≤ (((H.selected_classes x hx).1) ∩
      (({p, u, H.a0, H.a1} : Finset ℝ²).erase x)).card := by
  classical
  let B : Finset ℝ² := (H.selected_classes x hx).1
  let C : Finset ℝ² := insert q T
  let A : Finset ℝ² := ({p, u, H.a0, H.a1} : Finset ℝ²).erase x
  have htwo : 2 ≤ (B \ C).card := by
    simpa [B, C] using
      U5BoundedAuditSupport.two_le_selected_sdiff_dangerous_circle_card
        htriple hsel H hx
  have hsub : B \ C ⊆ B ∩ A := by
    simpa [B, C, A] using
      U5BoundedAuditSupport.selected_sdiff_dangerous_circle_subset_anchorSupport_erase_center
        H hx
  have hcard_le : (B \ C).card ≤ (B ∩ A).card := Finset.card_le_card hsub
  have htwo_anchor : 2 ≤ (B ∩ A).card := le_trans htwo hcard_le
  simpa [B, A] using htwo_anchor

/-- Every selected q-allowed class in audited support has at most two points
on the dangerous circle support `{q} ∪ T`. -/
theorem U5QAllowedAuditSupport.selected_inter_dangerous_p_circle_card_le_two
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    (((H.selected_classes x hx).1) ∩ insert q T).card ≤ 2 := by
  have hx_ne_p : x ≠ p := by
    have hxCenter := hx
    rw [U5BoundedAuditCenters] at hxCenter
    simp only [Finset.mem_insert] at hxCenter
    rcases hxCenter with rfl | rfl | rfl | hxT
    · exact (Finset.mem_erase.mp hsel.candidate_mem).1
    · exact (Finset.mem_erase.mp H.a0_mem).1
    · exact (Finset.mem_erase.mp H.a1_mem).1
    · exact (Finset.mem_erase.mp (htriple.T_subset hxT)).1
  exact U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two
    htriple ((H.selected_classes x hx).2).1 hx_ne_p

/-- Every selected q-allowed audited-support class has at least two points off
the dangerous circle support `{q} ∪ T`. -/
theorem U5QAllowedAuditSupport.two_le_selected_sdiff_dangerous_circle_card
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    2 ≤ (((H.selected_classes x hx).1) \ insert q T).card := by
  classical
  let B : Finset ℝ² := (H.selected_classes x hx).1
  let C : Finset ℝ² := insert q T
  have hsum : (B ∩ C).card + (B \ C).card = B.card :=
    Finset.card_inter_add_card_sdiff B C
  have hBcard : B.card = 4 := by
    simpa [B] using H.selected_card_four x hx
  have hle2 : (B ∩ C).card ≤ 2 := by
    simpa [B, C] using
      U5QAllowedAuditSupport.selected_inter_dangerous_p_circle_card_le_two
        htriple hsel H hx
  have htwo : 2 ≤ (B \ C).card := by
    omega
  simpa [B, C] using htwo

/-- No selected q-allowed audited-support class can contain the full dangerous
circle support `{q} ∪ T`. -/
theorem U5QAllowedAuditSupport.selected_not_dangerous_circle_subset
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    ¬ insert q T ⊆ (H.selected_classes x hx).1 := by
  classical
  intro hsub
  have hq_not_T : q ∉ T := by
    intro hqT
    have hqS : q ∈ (D.skeleton q).erase p := htriple.T_subset hqT
    have hqSkel : q ∈ D.skeleton q := (Finset.mem_erase.mp hqS).2
    have hqErase : q ∈ D.A.erase q := by
      rw [CounterexampleData.skeleton] at hqSkel
      exact hqSkel
    exact (Finset.mem_erase.mp hqErase).1 rfl
  have hcircle_card : (insert q T).card = 4 := by
    rw [Finset.card_insert_of_notMem hq_not_T, htriple.T_card]
  have hcircle_inter :
      insert q T ⊆ (H.selected_classes x hx).1 ∩ insert q T := by
    intro y hy
    exact Finset.mem_inter.mpr ⟨hsub hy, hy⟩
  have h4 : 4 ≤ ((H.selected_classes x hx).1 ∩ insert q T).card := by
    have hcard := Finset.card_le_card hcircle_inter
    simpa [hcircle_card] using hcard
  have hle2 :
      ((H.selected_classes x hx).1 ∩ insert q T).card ≤ 2 :=
    U5QAllowedAuditSupport.selected_inter_dangerous_p_circle_card_le_two
      htriple hsel H hx
  omega

/-- Every selected q-allowed audited-support class contains a point off the
dangerous circle support `{q} ∪ T`. -/
theorem U5QAllowedAuditSupport.selected_exists_notMem_dangerous_circle
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    ∃ y, y ∈ (H.selected_classes x hx).1 ∧ y ∉ insert q T := by
  classical
  by_contra hnone
  have hsub :
      (H.selected_classes x hx).1 ⊆ insert q T := by
    intro y hy
    by_contra hyCircle
    exact hnone ⟨y, hy, hyCircle⟩
  have hq_not_T : q ∉ T := by
    intro hqT
    have hqS : q ∈ (D.skeleton q).erase p := htriple.T_subset hqT
    have hqSkel : q ∈ D.skeleton q := (Finset.mem_erase.mp hqS).2
    have hqErase : q ∈ D.A.erase q := by
      rw [CounterexampleData.skeleton] at hqSkel
      exact hqSkel
    exact (Finset.mem_erase.mp hqErase).1 rfl
  have hcircle_card : (insert q T).card = 4 := by
    rw [Finset.card_insert_of_notMem hq_not_T, htriple.T_card]
  have hcircle_le_selected :
      (insert q T).card ≤ ((H.selected_classes x hx).1).card := by
    rw [hcircle_card, H.selected_card_four x hx]
  have hselected_eq_circle :
      (H.selected_classes x hx).1 = insert q T :=
    (Finset.subset_iff_eq_of_card_le hcircle_le_selected).mp hsub
  have hcircle_subset :
      insert q T ⊆ (H.selected_classes x hx).1 := by
    intro y hy
    simpa [hselected_eq_circle] using hy
  exact U5QAllowedAuditSupport.selected_not_dangerous_circle_subset
    htriple hsel H hx hcircle_subset

/-- Every selected q-allowed audited-support class contains one of the
non-dangerous-circle anchors `p,u,a0,a1`. -/
theorem U5QAllowedAuditSupport.selected_exists_mem_anchorSupport
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    ∃ y, y ∈ (H.selected_classes x hx).1 ∧
      y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²) := by
  classical
  rcases U5QAllowedAuditSupport.selected_exists_notMem_dangerous_circle
      htriple hsel H hx with
    ⟨y, hyB, hy_not_circle⟩
  have hySupport :
      y ∈ U5QAllowedBoundedSupport D q p T u H.a0 H.a1 :=
    ((H.selected_classes x hx).2).2 hyB
  have hyAnchor : y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²) := by
    rw [U5QAllowedBoundedSupport, U5BoundedSupport] at hySupport
    simp only [Finset.mem_insert] at hySupport hy_not_circle
    rcases hySupport with hq | hp | hq | hu | ha0 | ha1 | hyT
    · exact False.elim (hy_not_circle (Or.inl hq))
    · simp [hp]
    · exact False.elim (hy_not_circle (Or.inl hq))
    · simp [hu]
    · simp [ha0]
    · simp [ha1]
    · exact False.elim (hy_not_circle (Or.inr hyT))
  exact ⟨y, hyB, hyAnchor⟩

/-- The forced anchor in a selected q-allowed audited-support class is not the
selected center itself. -/
theorem U5QAllowedAuditSupport.selected_exists_mem_anchorSupport_erase_center
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    ∃ y, y ∈ (H.selected_classes x hx).1 ∧
      y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²).erase x := by
  classical
  rcases U5QAllowedAuditSupport.selected_exists_mem_anchorSupport
      htriple hsel H hx with
    ⟨y, hyB, hyAnchor⟩
  have hy_ne_x : y ≠ x :=
    (Finset.mem_erase.mp (((H.selected_classes x hx).2).1.subset hyB)).1
  exact ⟨y, hyB, Finset.mem_erase.mpr ⟨hy_ne_x, hyAnchor⟩⟩

/-- Every selected q-allowed audited-support class contains at least two
non-center anchors among `p,u,a0,a1`. -/
theorem U5QAllowedAuditSupport.two_le_selected_inter_anchorSupport_erase_center_card
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedAuditSupport D q p T u)
    {x : ℝ²} (hx : x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1) :
    2 ≤ (((H.selected_classes x hx).1) ∩
      (({p, u, H.a0, H.a1} : Finset ℝ²).erase x)).card := by
  classical
  let B : Finset ℝ² := (H.selected_classes x hx).1
  let C : Finset ℝ² := insert q T
  let A : Finset ℝ² := ({p, u, H.a0, H.a1} : Finset ℝ²).erase x
  have htwo : 2 ≤ (B \ C).card := by
    simpa [B, C] using
      U5QAllowedAuditSupport.two_le_selected_sdiff_dangerous_circle_card
        htriple hsel H hx
  have hsub : B \ C ⊆ B ∩ A := by
    intro y hy
    have hyB : y ∈ B := (Finset.mem_sdiff.mp hy).1
    have hy_not_C : y ∉ C := (Finset.mem_sdiff.mp hy).2
    have hy_not_circle : y ∉ insert q T := by
      simpa [C] using hy_not_C
    have hySupport :
        y ∈ U5QAllowedBoundedSupport D q p T u H.a0 H.a1 :=
      ((H.selected_classes x hx).2).2 (by simpa [B] using hyB)
    have hyAnchor : y ∈ ({p, u, H.a0, H.a1} : Finset ℝ²) := by
      rw [U5QAllowedBoundedSupport, U5BoundedSupport] at hySupport
      simp only [Finset.mem_insert] at hySupport hy_not_circle
      rcases hySupport with hq | hp | hq | hu | ha0 | ha1 | hyT
      · exact False.elim (hy_not_circle (Or.inl hq))
      · simp [hp]
      · exact False.elim (hy_not_circle (Or.inl hq))
      · simp [hu]
      · simp [ha0]
      · simp [ha1]
      · exact False.elim (hy_not_circle (Or.inr hyT))
    have hy_ne_x : y ≠ x :=
      (Finset.mem_erase.mp
        (((H.selected_classes x hx).2).1.subset (by simpa [B] using hyB))).1
    exact Finset.mem_inter.mpr
      ⟨hyB, by simpa [A] using Finset.mem_erase.mpr ⟨hy_ne_x, hyAnchor⟩⟩
  have hcard_le : (B \ C).card ≤ (B ∩ A).card := Finset.card_le_card hsub
  have htwo_anchor : 2 ≤ (B ∩ A).card := le_trans htwo hcard_le
  simpa [B, A] using htwo_anchor

/-- Upgrade bounded support data to audited bounded support once the
off-circle and exact-cardinality fields are supplied.

The pairwise-overlap field is automatic: the selected classes are exact
q-deleted classes centered at distinct points, so `inter_card_le_two` applies.
-/
def U5BoundedAuditSupport.of_boundedSupport_cardFour
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (hsupport : U5BoundedEightPointSupport D q p T u)
    (ha0 : dist p hsupport.a0 ≠ dist p q)
    (ha1 : dist p hsupport.a1 ≠ dist p q)
    (hcard : ∀ x hx, ((hsupport.selected_classes x hx).1).card = 4) :
    U5BoundedAuditSupport D q p T u where
  toU5BoundedEightPointSupport := hsupport
  a0_off_circle := ha0
  a1_off_circle := ha1
  selected_card_four := hcard
  two_circle_overlap := by
    intro x hx y hy hxy
    exact U5QDeletedK4Class.inter_card_le_two
      ((hsupport.selected_classes x hx).2).1
      ((hsupport.selected_classes y hy).2).1 hxy

/-- Upgrade q-allowed bounded support data to q-allowed audited support once
the off-circle and exact-cardinality fields are supplied.

The pairwise-overlap field is automatic for the same geometric reason as the
q-free branch: distinct selected classes are supported on distinct circles, so
the two-circle intersection bound applies. -/
def U5QAllowedAuditSupport.of_boundedSupport_cardFour
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (hsupport : U5QAllowedBoundedEightPointSupport D q p T u)
    (ha0 : dist p hsupport.a0 ≠ dist p q)
    (ha1 : dist p hsupport.a1 ≠ dist p q)
    (hcard : ∀ x hx, ((hsupport.selected_classes x hx).1).card = 4) :
    U5QAllowedAuditSupport D q p T u where
  toU5QAllowedBoundedEightPointSupport := hsupport
  a0_off_circle := ha0
  a1_off_circle := ha1
  selected_card_four := hcard
  two_circle_overlap := by
    intro x hx y hy hxy
    exact U5QAllowedK4Class.inter_card_le_two
      ((hsupport.selected_classes x hx).2).1
      ((hsupport.selected_classes y hy).2).1 hxy

/-- Constructor form for audited bounded support from explicit selected classes.

The caller supplies the auxiliary vertices, their support membership, exact
four-point selected classes with bounded containment, and the off-circle facts.
The pairwise-overlap field is filled by the two-circle intersection lemma. -/
def U5BoundedAuditSupport.of_selectedClasses
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (a0 a1 : ℝ²)
    (ha0_mem : a0 ∈ (D.skeleton q).erase p)
    (ha1_mem : a1 ∈ (D.skeleton q).erase p)
    (ha0_notin_base : a0 ∉ insert u T)
    (ha1_notin_base : a1 ∉ insert u (insert a0 T))
    (ha0_off : dist p a0 ≠ dist p q)
    (ha1_off : dist p a1 ≠ dist p q)
    (classes :
      ∀ x ∈ U5BoundedAuditCenters D q p T u a0 a1,
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QDeletedK4Class D q x B =>
            B ⊆ U5BoundedSupport D q p T u a0 a1)
    (hcard : ∀ x hx, ((classes x hx).1).card = 4) :
    U5BoundedAuditSupport D q p T u := by
  let hsupport : U5BoundedEightPointSupport D q p T u :=
    { a0 := a0
      a1 := a1
      a0_mem := ha0_mem
      a1_mem := ha1_mem
      a0_notin_base := ha0_notin_base
      a1_notin_base := ha1_notin_base
      selected_classes := classes }
  exact U5BoundedAuditSupport.of_boundedSupport_cardFour
    hsupport ha0_off ha1_off hcard

/-- Constructor form for q-allowed audited support from explicit selected
classes.

This mirrors `U5BoundedAuditSupport.of_selectedClasses`, but the selected
classes may contain `q` and are confined to the q-allowed bounded support used
by the row-specialized c5d3b target. -/
def U5QAllowedAuditSupport.of_selectedClasses
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (a0 a1 : ℝ²)
    (ha0_mem : a0 ∈ (D.skeleton q).erase p)
    (ha1_mem : a1 ∈ (D.skeleton q).erase p)
    (ha0_notin_base : a0 ∉ insert u T)
    (ha1_notin_base : a1 ∉ insert u (insert a0 T))
    (ha0_off : dist p a0 ≠ dist p q)
    (ha1_off : dist p a1 ≠ dist p q)
    (classes :
      ∀ x ∈ U5BoundedAuditCenters D q p T u a0 a1,
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T u a0 a1)
    (hcard : ∀ x hx, ((classes x hx).1).card = 4) :
    U5QAllowedAuditSupport D q p T u := by
  let hsupport : U5QAllowedBoundedEightPointSupport D q p T u :=
    { a0 := a0
      a1 := a1
      a0_mem := ha0_mem
      a1_mem := ha1_mem
      a0_notin_base := ha0_notin_base
      a1_notin_base := ha1_notin_base
      selected_classes := classes }
  exact U5QAllowedAuditSupport.of_boundedSupport_cardFour
    hsupport ha0_off ha1_off hcard

/-- Native q-deleted audited support supplies the q-allowed audit interface.

Each selected exact class forgets its q-free field, and its bounded-support
containment is widened by the outer `insert q`. -/
def U5BoundedAuditSupport.toQAllowedAuditSupport
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (H : U5BoundedAuditSupport D q p T u) :
    U5QAllowedAuditSupport D q p T u := by
  let classes :
      ∀ x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1,
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T u H.a0 H.a1 := by
    intro x hx
    let S := H.selected_classes x hx
    refine ⟨S.1, ?_⟩
    refine ⟨U5QDeletedK4Class.toQAllowedK4Class S.2.1, ?_⟩
    intro y hy
    exact Finset.mem_insert.mpr (Or.inr (S.2.2 hy))
  refine U5QAllowedAuditSupport.of_selectedClasses H.a0 H.a1
    H.a0_mem H.a1_mem H.a0_notin_base H.a1_notin_base
    H.a0_off_circle H.a1_off_circle classes ?_
  intro x hx
  change (H.selected_classes x hx).1.card = 4
  exact H.selected_card_four x hx

/-- Weaker selected-class payload for the audited-support branch.

This is the exact support-confinement target needed by the finite audit: for
each audit center, the row/global proof supplies one exact q-free four-point
class already confined to the bounded support.  It does not require proving
that every possible exact class is confined, nor does it require routing
through the q-critical trichotomy when explicit selected classes are
available. -/
structure U5ConfinedK4AuditPayload (D : CounterexampleData) (q p : ℝ²)
    (T : Finset ℝ²) (u : ℝ²) : Type where
  a0 : ℝ²
  a1 : ℝ²
  a0_mem : a0 ∈ (D.skeleton q).erase p
  a1_mem : a1 ∈ (D.skeleton q).erase p
  a0_notin_base : a0 ∉ insert u T
  a1_notin_base : a1 ∉ insert u (insert a0 T)
  a0_off_circle : dist p a0 ≠ dist p q
  a1_off_circle : dist p a1 ≠ dist p q
  confined_class_exists :
    ∀ x ∈ U5BoundedAuditCenters D q p T u a0 a1,
      ∃ B : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x B) ∧
          B.card = 4 ∧ B ⊆ U5BoundedSupport D q p T u a0 a1

/-- If the dangerous triple is exact at radius `dist p q`, then its
q-deleted `p`-radius class is precisely `T`. -/
theorem U5DangerousTriple.exact_radius_class_eq
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hexact :
      (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3) :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q) = T := by
  classical
  let C : Finset ℝ² :=
    ((D.skeleton q).erase p).filter fun y => dist p y = dist p q
  have hT_subset_C : T ⊆ C := by
    intro x hxT
    exact Finset.mem_filter.mpr
      ⟨htriple.T_subset hxT, htriple.T_same_radius x hxT⟩
  have hT_eq_C : T = C := by
    refine Finset.eq_of_subset_of_card_le hT_subset_C ?_
    have hCcard : C.card = 3 := by
      simpa [C] using hexact
    rw [hCcard, htriple.T_card]
  exact hT_eq_C.symm

/-- Under an exact dangerous triple, a selected skeleton candidate not in `T`
is off the dangerous `p`-circle. -/
theorem U5DangerousTriple.selected_off_circle_of_exact
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hexact :
      (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3) :
    dist p u ≠ dist p q := by
  intro hu_radius
  have huC :
      u ∈ ((D.skeleton q).erase p).filter fun y => dist p y = dist p q :=
    Finset.mem_filter.mpr ⟨hsel.candidate_mem, hu_radius⟩
  have huT : u ∈ T := by
    simpa [htriple.exact_radius_class_eq hexact] using huC
  exact hsel.candidate_notin_T huT

/-- A point in a q-deleted class that escapes the bounded support is an
off-circle skeleton candidate.

The class membership puts the point in the q-deleted skeleton.  Escaping the
bounded support rules out `p` and the dangerous triple `T`; exactness of the
dangerous `p`-radius class then makes the point off the dangerous circle. -/
theorem U5DangerousTriple.candidate_of_not_mem_boundedSupport
    {D : CounterexampleData} {q p center y u a0 a1 : ℝ²}
    {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QDeletedK4Class D q center B)
    (hyB : y ∈ B)
    (hySupport : y ∉ U5BoundedSupport D q p T u a0 a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    U5SelectedCandidateSkeleton D q p T y ∧ dist p y ≠ dist p q := by
  classical
  have hyCenterErase : y ∈ (D.skeleton q).erase center := K.subset hyB
  have hySkeleton : y ∈ D.skeleton q := (Finset.mem_erase.mp hyCenterErase).2
  have hy_ne_p : y ≠ p := by
    intro hyp
    subst y
    exact hySupport (by simp [U5BoundedSupport])
  have hyEraseP : y ∈ (D.skeleton q).erase p :=
    Finset.mem_erase.mpr ⟨hy_ne_p, hySkeleton⟩
  have hy_not_T : y ∉ T := by
    intro hyT
    exact hySupport (by simp [U5BoundedSupport, hyT])
  let hsel : U5SelectedCandidateSkeleton D q p T y :=
    { candidate_mem := hyEraseP
      candidate_notin_T := hy_not_T }
  exact ⟨hsel, htriple.selected_off_circle_of_exact hsel hexact⟩

/-- A bounded-support escape cannot be the same-circle selected candidate for
the exact dangerous triple. -/
theorem U5DangerousTriple.not_sameCircleExport_of_not_mem_boundedSupport
    {D : CounterexampleData} {q p center y u a0 a1 : ℝ²}
    {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QDeletedK4Class D q center B)
    (hyB : y ∈ B)
    (hySupport : y ∉ U5BoundedSupport D q p T u a0 a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    ¬ U5SameCircleExport D q p T y := by
  intro hsame
  exact (htriple.candidate_of_not_mem_boundedSupport
    K hyB hySupport hexact).2 hsame.2

/-- A point in a q-allowed class that escapes the q-allowed bounded support is
an off-circle skeleton candidate for the exact dangerous triple. -/
theorem U5DangerousTriple.candidate_of_not_mem_qAllowedBoundedSupport
    {D : CounterexampleData} {q p center y u a0 a1 : ℝ²}
    {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QAllowedK4Class D center B)
    (hyB : y ∈ B)
    (hySupport : y ∉ U5QAllowedBoundedSupport D q p T u a0 a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    U5SelectedCandidateSkeleton D q p T y ∧ dist p y ≠ dist p q := by
  have hyCenterSkel : y ∈ D.skeleton center := K.subset hyB
  have hyA : y ∈ D.A := (Finset.mem_erase.mp hyCenterSkel).2
  have hy_ne_q : y ≠ q := by
    intro hyq
    exact hySupport (by
      rw [hyq]
      simp [U5QAllowedBoundedSupport])
  have hy_ne_p : y ≠ p := by
    intro hyp
    exact hySupport (by
      rw [hyp]
      simp [U5QAllowedBoundedSupport, U5BoundedSupport])
  have hySkeletonQ : y ∈ D.skeleton q :=
    Finset.mem_erase.mpr ⟨hy_ne_q, hyA⟩
  have hyEraseP : y ∈ (D.skeleton q).erase p :=
    Finset.mem_erase.mpr ⟨hy_ne_p, hySkeletonQ⟩
  have hy_not_T : y ∉ T := by
    intro hyT
    exact hySupport (by
      simp [U5QAllowedBoundedSupport, U5BoundedSupport, hyT])
  let hsel : U5SelectedCandidateSkeleton D q p T y :=
    { candidate_mem := hyEraseP
      candidate_notin_T := hy_not_T }
  exact ⟨hsel, htriple.selected_off_circle_of_exact hsel hexact⟩

/-- A q-allowed bounded-support escape cannot be the same-circle selected
candidate for the exact dangerous triple. -/
theorem U5DangerousTriple.not_sameCircleExport_of_not_mem_qAllowedBoundedSupport
    {D : CounterexampleData} {q p center y u a0 a1 : ℝ²}
    {T B : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (K : U5QAllowedK4Class D center B)
    (hyB : y ∈ B)
    (hySupport : y ∉ U5QAllowedBoundedSupport D q p T u a0 a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    ¬ U5SameCircleExport D q p T y := by
  intro hsame
  exact (htriple.candidate_of_not_mem_qAllowedBoundedSupport
    K hyB hySupport hexact).2 hsame.2

/-- Exact dangerous-triple data supplies the two off-circle auxiliary vertices
needed by the bounded audit.

This fills only the support-payload bookkeeping fields for `a0,a1`: the
selected q-free K4 classes remain the genuine row/global content. -/
theorem U5DangerousTriple.exists_two_off_circle_aux
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hM44 : D.IsM44)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hexact :
      (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3) :
    ∃ a0 a1 : ℝ²,
      a0 ∈ (D.skeleton q).erase p ∧
      a1 ∈ (D.skeleton q).erase p ∧
      a0 ∉ insert u T ∧
      a1 ∉ insert u (insert a0 T) ∧
      dist p a0 ≠ dist p q ∧
      dist p a1 ≠ dist p q := by
  classical
  let S : Finset ℝ² := (D.skeleton q).erase p
  let base : Finset ℝ² := insert u T
  let R : Finset ℝ² := S \ base
  have hAcard : 10 ≤ D.A.card := by
    have hsurplus := CounterexampleData.IsM44.surplus_card_ge_five hM44
    have hcard := card_eq_of_isM44 hM44
    omega
  have hp_mem_erase_q : p ∈ D.A.erase q := by
    exact Finset.mem_erase.mpr ⟨htriple.p_ne_q, htriple.p_mem⟩
  have hS_card : 8 ≤ S.card := by
    have hqcard : (D.A.erase q).card = D.A.card - 1 :=
      Finset.card_erase_of_mem htriple.q_mem
    have hpcard : ((D.A.erase q).erase p).card =
        (D.A.erase q).card - 1 :=
      Finset.card_erase_of_mem hp_mem_erase_q
    have hS_eq : S = (D.A.erase q).erase p := by
      simp [S, CounterexampleData.skeleton]
    rw [hS_eq, hpcard, hqcard]
    omega
  have hbase_subset : base ⊆ S := by
    intro x hx
    have hx' : x ∈ insert u T := by
      simpa [base] using hx
    rw [Finset.mem_insert] at hx'
    rcases hx' with rfl | hxT
    · exact hsel.candidate_mem
    · exact htriple.T_subset hxT
  have hbase_card : base.card = 4 := by
    rw [show base = insert u T by rfl]
    rw [Finset.card_insert_of_notMem hsel.candidate_notin_T,
      htriple.T_card]
  have hR_card : 2 ≤ R.card := by
    have hinter : base ∩ S = base := Finset.inter_eq_left.mpr hbase_subset
    have hcardR : R.card = S.card - base.card := by
      calc
        R.card = (S \ base).card := rfl
        _ = S.card - (base ∩ S).card := by
          rw [Finset.card_sdiff]
        _ = S.card - base.card := by
          rw [hinter]
    rw [hcardR, hbase_card]
    omega
  have hR_one : 1 < R.card := by omega
  rcases Finset.one_lt_card.mp hR_one with
    ⟨a0, ha0R, a1, ha1R, ha0_ne_a1⟩
  have ha0S : a0 ∈ S := (Finset.mem_sdiff.mp ha0R).1
  have ha1S : a1 ∈ S := (Finset.mem_sdiff.mp ha1R).1
  have ha0_not_base : a0 ∉ base := (Finset.mem_sdiff.mp ha0R).2
  have ha1_not_base : a1 ∉ base := (Finset.mem_sdiff.mp ha1R).2
  let C : Finset ℝ² := S.filter fun y => dist p y = dist p q
  have hC_eq_T : C = T := by
    simpa [C, S] using htriple.exact_radius_class_eq hexact
  have off_circle_of_mem_R {a : ℝ²} (haS : a ∈ S) (ha_not_base : a ∉ base) :
      dist p a ≠ dist p q := by
    intro ha_radius
    have haC : a ∈ C := Finset.mem_filter.mpr ⟨haS, ha_radius⟩
    have haT : a ∈ T := by
      simpa [hC_eq_T] using haC
    exact ha_not_base (by simp [base, haT])
  have ha0_off : dist p a0 ≠ dist p q :=
    off_circle_of_mem_R ha0S ha0_not_base
  have ha1_off : dist p a1 ≠ dist p q :=
    off_circle_of_mem_R ha1S ha1_not_base
  have ha1_not_insert : a1 ∉ insert u (insert a0 T) := by
    intro ha1
    rw [Finset.mem_insert] at ha1
    rcases ha1 with ha1u | ha1
    · exact ha1_not_base (by simp [base, ha1u])
    · rw [Finset.mem_insert] at ha1
      rcases ha1 with ha1a0 | ha1T
      · exact ha0_ne_a1 ha1a0.symm
      · exact ha1_not_base (by simp [base, ha1T])
  exact ⟨a0, a1, ha0S, ha1S, by simpa [base] using ha0_not_base,
    ha1_not_insert, ha0_off, ha1_off⟩

/-- Exact dangerous-triple support data plus rowwise confined classes already
packages the native confined payload.

The only non-automatic native payload fields are the two off-circle auxiliary
vertices and the rowwise existence of exact four-point selected classes
confined to the bounded support. -/
def U5ConfinedK4AuditPayload.of_auxAndClasses
    {D : CounterexampleData} {q p u a0 a1 : ℝ²} {T : Finset ℝ²}
    (ha0_mem : a0 ∈ (D.skeleton q).erase p)
    (ha1_mem : a1 ∈ (D.skeleton q).erase p)
    (ha0_notin_base : a0 ∉ insert u T)
    (ha1_notin_base : a1 ∉ insert u (insert a0 T))
    (ha0_off : dist p a0 ≠ dist p q)
    (ha1_off : dist p a1 ≠ dist p q)
    (hclasses :
      ∀ x ∈ U5BoundedAuditCenters D q p T u a0 a1,
        ∃ B : Finset ℝ²,
          Nonempty (U5QDeletedK4Class D q x B) ∧
            B.card = 4 ∧ B ⊆ U5BoundedSupport D q p T u a0 a1) :
    U5ConfinedK4AuditPayload D q p T u where
  a0 := a0
  a1 := a1
  a0_mem := ha0_mem
  a1_mem := ha1_mem
  a0_notin_base := ha0_notin_base
  a1_notin_base := ha1_notin_base
  a0_off_circle := ha0_off
  a1_off_circle := ha1_off
  confined_class_exists := hclasses

/-- Convert the selected-class payload into audited bounded support. -/
noncomputable def U5ConfinedK4AuditPayload.toAuditedSupport
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (H : U5ConfinedK4AuditPayload D q p T u) :
    U5BoundedAuditSupport D q p T u := by
  classical
  let classExists :
      ∀ x hx, ∃ B : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x B) ∧
          B.card = 4 ∧ B ⊆ U5BoundedSupport D q p T u H.a0 H.a1 := by
    intro x hx
    exact H.confined_class_exists x hx
  let classes :
      ∀ x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1,
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QDeletedK4Class D q x B =>
            B ⊆ U5BoundedSupport D q p T u H.a0 H.a1 := by
    intro x hx
    let B := Classical.choose (classExists x hx)
    have hB := Classical.choose_spec (classExists x hx)
    let K : U5QDeletedK4Class D q x B := Classical.choice hB.1
    exact ⟨B, ⟨K, hB.2.2⟩⟩
  refine U5BoundedAuditSupport.of_selectedClasses H.a0 H.a1
    H.a0_mem H.a1_mem H.a0_notin_base H.a1_notin_base
    H.a0_off_circle H.a1_off_circle classes ?_
  intro x hx
  change (Classical.choose (classExists x hx)).card = 4
  exact (Classical.choose_spec (classExists x hx)).2.1

/-- Convert the q-allowed confined payload into q-allowed audited support. -/
noncomputable def U5QAllowedConfinedK4AuditPayload.toAuditedSupport
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (H : U5QAllowedConfinedK4AuditPayload D q p T u) :
    U5QAllowedAuditSupport D q p T u := by
  classical
  let classExists :
      ∀ x hx, ∃ B : Finset ℝ²,
        Nonempty (U5QAllowedK4Class D x B) ∧
          B.card = 4 ∧ B ⊆ U5QAllowedBoundedSupport D q p T u H.a0 H.a1 := by
    intro x hx
    exact H.confined_class_exists x hx
  let classes :
      ∀ x ∈ U5BoundedAuditCenters D q p T u H.a0 H.a1,
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T u H.a0 H.a1 := by
    intro x hx
    let B := Classical.choose (classExists x hx)
    have hB := Classical.choose_spec (classExists x hx)
    let K : U5QAllowedK4Class D x B := Classical.choice hB.1
    exact ⟨B, ⟨K, hB.2.2⟩⟩
  refine U5QAllowedAuditSupport.of_selectedClasses H.a0 H.a1
    H.a0_mem H.a1_mem H.a0_notin_base H.a1_notin_base
    H.a0_off_circle H.a1_off_circle classes ?_
  intro x hx
  change (Classical.choose (classExists x hx)).card = 4
  exact (Classical.choose_spec (classExists x hx)).2.1

namespace U5ConfinedK4AuditPayload

/-- Repackage audited support as the confined-class payload shape. -/
def ofAudit
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (H : U5BoundedAuditSupport D q p T u) :
    U5ConfinedK4AuditPayload D q p T u where
  a0 := H.a0
  a1 := H.a1
  a0_mem := H.a0_mem
  a1_mem := H.a1_mem
  a0_notin_base := H.a0_notin_base
  a1_notin_base := H.a1_notin_base
  a0_off_circle := H.a0_off_circle
  a1_off_circle := H.a1_off_circle
  confined_class_exists := by
    intro x hx
    let S := H.selected_classes x hx
    exact ⟨S.1, ⟨⟨S.2.1⟩, H.selected_card_four x hx, S.2.2⟩⟩

/-- The confined-class payload and audited-support payload are equivalent
native presentations of the same support data. -/
theorem nonempty_iff_auditedSupport
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²} :
    Nonempty (U5ConfinedK4AuditPayload D q p T u) ↔
      Nonempty (U5BoundedAuditSupport D q p T u) := by
  constructor
  · rintro ⟨H⟩
    exact ⟨H.toAuditedSupport⟩
  · rintro ⟨H⟩
    exact ⟨ofAudit H⟩

end U5ConfinedK4AuditPayload

namespace U5QAllowedConfinedK4AuditPayload

/-- Repackage q-allowed audited support as the confined-class payload shape. -/
def ofAudit
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²} {u : ℝ²}
    (H : U5QAllowedAuditSupport D q p T u) :
    U5QAllowedConfinedK4AuditPayload D q p T u where
  a0 := H.a0
  a1 := H.a1
  a0_mem := H.a0_mem
  a1_mem := H.a1_mem
  a0_notin_base := H.a0_notin_base
  a1_notin_base := H.a1_notin_base
  a0_off_circle := H.a0_off_circle
  a1_off_circle := H.a1_off_circle
  confined_class_exists := by
    intro x hx
    let S := H.selected_classes x hx
    exact ⟨S.1, ⟨⟨S.2.1⟩, H.selected_card_four x hx, S.2.2⟩⟩

end U5QAllowedConfinedK4AuditPayload

/-- Convert the q-allowed confined payload into the q-allowed row descriptor
shape. -/
noncomputable def u5QAllowedEndpointLiteralDescriptor_of_confinedK4AuditPayload
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5QAllowedConfinedK4AuditPayload D q p T u) :
    U5QAllowedCandidateDescriptor D q p T :=
  u5QAllowedEndpointLiteralDescriptor_of_auditedSupport hsel
    ⟨H.toAuditedSupport⟩

/-- Endpoint-literal descriptor constructor from the selected-class confined
audit payload. -/
noncomputable def u5EndpointLiteralDescriptor_of_confinedK4AuditPayload
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5ConfinedK4AuditPayload D q p T u) :
    U5CandidateDescriptor D q p T :=
  u5EndpointLiteralDescriptor_of_auditedSupport hsel
    ⟨H.toAuditedSupport⟩

end Problem97
