/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Card13BoundaryNormalization
import Erdos9796Proof.P97.ATail.ExactFiveGlobalCoverStarGeometry

/-!
# Common labels for the card-thirteen asymmetric exact-five arm

This scratch module transports the three physical roles of a two-hit source
row into the same canonical `Fin 13` boundary frame used by the ordinal
certificate.  It retains the source row's actual support and center facts and
packages both orientations of the strict Kalmanson inequalities.

The production shared-cap-order packet chooses its ordered cap independently
of the ambient boundary enumeration.  The final theorem compares both orders
through the oriented physical cap and proves that its middle role is canonical
index `2` in either ambient orientation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13CommonLabelTransportScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Direct-orientation form of the two strict Kalmanson inequalities on a
card-thirteen CCW boundary. -/
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

/-- Source-valid common frame for the asymmetric card-thirteen certificate.
The three role indices are pairwise distinct strict physical-cap indices, and
the blocker is the middle index `2`; hence the source roles have exactly the
two orbits `(1,2,3)` and `(3,2,1)`. -/
structure CanonicalAsymmetricRolePrepacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M) : Type where
  point : Fin 13 → ℝ²
  point_injective : Function.Injective point
  point_image : Finset.univ.image point = D.A
  surplusOpposite_at_zero :
    point 0 = S.oppositeVertexByIndex S.surplusIdx
  firstApex_at_four :
    point 4 = S.oppositeVertexByIndex S.oppIndex1
  secondApex_at_eight :
    point 8 = S.oppositeVertexByIndex S.oppIndex2
  strictKalmanson : ∀ {a b c d : Fin 13}, a < b → b < c → c < d →
    (dist (point b) (point c) + dist (point a) (point d) <
        dist (point a) (point c) + dist (point b) (point d)) ∧
      (dist (point a) (point b) + dist (point c) (point d) <
        dist (point a) (point c) + dist (point b) (point d))
  sourceIndex : Fin 13
  blockerIndex : Fin 13
  thirdIndex : Fin 13
  sourceIndex_strict : (0 : Fin 13) < sourceIndex ∧ sourceIndex < 4
  blockerIndex_strict : (0 : Fin 13) < blockerIndex ∧ blockerIndex < 4
  thirdIndex_strict : (0 : Fin 13) < thirdIndex ∧ thirdIndex < 4
  source_point : point sourceIndex = M.source.1
  blocker_point : point blockerIndex = M.target.1
  third_point : point thirdIndex = N.third.1
  source_ne_blocker : sourceIndex ≠ blockerIndex
  source_ne_third : sourceIndex ≠ thirdIndex
  blocker_ne_third : blockerIndex ≠ thirdIndex
  blockerIndex_eq_two : blockerIndex = (2 : Fin 13)
  source_mem_actualSupport :
    M.source.1 ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support
  third_mem_actualSupport :
    N.third.1 ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support
  actualCenter_eq_blocker :
    H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.target.1
  actualSupport_inter_physicalCap_eq :
    (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 =
      ({M.source.1, N.third.1} : Finset ℝ²)
  sharedCapOrder : SourceTwoHitSharedCapOrder N

namespace CanonicalAsymmetricRolePrepacket

/-- The three pairwise-distinct strict indices have exactly the two source-role
orbits used by the external certificate. -/
theorem source_role_orbits_of_blockerIndex_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    (hmiddle : P.blockerIndex = (2 : Fin 13)) :
    (P.sourceIndex = (1 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (3 : Fin 13)) ∨
      (P.sourceIndex = (3 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (1 : Fin 13)) := by
  rcases P.sourceIndex_strict with ⟨hsource0, hsource4⟩
  rcases P.thirdIndex_strict with ⟨hthird0, hthird4⟩
  have hsourceNeTwo : P.sourceIndex.val ≠ 2 := by
    intro h
    apply P.source_ne_blocker
    apply Fin.ext
    simpa [hmiddle] using h
  have hthirdNeTwo : P.thirdIndex.val ≠ 2 := by
    intro h
    apply P.blocker_ne_third
    apply Fin.ext
    simpa [hmiddle] using h.symm
  have hsourceNeThird : P.sourceIndex.val ≠ P.thirdIndex.val := by
    intro h
    exact P.source_ne_third (Fin.ext h)
  omega

/-- Unconditional source-role orbit classification carried by the canonical
prepacket. -/
theorem source_role_orbits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) :
    (P.sourceIndex = (1 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (3 : Fin 13)) ∨
      (P.sourceIndex = (3 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (1 : Fin 13)) :=
  source_role_orbits_of_blockerIndex_eq_two P P.blockerIndex_eq_two

end CanonicalAsymmetricRolePrepacket

private theorem canonical_index_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (hsecond : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ∃ i : Fin 13, (0 : Fin 13) < i ∧ i < 4 ∧ phi i = x := by
  exact S.capInteriorByIndex_open_interval_of_global_indices S.oppIndex2
    hccw hinj himage (ia := (0 : Fin 13)) (ib := (4 : Fin 13))
    (ic := (8 : Fin 13)) (by decide) (Or.inr (by decide))
    (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hsecond)
    (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
      using hzero)
    (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
      using hfirst)
    hx

private theorem canonical_index_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = D.A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hsecond : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    ∃ i : Fin 13, (0 : Fin 13) < i ∧ i < 4 ∧
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
  have hq0 : (0 : Fin 13) < q := (by omega)
  let i : Fin 13 := reverseCyclicIndex13 q
  have hiVal : i.val = 13 - q.val :=
    reverseCyclicIndex13_val_of_pos hq0
  have hi0 : (0 : Fin 13) < i := by
    rw [Fin.lt_def, hiVal]
    omega
  have hi4 : i < (4 : Fin 13) := by
    rw [Fin.lt_def, hiVal]
    omega
  refine ⟨i, hi0, hi4, ?_⟩
  have hinvol : reverseCyclicIndex13 i = q := by
    simp [i, reverseCyclicIndex13]
  simpa [hinvol] using hqpoint

private theorem local_straddle_of_sourceTwoHitNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M)
    {m : ℕ} (L : CGN.OrderedCap m)
    (Packet : CGN.MecCapPacket D.A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder D.A L)
    (sourceIndex blockerIndex thirdIndex : Fin m)
    (source_point : L.points sourceIndex = M.source.1)
    (blocker_point : L.points blockerIndex = M.target.1)
    (third_point : L.points thirdIndex = N.third.1) :
    (sourceIndex < blockerIndex ∧ blockerIndex < thirdIndex) ∨
      (thirdIndex < blockerIndex ∧ blockerIndex < sourceIndex) := by
  let row := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have hdist :
      dist (L.points blockerIndex) (L.points sourceIndex) =
        dist (L.points blockerIndex) (L.points thirdIndex) := by
    have hrowEq : dist M.target.1 M.source.1 = dist M.target.1 N.third.1 := by
      rw [← N.sourceBlocker_eq_target]
      exact (row.support_eq_radius M.source.1 row.q_mem_support).trans
        (row.support_eq_radius N.third.1 N.third_mem_sourceSupport).symm
    simpa only [blocker_point, source_point, third_point] using hrowEq
  have hblocker_ne_source : blockerIndex ≠ sourceIndex := by
    intro h
    apply PhysicalActualCriticalMutualOmissionPair.source_ne_target M
    apply Subtype.ext
    calc
      M.source.1 = L.points sourceIndex := source_point.symm
      _ = L.points blockerIndex := by rw [h]
      _ = M.target.1 := blocker_point
  have hblocker_ne_third : blockerIndex ≠ thirdIndex := by
    intro h
    apply N.third_ne_target
    apply Subtype.ext
    calc
      N.third.1 = L.points thirdIndex := third_point.symm
      _ = L.points blockerIndex := by rw [← h]
      _ = M.target.1 := blocker_point
  have hsource_ne_third : sourceIndex ≠ thirdIndex := by
    intro h
    apply N.third_ne_source
    apply Subtype.ext
    calc
      N.third.1 = L.points thirdIndex := third_point.symm
      _ = L.points sourceIndex := by rw [← h]
      _ = M.source.1 := source_point
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket Packet Hside Hord
  rcases lt_or_gt_of_ne hblocker_ne_source with hblockerSource | hsourceBlocker
  · have hthirdBlocker : thirdIndex < blockerIndex := by
      rcases lt_or_gt_of_ne hblocker_ne_third with hblockerThird | hthirdBlocker
      · rcases lt_or_gt_of_ne hsource_ne_third with hsourceThird | hthirdSource
        · exact False.elim ((hinj.1 hblockerSource hsourceThird) hdist)
        · exact False.elim ((hinj.1 hblockerThird hthirdSource) hdist.symm)
      · exact hthirdBlocker
    exact Or.inr ⟨hthirdBlocker, hblockerSource⟩
  · have hblockerThird : blockerIndex < thirdIndex := by
      rcases lt_or_gt_of_ne hblocker_ne_third with hblockerThird | hthirdBlocker
      · exact hblockerThird
      · rcases lt_or_gt_of_ne hsource_ne_third with hsourceThird | hthirdSource
        · exact False.elim ((hinj.2 hsourceThird hthirdBlocker) hdist)
        · exact False.elim ((hinj.2 hthirdSource hsourceBlocker) hdist.symm)
    exact Or.inl ⟨hsourceBlocker, hblockerThird⟩

private theorem blockerIndex_eq_two_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M)
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
    (sourceIndex blockerIndex thirdIndex : Fin 13)
    (hsource : (0 : Fin 13) < sourceIndex ∧ sourceIndex < 4)
    (hblocker : (0 : Fin 13) < blockerIndex ∧ blockerIndex < 4)
    (hthird : (0 : Fin 13) < thirdIndex ∧ thirdIndex < 4)
    (source_point : phi sourceIndex = M.source.1)
    (blocker_point : phi blockerIndex = M.target.1)
    (third_point : phi thirdIndex = N.third.1) :
    blockerIndex = (2 : Fin 13) := by
  rcases S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap, horient⟩
  have hsourceCap : M.source.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.source)
  have hblockerCap : M.target.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.target)
  have hthirdCap : N.third.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior N.third)
  rw [← hcap] at hsourceCap hblockerCap hthirdCap
  rcases Finset.mem_image.mp hsourceCap with ⟨sourceLocal, _hs, source_local_point⟩
  rcases Finset.mem_image.mp hblockerCap with ⟨blockerLocal, _hb, blocker_local_point⟩
  rcases Finset.mem_image.mp hthirdCap with ⟨thirdLocal, _ht, third_local_point⟩
  haveI : NeZero m := ⟨by have := Packet.hm; omega⟩
  have source_local_to_global : L.points sourceLocal = phi sourceIndex :=
    source_local_point.trans source_point.symm
  have blocker_local_to_global : L.points blockerLocal = phi blockerIndex :=
    blocker_local_point.trans blocker_point.symm
  have third_local_to_global : L.points thirdLocal = phi thirdIndex :=
    third_local_point.trans third_point.symm
  have hv2 : phi 0 = (S.triangleByIndex S.oppIndex2).v2 := by
    simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
      using hzero
  have hv3 : phi 4 = (S.triangleByIndex S.oppIndex2).v3 := by
    simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
      using hfirst
  have horientDirect :
      L.points (CGN.firstIndex Packet.hm) = (S.triangleByIndex S.oppIndex2).v2 ∧
        L.points (CGN.lastIndex Packet.hm) = (S.triangleByIndex S.oppIndex2).v3 := by
    rcases horient with horientDirect | horientReverse
    · exact horientDirect
    · exfalso
      have hside := Hside.cap_side_nonneg sourceLocal
      have hneg := hneg_of_ccw hinj hccw hsource.1 hsource.2
      have hcyc :
          signedArea2 (phi 4) (phi 0) (phi sourceIndex) =
            signedArea2 (phi 0) (phi sourceIndex) (phi 4) := by
        simp [signedArea2]
        ring
      rw [horientReverse.1, horientReverse.2, ← hv3, ← hv2,
        source_local_point, ← source_point, hcyc] at hside
      linarith
  have local_lt_of_global_lt
      {i j : Fin 13} {li lj : Fin m}
      (hi : (0 : Fin 13) < i) (hj4 : j < (4 : Fin 13))
      (hij : i < j) (hli : L.points li = phi i)
      (hlj : L.points lj = phi j) : li < lj := by
    have hli_ne_lj : li ≠ lj := by
      intro h
      apply ne_of_lt hij
      apply hinj
      calc
        phi i = L.points li := hli.symm
        _ = L.points lj := by rw [h]
        _ = phi j := hlj
    by_contra hnot
    have hji : lj < li := lt_of_le_of_ne (le_of_not_gt hnot) hli_ne_lj.symm
    have hfirst_ne_lj : CGN.firstIndex Packet.hm ≠ lj := by
      intro h
      have hpoint : phi 0 = phi j := by
        calc
          phi 0 = (S.triangleByIndex S.oppIndex2).v2 := hv2
          _ = L.points (CGN.firstIndex Packet.hm) := horientDirect.1.symm
          _ = L.points lj := by rw [h]
          _ = phi j := hlj
      have : (0 : Fin 13) = j := hinj hpoint
      omega
    have hfirst_lt_lj : CGN.firstIndex Packet.hm < lj := by
      have hle : CGN.firstIndex Packet.hm ≤ lj := by
        simp [CGN.firstIndex]
      exact lt_of_le_of_ne hle hfirst_ne_lj
    have hpos :
        0 < signedArea2 (L.points (CGN.firstIndex Packet.hm))
          (L.points li) (L.points lj) :=
      (Hord.subchord_open_side_iff_A (hfirst_lt_lj.trans hji)
        (Packet.mem_A lj)).2 ⟨lj, hfirst_lt_lj, hji, rfl⟩
    have hneg := hneg_of_ccw hinj hccw hi hij
    rw [horientDirect.1, ← hv2, hli, hlj] at hpos
    linarith
  have localStraddle := local_straddle_of_sourceTwoHitNormalForm N L Packet
    Hside Hord sourceLocal blockerLocal thirdLocal source_local_point
    blocker_local_point third_local_point
  have hsourceBlocker : sourceIndex ≠ blockerIndex := by
    intro h
    apply PhysicalActualCriticalMutualOmissionPair.source_ne_target M
    apply Subtype.ext
    calc
      M.source.1 = phi sourceIndex := source_point.symm
      _ = phi blockerIndex := by rw [h]
      _ = M.target.1 := blocker_point
  have hblockerThird : blockerIndex ≠ thirdIndex := by
    intro h
    apply N.third_ne_target
    apply Subtype.ext
    calc
      N.third.1 = phi thirdIndex := third_point.symm
      _ = phi blockerIndex := by rw [← h]
      _ = M.target.1 := blocker_point
  rcases localStraddle with ⟨hsourceLocal, hthirdLocal⟩ |
      ⟨hthirdLocal, hsourceLocal⟩
  · have hsourceGlobal : sourceIndex < blockerIndex := by
      rcases lt_or_gt_of_ne hsourceBlocker with h | h
      · exact h
      · exact False.elim ((not_lt_of_ge hsourceLocal.le)
          (local_lt_of_global_lt hblocker.1 hsource.2 h
            blocker_local_to_global source_local_to_global))
    have hthirdGlobal : blockerIndex < thirdIndex := by
      rcases lt_or_gt_of_ne hblockerThird with h | h
      · exact h
      · exact False.elim ((not_lt_of_ge hthirdLocal.le)
          (local_lt_of_global_lt hthird.1 hblocker.2 h
            third_local_to_global blocker_local_to_global))
    apply Fin.ext
    omega
  · have hthirdGlobal : thirdIndex < blockerIndex := by
      rcases lt_or_gt_of_ne hblockerThird.symm with h | h
      · exact h
      · exact False.elim ((not_lt_of_ge hthirdLocal.le)
          (local_lt_of_global_lt hblocker.1 hthird.2 h
            blocker_local_to_global third_local_to_global))
    have hsourceGlobal : blockerIndex < sourceIndex := by
      rcases lt_or_gt_of_ne hsourceBlocker.symm with h | h
      · exact h
      · exact False.elim ((not_lt_of_ge hsourceLocal.le)
          (local_lt_of_global_lt hsource.1 hblocker.2 h
            source_local_to_global blocker_local_to_global))
    apply Fin.ext
    omega

private theorem blockerIndex_eq_two_reflected
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M)
    (phi : Fin 13 → ℝ²) (hinj : Function.Injective phi)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (hzero : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
    (hfirst : phi 9 = S.oppositeVertexByIndex S.oppIndex1)
    (sourceIndex blockerIndex thirdIndex : Fin 13)
    (hsource : (0 : Fin 13) < sourceIndex ∧ sourceIndex < 4)
    (hblocker : (0 : Fin 13) < blockerIndex ∧ blockerIndex < 4)
    (hthird : (0 : Fin 13) < thirdIndex ∧ thirdIndex < 4)
    (source_point : phi (reverseCyclicIndex13 sourceIndex) = M.source.1)
    (blocker_point : phi (reverseCyclicIndex13 blockerIndex) = M.target.1)
    (third_point : phi (reverseCyclicIndex13 thirdIndex) = N.third.1) :
    blockerIndex = (2 : Fin 13) := by
  rcases S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap, horient⟩
  have hsourceCap : M.source.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.source)
  have hblockerCap : M.target.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.target)
  have hthirdCap : N.third.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior N.third)
  rw [← hcap] at hsourceCap hblockerCap hthirdCap
  rcases Finset.mem_image.mp hsourceCap with ⟨sourceLocal, _hs, source_local_point⟩
  rcases Finset.mem_image.mp hblockerCap with ⟨blockerLocal, _hb, blocker_local_point⟩
  rcases Finset.mem_image.mp hthirdCap with ⟨thirdLocal, _ht, third_local_point⟩
  haveI : NeZero m := ⟨by have := Packet.hm; omega⟩
  have source_local_to_global :
      L.points sourceLocal = phi (reverseCyclicIndex13 sourceIndex) :=
    source_local_point.trans source_point.symm
  have blocker_local_to_global :
      L.points blockerLocal = phi (reverseCyclicIndex13 blockerIndex) :=
    blocker_local_point.trans blocker_point.symm
  have third_local_to_global :
      L.points thirdLocal = phi (reverseCyclicIndex13 thirdIndex) :=
    third_local_point.trans third_point.symm
  have hv2 : phi 0 = (S.triangleByIndex S.oppIndex2).v2 := by
    simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
      using hzero
  have hv3 : phi 9 = (S.triangleByIndex S.oppIndex2).v3 := by
    simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
      using hfirst
  have sourceRaw_val : (reverseCyclicIndex13 sourceIndex).val =
      13 - sourceIndex.val :=
    reverseCyclicIndex13_val_of_pos hsource.1
  have hsourceRaw : (9 : Fin 13) < reverseCyclicIndex13 sourceIndex := by
    rw [Fin.lt_def, sourceRaw_val]
    omega
  have horientReflected :
      L.points (CGN.firstIndex Packet.hm) = (S.triangleByIndex S.oppIndex2).v3 ∧
        L.points (CGN.lastIndex Packet.hm) = (S.triangleByIndex S.oppIndex2).v2 := by
    rcases horient with horientDirect | horientReflected
    · exfalso
      have hside := Hside.cap_side_nonneg sourceLocal
      have hneg := hneg_of_ccw hinj hccw (by decide : (0 : Fin 13) < 9)
        hsourceRaw
      rw [horientDirect.1, horientDirect.2, ← hv2, ← hv3,
        source_local_point, ← source_point] at hside
      linarith
    · exact horientReflected
  have local_lt_of_canonical_lt
      {i j : Fin 13} {li lj : Fin m}
      (hi : (0 : Fin 13) < i) (hj4 : j < (4 : Fin 13))
      (hij : i < j)
      (hli : L.points li = phi (reverseCyclicIndex13 i))
      (hlj : L.points lj = phi (reverseCyclicIndex13 j)) : lj < li := by
    have hrawJI : reverseCyclicIndex13 j < reverseCyclicIndex13 i :=
      reverseCyclicIndex13_anti_of_pos hi hij
    have rawJ_val : (reverseCyclicIndex13 j).val = 13 - j.val :=
      reverseCyclicIndex13_val_of_pos (hi.trans hij)
    have hrawJ : (9 : Fin 13) < reverseCyclicIndex13 j := by
      rw [Fin.lt_def, rawJ_val]
      omega
    have hli_ne_lj : li ≠ lj := by
      intro h
      apply ne_of_gt hrawJI
      apply hinj
      calc
        phi (reverseCyclicIndex13 i) = L.points li := hli.symm
        _ = L.points lj := by rw [h]
        _ = phi (reverseCyclicIndex13 j) := hlj
    by_contra hnot
    have hilj : li < lj := lt_of_le_of_ne (le_of_not_gt hnot) hli_ne_lj
    have hfirst_ne_li : CGN.firstIndex Packet.hm ≠ li := by
      intro h
      have hpoint : phi 9 = phi (reverseCyclicIndex13 i) := by
        calc
          phi 9 = (S.triangleByIndex S.oppIndex2).v3 := hv3
          _ = L.points (CGN.firstIndex Packet.hm) := horientReflected.1.symm
          _ = L.points li := by rw [h]
          _ = phi (reverseCyclicIndex13 i) := hli
      have hEq : (9 : Fin 13) = reverseCyclicIndex13 i := hinj hpoint
      have rawI_val : (reverseCyclicIndex13 i).val = 13 - i.val :=
        reverseCyclicIndex13_val_of_pos hi
      have := congrArg Fin.val hEq
      omega
    have hfirst_lt_li : CGN.firstIndex Packet.hm < li := by
      have hle : CGN.firstIndex Packet.hm ≤ li := by
        simp [CGN.firstIndex]
      exact lt_of_le_of_ne hle hfirst_ne_li
    have hpos :
        0 < signedArea2 (L.points (CGN.firstIndex Packet.hm))
          (L.points lj) (L.points li) :=
      (Hord.subchord_open_side_iff_A (hfirst_lt_li.trans hilj)
        (Packet.mem_A li)).2 ⟨li, hfirst_lt_li, hilj, rfl⟩
    have hneg := hneg_of_ccw hinj hccw hrawJ hrawJI
    rw [horientReflected.1, ← hv3, hli, hlj] at hpos
    linarith
  have localStraddle := local_straddle_of_sourceTwoHitNormalForm N L Packet
    Hside Hord sourceLocal blockerLocal thirdLocal source_local_point
    blocker_local_point third_local_point
  have hsourceBlocker : sourceIndex ≠ blockerIndex := by
    intro h
    apply PhysicalActualCriticalMutualOmissionPair.source_ne_target M
    apply Subtype.ext
    calc
      M.source.1 = phi (reverseCyclicIndex13 sourceIndex) := source_point.symm
      _ = phi (reverseCyclicIndex13 blockerIndex) := by rw [h]
      _ = M.target.1 := blocker_point
  have hblockerThird : blockerIndex ≠ thirdIndex := by
    intro h
    apply N.third_ne_target
    apply Subtype.ext
    calc
      N.third.1 = phi (reverseCyclicIndex13 thirdIndex) := third_point.symm
      _ = phi (reverseCyclicIndex13 blockerIndex) := by rw [← h]
      _ = M.target.1 := blocker_point
  rcases localStraddle with ⟨hsourceLocal, hthirdLocal⟩ |
      ⟨hthirdLocal, hsourceLocal⟩
  · have hsourceGlobal : blockerIndex < sourceIndex := by
      rcases lt_or_gt_of_ne hsourceBlocker with h | h
      · exact False.elim ((not_lt_of_ge hsourceLocal.le)
          (local_lt_of_canonical_lt hsource.1 hblocker.2 h
            source_local_to_global blocker_local_to_global))
      · exact h
    have hthirdGlobal : thirdIndex < blockerIndex := by
      rcases lt_or_gt_of_ne hblockerThird with h | h
      · exact False.elim ((not_lt_of_ge hthirdLocal.le)
          (local_lt_of_canonical_lt hblocker.1 hthird.2 h
            blocker_local_to_global third_local_to_global))
      · exact h
    apply Fin.ext
    omega
  · have hthirdGlobal : blockerIndex < thirdIndex := by
      rcases lt_or_gt_of_ne hblockerThird.symm with h | h
      · exact False.elim ((not_lt_of_ge hthirdLocal.le)
          (local_lt_of_canonical_lt hthird.1 hblocker.2 h
            third_local_to_global blocker_local_to_global))
      · exact h
    have hsourceGlobal : sourceIndex < blockerIndex := by
      rcases lt_or_gt_of_ne hsourceBlocker.symm with h | h
      · exact False.elim ((not_lt_of_ge hsourceLocal.le)
          (local_lt_of_canonical_lt hblocker.1 hsource.2 h
            blocker_local_to_global source_local_to_global))
      · exact h
    apply Fin.ext
    omega

/-- The current production packet supplies one canonical card-thirteen frame
containing every source role, the actual-row incidences, the middle-index
identification, and every metric inequality required by the certificate. -/
theorem nonempty_canonicalAsymmetricRolePrepacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile)
    (N : SourceTwoHitNormalForm Q profile M)
    (hcard : D.A.card = 13) :
    Nonempty (CanonicalAsymmetricRolePrepacket N) := by
  classical
  rcases exists_card13_ccw_boundary_apexPlacement Q hcard with
    ⟨phi, hinj, himage, hccw, hplacement⟩
  rcases nonempty_sourceTwoHitSharedCapOrder N with ⟨shared⟩
  let K := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have hsourceMem : M.source.1 ∈ K.support := K.q_mem_support
  have hsourceNeBlocker : M.source.1 ≠ M.target.1 := by
    intro h
    exact PhysicalActualCriticalMutualOmissionPair.source_ne_target M
      (Subtype.ext h)
  have hsourceNeThird : M.source.1 ≠ N.third.1 := by
    intro h
    exact N.third_ne_source (Subtype.ext h.symm)
  have hblockerNeThird : M.target.1 ≠ N.third.1 := by
    intro h
    exact N.third_ne_target (Subtype.ext h.symm)
  rcases hplacement with ⟨hzero, hfirst, hsecond⟩ | ⟨hzero, hsecond, hfirst⟩
  · rcases canonical_index_direct phi hinj himage hccw hzero
        hfirst hsecond (PhysicalVertex.mem_capInterior M.source) with
      ⟨sourceIndex, hsource0, hsource4, source_point⟩
    rcases canonical_index_direct phi hinj himage hccw hzero
        hfirst hsecond (PhysicalVertex.mem_capInterior M.target) with
      ⟨blockerIndex, hblocker0, hblocker4, blocker_point⟩
    rcases canonical_index_direct phi hinj himage hccw hzero
        hfirst hsecond (PhysicalVertex.mem_capInterior N.third) with
      ⟨thirdIndex, hthird0, hthird4, third_point⟩
    refine ⟨{
      point := phi
      point_injective := hinj
      point_image := himage
      surplusOpposite_at_zero := hzero
      firstApex_at_four := hfirst
      secondApex_at_eight := hsecond
      strictKalmanson := ?_
      sourceIndex := sourceIndex
      blockerIndex := blockerIndex
      thirdIndex := thirdIndex
      sourceIndex_strict := ⟨hsource0, hsource4⟩
      blockerIndex_strict := ⟨hblocker0, hblocker4⟩
      thirdIndex_strict := ⟨hthird0, hthird4⟩
      source_point := source_point
      blocker_point := blocker_point
      third_point := third_point
      source_ne_blocker := by
        intro h
        apply hsourceNeBlocker
        calc
          M.source.1 = phi sourceIndex := source_point.symm
          _ = phi blockerIndex := congrArg phi h
          _ = M.target.1 := blocker_point
      source_ne_third := by
        intro h
        apply hsourceNeThird
        calc
          M.source.1 = phi sourceIndex := source_point.symm
          _ = phi thirdIndex := congrArg phi h
          _ = N.third.1 := third_point
      blocker_ne_third := by
        intro h
        apply hblockerNeThird
        calc
          M.target.1 = phi blockerIndex := blocker_point.symm
          _ = phi thirdIndex := congrArg phi h
          _ = N.third.1 := third_point
      blockerIndex_eq_two := blockerIndex_eq_two_direct N phi hinj hccw hzero
        hfirst sourceIndex blockerIndex thirdIndex
        ⟨hsource0, hsource4⟩ ⟨hblocker0, hblocker4⟩ ⟨hthird0, hthird4⟩
        source_point blocker_point third_point
      source_mem_actualSupport := hsourceMem
      third_mem_actualSupport := N.third_mem_sourceSupport
      actualCenter_eq_blocker := N.sourceBlocker_eq_target
      actualSupport_inter_physicalCap_eq := N.sourceSupport_inter_physicalCap_eq
      sharedCapOrder := shared }⟩
    intro a b c d hab hbc hcd
    exact strictKalmanson_pair_of_ccw13 hcard D.convex phi hinj himage hccw
      hab hbc hcd
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
    rcases canonical_index_reflected phi hinj himage hccw hzero
        hsecond hfirst
        (PhysicalVertex.mem_capInterior M.source) with
      ⟨sourceIndex, hsource0, hsource4, source_point⟩
    rcases canonical_index_reflected phi hinj himage hccw hzero
        hsecond hfirst
        (PhysicalVertex.mem_capInterior M.target) with
      ⟨blockerIndex, hblocker0, hblocker4, blocker_point⟩
    rcases canonical_index_reflected phi hinj himage hccw hzero
        hsecond hfirst
        (PhysicalVertex.mem_capInterior N.third) with
      ⟨thirdIndex, hthird0, hthird4, third_point⟩
    refine ⟨{
      point := point
      point_injective := point_injective
      point_image := point_image
      surplusOpposite_at_zero := point_zero
      firstApex_at_four := point_four
      secondApex_at_eight := point_eight
      strictKalmanson := ?_
      sourceIndex := sourceIndex
      blockerIndex := blockerIndex
      thirdIndex := thirdIndex
      sourceIndex_strict := ⟨hsource0, hsource4⟩
      blockerIndex_strict := ⟨hblocker0, hblocker4⟩
      thirdIndex_strict := ⟨hthird0, hthird4⟩
      source_point := source_point
      blocker_point := blocker_point
      third_point := third_point
      source_ne_blocker := by
        intro h
        apply hsourceNeBlocker
        calc
          M.source.1 = point sourceIndex := source_point.symm
          _ = point blockerIndex := congrArg point h
          _ = M.target.1 := blocker_point
      source_ne_third := by
        intro h
        apply hsourceNeThird
        calc
          M.source.1 = point sourceIndex := source_point.symm
          _ = point thirdIndex := congrArg point h
          _ = N.third.1 := third_point
      blocker_ne_third := by
        intro h
        apply hblockerNeThird
        calc
          M.target.1 = point blockerIndex := blocker_point.symm
          _ = point thirdIndex := congrArg point h
          _ = N.third.1 := third_point
      blockerIndex_eq_two := blockerIndex_eq_two_reflected N phi hinj hccw hzero
        hfirst sourceIndex blockerIndex thirdIndex
        ⟨hsource0, hsource4⟩ ⟨hblocker0, hblocker4⟩ ⟨hthird0, hthird4⟩
        source_point blocker_point third_point
      source_mem_actualSupport := hsourceMem
      third_mem_actualSupport := N.third_mem_sourceSupport
      actualCenter_eq_blocker := N.sourceBlocker_eq_target
      actualSupport_inter_physicalCap_eq := N.sourceSupport_inter_physicalCap_eq
      sharedCapOrder := shared }⟩
    intro a b c d hab hbc hcd
    simpa [point] using strictKalmanson_pair_reverseCyclicIndex13
      hcard D.convex phi hinj himage hccw hab hbc hcd

#print axioms nonempty_canonicalAsymmetricRolePrepacket
#print axioms CanonicalAsymmetricRolePrepacket.source_role_orbits_of_blockerIndex_eq_two
#print axioms CanonicalAsymmetricRolePrepacket.source_role_orbits

end

end ATailExactFiveCard13CommonLabelTransportScratch
end Problem97
