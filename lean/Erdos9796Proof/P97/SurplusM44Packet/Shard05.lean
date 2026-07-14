/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.SurplusM44Packet.Shard03

/-!
# `SurplusM44Packet` shard 05 (lines 5765-7222 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`NonSurplusMoserCapExcludes`.
Last decl:
`right_one_sided_obstruction_payload`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- The paired non-surplus exclusions needed by the Q-facing Moser row. -/
abbrev NonSurplusMoserCapExcludes
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (classify : S.NonSurplusMoserCapClassifies) : Prop :=
  S.MoserCapExcludesAt S.oppIndex1 classify.1 ∧
    S.MoserCapExcludesAt S.oppIndex2 classify.2

/-- The paired non-surplus form-level exclusions needed by the Q-facing Moser
row. -/
abbrev NonSurplusMoserCapFormExcludes
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.MoserCapExcludesFormAAt S.oppIndex1 ∧
    S.MoserCapExcludesFormBAt S.oppIndex1 ∧
    S.MoserCapExcludesFormCAt S.oppIndex1 ∧
    S.MoserCapExcludesFormAAt S.oppIndex2 ∧
    S.MoserCapExcludesFormBAt S.oppIndex2 ∧
    S.MoserCapExcludesFormCAt S.oppIndex2

/-- Build the paired non-surplus escaped-form classifiers from the paired
form trichotomies. -/
noncomputable def nonSurplusMoserCapClassifies_of_forms
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hforms : S.NonSurplusMoserCapForms) :
    S.NonSurplusMoserCapClassifies :=
  ⟨S.moserCapClassifiesAt_of_forms hforms.1,
    S.moserCapClassifiesAt_of_forms hforms.2⟩

/-- Pair the one-index `N4d` form assemblies for the two non-surplus caps. -/
theorem nonSurplusMoserCapExcludes_of_form_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hforms : S.NonSurplusMoserCapForms)
    (hexcludes : S.NonSurplusMoserCapFormExcludes) :
    S.NonSurplusMoserCapExcludes
      (S.nonSurplusMoserCapClassifies_of_forms hforms) := by
  constructor
  · exact S.moserCapExcludesAt_of_form_excludes hforms.1
      hexcludes.1 hexcludes.2.1 hexcludes.2.2.1
  · exact S.moserCapExcludesAt_of_form_excludes hforms.2
      hexcludes.2.2.2.1 hexcludes.2.2.2.2.1 hexcludes.2.2.2.2.2

/-- Non-surplus `N4c -> N4d -> N4e` assembly: once escaped Moser-centered
four-classes are classified and excluded for the two short caps, the
containment interface needed by the Moser-count consumer follows. -/
theorem nonSurplusMoserCapContainment_of_classifies_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (classify : S.NonSurplusMoserCapClassifies)
    (hexcludes : S.NonSurplusMoserCapExcludes classify) :
    S.NonSurplusMoserCapContainment := by
  constructor
  · intro radius hradius hcard
    by_contra hesc
    exact hexcludes.1 (radius := radius) hradius hcard hesc
  · intro radius hradius hcard
    by_contra hesc
    exact hexcludes.2 (radius := radius) hradius hcard hesc

/-- Non-surplus `N4c/N4d` form-level assembly: form trichotomies plus
form-level exclusions give the containment interface needed by the Moser-count
consumer. -/
theorem nonSurplusMoserCapContainment_of_forms_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hforms : S.NonSurplusMoserCapForms)
    (hexcludes : S.NonSurplusMoserCapFormExcludes) :
    S.NonSurplusMoserCapContainment :=
  S.nonSurplusMoserCapContainment_of_classifies_excludes
    (S.nonSurplusMoserCapClassifies_of_forms hforms)
    (S.nonSurplusMoserCapExcludes_of_form_excludes hforms hexcludes)

/-- In an `(m,4,4)` packet, convexity reduces non-surplus Moser-cap containment
to the six form-level exclusions. -/
theorem IsM44.nonSurplusMoserCapContainment_of_convexIndep_form_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    (hexcludes : S.NonSurplusMoserCapFormExcludes) :
    S.NonSurplusMoserCapContainment :=
  S.nonSurplusMoserCapContainment_of_forms_excludes
    (hM44.nonSurplusMoserCapForms_of_convexIndep hconv) hexcludes

/-- The Moser vertex opposite a cyclic cap index is an ambient point. -/
theorem oppositeVertexByIndex_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ A := by
  fin_cases i
  · simpa [oppositeVertexByIndex] using S.triangle.v1_mem
  · simpa [oppositeVertexByIndex] using S.triangle.v2_mem
  · simpa [oppositeVertexByIndex] using S.triangle.v3_mem

/-- Export a shared CCW boundary enumeration of `A` cut so that the surplus
apex is index zero.  This is the first geometric input for the P1 ordered
scaffold producer: subsequent interval exports locate the two opposite cap
interiors and the selected surplus triple in this same ambient order. -/
theorem exists_ccw_boundary_order_at_surplus_apex
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) :
    ∃ n : ℕ, ∃ hn : 0 < n, ∃ φ : Fin n → ℝ²,
      Function.Injective φ ∧
      Finset.univ.image φ = A ∧
      EuclideanGeometry.IsCcwConvexPolygon φ ∧
      φ (⟨0, hn⟩ : Fin n) =
        S.oppositeVertexByIndex S.surplusIdx := by
  have hncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    not_collinear_of_K4 hne hconv hK4
  rcases exists_isCcwConvexPolygon_of_convexIndep hconv hncol with
    ⟨n, hn3, φ, hφinj, hφimage, hccw⟩
  have hnpos : 0 < n := by omega
  have hupA : S.oppositeVertexByIndex S.surplusIdx ∈ A :=
    S.oppositeVertexByIndex_mem S.surplusIdx
  rcases exists_isCcwConvexPolygon_cyclicShift_at_zero hnpos hφinj
      hφimage hccw hupA with
    ⟨cut, hshiftInj, hshiftImage, hshiftCcw, hzero⟩
  exact
    ⟨n, hnpos, (fun t : Fin n => φ (t + cut)), hshiftInj, hshiftImage,
      hshiftCcw, hzero⟩

/-- Strengthened zero-cut boundary export that also names the two opposite
apex indices and records their dichotomy in the cut linear order.  The two
branches correspond to the direct right and direct left P1 hull-order
templates. -/
theorem exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) :
    ∃ n : ℕ, ∃ hn : 0 < n, ∃ φ : Fin n → ℝ², ∃ iv iw : Fin n,
      Function.Injective φ ∧
      Finset.univ.image φ = A ∧
      EuclideanGeometry.IsCcwConvexPolygon φ ∧
      φ (⟨0, hn⟩ : Fin n) =
        S.oppositeVertexByIndex S.surplusIdx ∧
      φ iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      φ iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (((⟨0, hn⟩ : Fin n) < iv ∧ iv < iw) ∨
        ((⟨0, hn⟩ : Fin n) < iw ∧ iw < iv)) := by
  rcases S.exists_ccw_boundary_order_at_surplus_apex hne hconv hK4 with
    ⟨n, hn, φ, hφinj, hφimage, hccw, hu⟩
  have hvA : S.oppositeVertexByIndex S.oppIndex1 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex1
  have hwA : S.oppositeVertexByIndex S.oppIndex2 ∈ A :=
    S.oppositeVertexByIndex_mem S.oppIndex2
  have hvImage :
      S.oppositeVertexByIndex S.oppIndex1 ∈ Finset.univ.image φ := by
    simpa [hφimage] using hvA
  have hwImage :
      S.oppositeVertexByIndex S.oppIndex2 ∈ Finset.univ.image φ := by
    simpa [hφimage] using hwA
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hiv, hv⟩
  rcases Finset.mem_image.mp hwImage with ⟨iw, _hiw, hw⟩
  have huv : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex1 :=
    S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1
  have huw : S.oppositeVertexByIndex S.surplusIdx ≠
      S.oppositeVertexByIndex S.oppIndex2 :=
    S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2
  have hvw : S.oppositeVertexByIndex S.oppIndex1 ≠
      S.oppositeVertexByIndex S.oppIndex2 :=
    S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have horder :=
    _root_.Problem97.image_index_order_dichotomy_after_zero hn (φ := φ)
      hu hv hw huv huw hvw
  exact
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccw, hu, hv, hw, horder⟩

/-- Global `K4` supplies the endpoint-style selector shape at any short indexed
cap. -/
theorem exists_moserSelectorShapeAt_of_hasNEquidistantProperty
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    ∃ radius : ℝ, 0 < radius ∧ S.MoserSelectorShapeAt i radius := by
  have hvA : S.oppositeVertexByIndex i ∈ A := S.oppositeVertexByIndex_mem i
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hvA with
    ⟨radius, hradius, hcard⟩
  exact ⟨radius, hradius,
    S.moserSelectorShapeAt_of_convexIndep hconv i hradius hcap hcard⟩

/-- In an `(m,4,4)` packet, global `K4` supplies selector shapes for the two
non-surplus short caps. -/
theorem IsM44.exists_nonSurplusMoserSelectorShapes
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hconv : ConvexIndep A) :
    ∃ radius1 radius2 : ℝ,
      0 < radius1 ∧ S.MoserSelectorShapeAt S.oppIndex1 radius1 ∧
      0 < radius2 ∧ S.MoserSelectorShapeAt S.oppIndex2 radius2 := by
  rcases S.exists_moserSelectorShapeAt_of_hasNEquidistantProperty hK4 hconv
      S.oppIndex1 hM44.oppIndex1_cap_card_eq_four with
    ⟨radius1, hradius1, hshape1⟩
  rcases S.exists_moserSelectorShapeAt_of_hasNEquidistantProperty hK4 hconv
      S.oppIndex2 hM44.oppIndex2_cap_card_eq_four with
    ⟨radius2, hradius2, hshape2⟩
  exact ⟨radius1, radius2, hradius1, hshape1, hradius2, hshape2⟩

/-- Under Moser-cap containment, a short cap is an exact Moser-centered
four-class. -/
theorem exact_cap_class_at_index_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.MoserCapContainmentAt i)
    (hcap : (S.capByIndex i).card = 4) :
    ∃ radius : ℝ, 0 < radius ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius = S.capByIndex i := by
  have hvA : S.oppositeVertexByIndex i ∈ A := S.oppositeVertexByIndex_mem i
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hvA with
    ⟨radius, hradius, hcard⟩
  have hsub : SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i :=
    hcontain hradius hcard
  have hcap_le : (S.capByIndex i).card ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card := by
    rw [hcap]
    exact hcard
  exact ⟨radius, hradius, Finset.eq_of_subset_of_card_le hsub hcap_le⟩

/-- An exact cap class survives erasing a strict interior point from a different
indexed cap. -/
theorem selectedClass_erase_card_eq_of_exact_cap_of_capInterior_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hxI : x ∈ S.capInteriorByIndex j) (hji : j ≠ i)
    (hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i) :
    (SelectedClass (A.erase x) (S.oppositeVertexByIndex i) radius).card =
      (S.capByIndex i).card := by
  have hxnot : x ∉ SelectedClass A (S.oppositeVertexByIndex i) radius := by
    intro hxsel
    have hxcap : x ∈ S.capByIndex i := by
      simpa [hexact] using hxsel
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hxI hji hxcap
  rw [selectedClass_erase_card_eq_of_not_mem hxnot, hexact]

/-- A four-point exact cap class remains a four-point selected class after
erasing a strict interior point from another indexed cap. -/
theorem four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hxI : x ∈ S.capInteriorByIndex j) (hji : j ≠ i)
    (hcap : (S.capByIndex i).card = 4)
    (hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i) :
    4 ≤ (SelectedClass (A.erase x) (S.oppositeVertexByIndex i) radius).card := by
  rw [S.selectedClass_erase_card_eq_of_exact_cap_of_capInterior_ne hxI hji hexact,
    hcap]

/-- Erasing a surplus-interior point preserves the exact short-cap witness at
the first non-surplus opposite Moser vertex. -/
theorem IsM44.exists_oppIndex1_erase_witness_of_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ radius : ℝ, 0 < radius ∧
      4 ≤ (SelectedClass (A.erase x)
        (S.oppositeVertexByIndex S.oppIndex1) radius).card := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨radius, hradius, hexact⟩
  exact ⟨radius, hradius,
    S.four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne hxI
      S.surplusIdx_ne_oppIndex1 hM44.oppIndex1_cap_card_eq_four hexact⟩

/-- Erasing a surplus-interior point preserves the exact short-cap witness at
the second non-surplus opposite Moser vertex. -/
theorem IsM44.exists_oppIndex2_erase_witness_of_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ radius : ℝ, 0 < radius ∧
      4 ≤ (SelectedClass (A.erase x)
        (S.oppositeVertexByIndex S.oppIndex2) radius).card := by
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨radius, hradius, hexact⟩
  exact ⟨radius, hradius,
    S.four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne hxI
      S.surplusIdx_ne_oppIndex2 hM44.oppIndex2_cap_card_eq_four hexact⟩

/-- Distance readout from an exact Moser-centered cap class. -/
theorem dist_opposite_eq_of_mem_capByIndex_of_exact
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ}
    (hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i)
    (hxcap : x ∈ S.capByIndex i) :
    dist (S.oppositeVertexByIndex i) x = radius := by
  have hxsel : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius := by
    rw [hexact]
    exact hxcap
  exact (mem_selectedClass.mp hxsel).2

/-- If a K4-sized selected class is contained in a four-point indexed cap, then
the two Moser endpoints of the cap lie on the queried selected radius. -/
theorem endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hsub : SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius ∧
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius := by
  have hcap_le : (S.capByIndex i).card ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card := by
    rw [hcap]
    exact hcard
  have hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i :=
    Finset.eq_of_subset_of_card_le hsub hcap_le
  constructor
  · have hdist :=
      S.dist_opposite_eq_of_mem_capByIndex_of_exact i hexact
        (S.leftOuterVertexByIndex_mem_capByIndex i)
    simpa [dist_comm] using hdist
  · have hdist :=
      S.dist_opposite_eq_of_mem_capByIndex_of_exact i hexact
        (S.rightOuterVertexByIndex_mem_capByIndex i)
    simpa [dist_comm] using hdist

/-- Moser-cap containment at a four-point cap supplies endpoint-radius
production at that indexed cap. -/
theorem endpointRadiusAt_of_moserCapContainmentAt_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcontain : S.MoserCapContainmentAt i)
    (hcap : (S.capByIndex i).card = 4) :
    S.EndpointRadiusAt i := by
  intro radius hradius hcard
  exact S.endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
    i (hcontain hradius hcard) hcap hcard

/-- Under the placement split, a K4-sized selected class at a four-point cap
either supplies endpoint-radius equalities or has a strict adjacent-cap escape. -/
theorem endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    (dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius ∧
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius) ∨
      S.StrictAdjacentEscapeAt i radius := by
  rcases S.containment_or_strictAdjacentEscapeAt_of_convexIndep
      hconv i hradius hcap hcard with hsub | hstrict
  · exact Or.inl
      (S.endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
        i hsub hcap hcard)
  · exact Or.inr hstrict

/-- No strict adjacent-cap escape implies endpoint-radius production at a
four-point indexed cap. -/
theorem endpointRadiusAt_of_noStrictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    (hno : S.NoStrictAdjacentEscapeAt i) :
    S.EndpointRadiusAt i := by
  intro radius hradius hcard
  rcases S.endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep
      hconv i hradius hcap hcard with hend | hstrict
  · exact hend
  · exact False.elim (hno hradius hcard hstrict)

/-- For a four-point indexed cap under convexity, endpoint-radius production is
equivalent to excluding the strict adjacent-cap escape branch. -/
theorem endpointRadiusAt_iff_noStrictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    S.EndpointRadiusAt i ↔ S.NoStrictAdjacentEscapeAt i :=
  ⟨S.noStrictAdjacentEscapeAt_of_endpointRadiusAt i,
    S.endpointRadiusAt_of_noStrictAdjacentEscapeAt_of_convexIndep
      hconv i hcap⟩

/-- A selected apex in a short cap of an `(m,4,4)` surplus packet.

The `cap_card` field records the local short-cap fact needed for the same-cap
one-hit bound.  In an `IsM44` packet this is supplied by choosing one of the two
non-surplus cap indices. -/
structure M44SelectedApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²) where
  radius : ℝ
  radius_pos : 0 < radius
  cap_mem : x ∈ S.capInteriorByIndex i
  cap_card : (S.capByIndex i).card = 4
  selected_card : 4 ≤ (SelectedClass A x radius).card

/-- A global `K4` hypothesis supplies the selected-apex packet at any point in a
short cap interior. -/
theorem M44SelectedApex.nonempty_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4) :
    Nonempty (M44SelectedApex S i x) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset i hxcap
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hxA with
    ⟨r, hr, hcard⟩
  exact ⟨{ radius := r
           radius_pos := hr
           cap_mem := hxcap
           cap_card := hcap
           selected_card := hcard }⟩

/-- A global `K4` hypothesis supplies a selected-apex packet in the first
non-surplus cap of an `IsM44` packet. -/
theorem M44SelectedApex.nonempty_oppIndex1_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.oppInterior1) :
    Nonempty (M44SelectedApex S S.oppIndex1 x) := by
  exact M44SelectedApex.nonempty_of_hasNEquidistantProperty hK4
    (by simpa [oppInterior1] using hxcap)
    hM44.oppIndex1_cap_card_eq_four

/-- A global `K4` hypothesis supplies a selected-apex packet in the second
non-surplus cap of an `IsM44` packet. -/
theorem M44SelectedApex.nonempty_oppIndex2_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.oppInterior2) :
    Nonempty (M44SelectedApex S S.oppIndex2 x) := by
  exact M44SelectedApex.nonempty_of_hasNEquidistantProperty hK4
    (by simpa [oppInterior2] using hxcap)
    hM44.oppIndex2_cap_card_eq_four

/-- Structural same-cap one-hit bound for a selected class centered at a point
in a short cap interior. -/
theorem sameCapCount_le_one_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²} (radius : ℝ)
    (hxcap : x ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4) :
    S.sameCapCount i x radius ≤ 1 := by
  have herase : ((S.capInteriorByIndex i).erase x).card = 1 := by
    rw [Finset.card_erase_of_mem hxcap,
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap]
  calc S.sameCapCount i x radius
      ≤ ((S.capInteriorByIndex i).erase x).card :=
        Finset.card_le_card Finset.inter_subset_right
    _ = 1 := herase

/-- The same-cap one-hit bound attached to an `M44SelectedApex`. -/
theorem M44SelectedApex.sameCapCount_le_one
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hx : M44SelectedApex S i x) :
    S.sameCapCount i x hx.radius ≤ 1 :=
  S.sameCapCount_le_one_of_cap_card_eq_four i hx.radius hx.cap_mem hx.cap_card

/- ## Packet-local incidence counts -/

/-- A selected same-radius class with at least four members contains a
four-point subpacket. -/
theorem exists_fourSubpacket_of_selected_card_ge_four
    {A : Finset ℝ²} {x : ℝ²} {radius : ℝ}
    (hcard : 4 ≤ (SelectedClass A x radius).card) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x radius ∧
      T.card = 4 := by
  classical
  rcases Finset.exists_subset_card_eq
      (s := SelectedClass A x radius) hcard with
    ⟨T, hTsub, hTcard⟩
  exact ⟨T, hTsub, hTcard⟩

/-- The selected class attached to an `M44SelectedApex` contains a four-point
subpacket. -/
theorem M44SelectedApex.exists_fourSubpacket
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hx : M44SelectedApex S i x) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 :=
  exists_fourSubpacket_of_selected_card_ge_four hx.selected_card

/-- A selected same-radius class with at least four members contains a
four-point subpacket preserving any already chosen subpacket of size at most
four. -/
theorem exists_fourSubpacket_preserving_of_selected_card_ge_four
    {A : Finset ℝ²} {x : ℝ²} {radius : ℝ} {P : Finset ℝ²}
    (hPsub : P ⊆ SelectedClass A x radius)
    (hPcard : P.card ≤ 4)
    (hcard : 4 ≤ (SelectedClass A x radius).card) :
    ∃ T : Finset ℝ²,
      P ⊆ T ∧
      T ⊆ SelectedClass A x radius ∧
      T.card = 4 := by
  classical
  rcases Finset.exists_subsuperset_card_eq
      (s := P) (t := SelectedClass A x radius) (n := 4)
      hPsub hPcard hcard with
    ⟨T, hP_T, hTsub, hTcard⟩
  exact ⟨T, hP_T, hTsub, hTcard⟩

/-- A selected same-radius class with at least four members contains a
four-point subpacket preserving any chosen member. -/
theorem exists_fourSubpacket_preserving_point_of_selected_card_ge_four
    {A : Finset ℝ²} {x p : ℝ²} {radius : ℝ}
    (hp : p ∈ SelectedClass A x radius)
    (hcard : 4 ≤ (SelectedClass A x radius).card) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x radius ∧
      T.card = 4 := by
  classical
  have hPsub : ({p} : Finset ℝ²) ⊆ SelectedClass A x radius := by
    intro q hq
    have hqp : q = p := by simpa using hq
    simpa [hqp] using hp
  have hPcard : ({p} : Finset ℝ²).card ≤ 4 := by simp
  rcases exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPsub hPcard hcard with
    ⟨T, hpT, hTsub, hTcard⟩
  exact ⟨T, hpT (by simp), hTsub, hTcard⟩

/-- The selected class attached to an `M44SelectedApex` contains a four-point
subpacket preserving any chosen selected point. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_point
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 :=
  exists_fourSubpacket_preserving_point_of_selected_card_ge_four
    hp hx.selected_card

/-- Count Moser vertices inside an arbitrary packet. -/
noncomputable def packetMoserCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (T : Finset ℝ²) : ℕ :=
  (T ∩ S.triangle.verts).card

/-- Count own-cap interior points, excluding the apex, inside an arbitrary
packet. -/
noncomputable def packetSameCapCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (T : Finset ℝ²) : ℕ :=
  (T ∩ (S.capInteriorByIndex i).erase x).card

/-- Count left-adjacent-cap interior points inside an arbitrary packet. -/
noncomputable def packetLeftAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (T : Finset ℝ²) :
    ℕ :=
  (T ∩ S.leftAdjacentInteriorByIndex i).card

/-- Count right-adjacent-cap interior points inside an arbitrary packet. -/
noncomputable def packetRightAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (T : Finset ℝ²) :
    ℕ :=
  (T ∩ S.rightAdjacentInteriorByIndex i).card

private theorem packet_inter_card_le_selected_inter_card
    {T U C : Finset ℝ²} (hTsub : T ⊆ U) :
    (T ∩ C).card ≤ (U ∩ C).card := by
  exact Finset.card_le_card (by
    intro q hq
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hq),
        Finset.mem_of_mem_inter_right hq⟩)

private theorem inter_card_eq_sum_indicator (T C : Finset ℝ²) :
    (T ∩ C).card = ∑ q ∈ T, (if q ∈ C then 1 else 0) := by
  rw [← Finset.card_filter (fun q => q ∈ C) T]
  rfl

private theorem indicator_le_indicator_of_imp
    {p q : Prop} [Decidable p] [Decidable q] (h : p → q) :
    (if p then 1 else 0 : ℕ) ≤ if q then 1 else 0 := by
  by_cases hp : p <;> simp [hp, h]

/-- Packet-local Moser count is bounded by the corresponding full
selected-class count. -/
theorem packetMoserCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T ≤ (SelectedClass A x radius ∩ S.triangle.verts).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local same-cap count is bounded by the corresponding full
selected-class count. -/
theorem packetSameCapCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetSameCapCount i x T ≤
      (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local left-adjacent count is bounded by the corresponding full
selected-class count. -/
theorem packetLeftAdjCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetLeftAdjCount i T ≤
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local right-adjacent count is bounded by the corresponding full
selected-class count. -/
theorem packetRightAdjCount_le_selected
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetRightAdjCount i T ≤
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card :=
  packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local Moser count is bounded by the corresponding full selected
class count. -/
theorem packetMoserCount_le_moserCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T ≤ S.moserCount x radius := by
  simpa [moserCount] using S.packetMoserCount_le_selected hTsub

/-- Packet-local same-cap count is bounded by the corresponding full selected
class count. -/
theorem packetSameCapCount_le_sameCapCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetSameCapCount i x T ≤ S.sameCapCount i x radius := by
  simpa [sameCapCount] using S.packetSameCapCount_le_selected i hTsub

/-- Packet-local left-adjacent count is bounded by the corresponding full
selected class count. -/
theorem packetLeftAdjCount_le_leftAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetLeftAdjCount i T ≤ S.leftAdjCount i x radius := by
  simpa [leftAdjCount] using S.packetLeftAdjCount_le_selected i hTsub

/-- Packet-local right-adjacent count is bounded by the corresponding full
selected class count. -/
theorem packetRightAdjCount_le_rightAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetRightAdjCount i T ≤ S.rightAdjCount i x radius := by
  simpa [rightAdjCount] using S.packetRightAdjCount_le_selected i hTsub

/-- A packet same-cap hit is exactly one whenever the full selected class has
the same-cap one-hit bound. -/
theorem packetSameCapCount_eq_one_of_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius)
    (hpacket : 1 ≤ S.packetSameCapCount i x T)
    (hfull : S.sameCapCount i x radius ≤ 1) :
    S.packetSameCapCount i x T = 1 := by
  have hle : S.packetSameCapCount i x T ≤ 1 :=
    le_trans
      (S.packetSameCapCount_le_sameCapCount
        (x := x) (radius := radius) i hTsub)
      hfull
  omega

/-- A packet left-adjacent hit is exactly one whenever the full selected class
has the left-adjacent one-hit bound. -/
theorem packetLeftAdjCount_eq_one_of_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius)
    (hpacket : 1 ≤ S.packetLeftAdjCount i T)
    (hfull : S.leftAdjCount i x radius ≤ 1) :
    S.packetLeftAdjCount i T = 1 := by
  have hle : S.packetLeftAdjCount i T ≤ 1 :=
    le_trans
      (S.packetLeftAdjCount_le_leftAdjCount
        (x := x) (radius := radius) i hTsub)
      hfull
  omega

/-- A packet right-adjacent hit is exactly one whenever the full selected class
has the right-adjacent one-hit bound. -/
theorem packetRightAdjCount_eq_one_of_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius)
    (hpacket : 1 ≤ S.packetRightAdjCount i T)
    (hfull : S.rightAdjCount i x radius ≤ 1) :
    S.packetRightAdjCount i T = 1 := by
  have hle : S.packetRightAdjCount i T ≤ 1 :=
    le_trans
      (S.packetRightAdjCount_le_rightAdjCount
        (x := x) (radius := radius) i hTsub)
      hfull
  omega

/-- A packet member that is a Moser vertex contributes one to the packet Moser
count. -/
theorem one_le_packetMoserCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) {T : Finset ℝ²} {p : ℝ²}
    (hpT : p ∈ T) (hpM : p ∈ S.triangle.verts) :
    1 ≤ S.packetMoserCount T := by
  unfold packetMoserCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpM⟩⟩

/-- A packet member in the same-cap erasure contributes one to the packet
same-cap count. -/
theorem one_le_packetSameCapCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x p : ℝ²}
    {T : Finset ℝ²} (hpT : p ∈ T) (hpI : p ∈ (S.capInteriorByIndex i).erase x) :
    1 ≤ S.packetSameCapCount i x T := by
  unfold packetSameCapCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A packet member in the left-adjacent cap interior contributes one to the
packet left-adjacent count. -/
theorem one_le_packetLeftAdjCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {T : Finset ℝ²}
    {p : ℝ²} (hpT : p ∈ T) (hpI : p ∈ S.leftAdjacentInteriorByIndex i) :
    1 ≤ S.packetLeftAdjCount i T := by
  unfold packetLeftAdjCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A packet member in the right-adjacent cap interior contributes one to the
packet right-adjacent count. -/
theorem one_le_packetRightAdjCount_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {T : Finset ℝ²}
    {p : ℝ²} (hpT : p ∈ T) (hpI : p ∈ S.rightAdjacentInteriorByIndex i) :
    1 ≤ S.packetRightAdjCount i T := by
  unfold packetRightAdjCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A positive-radius selected class is covered by the Moser triangle, the
same cap with the selected apex erased, and the two adjacent-cap interiors. -/
theorem selectedClass_subset_groupUnion
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius) :
    SelectedClass A x radius ⊆
      S.triangle.verts ∪ (S.capInteriorByIndex i).erase x ∪
        S.leftAdjacentInteriorByIndex i ∪ S.rightAdjacentInteriorByIndex i := by
  classical
  have hx_notin_selected : x ∉ SelectedClass A x radius := by
    intro hh
    have hdist : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at hdist
    linarith
  fin_cases i <;>
  · intro q hqsel
    have hqx : q ≠ x := fun h => hx_notin_selected (h ▸ hqsel)
    have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hqA with
      hqv | ⟨j, hj⟩
    · exact Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_union_left _ hqv))
    · fin_cases j <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] at hj ⊢ <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _
            (Finset.mem_union_right _ ?_))
         exact Finset.mem_erase.mpr ⟨hqx, hj⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact hj)
      | (refine Finset.mem_union_right _ ?_
         exact hj)

/-- Packet-local disjoint-cover budget.  Any packet contained in a
positive-radius selected class is covered by its Moser, same-cap,
left-adjacent, and right-adjacent subfamilies. -/
theorem packet_card_le_groupSum
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius) :
    T.card ≤
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T := by
  classical
  have hx_notin_selected : x ∉ SelectedClass A x radius := by
    intro hh
    have hdist : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at hdist
    linarith
  have hchain : ∀ (P Q R U : Finset ℝ²),
      T ⊆ P ∪ Q ∪ R ∪ U →
      T.card ≤ P.card + Q.card + R.card + U.card := by
    intro P Q R U hsub
    calc T.card
        ≤ (P ∪ Q ∪ R ∪ U).card := Finset.card_le_card hsub
      _ ≤ P.card + Q.card + R.card + U.card := by
          refine le_trans (Finset.card_union_le _ _) ?_
          refine add_le_add (le_trans (Finset.card_union_le _ _) ?_) le_rfl
          exact add_le_add (Finset.card_union_le _ _) le_rfl
  change T.card ≤
      (T ∩ S.triangle.verts).card +
        (T ∩ (S.capInteriorByIndex i).erase x).card +
        (T ∩ S.leftAdjacentInteriorByIndex i).card +
        (T ∩ S.rightAdjacentInteriorByIndex i).card
  fin_cases i <;>
  · apply hchain
    intro q hq
    have hqsel : q ∈ SelectedClass A x radius := hTsub hq
    have hqx : q ≠ x := fun h => hx_notin_selected (h ▸ hqsel)
    have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hqA with
      hqv | ⟨j, hj⟩
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hq, hqv⟩)))
    · fin_cases j <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] at hj ⊢ <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_right _ ?_))
         exact Finset.mem_inter.mpr ⟨hq, Finset.mem_erase.mpr ⟨hqx, hj⟩⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact Finset.mem_inter.mpr ⟨hq, hj⟩)
      | (refine Finset.mem_union_right _ ?_
         exact Finset.mem_inter.mpr ⟨hq, hj⟩)

/-- The packet groups do not over-count a selected packet.  Moser vertices are
counted only in the Moser group, and each non-Moser selected point lies in at
most one of the three open cap interiors. -/
theorem packet_groupSum_le_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T ≤ T.card := by
  classical
  unfold packetMoserCount packetSameCapCount packetLeftAdjCount
    packetRightAdjCount
  rw [inter_card_eq_sum_indicator T S.triangle.verts]
  rw [inter_card_eq_sum_indicator T ((S.capInteriorByIndex i).erase x)]
  rw [inter_card_eq_sum_indicator T (S.leftAdjacentInteriorByIndex i)]
  rw [inter_card_eq_sum_indicator T (S.rightAdjacentInteriorByIndex i)]
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib,
    ← Finset.sum_add_distrib]
  rw [Finset.card_eq_sum_ones]
  apply Finset.sum_le_sum
  intro q hq
  have hqsel : q ∈ SelectedClass A x radius := hTsub hq
  by_cases hqv : q ∈ S.triangle.verts
  · have hnot0 : q ∉ S.capInteriorByIndex 0 := by
      intro hI
      exact S.capInteriorByIndex_not_mem_triangle_verts hI hqv
    have hnot1 : q ∉ S.capInteriorByIndex 1 := by
      intro hI
      exact S.capInteriorByIndex_not_mem_triangle_verts hI hqv
    have hnot2 : q ∉ S.capInteriorByIndex 2 := by
      intro hI
      exact S.capInteriorByIndex_not_mem_triangle_verts hI hqv
    fin_cases i <;>
      simp [hqv, hnot0, hnot1, hnot2]
  · have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    have hone := S.partition.nonmoser_in_one q hqA hqv
    have hM0 : (if q ∈ S.triangle.verts then 1 else 0 : ℕ) = 0 := by
      simp [hqv]
    have hI0e :
        (if q ∈ (S.capInteriorByIndex 0).erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 0 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 0
          (Finset.mem_of_mem_erase h))
    have hI1e :
        (if q ∈ (S.capInteriorByIndex 1).erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 1 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 1
          (Finset.mem_of_mem_erase h))
    have hI2e :
        (if q ∈ (S.capInteriorByIndex 2).erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 2 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 2
          (Finset.mem_of_mem_erase h))
    have hI0 :
        (if q ∈ S.capInteriorByIndex 0 then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 0 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 0 h)
    have hI1 :
        (if q ∈ S.capInteriorByIndex 1 then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 1 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 1 h)
    have hI2 :
        (if q ∈ S.capInteriorByIndex 2 then 1 else 0 : ℕ) ≤
          if q ∈ S.capByIndex 2 then 1 else 0 :=
      indicator_le_indicator_of_imp
        (fun h => S.capInteriorByIndex_subset_capByIndex 2 h)
    fin_cases i <;>
      simp only [capByIndex, capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] at hI0e hI1e hI2e hI0 hI1 hI2 hone ⊢ <;>
      omega

/-- Exact packet incidence budget.  A positive-radius selected packet is
partitioned by the Moser, same-cap, left-adjacent, and right-adjacent groups. -/
theorem packet_groupSum_eq_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = T.card := by
  exact le_antisymm (S.packet_groupSum_le_card i hTsub)
    (S.packet_card_le_groupSum i hradius_pos hTsub)

/-- A four-point selected packet has exact primitive incidence budget `4`. -/
theorem packet_groupSum_eq_four_of_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius)
    (hTcard : T.card = 4) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rw [S.packet_groupSum_eq_card i hradius_pos hTsub, hTcard]

/-- The four-point subpacket attached to an `M44SelectedApex` can be chosen
with the exact primitive incidence budget. -/
theorem M44SelectedApex.exists_fourSubpacket_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hx : M44SelectedApex S i x) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket hx with ⟨T, hTsub, hTcard⟩
  exact ⟨T, hTsub, hTcard,
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- The four-point subpacket attached to an `M44SelectedApex` can preserve a
chosen selected point and still carry the exact primitive incidence budget. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket_preserving_point hx hp with
    ⟨T, hpT, hTsub, hTcard⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- A selected left-adjacent point can be preserved in a four-point packet,
where it contributes to the packet left-adjacent count. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_left_point_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetLeftAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
      hx (Finset.mem_of_mem_inter_left hp) with
    ⟨T, hpT, hTsub, hTcard, hbudget⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.one_le_packetLeftAdjCount_of_mem i hpT
      (Finset.mem_of_mem_inter_right hp),
    hbudget⟩

/-- A selected right-adjacent point can be preserved in a four-point packet,
where it contributes to the packet right-adjacent count. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_right_point_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x p : ℝ²}
    (hx : M44SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetRightAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases M44SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
      hx (Finset.mem_of_mem_inter_left hp) with
    ⟨T, hpT, hTsub, hTcard, hbudget⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.one_le_packetRightAdjCount_of_mem i hpT
      (Finset.mem_of_mem_inter_right hp),
    hbudget⟩

/-- Selected left- and right-adjacent points can be preserved together in a
four-point packet.  The resulting primitive row has nonzero left and right
adjacent counts and exact packet budget `4`. -/
theorem M44SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {x pL pR : ℝ²}
    (hx : M44SelectedApex S i x)
    (hpL : pL ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i)
    (hpR : pR ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      pL ∈ T ∧
      pR ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetLeftAdjCount i T ∧
      1 ≤ S.packetRightAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  classical
  let P : Finset ℝ² := {pL, pR}
  have hPsub : P ⊆ SelectedClass A x hx.radius := by
    intro q hq
    simp only [P, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl
    · exact Finset.mem_of_mem_inter_left hpL
    · exact Finset.mem_of_mem_inter_left hpR
  have hPcard : P.card ≤ 4 := by
    dsimp [P]
    by_cases h : pL = pR
    · subst h
      simp
    · simp [h]
  rcases exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPsub hPcard hx.selected_card with
    ⟨T, hP_T, hTsub, hTcard⟩
  have hpLT : pL ∈ T := hP_T (by simp [P])
  have hpRT : pR ∈ T := hP_T (by simp [P])
  exact ⟨T, hpLT, hpRT, hTsub, hTcard,
    S.one_le_packetLeftAdjCount_of_mem i hpLT
      (Finset.mem_of_mem_inter_right hpL),
    S.one_le_packetRightAdjCount_of_mem i hpRT
      (Finset.mem_of_mem_inter_right hpR),
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- Packet arithmetic with left and right singleton rows.  Under the exact
four-point budget, a Moser bound `m <= 2`, a same-cap bound `s <= 1`, and
left/right rows equal to `1`, only the two primitive rows `(1,1,1,1)` and
`(2,0,1,1)` remain. -/
theorem packet_left_right_primitive_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    {T : Finset ℝ²}
    (hbudget :
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4)
    (hm : S.packetMoserCount T ≤ 2)
    (hs : S.packetSameCapCount i x T ≤ 1)
    (hl : S.packetLeftAdjCount i T = 1)
    (hr : S.packetRightAdjCount i T = 1) :
    (S.packetMoserCount T = 1 ∧
      S.packetSameCapCount i x T = 1 ∧
      S.packetLeftAdjCount i T = 1 ∧
      S.packetRightAdjCount i T = 1) ∨
    (S.packetMoserCount T = 2 ∧
      S.packetSameCapCount i x T = 0 ∧
      S.packetLeftAdjCount i T = 1 ∧
      S.packetRightAdjCount i T = 1) := by
  omega

/-- A four-point selected class has exact full selected-count budget. -/
theorem selectedCount_groupSum_eq_four_of_card
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hcard : (SelectedClass A x radius).card = 4) :
    S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius = 4 := by
  have hTsub : SelectedClass A x radius ⊆ SelectedClass A x radius := by
    intro q hq
    exact hq
  simpa [moserCount, sameCapCount, leftAdjCount, rightAdjCount,
    packetMoserCount, packetSameCapCount, packetLeftAdjCount,
    packetRightAdjCount] using
    S.packet_groupSum_eq_four_of_card
      (x := x) (i := i) (radius := radius)
      (T := SelectedClass A x radius) hradius_pos hTsub hcard

/-- A positive-radius selected class is partitioned by the Moser, same-cap,
left-adjacent, and right-adjacent count groups. -/
theorem selectedClass_card_eq_groupSum
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius) :
    (SelectedClass A x radius).card =
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius := by
  have hTsub : SelectedClass A x radius ⊆ SelectedClass A x radius := by
    intro q hq
    exact hq
  simpa [moserCount, sameCapCount, leftAdjCount, rightAdjCount,
    packetMoserCount, packetSameCapCount, packetLeftAdjCount,
    packetRightAdjCount] using
    (S.packet_groupSum_eq_card
      (x := x) (i := i) (radius := radius)
      (T := SelectedClass A x radius) hradius_pos hTsub).symm

/-- One-sided right-adjacent count split.  If the right-adjacent count is the
known singleton but the left lower bound is not known, the exact four-count
budget leaves the two primitive rows or the single left-zero obstruction row. -/
theorem rightAdjCount_one_sided_count_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hbudget :
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius = 4)
    (hm : S.moserCount x radius ≤ 2)
    (hs : S.sameCapCount i x radius ≤ 1)
    (hl : S.leftAdjCount i x radius ≤ 1)
    (hr_pos : 1 ≤ S.rightAdjCount i x radius)
    (hr : S.rightAdjCount i x radius ≤ 1) :
    (S.moserCount x radius = 1 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 0 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 0 ∧
      S.rightAdjCount i x radius = 1) := by
  omega

/-- One-sided left-adjacent count split.  If the left-adjacent count is the
known singleton but the right lower bound is not known, the exact four-count
budget leaves the two primitive rows or the single right-zero obstruction row. -/
theorem leftAdjCount_one_sided_count_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    {radius : ℝ}
    (hbudget :
      S.moserCount x radius + S.sameCapCount i x radius +
        S.leftAdjCount i x radius + S.rightAdjCount i x radius = 4)
    (hm : S.moserCount x radius ≤ 2)
    (hs : S.sameCapCount i x radius ≤ 1)
    (hl_pos : 1 ≤ S.leftAdjCount i x radius)
    (hl : S.leftAdjCount i x radius ≤ 1)
    (hr : S.rightAdjCount i x radius ≤ 1) :
    (S.moserCount x radius = 1 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 0 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 1) ∨
    (S.moserCount x radius = 2 ∧
      S.sameCapCount i x radius = 1 ∧
      S.leftAdjCount i x radius = 1 ∧
      S.rightAdjCount i x radius = 0) := by
  omega

/-- Named payload for the one-sided row with no left-adjacent selected point. -/
def RightOneSidedObstructionPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (x : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s r : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A x radius ∩ S.triangle.verts = ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x =
      ({s} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i =
      ({r} : Finset ℝ²) ∧
    SelectedClass A x radius = ({m₁, m₂, s, r} : Finset ℝ²) ∧
    ({m₁, m₂, s, r} : Finset ℝ²).card = 4

/-- Named payload for the one-sided row with no right-adjacent selected point. -/
def LeftOneSidedObstructionPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (x : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s l : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A x radius ∩ S.triangle.verts = ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x =
      ({s} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i =
      ({l} : Finset ℝ²) ∧
    SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A x radius = ({m₁, m₂, s, l} : Finset ℝ²) ∧
    ({m₁, m₂, s, l} : Finset ℝ²).card = 4

/-- Right one-sided payload with the adjacent singleton identified as a
specified erased point. -/
def RightOneSidedErasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (center erased : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A center radius ∩ S.triangle.verts =
      ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ (S.capInteriorByIndex i).erase center =
      ({s} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ S.leftAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A center radius ∩ S.rightAdjacentInteriorByIndex i =
      ({erased} : Finset ℝ²) ∧
    SelectedClass A center radius = ({m₁, m₂, s, erased} : Finset ℝ²) ∧
    ({m₁, m₂, s, erased} : Finset ℝ²).card = 4

/-- Left one-sided payload with the adjacent singleton identified as a
specified erased point. -/
def LeftOneSidedErasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (i : Fin 3) (center erased : ℝ²) (radius : ℝ) : Prop :=
  ∃ m₁ m₂ s : ℝ²,
    m₁ ≠ m₂ ∧
    SelectedClass A center radius ∩ S.triangle.verts =
      ({m₁, m₂} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ (S.capInteriorByIndex i).erase center =
      ({s} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ S.leftAdjacentInteriorByIndex i =
      ({erased} : Finset ℝ²) ∧
    SelectedClass A center radius ∩ S.rightAdjacentInteriorByIndex i = ∅ ∧
    SelectedClass A center radius = ({m₁, m₂, s, erased} : Finset ℝ²) ∧
    ({m₁, m₂, s, erased} : Finset ℝ²).card = 4

/-- A right one-sided erased payload carries an exact four-point selected
class at the payload center and radius. -/
theorem rightOneSidedErasedPayload_selectedClass_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    (SelectedClass A center radius).card = 4 := by
  rcases hpayload with
    ⟨m₁, m₂, s, _hmne, _hM, _hC, _hL, _hR, hsel, hcard⟩
  rw [hsel]
  exact hcard

/-- In a right one-sided erased payload, the named erased point belongs to the
payload selected class. -/
theorem rightOneSidedErasedPayload_erased_mem_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    erased ∈ SelectedClass A center radius := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, _hL, hR, _hsel, _hcard⟩
  have herased :
      erased ∈
        SelectedClass A center radius ∩ S.rightAdjacentInteriorByIndex i := by
    rw [hR]
    simp
  exact (Finset.mem_inter.mp herased).1

/-- In a right one-sided erased payload, the named erased point is the
right-adjacent selected hit. -/
theorem rightOneSidedErasedPayload_erased_mem_rightAdjacentInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    erased ∈ S.rightAdjacentInteriorByIndex i := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, _hL, hR, _hsel, _hcard⟩
  have herased :
      erased ∈
        SelectedClass A center radius ∩ S.rightAdjacentInteriorByIndex i := by
    rw [hR]
    simp
  exact (Finset.mem_inter.mp herased).2

/-- In a right one-sided erased payload, the Moser count is exactly two. -/
theorem rightOneSidedErasedPayload_moserCount_eq_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    S.moserCount center radius = 2 := by
  rcases hpayload with
    ⟨m₁, m₂, _s, hmne, hM, _hC, _hL, _hR, _hsel, _hcard⟩
  have hcard : ({m₁, m₂} : Finset ℝ²).card = 2 := by
    simp [hmne]
  simpa [moserCount, hM] using hcard

/-- In a right one-sided erased payload, the same-cap count is exactly one. -/
theorem rightOneSidedErasedPayload_sameCapCount_eq_one
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    S.sameCapCount i center radius = 1 := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, hC, _hL, _hR, _hsel, _hcard⟩
  simp [sameCapCount, hC]

/-- In a right one-sided erased payload, the left-adjacent count is zero. -/
theorem rightOneSidedErasedPayload_leftAdjCount_eq_zero
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    S.leftAdjCount i center radius = 0 := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, hL, _hR, _hsel, _hcard⟩
  simp [leftAdjCount, hL]

/-- In a right one-sided erased payload, the right-adjacent count is exactly one. -/
theorem rightOneSidedErasedPayload_rightAdjCount_eq_one
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : RightOneSidedErasedPayload S i center erased radius) :
    S.rightAdjCount i center radius = 1 := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, _hL, hR, _hsel, _hcard⟩
  simp [rightAdjCount, hR]

/-- A left one-sided erased payload carries an exact four-point selected class
at the payload center and radius. -/
theorem leftOneSidedErasedPayload_selectedClass_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    (SelectedClass A center radius).card = 4 := by
  rcases hpayload with
    ⟨m₁, m₂, s, _hmne, _hM, _hC, _hL, _hR, hsel, hcard⟩
  rw [hsel]
  exact hcard

/-- In a left one-sided erased payload, the named erased point belongs to the
payload selected class. -/
theorem leftOneSidedErasedPayload_erased_mem_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    erased ∈ SelectedClass A center radius := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, hL, _hR, _hsel, _hcard⟩
  have herased :
      erased ∈
        SelectedClass A center radius ∩ S.leftAdjacentInteriorByIndex i := by
    rw [hL]
    simp
  exact (Finset.mem_inter.mp herased).1

/-- In a left one-sided erased payload, the named erased point is the
left-adjacent selected hit. -/
theorem leftOneSidedErasedPayload_erased_mem_leftAdjacentInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    erased ∈ S.leftAdjacentInteriorByIndex i := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, hL, _hR, _hsel, _hcard⟩
  have herased :
      erased ∈
        SelectedClass A center radius ∩ S.leftAdjacentInteriorByIndex i := by
    rw [hL]
    simp
  exact (Finset.mem_inter.mp herased).2

/-- In a left one-sided erased payload, the Moser count is exactly two. -/
theorem leftOneSidedErasedPayload_moserCount_eq_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    S.moserCount center radius = 2 := by
  rcases hpayload with
    ⟨m₁, m₂, _s, hmne, hM, _hC, _hL, _hR, _hsel, _hcard⟩
  have hcard : ({m₁, m₂} : Finset ℝ²).card = 2 := by
    simp [hmne]
  simpa [moserCount, hM] using hcard

/-- In a left one-sided erased payload, the same-cap count is exactly one. -/
theorem leftOneSidedErasedPayload_sameCapCount_eq_one
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    S.sameCapCount i center radius = 1 := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, hC, _hL, _hR, _hsel, _hcard⟩
  simp [sameCapCount, hC]

/-- In a left one-sided erased payload, the left-adjacent count is exactly one. -/
theorem leftOneSidedErasedPayload_leftAdjCount_eq_one
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    S.leftAdjCount i center radius = 1 := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, hL, _hR, _hsel, _hcard⟩
  simp [leftAdjCount, hL]

/-- In a left one-sided erased payload, the right-adjacent count is zero. -/
theorem leftOneSidedErasedPayload_rightAdjCount_eq_zero
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {i : Fin 3} {center erased : ℝ²} {radius : ℝ}
    (hpayload : LeftOneSidedErasedPayload S i center erased radius) :
    S.rightAdjCount i center radius = 0 := by
  rcases hpayload with
    ⟨_m₁, _m₂, _s, _hmne, _hM, _hC, _hL, hR, _hsel, _hcard⟩
  simp [rightAdjCount, hR]

/-- The right-sided obstruction row names the whole four-point selected class:
two Moser vertices, one same-cap point, no left-adjacent point, and one
right-adjacent point. -/
theorem right_one_sided_obstruction_payload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hcard : (SelectedClass A x radius).card = 4)
    (hm : S.moserCount x radius = 2)
    (hs : S.sameCapCount i x radius = 1)
    (hl : S.leftAdjCount i x radius = 0)
    (hr : S.rightAdjCount i x radius = 1) :
    RightOneSidedObstructionPayload S i x radius := by
  classical
  let M := SelectedClass A x radius ∩ S.triangle.verts
  let C := SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x
  let L := SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i
  let R := SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i
  have hMcard : M.card = 2 := by
    simpa [M, moserCount] using hm
  obtain ⟨m₁, m₂, hm12, hMeq⟩ := Finset.card_eq_two.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨s, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 0 := by
    simpa [L, leftAdjCount] using hl
  have hLeq : L = ∅ := Finset.card_eq_zero.mp hLcard
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hselCover : SelectedClass A x radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion i hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A x radius ⊆ ({m₁, m₂, s, r} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hm₁Sel : m₁ ∈ SelectedClass A x radius := by
    have hm₁M : m₁ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₁M).1
  have hm₂Sel : m₂ ∈ SelectedClass A x radius := by
    have hm₂M : m₂ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₂M).1
  have hsSel : s ∈ SelectedClass A x radius := by
    have hsC : s ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hsC).1
  have hrSel : r ∈ SelectedClass A x radius := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hrR).1
  have hselSuperset :
      ({m₁, m₂, s, r} : Finset ℝ²) ⊆ SelectedClass A x radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hsSel
    · exact hrSel
  have hseleq :
      SelectedClass A x radius = ({m₁, m₂, s, r} : Finset ℝ²) :=
    Finset.Subset.antisymm hselSubset hselSuperset
  have hnamedCard : ({m₁, m₂, s, r} : Finset ℝ²).card = 4 := by
    rw [← hseleq]
    exact hcard
  exact ⟨m₁, m₂, s, r, hm12, hMeq, hCeq, hLeq, hReq, hseleq, hnamedCard⟩


end SurplusCapPacket

end Problem97
