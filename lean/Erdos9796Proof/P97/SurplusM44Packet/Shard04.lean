/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.SurplusM44Packet.Shard03

/-!
# `SurplusM44Packet` shard 04 (lines 4365-5764 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`IsM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus`.
Last decl:
`IsM44.exists_surplusSelectorNamedSplit_of_formC`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- A left-surplus strict escape at the second non-surplus index can be labelled
inside a three-point surplus-interior subpacket. -/
theorem IsM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  exact hM44.exists_surplusInterior_triple_preserving
    (S.mem_surplusInterior_of_oppIndex2_left_surplus
      hradius hxT hxSurplus)

/-- Endpoint-residual exclusion eliminates the left, other-non-surplus escape
side at the first non-surplus cap index. -/
theorem IsM44.leftStrictEscape_oppIndex1_endpointData_elim
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex S.oppIndex1 \
        (S.capByIndex S.oppIndex1 ∪ S.rightAdjacentCapByIndex S.oppIndex1))
    (hend : ∀ {rho : ℝ},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) :
    False := by
  have hcapLeft : (S.leftAdjacentCapByIndex S.oppIndex1).card = 4 := by
    rw [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
    exact hM44.oppIndex2_cap_card_eq_four
  have hcenterA : S.rightOuterVertexByIndex S.oppIndex1 ∈ A :=
    S.capByIndex_subset S.oppIndex1
      (S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1)
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4
      hcenterA with
    ⟨rho, hρ, hρcard⟩
  exact S.leftStrictEscape_endpointData_elim hconv S.oppIndex1
    hradius hρ hM44.oppIndex1_cap_card_eq_four hcapLeft hcard hxT hxEsc
    hρcard (by
      intro hres
      exact hend hres)

/-- Endpoint-residual exclusion eliminates the right, other-non-surplus escape
side at the second non-surplus cap index. -/
theorem IsM44.rightStrictEscape_oppIndex2_endpointData_elim
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex S.oppIndex2 \
        (S.capByIndex S.oppIndex2 ∪ S.leftAdjacentCapByIndex S.oppIndex2))
    (hend : ∀ {rho : ℝ},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) :
    False := by
  have hcapRight : (S.rightAdjacentCapByIndex S.oppIndex2).card = 4 := by
    rw [S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1]
    exact hM44.oppIndex1_cap_card_eq_four
  have hcenterA : S.leftOuterVertexByIndex S.oppIndex2 ∈ A :=
    S.capByIndex_subset S.oppIndex2
      (S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2)
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4
      hcenterA with
    ⟨rho, hρ, hρcard⟩
  exact S.rightStrictEscape_endpointData_elim hconv S.oppIndex2
    hradius hρ hM44.oppIndex2_cap_card_eq_four hcapRight hcard hxT hxEsc
    hρcard (by
      intro hres
      exact hend hres)

/-- If endpoint escape is excluded, strict escape at the first non-surplus cap
can only remain on the surplus-adjacent side. -/
theorem IsM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hstrict : S.StrictAdjacentEscapeAt S.oppIndex1 radius) :
    ∃ x : ℝ²,
      x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∧
        x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.leftAdjacentCapByIndex S.oppIndex1) := by
  rcases hstrict with ⟨x, hxT, hxSide⟩
  rcases hxSide with hxLeft | hxRight
  · exact False.elim
      (hM44.leftStrictEscape_oppIndex1_endpointData_elim hK4 hconv
        hradius hcard hxT hxLeft
        (fun {rho} hres => hend (rho := rho) (x := x) hres))
  · exact ⟨x, hxT, hxRight⟩

/-- If endpoint escape is excluded, strict escape at the second non-surplus cap
can only remain on the surplus-adjacent side. -/
theorem IsM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hstrict : S.StrictAdjacentEscapeAt S.oppIndex2 radius) :
    ∃ x : ℝ²,
      x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∧
        x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.rightAdjacentCapByIndex S.oppIndex2) := by
  rcases hstrict with ⟨x, hxT, hxSide⟩
  rcases hxSide with hxLeft | hxRight
  · exact ⟨x, hxT, hxLeft⟩
  · exact False.elim
      (hM44.rightStrictEscape_oppIndex2_endpointData_elim hK4 hconv
        hradius hcard hxT hxRight
        (fun {rho} hres => hend (rho := rho) (x := x) hres))

/-- Pinned surplus residual payload at the first non-surplus cap index.  This
is the proof-facing local data left after endpoint escape is excluded: the
selected four-class is pinned to the two private points of its own short cap,
the shared endpoint on the other non-surplus side, and the surplus escape point.
The final two fields are the reflection-produced non-equidistance facts for the
two private points against both Moser endpoints of the cap. -/
def PinnedRightSurplusResidualAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (radius : ℝ) (x : ℝ²) :
    Prop :=
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  ∃ p₁ p₂ : ℝ²,
    p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
      T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex1 ⊆ T ∧
      S.leftOuterVertexByIndex S.oppIndex1 ∈ T ∧
      x ∈ T ∧
      x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
        (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1) ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex1 =
        ({S.leftOuterVertexByIndex S.oppIndex1} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex1 =
        ({x} : Finset ℝ²) ∧
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex1) ∧
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex1)

/-- Pinned surplus residual payload at the second non-surplus cap index, with
the mirror orientation: the surplus escape lies on the left-adjacent side and
the shared endpoint on the other non-surplus side is the right outer endpoint. -/
def PinnedLeftSurplusResidualAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (radius : ℝ) (x : ℝ²) :
    Prop :=
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  ∃ p₁ p₂ : ℝ²,
    p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
      T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex2 ⊆ T ∧
      S.rightOuterVertexByIndex S.oppIndex2 ∈ T ∧
      x ∈ T ∧
      x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
        (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2) ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex2 =
        ({x} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
        ({S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) ∧
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex2) ∧
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex2)

/-- The right-pinned residual exposes its private two-point cap and the two
non-equidistance facts against the cap endpoints. -/
theorem pinnedRightSurplusResidual_private_pair_nonEquidistant
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
        S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
        dist p₁ (S.rightOuterVertexByIndex S.oppIndex1) ≠
          dist p₂ (S.rightOuterVertexByIndex S.oppIndex1) ∧
        dist p₁ (S.leftOuterVertexByIndex S.oppIndex1) ≠
          dist p₂ (S.leftOuterVertexByIndex S.oppIndex1) := by
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, _hcard, _hsub, _hleft, _hx, _hxSurplus,
      _hleftEq, _hrightEq, hright_ne, hleft_ne⟩
  exact ⟨p₁, p₂, hpne, hpair, hright_ne, hleft_ne⟩

/-- The left-pinned residual exposes its private two-point cap and the two
non-equidistance facts against the cap endpoints. -/
theorem pinnedLeftSurplusResidual_private_pair_nonEquidistant
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
        S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
        dist p₁ (S.rightOuterVertexByIndex S.oppIndex2) ≠
          dist p₂ (S.rightOuterVertexByIndex S.oppIndex2) ∧
        dist p₁ (S.leftOuterVertexByIndex S.oppIndex2) ≠
          dist p₂ (S.leftOuterVertexByIndex S.oppIndex2) := by
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, _hcard, _hsub, _hright, _hx, _hxSurplus,
      _hleftEq, _hrightEq, hright_ne, hleft_ne⟩
  exact ⟨p₁, p₂, hpne, hpair, hright_ne, hleft_ne⟩

/-- The right-pinned residual retains the strict surplus-side membership
witness from which it was constructed. -/
theorem pinnedRightSurplusResidual_mem_right_surplus
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1) := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hleft, _hx,
      hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  exact hxSurplus

/-- The left-pinned residual retains the strict surplus-side membership
witness from which it was constructed. -/
theorem pinnedLeftSurplusResidual_mem_left_surplus
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2) := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hright, _hx,
      hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  exact hxSurplus

/-- A right-pinned residual is carried by a positive selected-class radius. -/
theorem pinnedRightSurplusResidual_radius_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    0 < radius := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hleft, hxT,
      hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hcenter_ne_x : S.oppositeVertexByIndex S.oppIndex1 ≠ x := by
    intro hcenter
    rcases Finset.mem_sdiff.mp hxSurplus with ⟨_hxRight, hxNotOwnOrLeft⟩
    exact hxNotOwnOrLeft (Finset.mem_union.mpr (Or.inr (by
      simpa [hcenter] using
        S.oppositeVertexByIndex_mem_leftAdjacentCapByIndex S.oppIndex1)))
  have hdist :
      dist (S.oppositeVertexByIndex S.oppIndex1) x = radius :=
    (mem_selectedClass.mp hxT).2
  rw [← hdist]
  exact dist_pos.mpr hcenter_ne_x

/-- A left-pinned residual is carried by a positive selected-class radius. -/
theorem pinnedLeftSurplusResidual_radius_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    0 < radius := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hright, hxT,
      hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hcenter_ne_x : S.oppositeVertexByIndex S.oppIndex2 ≠ x := by
    intro hcenter
    rcases Finset.mem_sdiff.mp hxSurplus with ⟨_hxLeft, hxNotOwnOrRight⟩
    exact hxNotOwnOrRight (Finset.mem_union.mpr (Or.inr (by
      simpa [hcenter] using
        S.oppositeVertexByIndex_mem_rightAdjacentCapByIndex S.oppIndex2)))
  have hdist :
      dist (S.oppositeVertexByIndex S.oppIndex2) x = radius :=
    (mem_selectedClass.mp hxT).2
  rw [← hdist]
  exact dist_pos.mpr hcenter_ne_x

/-- At the first pinned short-cap apex, every positive radius carrying four
ambient points is the pinned residual radius.  The two private cap-interior
points belong to every such class by the short-cap core selector. -/
theorem IsM44.pinnedRightSurplusResidual_k4Radius_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    {rho : ℝ} (hrho : 0 < rho)
    (hrhoCard :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) rho).card) :
    rho = radius := by
  rcases hpinned with
    ⟨p₁, _p₂, _hpne, hpair, _hcard, hsub, _hleft, _hx,
      _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁Interior :
      p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₁Radius :
      p₁ ∈ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hsub hp₁Interior
  have hcore := S.moserCapCoreSelectorAt hconv S.oppIndex1 hrho
    hM44.oppIndex1_cap_card_eq_four hrhoCard
  have hp₁Rho :
      p₁ ∈ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) rho :=
    hcore.2.1 hp₁Interior
  exact ((mem_selectedClass.mp hp₁Rho).2).symm.trans
    (mem_selectedClass.mp hp₁Radius).2

/-- Mirror radius uniqueness at the second pinned short-cap apex. -/
theorem IsM44.pinnedLeftSurplusResidual_k4Radius_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    {rho : ℝ} (hrho : 0 < rho)
    (hrhoCard :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) rho).card) :
    rho = radius := by
  rcases hpinned with
    ⟨p₁, _p₂, _hpne, hpair, _hcard, hsub, _hright, _hx,
      _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁Interior :
      p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₁Radius :
      p₁ ∈ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hsub hp₁Interior
  have hcore := S.moserCapCoreSelectorAt hconv S.oppIndex2 hrho
    hM44.oppIndex2_cap_card_eq_four hrhoCard
  have hp₁Rho :
      p₁ ∈ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) rho :=
    hcore.2.1 hp₁Interior
  exact ((mem_selectedClass.mp hp₁Rho).2).symm.trans
    (mem_selectedClass.mp hp₁Radius).2

/-- Deleting any member of a right-pinned class destroys every K4 witness at
the pinned apex. -/
theorem IsM44.pinnedRightSurplusResidual_no_qfree_of_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    {radius : ℝ} {x q : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hq : q ∈ SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex1) radius) :
    ¬ HasNEquidistantPointsAt 4 (A.erase q)
      (S.oppositeVertexByIndex S.oppIndex1) := by
  intro hK4
  rcases hK4 with ⟨rho, hrho, hcardFilter⟩
  have hcardErase :
      4 ≤ (SelectedClass (A.erase q)
        (S.oppositeVertexByIndex S.oppIndex1) rho).card := by
    simpa [SelectedClass] using hcardFilter
  have hcardAmbient :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) rho).card := by
    exact le_trans hcardErase (Finset.card_le_card (by
      rw [selectedClass_erase_eq]
      exact Finset.erase_subset q
        (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) rho)))
  have hrhoeq : rho = radius :=
    hM44.pinnedRightSurplusResidual_k4Radius_eq
      hconv hpinned hrho hcardAmbient
  subst rho
  have hclassCard :
      (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard, _hsub, _hleft, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hq, hclassCard]
    at hcardErase
  omega

/-- Mirror deletion blocker theorem for a left-pinned class. -/
theorem IsM44.pinnedLeftSurplusResidual_no_qfree_of_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    {radius : ℝ} {x q : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hq : q ∈ SelectedClass A
      (S.oppositeVertexByIndex S.oppIndex2) radius) :
    ¬ HasNEquidistantPointsAt 4 (A.erase q)
      (S.oppositeVertexByIndex S.oppIndex2) := by
  intro hK4
  rcases hK4 with ⟨rho, hrho, hcardFilter⟩
  have hcardErase :
      4 ≤ (SelectedClass (A.erase q)
        (S.oppositeVertexByIndex S.oppIndex2) rho).card := by
    simpa [SelectedClass] using hcardFilter
  have hcardAmbient :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) rho).card := by
    exact le_trans hcardErase (Finset.card_le_card (by
      rw [selectedClass_erase_eq]
      exact Finset.erase_subset q
        (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) rho)))
  have hrhoeq : rho = radius :=
    hM44.pinnedLeftSurplusResidual_k4Radius_eq
      hconv hpinned hrho hcardAmbient
  subst rho
  have hclassCard :
      (SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard, _hsub, _hright, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hq, hclassCard]
    at hcardErase
  omega

/-- The right-pinned residual exposes the residual point's selected-class
membership. -/
theorem pinnedRightSurplusResidual_mem_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hleft, hxT,
      _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  exact hxT

/-- The left-pinned residual exposes the residual point's selected-class
membership. -/
theorem pinnedLeftSurplusResidual_mem_selectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hright, hxT,
      _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  exact hxT

/-- In a right-pinned residual, the residual point is the only surplus-cap
interior point in the pinned selected class. -/
theorem pinnedRightSurplusResidual_surplusInterior_mem_selectedClass_iff
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x y : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hy : y ∈ S.capInteriorByIndex S.surplusIdx) :
    y ∈ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) radius ↔
      y = x := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hleft, hx,
      _hxSurplus, _hleftEq, hrightEq, _hright_ne, _hleft_ne⟩
  have hyRightInterior :
      y ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hy
  have hyRight : y ∈ S.rightAdjacentCapByIndex S.oppIndex1 :=
    S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.oppIndex1 hyRightInterior
  constructor
  · intro hyClass
    have hyInter :
        y ∈ SelectedClass A
            (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr ⟨hyClass, hyRight⟩
    rw [hrightEq] at hyInter
    simpa using hyInter
  · intro hyx
    simpa [hyx] using hx

/-- Mirror uniqueness of the surplus-cap interior point in a left-pinned
selected class. -/
theorem pinnedLeftSurplusResidual_surplusInterior_mem_selectedClass_iff
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x y : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hy : y ∈ S.capInteriorByIndex S.surplusIdx) :
    y ∈ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) radius ↔
      y = x := by
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hright, hx,
      _hxSurplus, hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hyLeftInterior :
      y ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hy
  have hyLeft : y ∈ S.leftAdjacentCapByIndex S.oppIndex2 :=
    S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
      S.oppIndex2 hyLeftInterior
  constructor
  · intro hyClass
    have hyInter :
        y ∈ SelectedClass A
            (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex2 :=
      Finset.mem_inter.mpr ⟨hyClass, hyLeft⟩
    rw [hleftEq] at hyInter
    simpa using hyInter
  · intro hyx
    simpa [hyx] using hx

/-- A right-pinned residual carries a labelled three-point surplus-interior
subpacket containing the residual point. -/
theorem IsM44.exists_surplusInterior_triple_of_pinnedRightSurplusResidual
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  exact hM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus
    (S.pinnedRightSurplusResidual_radius_pos hpinned)
    (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)
    (S.pinnedRightSurplusResidual_mem_right_surplus hpinned)

/-- A left-pinned residual carries a labelled three-point surplus-interior
subpacket containing the residual point. -/
theorem IsM44.exists_surplusInterior_triple_of_pinnedLeftSurplusResidual
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  exact hM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus
    (S.pinnedLeftSurplusResidual_radius_pos hpinned)
    (S.pinnedLeftSurplusResidual_mem_selectedClass hpinned)
    (S.pinnedLeftSurplusResidual_mem_left_surplus hpinned)

/-- The right-pinned residual payload identifies the whole selected class:
there are no points beyond the two private cap-interior points, the other
non-surplus shared endpoint, and the surplus-side escape point. -/
theorem pinnedRightSurplusResidual_selectedClass_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hTcard, hIsub, hleftT, hxT, _hxSurplus,
      _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₁T : p₁ ∈ T := hIsub hp₁I
  have hp₂T : p₂ ∈ T := hIsub hp₂I
  have hleftAdj :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
        S.leftAdjacentCapByIndex S.oppIndex1 :=
    S.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex S.oppIndex1
  rcases Finset.mem_sdiff.mp hxSurplus with ⟨hxRight, hxNotOwnOrLeft⟩
  have hxNotLeft : x ∉ S.leftAdjacentCapByIndex S.oppIndex1 := by
    intro hxLeft
    exact hxNotOwnOrLeft (Finset.mem_union.mpr (Or.inr hxLeft))
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex1 hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex1 hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁_ne_left : p₁ ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hleftAdj)))
  have hp₂_ne_left : p₂ ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hleftAdj)))
  have hp₁_ne_x : p₁ ≠ x := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hxRight)))
  have hp₂_ne_x : p₂ ≠ x := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hxRight)))
  have hleft_ne_x : S.leftOuterVertexByIndex S.oppIndex1 ≠ x := by
    intro h
    exact hxNotLeft (by simpa [h] using hleftAdj)
  have hnamed_sub :
      ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²) ⊆ T := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hp₁T
    · exact hp₂T
    · exact hleftT
    · exact hxT
  have hnamed_card :
      ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²).card = 4 := by
    simp [hpne, hp₁_ne_left, hp₂_ne_left, hp₁_ne_x, hp₂_ne_x,
      hleft_ne_x]
  have hnamed_eq_T :
      ({p₁, p₂, S.leftOuterVertexByIndex S.oppIndex1, x} :
          Finset ℝ²) = T := by
    exact Finset.eq_of_subset_of_card_le hnamed_sub (by
      rw [hTcard, hnamed_card])
  exact ⟨p₁, p₂, hpne, hpair, by simpa [T] using hnamed_eq_T.symm⟩

/-- The left-pinned residual payload identifies the whole selected class:
there are no points beyond the two private cap-interior points, the surplus-side
escape point, and the other non-surplus shared endpoint. -/
theorem pinnedLeftSurplusResidual_selectedClass_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  rcases hpinned with
    ⟨p₁, p₂, hpne, hpair, hTcard, hIsub, hrightT, hxT, _hxSurplus,
      _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₁T : p₁ ∈ T := hIsub hp₁I
  have hp₂T : p₂ ∈ T := hIsub hp₂I
  have hrightAdj :
      S.rightOuterVertexByIndex S.oppIndex2 ∈
        S.rightAdjacentCapByIndex S.oppIndex2 :=
    S.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex S.oppIndex2
  rcases Finset.mem_sdiff.mp hxSurplus with ⟨hxLeft, hxNotOwnOrRight⟩
  have hxNotRight : x ∉ S.rightAdjacentCapByIndex S.oppIndex2 := by
    intro hxRight
    exact hxNotOwnOrRight (Finset.mem_union.mpr (Or.inr hxRight))
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex2 hp₁I) with
    ⟨_hp₁Cap, hp₁NotAdj⟩
  rcases Finset.mem_sdiff.mp
      (S.capInteriorByIndex_mem_private S.oppIndex2 hp₂I) with
    ⟨_hp₂Cap, hp₂NotAdj⟩
  have hp₁_ne_right : p₁ ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hrightAdj)))
  have hp₂_ne_right : p₂ ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inr (by simpa [h] using hrightAdj)))
  have hp₁_ne_x : p₁ ≠ x := by
    intro h
    exact hp₁NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hxLeft)))
  have hp₂_ne_x : p₂ ≠ x := by
    intro h
    exact hp₂NotAdj (Finset.mem_union.mpr
      (Or.inl (by simpa [h] using hxLeft)))
  have hx_ne_right : x ≠ S.rightOuterVertexByIndex S.oppIndex2 := by
    intro h
    exact hxNotRight (by simpa [← h] using hrightAdj)
  have hnamed_sub :
      ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²) ⊆ T := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hp₁T
    · exact hp₂T
    · exact hxT
    · exact hrightT
  have hnamed_card :
      ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²).card = 4 := by
    simp [hpne, hp₁_ne_right, hp₂_ne_right, hp₁_ne_x, hp₂_ne_x,
      hx_ne_right]
  have hnamed_eq_T :
      ({p₁, p₂, x, S.rightOuterVertexByIndex S.oppIndex2} :
          Finset ℝ²) = T := by
    exact Finset.eq_of_subset_of_card_le hnamed_sub (by
      rw [hTcard, hnamed_card])
  exact ⟨p₁, p₂, hpne, hpair, by simpa [T] using hnamed_eq_T.symm⟩

/-- Right-pinned residual exactness rewritten with the surplus Moser apex as
the named endpoint.  This is the geometric shape corresponding to the bank
mask `{u, s*, Pw, Pu}` for the selected `.v` center. -/
theorem pinnedRightSurplusResidual_selectedClass_eq_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        ({p₁, p₂, S.oppositeVertexByIndex S.surplusIdx, x} :
          Finset ℝ²) := by
  rcases S.pinnedRightSurplusResidual_selectedClass_eq hpinned hxSurplus with
    ⟨p₁, p₂, hpne, hpair, hT⟩
  exact ⟨p₁, p₂, hpne, hpair, by
    simpa [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
      using hT⟩

/-- Left-pinned residual exactness rewritten with the surplus Moser apex as
the named endpoint.  This is the mirror geometric shape corresponding to the
bank mask `{u, s*, Pw, Pu}` for the selected `.v` center. -/
theorem pinnedLeftSurplusResidual_selectedClass_eq_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    ∃ p₁ p₂ : ℝ²,
      p₁ ≠ p₂ ∧
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        ({p₁, p₂, x, S.oppositeVertexByIndex S.surplusIdx} :
          Finset ℝ²) := by
  rcases S.pinnedLeftSurplusResidual_selectedClass_eq hpinned hxSurplus with
    ⟨p₁, p₂, hpne, hpair, hT⟩
  exact ⟨p₁, p₂, hpne, hpair, by
    simpa [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
      using hT⟩

/-- A surplus-side residual at the first non-surplus index pins the selected
four-class: the other adjacent singleton is the shared endpoint, and the surplus
side singleton is the residual point. -/
theorem IsM44.oppIndex1_pin_of_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪
        S.leftAdjacentCapByIndex S.oppIndex1)) :
    let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
    T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex1 ⊆ T ∧
      S.leftOuterVertexByIndex S.oppIndex1 ∈ T ∧
      x ∈ T ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex1 =
        ({S.leftOuterVertexByIndex S.oppIndex1} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex1 = ({x} : Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex1
      hradius hM44.oppIndex1_cap_card_eq_four hcard with
    ⟨hTcard, hIsub, p, q, hpLeft, _hqRight, hleftEq, hrightEq⟩
  have hpInter : p ∈ T ∩ S.leftAdjacentCapByIndex S.oppIndex1 := by
    have hp : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hleftEq] at hp
    simpa [T] using hp
  have hpT : p ∈ T := (Finset.mem_inter.mp hpInter).1
  have hpEq : p = S.leftOuterVertexByIndex S.oppIndex1 := by
    by_contra hpne
    have hpInterior :
        p ∈ S.leftAdjacentInteriorByIndex S.oppIndex1 :=
      S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
        S.oppIndex1 hradius (by simpa [T] using hpT) hpLeft hpne
    have hpStrict :
        p ∈ S.leftAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.rightAdjacentCapByIndex S.oppIndex1) :=
      S.leftAdjacentInteriorByIndex_mem_strict S.oppIndex1 hpInterior
    exact hM44.leftStrictEscape_oppIndex1_endpointData_elim hK4 hconv
      hradius hcard (by simpa [T] using hpT) hpStrict
      (fun {rho} hres => hend (rho := rho) (y := p) hres)
  have hxRightInter :
      x ∈ T ∩ S.rightAdjacentCapByIndex S.oppIndex1 := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [T] using hxT, (Finset.mem_sdiff.mp hxSurplus).1⟩
  have hxEqQ : x = q := by
    have hx : x ∈ ({q} : Finset ℝ²) := by
      rw [← hrightEq]
      simpa [T] using hxRightInter
    simpa using hx
  exact ⟨by simpa [T] using hTcard,
    by simpa [T] using hIsub,
    by
      have hp : p ∈ ({p} : Finset ℝ²) := by simp
      rw [← hleftEq] at hp
      exact by simpa [T, hpEq] using (Finset.mem_inter.mp hp).1,
    by simpa [T] using hxT,
    by simpa [T, hpEq] using hleftEq,
    by simpa [T, hxEqQ] using hrightEq⟩

/-- A surplus-side residual at the second non-surplus index pins the selected
four-class: the surplus-side singleton is the residual point, and the other
adjacent singleton is the shared endpoint. -/
theorem IsM44.oppIndex2_pin_of_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪
        S.rightAdjacentCapByIndex S.oppIndex2)) :
    let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
    T.card = 4 ∧
      S.capInteriorByIndex S.oppIndex2 ⊆ T ∧
      S.rightOuterVertexByIndex S.oppIndex2 ∈ T ∧
      x ∈ T ∧
      T ∩ S.leftAdjacentCapByIndex S.oppIndex2 = ({x} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
        ({S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex2
      hradius hM44.oppIndex2_cap_card_eq_four hcard with
    ⟨hTcard, hIsub, p, q, _hpLeft, hqRight, hleftEq, hrightEq⟩
  have hqInter : q ∈ T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
    have hq : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hrightEq] at hq
    simpa [T] using hq
  have hqT : q ∈ T := (Finset.mem_inter.mp hqInter).1
  have hqEq : q = S.rightOuterVertexByIndex S.oppIndex2 := by
    by_contra hqne
    have hqInterior :
        q ∈ S.rightAdjacentInteriorByIndex S.oppIndex2 :=
      S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
        S.oppIndex2 hradius (by simpa [T] using hqT) hqRight hqne
    have hqStrict :
        q ∈ S.rightAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.leftAdjacentCapByIndex S.oppIndex2) :=
      S.rightAdjacentInteriorByIndex_mem_strict S.oppIndex2 hqInterior
    exact hM44.rightStrictEscape_oppIndex2_endpointData_elim hK4 hconv
      hradius hcard (by simpa [T] using hqT) hqStrict
      (fun {rho} hres => hend (rho := rho) (y := q) hres)
  have hxLeftInter :
      x ∈ T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [T] using hxT, (Finset.mem_sdiff.mp hxSurplus).1⟩
  have hxEqP : x = p := by
    have hx : x ∈ ({p} : Finset ℝ²) := by
      rw [← hleftEq]
      simpa [T] using hxLeftInter
    simpa using hx
  exact ⟨by simpa [T] using hTcard,
    by simpa [T] using hIsub,
    by
      have hq : q ∈ ({q} : Finset ℝ²) := by simp
      rw [← hrightEq] at hq
      exact by simpa [T, hqEq] using (Finset.mem_inter.mp hq).1,
    by simpa [T] using hxT,
    by simpa [T, hxEqP] using hleftEq,
    by simpa [T, hqEq] using hrightEq⟩

/-- A right-surplus escape at the first non-surplus index produces the pinned
residual payload consumed by the COMP-G surplus branch. -/
theorem IsM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪
        S.leftAdjacentCapByIndex S.oppIndex1)) :
    S.PinnedRightSurplusResidualAt radius x := by
  classical
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, _q₁, _q₂, hpne, hpair, _hqne, _hpair2⟩
  have hpairCap :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [oppInterior1] using hpair
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairCap]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairCap]
    simp
  rcases hM44.oppIndex1_pin_of_right_surplus hK4 hconv hradius hcard
      hend hxT hxSurplus with
    ⟨hTcard, hIsub, hleftOuterT, hxT', hleftEq, hrightEq⟩
  have hp₁T : p₁ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hIsub hp₁I
  have hp₂T : p₂ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius :=
    hIsub hp₂I
  have hright_ne :
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex1) :=
    S.capInterior_pair_dist_ne_rightOuter_of_selectedClass S.oppIndex1
      hp₁I hp₂I hpne hp₁T hp₂T
  have hleft_ne :
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex1) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex1) :=
    S.capInterior_pair_dist_ne_leftOuter_of_selectedClass S.oppIndex1
      hp₁I hp₂I hpne hp₁T hp₂T
  exact ⟨p₁, p₂, hpne, hpairCap, hTcard, hIsub,
    hleftOuterT, hxT', hxSurplus, hleftEq, hrightEq, hright_ne, hleft_ne⟩

/-- A left-surplus escape at the second non-surplus index produces the mirror
pinned residual payload consumed by the COMP-G surplus branch. -/
theorem IsM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪
        S.rightAdjacentCapByIndex S.oppIndex2)) :
    S.PinnedLeftSurplusResidualAt radius x := by
  classical
  rcases hM44.exists_oppInterior_pairs with
    ⟨_q₁, _q₂, p₁, p₂, _hqne, _hpair1, hpne, hpair⟩
  have hpairCap :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [oppInterior2] using hpair
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairCap]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairCap]
    simp
  rcases hM44.oppIndex2_pin_of_left_surplus hK4 hconv hradius hcard
      hend hxT hxSurplus with
    ⟨hTcard, hIsub, hrightOuterT, hxT', hleftEq, hrightEq⟩
  have hp₁T : p₁ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hIsub hp₁I
  have hp₂T : p₂ ∈
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius :=
    hIsub hp₂I
  have hright_ne :
      dist p₁ (S.rightOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.rightOuterVertexByIndex S.oppIndex2) :=
    S.capInterior_pair_dist_ne_rightOuter_of_selectedClass S.oppIndex2
      hp₁I hp₂I hpne hp₁T hp₂T
  have hleft_ne :
      dist p₁ (S.leftOuterVertexByIndex S.oppIndex2) ≠
        dist p₂ (S.leftOuterVertexByIndex S.oppIndex2) :=
    S.capInterior_pair_dist_ne_leftOuter_of_selectedClass S.oppIndex2
      hp₁I hp₂I hpne hp₁T hp₂T
  exact ⟨p₁, p₂, hpne, hpairCap, hTcard, hIsub,
    hrightOuterT, hxT', hxSurplus, hleftEq, hrightEq, hright_ne, hleft_ne⟩

/-- A right-surplus escape at the first non-surplus index produces both the
pinned residual payload and a three-point surplus-interior subpacket containing
the escape. -/
theorem IsM44.oppIndex1_pinnedRightResidual_and_surplusTriple_of_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1)) :
    S.PinnedRightSurplusResidualAt radius x ∧
      ∃ s1 s2 s3 : ℝ²,
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx := by
  exact ⟨hM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
      hK4 hconv hradius hcard hend hxT hxSurplus,
    hM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus
      hradius hxT hxSurplus⟩

/-- A left-surplus escape at the second non-surplus index produces both the
mirror pinned residual payload and a three-point surplus-interior subpacket
containing the escape. -/
theorem IsM44.oppIndex2_pinnedLeftResidual_and_surplusTriple_of_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {y : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho y → False)
    {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2)) :
    S.PinnedLeftSurplusResidualAt radius x ∧
      ∃ s1 s2 s3 : ℝ²,
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx := by
  exact ⟨hM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
      hK4 hconv hradius hcard hend hxT hxSurplus,
    hM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus
      hradius hxT hxSurplus⟩

/-- Endpoint residuals plus the two surplus-side residuals exclude strict
adjacent escape at both non-surplus cap indices. -/
theorem IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
        x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.leftAdjacentCapByIndex S.oppIndex1) →
        False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
        x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.rightAdjacentCapByIndex S.oppIndex2) →
        False) :
    S.NonSurplusNoStrictAdjacentEscape := by
  constructor
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend1 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus1 hradius hcard hxT hxSurplus
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend2 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus2 hradius hcard hxT hxSurplus

/-- Endpoint residuals plus the pinned surplus residual payload exclusions
exclude strict adjacent escape at both non-surplus cap indices.  Compared with
`IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals`, the two
surplus assumptions now receive the pinned class and the reflection
non-equidistance facts rather than the raw escape witness alone. -/
theorem IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_pinnedSurplusResiduals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedRightSurplusResidualAt radius x → False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedLeftSurplusResidualAt radius x → False) :
    S.NonSurplusNoStrictAdjacentEscape := by
  constructor
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend1 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus1
      (hM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
        hK4 hconv hradius hcard
        (fun {rho} {y} hres =>
          hend1 (radius := radius) (rho := rho) (x := y) hres)
        hxT hxSurplus)
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend2 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus2
      (hM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
        hK4 hconv hradius hcard
        (fun {rho} {y} hres =>
          hend2 (radius := radius) (rho := rho) (x := y) hres)
        hxT hxSurplus)

/-- Endpoint residuals plus the two surplus-side residuals supply the
non-surplus Moser-cap containment interface used by the Q-facing row. -/
theorem IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
        x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.leftAdjacentCapByIndex S.oppIndex1) →
        False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
        x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.rightAdjacentCapByIndex S.oppIndex2) →
        False) :
    S.NonSurplusMoserCapContainment :=
  hM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape hconv
    (hM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals
      hK4 hconv hend1 hend2 hsurplus1 hsurplus2)

/-- Pinned-residual version of
`IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals`. -/
theorem IsM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedRightSurplusResidualAt radius x → False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedLeftSurplusResidualAt radius x → False) :
    S.NonSurplusMoserCapContainment :=
  hM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape hconv
    (hM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_pinnedSurplusResiduals
      hK4 hconv hend1 hend2 hsurplus1 hsurplus2)

/-- At the surplus cap index, the left-adjacent interior is the first
non-surplus opposite interior. -/
theorem leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentInteriorByIndex S.surplusIdx = S.oppInterior1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentInteriorByIndex, oppInterior1, oppIndex1, hi]

/-- At the surplus cap index, the right-adjacent interior is the second
non-surplus opposite interior. -/
theorem rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentInteriorByIndex S.surplusIdx = S.oppInterior2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentInteriorByIndex, oppInterior2, oppIndex2, hi]

/-- An `(m,4,4)` packet admits names for the two strict interior points in
each adjacent cap of the surplus cap. -/
theorem IsM44.exists_surplusAdjacentInterior_pairs
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) :
    ∃ xL yL xR yR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) := by
  rcases hM44.exists_oppInterior_pairs with
    ⟨x1, y1, x2, y2, hxy1, hpair1, hxy2, hpair2⟩
  exact ⟨x1, y1, x2, y2, hxy1,
    by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      exact hpair1,
    hxy2,
    by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      exact hpair2⟩

/-- A surplus-side selector packet, together with the named finite alternatives
for both adjacent singleton rows.  The selected adjacent witnesses are explicit
hypotheses; producing them is the next upstream interface. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    {pL pR : ℝ²}
    (hpL : pL ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.leftAdjacentCapByIndex S.surplusIdx)
    (hpR : pR ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.rightAdjacentCapByIndex S.surplusIdx) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      pL ∈ T ∧
      pR ∈ T ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  rcases hM44.exists_surplusAdjacentInterior_pairs with
    ⟨xL, yL, xR, yR, hxyL, hleftPair, hxyR, hrightPair⟩
  rcases S.exists_surplusMoserSubpacketSelectorShape_preserving_adjacent
      hconv hradius hcard hpL hpR with
    ⟨T, hpLT, hpRT, hshape⟩
  rcases S.moserSubpacketSelectorShapeAt_adjacent_named_or_outer
      S.surplusIdx hradius hshape hleftPair hrightPair with
    ⟨rowL, rowR, hrowL, hrowR, hrowLeq, hrowReq⟩
  exact ⟨T, xL, yL, xR, yR, rowL, rowR, hxyL, hleftPair,
    hxyR, hrightPair, hpLT, hpRT, hshape, hrowL, hrowR, hrowLeq, hrowReq⟩

/-- Count-facing version of
`IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent`: positive hits in
both adjacent closed caps supply the selected adjacent witnesses. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hleft :
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.leftAdjacentCapByIndex S.surplusIdx).card)
    (hright :
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.rightAdjacentCapByIndex S.surplusIdx).card) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hleft_pos :
      0 < (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.leftAdjacentCapByIndex S.surplusIdx).card := by
    omega
  have hright_pos :
      0 < (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.rightAdjacentCapByIndex S.surplusIdx).card := by
    omega
  rcases Finset.card_pos.mp hleft_pos with ⟨pL, hpL⟩
  rcases Finset.card_pos.mp hright_pos with ⟨pR, hpR⟩
  rcases hM44.exists_surplusSelectorNamedSplit_of_selected_adjacent
      hconv hradius hcard hpL hpR with
    ⟨T, xL, yL, xR, yR, rowL, rowR, hxyL, hleftPair,
      hxyR, hrightPair, _hpLT, _hpRT, hshape, hrowL, hrowR, hrowLeq, hrowReq⟩
  exact ⟨T, xL, yL, xR, yR, rowL, rowR, hxyL, hleftPair, hxyR,
    hrightPair, hshape, hrowL, hrowR, hrowLeq, hrowReq⟩

/-- Form `a` at the surplus cap index supplies the positive adjacent closed-cap
counts needed for the surplus selector named split. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_formA
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hform : S.IsMoserCapFormAAt S.surplusIdx radius) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hcounts :=
    S.isMoserCapFormAAt_adjacentClosedCounts_pos S.surplusIdx hform
  exact hM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    hconv hradius hcard hcounts.1 hcounts.2

/-- Form `b` at the surplus cap index supplies the positive adjacent closed-cap
counts needed for the surplus selector named split. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_formB
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hform : S.IsMoserCapFormBAt S.surplusIdx radius) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hcounts :=
    S.isMoserCapFormBAt_adjacentClosedCounts_pos S.surplusIdx hform
  exact hM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    hconv hradius hcard hcounts.1 hcounts.2

/-- Form `c` at the surplus cap index supplies the positive adjacent closed-cap
counts needed for the surplus selector named split. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_formC
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hform : S.IsMoserCapFormCAt S.surplusIdx radius) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hcounts :=
    S.isMoserCapFormCAt_adjacentClosedCounts_pos S.surplusIdx hform
  exact hM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    hconv hradius hcard hcounts.1 hcounts.2


end SurplusCapPacket

end Problem97
