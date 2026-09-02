/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveValuation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveProfile
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Boundary ingress of the D-R exact-12 valuation: the label-to-point map

Plan items P3.1 and P3.4b (label-map ingress) of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`.  The consumers are
the same-arc and five-point families of `DRExactTwelveValuation`
(`twoCircleSameArc_holds`, `fivePointCircleIsoscelesOrder_holds`), which read
a `ConvexBoundaryEnumeration pt φ idx`, and the packet families of P3.4b,
which read the encoder's labels on the carrier through a `LabelMap`.

## Interface

* `LabelMap S pt`: the encoder's labels read on the carrier of the packet
  `S`: `secondApex` (label `0`) is `S.oppApex2`, `firstApex` (label `1`) is
  `S.oppApex1`, `thirdApex` (label `2`) is `S.surplusApex`, and the three
  interior label lists `surplusInterior`, `firstOppositeInterior`,
  `secondOppositeInterior` land in the strict cap interiors
  `S.capInteriorByIndex S.surplusIdx`, `S.oppInterior1`, `S.oppInterior2`;
  `pt` is injective with image `D.A`.

## Theorems

* `exists_labelMap_boundaryEnumeration_of_profile`: from `D.A.card = 12` and
  the strict-interior profile `(3, 2, 4)`, a `LabelMap` together with a
  `ConvexBoundaryEnumeration` through `directIndex` or `mirrorIndex`.
* `exists_labelMap_boundaryEnumeration`: the same from the binders of the
  two-radius branch, through `exactTwelve_profile_of_twoRadiusBranch`.
* `LabelMap.image_surplusInterior`, `LabelMap.image_firstOppositeInterior`,
  `LabelMap.image_secondOppositeInterior`: with the interior cardinalities,
  each interior label list maps onto its strict cap interior.

## Construction

`ZeroCutBoundaryIndexing.exists_with_capBlocks D S` gives an injective CCW
enumeration `boundary : Fin n → ℝ²` of `D.A` with the surplus apex at index
`0`, the opposite apexes at indices `iv`, `iw`, and the three strict cap
interiors in the direct blocks `(0, iv)`, `(iv, iw)`, `(iw, n)` for
`I2, IS, I1` or the mirror blocks for `I1, IS, I2`.  Injectivity gives
`n = 12`; the interior cardinalities `4, 3, 2` leave no slack in the open
index intervals, so `(iv, iw) = (5, 9)` in the direct case and `(7, 3)` in
the mirror case, and every index of a block carries a point of its interior.
The label map is `pt := boundary ∘ directIndex` or `boundary ∘ mirrorIndex`,
so `pt_eq` is `rfl` and the label census is the block description read at
the label indices, decided on `Fin 12`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactTwelveValuation

open DRExactTwelveDimacs
open ATailApexRichClassStructure
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open Census554.CapSelectedGeometry

/- ## The label map -/

/-- The encoder's labels read on the carrier of the packet `S`: the three apex
labels name the apexes, the three interior label lists land in the strict cap
interiors, and the labelled points enumerate `D.A` without repetition. -/
structure LabelMap {D : CounterexampleData} (S : SurplusCapPacket D.A) (pt : Fin 12 → ℝ²) :
    Prop where
  secondApex_eq : pt (label secondApex) = S.oppApex2
  firstApex_eq : pt (label firstApex) = S.oppApex1
  thirdApex_eq : pt (label thirdApex) = S.surplusApex
  surplusInterior_mem : ∀ z ∈ surplusInterior, pt (label z) ∈ S.capInteriorByIndex S.surplusIdx
  firstOppositeInterior_mem : ∀ z ∈ firstOppositeInterior, pt (label z) ∈ S.oppInterior1
  secondOppositeInterior_mem : ∀ z ∈ secondOppositeInterior, pt (label z) ∈ S.oppInterior2
  injective : Function.Injective pt
  image_eq : Finset.univ.image pt = D.A

/- ## Blocks of an injective enumeration of `Fin 12` -/

/-- The points located in the open index interval `(a, b)` are images of that interval. -/
private theorem subset_image_Ioo {boundary : Fin 12 → ℝ²} {T : Finset ℝ²} {a b : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ q < b ∧ boundary q = x) :
    T ⊆ (Finset.Ioo a b).image boundary := by
  intro x hx
  obtain ⟨q, hq1, hq2, rfl⟩ := h x hx
  exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ⟨hq1, hq2⟩)

/-- The points located after the index `a` are images of the final interval. -/
private theorem subset_image_Ioi {boundary : Fin 12 → ℝ²} {T : Finset ℝ²} {a : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ boundary q = x) :
    T ⊆ (Finset.Ioi a).image boundary := by
  intro x hx
  obtain ⟨q, hq1, rfl⟩ := h x hx
  exact Finset.mem_image_of_mem _ (Finset.mem_Ioi.mpr hq1)

private theorem card_le_of_Ioo {boundary : Fin 12 → ℝ²} {T : Finset ℝ²} {a b : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ q < b ∧ boundary q = x) :
    T.card ≤ (b : ℕ) - a - 1 := by
  calc T.card ≤ ((Finset.Ioo a b).image boundary).card :=
        Finset.card_le_card (subset_image_Ioo h)
    _ ≤ (Finset.Ioo a b).card := Finset.card_image_le
    _ = (b : ℕ) - a - 1 := Fin.card_Ioo a b

private theorem card_le_of_Ioi {boundary : Fin 12 → ℝ²} {T : Finset ℝ²} {a : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ boundary q = x) : T.card ≤ 12 - 1 - (a : ℕ) := by
  calc T.card ≤ ((Finset.Ioi a).image boundary).card :=
        Finset.card_le_card (subset_image_Ioi h)
    _ ≤ (Finset.Ioi a).card := Finset.card_image_le
    _ = 12 - 1 - (a : ℕ) := Fin.card_Ioi a

/-- A block whose index set has no slack is hit at every index. -/
private theorem mem_of_subset_image {boundary : Fin 12 → ℝ²} (hinj : Function.Injective boundary)
    {T : Finset ℝ²} {Q : Finset (Fin 12)} (hsub : T ⊆ Q.image boundary) (hcard : Q.card ≤ T.card)
    {q : Fin 12} (hq : q ∈ Q) : boundary q ∈ T := by
  rw [Finset.eq_of_subset_of_card_le hsub
    (by rw [Finset.card_image_of_injective _ hinj]; exact hcard)]
  exact Finset.mem_image_of_mem _ hq

private theorem mem_of_Ioo {boundary : Fin 12 → ℝ²} (hinj : Function.Injective boundary)
    {T : Finset ℝ²} {a b : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ q < b ∧ boundary q = x)
    (hcard : (b : ℕ) - a - 1 ≤ T.card) {q : Fin 12} (hq1 : a < q) (hq2 : q < b) :
    boundary q ∈ T :=
  mem_of_subset_image hinj (subset_image_Ioo h) (by rw [Fin.card_Ioo]; exact hcard)
    (Finset.mem_Ioo.mpr ⟨hq1, hq2⟩)

private theorem mem_of_Ioi {boundary : Fin 12 → ℝ²} (hinj : Function.Injective boundary)
    {T : Finset ℝ²} {a : Fin 12} (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ boundary q = x)
    (hcard : 12 - 1 - (a : ℕ) ≤ T.card) {q : Fin 12} (hq : a < q) : boundary q ∈ T :=
  mem_of_subset_image hinj (subset_image_Ioi h) (by rw [Fin.card_Ioi]; exact hcard)
    (Finset.mem_Ioi.mpr hq)

/-- Precomposing with an injective self-map of `Fin 12` keeps the image of `univ`. -/
private theorem image_univ_comp {boundary : Fin 12 → ℝ²} {idx : Fin 12 → Fin 12}
    (hidx : Function.Injective idx) :
    Finset.univ.image (fun l => boundary (idx l)) = Finset.univ.image boundary :=
  calc Finset.univ.image (fun l => boundary (idx l))
      = (Finset.univ.image idx).image boundary :=
        (Finset.image_image (s := Finset.univ) (f := idx) (g := boundary)).symm
    _ = Finset.univ.image boundary := by
        rw [Finset.image_univ_of_surjective (Finite.injective_iff_surjective.mp hidx)]

/- ## The boundary ingress -/

/-- From `D.A.card = 12` and the strict-interior profile `(3, 2, 4)`: the label map and
its convex boundary enumeration, through `directIndex` or `mirrorIndex` according to the
block orientation of `ZeroCutBoundaryIndexing.exists_with_capBlocks`. -/
theorem exists_labelMap_boundaryEnumeration_of_profile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (hcard12 : D.A.card = 12)
    (h3 : (S.capInteriorByIndex S.surplusIdx).card = 3) (h2 : S.oppInterior1.card = 2)
    (h4 : S.oppInterior2.card = 4) :
    ∃ pt φ : Fin 12 → ℝ², ∃ idx : Fin 12 → Fin 12,
      LabelMap S pt ∧ ConvexBoundaryEnumeration pt φ idx := by
  obtain ⟨B, hn, iv, iw, hu, hv, hw, hblocks⟩ :=
    Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S
  obtain ⟨n, boundary, indexOf, hinj, himage, hccw, hidxinj, hpt⟩ := B
  dsimp only at hn iv iw hu hv hw hblocks
  have hn12 : n = 12 := by
    have h := Finset.card_image_of_injective Finset.univ hinj
    rw [himage, hcard12, Finset.card_univ, Fintype.card_fin] at h
    exact h.symm
  subst hn12
  rw [oppositeVertexByIndex_surplusIdx] at hu
  rw [oppositeVertexByIndex_oppIndex1] at hv
  rw [oppositeVertexByIndex_oppIndex2] at hw
  have hconv : ConvexIndep (Finset.univ.image boundary) := by
    rw [himage]
    exact D.convex
  have hz0 : zeroIndex hn = (0 : Fin 12) := rfl
  rcases hblocks with hd | hm
  · obtain ⟨-, hI2, hIS, hI1⟩ := hd
    rw [hz0] at hI2
    have c2 := card_le_of_Ioo hI2
    have cS := card_le_of_Ioo hIS
    have c1 := card_le_of_Ioi hI1
    rw [h4] at c2
    rw [h3] at cS
    rw [h2] at c1
    have hiv' : (iv : ℕ) = 5 := by omega
    have hiw' : (iw : ℕ) = 9 := by omega
    have hiv : iv = 5 := Fin.ext hiv'
    have hiw : iw = 9 := Fin.ext hiw'
    subst hiv
    subst hiw
    refine ⟨fun l => boundary (directIndex l), boundary, directIndex, ?_, ?_⟩
    · refine
        { secondApex_eq := ?_
          firstApex_eq := ?_
          thirdApex_eq := ?_
          surplusInterior_mem := ?_
          firstOppositeInterior_mem := ?_
          secondOppositeInterior_mem := ?_
          injective := hinj.comp directIndex_injective
          image_eq := (image_univ_comp directIndex_injective).trans himage }
      · have h9 : directIndex (label secondApex) = 9 := by decide
        rw [h9]
        exact hw
      · have h5 : directIndex (label firstApex) = 5 := by decide
        rw [h5]
        exact hv
      · rw [directIndex_thirdApex]
        exact hu
      · intro z hz
        simp only [surplusInterior, List.mem_cons, List.not_mem_nil, or_false] at hz
        rcases hz with rfl | rfl | rfl <;>
          exact mem_of_Ioo hinj hIS (by rw [h3]; decide) (by decide) (by decide)
      · intro z hz
        simp only [firstOppositeInterior, List.mem_cons, List.not_mem_nil, or_false] at hz
        rcases hz with rfl | rfl <;>
          exact mem_of_Ioi hinj hI1 (by rw [h2]; decide) (by decide)
      · intro z hz
        simp only [secondOppositeInterior, List.mem_cons, List.not_mem_nil, or_false] at hz
        rcases hz with rfl | rfl | rfl | rfl <;>
          exact mem_of_Ioo hinj hI2 (by rw [h4]; decide) (by decide) (by decide)
    · exact
        { injective := hinj
          ccw := hccw
          convexIndep := hconv
          pt_eq := fun _ => rfl
          orientation := Or.inl rfl }
  · obtain ⟨-, hI1, hIS, hI2⟩ := hm
    rw [hz0] at hI1
    have c1 := card_le_of_Ioo hI1
    have cS := card_le_of_Ioo hIS
    have c2 := card_le_of_Ioi hI2
    rw [h2] at c1
    rw [h3] at cS
    rw [h4] at c2
    have hiw' : (iw : ℕ) = 3 := by omega
    have hiv' : (iv : ℕ) = 7 := by omega
    have hiw : iw = 3 := Fin.ext hiw'
    have hiv : iv = 7 := Fin.ext hiv'
    subst hiw
    subst hiv
    refine ⟨fun l => boundary (mirrorIndex l), boundary, mirrorIndex, ?_, ?_⟩
    · refine
        { secondApex_eq := ?_
          firstApex_eq := ?_
          thirdApex_eq := ?_
          surplusInterior_mem := ?_
          firstOppositeInterior_mem := ?_
          secondOppositeInterior_mem := ?_
          injective := hinj.comp mirrorIndex_injective
          image_eq := (image_univ_comp mirrorIndex_injective).trans himage }
      · have h3' : mirrorIndex (label secondApex) = 3 := by decide
        rw [h3']
        exact hw
      · have h7 : mirrorIndex (label firstApex) = 7 := by decide
        rw [h7]
        exact hv
      · rw [mirrorIndex_thirdApex]
        exact hu
      · intro z hz
        simp only [surplusInterior, List.mem_cons, List.not_mem_nil, or_false] at hz
        rcases hz with rfl | rfl | rfl <;>
          exact mem_of_Ioo hinj hIS (by rw [h3]; decide) (by decide) (by decide)
      · intro z hz
        simp only [firstOppositeInterior, List.mem_cons, List.not_mem_nil, or_false] at hz
        rcases hz with rfl | rfl <;>
          exact mem_of_Ioo hinj hI1 (by rw [h2]; decide) (by decide) (by decide)
      · intro z hz
        simp only [secondOppositeInterior, List.mem_cons, List.not_mem_nil, or_false] at hz
        rcases hz with rfl | rfl | rfl | rfl <;>
          exact mem_of_Ioi hinj hI2 (by rw [h4]; decide) (by decide)
    · exact
        { injective := hinj
          ccw := hccw
          convexIndep := hconv
          pt_eq := fun _ => rfl
          orientation := Or.inr rfl }

/-- The label map and its convex boundary enumeration from the binders of the two-radius
branch at carrier cardinality twelve. -/
theorem exists_labelMap_boundaryEnumeration
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard12 : D.A.card = 12) :
    ∃ pt φ : Fin 12 → ℝ², ∃ idx : Fin 12 → Fin 12,
      LabelMap S pt ∧ ConvexBoundaryEnumeration pt φ idx := by
  obtain ⟨h3, h2, h4⟩ :=
    exactTwelve_profile_of_twoRadiusBranch R surface rho otherRadius firstRow secondRow
      hradii hfirstRadius hsecondRadius hcard12
  exact exists_labelMap_boundaryEnumeration_of_profile S hcard12 h3 h2 h4

/- ## The interior blocks map onto the interiors -/

/-- An injective label list of the right length that lands in `T` enumerates `T`. -/
private theorem image_toFinset_eq {pt : Fin 12 → ℝ²} (hinj : Function.Injective pt)
    {l : List ℕ} (hl : l.Nodup) (hlt : ∀ z ∈ l, z < 12) {T : Finset ℝ²}
    (hmem : ∀ z ∈ l, pt (label z) ∈ T) (hcard : T.card = l.length) :
    l.toFinset.image (fun z => pt (label z)) = T := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    obtain ⟨z, hz, rfl⟩ := Finset.mem_image.mp hx
    exact hmem z (List.mem_toFinset.mp hz)
  · rw [Finset.card_image_of_injOn, List.toFinset_card_of_nodup hl, hcard]
    intro x hx y hy hxy
    exact label_injective (hlt x (List.mem_toFinset.mp hx)) (hlt y (List.mem_toFinset.mp hy))
      (hinj hxy)

namespace LabelMap

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {pt : Fin 12 → ℝ²}

theorem image_surplusInterior (hL : LabelMap S pt)
    (h3 : (S.capInteriorByIndex S.surplusIdx).card = 3) :
    surplusInterior.toFinset.image (fun z => pt (label z)) =
      S.capInteriorByIndex S.surplusIdx :=
  image_toFinset_eq hL.injective (by decide) (by decide) hL.surplusInterior_mem h3

theorem image_firstOppositeInterior (hL : LabelMap S pt) (h2 : S.oppInterior1.card = 2) :
    firstOppositeInterior.toFinset.image (fun z => pt (label z)) = S.oppInterior1 :=
  image_toFinset_eq hL.injective (by decide) (by decide) hL.firstOppositeInterior_mem h2

theorem image_secondOppositeInterior (hL : LabelMap S pt) (h4 : S.oppInterior2.card = 4) :
    secondOppositeInterior.toFinset.image (fun z => pt (label z)) = S.oppInterior2 :=
  image_toFinset_eq hL.injective (by decide) (by decide) hL.secondOppositeInterior_mem h4

end LabelMap

end DRExactTwelveValuation
end ATailFrontierLiveClosure
end Problem97
