/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenThreeRowsTightAdapter
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenUncoveredStrictInterior
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenCenter9K4RowDomain
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBranchIngress
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer

/-!
# Raw-label ingress for the exact-thirteen CardGe arm

The live CardGe packet is stated with points of `D.A`, whereas finite cell
consumers work with the injective `Fin 13` chart in
`ExactThirteenBranchIngress`.  This file supplies the source-faithful inverse
image bridge.  The large-interior `2+3` split is imported from the
strict-interior producer, which retains both per-row lower bounds as well as
the union lower bound.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open CardGeThirteenCenter9K4RowDomain
open DRExactThirteenValuation
open ExactThirteenBranchIngress

attribute [local instance] Classical.propDecidable

namespace ExactThirteenBranchIngress

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- The raw labels whose boundary points lie in a physical support. -/
noncomputable def rawSupportPreimage
    (P : ExactThirteenBranchIngress S) (U : Finset ℝ²) : Finset (Fin 13) :=
  Finset.univ.filter (fun i => P.pt i ∈ U)

/-- Every physical subset of the carrier is exactly the image of its raw
preimage. -/
theorem rawSupportPreimage_image_eq
    (P : ExactThirteenBranchIngress S) {U : Finset ℝ²}
    (hU : U ⊆ D.A) :
    (rawSupportPreimage P U).image P.pt = U := by
  classical
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    exact (Finset.mem_filter.mp hi).2
  · intro hx
    have hximage : x ∈ Finset.univ.image P.pt := by
      rw [P.labelMap.image_eq]
      exact hU hx
    rcases Finset.mem_image.mp hximage with ⟨i, hi, hix⟩
    exact Finset.mem_image.mpr
      ⟨i, Finset.mem_filter.mpr ⟨hi, hix.symm ▸ hx⟩, hix⟩

/-- Cardinalities are preserved when a support is pulled back to raw labels. -/
theorem rawSupportPreimage_card_eq
    (P : ExactThirteenBranchIngress S) {U : Finset ℝ²}
    (hU : U ⊆ D.A) :
    (rawSupportPreimage P U).card = U.card := by
  classical
  calc
    (rawSupportPreimage P U).card =
        ((rawSupportPreimage P U).image P.pt).card := by
      rw [Finset.card_image_of_injective _ P.labelMap.injective]
    _ = U.card := congrArg Finset.card (rawSupportPreimage_image_eq P hU)

/-- A carrier point has a raw label, with no fixed-label assumption. -/
theorem exists_raw_label
    (P : ExactThirteenBranchIngress S) {x : ℝ²}
    (hx : x ∈ D.A) : ∃ i : Fin 13, P.pt i = x := by
  classical
  have hximage : x ∈ Finset.univ.image P.pt := by
    rw [P.labelMap.image_eq]
    exact hx
  rcases Finset.mem_image.mp hximage with ⟨i, _, hix⟩
  exact ⟨i, hix⟩

/-- Disjoint physical supports have disjoint raw preimages. -/
theorem rawSupportPreimage_disjoint
    (P : ExactThirteenBranchIngress S) {U V : Finset ℝ²}
    (hUV : Disjoint U V) :
    Disjoint (rawSupportPreimage P U) (rawSupportPreimage P V) := by
  classical
  refine Finset.disjoint_left.2 ?_
  intro i hiU hiV
  exact Finset.disjoint_left.1 hUV
    (Finset.mem_filter.mp hiU).2 (Finset.mem_filter.mp hiV).2

/-- Disjointness can also be transported from arbitrary raw supports once
their images are known.  This is useful when a tight packet is consumed after
its supports have been packaged into a larger structure. -/
theorem rawSupport_disjoint_of_image_eq
    (P : ExactThirteenBranchIngress S) {U V : Finset ℝ²}
    {I J : Finset (Fin 13)}
    (hI : I.image P.pt = U) (hJ : J.image P.pt = V)
    (hUV : Disjoint U V) : Disjoint I J := by
  classical
  refine Finset.disjoint_left.2 ?_
  intro i hiI hiJ
  apply Finset.disjoint_left.1 hUV
  · rw [← hI]
    exact Finset.mem_image.mpr ⟨i, hiI, rfl⟩
  · rw [← hJ]
    exact Finset.mem_image.mpr ⟨i, hiJ, rfl⟩

/-- An injective raw chart reflects equality of finite supports from equality
of their images. -/
theorem raw_eq_of_image_eq
    (P : ExactThirteenBranchIngress S) {I J : Finset (Fin 13)}
    (hIJ : I.image P.pt = J.image P.pt) : I = J := by
  classical
  ext i
  constructor
  · intro hi
    have himage : P.pt i ∈ J.image P.pt := by
      rw [← hIJ]
      exact Finset.mem_image.mpr ⟨i, hi, rfl⟩
    rcases Finset.mem_image.mp himage with ⟨j, hj, hji⟩
    have hji' : j = i := P.labelMap.injective hji
    simpa [hji'] using hj
  · intro hi
    have himage : P.pt i ∈ I.image P.pt := by
      rw [hIJ]
      exact Finset.mem_image.mpr ⟨i, hi, rfl⟩
    rcases Finset.mem_image.mp himage with ⟨j, hj, hji⟩
    have hji' : j = i := P.labelMap.injective hji
    simpa [hji'] using hj

/-- Pulling back two supports commutes with intersection, provided the raw
supports and the raw chart interval have their exact image identities. -/
theorem raw_intersection_image_eq_of_image_eq
    (P : ExactThirteenBranchIngress S)
    {I U : Finset (Fin 13)} {X Y : Finset ℝ²}
    (hI : I.image P.pt = X) (hU : U.image P.pt = Y) :
    (I ∩ U).image P.pt = X ∩ Y := by
  classical
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    exact Finset.mem_inter.mpr ⟨by
      rw [← hI]
      exact Finset.mem_image.mpr ⟨i, (Finset.mem_inter.mp hi).1, rfl⟩, by
      rw [← hU]
      exact Finset.mem_image.mpr ⟨i, (Finset.mem_inter.mp hi).2, rfl⟩⟩
  · intro hx
    have hxI : x ∈ I.image P.pt := by
      rw [hI]
      exact (Finset.mem_inter.mp hx).1
    have hxU : x ∈ U.image P.pt := by
      rw [hU]
      exact (Finset.mem_inter.mp hx).2
    rcases Finset.mem_image.mp hxI with ⟨i, hi, hxi⟩
    rcases Finset.mem_image.mp hxU with ⟨j, hj, hxj⟩
    have hij : i = j := P.labelMap.injective (hxi.trans hxj.symm)
    exact Finset.mem_image.mpr
      ⟨i, Finset.mem_inter.mpr ⟨hi, hij ▸ hj⟩, hxi⟩

/-- Exact physical images also preserve intersection cardinality. -/
theorem raw_intersection_card_eq_of_image_eq
    (P : ExactThirteenBranchIngress S)
    {I J : Finset (Fin 13)} {X Y : Finset ℝ²}
    (hI : I.image P.pt = X) (hJ : J.image P.pt = Y) :
    (I ∩ J).card = (X ∩ Y).card := by
  classical
  calc
    (I ∩ J).card = ((I ∩ J).image P.pt).card := by
      rw [Finset.card_image_of_injective _ P.labelMap.injective]
    _ = (X ∩ Y).card := congrArg Finset.card
      (raw_intersection_image_eq_of_image_eq P hI hJ)

/-- The intersection card and exact partition transport used by the live I2
consumer.  The physical `2+3` facts are premises here; no fixed raw labels or
unpublished large-arm lower bound is inferred. -/
theorem raw_two_three_partition_of_physical
    (P : ExactThirteenBranchIngress S)
    {Kraw Lraw I2raw : Finset (Fin 13)}
    {K L I2 : Finset ℝ²}
    (hK : Kraw.image P.pt = K) (hL : Lraw.image P.pt = L)
    (hI2 : I2raw.image P.pt = I2)
    (hpart : (K ∩ I2) ∪ (L ∩ I2) = I2)
    (hKtwo : (K ∩ I2).card = 2)
    (hLthree : (L ∩ I2).card = 3) :
    (Kraw ∩ I2raw).image P.pt = K ∩ I2 ∧
      (Lraw ∩ I2raw).image P.pt = L ∩ I2 ∧
      (Kraw ∩ I2raw).card = 2 ∧
      (Lraw ∩ I2raw).card = 3 ∧
      (Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw) = I2raw := by
  classical
  have hKinter : (Kraw ∩ I2raw).image P.pt = K ∩ I2 := by
    exact raw_intersection_image_eq_of_image_eq P hK hI2
  have hLinter : (Lraw ∩ I2raw).image P.pt = L ∩ I2 := by
    exact raw_intersection_image_eq_of_image_eq P hL hI2
  have hKcard : (Kraw ∩ I2raw).card = 2 := by
    calc
      (Kraw ∩ I2raw).card = ((Kraw ∩ I2raw).image P.pt).card := by
        rw [Finset.card_image_of_injective _ P.labelMap.injective]
      _ = (K ∩ I2).card := congrArg Finset.card hKinter
      _ = 2 := hKtwo
  have hLcard : (Lraw ∩ I2raw).card = 3 := by
    calc
      (Lraw ∩ I2raw).card = ((Lraw ∩ I2raw).image P.pt).card := by
        rw [Finset.card_image_of_injective _ P.labelMap.injective]
      _ = (L ∩ I2).card := congrArg Finset.card hLinter
      _ = 3 := hLthree
  have hrawpart : (Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw) = I2raw := by
    apply raw_eq_of_image_eq P
    calc
      ((Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw)).image P.pt =
          (Kraw ∩ I2raw).image P.pt ∪ (Lraw ∩ I2raw).image P.pt := by
        rw [Finset.image_union]
      _ = (K ∩ I2) ∪ (L ∩ I2) := by rw [hKinter, hLinter]
      _ = I2 := hpart
      _ = I2raw.image P.pt := hI2.symm
  exact ⟨hKinter, hLinter, hKcard, hLcard, hrawpart⟩

/-- Symmetric form of `raw_two_three_partition_of_physical`.  The live
`hlarge` route determines the two slice cards only up to swapping the named
outer rows, so this interface does not silently choose an orientation. -/
theorem raw_two_three_partition_of_physical_unordered
    (P : ExactThirteenBranchIngress S)
    {Kraw Lraw I2raw : Finset (Fin 13)}
    {K L I2 : Finset ℝ²}
    (hK : Kraw.image P.pt = K) (hL : Lraw.image P.pt = L)
    (hI2 : I2raw.image P.pt = I2)
    (hpart : (K ∩ I2) ∪ (L ∩ I2) = I2)
    (horient :
      ((K ∩ I2).card = 2 ∧ (L ∩ I2).card = 3) ∨
        ((K ∩ I2).card = 3 ∧ (L ∩ I2).card = 2)) :
    (Kraw ∩ I2raw).image P.pt = K ∩ I2 ∧
      (Lraw ∩ I2raw).image P.pt = L ∩ I2 ∧
      (((Kraw ∩ I2raw).card = 2 ∧ (Lraw ∩ I2raw).card = 3) ∨
        ((Kraw ∩ I2raw).card = 3 ∧ (Lraw ∩ I2raw).card = 2)) ∧
      (Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw) = I2raw := by
  classical
  rcases horient with ⟨hKtwo, hLthree⟩ | ⟨hKthree, hLtwo⟩
  · rcases raw_two_three_partition_of_physical P hK hL hI2 hpart hKtwo hLthree with
      ⟨hKinter, hLinter, hKcard, hLcard, hrawpart⟩
    exact ⟨hKinter, hLinter, Or.inl ⟨hKcard, hLcard⟩, hrawpart⟩
  · have hpart_swapped : (L ∩ I2) ∪ (K ∩ I2) = I2 := by
      calc
        (L ∩ I2) ∪ (K ∩ I2) = (K ∩ I2) ∪ (L ∩ I2) := Finset.union_comm _ _
        _ = I2 := hpart
    rcases raw_two_three_partition_of_physical P hL hK hI2 hpart_swapped hLtwo hKthree with
      ⟨hLinter, hKinter, hLcard, hKcard, hrawpart_swapped⟩
    have hrawpart : (Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw) = I2raw := by
      calc
        (Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw) =
            (Lraw ∩ I2raw) ∪ (Kraw ∩ I2raw) := Finset.union_comm _ _
        _ = I2raw := hrawpart_swapped
    exact ⟨hKinter, hLinter, Or.inr ⟨hKcard, hLcard⟩, hrawpart⟩

/-- Source-labelled exact-thirteen form of the large-interior `2+3` split.
The raw supports remain variable: this packet records their exact physical
images and does not identify them with any hard-coded finite cell. -/
structure ExactThirteenRawTwoThreePartition
    (P : ExactThirteenBranchIngress S) (K L : Finset ℝ²) : Type where
  profile_eq_secondOpposite : P.profile = .secondOpposite
  Kraw : Finset (Fin 13)
  Lraw : Finset (Fin 13)
  I2raw : Finset (Fin 13)
  I2raw_eq : I2raw = secondOppositeInterior P.profile
  Kraw_image : Kraw.image P.pt = K
  Lraw_image : Lraw.image P.pt = L
  I2raw_image : I2raw.image P.pt = S.oppInterior2
  Kraw_inter_image :
    (Kraw ∩ I2raw).image P.pt = K ∩ S.oppInterior2
  Lraw_inter_image :
    (Lraw ∩ I2raw).image P.pt = L ∩ S.oppInterior2
  slice_cards :
    ((Kraw ∩ I2raw).card = 2 ∧ (Lraw ∩ I2raw).card = 3) ∨
      ((Kraw ∩ I2raw).card = 3 ∧ (Lraw ∩ I2raw).card = 2)
  slice_partition : (Kraw ∩ I2raw) ∪ (Lraw ∩ I2raw) = I2raw

/-- The exact-tight large-interior packet supplies every physical premise of
`raw_two_three_partition_of_physical_unordered`.  Hence the arbitrary profile
ingress is forced to `.secondOpposite`, and its raw I2 interval is partitioned
by the two named rows with cardinalities `2+3`, up to swapping. -/
noncomputable def raw_two_three_partition_of_exactThirteen_largeInterior
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (P : ExactThirteenBranchIngress S)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    ExactThirteenRawTwoThreePartition P firstRow.support secondRow.support := by
  classical
  obtain ⟨hprofile, horient⟩ :=
    Problem97.ATailFrontierLiveClosure.exactThirteen_secondOpposite_largeInterior_two_three
      P Q hdisjoint
  let Kraw := rawSupportPreimage P firstRow.support
  let Lraw := rawSupportPreimage P secondRow.support
  let I2raw := secondOppositeInterior P.profile
  have hK : Kraw.image P.pt = firstRow.support := by
    exact rawSupportPreimage_image_eq P firstRow.support_subset_A
  have hL : Lraw.image P.pt = secondRow.support := by
    exact rawSupportPreimage_image_eq P secondRow.support_subset_A
  have hI2 : I2raw.image P.pt = S.oppInterior2 := by
    exact secondOppositeInterior_image_eq P.labelMap P.profile_spec
  have hpart :
      (firstRow.support ∩ S.oppInterior2) ∪
          (secondRow.support ∩ S.oppInterior2) = S.oppInterior2 := by
    apply Finset.eq_of_subset_of_card_le
    · intro x hx
      rcases Finset.mem_union.mp hx with hx | hx
      · exact (Finset.mem_inter.mp hx).2
      · exact (Finset.mem_inter.mp hx).2
    · have hs := P.profile_spec
      rw [hprofile] at hs
      have hI2card := hs.2.2
      have hlarge := Q.largeInterior
      omega
  rcases raw_two_three_partition_of_physical_unordered P hK hL hI2 hpart horient with
    ⟨hKinter, hLinter, hcards, hrawpart⟩
  exact {
    profile_eq_secondOpposite := hprofile
    Kraw := Kraw
    Lraw := Lraw
    I2raw := I2raw
    I2raw_eq := rfl
    Kraw_image := hK
    Lraw_image := hL
    I2raw_image := hI2
    Kraw_inter_image := hKinter
    Lraw_inter_image := hLinter
    slice_cards := hcards
    slice_partition := hrawpart }

/-- Raw version of the exact three-row cover. -/
structure CardGeThirteenExact13RawTightSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S) : Type where
  zraw : Fin 13
  zraw_image : P.pt zraw = Q.z
  C0raw : Finset (Fin 13)
  C1raw : Finset (Fin 13)
  Kraw : Finset (Fin 13)
  C0raw_image : C0raw.image P.pt = Q.W.row₁.support
  C1raw_image : C1raw.image P.pt = Q.W.row₂.support
  Kraw_image : Kraw.image P.pt = Q.thirdRow.support
  C0raw_card : C0raw.card = 4
  C1raw_card : C1raw.card = 4
  Kraw_card : Kraw.card = 4
  raw_disjoint_C0_C1 : Disjoint C0raw C1raw
  raw_disjoint_C0_K : Disjoint C0raw Kraw
  raw_disjoint_C1_K : Disjoint C1raw Kraw
  raw_cover : (C0raw ∪ C1raw) ∪ Kraw = Finset.univ.erase zraw
  carrier_card : D.A.card = 13

/-- Construct the exact raw partition directly from the provenance-preserving
tight outcome.  The only geometric inputs are its cover, disjointness, and
the selected-four support fields. -/
noncomputable def raw_tight_support_of_exact_cover
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (hdisj01 : Disjoint Q.W.row₁.support Q.W.row₂.support)
    (hdisj0K : Disjoint Q.W.row₁.support Q.thirdRow.support)
    (hdisj1K : Disjoint Q.W.row₂.support Q.thirdRow.support)
    (hcover : D.A = insert Q.z ((Q.W.row₁.support ∪ Q.W.row₂.support) ∪
      Q.thirdRow.support))
    (hcard13 : D.A.card = 13) :
    CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q P := by
  classical
  have hnonempty : Nonempty
      (CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q P) := by
    have hzA : Q.z ∈ D.A := by
      rcases Finset.mem_union.mp Q.z_mem_rows with hz | hz
      · exact firstRow.support_subset_A hz
      · exact secondRow.support_subset_A hz
    have hzchoice : Nonempty { zraw : Fin 13 // P.pt zraw = Q.z } := by
      obtain ⟨zraw, hzraw⟩ := exists_raw_label P hzA
      exact ⟨⟨zraw, hzraw⟩⟩
    let zraw : Fin 13 := (Classical.choice hzchoice).val
    have hzraw : P.pt zraw = Q.z := (Classical.choice hzchoice).property
    let C0raw := rawSupportPreimage P Q.W.row₁.support
    let C1raw := rawSupportPreimage P Q.W.row₂.support
    let Kraw := rawSupportPreimage P Q.thirdRow.support
    have hC0image : C0raw.image P.pt = Q.W.row₁.support := by
      exact rawSupportPreimage_image_eq P Q.W.row₁.support_subset_A
    have hC1image : C1raw.image P.pt = Q.W.row₂.support := by
      exact rawSupportPreimage_image_eq P Q.W.row₂.support_subset_A
    have hKimage : Kraw.image P.pt = Q.thirdRow.support := by
      exact rawSupportPreimage_image_eq P Q.thirdRow.support_subset_A
    have hC0card : C0raw.card = 4 := by
      rw [rawSupportPreimage_card_eq P Q.W.row₁.support_subset_A]
      exact Q.W.row₁.support_card
    have hC1card : C1raw.card = 4 := by
      rw [rawSupportPreimage_card_eq P Q.W.row₂.support_subset_A]
      exact Q.W.row₂.support_card
    have hKcard : Kraw.card = 4 := by
      rw [rawSupportPreimage_card_eq P Q.thirdRow.support_subset_A]
      exact Q.thirdRow.support_card
    have hd01 : Disjoint C0raw C1raw := by
      exact rawSupportPreimage_disjoint P hdisj01
    have hd0K : Disjoint C0raw Kraw := by
      exact rawSupportPreimage_disjoint P hdisj0K
    have hd1K : Disjoint C1raw Kraw := by
      exact rawSupportPreimage_disjoint P hdisj1K
    have hraw_cover : (C0raw ∪ C1raw) ∪ Kraw =
        Finset.univ.erase zraw := by
      ext i
      constructor
      · intro hi
        have hi_union : P.pt i ∈ Q.W.row₁.support ∪
            Q.W.row₂.support ∪ Q.thirdRow.support := by
          rcases Finset.mem_union.mp hi with hi | hi
          · rcases Finset.mem_union.mp hi with hi | hi
            · exact Finset.mem_union.mpr
                (Or.inl (Finset.mem_union.mpr
                  (Or.inl (Finset.mem_filter.mp hi).2)))
            · exact Finset.mem_union.mpr
                (Or.inl (Finset.mem_union.mpr
                  (Or.inr (Finset.mem_filter.mp hi).2)))
          · exact Finset.mem_union.mpr (Or.inr (Finset.mem_filter.mp hi).2)
        have hne : i ≠ zraw := by
          intro hiz
          have hzrow : Q.z ∈ Q.W.row₁.support ∪ Q.W.row₂.support ∪
              Q.thirdRow.support := by
            simpa [hiz, hzraw] using hi_union
          rcases Finset.mem_union.mp hzrow with hz | hz
          · rcases Finset.mem_union.mp hz with hz | hz
            · exact Q.z_not_mem_row₁ hz
            · exact Q.z_not_mem_row₂ hz
          · exact Q.thirdRow_omits hz
        exact Finset.mem_erase.mpr ⟨hne, Finset.mem_univ _⟩
      · intro hi
        have hi_univ : i ∈ Finset.univ := Finset.mem_univ _
        have hi_ne : i ≠ zraw := (Finset.mem_erase.mp hi).1
        have hiA : P.pt i ∈ D.A := by
          rw [← P.labelMap.image_eq]
          exact Finset.mem_image.mpr ⟨i, hi_univ, rfl⟩
        have hi_cover : P.pt i ∈ insert Q.z
            (Q.W.row₁.support ∪ Q.W.row₂.support ∪ Q.thirdRow.support) := by
          rw [← hcover]
          exact hiA
        rcases Finset.mem_insert.mp hi_cover with hzi | hi_rows
        · have hiz : i = zraw := P.labelMap.injective (hzi.trans hzraw.symm)
          exact False.elim (hi_ne hiz)
        · rcases Finset.mem_union.mp hi_rows with hi | hi
          · rcases Finset.mem_union.mp hi with hi | hi
            · exact Finset.mem_union.mpr (Or.inl
                (Finset.mem_union.mpr (Or.inl
                  (Finset.mem_filter.mpr ⟨hi_univ, hi⟩))))
            · exact Finset.mem_union.mpr (Or.inl
                (Finset.mem_union.mpr (Or.inr
                  (Finset.mem_filter.mpr ⟨hi_univ, hi⟩))))
          · exact Finset.mem_union.mpr (Or.inr
              (Finset.mem_filter.mpr ⟨hi_univ, hi⟩))
    exact ⟨{
      zraw := zraw
      zraw_image := hzraw
      C0raw := C0raw
      C1raw := C1raw
      Kraw := Kraw
      C0raw_image := hC0image
      C1raw_image := hC1image
      Kraw_image := hKimage
      C0raw_card := hC0card
      C1raw_card := hC1card
      Kraw_card := hKcard
      raw_disjoint_C0_C1 := hd01
      raw_disjoint_C0_K := hd0K
      raw_disjoint_C1_K := hd1K
      raw_cover := hraw_cover
      carrier_card := hcard13 }⟩
  exact Classical.choice hnonempty

/-- The named outer A2 row has a raw support containing the uncovered label
and disjoint from the raw third row. -/
structure CardGeThirteenRawOtherOuterSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q P) : Type where
  Lraw : Finset (Fin 13)
  Lraw_card : Lraw.card = 4
  Lraw_mem_zraw : T.zraw ∈ Lraw
  Lraw_disjoint_Kraw : Disjoint Lraw T.Kraw
  is_other :
    (Q.thirdRow = secondRow ∧ Lraw.image P.pt = firstRow.support) ∨
    (Q.thirdRow = firstRow ∧ Lraw.image P.pt = secondRow.support)

noncomputable def raw_other_outer_support_of_tight
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q P)
    (houter_disj : Disjoint firstRow.support secondRow.support) :
    CardGeThirteenRawOtherOuterSupport R surface firstRow secondRow Q P T := by
  classical
  have hnonempty : Nonempty
      (CardGeThirteenRawOtherOuterSupport R surface firstRow secondRow Q P T) := by
    rcases Q.thirdRow_named with h | h
    · let Lraw := rawSupportPreimage P firstRow.support
      have hLimage : Lraw.image P.pt = firstRow.support := by
        exact rawSupportPreimage_image_eq P firstRow.support_subset_A
      have hLcard : Lraw.card = 4 := by
        rw [rawSupportPreimage_card_eq P firstRow.support_subset_A]
        exact firstRow.support_card
      have hzL : T.zraw ∈ Lraw := by
        apply Finset.mem_filter.mpr
        refine ⟨Finset.mem_univ _, ?_⟩
        rw [T.zraw_image]
        exact h.1
      have hd : Disjoint Lraw T.Kraw := by
        exact rawSupport_disjoint_of_image_eq P hLimage T.Kraw_image
          (by simpa [h.2] using houter_disj)
      exact ⟨{
        Lraw := Lraw
        Lraw_card := hLcard
        Lraw_mem_zraw := hzL
        Lraw_disjoint_Kraw := hd
        is_other := Or.inl ⟨h.2, hLimage⟩ }⟩
    · let Lraw := rawSupportPreimage P secondRow.support
      have hLimage : Lraw.image P.pt = secondRow.support := by
        exact rawSupportPreimage_image_eq P secondRow.support_subset_A
      have hLcard : Lraw.card = 4 := by
        rw [rawSupportPreimage_card_eq P secondRow.support_subset_A]
        exact secondRow.support_card
      have hzL : T.zraw ∈ Lraw := by
        apply Finset.mem_filter.mpr
        refine ⟨Finset.mem_univ _, ?_⟩
        rw [T.zraw_image]
        exact h.1
      have hd : Disjoint Lraw T.Kraw := by
        exact rawSupport_disjoint_of_image_eq P hLimage T.Kraw_image
          (by simpa [h.2] using houter_disj.symm)
      exact ⟨{
        Lraw := Lraw
        Lraw_card := hLcard
        Lraw_mem_zraw := hzL
        Lraw_disjoint_Kraw := hd
        is_other := Or.inr ⟨h.2, hLimage⟩ }⟩
  exact Classical.choice hnonempty

/-- An outside source cannot lie in the exact first-apex class.  This public
wrapper packages the source-side fact needed when transporting the W-source
conditions to raw labels. -/
theorem source_not_mem_firstApexClass_of_mem_outside
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : source ∈ outsideFirstApexFiber R) :
    source.1 ∉ SelectedClass D.A S.oppApex1 radius := by
  intro hclass
  have hcenter :
      (lateFirstApexSystem R).centerAt source.1 source.2 = S.oppApex1 :=
    (lateFirstApexSystem_centerAt_eq_iff_mem_class R
      (source := source.1) source.2).mpr hclass
  exact
    (ATailExactFourRobustCapExpansion.outsideFirstApexFiber_centerAt_ne_firstApex
      R hsource) hcenter

/-- Transport the preceding source exclusion through an exact raw support
image.  This is the small source-faithful lemma used to show that raw labels
of good outside sources are not in the first-apex support. -/
theorem raw_label_not_mem_of_goodOutsideSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (P : ExactThirteenBranchIngress S)
    {Traw : Finset (Fin 13)}
    (hTimage : Traw.image P.pt = SelectedClass D.A S.oppApex1 radius)
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : source ∈ goodOutsideSources R)
    {i : Fin 13} (hpt : P.pt i = source.1) :
    i ∉ Traw := by
  classical
  have hgood : source ∈ outsideFirstApexFiber R \ badOutsideSources R := by
    simpa [goodOutsideSources] using hsource
  have houtside : source ∈ outsideFirstApexFiber R :=
    (Finset.mem_sdiff.mp hgood).1
  have hnot : source.1 ∉ SelectedClass D.A S.oppApex1 radius :=
    source_not_mem_firstApexClass_of_mem_outside R houtside
  intro hi
  apply hnot
  have himage : P.pt i ∈ Traw.image P.pt :=
    Finset.mem_image.mpr ⟨i, hi, rfl⟩
  rw [hTimage] at himage
  simpa [hpt] using himage

/-- Global `K4` can be invoked at any raw carrier label.  This is the
source-uniform row constructor needed by finite cell enumerators. -/
theorem exists_K4_row_at_raw_label
    (D : CounterexampleData) {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S) (i : Fin 13) :
    Nonempty (SelectedFourClass D.A (P.pt i)) := by
  apply exists_selectedFourClass_of_globalK4 D.K4
  rw [← P.labelMap.image_eq]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

/-- A source-selected four-class transported into the actual positional
boundary chart.  Both the raw-label support and its physical image are retained
so a finite classifier cannot silently replace the source row by an arbitrary
hard-coded support. -/
structure PositionalFourSupportRow
    (P : ExactThirteenBranchIngress S) (rawCenter : Fin 13)
    (physicalSupport : Finset ℝ²) (rowRadius : ℝ) : Type where
  rawSupport : Finset (Fin 13)
  support : Finset (Fin 13)
  physicalSupport_subset : physicalSupport ⊆ D.A
  rawSupport_image : rawSupport.image P.pt = physicalSupport
  support_eq : support = rawSupport.image P.idx
  card_eq_four : support.card = 4
  center_not_mem : P.idx rawCenter ∉ support
  radius_pos : 0 < rowRadius
  support_eq_radius : ∀ i ∈ support,
    dist (P.φ (P.idx rawCenter)) (P.φ i) = rowRadius
  equalDistances :
    RowDistancesEqual P.φ (P.idx rawCenter) support

/-- Transport one actual selected row through the source-entitled direct or
mirror index.  This is the metric-row ingress needed by an orientation-
parametric finite classifier; it makes no fixed-label occurrence claim. -/
noncomputable def positionalFourSupportRow_of_selected
    (P : ExactThirteenBranchIngress S) (rawCenter : Fin 13)
    (K : SelectedFourClass D.A (P.pt rawCenter)) :
    PositionalFourSupportRow P rawCenter K.support K.radius := by
  classical
  let rawSupport := rawSupportPreimage P K.support
  let support := rawSupport.image P.idx
  have hrawImage : rawSupport.image P.pt = K.support := by
    exact rawSupportPreimage_image_eq P K.support_subset_A
  have hsupportCard : support.card = 4 := by
    calc
      support.card = rawSupport.card := by
        rw [Finset.card_image_of_injective _
          P.boundaryEnumeration.idx_injective]
      _ = K.support.card :=
        rawSupportPreimage_card_eq P K.support_subset_A
      _ = 4 := K.support_card
  have hcenterNot : P.idx rawCenter ∉ support := by
    intro hcenter
    rcases Finset.mem_image.mp hcenter with ⟨j, hj, hjc⟩
    have hj_eq : j = rawCenter :=
      P.boundaryEnumeration.idx_injective hjc
    apply K.center_not_mem
    have hjK : P.pt j ∈ K.support := (Finset.mem_filter.mp hj).2
    simpa [hj_eq] using hjK
  have hsupportEq : ∀ i ∈ support,
      dist (P.φ (P.idx rawCenter)) (P.φ i) = K.radius := by
    intro i hi
    rcases Finset.mem_image.mp hi with ⟨ri, hri, hri_eq⟩
    have hriK : P.pt ri ∈ K.support := (Finset.mem_filter.mp hri).2
    calc
      dist (P.φ (P.idx rawCenter)) (P.φ i) =
          dist (P.pt rawCenter) (P.pt ri) := by
        rw [P.boundaryEnumeration.pt_eq rawCenter,
          P.boundaryEnumeration.pt_eq ri, hri_eq]
      _ = K.radius := K.support_eq_radius (P.pt ri) hriK
  have hequal : RowDistancesEqual P.φ (P.idx rawCenter) support := by
    intro u hu v hv
    exact (hsupportEq u hu).trans (hsupportEq v hv).symm
  exact {
    rawSupport := rawSupport
    support := support
    physicalSupport_subset := K.support_subset_A
    rawSupport_image := hrawImage
    support_eq := rfl
    card_eq_four := hsupportCard
    center_not_mem := hcenterNot
    radius_pos := K.radius_pos
    support_eq_radius := hsupportEq
    equalDistances := hequal }

/-- Transport a selected row whose physical center is identified with the
chosen raw center.  Unlike rewriting the selected-row structure itself, this
keeps its support and radius definitionally visible to downstream packets. -/
noncomputable def positionalFourSupportRow_of_selected_of_center_eq
    (P : ExactThirteenBranchIngress S) (rawCenter : Fin 13)
    {physicalCenter : ℝ²} (K : SelectedFourClass D.A physicalCenter)
    (hcenter : P.pt rawCenter = physicalCenter) :
    PositionalFourSupportRow P rawCenter K.support K.radius := by
  subst physicalCenter
  exact positionalFourSupportRow_of_selected P rawCenter K

/-- Positional support membership is exactly physical support membership under
the source boundary map. -/
theorem PositionalFourSupportRow.mem_support_iff
    (P : ExactThirteenBranchIngress S)
    {rawCenter : Fin 13} {physicalSupport : Finset ℝ²} {rowRadius : ℝ}
    (V : PositionalFourSupportRow P rawCenter physicalSupport rowRadius)
    (i : Fin 13) :
    i ∈ V.support ↔ P.φ i ∈ physicalSupport := by
  classical
  constructor
  · intro hi
    rw [V.support_eq] at hi
    rcases Finset.mem_image.mp hi with ⟨j, hj, hji⟩
    have hjPhysical : P.pt j ∈ physicalSupport := by
      rw [← V.rawSupport_image]
      exact Finset.mem_image.mpr ⟨j, hj, rfl⟩
    simpa [P.boundaryEnumeration.pt_eq j, hji] using hjPhysical
  · intro hi
    have hiRaw : P.φ i ∈ V.rawSupport.image P.pt := by
      rw [V.rawSupport_image]
      exact hi
    rcases Finset.mem_image.mp hiRaw with ⟨j, hj, hji⟩
    have hidx : P.idx j = i := by
      apply P.boundaryEnumeration.injective
      calc
        P.φ (P.idx j) = P.pt j :=
          (P.boundaryEnumeration.pt_eq j).symm
        _ = P.φ i := hji
    rw [V.support_eq]
    exact Finset.mem_image.mpr ⟨j, hj, hidx⟩

/-- Every point of the positional exact-thirteen boundary belongs to the
physical carrier. -/
theorem positional_point_mem_carrier
    (P : ExactThirteenBranchIngress S) (i : Fin 13) : P.φ i ∈ D.A := by
  classical
  have hsurj : Function.Surjective P.idx :=
    Finite.injective_iff_surjective.mp P.boundaryEnumeration.idx_injective
  obtain ⟨j, hj⟩ := hsurj i
  rw [← P.labelMap.image_eq]
  apply Finset.mem_image.mpr
  refine ⟨j, Finset.mem_univ _, ?_⟩
  rw [P.boundaryEnumeration.pt_eq j, hj]

/-- If the retained physical support is the full selected class at the row's
radius, positional membership is equivalent to the exact distance equality.
This is the source bridge for PIQD off-support exclusions. -/
theorem PositionalFourSupportRow.mem_support_iff_distance_eq
    (P : ExactThirteenBranchIngress S)
    {rawCenter : Fin 13} {physicalSupport : Finset ℝ²} {rowRadius : ℝ}
    (V : PositionalFourSupportRow P rawCenter physicalSupport rowRadius)
    (hfull : physicalSupport =
      SelectedClass D.A (P.pt rawCenter) rowRadius)
    (i : Fin 13) :
    i ∈ V.support ↔
      dist (P.φ (P.idx rawCenter)) (P.φ i) = rowRadius := by
  rw [PositionalFourSupportRow.mem_support_iff P V i, hfull, mem_selectedClass]
  have hiA := positional_point_mem_carrier P i
  simpa [hiA, P.boundaryEnumeration.pt_eq rawCenter]

/-- Global `K4` supplies a source-faithful positional row at every raw carrier
label, in whichever direct or mirror orientation the exact-thirteen ingress
actually realizes. -/
theorem exists_positionalFourSupportRow_at_raw_label
    (D : CounterexampleData) {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S) (i : Fin 13) :
    ∃ K : SelectedFourClass D.A (P.pt i),
      Nonempty (PositionalFourSupportRow P i K.support K.radius) := by
  obtain ⟨K⟩ := exists_K4_row_at_raw_label D P i
  exact ⟨K, ⟨positionalFourSupportRow_of_selected P i K⟩⟩

/-- Lift the named W witnesses, their actual blockers, and the common
frontier deletion to raw labels.  The theorem keeps the source-side good
membership and deletion omissions as explicit conjuncts while also exposing
the raw deletion omission from both W rows. -/
theorem exists_raw_goodSourceWitness_labels
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q P) :
    ∃ is₁ is₂ ib₁ ib₂ id : Fin 13,
      P.pt is₁ = Q.W.source₁.1 ∧
      P.pt is₂ = Q.W.source₂.1 ∧
      P.pt ib₁ = (lateFirstApexSystem R).centerAt
        Q.W.source₁.1 Q.W.source₁.2 ∧
      P.pt ib₂ = (lateFirstApexSystem R).centerAt
        Q.W.source₂.1 Q.W.source₂.2 ∧
      P.pt id = Q.W.deleted ∧
      is₁ ≠ is₂ ∧ ib₁ ≠ ib₂ ∧
      is₁ ∈ T.C0raw ∧ is₂ ∈ T.C1raw ∧
      id ∉ T.C0raw ∧ id ∉ T.C1raw ∧
      Q.W.source₁ ∈ goodOutsideSources R ∧
      Q.W.source₂ ∈ goodOutsideSources R ∧
      (Q.W.deleted ∉ Q.W.row₁.support) ∧
      (Q.W.deleted ∉ Q.W.row₂.support) := by
  classical
  have hs₁A : Q.W.source₁.1 ∈ D.A := Q.W.source₁.2
  have hs₂A : Q.W.source₂.1 ∈ D.A := Q.W.source₂.2
  have hb₁A :
      (lateFirstApexSystem R).centerAt Q.W.source₁.1 Q.W.source₁.2 ∈ D.A := by
    exact (Finset.mem_erase.mp ((lateFirstApexSystem R).selectedAt
      Q.W.source₁.1 Q.W.source₁.2 |>.toCriticalFourShell.center_mem)).2
  have hb₂A :
      (lateFirstApexSystem R).centerAt Q.W.source₂.1 Q.W.source₂.2 ∈ D.A := by
    exact (Finset.mem_erase.mp ((lateFirstApexSystem R).selectedAt
      Q.W.source₂.1 Q.W.source₂.2 |>.toCriticalFourShell.center_mem)).2
  have hdA : Q.W.deleted ∈ D.A := by
    rcases Q.W.deleted_is_frontier with hq | hw
    · simpa [hq] using F.pair.q_mem_A
    · simpa [hw] using F.pair.w_mem_A
  obtain ⟨is₁, h_is₁⟩ := exists_raw_label P hs₁A
  obtain ⟨is₂, h_is₂⟩ := exists_raw_label P hs₂A
  obtain ⟨ib₁, h_ib₁⟩ := exists_raw_label P hb₁A
  obtain ⟨ib₂, h_ib₂⟩ := exists_raw_label P hb₂A
  obtain ⟨id, h_id⟩ := exists_raw_label P hdA
  have hsourcePts : Q.W.source₁.1 ≠ Q.W.source₂.1 := by
    intro h
    apply Q.W.sources_ne
    exact Subtype.ext h
  have his : is₁ ≠ is₂ := by
    intro h
    apply hsourcePts
    exact h_is₁.symm.trans ((congrArg P.pt h).trans h_is₂)
  have hib : ib₁ ≠ ib₂ := by
    intro h
    apply Q.W.blockers_ne
    exact h_ib₁.symm.trans ((congrArg P.pt h).trans h_ib₂)
  have hsource₁row : Q.W.source₁.1 ∈ Q.W.row₁.support :=
    (lateFirstApexSystem R).source_mem_selectedFourClass
      Q.W.source₁.1 Q.W.source₁.2 Q.W.row₁
  have hsource₂row : Q.W.source₂.1 ∈ Q.W.row₂.support :=
    (lateFirstApexSystem R).source_mem_selectedFourClass
      Q.W.source₂.1 Q.W.source₂.2 Q.W.row₂
  have hisC0 : is₁ ∈ T.C0raw := by
    have himage : P.pt is₁ ∈ T.C0raw.image P.pt := by
      rw [T.C0raw_image]
      simpa [h_is₁] using hsource₁row
    rcases Finset.mem_image.mp himage with ⟨j, hj, hji⟩
    have hji' : j = is₁ := P.labelMap.injective hji
    simpa [hji'] using hj
  have hisC1 : is₂ ∈ T.C1raw := by
    have himage : P.pt is₂ ∈ T.C1raw.image P.pt := by
      rw [T.C1raw_image]
      simpa [h_is₂] using hsource₂row
    rcases Finset.mem_image.mp himage with ⟨j, hj, hji⟩
    have hji' : j = is₂ := P.labelMap.injective hji
    simpa [hji'] using hj
  have hidC0 : id ∉ T.C0raw := by
    intro h
    apply Q.W.deleted_not_mem_row₁
    have himage : P.pt id ∈ Q.W.row₁.support := by
      rw [← T.C0raw_image]
      exact Finset.mem_image.mpr ⟨id, h, rfl⟩
    simpa [h_id] using himage
  have hidC1 : id ∉ T.C1raw := by
    intro h
    apply Q.W.deleted_not_mem_row₂
    have himage : P.pt id ∈ Q.W.row₂.support := by
      rw [← T.C1raw_image]
      exact Finset.mem_image.mpr ⟨id, h, rfl⟩
    simpa [h_id] using himage
  exact ⟨is₁, is₂, ib₁, ib₂, id, h_is₁, h_is₂, h_ib₁, h_ib₂, h_id,
    his, hib, hisC0, hisC1, hidC0, hidC1, Q.W.source₁_mem_good, Q.W.source₂_mem_good,
    Q.W.deleted_not_mem_row₁, Q.W.deleted_not_mem_row₂⟩

/- The raw deletion label is also located relative to the exact first-apex
class and the tight three-way cover.  This is kept separate from the named
source witness theorem so consumers that only need the deletion do not have
to unpack the source and blocker labels. -/
theorem exists_raw_deleted_label_with_firstApex_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q P) :
    ∃ id : Fin 13, ∃ Traw : Finset (Fin 13),
      P.pt id = Q.W.deleted ∧
      Traw.image P.pt = SelectedClass D.A S.oppApex1 radius ∧
      id ∈ Traw ∧
      (id = T.zraw ∨ id ∈ T.Kraw) := by
  classical
  have hclassSub : SelectedClass D.A S.oppApex1 radius ⊆ D.A := by
    intro x hx
    exact (mem_selectedClass.mp hx).1
  let Traw : Finset (Fin 13) :=
    rawSupportPreimage P (SelectedClass D.A S.oppApex1 radius)
  have hTimage : Traw.image P.pt = SelectedClass D.A S.oppApex1 radius := by
    exact rawSupportPreimage_image_eq P hclassSub
  have hdeletedClass : Q.W.deleted ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases Q.W.deleted_is_frontier with hq | hw
    · simpa [hq] using frontier_pair_q_mem_firstApexClass F
    · simpa [hw] using frontier_pair_w_mem_firstApexClass F
  have hdA : Q.W.deleted ∈ D.A := (mem_selectedClass.mp hdeletedClass).1
  obtain ⟨id, h_id⟩ := exists_raw_label P hdA
  have hidT : id ∈ Traw := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    simpa [Traw, h_id] using hdeletedClass
  have hidC0 : id ∉ T.C0raw := by
    intro h
    apply Q.W.deleted_not_mem_row₁
    have himage : P.pt id ∈ Q.W.row₁.support := by
      rw [← T.C0raw_image]
      exact Finset.mem_image.mpr ⟨id, h, rfl⟩
    simpa [h_id] using himage
  have hidC1 : id ∉ T.C1raw := by
    intro h
    apply Q.W.deleted_not_mem_row₂
    have himage : P.pt id ∈ Q.W.row₂.support := by
      rw [← T.C1raw_image]
      exact Finset.mem_image.mpr ⟨id, h, rfl⟩
    simpa [h_id] using himage
  have hidZorK : id = T.zraw ∨ id ∈ T.Kraw := by
    by_cases hz : id = T.zraw
    · exact Or.inl hz
    · have hErase : id ∈ Finset.univ.erase T.zraw :=
        Finset.mem_erase.mpr ⟨hz, Finset.mem_univ _⟩
      have hCover : id ∈ (T.C0raw ∪ T.C1raw) ∪ T.Kraw := by
        rw [T.raw_cover]
        exact hErase
      rcases Finset.mem_union.mp hCover with h01 | hK
      · rcases Finset.mem_union.mp h01 with h0 | h1
        · exact False.elim (hidC0 h0)
        · exact False.elim (hidC1 h1)
      · exact Or.inr hK
  exact ⟨id, Traw, h_id, hTimage, hidT, hidZorK⟩

/-- The exact first-apex class also has a raw support.  The two distinguished
interior points lift to distinct labels in the repaired I1 interval. -/
theorem raw_firstApex_support_with_interior_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (P : ExactThirteenBranchIngress S) :
    ∃ Traw : Finset (Fin 13), ∃ iq iw : Fin 13,
      Traw.image P.pt = SelectedClass D.A S.oppApex1 radius ∧
      Traw.card = 4 ∧
      P.pt iq = R.interior_q ∧ P.pt iw = R.interior_w ∧
      iq ∈ Traw ∩ firstOppositeInterior P.profile ∧
      iw ∈ Traw ∩ firstOppositeInterior P.profile ∧
      iq ≠ iw ∧
      2 ≤ (Traw ∩ firstOppositeInterior P.profile).card := by
  classical
  let Traw := rawSupportPreimage P (SelectedClass D.A S.oppApex1 radius)
  have hTsub : SelectedClass D.A S.oppApex1 radius ⊆ D.A := by
    intro x hx
    exact (mem_selectedClass.mp hx).1
  have hTimage : Traw.image P.pt = SelectedClass D.A S.oppApex1 radius := by
    exact rawSupportPreimage_image_eq P hTsub
  have hTcard : Traw.card = 4 := by
    rw [rawSupportPreimage_card_eq P hTsub]
    exact R.class_card_eq_four
  have hqI : R.interior_q ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using
      (Finset.mem_inter.mp R.interior_q_mem).2
  have hwI : R.interior_w ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using
      (Finset.mem_inter.mp R.interior_w_mem).2
  have hqImg : R.interior_q ∈
      (firstOppositeInterior P.profile).image P.pt := by
    rw [firstOppositeInterior_image_eq P.labelMap P.profile_spec]
    exact hqI
  have hwImg : R.interior_w ∈
      (firstOppositeInterior P.profile).image P.pt := by
    rw [firstOppositeInterior_image_eq P.labelMap P.profile_spec]
    exact hwI
  rcases Finset.mem_image.mp hqImg with ⟨iq, hiq, hptq⟩
  rcases Finset.mem_image.mp hwImg with ⟨iw, hiw, hptw⟩
  have hTq : iq ∈ Traw := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hptq.symm ▸
      (Finset.mem_inter.mp R.interior_q_mem).1⟩
  have hTw : iw ∈ Traw := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hptw.symm ▸
      (Finset.mem_inter.mp R.interior_w_mem).1⟩
  have hne : iq ≠ iw := by
    intro heq
    apply R.interior_q_ne_w
    exact hptq.symm.trans ((congrArg P.pt heq).trans hptw)
  have hsubset : ({iq, iw} : Finset (Fin 13)) ⊆
      Traw ∩ firstOppositeInterior P.profile := by
    intro i hi
    rcases Finset.mem_insert.mp hi with rfl | hi
    · exact Finset.mem_inter.mpr ⟨hTq, hiq⟩
    · have : i = iw := by simpa using hi
      subst i
      exact Finset.mem_inter.mpr ⟨hTw, hiw⟩
  have hpaircard : ({iq, iw} : Finset (Fin 13)).card = 2 := by
    simp [hne]
  refine ⟨Traw, iq, iw, hTimage, hTcard, hptq, hptw, ?_, ?_, hne, ?_⟩
  · exact Finset.mem_inter.mpr ⟨hTq, hiq⟩
  · exact Finset.mem_inter.mpr ⟨hTw, hiw⟩
  · calc
      2 = ({iq, iw} : Finset (Fin 13)).card := hpaircard.symm
      _ ≤ (Traw ∩ firstOppositeInterior P.profile).card :=
        Finset.card_le_card hsubset

/-- The five actual source rows available in the exact-thirteen branch,
transported into the source boundary's positional coordinates.  Their centers
and supports remain variable; this is the source-faithful input to a finite
occurrence classifier, not an assertion of the special `FixedFiveRows` cell. -/
structure ExactThirteenFivePositionalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S) : Type where
  blocker₁ : Fin 13
  blocker₂ : Fin 13
  blocker₁_image : P.pt blocker₁ =
    (lateFirstApexSystem R).centerAt Q.W.source₁.1 Q.W.source₁.2
  blocker₂_image : P.pt blocker₂ =
    (lateFirstApexSystem R).centerAt Q.W.source₂.1 Q.W.source₂.2
  blockers_ne : blocker₁ ≠ blocker₂
  blocker₁_ne_secondApex : blocker₁ ≠ secondApex
  blocker₂_ne_secondApex : blocker₂ ≠ secondApex
  blocker₁_ne_firstApex : blocker₁ ≠ firstApex
  blocker₂_ne_firstApex : blocker₂ ≠ firstApex
  sourceRow₁ :
    PositionalFourSupportRow P blocker₁ Q.W.row₁.support Q.W.row₁.radius
  sourceRow₂ :
    PositionalFourSupportRow P blocker₂ Q.W.row₂.support Q.W.row₂.radius
  secondApexRow₁ :
    PositionalFourSupportRow P secondApex firstRow.support firstRow.radius
  secondApexRow₂ :
    PositionalFourSupportRow P secondApex secondRow.support secondRow.radius
  firstApexRow :
    PositionalFourSupportRow P firstApex
      (SelectedClass D.A S.oppApex1 radius) radius

/-- Construct the five-row positional packet from the actual selected rows.
The only finite center facts fixed here are the two apex labels; the two
source-blocker centers are represented by their uniquely transported raw
labels and are proved distinct. -/
theorem nonempty_exactThirteenFivePositionalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S) :
    Nonempty
      (ExactThirteenFivePositionalRows R firstRow secondRow Q P) := by
  classical
  have hb₁A :
      (lateFirstApexSystem R).centerAt Q.W.source₁.1 Q.W.source₁.2 ∈ D.A := by
    exact (Finset.mem_erase.mp ((lateFirstApexSystem R).selectedAt
      Q.W.source₁.1 Q.W.source₁.2 |>.toCriticalFourShell.center_mem)).2
  have hb₂A :
      (lateFirstApexSystem R).centerAt Q.W.source₂.1 Q.W.source₂.2 ∈ D.A := by
    exact (Finset.mem_erase.mp ((lateFirstApexSystem R).selectedAt
      Q.W.source₂.1 Q.W.source₂.2 |>.toCriticalFourShell.center_mem)).2
  obtain ⟨ib₁, hib₁⟩ := exists_raw_label P hb₁A
  obtain ⟨ib₂, hib₂⟩ := exists_raw_label P hb₂A
  have hib_ne : ib₁ ≠ ib₂ := by
    intro h
    apply Q.W.blockers_ne
    exact hib₁.symm.trans ((congrArg P.pt h).trans hib₂)
  have hib₁_ne_second : ib₁ ≠ secondApex := by
    intro h
    apply surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) Q.W.source₁.1 Q.W.source₁.2
    exact hib₁.symm.trans
      ((congrArg P.pt h).trans P.labelMap.secondApex_eq)
  have hib₂_ne_second : ib₂ ≠ secondApex := by
    intro h
    apply surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) Q.W.source₂.1 Q.W.source₂.2
    exact hib₂.symm.trans
      ((congrArg P.pt h).trans P.labelMap.secondApex_eq)
  have hsource₁Outside : Q.W.source₁ ∈ outsideFirstApexFiber R := by
    have hgood :
        Q.W.source₁ ∈ outsideFirstApexFiber R \ badOutsideSources R := by
      simpa [goodOutsideSources] using Q.W.source₁_mem_good
    exact (Finset.mem_sdiff.mp hgood).1
  have hsource₂Outside : Q.W.source₂ ∈ outsideFirstApexFiber R := by
    have hgood :
        Q.W.source₂ ∈ outsideFirstApexFiber R \ badOutsideSources R := by
      simpa [goodOutsideSources] using Q.W.source₂_mem_good
    exact (Finset.mem_sdiff.mp hgood).1
  have hib₁_ne_first : ib₁ ≠ firstApex := by
    intro h
    apply
      (ATailExactFourRobustCapExpansion.outsideFirstApexFiber_centerAt_ne_firstApex
        R hsource₁Outside)
    exact hib₁.symm.trans
      ((congrArg P.pt h).trans P.labelMap.firstApex_eq)
  have hib₂_ne_first : ib₂ ≠ firstApex := by
    intro h
    apply
      (ATailExactFourRobustCapExpansion.outsideFirstApexFiber_centerAt_ne_firstApex
        R hsource₂Outside)
    exact hib₂.symm.trans
      ((congrArg P.pt h).trans P.labelMap.firstApex_eq)
  exact ⟨{
    blocker₁ := ib₁
    blocker₂ := ib₂
    blocker₁_image := hib₁
    blocker₂_image := hib₂
    blockers_ne := hib_ne
    blocker₁_ne_secondApex := hib₁_ne_second
    blocker₂_ne_secondApex := hib₂_ne_second
    blocker₁_ne_firstApex := hib₁_ne_first
    blocker₂_ne_firstApex := hib₂_ne_first
    sourceRow₁ := positionalFourSupportRow_of_selected_of_center_eq
      P ib₁ Q.W.row₁ hib₁
    sourceRow₂ := positionalFourSupportRow_of_selected_of_center_eq
      P ib₂ Q.W.row₂ hib₂
    secondApexRow₁ :=
      positionalFourSupportRow_of_selected_of_center_eq
        P secondApex firstRow P.labelMap.secondApex_eq
    secondApexRow₂ :=
      positionalFourSupportRow_of_selected_of_center_eq
        P secondApex secondRow P.labelMap.secondApex_eq
    firstApexRow :=
      positionalFourSupportRow_of_selected_of_center_eq P firstApex
        (SelectedFourClass.ofSelectedClass
          (frontier_radius_pos F) R.class_card_eq_four)
        P.labelMap.firstApex_eq }⟩

/-- The first blocker row meets the first selected second-apex row in at most
two raw labels. -/
theorem fivePositionalRows_sourceRow₁_firstRow_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q P) :
    (V.sourceRow₁.rawSupport ∩ V.secondApexRow₁.rawSupport).card ≤ 2 := by
  calc
    (V.sourceRow₁.rawSupport ∩ V.secondApexRow₁.rawSupport).card =
        (Q.W.row₁.support ∩ firstRow.support).card :=
      raw_intersection_card_eq_of_image_eq P
        V.sourceRow₁.rawSupport_image
        V.secondApexRow₁.rawSupport_image
    _ ≤ 2 := Q.row₁_firstRow_inter_card_le_two

/-- The second blocker row meets the first selected second-apex row in at most
two raw labels. -/
theorem fivePositionalRows_sourceRow₂_firstRow_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q P) :
    (V.sourceRow₂.rawSupport ∩ V.secondApexRow₁.rawSupport).card ≤ 2 := by
  calc
    (V.sourceRow₂.rawSupport ∩ V.secondApexRow₁.rawSupport).card =
        (Q.W.row₂.support ∩ firstRow.support).card :=
      raw_intersection_card_eq_of_image_eq P
        V.sourceRow₂.rawSupport_image
        V.secondApexRow₁.rawSupport_image
    _ ≤ 2 := Q.row₂_firstRow_inter_card_le_two

/-- The first blocker row meets the second selected second-apex row in at most
two raw labels. -/
theorem fivePositionalRows_sourceRow₁_secondRow_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q P) :
    (V.sourceRow₁.rawSupport ∩ V.secondApexRow₂.rawSupport).card ≤ 2 := by
  calc
    (V.sourceRow₁.rawSupport ∩ V.secondApexRow₂.rawSupport).card =
        (Q.W.row₁.support ∩ secondRow.support).card :=
      raw_intersection_card_eq_of_image_eq P
        V.sourceRow₁.rawSupport_image
        V.secondApexRow₂.rawSupport_image
    _ ≤ 2 := Q.row₁_secondRow_inter_card_le_two

/-- The second blocker row meets the second selected second-apex row in at
most two raw labels. -/
theorem fivePositionalRows_sourceRow₂_secondRow_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q P) :
    (V.sourceRow₂.rawSupport ∩ V.secondApexRow₂.rawSupport).card ≤ 2 := by
  calc
    (V.sourceRow₂.rawSupport ∩ V.secondApexRow₂.rawSupport).card =
        (Q.W.row₂.support ∩ secondRow.support).card :=
      raw_intersection_card_eq_of_image_eq P
        V.sourceRow₂.rawSupport_image
        V.secondApexRow₂.rawSupport_image
    _ ≤ 2 := Q.row₂_secondRow_inter_card_le_two

/-- The first second-apex row is exact at its retained radius in positional
coordinates. -/
theorem fivePositionalRows_secondApexRow₁_mem_iff_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q.base P)
    (i : Fin 13) :
    i ∈ V.secondApexRow₁.support ↔
      dist (P.φ (P.idx secondApex)) (P.φ i) = firstRow.radius := by
  exact PositionalFourSupportRow.mem_support_iff_distance_eq P
    V.secondApexRow₁ (by
      simpa only [P.labelMap.secondApex_eq] using
        Q.firstRow_support_eq_selectedClass) i

/-- The second second-apex row is exact at its retained radius in positional
coordinates. -/
theorem fivePositionalRows_secondApexRow₂_mem_iff_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q.base P)
    (i : Fin 13) :
    i ∈ V.secondApexRow₂.support ↔
      dist (P.φ (P.idx secondApex)) (P.φ i) = secondRow.radius := by
  exact PositionalFourSupportRow.mem_support_iff_distance_eq P
    V.secondApexRow₂ (by
      simpa only [P.labelMap.secondApex_eq] using
        Q.secondRow_support_eq_selectedClass) i

/-- The retained first-apex row is exact at the original frontier radius in
positional coordinates. -/
theorem fivePositionalRows_firstApexRow_mem_iff_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q P)
    (i : Fin 13) :
    i ∈ V.firstApexRow.support ↔
      dist (P.φ (P.idx firstApex)) (P.φ i) = radius := by
  exact PositionalFourSupportRow.mem_support_iff_distance_eq P
    V.firstApexRow (by simp only [P.labelMap.firstApex_eq]) i

/-- The uncovered raw label belongs to the forced second-opposite raw
interval. -/
theorem exactThirteen_zraw_mem_I2raw
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (U : ExactThirteenRawTwoThreePartition P
      firstRow.support secondRow.support)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P) :
    T.zraw ∈ U.I2raw := by
  have himage : P.pt T.zraw ∈ U.I2raw.image P.pt := by
    rw [U.I2raw_image, T.zraw_image]
    exact Q.z_mem_oppInterior2
  rcases Finset.mem_image.mp himage with ⟨j, hj, hpt⟩
  have hj_eq : j = T.zraw := P.labelMap.injective hpt
  simpa [hj_eq] using hj

/-- In the forced second-opposite profile, the retained exact first-apex row
contains both raw labels `6` and `7`.  This discharges the literal retained-row
memberships used by the exact-13 PIQD base without assuming a direct boundary
orientation. -/
theorem exactThirteen_six_seven_mem_firstApexRawSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredThreeCenterPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (U : ExactThirteenRawTwoThreePartition P
      firstRow.support secondRow.support)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q P) :
    (6 : Fin 13) ∈ V.firstApexRow.rawSupport ∧
      (7 : Fin 13) ∈ V.firstApexRow.rawSupport := by
  obtain ⟨Traw, _iq, _iw, hTimage, _hTcard, _hptq, _hptw,
      _hiq, _hiw, _hne, htwo⟩ := raw_firstApex_support_with_interior_pair R P
  have hraw : Traw = V.firstApexRow.rawSupport :=
    raw_eq_of_image_eq P
      (hTimage.trans V.firstApexRow.rawSupport_image.symm)
  let I := firstOppositeInterior P.profile
  have hIcard : I.card = 2 := by
    dsimp [I]
    rw [U.profile_eq_secondOpposite]
    decide
  have hinter_subset : Traw ∩ I ⊆ I := Finset.inter_subset_right
  have hcard_le : I.card ≤ (Traw ∩ I).card := by
    calc
      I.card = 2 := hIcard
      _ ≤ (Traw ∩ I).card := by simpa [I] using htwo
  have hinter_eq : Traw ∩ I = I :=
    Finset.eq_of_subset_of_card_le hinter_subset hcard_le
  have h6I : (6 : Fin 13) ∈ I := by
    dsimp [I]
    rw [U.profile_eq_secondOpposite]
    decide
  have h7I : (7 : Fin 13) ∈ I := by
    dsimp [I]
    rw [U.profile_eq_secondOpposite]
    decide
  have h6T : (6 : Fin 13) ∈ Traw := by
    exact (Finset.mem_inter.mp (hinter_eq.symm ▸ h6I)).1
  have h7T : (7 : Fin 13) ∈ Traw := by
    exact (Finset.mem_inter.mp (hinter_eq.symm ▸ h7I)).1
  simpa [hraw] using And.intro h6T h7T

end ExactThirteenBranchIngress
end ATailFrontierLiveClosure
end Problem97
