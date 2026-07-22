/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Card13BoundaryNormalization
import Erdos9796Proof.P97.ATail.ExactFiveGlobalCrossDeletionPair

/-!
# Card-thirteen all-one-hit hub orbit normalization

This scratch module separates two label spaces that must not be conflated:

* `boundaryPoint` is the current card-thirteen boundary normalization.  Its
  strict physical second-cap indices are exactly `1,2,3`.
* `point` is obtained from `boundaryPoint` by either the identity or the
  physical-role reflection swapping `1` and `3`.  It normalizes a physical
  hub to index `2` (middle) or index `1` (extreme).

The second relabeling is only a role reflection.  The packet retains the
boundary labels and the explicit permutation, rather than asserting that the
relabelled `point` function is still in increasing boundary order.

The actual fixed-`H` selected supports and both global-cover families are
carried through this relabeling.  No finite contradiction is used here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13AllOneOrbitNormalizationScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The three canonical strict physical-cap indices. -/
def strictPhysicalIndices13 : Finset (Fin 13) := {1, 2, 3}

@[simp] theorem mem_strictPhysicalIndices13_iff (i : Fin 13) :
    i ∈ strictPhysicalIndices13 ↔
      i = (1 : Fin 13) ∨ i = (2 : Fin 13) ∨ i = (3 : Fin 13) := by
  simp [strictPhysicalIndices13]

/-- The role-only reflection of the three strict physical indices.  It fixes
every other carrier label. -/
def physicalRoleReflection13 : Equiv.Perm (Fin 13) :=
  Equiv.swap (1 : Fin 13) 3

@[simp] theorem physicalRoleReflection13_one :
    physicalRoleReflection13 1 = (3 : Fin 13) := by
  simp [physicalRoleReflection13]

@[simp] theorem physicalRoleReflection13_two :
    physicalRoleReflection13 2 = (2 : Fin 13) := by
  decide

@[simp] theorem physicalRoleReflection13_three :
    physicalRoleReflection13 3 = (1 : Fin 13) := by
  simp [physicalRoleReflection13]

theorem physicalRoleReflection13_mem_strict_iff (i : Fin 13) :
    physicalRoleReflection13 i ∈ strictPhysicalIndices13 ↔
      i ∈ strictPhysicalIndices13 := by
  fin_cases i <;> decide

/-- Direct-orientation Kalmanson inequalities for the canonical card-thirteen
boundary. -/
private theorem strictKalmanson_pair_of_ccw13
    {A : Finset ℝ²} (hcard : A.card = 13) (hA : ConvexIndep A)
    (phi : Fin 13 → ℝ²) (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d : Fin 13} (hab : a < b) (hbc : b < c) (hcd : c < d) :
    (dist (phi b) (phi c) + dist (phi a) (phi d) <
        dist (phi a) (phi c) + dist (phi b) (phi d)) ∧
      (dist (phi a) (phi b) + dist (phi c) (phi d) <
        dist (phi a) (phi c) + dist (phi b) (phi d)) := by
  let toCard : Fin A.card → Fin 13 := Fin.cast hcard
  let fromCard : Fin 13 → Fin A.card := Fin.cast hcard.symm
  let phiCard : Fin A.card → ℝ² := fun i ↦ phi (toCard i)
  have hphiCard_inj : Function.Injective phiCard := by
    intro i j hij
    apply Fin.cast_injective hcard
    apply hphi_inj
    exact hij
  have hphiCard_image : Finset.univ.image phiCard = A := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
      have hxImage : phi (toCard i) ∈ Finset.univ.image phi :=
        Finset.mem_image.mpr ⟨toCard i, Finset.mem_univ _, rfl⟩
      rwa [hphi_image] at hxImage
    · intro hx
      have hxImage : x ∈ Finset.univ.image phi := by
        rwa [hphi_image]
      rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨fromCard i, Finset.mem_univ _, by simp [phiCard, toCard, fromCard]⟩
  have hccwCard : EuclideanGeometry.IsCcwConvexPolygon phiCard := by
    intro i j k hij hjk
    exact hccw hij hjk
  have habCard : fromCard a < fromCard b := hab
  have hbcCard : fromCard b < fromCard c := hbc
  have hcdCard : fromCard c < fromCard d := hcd
  constructor
  · simpa [phiCard, toCard, fromCard] using
      (CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
        hA hphiCard_inj hphiCard_image hccwCard habCard hbcCard hcdCard)
  · simpa [phiCard, toCard, fromCard] using
      (CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hphiCard_inj hphiCard_image hccwCard habCard hbcCard hcdCard)

private theorem canonical_index_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (hsecond : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ phi i = x := by
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.oppIndex2
      hccw hinj himage (ia := (0 : Fin 13)) (ib := (4 : Fin 13))
      (ic := (8 : Fin 13)) (by decide) (Or.inr (by decide))
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
      (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
      (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
      hx with ⟨i, hi0, hi4, hpoint⟩
  refine ⟨i, ?_, hpoint⟩
  simp only [mem_strictPhysicalIndices13_iff]
  have hiCases : i.val = 1 ∨ i.val = 2 ∨ i.val = 3 := by omega
  rcases hiCases with h | h | h
  · exact Or.inl (Fin.ext h)
  · exact Or.inr (Or.inl (Fin.ext h))
  · exact Or.inr (Or.inr (Fin.ext h))

private theorem canonical_index_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hsecond : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧
      phi (reverseCyclicIndex13 i) = x := by
  rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
      S.oppIndex2 hccw hinj himage (ia := (0 : Fin 13))
      (ib := (9 : Fin 13)) (ic := (5 : Fin 13)) (by decide) (by decide)
      (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
      (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
        using hzero)
      (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
        using hfirst)
      hx with ⟨q, hqout, hqpoint⟩
  have hq9 : (9 : Fin 13) < q := by
    rcases hqout with hq0 | hq9
    · omega
    · exact hq9
  have hq0 : (0 : Fin 13) < q := by omega
  let i : Fin 13 := reverseCyclicIndex13 q
  have hiVal : i.val = 13 - q.val :=
    reverseCyclicIndex13_val_of_pos hq0
  have hi0 : (0 : Fin 13) < i := by
    rw [Fin.lt_def, hiVal]
    omega
  have hi4 : i < (4 : Fin 13) := by
    rw [Fin.lt_def, hiVal]
    omega
  have hi : i ∈ strictPhysicalIndices13 := by
    simp only [mem_strictPhysicalIndices13_iff]
    have hiCases : i.val = 1 ∨ i.val = 2 ∨ i.val = 3 := by omega
    rcases hiCases with h | h | h
    · exact Or.inl (Fin.ext h)
    · exact Or.inr (Or.inl (Fin.ext h))
    · exact Or.inr (Or.inr (Fin.ext h))
  refine ⟨i, hi, ?_⟩
  have hinvol : reverseCyclicIndex13 i = q := by
    simp [i, reverseCyclicIndex13]
  simpa [hinvol] using hqpoint

private theorem physicalVertices_eq_strict_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (point : Fin 13 → ℝ²) (hinj : Function.Injective point)
    (hindex : ∀ x ∈ physicalVertices profile,
      ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ point i = x) :
    physicalVertices profile = strictPhysicalIndices13.image point := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases hindex x hx with ⟨i, hi, rfl⟩
    exact Finset.mem_image.mpr ⟨i, hi, rfl⟩
  · rw [physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile,
      Finset.card_image_of_injective _ hinj]
    decide

/-- Boundary-normalized card-thirteen frame, independent of a two-hit row.
The exact-five physical three-set is exactly the image of indices `1,2,3`. -/
structure CanonicalAllOneBoundaryFrame
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  boundaryPoint : Fin 13 → ℝ²
  boundaryPoint_injective : Function.Injective boundaryPoint
  boundaryPoint_image : Finset.univ.image boundaryPoint = D.A
  surplusOpposite_at_zero :
    boundaryPoint 0 = S.oppositeVertexByIndex S.surplusIdx
  firstApex_at_four :
    boundaryPoint 4 = S.oppositeVertexByIndex S.oppIndex1
  secondApex_at_eight :
    boundaryPoint 8 = S.oppositeVertexByIndex S.oppIndex2
  strictKalmanson : ∀ {a b c d : Fin 13}, a < b → b < c → c < d →
    (dist (boundaryPoint b) (boundaryPoint c) +
        dist (boundaryPoint a) (boundaryPoint d) <
      dist (boundaryPoint a) (boundaryPoint c) +
        dist (boundaryPoint b) (boundaryPoint d)) ∧
      (dist (boundaryPoint a) (boundaryPoint b) +
          dist (boundaryPoint c) (boundaryPoint d) <
        dist (boundaryPoint a) (boundaryPoint c) +
          dist (boundaryPoint b) (boundaryPoint d))
  physicalVertices_eq :
    physicalVertices profile = strictPhysicalIndices13.image boundaryPoint

namespace CanonicalAllOneBoundaryFrame

theorem boundaryPoint_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalAllOneBoundaryFrame profile) (i : Fin 13) :
    P.boundaryPoint i ∈ D.A := by
  rw [← P.boundaryPoint_image]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

theorem boundaryPoint_mem_physicalVertices_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalAllOneBoundaryFrame profile) (i : Fin 13) :
    P.boundaryPoint i ∈ physicalVertices profile ↔
      i ∈ strictPhysicalIndices13 := by
  rw [P.physicalVertices_eq]
  constructor
  · intro hi
    rcases Finset.mem_image.mp hi with ⟨j, hj, hji⟩
    exact P.boundaryPoint_injective hji ▸ hj
  · intro hi
    exact Finset.mem_image.mpr ⟨i, hi, rfl⟩

end CanonicalAllOneBoundaryFrame

/-- The boundary normalization can be constructed on the all-one-hit branch
without choosing any asymmetric source row. -/
theorem nonempty_canonicalAllOneBoundaryFrame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcard : D.A.card = 13) :
    Nonempty (CanonicalAllOneBoundaryFrame profile) := by
  classical
  rcases exists_card13_ccw_boundary_apexPlacement Q hcard with
    ⟨phi, hinj, himage, hccw, hplacement⟩
  rcases hplacement with ⟨hzero, hfirst, hsecond⟩ |
      ⟨hzero, hsecond, hfirst⟩
  · have hindex : ∀ x ∈ physicalVertices profile,
        ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ phi i = x := by
      intro x hx
      rw [physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile] at hx
      exact canonical_index_direct phi hinj himage hccw hzero hfirst hsecond hx
    exact ⟨{
      boundaryPoint := phi
      boundaryPoint_injective := hinj
      boundaryPoint_image := himage
      surplusOpposite_at_zero := hzero
      firstApex_at_four := hfirst
      secondApex_at_eight := hsecond
      strictKalmanson := fun hab hbc hcd ↦
        strictKalmanson_pair_of_ccw13 hcard D.convex phi hinj himage hccw
          hab hbc hcd
      physicalVertices_eq :=
        physicalVertices_eq_strict_image Q profile phi hinj hindex }⟩
  · let point : Fin 13 → ℝ² := fun i ↦ phi (reverseCyclicIndex13 i)
    have point_injective : Function.Injective point :=
      hinj.comp (by
        intro i j hij
        simpa [reverseCyclicIndex13] using congrArg Neg.neg hij)
    have point_image : Finset.univ.image point = D.A := by
      rw [← himage]
      ext z
      simp only [Finset.mem_image, Finset.mem_univ, true_and]
      constructor
      · rintro ⟨i, rfl⟩
        exact ⟨reverseCyclicIndex13 i, rfl⟩
      · rintro ⟨i, rfl⟩
        refine ⟨reverseCyclicIndex13 i, ?_⟩
        simp [point, reverseCyclicIndex13]
    have point_zero : point 0 = S.oppositeVertexByIndex S.surplusIdx := by
      simpa [point] using hzero
    have point_four : point 4 = S.oppositeVertexByIndex S.oppIndex1 := by
      simpa [point, reverseCyclicIndex13] using hfirst
    have point_eight : point 8 = S.oppositeVertexByIndex S.oppIndex2 := by
      simpa [point, reverseCyclicIndex13] using hsecond
    have hindex : ∀ x ∈ physicalVertices profile,
        ∃ i : Fin 13, i ∈ strictPhysicalIndices13 ∧ point i = x := by
      intro x hx
      rw [physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile] at hx
      simpa [point] using
        canonical_index_reflected phi hinj himage hccw hzero hsecond hfirst hx
    exact ⟨{
      boundaryPoint := point
      boundaryPoint_injective := point_injective
      boundaryPoint_image := point_image
      surplusOpposite_at_zero := point_zero
      firstApex_at_four := point_four
      secondApex_at_eight := point_eight
      strictKalmanson := fun hab hbc hcd ↦ by
        simpa [point] using strictKalmanson_pair_reverseCyclicIndex13
          hcard D.convex phi hinj himage hccw hab hbc hcd
      physicalVertices_eq :=
        physicalVertices_eq_strict_image Q profile point point_injective hindex }⟩

/-- The two reflection-canonical hub modes. -/
inductive CanonicalAllOneHubMode : Type
  | extreme
  | middle
  deriving DecidableEq

/-- Source-faithful all-one-hit role packet.  `reindex` is either identity or
the explicit `1 ↔ 3` role reflection.  The fixed-`H` actual rows and the two
star cover families are evaluated at the transported carrier labels; no rows
are reselected or identified. -/
structure CanonicalAllOneHubOrbitPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) : Type where
  boundary : CanonicalAllOneBoundaryFrame profile
  reindex : Equiv.Perm (Fin 13)
  reindex_is_identity_or_reflection :
    reindex = Equiv.refl (Fin 13) ∨ reindex = physicalRoleReflection13
  mode : CanonicalAllOneHubMode
  point : Fin 13 → ℝ² := fun i ↦ boundary.boundaryPoint (reindex i)
  point_injective : Function.Injective point
  point_image : Finset.univ.image point = D.A
  physical_indices : ∀ i : Fin 13,
    point i ∈ physicalVertices profile ↔ i ∈ strictPhysicalIndices13
  hub_position :
    match mode with
    | .extreme => point 1 = star.hub.1
    | .middle => point 2 = star.hub.1
  spoke_positions :
    match mode with
    | .extreme =>
        ({point 2, point 3} : Finset ℝ²) = {star.spoke₁.1, star.spoke₂.1}
    | .middle =>
        ({point 1, point 3} : Finset ℝ²) = {star.spoke₁.1, star.spoke₂.1}
  actualSupport : Fin 13 → Finset ℝ²
  actualSupport_eq : ∀ i : Fin 13,
    actualSupport i =
      (H.selectedAt (point i) (by
        rw [← point_image]
        exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩)).toCriticalFourShell.support
  strict_actual_rows_one_hit : ∀ i : Fin 13,
    i ∈ strictPhysicalIndices13 →
      (physicalVertices profile ∩ actualSupport i).card = 1
  hub_spoke₁_cover : ∀ i : Fin 13,
    HasNEquidistantPointsAt 4 (D.A.erase star.hub.1) (point i) ∨
      HasNEquidistantPointsAt 4 (D.A.erase star.spoke₁.1) (point i)
  hub_spoke₂_cover : ∀ i : Fin 13,
    HasNEquidistantPointsAt 4 (D.A.erase star.hub.1) (point i) ∨
      HasNEquidistantPointsAt 4 (D.A.erase star.spoke₂.1) (point i)

namespace CanonicalAllOneHubOrbitPacket

private theorem point_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    (P : CanonicalAllOneHubOrbitPacket H profile star hall) (i : Fin 13) :
    P.point i ∈ D.A := by
  rw [← P.point_image]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

/-- The stored actual support is exactly the fixed critical-system row at the
transported source label. -/
theorem actualSupport_eq_fixedH
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    (P : CanonicalAllOneHubOrbitPacket H profile star hall) (i : Fin 13) :
    P.actualSupport i =
      (H.selectedAt (P.point i) (point_mem_A P i)).toCriticalFourShell.support := by
  exact P.actualSupport_eq i

end CanonicalAllOneHubOrbitPacket

private theorem hub_index_cases
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalAllOneBoundaryFrame profile)
    (star : PhysicalGlobalCrossDeletionStar profile) :
    P.boundaryPoint 1 = star.hub.1 ∨
      P.boundaryPoint 2 = star.hub.1 ∨
      P.boundaryPoint 3 = star.hub.1 := by
  have hhub : star.hub.1 ∈ physicalVertices profile := star.hub.2
  rw [P.physicalVertices_eq] at hhub
  rcases Finset.mem_image.mp hhub with ⟨i, hi, hpoint⟩
  simp only [mem_strictPhysicalIndices13_iff] at hi
  rcases hi with rfl | rfl | rfl
  · exact Or.inl hpoint
  · exact Or.inr (Or.inl hpoint)
  · exact Or.inr (Or.inr hpoint)

private theorem spokes_eq_remaining_of_hub_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalAllOneBoundaryFrame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hhub : P.boundaryPoint 1 = star.hub.1) :
    ({P.boundaryPoint 2, P.boundaryPoint 3} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1} := by
  have hhubNeOne : star.hub.1 ≠ star.spoke₁.1 := by
    intro h
    exact star.hub_ne_spoke₁ (Subtype.ext h)
  have hhubNeTwo : star.hub.1 ≠ star.spoke₂.1 := by
    intro h
    exact star.hub_ne_spoke₂ (Subtype.ext h)
  have hphysical : physicalVertices profile =
      {P.boundaryPoint 1, P.boundaryPoint 2, P.boundaryPoint 3} := by
    rw [P.physicalVertices_eq]
    simp [strictPhysicalIndices13]
  have hp21 : P.boundaryPoint 2 ≠ P.boundaryPoint 1 :=
    P.boundaryPoint_injective.ne (by decide)
  have hp31 : P.boundaryPoint 3 ≠ P.boundaryPoint 1 :=
    P.boundaryPoint_injective.ne (by decide)
  calc
    ({P.boundaryPoint 2, P.boundaryPoint 3} : Finset ℝ²) =
        (physicalVertices profile).erase star.hub.1 := by
      rw [hphysical, ← hhub]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
      aesop
    _ = {star.spoke₁.1, star.spoke₂.1} := by
      rw [star.physicalVertices_eq]
      simp [hhubNeOne, hhubNeTwo]

private theorem spokes_eq_remaining_of_hub_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalAllOneBoundaryFrame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hhub : P.boundaryPoint 2 = star.hub.1) :
    ({P.boundaryPoint 1, P.boundaryPoint 3} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1} := by
  have hhubNeOne : star.hub.1 ≠ star.spoke₁.1 := by
    intro h
    exact star.hub_ne_spoke₁ (Subtype.ext h)
  have hhubNeTwo : star.hub.1 ≠ star.spoke₂.1 := by
    intro h
    exact star.hub_ne_spoke₂ (Subtype.ext h)
  have hphysical : physicalVertices profile =
      {P.boundaryPoint 1, P.boundaryPoint 2, P.boundaryPoint 3} := by
    rw [P.physicalVertices_eq]
    simp [strictPhysicalIndices13]
  have hp12 : P.boundaryPoint 1 ≠ P.boundaryPoint 2 :=
    P.boundaryPoint_injective.ne (by decide)
  have hp32 : P.boundaryPoint 3 ≠ P.boundaryPoint 2 :=
    P.boundaryPoint_injective.ne (by decide)
  calc
    ({P.boundaryPoint 1, P.boundaryPoint 3} : Finset ℝ²) =
        (physicalVertices profile).erase star.hub.1 := by
      rw [hphysical, ← hhub]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
      aesop
    _ = {star.spoke₁.1, star.spoke₂.1} := by
      rw [star.physicalVertices_eq]
      simp [hhubNeOne, hhubNeTwo]

private theorem spokes_eq_remaining_of_hub_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalAllOneBoundaryFrame profile)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hhub : P.boundaryPoint 3 = star.hub.1) :
    ({P.boundaryPoint 1, P.boundaryPoint 2} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1} := by
  have hhubNeOne : star.hub.1 ≠ star.spoke₁.1 := by
    intro h
    exact star.hub_ne_spoke₁ (Subtype.ext h)
  have hhubNeTwo : star.hub.1 ≠ star.spoke₂.1 := by
    intro h
    exact star.hub_ne_spoke₂ (Subtype.ext h)
  have hphysical : physicalVertices profile =
      {P.boundaryPoint 1, P.boundaryPoint 2, P.boundaryPoint 3} := by
    rw [P.physicalVertices_eq]
    simp [strictPhysicalIndices13]
  have hp13 : P.boundaryPoint 1 ≠ P.boundaryPoint 3 :=
    P.boundaryPoint_injective.ne (by decide)
  have hp23 : P.boundaryPoint 2 ≠ P.boundaryPoint 3 :=
    P.boundaryPoint_injective.ne (by decide)
  calc
    ({P.boundaryPoint 1, P.boundaryPoint 2} : Finset ℝ²) =
        (physicalVertices profile).erase star.hub.1 := by
      rw [hphysical, ← hhub]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_erase]
      aesop
    _ = {star.spoke₁.1, star.spoke₂.1} := by
      rw [star.physicalVertices_eq]
      simp [hhubNeOne, hhubNeTwo]

/-- Every card-thirteen all-one-hit star has a source-faithful representative
in one of two hub orbits: middle `2`, or extreme `1` after the explicit
physical-role reflection. -/
theorem nonempty_canonicalAllOneHubOrbitPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (hcard : D.A.card = 13) :
    Nonempty (CanonicalAllOneHubOrbitPacket H profile star hall) := by
  classical
  rcases nonempty_canonicalAllOneBoundaryFrame Q profile hcard with ⟨boundary⟩
  rcases hub_index_cases boundary star with hhubOne | hhubTwo | hhubThree
  · let reindex : Equiv.Perm (Fin 13) := Equiv.refl (Fin 13)
    let point : Fin 13 → ℝ² := fun i ↦ boundary.boundaryPoint (reindex i)
    have point_injective : Function.Injective point :=
      boundary.boundaryPoint_injective.comp reindex.injective
    have point_image : Finset.univ.image point = D.A := by
      simpa [point, reindex] using boundary.boundaryPoint_image
    have physical_indices : ∀ i : Fin 13,
        point i ∈ physicalVertices profile ↔ i ∈ strictPhysicalIndices13 := by
      intro i
      simpa [point, reindex] using boundary.boundaryPoint_mem_physicalVertices_iff i
    let pointMem : ∀ i : Fin 13, point i ∈ D.A := fun i ↦ by
      rw [← point_image]
      exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    let actualSupport : Fin 13 → Finset ℝ² := fun i ↦
      (H.selectedAt (point i) (pointMem i)).toCriticalFourShell.support
    refine ⟨{
      boundary := boundary
      reindex := reindex
      reindex_is_identity_or_reflection := Or.inl rfl
      mode := .extreme
      point := point
      point_injective := point_injective
      point_image := point_image
      physical_indices := physical_indices
      hub_position := by simpa [point, reindex] using hhubOne
      spoke_positions := by
        simpa [point, reindex] using spokes_eq_remaining_of_hub_one boundary star hhubOne
      actualSupport := actualSupport
      actualSupport_eq := fun _ ↦ rfl
      strict_actual_rows_one_hit := ?_
      hub_spoke₁_cover := fun i ↦ star.hub_spoke₁_cover _ (pointMem i)
      hub_spoke₂_cover := fun i ↦ star.hub_spoke₂_cover _ (pointMem i) }⟩
    intro i hi
    let q : PhysicalVertex profile := ⟨point i, (physical_indices i).2 hi⟩
    simpa [actualSupport, q] using hall q
  · let reindex : Equiv.Perm (Fin 13) := Equiv.refl (Fin 13)
    let point : Fin 13 → ℝ² := fun i ↦ boundary.boundaryPoint (reindex i)
    have point_injective : Function.Injective point :=
      boundary.boundaryPoint_injective.comp reindex.injective
    have point_image : Finset.univ.image point = D.A := by
      simpa [point, reindex] using boundary.boundaryPoint_image
    have physical_indices : ∀ i : Fin 13,
        point i ∈ physicalVertices profile ↔ i ∈ strictPhysicalIndices13 := by
      intro i
      simpa [point, reindex] using boundary.boundaryPoint_mem_physicalVertices_iff i
    let pointMem : ∀ i : Fin 13, point i ∈ D.A := fun i ↦ by
      rw [← point_image]
      exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    let actualSupport : Fin 13 → Finset ℝ² := fun i ↦
      (H.selectedAt (point i) (pointMem i)).toCriticalFourShell.support
    refine ⟨{
      boundary := boundary
      reindex := reindex
      reindex_is_identity_or_reflection := Or.inl rfl
      mode := .middle
      point := point
      point_injective := point_injective
      point_image := point_image
      physical_indices := physical_indices
      hub_position := by simpa [point, reindex] using hhubTwo
      spoke_positions := by
        simpa [point, reindex] using spokes_eq_remaining_of_hub_two boundary star hhubTwo
      actualSupport := actualSupport
      actualSupport_eq := fun _ ↦ rfl
      strict_actual_rows_one_hit := ?_
      hub_spoke₁_cover := fun i ↦ star.hub_spoke₁_cover _ (pointMem i)
      hub_spoke₂_cover := fun i ↦ star.hub_spoke₂_cover _ (pointMem i) }⟩
    intro i hi
    let q : PhysicalVertex profile := ⟨point i, (physical_indices i).2 hi⟩
    simpa [actualSupport, q] using hall q
  · let reindex : Equiv.Perm (Fin 13) := physicalRoleReflection13
    let point : Fin 13 → ℝ² := fun i ↦ boundary.boundaryPoint (reindex i)
    have point_injective : Function.Injective point :=
      boundary.boundaryPoint_injective.comp reindex.injective
    have point_image : Finset.univ.image point = D.A := by
      rw [← boundary.boundaryPoint_image]
      ext x
      simp only [Finset.mem_image, Finset.mem_univ, true_and]
      constructor
      · rintro ⟨i, rfl⟩
        exact ⟨reindex i, rfl⟩
      · rintro ⟨i, rfl⟩
        exact ⟨reindex.symm i, by simp [point]⟩
    have physical_indices : ∀ i : Fin 13,
        point i ∈ physicalVertices profile ↔ i ∈ strictPhysicalIndices13 := by
      intro i
      rw [boundary.boundaryPoint_mem_physicalVertices_iff]
      exact physicalRoleReflection13_mem_strict_iff i
    let pointMem : ∀ i : Fin 13, point i ∈ D.A := fun i ↦ by
      rw [← point_image]
      exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    let actualSupport : Fin 13 → Finset ℝ² := fun i ↦
      (H.selectedAt (point i) (pointMem i)).toCriticalFourShell.support
    have hhubOne : point 1 = star.hub.1 := by
      change boundary.boundaryPoint (physicalRoleReflection13 1) = star.hub.1
      simpa using hhubThree
    have hspokes : ({point 2, point 3} : Finset ℝ²) =
        {star.spoke₁.1, star.spoke₂.1} := by
      have hraw := spokes_eq_remaining_of_hub_three boundary star hhubThree
      change ({boundary.boundaryPoint (physicalRoleReflection13 2),
        boundary.boundaryPoint (physicalRoleReflection13 3)} : Finset ℝ²) =
          {star.spoke₁.1, star.spoke₂.1}
      simpa [Finset.pair_comm] using hraw
    refine ⟨{
      boundary := boundary
      reindex := reindex
      reindex_is_identity_or_reflection := Or.inr rfl
      mode := .extreme
      point := point
      point_injective := point_injective
      point_image := point_image
      physical_indices := physical_indices
      hub_position := hhubOne
      spoke_positions := hspokes
      actualSupport := actualSupport
      actualSupport_eq := fun _ ↦ rfl
      strict_actual_rows_one_hit := ?_
      hub_spoke₁_cover := fun i ↦ star.hub_spoke₁_cover _ (pointMem i)
      hub_spoke₂_cover := fun i ↦ star.hub_spoke₂_cover _ (pointMem i) }⟩
    intro i hi
    let q : PhysicalVertex profile := ⟨point i, (physical_indices i).2 hi⟩
    simpa [actualSupport, q] using hall q

/-- The three original-frame hub orbits used by the finite ingress. -/
inductive CanonicalAllOneCnfOrbit : Type
  | hubLeft
  | hubMiddle
  | hubRight
  deriving DecidableEq

namespace CanonicalAllOneCnfOrbit

/-- Hub index in the untouched canonical boundary frame. -/
def hubIndex : CanonicalAllOneCnfOrbit → Fin 13
  | .hubLeft => 1
  | .hubMiddle => 2
  | .hubRight => 3

/-- The first CNF spoke index.  This is the smaller remaining strict physical
index in each of the three source orbits. -/
def spoke₀Index : CanonicalAllOneCnfOrbit → Fin 13
  | .hubLeft => 2
  | .hubMiddle => 1
  | .hubRight => 1

/-- The second CNF spoke index.  This is the larger remaining strict physical
index in each of the three source orbits. -/
def spoke₁Index : CanonicalAllOneCnfOrbit → Fin 13
  | .hubLeft => 3
  | .hubMiddle => 3
  | .hubRight => 2

@[simp] theorem indices_hubLeft :
    hubIndex .hubLeft = (1 : Fin 13) ∧
      spoke₀Index .hubLeft = (2 : Fin 13) ∧
      spoke₁Index .hubLeft = (3 : Fin 13) := by
  decide

@[simp] theorem indices_hubMiddle :
    hubIndex .hubMiddle = (2 : Fin 13) ∧
      spoke₀Index .hubMiddle = (1 : Fin 13) ∧
      spoke₁Index .hubMiddle = (3 : Fin 13) := by
  decide

@[simp] theorem indices_hubRight :
    hubIndex .hubRight = (3 : Fin 13) ∧
      spoke₀Index .hubRight = (1 : Fin 13) ∧
      spoke₁Index .hubRight = (2 : Fin 13) := by
  decide

end CanonicalAllOneCnfOrbit

/-- One selected ambient row witnessing a deletion cover for a named CNF
edge. -/
structure CnfDeletionCoverRow
    (A : Finset ℝ²) (center hub spoke : ℝ²) : Type where
  row : SelectedFourClass A center
  omits_hub_or_spoke : hub ∉ row.support ∨ spoke ∉ row.support

private theorem exists_selectedFourClass_omitting_of_erasedK4
    {A : Finset ℝ²} {center deleted : ℝ²}
    (hK4 : HasNEquidistantPointsAt 4 (A.erase deleted) center) :
    ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  classical
  unfold HasNEquidistantPointsAt at hK4
  rcases hK4 with ⟨r, hradius, hcard⟩
  let shell : Finset ℝ² :=
    (A.erase deleted).filter fun x ↦ dist center x = r
  obtain ⟨support, hsupportSub, hsupportCard⟩ :=
    Finset.exists_subset_card_eq hcard
  have hsupportAmbient : support ⊆ A := by
    intro x hx
    have hxShell : x ∈ shell := hsupportSub hx
    exact Finset.mem_of_mem_erase (Finset.mem_filter.mp hxShell).1
  have hdeleted : deleted ∉ support := by
    intro hmem
    have hxShell : deleted ∈ shell := hsupportSub hmem
    exact (Finset.notMem_erase deleted A) (Finset.mem_filter.mp hxShell).1
  let K : SelectedFourClass A center := {
    support := support
    support_subset_A := hsupportAmbient
    support_card := hsupportCard
    radius := r
    radius_pos := hradius
    support_eq_radius := by
      intro x hx
      exact (Finset.mem_filter.mp (hsupportSub hx)).2
    center_not_mem := by
      intro hcenter
      have hdist : dist center center = r :=
        (Finset.mem_filter.mp (hsupportSub hcenter)).2
      have : (0 : ℝ) = r := by simpa using hdist
      linarith }
  exact ⟨K, hdeleted⟩

private theorem nonempty_cnfDeletionCoverRow
    {A : Finset ℝ²} {center hub spoke : ℝ²}
    (hcover :
      HasNEquidistantPointsAt 4 (A.erase hub) center ∨
        HasNEquidistantPointsAt 4 (A.erase spoke) center) :
    Nonempty (CnfDeletionCoverRow A center hub spoke) := by
  rcases hcover with hhub | hspoke
  · rcases exists_selectedFourClass_omitting_of_erasedK4 hhub with ⟨K, hK⟩
    exact ⟨⟨K, Or.inl hK⟩⟩
  · rcases exists_selectedFourClass_omitting_of_erasedK4 hspoke with ⟨K, hK⟩
    exact ⟨⟨K, Or.inr hK⟩⟩

/-- Three-way, original-boundary-frame packet for the finite all-one ingress.

`cover₀` and `cover₁` match the encoder's `g0/g1` convention: their spokes
are respectively `spoke₀Index` and `spoke₁Index` for the selected orbit.
`cover_alignment` records whether this order agrees with the source star's
spoke names or swaps the two independent source families. -/
structure CanonicalAllOneThreeWayCnfPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) : Type where
  boundary : CanonicalAllOneBoundaryFrame profile
  orbit : CanonicalAllOneCnfOrbit
  hub_position :
    boundary.boundaryPoint orbit.hubIndex = star.hub.1
  spoke_positions :
    ({boundary.boundaryPoint orbit.spoke₀Index,
        boundary.boundaryPoint orbit.spoke₁Index} : Finset ℝ²) =
      {star.spoke₁.1, star.spoke₂.1}
  cover_alignment :
    (boundary.boundaryPoint orbit.spoke₀Index = star.spoke₁.1 ∧
        boundary.boundaryPoint orbit.spoke₁Index = star.spoke₂.1) ∨
      (boundary.boundaryPoint orbit.spoke₀Index = star.spoke₂.1 ∧
        boundary.boundaryPoint orbit.spoke₁Index = star.spoke₁.1)
  actualSupport : Fin 13 → Finset ℝ²
  actualSupport_eq : ∀ i : Fin 13,
    actualSupport i =
      (H.selectedAt (boundary.boundaryPoint i)
        (boundary.boundaryPoint_mem_A i)).toCriticalFourShell.support
  strict_actual_rows_one_hit : ∀ i : Fin 13,
    i ∈ strictPhysicalIndices13 →
      (physicalVertices profile ∩ actualSupport i).card = 1
  cover₀ : ∀ center : Fin 13,
    CnfDeletionCoverRow D.A (boundary.boundaryPoint center)
      (boundary.boundaryPoint orbit.hubIndex)
      (boundary.boundaryPoint orbit.spoke₀Index)
  cover₁ : ∀ center : Fin 13,
    CnfDeletionCoverRow D.A (boundary.boundaryPoint center)
      (boundary.boundaryPoint orbit.hubIndex)
      (boundary.boundaryPoint orbit.spoke₁Index)

private theorem ordered_spoke_alignment
    {a b s₀ s₁ : ℝ²}
    (hab : a ≠ b)
    (hset : ({a, b} : Finset ℝ²) = {s₀, s₁}) :
    (a = s₀ ∧ b = s₁) ∨ (a = s₁ ∧ b = s₀) := by
  have ha : a = s₀ ∨ a = s₁ := by
    have : a ∈ ({s₀, s₁} : Finset ℝ²) := by
      rw [← hset]
      simp
    simpa using this
  have hb : b = s₀ ∨ b = s₁ := by
    have : b ∈ ({s₀, s₁} : Finset ℝ²) := by
      rw [← hset]
      simp
    simpa using this
  rcases ha with ha | ha <;> rcases hb with hb | hb
  · exact False.elim (hab (ha.trans hb.symm))
  · exact Or.inl ⟨ha, hb⟩
  · exact Or.inr ⟨ha, hb⟩
  · exact False.elim (hab (ha.trans hb.symm))

private theorem nonempty_threeWayCnfPacket_of_positions
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (boundary : CanonicalAllOneBoundaryFrame profile)
    (orbit : CanonicalAllOneCnfOrbit)
    (hhub : boundary.boundaryPoint orbit.hubIndex = star.hub.1)
    (hspokes :
      ({boundary.boundaryPoint orbit.spoke₀Index,
          boundary.boundaryPoint orbit.spoke₁Index} : Finset ℝ²) =
        {star.spoke₁.1, star.spoke₂.1}) :
    Nonempty (CanonicalAllOneThreeWayCnfPacket H profile star hall) := by
  classical
  have hspokeIndicesNe : orbit.spoke₀Index ≠ orbit.spoke₁Index := by
    cases orbit <;> decide
  have hspokePointsNe :
      boundary.boundaryPoint orbit.spoke₀Index ≠
        boundary.boundaryPoint orbit.spoke₁Index :=
    boundary.boundaryPoint_injective.ne hspokeIndicesNe
  have halign := ordered_spoke_alignment hspokePointsNe hspokes
  let actualSupport : Fin 13 → Finset ℝ² := fun i ↦
    (H.selectedAt (boundary.boundaryPoint i)
      (boundary.boundaryPoint_mem_A i)).toCriticalFourShell.support
  have hone : ∀ i : Fin 13, i ∈ strictPhysicalIndices13 →
      (physicalVertices profile ∩ actualSupport i).card = 1 := by
    intro i hi
    let q : PhysicalVertex profile :=
      ⟨boundary.boundaryPoint i,
        (boundary.boundaryPoint_mem_physicalVertices_iff i).2 hi⟩
    simpa [actualSupport, q] using hall q
  rcases halign with hdirect | hswap
  · let cover₀ : ∀ center : Fin 13,
        CnfDeletionCoverRow D.A (boundary.boundaryPoint center)
          (boundary.boundaryPoint orbit.hubIndex)
          (boundary.boundaryPoint orbit.spoke₀Index) := fun center ↦
      Classical.choice <| nonempty_cnfDeletionCoverRow <| by
        simpa only [hhub, hdirect.1] using
          star.hub_spoke₁_cover _ (boundary.boundaryPoint_mem_A center)
    let cover₁ : ∀ center : Fin 13,
        CnfDeletionCoverRow D.A (boundary.boundaryPoint center)
          (boundary.boundaryPoint orbit.hubIndex)
          (boundary.boundaryPoint orbit.spoke₁Index) := fun center ↦
      Classical.choice <| nonempty_cnfDeletionCoverRow <| by
        simpa only [hhub, hdirect.2] using
          star.hub_spoke₂_cover _ (boundary.boundaryPoint_mem_A center)
    exact ⟨{
      boundary := boundary
      orbit := orbit
      hub_position := hhub
      spoke_positions := hspokes
      cover_alignment := Or.inl hdirect
      actualSupport := actualSupport
      actualSupport_eq := fun _ ↦ rfl
      strict_actual_rows_one_hit := hone
      cover₀ := cover₀
      cover₁ := cover₁ }⟩
  · let cover₀ : ∀ center : Fin 13,
        CnfDeletionCoverRow D.A (boundary.boundaryPoint center)
          (boundary.boundaryPoint orbit.hubIndex)
          (boundary.boundaryPoint orbit.spoke₀Index) := fun center ↦
      Classical.choice <| nonempty_cnfDeletionCoverRow <| by
        simpa only [hhub, hswap.1] using
          star.hub_spoke₂_cover _ (boundary.boundaryPoint_mem_A center)
    let cover₁ : ∀ center : Fin 13,
        CnfDeletionCoverRow D.A (boundary.boundaryPoint center)
          (boundary.boundaryPoint orbit.hubIndex)
          (boundary.boundaryPoint orbit.spoke₁Index) := fun center ↦
      Classical.choice <| nonempty_cnfDeletionCoverRow <| by
        simpa only [hhub, hswap.2] using
          star.hub_spoke₁_cover _ (boundary.boundaryPoint_mem_A center)
    exact ⟨{
      boundary := boundary
      orbit := orbit
      hub_position := hhub
      spoke_positions := hspokes
      cover_alignment := Or.inr hswap
      actualSupport := actualSupport
      actualSupport_eq := fun _ ↦ rfl
      strict_actual_rows_one_hit := hone
      cover₀ := cover₀
      cover₁ := cover₁ }⟩

/-- Complete three-way classification in the original canonical cyclic frame.
No physical-role reflection is used in this theorem. -/
theorem nonempty_canonicalAllOneThreeWayCnfPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (hcard : D.A.card = 13) :
    Nonempty (CanonicalAllOneThreeWayCnfPacket H profile star hall) := by
  rcases nonempty_canonicalAllOneBoundaryFrame Q profile hcard with ⟨boundary⟩
  rcases hub_index_cases boundary star with hleft | hmiddle | hright
  · exact nonempty_threeWayCnfPacket_of_positions star hall boundary
      .hubLeft (by simpa using hleft)
      (by simpa using spokes_eq_remaining_of_hub_one boundary star hleft)
  · exact nonempty_threeWayCnfPacket_of_positions star hall boundary
      .hubMiddle (by simpa using hmiddle)
      (by simpa using spokes_eq_remaining_of_hub_two boundary star hmiddle)
  · exact nonempty_threeWayCnfPacket_of_positions star hall boundary
      .hubRight (by simpa using hright)
      (by simpa using spokes_eq_remaining_of_hub_three boundary star hright)

#print axioms nonempty_canonicalAllOneBoundaryFrame
#print axioms nonempty_canonicalAllOneHubOrbitPacket
#print axioms nonempty_canonicalAllOneThreeWayCnfPacket
#print axioms CanonicalAllOneHubOrbitPacket.actualSupport_eq_fixedH

end

end ATailExactFiveCard13AllOneOrbitNormalizationScratch
end Problem97
