/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.PropositionEExactTen
import Erdos9796Proof.P97.U1CardTenCapProfile
import Erdos9796Proof.P97.CapBridgeFromK4
import Erdos9796Proof.P97.SmallCardinality
import Erdos9796Proof.P97.U2SqueezePort
import Erdos9796Proof.P97.SurplusM44Packet.Shard04
import Erdos9796Proof.P97.EndpointCertificate.GeometryProducer
import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusBank

/-!
# Finite n = 10 endpoint

`FiniteN10Closure` is the headline exact-ten endpoint, following the public
`FiniteN9Closure` naming convention.

For a `CounterexampleData` with ten points, the closed-cap sum is `13`, every
cap has at least four points, and the designated surplus cap has more than
four points.  Hence the carried packet is automatically in the exact
`(5,4,4)` regime and satisfies `CounterexampleData.IsM44`.

At exact ten the surplus cap has cardinality five.  The label-complete endpoint
and pinned-surplus geometry producers therefore map every possible strict
escape into their checked finite banks.  The resulting four residual
exclusions imply non-surplus Moser-cap containment; the existing U2 squeeze
and Proposition E then close the carrier.  No abstract Phase-3 assignment is
treated as a Euclidean counterexample or certificate in this theorem.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Every ten-point `CounterexampleData` carries the exact `(5,4,4)` cap
profile, so its already-designated surplus packet is `IsM44`. -/
theorem isM44_of_card_eq_ten
    {D : CounterexampleData} (hcard : D.A.card = 10) : D.IsM44 := by
  have hlower :
      4 ≤ D.packet.partition.C1.card ∧
      4 ≤ D.packet.partition.C2.card ∧
      4 ≤ D.packet.partition.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      D.packet.partition D.convex D.packet.hncol D.K4
      (CircumscribedMECPacket.ofNonObtuse
        D.packet.triangleNonObtuse D.packet.hCirc)
  have hsum := D.capSum
  have hsurplus := D.surplus_card_gt_four
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [CounterexampleData.IsM44, SurplusCapPacket.IsM44,
      SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus ⊢ <;>
    omega

/-- Proposition E closes the exact-ten branch once its genuine U2
full-distance-class input is available; `IsM44` is forced by cardinality and
is no longer a caller hypothesis. -/
theorem false_of_card_eq_ten_and_u2FullDistanceClasses
    (D : CounterexampleData) (hcard : D.A.card = 10)
    (hFD : U2FullDistanceClasses D) : False :=
  propositionE_n10_of_u2FullDistanceClasses D hcard
    (isM44_of_card_eq_ten hcard) hFD

/-- Compatibility wrapper for callers carrying the bundled `U2Statement`. -/
theorem false_of_card_eq_ten_and_u2Statement
    (D : CounterexampleData) (hcard : D.A.card = 10)
    (hU2 : U2Statement D) : False :=
  false_of_card_eq_ten_and_u2FullDistanceClasses D hcard hU2.2.1

/-! ### Exact-ten U2 assembly -/

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppositeVertexByIndex_oppIndex1_eq_oppApex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1, hi]

private theorem oppositeVertexByIndex_oppIndex2_eq_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex2 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, SurplusCapPacket.oppApex2, hi]

/-- Exact ten forces the label-complete `m = 5` surplus-cap regime. -/
theorem finiteN10_surplusCap_card_eq_five
    (D : CounterexampleData) (hcard : D.A.card = 10) :
    D.packet.surplusCap.card = 5 := by
  have hM44 := isM44_of_card_eq_ten (D := D) hcard
  have hsum := D.packet.capSum
  have hsurplus := hM44.surplus_card_eq
  omega

/-- Exact-ten endpoint and pinned-surplus certificates exclude every strict
escape at the two non-surplus Moser caps. -/
theorem finiteN10_nonSurplusMoserCapContainment
    (D : CounterexampleData) (hcard : D.A.card = 10) :
    D.packet.NonSurplusMoserCapContainment := by
  have hM44 : D.IsM44 := isM44_of_card_eq_ten hcard
  have hcard5 : D.packet.surplusCap.card = 5 :=
    finiteN10_surplusCap_card_eq_five D hcard
  have hgt : 9 < D.A.card := by omega
  have hMin :
      ∀ B : Finset ℝ², B.card < D.A.card →
        B.Nonempty → ConvexIndep B →
          HasNEquidistantProperty 4 B → False := by
    intro B hlt hBne hBconv hBK4
    exact
      (not_hasNEquidistantProperty_four_of_card_le_nine
        hBne hBconv (by omega)) hBK4
  have hend1 :
      ∀ {radius rho : ℝ} {x : ℝ²},
        D.packet.EndpointEscapeLeftAt D.packet.oppIndex1 radius rho x →
          False :=
    fun hend =>
      EndpointCertificate.endpointLeft_residual_false_of_card_five
        hM44 D.nonempty D.convex D.K4 hcard5 hend
  have hend2 :
      ∀ {radius rho : ℝ} {x : ℝ²},
        D.packet.EndpointEscapeRightAt D.packet.oppIndex2 radius rho x →
          False :=
    fun hend =>
      EndpointCertificate.endpointRight_residual_false_of_card_five
        hM44 D.nonempty D.convex D.K4 hcard5 hend
  rcases isM44PinnedSurplusResidualsExcluded_of_card_five
      D.nonempty D.convex D.K4 hgt hMin D.packet hM44 hcard5 with
    ⟨hpin1, hpin2⟩
  exact hM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals
    D.K4 D.convex hend1 hend2 hpin1 hpin2

/-- Exact-ten's unconditional U2 producer, obtained from the checked endpoint
and pinned-surplus banks through non-surplus Moser-cap containment. -/
theorem finiteN10_u2FullDistanceClasses
    (D : CounterexampleData) (hcard : D.A.card = 10) :
    U2FullDistanceClasses D := by
  have hcontain := finiteN10_nonSurplusMoserCapContainment D hcard
  apply u2FullDistanceClasses_of_capContainment D
  · intro _hM44 radius hradius hclassCard
    have hcontain1 := hcontain.1 (radius := radius) hradius
      (by
        simpa [SelectedClass, dist_comm,
          oppositeVertexByIndex_oppIndex1_eq_oppApex1] using hclassCard)
    simpa [SelectedClass, dist_comm,
      oppositeVertexByIndex_oppIndex1_eq_oppApex1,
      capByIndex_oppIndex1_eq_oppCap1] using hcontain1
  · intro _hM44 radius hradius hclassCard
    have hcontain2 := hcontain.2 (radius := radius) hradius
      (by
        simpa [SelectedClass, dist_comm,
          oppositeVertexByIndex_oppIndex2_eq_oppApex2] using hclassCard)
    simpa [SelectedClass, dist_comm,
      oppositeVertexByIndex_oppIndex2_eq_oppApex2,
      capByIndex_oppIndex2_eq_oppCap2] using hcontain2

/-- The `n = 10` endpoint: a ten-point convex-independent carrier cannot have
the four-equidistant-points property.  This is the exact-ten headline theorem,
parallel to `FiniteN9Closure`. -/
theorem FiniteN10Closure : FiniteN10ClosureStatement := by
  intro A hcard hconv hK4
  have hne : A.Nonempty := Finset.card_pos.mp (by omega)
  obtain ⟨S⟩ := MEC.nonempty_surplusCapPacket_of_K4 hne hconv hK4 (by omega)
  let D : CounterexampleData :=
    { A := A
      nonempty := hne
      convex := hconv
      K4 := hK4
      packet := S }
  exact false_of_card_eq_ten_and_u2FullDistanceClasses D hcard
    (finiteN10_u2FullDistanceClasses D hcard)

end Problem97
