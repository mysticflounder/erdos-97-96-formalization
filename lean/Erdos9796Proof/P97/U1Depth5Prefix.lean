/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U1Depth5AnchorProduct
import Erdos9796Proof.P97.U5GramCertPoly

/-!
# U1 Route-B depth-5 prefix surface

This file records the theorem-facing label surface for the U1.2 Route-B
depth-5 mining lane.  It does not assert manifest coverage or any mined
product collapse.  It only packages the concrete fields that downstream
certificates must consume: ten labelled carrier points, injectivity of those
labels, and a proof-carrying projection/renaming shape for the 10-label source
surface into an 8-label checker window.
-/

namespace Problem97
namespace U1Depth5

/-- The theorem-facing 10-label U1 Route-B prefix over a carrier `D.A`.

The geometric producer must eventually strengthen this with row-membership and
manifest data.  The fields here are the non-negotiable carrier/injectivity data
already consumed by the AnchorPairs product tail. -/
structure LabelPrefix (D : CounterexampleData) where
  point : Label -> Plane
  point_mem : ∀ a : Label, point a ∈ D.A
  point_injective : Function.Injective point

namespace LabelPrefix

/-- AnchorPairs distinctness follows from injectivity of the prefix labels. -/
theorem anchorPairsDistinct {D : CounterexampleData}
    (P : LabelPrefix D) :
    AnchorPairsDistinct P.point :=
  anchorPairsDistinct_of_injective P.point_injective

/-- The AnchorPairs product is positive for an injective 10-label prefix. -/
theorem anchorProduct_pos {D : CounterexampleData}
    (P : LabelPrefix D) :
    0 < anchorProduct P.point :=
  anchorProduct_pos_of_distinct P.anchorPairsDistinct

/-- The AnchorPairs product cannot vanish for an injective 10-label prefix. -/
theorem anchorProduct_ne_zero {D : CounterexampleData}
    (P : LabelPrefix D) :
    anchorProduct P.point ≠ 0 :=
  anchorProduct_ne_zero_of_distinct P.anchorPairsDistinct

/-- Contradiction form for consuming a proof-carrying product-collapse leaf. -/
theorem false_of_anchorProduct_eq_zero {D : CounterexampleData}
    (P : LabelPrefix D)
    (hzero : anchorProduct P.point = 0) :
    False :=
  U1Depth5.false_of_anchorProduct_eq_zero_of_injective
    P.point_injective hzero

end LabelPrefix

/-- Concrete 10-label point assignment for the U1.2 Route-B bridge.

The sixth argument is the live selected candidate `u`; it occupies the
theorem-facing depth-5 label `f1`.  The remaining four `f` labels are supplied
by the proof-carrying manifest. -/
noncomputable def pointOf
    (P Q T1 T2 T3 U F2 F3 F4 F5 : Plane) : Label → Plane :=
  fun i => ![P, Q, T1, T2, T3, U, F2, F3, F4, F5] i

/-- The fixed triple plus the selected candidate give the pairwise distinct
base-six prefix needed before the four manifest-produced labels are added. -/
theorem baseSix_pairwise_of_fixedTriple_and_selected
    {P Q T1 T2 T3 U : Plane}
    (hbase : P ≠ Q ∧ P ≠ T1 ∧ P ≠ T2 ∧ P ≠ T3 ∧
      Q ≠ T1 ∧ Q ≠ T2 ∧ Q ≠ T3 ∧
      T1 ≠ T2 ∧ T1 ≠ T3 ∧ T2 ≠ T3)
    (hU_P : U ≠ P) (hU_Q : U ≠ Q) (hU_T1 : U ≠ T1)
    (hU_T2 : U ≠ T2) (hU_T3 : U ≠ T3) :
    List.Pairwise (fun x y : Plane => x ≠ y) [P, Q, T1, T2, T3, U] := by
  rcases hbase with
    ⟨hPQ, hPT1, hPT2, hPT3, hQT1, hQT2, hQT3,
      hT1T2, hT1T3, hT2T3⟩
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true]
  exact ⟨⟨hPQ, hPT1, hPT2, hPT3, hU_P.symm⟩,
    ⟨hQT1, hQT2, hQT3, hU_Q.symm⟩,
    ⟨hT1T2, hT1T3, hU_T1.symm⟩,
    ⟨hT2T3, hU_T2.symm⟩,
    hU_T3.symm⟩

/-- The base-six pairwise package includes the endpoint inequality `P ≠ U`. -/
theorem baseP_ne_selectedU_of_baseSixPairwise
    {P Q T1 T2 T3 U : Plane}
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y) [P, Q, T1, T2, T3, U]) :
    P ≠ U := by
  have hbase' := hbase
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase'
  rcases hbase' with ⟨⟨_, _, _, _, hP_U⟩, _, _, _, _⟩
  exact hP_U

/-- Extend a proved base-six prefix by the four manifest-produced labels. -/
theorem ten_pairwise_of_base_tail_cross
    {P Q T1 T2 T3 U F2 F3 F4 F5 : Plane}
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y) [P, Q, T1, T2, T3, U])
    (htail : List.Pairwise (fun x y : Plane => x ≠ y) [F2, F3, F4, F5])
    (hcross :
      ∀ a ∈ [P, Q, T1, T2, T3, U],
        ∀ b ∈ [F2, F3, F4, F5], a ≠ b) :
    List.Pairwise (fun x y : Plane => x ≠ y)
      [P, Q, T1, T2, T3, U, F2, F3, F4, F5] := by
  change List.Pairwise (fun x y : Plane => x ≠ y)
    ([P, Q, T1, T2, T3, U] ++ [F2, F3, F4, F5])
  exact List.pairwise_append.mpr ⟨hbase, htail, hcross⟩

/-- Pairwise distinctness of the concrete ten labels supplies injectivity of
the U1 depth-5 point assignment. -/
theorem pointOf_injective_of_pairwise
    {P Q T1 T2 T3 U F2 F3 F4 F5 : Plane}
    (hpairwise : List.Pairwise (fun x y : Plane => x ≠ y)
      [P, Q, T1, T2, T3, U, F2, F3, F4, F5]) :
    Function.Injective (pointOf P Q T1 T2 T3 U F2 F3 F4 F5) := by
  let L : List Plane := [P, Q, T1, T2, T3, U, F2, F3, F4, F5]
  have hLpairwise : L.Pairwise (fun x y : Plane => x ≠ y) := by
    simpa [L] using hpairwise
  let idx : Label → Fin L.length :=
    fun i => ⟨i.val, by simp [L]⟩
  have hget :
      ∀ i : Label,
        L.get (idx i) =
          pointOf P Q T1 T2 T3 U F2 F3 F4 F5 i := by
    intro i
    fin_cases i <;> simp [L, idx, pointOf]
  intro a b hpoint
  apply Fin.ext
  by_contra hval
  rcases Nat.lt_or_gt_of_ne hval with hlt | hgt
  · have hneq : L.get (idx a) ≠ L.get (idx b) := by
      exact hLpairwise.rel_get_of_lt
        (a := idx a) (b := idx b) hlt
    exact hneq (by
      calc
        L.get (idx a) =
            pointOf P Q T1 T2 T3 U F2 F3 F4 F5 a := hget a
        _ = pointOf P Q T1 T2 T3 U F2 F3 F4 F5 b := hpoint
        _ = L.get (idx b) := (hget b).symm)
  · have hneq : L.get (idx b) ≠ L.get (idx a) := by
      exact hLpairwise.rel_get_of_lt
        (a := idx b) (b := idx a) hgt
    exact hneq (by
      calc
        L.get (idx b) =
            pointOf P Q T1 T2 T3 U F2 F3 F4 F5 b := hget b
        _ = pointOf P Q T1 T2 T3 U F2 F3 F4 F5 a := hpoint.symm
        _ = L.get (idx a) := (hget a).symm)

/-- Pairwise distinctness of the concrete ten labels gives point-level
inequality for any two syntactically distinct labels. -/
theorem pointOf_ne_of_pairwise
    {P Q T1 T2 T3 U F2 F3 F4 F5 : Plane}
    (hpairwise : List.Pairwise (fun x y : Plane => x ≠ y)
      [P, Q, T1, T2, T3, U, F2, F3, F4, F5])
    {a b : Label} (hab : a ≠ b) :
    pointOf P Q T1 T2 T3 U F2 F3 F4 F5 a ≠
      pointOf P Q T1 T2 T3 U F2 F3 F4 F5 b := by
  intro hpoint
  exact hab ((pointOf_injective_of_pairwise hpairwise) hpoint)

/-- Proof-facing manifest label packet for the current U1.2 producer shape.

This is the narrow adapter between the live branch
`p,q,t1,t2,t3,u` and the generic `LabelPrefix` product tail.  It deliberately
does not assert manifest coverage or product collapse: those remain certificate
inputs. -/
structure ManifestLabelPacket (D : CounterexampleData) where
  baseP : Plane
  baseQ : Plane
  baseT1 : Plane
  baseT2 : Plane
  baseT3 : Plane
  selectedU : Plane
  f2Point : Plane
  f3Point : Plane
  f4Point : Plane
  f5Point : Plane
  baseP_mem : baseP ∈ D.A
  baseQ_mem : baseQ ∈ D.A
  baseT1_mem : baseT1 ∈ D.A
  baseT2_mem : baseT2 ∈ D.A
  baseT3_mem : baseT3 ∈ D.A
  selectedU_mem : selectedU ∈ D.A
  f2_mem : f2Point ∈ D.A
  f3_mem : f3Point ∈ D.A
  f4_mem : f4Point ∈ D.A
  f5_mem : f5Point ∈ D.A
  point_injective :
    Function.Injective
      (pointOf baseP baseQ baseT1 baseT2 baseT3 selectedU
        f2Point f3Point f4Point f5Point)

namespace ManifestLabelPacket

/-- The concrete point assignment associated to a manifest label packet. -/
noncomputable def point {D : CounterexampleData}
    (P : ManifestLabelPacket D) : Label → Plane :=
  pointOf P.baseP P.baseQ P.baseT1 P.baseT2 P.baseT3 P.selectedU
    P.f2Point P.f3Point P.f4Point P.f5Point

@[simp] theorem point_baseP {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.p = P.baseP := by
  simp [point, pointOf, U1Depth5.p]

@[simp] theorem point_baseQ {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.q = P.baseQ := by
  simp [point, pointOf, U1Depth5.q]

@[simp] theorem point_baseT1 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.t1 = P.baseT1 := by
  simp [point, pointOf, U1Depth5.t1]

@[simp] theorem point_baseT2 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.t2 = P.baseT2 := by
  simp [point, pointOf, U1Depth5.t2]

@[simp] theorem point_baseT3 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.t3 = P.baseT3 := by
  simp [point, pointOf, U1Depth5.t3]

/-- The live selected candidate is the theorem-facing `f1` label. -/
@[simp] theorem point_f1 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.f1 = P.selectedU := by
  simp [point, pointOf, U1Depth5.f1]

@[simp] theorem point_f2 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.f2 = P.f2Point := by
  simp [point, pointOf, U1Depth5.f2]

@[simp] theorem point_f3 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.f3 = P.f3Point := by
  simp [point, pointOf, U1Depth5.f3]

@[simp] theorem point_f4 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.f4 = P.f4Point := by
  simp [point, pointOf, U1Depth5.f4]

@[simp] theorem point_f5 {D : CounterexampleData}
    (P : ManifestLabelPacket D) :
    P.point U1Depth5.f5 = P.f5Point := by
  simp [point, pointOf, U1Depth5.f5]

/-- A manifest label packet realizes the generic 10-label `LabelPrefix`. -/
noncomputable def toLabelPrefix {D : CounterexampleData}
    (P : ManifestLabelPacket D) : LabelPrefix D where
  point := P.point
  point_mem := by
    intro a
    fin_cases a <;> simp [point, pointOf,
      P.baseP_mem, P.baseQ_mem, P.baseT1_mem, P.baseT2_mem, P.baseT3_mem,
      P.selectedU_mem, P.f2_mem, P.f3_mem, P.f4_mem, P.f5_mem]
  point_injective := by
    simpa [point] using P.point_injective

/-- Contradiction form for a proof-carrying product-collapse certificate on a
manifest label packet. -/
theorem false_of_anchorProduct_eq_zero {D : CounterexampleData}
    (P : ManifestLabelPacket D)
    (hzero : anchorProduct P.point = 0) :
    False :=
  P.toLabelPrefix.false_of_anchorProduct_eq_zero hzero

/-- Contradiction form for product-collapse certificates that include an
additional nonzero algebraic factor.

Some Singular jobs test `anchorProduct * extraFactor = 0`, where `extraFactor`
is a product of row-radius or other forbidden factors.  Such a leaf is useful
only when the generator also supplies a Lean proof that the extra factor is
nonzero. -/
theorem false_of_anchorProduct_mul_extraFactor_eq_zero
    {D : CounterexampleData}
    (P : ManifestLabelPacket D)
    {extraFactor : ℝ}
    (hextra : extraFactor ≠ 0)
    (hzero : anchorProduct P.point * extraFactor = 0) :
    False := by
  rcases mul_eq_zero.mp hzero with hAnchor | hExtra
  · exact P.false_of_anchorProduct_eq_zero hAnchor
  · exact hextra hExtra

/-- Syntactically distinct manifest labels name geometrically distinct points. -/
theorem point_ne_of_label_ne {D : CounterexampleData}
    (P : ManifestLabelPacket D)
    {a b : Label} (hlabels : a ≠ b) :
    P.point a ≠ P.point b := by
  intro h
  exact hlabels (P.point_injective h)

/-- Coordinate squared distance between distinct manifest labels is nonzero in
the normal-axis gauge determined by labels `p` and `q`. -/
theorem normalAxis_coord_sqdist_ne_zero {D : CounterexampleData}
    (P : ManifestLabelPacket D) {a b : Label} (hlabels : a ≠ b) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0 -
          normalAxis (P.point p) (P.point q) (P.point b) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1 -
          normalAxis (P.point p) (P.point q) (P.point b) 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_coord_sqdist_ne_zero
    (P.point_ne_of_label_ne (by decide : p ≠ q))
    (P.point_ne_of_label_ne hlabels)

/-- Coordinate squared norm of a manifest label distinct from `p` is nonzero in
the normal-axis gauge determined by labels `p` and `q`. -/
theorem normalAxis_sqnorm_ne_zero {D : CounterexampleData}
    (P : ManifestLabelPacket D) {a : Label} (hlabels : p ≠ a) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_sqnorm_ne_zero
    (P.point_ne_of_label_ne (by decide : p ≠ q))
    (P.point_ne_of_label_ne hlabels)

/-- Coordinate squared distance from `(1, 0)` to a manifest label distinct from
`q` is nonzero in the normal-axis gauge determined by labels `p` and `q`. -/
theorem normalAxis_unitX_sqdist_ne_zero {D : CounterexampleData}
    (P : ManifestLabelPacket D) {a : Label} (hlabels : q ≠ a) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_unitX_sqdist_ne_zero
    (P.point_ne_of_label_ne (by decide : p ≠ q))
    (P.point_ne_of_label_ne hlabels)

/-- Manifest-label equal-distance facts become equality of normalized
coordinate squared distances in the packet's `p,q` normal-axis gauge. -/
theorem normalAxis_coordSqDist_eq_of_dist_eq {D : CounterexampleData}
    (P : ManifestLabelPacket D) {center member witness : Label}
    (h :
      dist (P.point center) (P.point member) =
        dist (P.point center) (P.point witness)) :
    coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point member)) =
      coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point witness)) := by
  exact Problem97.normalAxis_coord_sqdist_eq_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Manifest-label distance inequalities become inequalities of normalized
coordinate squared distances in the packet's `p,q` normal-axis gauge. -/
theorem normalAxis_coordSqDist_ne_of_dist_ne {D : CounterexampleData}
    (P : ManifestLabelPacket D) {center member witness : Label}
    (h :
      dist (P.point center) (P.point member) ≠
        dist (P.point center) (P.point witness)) :
    coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point member)) ≠
      coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point witness)) := by
  exact Problem97.normalAxis_coordSqDist_ne_of_dist_ne
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Manifest-label equal distances from `p` become equality of normalized
squared norms in the packet's `p,q` normal-axis gauge. -/
theorem normalAxis_sqnorm_coord_eq_of_dist_eq {D : CounterexampleData}
    (P : ManifestLabelPacket D) {member witness : Label}
    (h :
      dist (P.point p) (P.point member) =
        dist (P.point p) (P.point witness)) :
    (normalAxis (P.point p) (P.point q) (P.point member) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point member) 1) ^ 2 =
      (normalAxis (P.point p) (P.point q) (P.point witness) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point witness) 1) ^ 2 := by
  exact Problem97.normalAxis_sqnorm_coord_eq_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Manifest-label equal distances from `q` become equality of normalized
coordinate squared distances from `(1, 0)` in the packet's `p,q` gauge. -/
theorem normalAxis_unitX_sqdist_coord_eq_of_dist_eq {D : CounterexampleData}
    (P : ManifestLabelPacket D) {member witness : Label}
    (h :
      dist (P.point q) (P.point member) =
        dist (P.point q) (P.point witness)) :
    (normalAxis (P.point p) (P.point q) (P.point member) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point member) 1) ^ 2 =
      (normalAxis (P.point p) (P.point q) (P.point witness) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point witness) 1) ^ 2 := by
  exact Problem97.normalAxis_unitX_sqdist_coord_eq_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- A manifest label at the original `q,p` radius has normalized coordinate
squared distance one from `(1, 0)`. -/
theorem normalAxis_unitX_sqdist_coord_eq_one_of_dist_eq
    {D : CounterexampleData}
    (P : ManifestLabelPacket D) {a : Label}
    (h : dist (P.point q) (P.point p) = dist (P.point q) (P.point a)) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 = 1 := by
  have hpq : P.point p ≠ P.point q :=
    P.point_ne_of_label_ne (by decide : p ≠ q)
  have hcoord := Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq
    hpq h
  rw [Problem97.normalAxis_witness hpq] at hcoord
  dsimp [coordSqDist] at hcoord
  calc
    (normalAxis (P.point p) (P.point q) (P.point a) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 =
        (1 - normalAxis (P.point p) (P.point q) (P.point a) 0) ^ 2 +
          (0 - normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 := by
      ring
    _ = 1 := hcoord

/-- A manifest label at the original `p,q` radius has normalized coordinate
squared norm one. -/
theorem normalAxis_sqnorm_coord_eq_one_of_dist_eq {D : CounterexampleData}
    (P : ManifestLabelPacket D) {a : Label}
    (h : dist (P.point p) (P.point a) = dist (P.point p) (P.point q)) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 = 1 := by
  exact Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Manifest label packets supply the injectivity needed to prove nonzero-ness
for generated pair-distance extra factors. -/
theorem pairDistanceProduct_ne_zero {D : CounterexampleData}
    (P : ManifestLabelPacket D)
    {pairs : List (Label × Label)}
    (hlabels : ∀ ab ∈ pairs, ab.1 ≠ ab.2) :
    pairDistanceProduct pairs P.point ≠ 0 := by
  exact pairDistanceProduct_ne_zero_of_injective hlabels P.point_injective

end ManifestLabelPacket

/-- A proof-facing critical row selected for one U1 depth-5 source label. -/
structure CriticalRowPacket (D : CounterexampleData) (source : Plane) where
  source_mem : source ∈ D.A
  center : Plane
  selected : CriticalSelectedFourClass D.A source center

namespace CriticalRowPacket

/-- Build the selected critical row supplied by a global critical-shell system. -/
noncomputable def ofCriticalShellSystem {D : CounterexampleData}
    (H : CriticalShellSystem D.A) {source : Plane} (hsource : source ∈ D.A) :
    CriticalRowPacket D source where
  source_mem := hsource
  center := H.centerAt source hsource
  selected := H.selectedAt source hsource

/-- The row source is one of the four selected row labels. -/
theorem source_eq_named {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    source = R.selected.l1 ∨ source = R.selected.l2 ∨
      source = R.selected.l3 ∨ source = R.selected.l4 :=
  R.selected.source_eq_named

/-- The four selected row labels lie in the ambient carrier. -/
theorem labels_mem {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    R.selected.l1 ∈ D.A ∧ R.selected.l2 ∈ D.A ∧
      R.selected.l3 ∈ D.A ∧ R.selected.l4 ∈ D.A :=
  ⟨R.selected.l1_mem_A, R.selected.l2_mem_A,
    R.selected.l3_mem_A, R.selected.l4_mem_A⟩

/-- The four selected row labels lie on the selected critical shell. -/
theorem labels_on_shell {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    dist R.center R.selected.l1 = R.selected.toCriticalFourShell.radius ∧
      dist R.center R.selected.l2 = R.selected.toCriticalFourShell.radius ∧
      dist R.center R.selected.l3 = R.selected.toCriticalFourShell.radius ∧
      dist R.center R.selected.l4 = R.selected.toCriticalFourShell.radius :=
  ⟨R.selected.l1_dist, R.selected.l2_dist,
    R.selected.l3_dist, R.selected.l4_dist⟩

/-- A point identified with one of the four selected critical-row labels lies
on the selected critical shell. -/
theorem point_on_shell_of_eq_named {D : CounterexampleData} {source z : Plane}
    (R : CriticalRowPacket D source)
    (hz : z = R.selected.l1 ∨ z = R.selected.l2 ∨
      z = R.selected.l3 ∨ z = R.selected.l4) :
    dist R.center z = R.selected.toCriticalFourShell.radius := by
  rcases hz with h | h | h | h
  · simpa [h] using R.selected.l1_dist
  · simpa [h] using R.selected.l2_dist
  · simpa [h] using R.selected.l3_dist
  · simpa [h] using R.selected.l4_dist

/-- The row source itself lies on its selected critical shell. -/
theorem source_on_shell {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    dist R.center source = R.selected.toCriticalFourShell.radius := by
  rcases R.source_eq_named with h | h | h | h
  · simpa [h] using R.selected.l1_dist
  · simpa [h] using R.selected.l2_dist
  · simpa [h] using R.selected.l3_dist
  · simpa [h] using R.selected.l4_dist

/-- The blocker center of a critical row is not its deleted source.

The source itself lies on the positive-radius selected shell, so identifying the
row center with the source would force a positive radius to be zero. -/
theorem center_ne_source {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    R.center ≠ source := by
  intro hcenter
  have hdist : dist R.center source =
      R.selected.toCriticalFourShell.radius :=
    R.source_on_shell
  have hzero : dist R.center source = 0 := by
    rw [hcenter, dist_self]
  linarith [R.selected.toCriticalFourShell.radius_pos]

/-- Exactness of the selected critical row over the ambient carrier. -/
theorem full_shell_exact {D : CounterexampleData} {source z : Plane}
    (R : CriticalRowPacket D source)
    (hzA : z ∈ D.A)
    (hzdist : dist R.center z = R.selected.toCriticalFourShell.radius) :
    z = R.selected.l1 ∨ z = R.selected.l2 ∨
      z = R.selected.l3 ∨ z = R.selected.l4 :=
  R.selected.off_row_named_label_forbidden hzA hzdist

end CriticalRowPacket

/-- The five source-indexed critical rows used by the U1 depth-5 manifest
producer.  The live selected candidate `selectedU` is the theorem-facing
source label `f1`; `p` is a fixed base label and does not require a critical
row for the current product-collapse route. -/
structure CriticalSourceRows (D : CounterexampleData)
    (baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  qRow : CriticalRowPacket D baseQ
  t1Row : CriticalRowPacket D baseT1
  t2Row : CriticalRowPacket D baseT2
  t3Row : CriticalRowPacket D baseT3
  uRow : CriticalRowPacket D selectedU

namespace CriticalSourceRows

/-- Build the five U1 depth-5 source rows from a global critical-shell system. -/
noncomputable def ofCriticalShellSystem {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (H : CriticalShellSystem D.A)
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) :
    CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU where
  qRow := CriticalRowPacket.ofCriticalShellSystem H baseQ_mem
  t1Row := CriticalRowPacket.ofCriticalShellSystem H baseT1_mem
  t2Row := CriticalRowPacket.ofCriticalShellSystem H baseT2_mem
  t3Row := CriticalRowPacket.ofCriticalShellSystem H baseT3_mem
  uRow := CriticalRowPacket.ofCriticalShellSystem H selectedU_mem

end CriticalSourceRows

/-- The five critical-row sources used by the U1 depth-5 manifest bridge.

The constructor `f1` denotes the live selected candidate `u`, matching the
theorem-facing label convention `f1 := u`. -/
inductive CriticalSource where
  | q
  | t1
  | t2
  | t3
  | f1
deriving DecidableEq

namespace CriticalSource

/-- The packet label corresponding to a source-indexed critical row. -/
def toLabel : CriticalSource → Label
  | .q => U1Depth5.q
  | .t1 => U1Depth5.t1
  | .t2 => U1Depth5.t2
  | .t3 => U1Depth5.t3
  | .f1 => U1Depth5.f1

end CriticalSource

/-- A row label slot inside one selected four-point critical row. -/
abbrev CriticalSlot := Fin 4

/-- An ordered view of an ordinary selected four-point same-radius row.

`SelectedFourClass` is the row surface supplied directly by the global K4
property at a packet label.  It is set-based, while the finite manifest uses
slot names.  This structure records one slot ordering of that selected support.
Unlike `CriticalSelectedFourClass`, it does not assert that a deleted source
label is one of the slots. -/
structure OrderedSelectedFourClass (A : Finset Plane) (center : Plane) where
  /-- The underlying selected same-radius class centered at `center`. -/
  row : SelectedFourClass A center
  /-- First named support point. -/
  l1 : Plane
  /-- Second named support point. -/
  l2 : Plane
  /-- Third named support point. -/
  l3 : Plane
  /-- Fourth named support point. -/
  l4 : Plane
  l1_ne_l2 : l1 ≠ l2
  l1_ne_l3 : l1 ≠ l3
  l1_ne_l4 : l1 ≠ l4
  l2_ne_l3 : l2 ≠ l3
  l2_ne_l4 : l2 ≠ l4
  l3_ne_l4 : l3 ≠ l4
  /-- The selected support is precisely the four named slots. -/
  support_eq_labels : row.support = ({l1, l2, l3, l4} : Finset Plane)

namespace OrderedSelectedFourClass

/-- Choose an arbitrary slot ordering for a selected four-point row. -/
noncomputable def ofSelectedFourClass {A : Finset Plane} {center : Plane}
    (row : SelectedFourClass A center) :
    OrderedSelectedFourClass A center := by
  classical
  have hcard : row.support.card = 4 := row.support_card
  rw [Finset.card_eq_four] at hcard
  let l1 := Classical.choose hcard
  have hcard1 := Classical.choose_spec hcard
  let l2 := Classical.choose hcard1
  have hcard2 := Classical.choose_spec hcard1
  let l3 := Classical.choose hcard2
  have hcard3 := Classical.choose_spec hcard2
  let l4 := Classical.choose hcard3
  have hspec := Classical.choose_spec hcard3
  have h12 : l1 ≠ l2 := hspec.1
  have h13 : l1 ≠ l3 := hspec.2.1
  have h14 : l1 ≠ l4 := hspec.2.2.1
  have h23 : l2 ≠ l3 := hspec.2.2.2.1
  have h24 : l2 ≠ l4 := hspec.2.2.2.2.1
  have h34 : l3 ≠ l4 := hspec.2.2.2.2.2.1
  have hlabels : row.support = ({l1, l2, l3, l4} : Finset Plane) :=
    hspec.2.2.2.2.2.2
  exact
    { row := row
      l1 := l1
      l2 := l2
      l3 := l3
      l4 := l4
      l1_ne_l2 := h12
      l1_ne_l3 := h13
      l1_ne_l4 := h14
      l2_ne_l3 := h23
      l2_ne_l4 := h24
      l3_ne_l4 := h34
      support_eq_labels := hlabels }

/-- Build an ordered selected row with prescribed slots from carrier
membership, distinctness, and equal-radius facts.

This is the proof-facing alternative to `ofGlobalK4` when a finite manifest
branch names the four selected slots explicitly. -/
noncomputable def ofLabels {A : Finset Plane} {center l1 l2 l3 l4 : Plane}
    (hl1A : l1 ∈ A) (hl2A : l2 ∈ A) (hl3A : l3 ∈ A) (hl4A : l4 ∈ A)
    (h12 : l1 ≠ l2) (h13 : l1 ≠ l3) (h14 : l1 ≠ l4)
    (h23 : l2 ≠ l3) (h24 : l2 ≠ l4) (h34 : l3 ≠ l4)
    (hcenter1 : center ≠ l1) (hcenter2 : center ≠ l2)
    (hcenter3 : center ≠ l3) (hcenter4 : center ≠ l4)
    (h2 : dist center l2 = dist center l1)
    (h3 : dist center l3 = dist center l1)
    (h4 : dist center l4 = dist center l1) :
    OrderedSelectedFourClass A center := by
  classical
  let row : SelectedFourClass A center :=
    { support := ({l1, l2, l3, l4} : Finset Plane)
      support_subset_A := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl | rfl | rfl
        · exact hl1A
        · exact hl2A
        · exact hl3A
        · exact hl4A
      support_card := by
        rw [Finset.card_eq_four]
        exact ⟨l1, l2, l3, l4, h12, h13, h14, h23, h24, h34, rfl⟩
      radius := dist center l1
      radius_pos := dist_pos.mpr hcenter1
      support_eq_radius := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl | rfl | rfl
        · rfl
        · exact h2
        · exact h3
        · exact h4
      center_not_mem := by
        intro hmem
        simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
        rcases hmem with hmem | hmem | hmem | hmem
        · exact hcenter1 hmem
        · exact hcenter2 hmem
        · exact hcenter3 hmem
        · exact hcenter4 hmem }
  exact
    { row := row
      l1 := l1
      l2 := l2
      l3 := l3
      l4 := l4
      l1_ne_l2 := h12
      l1_ne_l3 := h13
      l1_ne_l4 := h14
      l2_ne_l3 := h23
      l2_ne_l4 := h24
      l3_ne_l4 := h34
      support_eq_labels := rfl }

/-- Choose an ordered packet-label-centered row from the global K4 property. -/
noncomputable def ofGlobalK4 {A : Finset Plane} {center : Plane}
    (hK4 : HasNEquidistantProperty 4 A) (hcenter : center ∈ A) :
    OrderedSelectedFourClass A center :=
  ofSelectedFourClass
    (Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hcenter))

/-- The point named by a selected row slot. -/
def slotPoint {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) (slot : CriticalSlot) : Plane :=
  ![R.l1, R.l2, R.l3, R.l4] slot

@[simp] theorem slotPoint_zero {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) :
    R.slotPoint 0 = R.l1 := by
  simp [slotPoint]

@[simp] theorem slotPoint_one {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) :
    R.slotPoint 1 = R.l2 := by
  simp [slotPoint]

@[simp] theorem slotPoint_two {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) :
    R.slotPoint 2 = R.l3 := by
  simp [slotPoint]

@[simp] theorem slotPoint_three {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) :
    R.slotPoint 3 = R.l4 := by
  simp [slotPoint]

/-- A selected slot belongs to the underlying four-point support. -/
theorem slotPoint_mem_support {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) (slot : CriticalSlot) :
    R.slotPoint slot ∈ R.row.support := by
  fin_cases slot <;> simp [slotPoint, R.support_eq_labels]

/-- A selected slot is an ambient carrier point. -/
theorem slotPoint_mem {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) (slot : CriticalSlot) :
    R.slotPoint slot ∈ A :=
  R.row.support_subset_A (R.slotPoint_mem_support slot)

/-- A selected slot lies on the row circle centered at the packet label. -/
theorem slotPoint_on_shell {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center) (slot : CriticalSlot) :
    dist center (R.slotPoint slot) = R.row.radius :=
  R.row.support_eq_radius (R.slotPoint slot) (R.slotPoint_mem_support slot)

/-- Any two selected slots have the same packet-label-centered radius. -/
theorem slotPoint_dist_eq {A : Finset Plane} {center : Plane}
    (R : OrderedSelectedFourClass A center)
    (slot₁ slot₂ : CriticalSlot) :
    dist center (R.slotPoint slot₁) =
      dist center (R.slotPoint slot₂) := by
  rw [R.slotPoint_on_shell slot₁, R.slotPoint_on_shell slot₂]

end OrderedSelectedFourClass

/-- Packet-label-centered ordinary K4 rows at the five labels used by the
current q:t3 source-UNIT row-slot surface.

These rows are separate from `CriticalSourceRows`: they are centered at the
packet labels themselves and are supplied by the global K4 property.  Exact
slot assignments such as the record001 pattern remain finite manifest data. -/
structure PacketLabelCenteredRows (D : CounterexampleData)
    (baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  qRow : OrderedSelectedFourClass D.A baseQ
  t1Row : OrderedSelectedFourClass D.A baseT1
  t2Row : OrderedSelectedFourClass D.A baseT2
  t3Row : OrderedSelectedFourClass D.A baseT3
  uRow : OrderedSelectedFourClass D.A selectedU

/-- Minimal theorem-facing transport package for the record001 q/t1-facing
rows on the current branch-0 manifest surface.

This is the active producer target after the `f1:t2` collision-product shrink:
it records only the five q/t1 metric shadows, without bundling the unrelated
`t2`/`t3` residual rows or any centered-row wrapper as public output. -/
structure Record001QTFacingTransportRows
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) : Prop where
  hrow_q_t1_f1 : dist baseQ baseT1 = dist baseQ selectedU
  hrow_q_t2_f1 : dist baseQ baseT2 = dist baseQ selectedU
  hrow_t1_p_f1 : dist baseT1 baseP = dist baseT1 selectedU
  hrow_t1_q_f1 : dist baseT1 baseQ = dist baseT1 selectedU
  hrow_t1_t3_f1 : dist baseT1 baseT3 = dist baseT1 selectedU

/-- Internal q/t1 packet-label shell support for the record001 branch-0 q/t1
transport package.

This is weaker than the explicit branch-0 slot-placement package: it records
only that the needed packet labels lie on some q-centered and t1-centered K4
shells, not which selected slot each point occupies.  It is therefore a
candidate theorem-facing landing point for the live large-cap tail after the
explicit blocker-row placement route was ruled out. -/
structure Record001QTShellSupport (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  qRow : OrderedSelectedFourClass D.A baseQ
  t1Row : OrderedSelectedFourClass D.A baseT1
  q_t1_on_shell : dist baseQ baseT1 = qRow.row.radius
  q_t2_on_shell : dist baseQ baseT2 = qRow.row.radius
  q_f1_on_shell : dist baseQ selectedU = qRow.row.radius
  t1_p_on_shell : dist baseT1 baseP = t1Row.row.radius
  t1_q_on_shell : dist baseT1 baseQ = t1Row.row.radius
  t1_t3_on_shell : dist baseT1 baseT3 = t1Row.row.radius
  t1_f1_on_shell : dist baseT1 selectedU = t1Row.row.radius

/-- Minimal two-centered placement/support payload for the record001 q/t1
transport package.

This is the exact centered-row surface a future two-center provenance
certificate should target: the selected q-row and t1-row together with the
seven record001 slot placements they must realize. -/
structure Record001QTTwoCenteredRows (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  qRow : OrderedSelectedFourClass D.A baseQ
  t1Row : OrderedSelectedFourClass D.A baseT1
  hpt_t1_q_2 : baseT1 = qRow.slotPoint 2
  hpt_f1_q_0 : selectedU = qRow.slotPoint 0
  hpt_t2_q_3 : baseT2 = qRow.slotPoint 3
  hpt_p_t1_1 : baseP = t1Row.slotPoint 1
  hpt_f1_t1_0 : selectedU = t1Row.slotPoint 0
  hpt_q_t1_2 : baseQ = t1Row.slotPoint 2
  hpt_t3_t1_3 : baseT3 = t1Row.slotPoint 3

namespace PacketLabelCenteredRows

/-- Export the public q/t1 transport package from the weaker q/t1 shell support
surface.

Unlike `Record001QTTwoCenteredRows`, this theorem does not identify any
selected slots.  It uses only the fact that the relevant packet labels lie on
common q-centered and t1-centered shells. -/
theorem record001QTFacingTransportRows_of_shellSupport
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (S : Record001QTShellSupport D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  refine
    { hrow_q_t1_f1 := ?_
      hrow_q_t2_f1 := ?_
      hrow_t1_p_f1 := ?_
      hrow_t1_q_f1 := ?_
      hrow_t1_t3_f1 := ?_ }
  · rw [S.q_t1_on_shell, S.q_f1_on_shell]
  · rw [S.q_t2_on_shell, S.q_f1_on_shell]
  · rw [S.t1_p_on_shell, S.t1_f1_on_shell]
  · rw [S.t1_q_on_shell, S.t1_f1_on_shell]
  · rw [S.t1_t3_on_shell, S.t1_f1_on_shell]

/-- Package the weaker q/t1 shell-support surface from packet-label-centered
rows plus the seven q/t1 shell incidences. -/
def record001QTShellSupport
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (q_t1_on_shell : dist baseQ baseT1 = R.qRow.row.radius)
    (q_t2_on_shell : dist baseQ baseT2 = R.qRow.row.radius)
    (q_f1_on_shell : dist baseQ selectedU = R.qRow.row.radius)
    (t1_p_on_shell : dist baseT1 baseP = R.t1Row.row.radius)
    (t1_q_on_shell : dist baseT1 baseQ = R.t1Row.row.radius)
    (t1_t3_on_shell : dist baseT1 baseT3 = R.t1Row.row.radius)
    (t1_f1_on_shell : dist baseT1 selectedU = R.t1Row.row.radius) :
    Record001QTShellSupport D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
  { qRow := R.qRow
    t1Row := R.t1Row
    q_t1_on_shell := q_t1_on_shell
    q_t2_on_shell := q_t2_on_shell
    q_f1_on_shell := q_f1_on_shell
    t1_p_on_shell := t1_p_on_shell
    t1_q_on_shell := t1_q_on_shell
    t1_t3_on_shell := t1_t3_on_shell
    t1_f1_on_shell := t1_f1_on_shell }

/-- Build the packet-label-centered ordinary K4 rows from global K4 and carrier
membership at the five packet labels. -/
noncomputable def ofGlobalK4 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) :
    PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU where
  qRow := OrderedSelectedFourClass.ofGlobalK4 D.K4 baseQ_mem
  t1Row := OrderedSelectedFourClass.ofGlobalK4 D.K4 baseT1_mem
  t2Row := OrderedSelectedFourClass.ofGlobalK4 D.K4 baseT2_mem
  t3Row := OrderedSelectedFourClass.ofGlobalK4 D.K4 baseT3_mem
  uRow := OrderedSelectedFourClass.ofGlobalK4 D.K4 selectedU_mem

/-- The exact additional q/t1 packet-label input needed over the canonical
global-K4 rows: the seven q/t1 shell incidences already suffice to build the
new q/t1 shell-support boundary. -/
theorem record001QTShellSupport_ofGlobalK4
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A)
    (q_t1_on_shell :
      dist baseQ baseT1 =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).qRow.row.radius)
    (q_t2_on_shell :
      dist baseQ baseT2 =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).qRow.row.radius)
    (q_f1_on_shell :
      dist baseQ selectedU =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).qRow.row.radius)
    (t1_p_on_shell :
      dist baseT1 baseP =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).t1Row.row.radius)
    (t1_q_on_shell :
      dist baseT1 baseQ =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).t1Row.row.radius)
    (t1_t3_on_shell :
      dist baseT1 baseT3 =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).t1Row.row.radius)
    (t1_f1_on_shell :
      dist baseT1 selectedU =
        (ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).t1Row.row.radius) :
    Nonempty (Record001QTShellSupport
      D baseP baseQ baseT1 baseT2 baseT3 selectedU) := by
  let R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU :=
    ofGlobalK4 baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem
  exact ⟨record001QTShellSupport R q_t1_on_shell q_t2_on_shell q_f1_on_shell
    t1_p_on_shell t1_q_on_shell t1_t3_on_shell t1_f1_on_shell⟩

/-- Record001 branch-0 packet-label-centered rows with the manifest slots
prescribed by metric hrow facts.

The resulting rows have definitional slots
`qRow=[f1,p,t1,t2]`, `t1Row=[f1,p,q,t3]`,
`t2Row=[f2,f5,p,q]`, `t3Row=[f1,f2,p,t1]`, and
`uRow=[f2,f3,f4,p]`.  This avoids the arbitrary choice made by
`ofGlobalK4`; a producer now owes the finite row-radius equalities rather than
placements into an unknown selected row. -/
noncomputable def ofRecord001Branch0HRows {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU
      f2Point f3Point f4Point f5Point : Plane}
    (baseP_mem : baseP ∈ D.A) (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A) (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A) (selectedU_mem : selectedU ∈ D.A)
    (f2_mem : f2Point ∈ D.A) (f3_mem : f3Point ∈ D.A)
    (f4_mem : f4Point ∈ D.A) (f5_mem : f5Point ∈ D.A)
    (hlabels :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
          f2Point, f3Point, f4Point, f5Point])
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hrow_q_t1_f1 : dist baseQ baseT1 = dist baseQ selectedU)
    (hrow_q_t2_f1 : dist baseQ baseT2 = dist baseQ selectedU)
    (hrow_t1_p_f1 : dist baseT1 baseP = dist baseT1 selectedU)
    (hrow_t1_q_f1 : dist baseT1 baseQ = dist baseT1 selectedU)
    (hrow_t1_t3_f1 : dist baseT1 baseT3 = dist baseT1 selectedU)
    (hrow_t2_f5_f2 : dist baseT2 f5Point = dist baseT2 f2Point)
    (hrow_t2_p_f2 : dist baseT2 baseP = dist baseT2 f2Point)
    (hrow_t2_q_f2 : dist baseT2 baseQ = dist baseT2 f2Point)
    (hrow_t3_f2_f1 : dist baseT3 f2Point = dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hrow_f1_f3_f2 : dist selectedU f3Point = dist selectedU f2Point)
    (hrow_f1_f4_f2 : dist selectedU f4Point = dist selectedU f2Point)
    (hrow_f1_p_f2 : dist selectedU baseP = dist selectedU f2Point) :
    PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU := by
  classical
  let pt := pointOf baseP baseQ baseT1 baseT2 baseT3 selectedU
    f2Point f3Point f4Point f5Point
  have hne {a b : Label} (hab : a ≠ b) : pt a ≠ pt b := by
    simpa [pt] using pointOf_ne_of_pairwise hlabels hab
  exact
    { qRow :=
        OrderedSelectedFourClass.ofLabels
          selectedU_mem baseP_mem baseT1_mem baseT2_mem
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ t1))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ t2))
          (by simpa [pt, pointOf] using hne (by decide : p ≠ t1))
          (by simpa [pt, pointOf] using hne (by decide : p ≠ t2))
          (by simpa [pt, pointOf] using hne (by decide : t1 ≠ t2))
          (by simpa [pt, pointOf] using hne (by decide : q ≠ f1))
          (by simpa [pt, pointOf] using hne (by decide : q ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : q ≠ t1))
          (by simpa [pt, pointOf] using hne (by decide : q ≠ t2))
          hrow_q_p_f1 hrow_q_t1_f1 hrow_q_t2_f1
      t1Row :=
        OrderedSelectedFourClass.ofLabels
          selectedU_mem baseP_mem baseQ_mem baseT3_mem
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ q))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ t3))
          (by simpa [pt, pointOf] using hne (by decide : p ≠ q))
          (by simpa [pt, pointOf] using hne (by decide : p ≠ t3))
          (by simpa [pt, pointOf] using hne (by decide : q ≠ t3))
          (by simpa [pt, pointOf] using hne (by decide : t1 ≠ f1))
          (by simpa [pt, pointOf] using hne (by decide : t1 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : t1 ≠ q))
          (by simpa [pt, pointOf] using hne (by decide : t1 ≠ t3))
          hrow_t1_p_f1 hrow_t1_q_f1 hrow_t1_t3_f1
      t2Row :=
        OrderedSelectedFourClass.ofLabels
          f2_mem f5_mem baseP_mem baseQ_mem
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ f5))
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ q))
          (by simpa [pt, pointOf] using hne (by decide : f5 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f5 ≠ q))
          (by simpa [pt, pointOf] using hne (by decide : p ≠ q))
          (by simpa [pt, pointOf] using hne (by decide : t2 ≠ f2))
          (by simpa [pt, pointOf] using hne (by decide : t2 ≠ f5))
          (by simpa [pt, pointOf] using hne (by decide : t2 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : t2 ≠ q))
          hrow_t2_f5_f2 hrow_t2_p_f2 hrow_t2_q_f2
      t3Row :=
        OrderedSelectedFourClass.ofLabels
          selectedU_mem f2_mem baseP_mem baseT1_mem
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ f2))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ t1))
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ t1))
          (by simpa [pt, pointOf] using hne (by decide : p ≠ t1))
          (by simpa [pt, pointOf] using hne (by decide : t3 ≠ f1))
          (by simpa [pt, pointOf] using hne (by decide : t3 ≠ f2))
          (by simpa [pt, pointOf] using hne (by decide : t3 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : t3 ≠ t1))
          hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1
      uRow :=
        OrderedSelectedFourClass.ofLabels
          f2_mem f3_mem f4_mem baseP_mem
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ f3))
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ f4))
          (by simpa [pt, pointOf] using hne (by decide : f2 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f3 ≠ f4))
          (by simpa [pt, pointOf] using hne (by decide : f3 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f4 ≠ p))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ f2))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ f3))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ f4))
          (by simpa [pt, pointOf] using hne (by decide : f1 ≠ p))
          hrow_f1_f3_f2 hrow_f1_f4_f2 hrow_f1_p_f2 }

/-- Transport a centered `f1`-row placement to the `f1:f3=f2` hrow fact. -/
theorem hrow_f1_f3_f2 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU f2Point f3Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_f3_f1_1 : f3Point = R.uRow.slotPoint 1)
    (hpt_f2_f1_0 : f2Point = R.uRow.slotPoint 0) :
    dist selectedU f3Point = dist selectedU f2Point := by
  rw [hpt_f3_f1_1, hpt_f2_f1_0]
  exact R.uRow.slotPoint_dist_eq 1 0

/-- Transport a centered `f1`-row placement to the `f1:f4=f2` hrow fact. -/
theorem hrow_f1_f4_f2 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU f2Point f4Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_f4_f1_2 : f4Point = R.uRow.slotPoint 2)
    (hpt_f2_f1_0 : f2Point = R.uRow.slotPoint 0) :
    dist selectedU f4Point = dist selectedU f2Point := by
  rw [hpt_f4_f1_2, hpt_f2_f1_0]
  exact R.uRow.slotPoint_dist_eq 2 0

/-- Transport a centered `f1`-row placement to the `f1:p=f2` hrow fact. -/
theorem hrow_f1_p_f2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU f2Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_p_f1_3 : baseP = R.uRow.slotPoint 3)
    (hpt_f2_f1_0 : f2Point = R.uRow.slotPoint 0) :
    dist selectedU baseP = dist selectedU f2Point := by
  rw [hpt_p_f1_3, hpt_f2_f1_0]
  exact R.uRow.slotPoint_dist_eq 3 0

/-- Transport a centered `f1`-row extra incidence to the `f1:t2=f2`
extra atom. -/
theorem hrow_f1_t2_f2_of_radius {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU f2Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_f2_f1_0 : f2Point = R.uRow.slotPoint 0)
    (ht2_on_f1_radius : dist selectedU baseT2 = R.uRow.row.radius) :
    dist selectedU baseT2 = dist selectedU f2Point := by
  calc
    dist selectedU baseT2 = R.uRow.row.radius := ht2_on_f1_radius
    _ = dist selectedU (R.uRow.slotPoint 0) :=
      (R.uRow.slotPoint_on_shell 0).symm
    _ = dist selectedU f2Point :=
      (congrArg (fun z : Plane => dist selectedU z) hpt_f2_f1_0).symm

/-- Transport a centered `q`-row placement to the `q:t1=f1` hrow fact. -/
theorem hrow_q_t1_f1 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t1_q_2 : baseT1 = R.qRow.slotPoint 2)
    (hpt_f1_q_0 : selectedU = R.qRow.slotPoint 0) :
    dist baseQ baseT1 = dist baseQ selectedU := by
  calc
    dist baseQ baseT1 = dist baseQ (R.qRow.slotPoint 2) :=
      congrArg (fun z : Plane => dist baseQ z) hpt_t1_q_2
    _ = dist baseQ (R.qRow.slotPoint 0) := R.qRow.slotPoint_dist_eq 2 0
    _ = dist baseQ selectedU :=
      (congrArg (fun z : Plane => dist baseQ z) hpt_f1_q_0).symm

/-- Transport a centered `q`-row placement to the `q:t2=f1` hrow fact. -/
theorem hrow_q_t2_f1 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t2_q_3 : baseT2 = R.qRow.slotPoint 3)
    (hpt_f1_q_0 : selectedU = R.qRow.slotPoint 0) :
    dist baseQ baseT2 = dist baseQ selectedU := by
  calc
    dist baseQ baseT2 = dist baseQ (R.qRow.slotPoint 3) :=
      congrArg (fun z : Plane => dist baseQ z) hpt_t2_q_3
    _ = dist baseQ (R.qRow.slotPoint 0) := R.qRow.slotPoint_dist_eq 3 0
    _ = dist baseQ selectedU :=
      (congrArg (fun z : Plane => dist baseQ z) hpt_f1_q_0).symm

/-- Transport a centered `t1`-row placement to the `t1:p=f1` hrow fact. -/
theorem hrow_t1_p_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_p_t1_1 : baseP = R.t1Row.slotPoint 1)
    (hpt_f1_t1_0 : selectedU = R.t1Row.slotPoint 0) :
    dist baseT1 baseP = dist baseT1 selectedU := by
  calc
    dist baseT1 baseP = dist baseT1 (R.t1Row.slotPoint 1) :=
      congrArg (fun z : Plane => dist baseT1 z) hpt_p_t1_1
    _ = dist baseT1 (R.t1Row.slotPoint 0) := R.t1Row.slotPoint_dist_eq 1 0
    _ = dist baseT1 selectedU :=
      (congrArg (fun z : Plane => dist baseT1 z) hpt_f1_t1_0).symm

/-- Transport a centered `t1`-row placement to the `t1:q=f1` hrow fact. -/
theorem hrow_t1_q_f1 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_q_t1_2 : baseQ = R.t1Row.slotPoint 2)
    (hpt_f1_t1_0 : selectedU = R.t1Row.slotPoint 0) :
    dist baseT1 baseQ = dist baseT1 selectedU := by
  calc
    dist baseT1 baseQ = dist baseT1 (R.t1Row.slotPoint 2) :=
      congrArg (fun z : Plane => dist baseT1 z) hpt_q_t1_2
    _ = dist baseT1 (R.t1Row.slotPoint 0) := R.t1Row.slotPoint_dist_eq 2 0
    _ = dist baseT1 selectedU :=
      (congrArg (fun z : Plane => dist baseT1 z) hpt_f1_t1_0).symm

/-- Transport a centered `t1`-row placement to the `t1:t3=f1` hrow fact. -/
theorem hrow_t1_t3_f1 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t3_t1_3 : baseT3 = R.t1Row.slotPoint 3)
    (hpt_f1_t1_0 : selectedU = R.t1Row.slotPoint 0) :
    dist baseT1 baseT3 = dist baseT1 selectedU := by
  calc
    dist baseT1 baseT3 = dist baseT1 (R.t1Row.slotPoint 3) :=
      congrArg (fun z : Plane => dist baseT1 z) hpt_t3_t1_3
    _ = dist baseT1 (R.t1Row.slotPoint 0) := R.t1Row.slotPoint_dist_eq 3 0
    _ = dist baseT1 selectedU :=
      (congrArg (fun z : Plane => dist baseT1 z) hpt_f1_t1_0).symm

/-- The q-row and t1-row placements alone determine the five q/t1-facing
transport rows needed on the reduced record001 branch-0 surface.  This is the
minimal adapter for a future two-center provenance certificate: it does not
require the unrelated centered `t2`/`t3`/`f1` rows. -/
theorem record001QTFacingTransportRows_of_twoCenteredRows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (qRow : OrderedSelectedFourClass D.A baseQ)
    (t1Row : OrderedSelectedFourClass D.A baseT1)
    (hpt_t1_q_2 : baseT1 = qRow.slotPoint 2)
    (hpt_f1_q_0 : selectedU = qRow.slotPoint 0)
    (hpt_t2_q_3 : baseT2 = qRow.slotPoint 3)
    (hpt_p_t1_1 : baseP = t1Row.slotPoint 1)
    (hpt_f1_t1_0 : selectedU = t1Row.slotPoint 0)
    (hpt_q_t1_2 : baseQ = t1Row.slotPoint 2)
    (hpt_t3_t1_3 : baseT3 = t1Row.slotPoint 3) :
    Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  exact
    { hrow_q_t1_f1 := by
        calc
          dist baseQ baseT1 = dist baseQ (qRow.slotPoint 2) :=
            congrArg (fun z : Plane => dist baseQ z) hpt_t1_q_2
          _ = dist baseQ (qRow.slotPoint 0) := qRow.slotPoint_dist_eq 2 0
          _ = dist baseQ selectedU :=
            (congrArg (fun z : Plane => dist baseQ z) hpt_f1_q_0).symm
      hrow_q_t2_f1 := by
        calc
          dist baseQ baseT2 = dist baseQ (qRow.slotPoint 3) :=
            congrArg (fun z : Plane => dist baseQ z) hpt_t2_q_3
          _ = dist baseQ (qRow.slotPoint 0) := qRow.slotPoint_dist_eq 3 0
          _ = dist baseQ selectedU :=
            (congrArg (fun z : Plane => dist baseQ z) hpt_f1_q_0).symm
      hrow_t1_p_f1 := by
        calc
          dist baseT1 baseP = dist baseT1 (t1Row.slotPoint 1) :=
            congrArg (fun z : Plane => dist baseT1 z) hpt_p_t1_1
          _ = dist baseT1 (t1Row.slotPoint 0) := t1Row.slotPoint_dist_eq 1 0
          _ = dist baseT1 selectedU :=
            (congrArg (fun z : Plane => dist baseT1 z) hpt_f1_t1_0).symm
      hrow_t1_q_f1 := by
        calc
          dist baseT1 baseQ = dist baseT1 (t1Row.slotPoint 2) :=
            congrArg (fun z : Plane => dist baseT1 z) hpt_q_t1_2
          _ = dist baseT1 (t1Row.slotPoint 0) := t1Row.slotPoint_dist_eq 2 0
          _ = dist baseT1 selectedU :=
            (congrArg (fun z : Plane => dist baseT1 z) hpt_f1_t1_0).symm
      hrow_t1_t3_f1 := by
        calc
          dist baseT1 baseT3 = dist baseT1 (t1Row.slotPoint 3) :=
            congrArg (fun z : Plane => dist baseT1 z) hpt_t3_t1_3
          _ = dist baseT1 (t1Row.slotPoint 0) := t1Row.slotPoint_dist_eq 3 0
          _ = dist baseT1 selectedU :=
            (congrArg (fun z : Plane => dist baseT1 z) hpt_f1_t1_0).symm }

/-- Forget the explicit slot identifications in a two-centered payload,
retaining only the weaker q/t1 shell support surface. -/
def Record001QTTwoCenteredRows.toShellSupport
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (H : Record001QTTwoCenteredRows
      D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Record001QTShellSupport D baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  refine
    { qRow := H.qRow
      t1Row := H.t1Row
      q_t1_on_shell := ?_
      q_t2_on_shell := ?_
      q_f1_on_shell := ?_
      t1_p_on_shell := ?_
      t1_q_on_shell := ?_
      t1_t3_on_shell := ?_
      t1_f1_on_shell := ?_ }
  · calc
      dist baseQ baseT1 = dist baseQ (H.qRow.slotPoint 2) := by
        simpa using congrArg (fun z : Plane => dist baseQ z) H.hpt_t1_q_2
      _ = H.qRow.row.radius := H.qRow.slotPoint_on_shell 2
  · calc
      dist baseQ baseT2 = dist baseQ (H.qRow.slotPoint 3) := by
        simpa using congrArg (fun z : Plane => dist baseQ z) H.hpt_t2_q_3
      _ = H.qRow.row.radius := H.qRow.slotPoint_on_shell 3
  · calc
      dist baseQ selectedU = dist baseQ (H.qRow.slotPoint 0) := by
        simpa using congrArg (fun z : Plane => dist baseQ z) H.hpt_f1_q_0
      _ = H.qRow.row.radius := H.qRow.slotPoint_on_shell 0
  · calc
      dist baseT1 baseP = dist baseT1 (H.t1Row.slotPoint 1) := by
        simpa using congrArg (fun z : Plane => dist baseT1 z) H.hpt_p_t1_1
      _ = H.t1Row.row.radius := H.t1Row.slotPoint_on_shell 1
  · calc
      dist baseT1 baseQ = dist baseT1 (H.t1Row.slotPoint 2) := by
        simpa using congrArg (fun z : Plane => dist baseT1 z) H.hpt_q_t1_2
      _ = H.t1Row.row.radius := H.t1Row.slotPoint_on_shell 2
  · calc
      dist baseT1 baseT3 = dist baseT1 (H.t1Row.slotPoint 3) := by
        simpa using congrArg (fun z : Plane => dist baseT1 z) H.hpt_t3_t1_3
      _ = H.t1Row.row.radius := H.t1Row.slotPoint_on_shell 3
  · calc
      dist baseT1 selectedU = dist baseT1 (H.t1Row.slotPoint 0) := by
        simpa using congrArg (fun z : Plane => dist baseT1 z) H.hpt_f1_t1_0
      _ = H.t1Row.row.radius := H.t1Row.slotPoint_on_shell 0

/-- Extract the minimal record001 q/t1 two-centered payload from the full
packet-label-centered row package. -/
def record001QTTwoCenteredRows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t1_q_2 : baseT1 = R.qRow.slotPoint 2)
    (hpt_f1_q_0 : selectedU = R.qRow.slotPoint 0)
    (hpt_t2_q_3 : baseT2 = R.qRow.slotPoint 3)
    (hpt_p_t1_1 : baseP = R.t1Row.slotPoint 1)
    (hpt_f1_t1_0 : selectedU = R.t1Row.slotPoint 0)
    (hpt_q_t1_2 : baseQ = R.t1Row.slotPoint 2)
    (hpt_t3_t1_3 : baseT3 = R.t1Row.slotPoint 3) :
    Record001QTTwoCenteredRows
      D baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  exact
    { qRow := R.qRow
      t1Row := R.t1Row
      hpt_t1_q_2 := hpt_t1_q_2
      hpt_f1_q_0 := hpt_f1_q_0
      hpt_t2_q_3 := hpt_t2_q_3
      hpt_p_t1_1 := hpt_p_t1_1
      hpt_f1_t1_0 := hpt_f1_t1_0
      hpt_q_t1_2 := hpt_q_t1_2
      hpt_t3_t1_3 := hpt_t3_t1_3 }

/-- The q-row and t1-row placements determine exactly the five q/t1-facing
transport rows needed on the reduced record001 branch-0 surface. -/
theorem record001QTFacingTransportRows {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t1_q_2 : baseT1 = R.qRow.slotPoint 2)
    (hpt_f1_q_0 : selectedU = R.qRow.slotPoint 0)
    (hpt_t2_q_3 : baseT2 = R.qRow.slotPoint 3)
    (hpt_p_t1_1 : baseP = R.t1Row.slotPoint 1)
    (hpt_f1_t1_0 : selectedU = R.t1Row.slotPoint 0)
    (hpt_q_t1_2 : baseQ = R.t1Row.slotPoint 2)
    (hpt_t3_t1_3 : baseT3 = R.t1Row.slotPoint 3) :
    Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  let H :
      Record001QTTwoCenteredRows
        D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
    record001QTTwoCenteredRows R hpt_t1_q_2 hpt_f1_q_0 hpt_t2_q_3
      hpt_p_t1_1 hpt_f1_t1_0 hpt_q_t1_2 hpt_t3_t1_3
  exact
    record001QTFacingTransportRows_of_twoCenteredRows
      H.qRow H.t1Row H.hpt_t1_q_2 H.hpt_f1_q_0 H.hpt_t2_q_3
      H.hpt_p_t1_1 H.hpt_f1_t1_0 H.hpt_q_t1_2 H.hpt_t3_t1_3

/-- Transport a centered `q`-row placement to the `q:p=f1` residual hrow. -/
theorem hrow_q_p_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_p_q_1 : baseP = R.qRow.slotPoint 1)
    (hpt_f1_q_0 : selectedU = R.qRow.slotPoint 0) :
    dist baseQ baseP = dist baseQ selectedU := by
  calc
    dist baseQ baseP = dist baseQ (R.qRow.slotPoint 1) :=
      congrArg (fun z : Plane => dist baseQ z) hpt_p_q_1
    _ = dist baseQ (R.qRow.slotPoint 0) := R.qRow.slotPoint_dist_eq 1 0
    _ = dist baseQ selectedU :=
      (congrArg (fun z : Plane => dist baseQ z) hpt_f1_q_0).symm

/-- Transport a centered `t2`-row placement to the `t2:f5=f2` residual hrow. -/
theorem hrow_t2_f5_f2 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU f2Point f5Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_f5_t2_1 : f5Point = R.t2Row.slotPoint 1)
    (hpt_f2_t2_0 : f2Point = R.t2Row.slotPoint 0) :
    dist baseT2 f5Point = dist baseT2 f2Point := by
  rw [hpt_f5_t2_1, hpt_f2_t2_0]
  exact R.t2Row.slotPoint_dist_eq 1 0

/-- Transport a centered `t2`-row placement to the `t2:p=f2` residual hrow. -/
theorem hrow_t2_p_f2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU f2Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_p_t2_2 : baseP = R.t2Row.slotPoint 2)
    (hpt_f2_t2_0 : f2Point = R.t2Row.slotPoint 0) :
    dist baseT2 baseP = dist baseT2 f2Point := by
  calc
    dist baseT2 baseP = dist baseT2 (R.t2Row.slotPoint 2) :=
      congrArg (fun z : Plane => dist baseT2 z) hpt_p_t2_2
    _ = dist baseT2 (R.t2Row.slotPoint 0) := R.t2Row.slotPoint_dist_eq 2 0
    _ = dist baseT2 f2Point :=
      (congrArg (fun z : Plane => dist baseT2 z) hpt_f2_t2_0).symm

/-- Transport a centered `t2`-row placement to the `t2:q=f2` residual hrow. -/
theorem hrow_t2_q_f2 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU f2Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_q_t2_3 : baseQ = R.t2Row.slotPoint 3)
    (hpt_f2_t2_0 : f2Point = R.t2Row.slotPoint 0) :
    dist baseT2 baseQ = dist baseT2 f2Point := by
  calc
    dist baseT2 baseQ = dist baseT2 (R.t2Row.slotPoint 3) :=
      congrArg (fun z : Plane => dist baseT2 z) hpt_q_t2_3
    _ = dist baseT2 (R.t2Row.slotPoint 0) := R.t2Row.slotPoint_dist_eq 3 0
    _ = dist baseT2 f2Point :=
      (congrArg (fun z : Plane => dist baseT2 z) hpt_f2_t2_0).symm

/-- Transport a centered `t3`-row placement to the `t3:f2=f1` residual hrow. -/
theorem hrow_t3_f2_f1 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU f2Point : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_f2_t3_1 : f2Point = R.t3Row.slotPoint 1)
    (hpt_f1_t3_0 : selectedU = R.t3Row.slotPoint 0) :
    dist baseT3 f2Point = dist baseT3 selectedU := by
  calc
    dist baseT3 f2Point = dist baseT3 (R.t3Row.slotPoint 1) :=
      congrArg (fun z : Plane => dist baseT3 z) hpt_f2_t3_1
    _ = dist baseT3 (R.t3Row.slotPoint 0) := R.t3Row.slotPoint_dist_eq 1 0
    _ = dist baseT3 selectedU :=
      (congrArg (fun z : Plane => dist baseT3 z) hpt_f1_t3_0).symm

/-- Transport a centered `t3`-row placement to the `t3:p=f1` residual hrow. -/
theorem hrow_t3_p_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_p_t3_2 : baseP = R.t3Row.slotPoint 2)
    (hpt_f1_t3_0 : selectedU = R.t3Row.slotPoint 0) :
    dist baseT3 baseP = dist baseT3 selectedU := by
  calc
    dist baseT3 baseP = dist baseT3 (R.t3Row.slotPoint 2) :=
      congrArg (fun z : Plane => dist baseT3 z) hpt_p_t3_2
    _ = dist baseT3 (R.t3Row.slotPoint 0) := R.t3Row.slotPoint_dist_eq 2 0
    _ = dist baseT3 selectedU :=
      (congrArg (fun z : Plane => dist baseT3 z) hpt_f1_t3_0).symm

/-- Transport a centered `t3`-row placement to the `t3:t1=f1` residual hrow. -/
theorem hrow_t3_t1_f1 {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t1_t3_3 : baseT1 = R.t3Row.slotPoint 3)
    (hpt_f1_t3_0 : selectedU = R.t3Row.slotPoint 0) :
    dist baseT3 baseT1 = dist baseT3 selectedU := by
  calc
    dist baseT3 baseT1 = dist baseT3 (R.t3Row.slotPoint 3) :=
      congrArg (fun z : Plane => dist baseT3 z) hpt_t1_t3_3
    _ = dist baseT3 (R.t3Row.slotPoint 0) := R.t3Row.slotPoint_dist_eq 3 0
    _ = dist baseT3 selectedU :=
      (congrArg (fun z : Plane => dist baseT3 z) hpt_f1_t3_0).symm

end PacketLabelCenteredRows

namespace CriticalRowPacket

/-- The point named by a selected critical-row slot. -/
def slotPoint {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) (slot : CriticalSlot) : Plane :=
  ![R.selected.l1, R.selected.l2, R.selected.l3, R.selected.l4] slot

@[simp] theorem slotPoint_zero {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    R.slotPoint 0 = R.selected.l1 := by
  simp [slotPoint]

@[simp] theorem slotPoint_one {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    R.slotPoint 1 = R.selected.l2 := by
  simp [slotPoint]

@[simp] theorem slotPoint_two {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    R.slotPoint 2 = R.selected.l3 := by
  simp [slotPoint]

@[simp] theorem slotPoint_three {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    R.slotPoint 3 = R.selected.l4 := by
  simp [slotPoint]

/-- The source of a critical row is one of its four selected slots.

This is the slot-indexed form of `source_eq_named`, used by generated
source/manifest bridges that branch over row-slot assignments rather than over
the raw `l1`/`l2`/`l3`/`l4` disjunction. -/
theorem exists_source_slot {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) :
    ∃ slot : CriticalSlot, source = R.slotPoint slot := by
  rcases R.source_eq_named with h | h | h | h
  · exact ⟨0, by simpa [slotPoint] using h⟩
  · exact ⟨1, by simpa [slotPoint] using h⟩
  · exact ⟨2, by simpa [slotPoint] using h⟩
  · exact ⟨3, by simpa [slotPoint] using h⟩

/-- A selected critical-row slot names an ambient carrier point. -/
theorem slotPoint_mem {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) (slot : CriticalSlot) :
    R.slotPoint slot ∈ D.A := by
  fin_cases slot <;> simp [slotPoint, R.selected.l1_mem_A,
    R.selected.l2_mem_A, R.selected.l3_mem_A, R.selected.l4_mem_A]

/-- A selected critical-row slot lies on its selected critical shell. -/
theorem slotPoint_on_shell {D : CounterexampleData} {source : Plane}
    (R : CriticalRowPacket D source) (slot : CriticalSlot) :
    dist R.center (R.slotPoint slot) =
      R.selected.toCriticalFourShell.radius := by
  fin_cases slot <;> simp [slotPoint, R.selected.l1_dist,
    R.selected.l2_dist, R.selected.l3_dist, R.selected.l4_dist]

end CriticalRowPacket

namespace CriticalSourceRows

/-- The geometric point represented by one of the five depth-5 row sources. -/
def sourcePoint
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (_R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU) :
    CriticalSource → Plane
  | .q => baseQ
  | .t1 => baseT1
  | .t2 => baseT2
  | .t3 => baseT3
  | .f1 => selectedU

/-- The selected critical row attached to a depth-5 source. -/
def rowAt
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) :
    CriticalRowPacket D (R.sourcePoint source) :=
  match source with
  | .q => R.qRow
  | .t1 => R.t1Row
  | .t2 => R.t2Row
  | .t3 => R.t3Row
  | .f1 => R.uRow

/-- Each source-indexed row contains its own source point on the selected
shell. -/
theorem sourcePoint_on_shell
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) :
    dist (R.rowAt source).center (R.sourcePoint source) =
      (R.rowAt source).selected.toCriticalFourShell.radius :=
  (R.rowAt source).source_on_shell

/-- Source rows in the current critical-shell package are blocker-centered, not
centered at their packet source labels. -/
theorem rowAt_center_ne_sourcePoint
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) :
    (R.rowAt source).center ≠ R.sourcePoint source :=
  (R.rowAt source).center_ne_source

end CriticalSourceRows

/-- Manifest provenance for one produced `f` label: a source row and one of
that row's four selected slots. -/
structure CriticalSlotChoice where
  source : CriticalSource
  slot : CriticalSlot

namespace CriticalSourceRows

/-- The carrier point selected by a manifest row-slot choice. -/
def pointOfChoice
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (choice : CriticalSlotChoice) : Plane :=
  (R.rowAt choice.source).slotPoint choice.slot

/-- Unfold a row-slot choice to the selected slot in its source row. -/
@[simp] theorem pointOfChoice_eq_slotPoint
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (choice : CriticalSlotChoice) :
    R.pointOfChoice choice = (R.rowAt choice.source).slotPoint choice.slot :=
  rfl

/-- A manifest row-slot choice names an ambient carrier point. -/
theorem pointOfChoice_mem
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (choice : CriticalSlotChoice) :
    R.pointOfChoice choice ∈ D.A :=
  (R.rowAt choice.source).slotPoint_mem choice.slot

/-- A manifest row-slot choice lies on the selected shell of its source row. -/
theorem pointOfChoice_on_shell
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (choice : CriticalSlotChoice) :
    dist (R.rowAt choice.source).center (R.pointOfChoice choice) =
      (R.rowAt choice.source).selected.toCriticalFourShell.radius :=
  (R.rowAt choice.source).slotPoint_on_shell choice.slot

/-- The source label attached to a source-indexed critical row is represented by
one of that row's selected slots. -/
theorem exists_source_slot
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) :
    ∃ slot : CriticalSlot,
      R.sourcePoint source = (R.rowAt source).slotPoint slot :=
  (R.rowAt source).exists_source_slot

/-- A source-indexed critical row is inconsistent with four exclusions of its
own source label from the row's selected slots. -/
theorem sourceRow_absurd_of_slots_ne_source
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource)
    (h0 : R.sourcePoint source ≠ (R.rowAt source).slotPoint 0)
    (h1 : R.sourcePoint source ≠ (R.rowAt source).slotPoint 1)
    (h2 : R.sourcePoint source ≠ (R.rowAt source).slotPoint 2)
    (h3 : R.sourcePoint source ≠ (R.rowAt source).slotPoint 3) :
    False := by
  rcases R.exists_source_slot source with ⟨slot, hslot⟩
  fin_cases slot
  · exact h0 hslot
  · exact h1 hslot
  · exact h2 hslot
  · exact h3 hslot

/-- A source row cannot place all four selected slots at labels distinct from
that source.

This records the `record001` branch-0 obstruction for the current
`CriticalSourceRows` semantics: the `q` row is a critical row whose selected
four contains the source label `q` itself. Therefore the branch-0 placement
shape `q-row = [f1,p,t1,t2]` is inconsistent with the live base-six
distinctness. -/
theorem record001Branch0_qPlacements_absurd
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hfix_f1_q_0 :
      selectedU = (R.rowAt CriticalSource.q).slotPoint 0)
    (hfix_p_q_1 :
      baseP = (R.rowAt CriticalSource.q).slotPoint 1)
    (hfix_t1_q_2 :
      baseT1 = (R.rowAt CriticalSource.q).slotPoint 2)
    (hfix_t2_q_3 :
      baseT2 = (R.rowAt CriticalSource.q).slotPoint 3) :
    False := by
  have hbase' := hbase
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase'
  rcases hbase' with
    ⟨⟨hP_Q, _, _, _, _⟩, ⟨hQ_T1, hQ_T2, _, hQ_U⟩, _, _, _⟩
  exact
    R.sourceRow_absurd_of_slots_ne_source CriticalSource.q
      (by
        intro hslot
        have h : baseQ = selectedU := hslot.trans hfix_f1_q_0.symm
        exact hQ_U h)
      (by
        intro hslot
        have h : baseP = baseQ := hfix_p_q_1.trans hslot.symm
        exact hP_Q h)
      (by
        intro hslot
        have h : baseT1 = baseQ := hfix_t1_q_2.trans hslot.symm
        exact hQ_T1 h.symm)
      (by
        intro hslot
        have h : baseT2 = baseQ := hfix_t2_q_3.trans hslot.symm
        exact hQ_T2 h.symm)

/-- The direct source-row placement surface behind the minimal record001 q/t1
two-centered payload is incompatible with blocker-centered `CriticalSourceRows`.

In particular, identifying the live `q` source row with branch-0 placements
`[f1,p,t1,t2]` already excludes the source label `q` from all four slots. -/
theorem record001QTTwoCenteredSourcePlacements_absurd
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hfix_f1_q_0 :
      selectedU = (R.rowAt CriticalSource.q).slotPoint 0)
    (hfix_p_q_1 :
      baseP = (R.rowAt CriticalSource.q).slotPoint 1)
    (hfix_t1_q_2 :
      baseT1 = (R.rowAt CriticalSource.q).slotPoint 2)
    (hfix_t2_q_3 :
      baseT2 = (R.rowAt CriticalSource.q).slotPoint 3)
    (_hfix_f1_t1_0 :
      selectedU = (R.rowAt CriticalSource.t1).slotPoint 0)
    (_hfix_p_t1_1 :
      baseP = (R.rowAt CriticalSource.t1).slotPoint 1)
    (_hfix_q_t1_2 :
      baseQ = (R.rowAt CriticalSource.t1).slotPoint 2)
    (_hfix_t3_t1_3 :
      baseT3 = (R.rowAt CriticalSource.t1).slotPoint 3) :
    False := by
  exact
    R.record001Branch0_qPlacements_absurd hbase
      hfix_f1_q_0 hfix_p_q_1 hfix_t1_q_2 hfix_t2_q_3

/-- A source row cannot place all four selected slots at labels distinct from
that source.

This records the `record001` branch-0 obstruction for the current
`CriticalSourceRows` semantics: the `t1` row is a critical row whose selected
four contains the source label `t1` itself.  Therefore the branch-0 placement
shape `t1-row = [f1,p,q,t3]` is inconsistent with the live base-six
distinctness. -/
theorem record001Branch0_t1Placements_absurd
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hfix_f1_t1_0 :
      selectedU = (R.rowAt CriticalSource.t1).slotPoint 0)
    (hfix_p_t1_1 :
      baseP = (R.rowAt CriticalSource.t1).slotPoint 1)
    (hfix_q_t1_2 :
      baseQ = (R.rowAt CriticalSource.t1).slotPoint 2)
    (hfix_t3_t1_3 :
      baseT3 = (R.rowAt CriticalSource.t1).slotPoint 3) :
    False := by
  have hbase' := hbase
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase'
  rcases hbase' with
    ⟨⟨_, hP_T1, _, _, _⟩, ⟨hQ_T1, _, _, _⟩,
      ⟨_, hT1_T3, hT1_U⟩, _, _⟩
  exact
    R.sourceRow_absurd_of_slots_ne_source CriticalSource.t1
      (by
        intro hslot
        have h : baseT1 = selectedU := hslot.trans hfix_f1_t1_0.symm
        exact hT1_U h)
      (by
        intro hslot
        have h : baseP = baseT1 := hfix_p_t1_1.trans hslot.symm
        exact hP_T1 h)
      (by
        intro hslot
        have h : baseQ = baseT1 := hfix_q_t1_2.trans hslot.symm
        exact hQ_T1 h)
      (by
        intro hslot
        have h : baseT1 = baseT3 := hslot.trans hfix_t3_t1_3.symm
        exact hT1_T3 h)

/-- The record-1 / branch-0 `f1` row tail is incompatible with the current
source-indexed critical-row semantics once the selected candidate is excluded
from the three non-`p` tail slots.

The `f1` critical row must contain its source label `selectedU`.  In branch 0,
the produced-label tail uses `t2[0]`, `f1[1]`, `f1[2]`, and `t2[1]`; the
same-label occurrence identifies `t2[0]` with `f1[0]`, and the branch placement
identifies `p` with `f1[3]`.  The contradiction only needs `selectedU`
distinct from `t2[0]`, `f1[1]`, and `f1[2]`; base-six distinctness gives
`selectedU ≠ p` for slot 3. -/
theorem record001Branch0_f1Tail_absurd_of_selectedU_ne
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hU_t20 :
      selectedU ≠ (R.rowAt CriticalSource.t2).slotPoint 0)
    (hU_f11 :
      selectedU ≠ (R.rowAt CriticalSource.f1).slotPoint 1)
    (hU_f12 :
      selectedU ≠ (R.rowAt CriticalSource.f1).slotPoint 2)
    (hocc_f2_f1_0 :
      R.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (R.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (R.rowAt CriticalSource.f1).slotPoint 3) :
    False := by
  have hbase' := hbase
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase'
  rcases hbase' with ⟨⟨_, _, _, _, hP_U⟩, _, _, _, _⟩
  exact
    R.sourceRow_absurd_of_slots_ne_source CriticalSource.f1
      (by
        intro hslot
        have ht20_f10 :
            (R.rowAt CriticalSource.t2).slotPoint 0 =
              (R.rowAt CriticalSource.f1).slotPoint 0 := by
          simpa using hocc_f2_f1_0
        exact hU_t20 (hslot.trans ht20_f10.symm))
      (by
        intro hslot
        exact hU_f11 hslot)
      (by
        intro hslot
        exact hU_f12 hslot)
      (by
        intro hslot
        have h : baseP = selectedU := hfix_p_f1_3.trans hslot.symm
        exact hP_U h)

/-- The record-1 / branch-0 no-collision `f1` row tail is incompatible with
the current source-indexed critical-row semantics.

This is the cross-distinctness-facing corollary retained for existing callers;
the minimal source-row contradiction is
`record001Branch0_f1Tail_absurd_of_selectedU_ne`. -/
theorem record001Branch0_f1Tail_absurd
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (R : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(R.rowAt CriticalSource.t2).slotPoint 0,
          (R.rowAt CriticalSource.f1).slotPoint 1,
          (R.rowAt CriticalSource.f1).slotPoint 2,
          (R.rowAt CriticalSource.t2).slotPoint 1], a ≠ b)
    (hocc_f2_f1_0 :
      R.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (R.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (R.rowAt CriticalSource.f1).slotPoint 3) :
    False := by
  exact
    R.record001Branch0_f1Tail_absurd_of_selectedU_ne hbase
      (hcrossNoP selectedU (by simp)
        ((R.rowAt CriticalSource.t2).slotPoint 0) (by simp))
      (hcrossNoP selectedU (by simp)
        ((R.rowAt CriticalSource.f1).slotPoint 1) (by simp))
      (hcrossNoP selectedU (by simp)
        ((R.rowAt CriticalSource.f1).slotPoint 2) (by simp))
      hocc_f2_f1_0 hfix_p_f1_3

end CriticalSourceRows

/-- A manifest label packet whose four produced labels are supplied by row-slot
choices from the five source-indexed critical rows.

This is the theorem-facing provenance layer between `CriticalSourceRows` and the
generic `ManifestLabelPacket`: carrier membership for `f2..f5` is derived from
row exactness data instead of repeated as bare point hypotheses. -/
structure RowSlotLabelPacket (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU
  baseP_mem : baseP ∈ D.A
  f2Choice : CriticalSlotChoice
  f3Choice : CriticalSlotChoice
  f4Choice : CriticalSlotChoice
  f5Choice : CriticalSlotChoice
  labels_pairwise :
    List.Pairwise (fun x y : Plane => x ≠ y)
      [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
        rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
        rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice]

namespace RowSlotLabelPacket

/-- Build a row-slot manifest packet from split distinctness data.

The live U1.2 branch already proves pairwise distinctness for the base labels
`p,q,t1,t2,t3,f1`.  Generated row-slot branches should supply distinctness for
the four produced labels and their cross-distinctness from that base prefix;
this constructor assembles those facts into the packet field consumed by the
product-collapse endpoints. -/
def ofBaseTailCross {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP_mem : baseP ∈ D.A)
    (f2Choice f3Choice f4Choice f5Choice : CriticalSlotChoice)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (htail :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice])
    (hcross :
      ∀ a ∈ [baseP, baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice], a ≠ b) :
    RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU where
  rows := rows
  baseP_mem := baseP_mem
  f2Choice := f2Choice
  f3Choice := f3Choice
  f4Choice := f4Choice
  f5Choice := f5Choice
  labels_pairwise := ten_pairwise_of_base_tail_cross hbase htail hcross

/-- Record-1 / branch-0 packet constructor after same-row tail distinctness.

For the manifest choices `f2=t2[0]`, `f3=f1[1]`, `f4=f1[2]`, and
`f5=t2[1]`, the inequalities `t2[0] ≠ t2[1]` and `f1[1] ≠ f1[2]`
come from the selected four-point rows themselves.  The generated producer
therefore only has to supply base-tail cross-distinctness and the four
cross-row tail inequalities. -/
def record001Branch0OfCrossRowNe {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcross :
      ∀ a ∈ [baseP, baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt CriticalSource.t2).slotPoint 0,
          (rows.rowAt CriticalSource.f1).slotPoint 1,
          (rows.rowAt CriticalSource.f1).slotPoint 2,
          (rows.rowAt CriticalSource.t2).slotPoint 1], a ≠ b)
    (ht20_f11 :
      (rows.rowAt CriticalSource.t2).slotPoint 0 ≠
        (rows.rowAt CriticalSource.f1).slotPoint 1)
    (ht20_f12 :
      (rows.rowAt CriticalSource.t2).slotPoint 0 ≠
        (rows.rowAt CriticalSource.f1).slotPoint 2)
    (hf11_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt CriticalSource.t2).slotPoint 1) :
    RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  let f2Choice : CriticalSlotChoice :=
    { source := CriticalSource.t2, slot := 0 }
  let f3Choice : CriticalSlotChoice :=
    { source := CriticalSource.f1, slot := 1 }
  let f4Choice : CriticalSlotChoice :=
    { source := CriticalSource.f1, slot := 2 }
  let f5Choice : CriticalSlotChoice :=
    { source := CriticalSource.t2, slot := 1 }
  refine
    ofBaseTailCross rows baseP_mem f2Choice f3Choice f4Choice f5Choice
      hbase ?_ ?_
  · change List.Pairwise (fun x y : Plane => x ≠ y)
      [(rows.rowAt CriticalSource.t2).slotPoint 0,
        (rows.rowAt CriticalSource.f1).slotPoint 1,
        (rows.rowAt CriticalSource.f1).slotPoint 2,
        (rows.rowAt CriticalSource.t2).slotPoint 1]
    simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
      forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
      List.Pairwise.nil, and_true]
    exact
      ⟨⟨ht20_f11, ht20_f12,
          by
            simpa using
              (rows.rowAt CriticalSource.t2).selected.l1_ne_l2⟩,
        ⟨by
            simpa using
              (rows.rowAt CriticalSource.f1).selected.l2_ne_l3,
          hf11_t21⟩,
        hf12_t21⟩
  · simpa [f2Choice, f3Choice, f4Choice, f5Choice] using hcross

/-- Record-1 / branch-0 packet constructor using the `f2=f1[0]` occurrence.

The same-label occurrence identifies `t2[0]` with `f1[0]`, so the tail
inequalities against `f1[1]` and `f1[2]` follow from the `f1` row itself.  The
only remaining tail cross-row inequalities are the two involving `t2[1]`. -/
def record001Branch0OfF2Occurrence {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcross :
      ∀ a ∈ [baseP, baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt CriticalSource.t2).slotPoint 0,
          (rows.rowAt CriticalSource.f1).slotPoint 1,
          (rows.rowAt CriticalSource.f1).slotPoint 2,
          (rows.rowAt CriticalSource.t2).slotPoint 1], a ≠ b)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (rows.rowAt CriticalSource.f1).slotPoint 0)
    (hf11_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt CriticalSource.t2).slotPoint 1) :
    RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
  record001Branch0OfCrossRowNe rows baseP_mem hbase hcross
    (by
      rw [show (rows.rowAt CriticalSource.t2).slotPoint 0 =
          (rows.rowAt CriticalSource.f1).slotPoint 0 by
        simpa using hocc_f2_f1_0]
      exact (rows.rowAt CriticalSource.f1).selected.l1_ne_l2)
    (by
      rw [show (rows.rowAt CriticalSource.t2).slotPoint 0 =
          (rows.rowAt CriticalSource.f1).slotPoint 0 by
        simpa using hocc_f2_f1_0]
      exact (rows.rowAt CriticalSource.f1).selected.l1_ne_l3)
    hf11_t21 hf12_t21

/-- Record-1 / branch-0 packet constructor using the `p=f1[3]` placement.

After the `f2=f1[0]` occurrence, placing `p` in slot `f1[3]` proves
`p ≠ f2`, `p ≠ f3`, and `p ≠ f4` from the same selected `f1` row.  The only
base-tail cross fact involving `p` that remains as input is `p ≠ t2[1]`. -/
def record001Branch0OfF2OccurrencePPlacement {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt CriticalSource.t2).slotPoint 0,
          (rows.rowAt CriticalSource.f1).slotPoint 1,
          (rows.rowAt CriticalSource.f1).slotPoint 2,
          (rows.rowAt CriticalSource.t2).slotPoint 1], a ≠ b)
    (hp_f5 :
      baseP ≠ (rows.rowAt CriticalSource.t2).slotPoint 1)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (rows.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3)
    (hf11_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt CriticalSource.t2).slotPoint 1) :
    RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
  record001Branch0OfF2Occurrence rows baseP_mem hbase
    (by
      intro x hx b hb
      by_cases hxp : x = baseP
      · subst x
        simp only [List.mem_cons, List.not_mem_nil, or_false] at hb
        rcases hb with rfl | rfl | rfl | rfl
        · rw [hfix_p_f1_3]
          have hslot0 :
              (rows.rowAt CriticalSource.t2).slotPoint 0 =
                (rows.rowAt CriticalSource.f1).slotPoint 0 := by
            simpa using hocc_f2_f1_0
          rw [hslot0]
          simpa using (rows.rowAt CriticalSource.f1).selected.l1_ne_l4.symm
        · rw [hfix_p_f1_3]
          simpa using (rows.rowAt CriticalSource.f1).selected.l2_ne_l4.symm
        · rw [hfix_p_f1_3]
          simpa using (rows.rowAt CriticalSource.f1).selected.l3_ne_l4.symm
        · exact hp_f5
      · exact hcrossNoP x (by simpa [List.mem_cons, hxp] using hx) b hb)
    hocc_f2_f1_0 hf11_t21 hf12_t21

/-- A named remaining collision in the record-1 / branch-0 packet surface.

The same-row and occurrence/placement consequences are already discharged by
`record001Branch0OfF2OccurrencePPlacement`; these constructors are exactly the
remaining point equalities that prevent construction of a pairwise-distinct
record001 packet. -/
inductive Record001Branch0Collision {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP : Plane) : Prop where
  | q_t20 :
      baseQ = (rows.rowAt CriticalSource.t2).slotPoint 0 →
        Record001Branch0Collision rows baseP
  | q_f11 :
      baseQ = (rows.rowAt CriticalSource.f1).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | q_f12 :
      baseQ = (rows.rowAt CriticalSource.f1).slotPoint 2 →
        Record001Branch0Collision rows baseP
  | q_t21 :
      baseQ = (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | t1_t20 :
      baseT1 = (rows.rowAt CriticalSource.t2).slotPoint 0 →
        Record001Branch0Collision rows baseP
  | t1_f11 :
      baseT1 = (rows.rowAt CriticalSource.f1).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | t1_f12 :
      baseT1 = (rows.rowAt CriticalSource.f1).slotPoint 2 →
        Record001Branch0Collision rows baseP
  | t1_t21 :
      baseT1 = (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | t2_t20 :
      baseT2 = (rows.rowAt CriticalSource.t2).slotPoint 0 →
        Record001Branch0Collision rows baseP
  | t2_f11 :
      baseT2 = (rows.rowAt CriticalSource.f1).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | t2_f12 :
      baseT2 = (rows.rowAt CriticalSource.f1).slotPoint 2 →
        Record001Branch0Collision rows baseP
  | t2_t21 :
      baseT2 = (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | t3_t20 :
      baseT3 = (rows.rowAt CriticalSource.t2).slotPoint 0 →
        Record001Branch0Collision rows baseP
  | t3_f11 :
      baseT3 = (rows.rowAt CriticalSource.f1).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | t3_f12 :
      baseT3 = (rows.rowAt CriticalSource.f1).slotPoint 2 →
        Record001Branch0Collision rows baseP
  | t3_t21 :
      baseT3 = (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | u_t20 :
      selectedU = (rows.rowAt CriticalSource.t2).slotPoint 0 →
        Record001Branch0Collision rows baseP
  | u_f11 :
      selectedU = (rows.rowAt CriticalSource.f1).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | u_f12 :
      selectedU = (rows.rowAt CriticalSource.f1).slotPoint 2 →
        Record001Branch0Collision rows baseP
  | u_t21 :
      selectedU = (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | p_t21 :
      baseP = (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | f11_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 1 =
        (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP
  | f12_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 2 =
        (rows.rowAt CriticalSource.t2).slotPoint 1 →
        Record001Branch0Collision rows baseP

/-- The record-1 / branch-0 occurrence and `p=f1[3]` placement force the
`f1` source label into one of the three non-`p` tail slots.

The `f1` source row must contain its own source label `selectedU`.  Branch 0
identifies the first `f1` slot with `t2[0]`, and the placement `p=f1[3]`
rules out the fourth slot as soon as `p ≠ selectedU`. -/
theorem record001Branch0_f1Tail_source_cases {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hP_U : baseP ≠ selectedU)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (rows.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3) :
    selectedU = (rows.rowAt CriticalSource.t2).slotPoint 0 ∨
      selectedU = (rows.rowAt CriticalSource.f1).slotPoint 1 ∨
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 2 := by
  rcases rows.exists_source_slot CriticalSource.f1 with ⟨slot, hslot⟩
  fin_cases slot
  · have hslot0 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 0 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    have ht20_f10 :
        (rows.rowAt CriticalSource.t2).slotPoint 0 =
          (rows.rowAt CriticalSource.f1).slotPoint 0 := by
      simpa using hocc_f2_f1_0
    exact Or.inl (hslot0.trans ht20_f10.symm)
  · have hslot1 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 1 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    exact Or.inr (Or.inl hslot1)
  · have hslot2 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 2 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    exact Or.inr (Or.inr hslot2)
  · have hslot3 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 3 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    have h : baseP = selectedU :=
      hfix_p_f1_3.trans hslot3.symm
    exact False.elim (hP_U h)

/-- The record-1 / branch-0 occurrence and `p=f1[3]` placement force a named
source-label collision in the current critical-row surface.

The `f1` source row must contain its own source label `selectedU`.  Since
branch 0 identifies the first `f1` slot with `t2[0]` and the fourth `f1` slot
with `p`, the single inequality `p ≠ selectedU` rules out the fourth slot and
the source label must collide with one of the produced tail slots. -/
theorem record001Branch0Collision_of_f1Tail_source {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hP_U : baseP ≠ selectedU)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (rows.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3) :
    Record001Branch0Collision rows baseP := by
  rcases record001Branch0_f1Tail_source_cases rows
      hP_U hocc_f2_f1_0 hfix_p_f1_3 with hU_t20 | hU_f11 | hU_f12
  · exact .u_t20 hU_t20
  · exact .u_f11 hU_f11
  · exact .u_f12 hU_f12

/-- The all-distinct side of the record-1 / branch-0 collision split. -/
structure Record001Branch0NoCollision {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP : Plane) : Prop where
  q_t20 :
    baseQ ≠ (rows.rowAt CriticalSource.t2).slotPoint 0
  q_f11 :
    baseQ ≠ (rows.rowAt CriticalSource.f1).slotPoint 1
  q_f12 :
    baseQ ≠ (rows.rowAt CriticalSource.f1).slotPoint 2
  q_t21 :
    baseQ ≠ (rows.rowAt CriticalSource.t2).slotPoint 1
  t1_t20 :
    baseT1 ≠ (rows.rowAt CriticalSource.t2).slotPoint 0
  t1_f11 :
    baseT1 ≠ (rows.rowAt CriticalSource.f1).slotPoint 1
  t1_f12 :
    baseT1 ≠ (rows.rowAt CriticalSource.f1).slotPoint 2
  t1_t21 :
    baseT1 ≠ (rows.rowAt CriticalSource.t2).slotPoint 1
  t2_t20 :
    baseT2 ≠ (rows.rowAt CriticalSource.t2).slotPoint 0
  t2_f11 :
    baseT2 ≠ (rows.rowAt CriticalSource.f1).slotPoint 1
  t2_f12 :
    baseT2 ≠ (rows.rowAt CriticalSource.f1).slotPoint 2
  t2_t21 :
    baseT2 ≠ (rows.rowAt CriticalSource.t2).slotPoint 1
  t3_t20 :
    baseT3 ≠ (rows.rowAt CriticalSource.t2).slotPoint 0
  t3_f11 :
    baseT3 ≠ (rows.rowAt CriticalSource.f1).slotPoint 1
  t3_f12 :
    baseT3 ≠ (rows.rowAt CriticalSource.f1).slotPoint 2
  t3_t21 :
    baseT3 ≠ (rows.rowAt CriticalSource.t2).slotPoint 1
  u_t20 :
    selectedU ≠ (rows.rowAt CriticalSource.t2).slotPoint 0
  u_f11 :
    selectedU ≠ (rows.rowAt CriticalSource.f1).slotPoint 1
  u_f12 :
    selectedU ≠ (rows.rowAt CriticalSource.f1).slotPoint 2
  u_t21 :
    selectedU ≠ (rows.rowAt CriticalSource.t2).slotPoint 1
  p_t21 :
    baseP ≠ (rows.rowAt CriticalSource.t2).slotPoint 1
  f11_t21 :
    (rows.rowAt CriticalSource.f1).slotPoint 1 ≠
      (rows.rowAt CriticalSource.t2).slotPoint 1
  f12_t21 :
    (rows.rowAt CriticalSource.f1).slotPoint 2 ≠
      (rows.rowAt CriticalSource.t2).slotPoint 1

namespace Record001Branch0NoCollision

/-- The no-collision side constructs the record-1 / branch-0 row-slot packet. -/
def toPacket {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (H : Record001Branch0NoCollision rows baseP)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (rows.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3) :
    RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
  record001Branch0OfF2OccurrencePPlacement rows baseP_mem hbase
    (by
      intro x hx y hy
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hx hy
      rcases hx with rfl | rfl | rfl | rfl | rfl
      · rcases hy with rfl | rfl | rfl | rfl
        · exact H.q_t20
        · exact H.q_f11
        · exact H.q_f12
        · exact H.q_t21
      · rcases hy with rfl | rfl | rfl | rfl
        · exact H.t1_t20
        · exact H.t1_f11
        · exact H.t1_f12
        · exact H.t1_t21
      · rcases hy with rfl | rfl | rfl | rfl
        · exact H.t2_t20
        · exact H.t2_f11
        · exact H.t2_f12
        · exact H.t2_t21
      · rcases hy with rfl | rfl | rfl | rfl
        · exact H.t3_t20
        · exact H.t3_f11
        · exact H.t3_f12
        · exact H.t3_t21
      · rcases hy with rfl | rfl | rfl | rfl
        · exact H.u_t20
        · exact H.u_f11
        · exact H.u_f12
        · exact H.u_t21)
    H.p_t21 hocc_f2_f1_0 hfix_p_f1_3 H.f11_t21 H.f12_t21

/-- Without the `t2[0] = f1[0]` occurrence equality, the no-collision side and
the `p = f1[3]` placement do not contradict the `f1` source row.  They force
the only remaining source placement: `selectedU` must be the first `f1` slot.

This is the branch left when the occurrence equality is not available. -/
theorem selectedU_eq_f1Slot0_of_pPlacement {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (H : Record001Branch0NoCollision rows baseP)
    (hP_U : baseP ≠ selectedU)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3) :
    selectedU = (rows.rowAt CriticalSource.f1).slotPoint 0 := by
  rcases rows.exists_source_slot CriticalSource.f1 with ⟨slot, hslot⟩
  fin_cases slot
  · simpa [CriticalSourceRows.sourcePoint] using hslot
  · have hslot1 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 1 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    exact False.elim (H.u_f11 hslot1)
  · have hslot2 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 2 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    exact False.elim (H.u_f12 hslot2)
  · have hslot3 :
        selectedU = (rows.rowAt CriticalSource.f1).slotPoint 3 := by
      simpa [CriticalSourceRows.sourcePoint] using hslot
    have h : baseP = selectedU :=
      hfix_p_f1_3.trans hslot3.symm
    exact False.elim (hP_U h)

/-- A non-source first `f1` slot is the hocc-free replacement for the previous
`f1`-tail contradiction on the no-collision side. -/
theorem false_of_f1Slot0_ne {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (H : Record001Branch0NoCollision rows baseP)
    (hP_U : baseP ≠ selectedU)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3)
    (hU_f10 :
      selectedU ≠ (rows.rowAt CriticalSource.f1).slotPoint 0) :
    False :=
  hU_f10 (H.selectedU_eq_f1Slot0_of_pPlacement hP_U hfix_p_f1_3)

/-- The no-collision side is incompatible with the `f1`-tail source pattern.

Once branch 0 identifies `t2[0] = f1[0]` and `p = f1[3]`, the `f1` source row
must place `selectedU` in one of `t2[0]`, `f1[1]`, or `f1[2]`; those are three
of the named collisions ruled out by `Record001Branch0NoCollision`. -/
theorem false_of_f1Tail_source {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (H : Record001Branch0NoCollision rows baseP)
    (hP_U : baseP ≠ selectedU)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } =
        (rows.rowAt CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3) :
    False := by
  have hU_f10 : selectedU = (rows.rowAt CriticalSource.f1).slotPoint 0 :=
    H.selectedU_eq_f1Slot0_of_pPlacement hP_U hfix_p_f1_3
  have ht20_f10 :
      (rows.rowAt CriticalSource.t2).slotPoint 0 =
        (rows.rowAt CriticalSource.f1).slotPoint 0 := by
    simpa using hocc_f2_f1_0
  exact H.u_t20 (hU_f10.trans ht20_f10.symm)

end Record001Branch0NoCollision

/-- Finite split for the remaining record-1 / branch-0 packet collisions. -/
theorem record001Branch0_split {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP : Plane) :
    Record001Branch0NoCollision rows baseP ∨
      Record001Branch0Collision rows baseP := by
  classical
  by_cases hq_t20 : baseQ = (rows.rowAt CriticalSource.t2).slotPoint 0
  · exact Or.inr (.q_t20 hq_t20)
  by_cases hq_f11 : baseQ = (rows.rowAt CriticalSource.f1).slotPoint 1
  · exact Or.inr (.q_f11 hq_f11)
  by_cases hq_f12 : baseQ = (rows.rowAt CriticalSource.f1).slotPoint 2
  · exact Or.inr (.q_f12 hq_f12)
  by_cases hq_t21 : baseQ = (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.q_t21 hq_t21)
  by_cases ht1_t20 : baseT1 = (rows.rowAt CriticalSource.t2).slotPoint 0
  · exact Or.inr (.t1_t20 ht1_t20)
  by_cases ht1_f11 : baseT1 = (rows.rowAt CriticalSource.f1).slotPoint 1
  · exact Or.inr (.t1_f11 ht1_f11)
  by_cases ht1_f12 : baseT1 = (rows.rowAt CriticalSource.f1).slotPoint 2
  · exact Or.inr (.t1_f12 ht1_f12)
  by_cases ht1_t21 : baseT1 = (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.t1_t21 ht1_t21)
  by_cases ht2_t20 : baseT2 = (rows.rowAt CriticalSource.t2).slotPoint 0
  · exact Or.inr (.t2_t20 ht2_t20)
  by_cases ht2_f11 : baseT2 = (rows.rowAt CriticalSource.f1).slotPoint 1
  · exact Or.inr (.t2_f11 ht2_f11)
  by_cases ht2_f12 : baseT2 = (rows.rowAt CriticalSource.f1).slotPoint 2
  · exact Or.inr (.t2_f12 ht2_f12)
  by_cases ht2_t21 : baseT2 = (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.t2_t21 ht2_t21)
  by_cases ht3_t20 : baseT3 = (rows.rowAt CriticalSource.t2).slotPoint 0
  · exact Or.inr (.t3_t20 ht3_t20)
  by_cases ht3_f11 : baseT3 = (rows.rowAt CriticalSource.f1).slotPoint 1
  · exact Or.inr (.t3_f11 ht3_f11)
  by_cases ht3_f12 : baseT3 = (rows.rowAt CriticalSource.f1).slotPoint 2
  · exact Or.inr (.t3_f12 ht3_f12)
  by_cases ht3_t21 : baseT3 = (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.t3_t21 ht3_t21)
  by_cases hu_t20 : selectedU = (rows.rowAt CriticalSource.t2).slotPoint 0
  · exact Or.inr (.u_t20 hu_t20)
  by_cases hu_f11 : selectedU = (rows.rowAt CriticalSource.f1).slotPoint 1
  · exact Or.inr (.u_f11 hu_f11)
  by_cases hu_f12 : selectedU = (rows.rowAt CriticalSource.f1).slotPoint 2
  · exact Or.inr (.u_f12 hu_f12)
  by_cases hu_t21 : selectedU = (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.u_t21 hu_t21)
  by_cases hp_t21 : baseP = (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.p_t21 hp_t21)
  by_cases hf11_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 1 =
        (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.f11_t21 hf11_t21)
  by_cases hf12_t21 :
      (rows.rowAt CriticalSource.f1).slotPoint 2 =
        (rows.rowAt CriticalSource.t2).slotPoint 1
  · exact Or.inr (.f12_t21 hf12_t21)
  exact Or.inl
    { q_t20 := hq_t20
      q_f11 := hq_f11
      q_f12 := hq_f12
      q_t21 := hq_t21
      t1_t20 := ht1_t20
      t1_f11 := ht1_f11
      t1_f12 := ht1_f12
      t1_t21 := ht1_t21
      t2_t20 := ht2_t20
      t2_f11 := ht2_f11
      t2_f12 := ht2_f12
      t2_t21 := ht2_t21
      t3_t20 := ht3_t20
      t3_f11 := ht3_f11
      t3_f12 := ht3_f12
      t3_t21 := ht3_t21
      u_t20 := hu_t20
      u_f11 := hu_f11
      u_f12 := hu_f12
      u_t21 := hu_t21
      p_t21 := hp_t21
      f11_t21 := hf11_t21
      f12_t21 := hf12_t21 }

/-- With the fourth `f1` slot occupied by `baseP`, the record-1 / branch-0
split reduces to either an existing named collision or the remaining
source-at-first-`f1`-slot case. -/
theorem record001Branch0_collision_or_selectedU_eq_f1Slot0_of_pPlacement
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (rows : CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    {baseP : Plane}
    (hP_U : baseP ≠ selectedU)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt CriticalSource.f1).slotPoint 3) :
    Record001Branch0Collision rows baseP ∨
      selectedU = (rows.rowAt CriticalSource.f1).slotPoint 0 := by
  rcases record001Branch0_split rows baseP with hNoCollision | hCollision
  · exact Or.inr
      (hNoCollision.selectedU_eq_f1Slot0_of_pPlacement hP_U hfix_p_f1_3)
  · exact Or.inl hCollision

/-- The produced `f2` point selected by row-slot provenance. -/
def f2Point {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Plane :=
  P.rows.pointOfChoice P.f2Choice

/-- The produced `f3` point selected by row-slot provenance. -/
def f3Point {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Plane :=
  P.rows.pointOfChoice P.f3Choice

/-- The produced `f4` point selected by row-slot provenance. -/
def f4Point {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Plane :=
  P.rows.pointOfChoice P.f4Choice

/-- The produced `f5` point selected by row-slot provenance. -/
def f5Point {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Plane :=
  P.rows.pointOfChoice P.f5Choice

/-- Concrete point assignment for a row-slot manifest packet. -/
noncomputable def point {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Label → Plane :=
  pointOf baseP baseQ baseT1 baseT2 baseT3 selectedU
    P.f2Point P.f3Point P.f4Point P.f5Point

@[simp] theorem point_p {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point p = baseP := by
  simp [point, pointOf, p]

@[simp] theorem point_q {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point q = baseQ := by
  simp [point, pointOf, q]

@[simp] theorem point_t1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point t1 = baseT1 := by
  simp [point, pointOf, t1]

@[simp] theorem point_t2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point t2 = baseT2 := by
  simp [point, pointOf, t2]

@[simp] theorem point_t3 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point t3 = baseT3 := by
  simp [point, pointOf, t3]

@[simp] theorem point_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f1 = selectedU := by
  simp [point, pointOf, f1]

@[simp] theorem point_criticalSource {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) :
    P.point source.toLabel = P.rows.sourcePoint source := by
  cases source <;> simp [CriticalSource.toLabel, CriticalSourceRows.sourcePoint]

/-- In the current `RowSlotLabelPacket` surface, source rows are critical
blocker shells.  Their centers cannot be the corresponding packet labels. -/
theorem sourceCenter_ne {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) :
    (P.rows.rowAt source).center ≠ P.point source.toLabel := by
  rw [P.point_criticalSource source]
  exact P.rows.rowAt_center_ne_sourcePoint source

@[simp] theorem point_f2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f2 = P.rows.pointOfChoice P.f2Choice := by
  simp [point, pointOf, f2, f2Point]

@[simp] theorem point_f3 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f3 = P.rows.pointOfChoice P.f3Choice := by
  simp [point, pointOf, f3, f3Point]

@[simp] theorem point_f4 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f4 = P.rows.pointOfChoice P.f4Choice := by
  simp [point, pointOf, f4, f4Point]

@[simp] theorem point_f5 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f5 = P.rows.pointOfChoice P.f5Choice := by
  simp [point, pointOf, f5, f5Point]

/-- The selected row-slot occurrence for `f2` is definitionally the packet's
`f2` label. -/
theorem point_f2_eq_selectedSlot {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f2 =
      (P.rows.rowAt P.f2Choice.source).slotPoint P.f2Choice.slot := by
  simp

/-- The selected row-slot occurrence for `f3` is definitionally the packet's
`f3` label. -/
theorem point_f3_eq_selectedSlot {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f3 =
      (P.rows.rowAt P.f3Choice.source).slotPoint P.f3Choice.slot := by
  simp

/-- The selected row-slot occurrence for `f4` is definitionally the packet's
`f4` label. -/
theorem point_f4_eq_selectedSlot {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f4 =
      (P.rows.rowAt P.f4Choice.source).slotPoint P.f4Choice.slot := by
  simp

/-- The selected row-slot occurrence for `f5` is definitionally the packet's
`f5` label. -/
theorem point_f5_eq_selectedSlot {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    P.point f5 =
      (P.rows.rowAt P.f5Choice.source).slotPoint P.f5Choice.slot := by
  simp

/-- Transport a generated same-label occurrence fact to the packet's `f2`
point. -/
theorem point_f2_eq_slotPoint_of_occurrence {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {source : CriticalSource} {slot : CriticalSlot}
    (hocc :
      P.rows.pointOfChoice P.f2Choice =
        (P.rows.rowAt source).slotPoint slot) :
    P.point f2 = (P.rows.rowAt source).slotPoint slot := by
  simpa using hocc

/-- Transport a generated same-label occurrence fact to the packet's `f3`
point. -/
theorem point_f3_eq_slotPoint_of_occurrence {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {source : CriticalSource} {slot : CriticalSlot}
    (hocc :
      P.rows.pointOfChoice P.f3Choice =
        (P.rows.rowAt source).slotPoint slot) :
    P.point f3 = (P.rows.rowAt source).slotPoint slot := by
  simpa using hocc

/-- Transport a generated same-label occurrence fact to the packet's `f4`
point. -/
theorem point_f4_eq_slotPoint_of_occurrence {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {source : CriticalSource} {slot : CriticalSlot}
    (hocc :
      P.rows.pointOfChoice P.f4Choice =
        (P.rows.rowAt source).slotPoint slot) :
    P.point f4 = (P.rows.rowAt source).slotPoint slot := by
  simpa using hocc

/-- Transport a generated same-label occurrence fact to the packet's `f5`
point. -/
theorem point_f5_eq_slotPoint_of_occurrence {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {source : CriticalSource} {slot : CriticalSlot}
    (hocc :
      P.rows.pointOfChoice P.f5Choice =
        (P.rows.rowAt source).slotPoint slot) :
    P.point f5 = (P.rows.rowAt source).slotPoint slot := by
  simpa using hocc

/-- Transport a packet-label source-row slot metric incidence to the hrow shape
used by generated source-UNIT leaves.

This does not prove the metric incidence itself.  It only rewrites the two
endpoints from packet labels to the recorded source-row slots. -/
theorem hrow_of_slot_metric {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (source : CriticalSource) {member witness : Label}
    {memberSlot witnessSlot : CriticalSlot}
    (hmember :
      P.point member = (P.rows.rowAt source).slotPoint memberSlot)
    (hwitness :
      P.point witness = (P.rows.rowAt source).slotPoint witnessSlot)
    (hslot :
      dist (P.point source.toLabel)
          ((P.rows.rowAt source).slotPoint memberSlot) =
        dist (P.point source.toLabel)
          ((P.rows.rowAt source).slotPoint witnessSlot)) :
    dist (P.point source.toLabel) (P.point member) =
      dist (P.point source.toLabel) (P.point witness) := by
  rw [hmember, hwitness]
  exact hslot

/-- Package the five record001 q/t1-facing transport hrows from row-slot
packet source-slot placements plus the corresponding q/t1 slot metric facts.

This is the theorem-facing adapter for the live reduced producer boundary:
it exposes only `Record001QTFacingTransportRows`, not the stronger raw slot
metric surface. -/
theorem record001QTFacingTransportRows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hpt_t1_q_2 :
      P.point U1Depth5.t1 =
        (P.rows.rowAt CriticalSource.q).slotPoint 2)
    (hpt_f1_q_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.q).slotPoint 0)
    (hpt_t2_q_3 :
      P.point U1Depth5.t2 =
        (P.rows.rowAt CriticalSource.q).slotPoint 3)
    (hpt_p_t1_1 :
      P.point U1Depth5.p =
        (P.rows.rowAt CriticalSource.t1).slotPoint 1)
    (hpt_f1_t1_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.t1).slotPoint 0)
    (hpt_q_t1_2 :
      P.point U1Depth5.q =
        (P.rows.rowAt CriticalSource.t1).slotPoint 2)
    (hpt_t3_t1_3 :
      P.point U1Depth5.t3 =
        (P.rows.rowAt CriticalSource.t1).slotPoint 3)
    (hslot_q_t1_f1 :
      dist (P.point U1Depth5.q)
          ((P.rows.rowAt CriticalSource.q).slotPoint 2) =
        dist (P.point U1Depth5.q)
          ((P.rows.rowAt CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (P.point U1Depth5.q)
          ((P.rows.rowAt CriticalSource.q).slotPoint 3) =
        dist (P.point U1Depth5.q)
          ((P.rows.rowAt CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (P.point U1Depth5.t1)
          ((P.rows.rowAt CriticalSource.t1).slotPoint 1) =
        dist (P.point U1Depth5.t1)
          ((P.rows.rowAt CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (P.point U1Depth5.t1)
          ((P.rows.rowAt CriticalSource.t1).slotPoint 2) =
        dist (P.point U1Depth5.t1)
          ((P.rows.rowAt CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (P.point U1Depth5.t1)
          ((P.rows.rowAt CriticalSource.t1).slotPoint 3) =
        dist (P.point U1Depth5.t1)
          ((P.rows.rowAt CriticalSource.t1).slotPoint 0)) :
    Record001QTFacingTransportRows
      (P.point U1Depth5.p) (P.point U1Depth5.q) (P.point U1Depth5.t1)
      (P.point U1Depth5.t2) (P.point U1Depth5.t3) (P.point U1Depth5.f1) := by
  exact
    { hrow_q_t1_f1 := P.hrow_of_slot_metric CriticalSource.q
        hpt_t1_q_2 hpt_f1_q_0 hslot_q_t1_f1
      hrow_q_t2_f1 := P.hrow_of_slot_metric CriticalSource.q
        hpt_t2_q_3 hpt_f1_q_0 hslot_q_t2_f1
      hrow_t1_p_f1 := P.hrow_of_slot_metric CriticalSource.t1
        hpt_p_t1_1 hpt_f1_t1_0 hslot_t1_p_f1
      hrow_t1_q_f1 := P.hrow_of_slot_metric CriticalSource.t1
        hpt_q_t1_2 hpt_f1_t1_0 hslot_t1_q_f1
      hrow_t1_t3_f1 := P.hrow_of_slot_metric CriticalSource.t1
        hpt_t3_t1_3 hpt_f1_t1_0 hslot_t1_t3_f1 }

/-- The eight packet-label source-row slot metric incidences common to the
current all-eight q:t3 source-UNIT branch family.

These fields are hypotheses for the metric producer.  They deliberately use the
packet-label source as center; they do not follow from selected critical-shell
membership alone. -/
structure AllEightSlotMetricCore {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Prop where
  hslot_f1_f3_f2 :
    dist (P.point U1Depth5.f1)
        ((P.rows.rowAt CriticalSource.f1).slotPoint 1) =
      dist (P.point U1Depth5.f1)
        ((P.rows.rowAt CriticalSource.f1).slotPoint 0)
  hslot_f1_f4_f2 :
    dist (P.point U1Depth5.f1)
        ((P.rows.rowAt CriticalSource.f1).slotPoint 2) =
      dist (P.point U1Depth5.f1)
        ((P.rows.rowAt CriticalSource.f1).slotPoint 0)
  hslot_f1_p_f2 :
    dist (P.point U1Depth5.f1)
        ((P.rows.rowAt CriticalSource.f1).slotPoint 3) =
      dist (P.point U1Depth5.f1)
        ((P.rows.rowAt CriticalSource.f1).slotPoint 0)
  hslot_q_t1_f1 :
    dist (P.point U1Depth5.q)
        ((P.rows.rowAt CriticalSource.q).slotPoint 2) =
      dist (P.point U1Depth5.q)
        ((P.rows.rowAt CriticalSource.q).slotPoint 0)
  hslot_q_t2_f1 :
    dist (P.point U1Depth5.q)
        ((P.rows.rowAt CriticalSource.q).slotPoint 3) =
      dist (P.point U1Depth5.q)
        ((P.rows.rowAt CriticalSource.q).slotPoint 0)
  hslot_t1_p_f1 :
    dist (P.point U1Depth5.t1)
        ((P.rows.rowAt CriticalSource.t1).slotPoint 1) =
      dist (P.point U1Depth5.t1)
        ((P.rows.rowAt CriticalSource.t1).slotPoint 0)
  hslot_t1_q_f1 :
    dist (P.point U1Depth5.t1)
        ((P.rows.rowAt CriticalSource.t1).slotPoint 2) =
      dist (P.point U1Depth5.t1)
        ((P.rows.rowAt CriticalSource.t1).slotPoint 0)
  hslot_t1_t3_f1 :
    dist (P.point U1Depth5.t1)
        ((P.rows.rowAt CriticalSource.t1).slotPoint 3) =
      dist (P.point U1Depth5.t1)
        ((P.rows.rowAt CriticalSource.t1).slotPoint 0)

/-- If the source rows are centered at their packet labels for the three
source labels used by the all-eight core, they supply the eight all-eight
slot metric facts.

The current `CriticalSourceRows` producer cannot provide these center
identifications: `RowSlotLabelPacket.sourceCenter_ne` proves that its
deletion-critical blocker rows have centers distinct from the corresponding
packet source labels.  This lemma is only a consumer for a different future
surface with packet-label-centered K4 rows; it is not a producer for the current
`RowSlotLabelPacket` surface. -/
theorem allEightSlotMetricCore_of_sourceCenterEq {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hf1 :
      (P.rows.rowAt CriticalSource.f1).center = P.point U1Depth5.f1)
    (hq :
      (P.rows.rowAt CriticalSource.q).center = P.point U1Depth5.q)
    (ht1 :
      (P.rows.rowAt CriticalSource.t1).center = P.point U1Depth5.t1) :
    AllEightSlotMetricCore P := by
  refine
    { hslot_f1_f3_f2 := ?_
      hslot_f1_f4_f2 := ?_
      hslot_f1_p_f2 := ?_
      hslot_q_t1_f1 := ?_
      hslot_q_t2_f1 := ?_
      hslot_t1_p_f1 := ?_
      hslot_t1_q_f1 := ?_
      hslot_t1_t3_f1 := ?_ }
  · rw [← hf1]
    exact
      ((P.rows.rowAt CriticalSource.f1).slotPoint_on_shell 1).trans
        ((P.rows.rowAt CriticalSource.f1).slotPoint_on_shell 0).symm
  · rw [← hf1]
    exact
      ((P.rows.rowAt CriticalSource.f1).slotPoint_on_shell 2).trans
        ((P.rows.rowAt CriticalSource.f1).slotPoint_on_shell 0).symm
  · rw [← hf1]
    exact
      ((P.rows.rowAt CriticalSource.f1).slotPoint_on_shell 3).trans
        ((P.rows.rowAt CriticalSource.f1).slotPoint_on_shell 0).symm
  · rw [← hq]
    exact
      ((P.rows.rowAt CriticalSource.q).slotPoint_on_shell 2).trans
        ((P.rows.rowAt CriticalSource.q).slotPoint_on_shell 0).symm
  · rw [← hq]
    exact
      ((P.rows.rowAt CriticalSource.q).slotPoint_on_shell 3).trans
        ((P.rows.rowAt CriticalSource.q).slotPoint_on_shell 0).symm
  · rw [← ht1]
    exact
      ((P.rows.rowAt CriticalSource.t1).slotPoint_on_shell 1).trans
        ((P.rows.rowAt CriticalSource.t1).slotPoint_on_shell 0).symm
  · rw [← ht1]
    exact
      ((P.rows.rowAt CriticalSource.t1).slotPoint_on_shell 2).trans
        ((P.rows.rowAt CriticalSource.t1).slotPoint_on_shell 0).symm
  · rw [← ht1]
    exact
      ((P.rows.rowAt CriticalSource.t1).slotPoint_on_shell 3).trans
        ((P.rows.rowAt CriticalSource.t1).slotPoint_on_shell 0).symm

namespace AllEightSlotMetricCore

/-- Transport the `f1:f3=f2` slot metric core fact to packet-label hrow form. -/
theorem hrow_f1_f3_f2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_f3_f1_1 :
      P.point U1Depth5.f3 =
        (P.rows.rowAt CriticalSource.f1).slotPoint 1)
    (hpt_f2_f1_0 :
      P.point U1Depth5.f2 =
        (P.rows.rowAt CriticalSource.f1).slotPoint 0) :
    dist (P.point U1Depth5.f1) (P.point U1Depth5.f3) =
      dist (P.point U1Depth5.f1) (P.point U1Depth5.f2) :=
  P.hrow_of_slot_metric CriticalSource.f1
    hpt_f3_f1_1 hpt_f2_f1_0 H.hslot_f1_f3_f2

/-- Transport the `f1:f4=f2` slot metric core fact to packet-label hrow form. -/
theorem hrow_f1_f4_f2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_f4_f1_2 :
      P.point U1Depth5.f4 =
        (P.rows.rowAt CriticalSource.f1).slotPoint 2)
    (hpt_f2_f1_0 :
      P.point U1Depth5.f2 =
        (P.rows.rowAt CriticalSource.f1).slotPoint 0) :
    dist (P.point U1Depth5.f1) (P.point U1Depth5.f4) =
      dist (P.point U1Depth5.f1) (P.point U1Depth5.f2) :=
  P.hrow_of_slot_metric CriticalSource.f1
    hpt_f4_f1_2 hpt_f2_f1_0 H.hslot_f1_f4_f2

/-- Transport the `f1:p=f2` slot metric core fact to packet-label hrow form. -/
theorem hrow_f1_p_f2 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_p_f1_3 :
      P.point U1Depth5.p =
        (P.rows.rowAt CriticalSource.f1).slotPoint 3)
    (hpt_f2_f1_0 :
      P.point U1Depth5.f2 =
        (P.rows.rowAt CriticalSource.f1).slotPoint 0) :
    dist (P.point U1Depth5.f1) (P.point U1Depth5.p) =
      dist (P.point U1Depth5.f1) (P.point U1Depth5.f2) :=
  P.hrow_of_slot_metric CriticalSource.f1
    hpt_p_f1_3 hpt_f2_f1_0 H.hslot_f1_p_f2

/-- Transport the `q:t1=f1` slot metric core fact to packet-label hrow form. -/
theorem hrow_q_t1_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_t1_q_2 :
      P.point U1Depth5.t1 =
        (P.rows.rowAt CriticalSource.q).slotPoint 2)
    (hpt_f1_q_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.q).slotPoint 0) :
    dist (P.point U1Depth5.q) (P.point U1Depth5.t1) =
      dist (P.point U1Depth5.q) (P.point U1Depth5.f1) :=
  P.hrow_of_slot_metric CriticalSource.q
    hpt_t1_q_2 hpt_f1_q_0 H.hslot_q_t1_f1

/-- Transport the `q:t2=f1` slot metric core fact to packet-label hrow form. -/
theorem hrow_q_t2_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_t2_q_3 :
      P.point U1Depth5.t2 =
        (P.rows.rowAt CriticalSource.q).slotPoint 3)
    (hpt_f1_q_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.q).slotPoint 0) :
    dist (P.point U1Depth5.q) (P.point U1Depth5.t2) =
      dist (P.point U1Depth5.q) (P.point U1Depth5.f1) :=
  P.hrow_of_slot_metric CriticalSource.q
    hpt_t2_q_3 hpt_f1_q_0 H.hslot_q_t2_f1

/-- Transport the `t1:p=f1` slot metric core fact to packet-label hrow form. -/
theorem hrow_t1_p_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_p_t1_1 :
      P.point U1Depth5.p =
        (P.rows.rowAt CriticalSource.t1).slotPoint 1)
    (hpt_f1_t1_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.t1).slotPoint 0) :
    dist (P.point U1Depth5.t1) (P.point U1Depth5.p) =
      dist (P.point U1Depth5.t1) (P.point U1Depth5.f1) :=
  P.hrow_of_slot_metric CriticalSource.t1
    hpt_p_t1_1 hpt_f1_t1_0 H.hslot_t1_p_f1

/-- Transport the `t1:q=f1` slot metric core fact to packet-label hrow form. -/
theorem hrow_t1_q_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_q_t1_2 :
      P.point U1Depth5.q =
        (P.rows.rowAt CriticalSource.t1).slotPoint 2)
    (hpt_f1_t1_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.t1).slotPoint 0) :
    dist (P.point U1Depth5.t1) (P.point U1Depth5.q) =
      dist (P.point U1Depth5.t1) (P.point U1Depth5.f1) :=
  P.hrow_of_slot_metric CriticalSource.t1
    hpt_q_t1_2 hpt_f1_t1_0 H.hslot_t1_q_f1

/-- Transport the `t1:t3=f1` slot metric core fact to packet-label hrow form. -/
theorem hrow_t1_t3_f1 {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    {P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU}
    (H : AllEightSlotMetricCore P)
    (hpt_t3_t1_3 :
      P.point U1Depth5.t3 =
        (P.rows.rowAt CriticalSource.t1).slotPoint 3)
    (hpt_f1_t1_0 :
      P.point U1Depth5.f1 =
        (P.rows.rowAt CriticalSource.t1).slotPoint 0) :
    dist (P.point U1Depth5.t1) (P.point U1Depth5.t3) =
      dist (P.point U1Depth5.t1) (P.point U1Depth5.f1) :=
  P.hrow_of_slot_metric CriticalSource.t1
    hpt_t3_t1_3 hpt_f1_t1_0 H.hslot_t1_t3_f1

end AllEightSlotMetricCore

/-- The row-slot manifest packet realizes the generic manifest label packet. -/
noncomputable def toManifestLabelPacket {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    ManifestLabelPacket D where
  baseP := baseP
  baseQ := baseQ
  baseT1 := baseT1
  baseT2 := baseT2
  baseT3 := baseT3
  selectedU := selectedU
  f2Point := P.f2Point
  f3Point := P.f3Point
  f4Point := P.f4Point
  f5Point := P.f5Point
  baseP_mem := P.baseP_mem
  baseQ_mem := P.rows.qRow.source_mem
  baseT1_mem := P.rows.t1Row.source_mem
  baseT2_mem := P.rows.t2Row.source_mem
  baseT3_mem := P.rows.t3Row.source_mem
  selectedU_mem := P.rows.uRow.source_mem
  f2_mem := P.rows.pointOfChoice_mem P.f2Choice
  f3_mem := P.rows.pointOfChoice_mem P.f3Choice
  f4_mem := P.rows.pointOfChoice_mem P.f4Choice
  f5_mem := P.rows.pointOfChoice_mem P.f5Choice
  point_injective := by
    exact pointOf_injective_of_pairwise P.labels_pairwise

/-- A row-slot manifest packet contradicts a proof-carrying pure AnchorPairs
product collapse. -/
theorem false_of_anchorProduct_eq_zero {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hzero : anchorProduct P.point = 0) :
    False := by
  exact P.toManifestLabelPacket.false_of_anchorProduct_eq_zero (by
    simpa [point, toManifestLabelPacket, ManifestLabelPacket.point]
      using hzero)

/-- Row-slot packets carry an injective concrete label assignment. -/
theorem point_injective
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    Function.Injective P.point := by
  simpa [point] using pointOf_injective_of_pairwise P.labels_pairwise

/-- Syntactically distinct row-slot labels name geometrically distinct points. -/
theorem point_ne_of_label_ne
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {a b : Label} (hlabels : a ≠ b) :
    P.point a ≠ P.point b := by
  intro h
  exact hlabels (P.point_injective h)

/-- Coordinate squared distance between distinct row-slot labels is nonzero in
the normal-axis gauge determined by labels `p` and `q`. -/
theorem normalAxis_coord_sqdist_ne_zero
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {a b : Label} (hlabels : a ≠ b) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0 -
          normalAxis (P.point p) (P.point q) (P.point b) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1 -
          normalAxis (P.point p) (P.point q) (P.point b) 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_coord_sqdist_ne_zero
    (P.point_ne_of_label_ne (by decide : p ≠ q))
    (P.point_ne_of_label_ne hlabels)

/-- Coordinate squared norm of a row-slot label distinct from `p` is nonzero in
the normal-axis gauge determined by labels `p` and `q`. -/
theorem normalAxis_sqnorm_ne_zero
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {a : Label} (hlabels : p ≠ a) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_sqnorm_ne_zero
    (P.point_ne_of_label_ne (by decide : p ≠ q))
    (P.point_ne_of_label_ne hlabels)

/-- Coordinate squared distance from `(1, 0)` to a row-slot label distinct from
`q` is nonzero in the normal-axis gauge determined by labels `p` and `q`. -/
theorem normalAxis_unitX_sqdist_ne_zero
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {a : Label} (hlabels : q ≠ a) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 ≠ 0 := by
  exact Problem97.normalAxis_unitX_sqdist_ne_zero
    (P.point_ne_of_label_ne (by decide : p ≠ q))
    (P.point_ne_of_label_ne hlabels)

/-- Packet-label equal-distance facts become equality of normalized coordinate
squared distances in the packet's `p,q` normal-axis gauge. -/
theorem normalAxis_coordSqDist_eq_of_dist_eq
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {center member witness : Label}
    (h :
      dist (P.point center) (P.point member) =
        dist (P.point center) (P.point witness)) :
    coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point member)) =
      coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point witness)) := by
  exact Problem97.normalAxis_coord_sqdist_eq_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Packet-label distance inequalities become inequalities of normalized
coordinate squared distances in the packet's `p,q` normal-axis gauge. -/
theorem normalAxis_coordSqDist_ne_of_dist_ne
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {center member witness : Label}
    (h :
      dist (P.point center) (P.point member) ≠
        dist (P.point center) (P.point witness)) :
    coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point member)) ≠
      coordSqDist (normalAxis (P.point p) (P.point q) (P.point center))
        (normalAxis (P.point p) (P.point q) (P.point witness)) := by
  exact Problem97.normalAxis_coordSqDist_ne_of_dist_ne
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Packet-label equal distances from `p` become equality of normalized
squared norms in the packet's `p,q` normal-axis gauge. -/
theorem normalAxis_sqnorm_coord_eq_of_dist_eq
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {member witness : Label}
    (h :
      dist (P.point p) (P.point member) =
        dist (P.point p) (P.point witness)) :
    (normalAxis (P.point p) (P.point q) (P.point member) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point member) 1) ^ 2 =
      (normalAxis (P.point p) (P.point q) (P.point witness) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point witness) 1) ^ 2 := by
  exact Problem97.normalAxis_sqnorm_coord_eq_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Packet-label equal distances from `q` become equality of normalized
coordinate squared distances from `(1, 0)` in the packet's `p,q` gauge. -/
theorem normalAxis_unitX_sqdist_coord_eq_of_dist_eq
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {member witness : Label}
    (h :
      dist (P.point q) (P.point member) =
        dist (P.point q) (P.point witness)) :
    (normalAxis (P.point p) (P.point q) (P.point member) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point member) 1) ^ 2 =
      (normalAxis (P.point p) (P.point q) (P.point witness) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point witness) 1) ^ 2 := by
  exact Problem97.normalAxis_unitX_sqdist_coord_eq_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- A packet label at the original `q,p` radius has normalized coordinate
squared distance one from `(1, 0)`. -/
theorem normalAxis_unitX_sqdist_coord_eq_one_of_dist_eq
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {a : Label}
    (h : dist (P.point q) (P.point p) = dist (P.point q) (P.point a)) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 = 1 := by
  have hpq : P.point p ≠ P.point q :=
    P.point_ne_of_label_ne (by decide : p ≠ q)
  have hcoord := Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq
    hpq h
  rw [Problem97.normalAxis_witness hpq] at hcoord
  dsimp [coordSqDist] at hcoord
  calc
    (normalAxis (P.point p) (P.point q) (P.point a) 0 - 1) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 =
        (1 - normalAxis (P.point p) (P.point q) (P.point a) 0) ^ 2 +
          (0 - normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 := by
      ring
    _ = 1 := hcoord

/-- A packet label at the original `p,q` radius has normalized coordinate
squared norm one. -/
theorem normalAxis_sqnorm_coord_eq_one_of_dist_eq
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {a : Label}
    (h : dist (P.point p) (P.point a) = dist (P.point p) (P.point q)) :
    (normalAxis (P.point p) (P.point q) (P.point a) 0) ^ 2 +
        (normalAxis (P.point p) (P.point q) (P.point a) 1) ^ 2 = 1 := by
  exact Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq
    (P.point_ne_of_label_ne (by decide : p ≠ q)) h

/-- Row-slot packets supply the injectivity needed to prove nonzero-ness for
generated pair-distance extra factors.  Generated certificates only need to
prove that each listed label pair is syntactically non-diagonal. -/
theorem pairDistanceProduct_ne_zero
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {pairs : List (Label × Label)}
    (hlabels : ∀ ab ∈ pairs, ab.1 ≠ ab.2) :
    pairDistanceProduct pairs P.point ≠ 0 := by
  exact pairDistanceProduct_ne_zero_of_injective hlabels P.point_injective

/-- A row-slot manifest packet contradicts a proof-carrying multiplied product
collapse after the extra factor is certified nonzero. -/
theorem false_of_anchorProduct_mul_extraFactor_eq_zero
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (P : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    {extraFactor : ℝ}
    (hextra : extraFactor ≠ 0)
    (hzero : anchorProduct P.point * extraFactor = 0) :
    False := by
  exact P.toManifestLabelPacket.false_of_anchorProduct_mul_extraFactor_eq_zero
    hextra (by
      simpa [point, toManifestLabelPacket, ManifestLabelPacket.point]
        using hzero)

end RowSlotLabelPacket

/-- A pure product-collapse certificate whose produced labels are row-slot
choices from the five source-indexed critical rows. -/
structure RowSlotProductCollapseCertificate (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  packet : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU
  anchorProduct_eq_zero : anchorProduct packet.point = 0

namespace RowSlotProductCollapseCertificate

/-- A row-slot product-collapse certificate contradicts global 10-label
distinctness. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : RowSlotProductCollapseCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    False :=
  C.packet.false_of_anchorProduct_eq_zero C.anchorProduct_eq_zero

end RowSlotProductCollapseCertificate

/-- A multiplied-product certificate whose produced labels are row-slot choices
from the five source-indexed critical rows. -/
structure RowSlotProductCollapseWithNonzeroFactorCertificate
    (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  packet : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU
  extraFactor : ℝ
  extraFactor_ne_zero : extraFactor ≠ 0
  anchorProduct_mul_extraFactor_eq_zero :
    anchorProduct packet.point * extraFactor = 0

namespace RowSlotProductCollapseWithNonzeroFactorCertificate

/-- A row-slot multiplied-product certificate contradicts global 10-label
distinctness once its extra factor is certified nonzero. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : RowSlotProductCollapseWithNonzeroFactorCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    False :=
  C.packet.false_of_anchorProduct_mul_extraFactor_eq_zero
    C.extraFactor_ne_zero C.anchorProduct_mul_extraFactor_eq_zero

end RowSlotProductCollapseWithNonzeroFactorCertificate

/-- The theorem-facing contract for one generated source-UNIT certificate after
the basis-lift phase.

The `sourceUnit_check` field is deliberately a proof, not a `native_decide`
result baked into the endpoint.  Under the current checker policy, generated
files may fill this field with a native checker theorem only after the approved
axiom-closure and kernel-bypass/foreign-implementation audits, or with an
admissible kernel/reflection proof.  The
`sourceFacts_eval_of_endpoint_ne_zero` field packages the geometric
Rabinowitsch slack instantiation plus the missing-AnchorPairs/rho normalization:
if the lifted endpoint were nonzero, the recorded source facts would all
evaluate to zero, contradicting the checked unit ideal certificate. -/
structure RowSlotSourceUnitLiftCertificate
    (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  packet : RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU
  sourceFacts : List U5GramCert.SparsePoly
  sourceCofactors : List (ℕ × U5GramCert.SparsePoly)
  sourceUnit_check :
    U5GramCert.unitIdealCertChecker sourceFacts sourceCofactors = true
  extraFactor : ℝ
  extraFactor_ne_zero : extraFactor ≠ 0
  sourceFacts_eval_of_endpoint_ne_zero :
    anchorProduct packet.point * extraFactor ≠ 0 →
      ∃ ν : ℕ → ℝ, ∀ f ∈ sourceFacts, U5GramCert.eval ν f = 0

namespace RowSlotSourceUnitLiftCertificate

/-- A checked source-UNIT certificate forces the lifted row-slot endpoint to
vanish once the generator supplies the Rabinowitsch/fact-evaluation implication.
-/
theorem anchorProduct_mul_extraFactor_eq_zero
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : RowSlotSourceUnitLiftCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    anchorProduct C.packet.point * C.extraFactor = 0 := by
  by_contra hne
  obtain ⟨ν, hfacts⟩ := C.sourceFacts_eval_of_endpoint_ne_zero hne
  exact U5GramCert.false_of_unitIdealCertChecker ν
    C.sourceFacts C.sourceCofactors C.sourceUnit_check hfacts

/-- Convert a source-UNIT lift certificate into the existing multiplied-product
row-slot endpoint. -/
noncomputable def toRowSlotProductCollapseWithNonzeroFactorCertificate
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : RowSlotSourceUnitLiftCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    RowSlotProductCollapseWithNonzeroFactorCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU where
  packet := C.packet
  extraFactor := C.extraFactor
  extraFactor_ne_zero := C.extraFactor_ne_zero
  anchorProduct_mul_extraFactor_eq_zero :=
    C.anchorProduct_mul_extraFactor_eq_zero

/-- A source-UNIT lift certificate closes the row-slot branch through the
existing multiplied-product endpoint. -/
theorem false
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : RowSlotSourceUnitLiftCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    False :=
  C.toRowSlotProductCollapseWithNonzeroFactorCertificate.false

end RowSlotSourceUnitLiftCertificate

/-- A proof-carrying product-collapse certificate for a concrete U1 depth-5
manifest packet.

This is the Lean endpoint for generated no-A/no-C product leaves.  The
geometric producer supplies the six live labels `baseP, baseQ, baseT1, baseT2,
baseT3, selectedU`; the certificate supplies the manifest labels `f2..f5`,
carrier membership, global 10-label pairwise distinctness, and the proved
AnchorPairs product equality. -/
structure ProductCollapseCertificate (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  f2Point : Plane
  f3Point : Plane
  f4Point : Plane
  f5Point : Plane
  baseP_mem : baseP ∈ D.A
  baseQ_mem : baseQ ∈ D.A
  baseT1_mem : baseT1 ∈ D.A
  baseT2_mem : baseT2 ∈ D.A
  baseT3_mem : baseT3 ∈ D.A
  selectedU_mem : selectedU ∈ D.A
  f2_mem : f2Point ∈ D.A
  f3_mem : f3Point ∈ D.A
  f4_mem : f4Point ∈ D.A
  f5_mem : f5Point ∈ D.A
  labels_pairwise :
    List.Pairwise (fun x y : Plane => x ≠ y)
      [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
        f2Point, f3Point, f4Point, f5Point]
  anchorProduct_eq_zero :
    anchorProduct
      (pointOf baseP baseQ baseT1 baseT2 baseT3 selectedU
        f2Point f3Point f4Point f5Point) = 0

namespace ProductCollapseCertificate

/-- A product-collapse certificate realizes the manifest label packet consumed
by the generic product tail. -/
noncomputable def toManifestLabelPacket {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : ProductCollapseCertificate D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    ManifestLabelPacket D where
  baseP := baseP
  baseQ := baseQ
  baseT1 := baseT1
  baseT2 := baseT2
  baseT3 := baseT3
  selectedU := selectedU
  f2Point := C.f2Point
  f3Point := C.f3Point
  f4Point := C.f4Point
  f5Point := C.f5Point
  baseP_mem := C.baseP_mem
  baseQ_mem := C.baseQ_mem
  baseT1_mem := C.baseT1_mem
  baseT2_mem := C.baseT2_mem
  baseT3_mem := C.baseT3_mem
  selectedU_mem := C.selectedU_mem
  f2_mem := C.f2_mem
  f3_mem := C.f3_mem
  f4_mem := C.f4_mem
  f5_mem := C.f5_mem
  point_injective := by
    exact pointOf_injective_of_pairwise C.labels_pairwise

/-- A product-collapse certificate contradicts global 10-label distinctness. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : ProductCollapseCertificate D baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    False := by
  exact C.toManifestLabelPacket.false_of_anchorProduct_eq_zero (by
    simpa [toManifestLabelPacket, ManifestLabelPacket.point]
      using C.anchorProduct_eq_zero)

end ProductCollapseCertificate

/-- A proof-carrying product-collapse certificate for the product target
multiplied by a separately certified nonzero factor.

This is the Lean endpoint for product scans that multiply the AnchorPairs target
by row-radius or other forbidden factors.  The certificate is bankable only when
it supplies `extraFactor_ne_zero`; solver output for the multiplied product is
not by itself a proof of `anchorProduct = 0`. -/
structure ProductCollapseWithNonzeroFactorCertificate (D : CounterexampleData)
    (baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  f2Point : Plane
  f3Point : Plane
  f4Point : Plane
  f5Point : Plane
  baseP_mem : baseP ∈ D.A
  baseQ_mem : baseQ ∈ D.A
  baseT1_mem : baseT1 ∈ D.A
  baseT2_mem : baseT2 ∈ D.A
  baseT3_mem : baseT3 ∈ D.A
  selectedU_mem : selectedU ∈ D.A
  f2_mem : f2Point ∈ D.A
  f3_mem : f3Point ∈ D.A
  f4_mem : f4Point ∈ D.A
  f5_mem : f5Point ∈ D.A
  labels_pairwise :
    List.Pairwise (fun x y : Plane => x ≠ y)
      [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
        f2Point, f3Point, f4Point, f5Point]
  extraFactor : ℝ
  extraFactor_ne_zero : extraFactor ≠ 0
  anchorProduct_mul_extraFactor_eq_zero :
    anchorProduct
        (pointOf baseP baseQ baseT1 baseT2 baseT3 selectedU
          f2Point f3Point f4Point f5Point) *
      extraFactor = 0

namespace ProductCollapseWithNonzeroFactorCertificate

/-- A multiplied-product certificate realizes the manifest label packet consumed
by the generic product tail. -/
noncomputable def toManifestLabelPacket {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : ProductCollapseWithNonzeroFactorCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    ManifestLabelPacket D where
  baseP := baseP
  baseQ := baseQ
  baseT1 := baseT1
  baseT2 := baseT2
  baseT3 := baseT3
  selectedU := selectedU
  f2Point := C.f2Point
  f3Point := C.f3Point
  f4Point := C.f4Point
  f5Point := C.f5Point
  baseP_mem := C.baseP_mem
  baseQ_mem := C.baseQ_mem
  baseT1_mem := C.baseT1_mem
  baseT2_mem := C.baseT2_mem
  baseT3_mem := C.baseT3_mem
  selectedU_mem := C.selectedU_mem
  f2_mem := C.f2_mem
  f3_mem := C.f3_mem
  f4_mem := C.f4_mem
  f5_mem := C.f5_mem
  point_injective := by
    exact pointOf_injective_of_pairwise C.labels_pairwise

/-- A multiplied-product certificate contradicts global 10-label distinctness
once its extra factor is certified nonzero. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : Plane}
    (C : ProductCollapseWithNonzeroFactorCertificate D
      baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    False := by
  exact C.toManifestLabelPacket.false_of_anchorProduct_mul_extraFactor_eq_zero
    C.extraFactor_ne_zero
    (by
      simpa [toManifestLabelPacket, ManifestLabelPacket.point]
        using C.anchorProduct_mul_extraFactor_eq_zero)

end ProductCollapseWithNonzeroFactorCertificate

/-- The theorem-facing contract for one generated source-UNIT certificate on a
generic manifest label packet.

This is the source-compatible analogue of `RowSlotSourceUnitLiftCertificate`:
the certificate consumes only the ten labeled manifest points and explicit
packet-label metric hypotheses supplied by the generated theorem. -/
structure SourceUnitLiftCertificate (D : CounterexampleData) where
  packet : ManifestLabelPacket D
  sourceFacts : List U5GramCert.SparsePoly
  sourceCofactors : List (ℕ × U5GramCert.SparsePoly)
  sourceUnit_check :
    U5GramCert.unitIdealCertChecker sourceFacts sourceCofactors = true
  extraFactor : ℝ
  extraFactor_ne_zero : extraFactor ≠ 0
  sourceFacts_eval_of_endpoint_ne_zero :
    anchorProduct packet.point * extraFactor ≠ 0 →
      ∃ ν : ℕ → ℝ, ∀ f ∈ sourceFacts, U5GramCert.eval ν f = 0

namespace SourceUnitLiftCertificate

/-- A checked source-UNIT certificate forces the lifted manifest endpoint to
vanish once the generator supplies the Rabinowitsch/fact-evaluation implication.
-/
theorem anchorProduct_mul_extraFactor_eq_zero
    {D : CounterexampleData}
    (C : SourceUnitLiftCertificate D) :
    anchorProduct C.packet.point * C.extraFactor = 0 := by
  by_contra hne
  obtain ⟨ν, hfacts⟩ := C.sourceFacts_eval_of_endpoint_ne_zero hne
  exact U5GramCert.false_of_unitIdealCertChecker ν
    C.sourceFacts C.sourceCofactors C.sourceUnit_check hfacts

/-- A source-UNIT lift certificate closes the manifest-label branch through the
existing multiplied-product endpoint. -/
theorem false {D : CounterexampleData}
    (C : SourceUnitLiftCertificate D) :
    False :=
  C.packet.false_of_anchorProduct_mul_extraFactor_eq_zero
    C.extraFactor_ne_zero C.anchorProduct_mul_extraFactor_eq_zero

end SourceUnitLiftCertificate

/-- The label surface used by existing U5 checker windows. -/
abbrev CheckerLabel := Fin 8

/-- Proof-carrying 10-label source to 8-label checker projection.

Generated certificate leaves should instantiate this with the explicit
`source_to_checker`, inverse checker window, and omitted source labels recorded
in the solver payload. -/
structure ProjectionRenaming where
  sourceToChecker : Label -> Option CheckerLabel
  checkerToSource : CheckerLabel -> Label
  checker_roundTrip :
    ∀ j : CheckerLabel, sourceToChecker (checkerToSource j) = some j
  sourceToChecker_injective :
    ∀ {i j : Label} {k : CheckerLabel},
      sourceToChecker i = some k -> sourceToChecker j = some k -> i = j

/-- Canonical U1-source to U5-checker projection used by the current mining
surface: keep `p,q,t1,t2,t3,f1,f2,f3` and drop `f4,f5`.  Under this projection
the live U1 label `f1` is the U5 checker label `u`. -/
def canonicalSourceToChecker (i : Label) : Option CheckerLabel :=
  if h : i.val < 8 then some ⟨i.val, h⟩ else none

/-- Inclusion of the eight-label checker window into the ten-label U1 source
surface. -/
def canonicalCheckerToSource (j : CheckerLabel) : Label :=
  ⟨j.val, by omega⟩

private theorem canonical_roundTrip :
    ∀ j : CheckerLabel,
      canonicalSourceToChecker (canonicalCheckerToSource j) = some j := by
  intro j
  fin_cases j <;> simp [canonicalSourceToChecker, canonicalCheckerToSource]

private theorem canonical_sourceToChecker_injective :
    ∀ {i j : Label} {k : CheckerLabel},
      canonicalSourceToChecker i = some k →
        canonicalSourceToChecker j = some k → i = j := by
  intro i j k hi hj
  fin_cases i <;> fin_cases j <;> fin_cases k <;>
    simp [canonicalSourceToChecker] at hi hj ⊢

/-- Canonical projection-renaming payload for U5 checker leaves that use the
first eight U1 source labels, with `f1` interpreted as the live selected
candidate `u`. -/
def canonicalProjectionRenaming : ProjectionRenaming where
  sourceToChecker := canonicalSourceToChecker
  checkerToSource := canonicalCheckerToSource
  checker_roundTrip := canonical_roundTrip
  sourceToChecker_injective := canonical_sourceToChecker_injective

namespace ProjectionRenaming

/-- The checker-to-source window contains eight distinct source labels. -/
theorem checkerToSource_injective (R : ProjectionRenaming) :
    Function.Injective R.checkerToSource := by
  intro a b hab
  have hsome : some a = some b := by
    calc
      some a = R.sourceToChecker (R.checkerToSource a) :=
        (R.checker_roundTrip a).symm
      _ = R.sourceToChecker (R.checkerToSource b) := by rw [hab]
      _ = some b := R.checker_roundTrip b
  simpa using hsome

/-- The 8-label checker window induced by a 10-label prefix and a projection. -/
def project {D : CounterexampleData}
    (P : LabelPrefix D) (R : ProjectionRenaming) :
    CheckerLabel -> Plane :=
  fun j => P.point (R.checkerToSource j)

/-- An injective 10-label prefix projects to an injective 8-label checker
window when the projection payload has a round-trip inverse. -/
theorem project_injective {D : CounterexampleData}
    (P : LabelPrefix D) (R : ProjectionRenaming) :
    Function.Injective (R.project P) := by
  intro a b hab
  exact R.checkerToSource_injective (P.point_injective hab)

/-- Every projected checker label is still a carrier point. -/
theorem project_mem {D : CounterexampleData}
    (P : LabelPrefix D) (R : ProjectionRenaming)
    (j : CheckerLabel) :
    R.project P j ∈ D.A :=
  P.point_mem (R.checkerToSource j)

end ProjectionRenaming

end U1Depth5
end Problem97
