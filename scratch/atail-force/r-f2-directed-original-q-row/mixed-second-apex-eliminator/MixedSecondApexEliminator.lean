/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SecondApexConstructorSplit

/-!
# Scratch: eliminate the mixed second-apex constructor residual

The two complementary support-only points are the opposite intersections of
two adjacent equal-radius circle pairs.  Their sum is twice the physical
second apex, so the three points are collinear.  Convex independence excludes
that configuration.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2MixedSecondApexEliminatorScratch

open ATailContinuationGeometryClassifier
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQContinuationClassifierScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2SecondApexConstructorSplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 800000 in
private lemma opposite_intersections_sum_scalar
    {u0 u1 v0 v1 d0 d1 R : ℝ}
    (hR : 0 < R)
    (hu : u0 ^ 2 + u1 ^ 2 = R)
    (hv : v0 ^ 2 + v1 ^ 2 = R)
    (hd : d0 ^ 2 + d1 ^ 2 = R)
    (huv : (v0 - u0) ^ 2 + (v1 - u1) ^ 2 = R)
    (hud : (d0 - u0) ^ 2 + (d1 - u1) ^ 2 = R)
    (hvd : v0 ≠ d0 ∨ v1 ≠ d1) :
    v0 + d0 = u0 ∧ v1 + d1 = u1 := by
  have hdotV : u0 * v0 + u1 * v1 = R / 2 := by
    nlinarith [hu, hv, huv]
  have hdotD : u0 * d0 + u1 * d1 = R / 2 := by
    nlinarith [hu, hd, hud]
  have hlagrangeV :
      (u0 * v1 - u1 * v0) ^ 2 + (u0 * v0 + u1 * v1) ^ 2 =
        (u0 ^ 2 + u1 ^ 2) * (v0 ^ 2 + v1 ^ 2) := by
    ring
  have hlagrangeD :
      (u0 * d1 - u1 * d0) ^ 2 + (u0 * d0 + u1 * d1) ^ 2 =
        (u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2) := by
    ring
  have hcrossSq :
      (u0 * v1 - u1 * v0) ^ 2 = (u0 * d1 - u1 * d0) ^ 2 := by
    rw [hu, hv, hdotV] at hlagrangeV
    rw [hu, hd, hdotD] at hlagrangeD
    nlinarith [hlagrangeV, hlagrangeD]
  have hfactor :
      ((u0 * v1 - u1 * v0) - (u0 * d1 - u1 * d0)) *
          ((u0 * v1 - u1 * v0) + (u0 * d1 - u1 * d0)) = 0 := by
    nlinarith [hcrossSq]
  have hcrossNe :
      (u0 * v1 - u1 * v0) ≠ (u0 * d1 - u1 * d0) := by
    intro hcross
    have hdotDiff : u0 * (v0 - d0) + u1 * (v1 - d1) = 0 := by
      nlinarith [hdotV, hdotD]
    have hcrossDiff : u0 * (v1 - d1) - u1 * (v0 - d0) = 0 := by
      nlinarith [hcross]
    have hlagrangeDiff :
        (u0 * (v0 - d0) + u1 * (v1 - d1)) ^ 2 +
            (u0 * (v1 - d1) - u1 * (v0 - d0)) ^ 2 =
          (u0 ^ 2 + u1 ^ 2) *
            ((v0 - d0) ^ 2 + (v1 - d1) ^ 2) := by
      ring
    rw [hdotDiff, hcrossDiff, hu] at hlagrangeDiff
    have hdiffSq : (v0 - d0) ^ 2 + (v1 - d1) ^ 2 = 0 := by
      have hprod : R * ((v0 - d0) ^ 2 + (v1 - d1) ^ 2) = 0 := by
        calc
          R * ((v0 - d0) ^ 2 + (v1 - d1) ^ 2) = 0 ^ 2 + 0 ^ 2 :=
            hlagrangeDiff.symm
          _ = 0 := by norm_num
      exact (mul_eq_zero.mp hprod).resolve_left (ne_of_gt hR)
    have h0 : v0 = d0 := by
      have hsq : (v0 - d0) ^ 2 = 0 := by
        linarith [sq_nonneg (v0 - d0), sq_nonneg (v1 - d1)]
      have hmul : (v0 - d0) * (v0 - d0) = 0 := by
        simpa only [pow_two] using hsq
      exact sub_eq_zero.mp (mul_self_eq_zero.mp hmul)
    have h1 : v1 = d1 := by
      have hsq : (v1 - d1) ^ 2 = 0 := by
        linarith [sq_nonneg (v0 - d0), sq_nonneg (v1 - d1)]
      have hmul : (v1 - d1) * (v1 - d1) = 0 := by
        simpa only [pow_two] using hsq
      exact sub_eq_zero.mp (mul_self_eq_zero.mp hmul)
    exact hvd.elim (fun h ↦ h h0) (fun h ↦ h h1)
  have hcrossSum :
      (u0 * v1 - u1 * v0) + (u0 * d1 - u1 * d0) = 0 := by
    exact (mul_eq_zero.mp hfactor).resolve_left (sub_ne_zero.mpr hcrossNe)
  let z0 := v0 + d0 - u0
  let z1 := v1 + d1 - u1
  have hdotZ : u0 * z0 + u1 * z1 = 0 := by
    dsimp [z0, z1]
    linear_combination hdotV + hdotD - hu
  have hcrossZ : u0 * z1 - u1 * z0 = 0 := by
    dsimp [z0, z1]
    linear_combination hcrossSum
  have hlagrangeZ :
      (u0 * z0 + u1 * z1) ^ 2 + (u0 * z1 - u1 * z0) ^ 2 =
        (u0 ^ 2 + u1 ^ 2) * (z0 ^ 2 + z1 ^ 2) := by
    ring
  rw [hdotZ, hcrossZ, hu] at hlagrangeZ
  have hzSq : z0 ^ 2 + z1 ^ 2 = 0 := by
    have hprod : R * (z0 ^ 2 + z1 ^ 2) = 0 := by
      calc
        R * (z0 ^ 2 + z1 ^ 2) = 0 ^ 2 + 0 ^ 2 := hlagrangeZ.symm
        _ = 0 := by norm_num
    exact (mul_eq_zero.mp hprod).resolve_left (ne_of_gt hR)
  have hz0 : z0 = 0 := by
    have hsq : z0 ^ 2 = 0 := by
      linarith [sq_nonneg z0, sq_nonneg z1]
    have hmul : z0 * z0 = 0 := by simpa only [pow_two] using hsq
    exact mul_self_eq_zero.mp hmul
  have hz1 : z1 = 0 := by
    have hsq : z1 ^ 2 = 0 := by
      linarith [sq_nonneg z0, sq_nonneg z1]
    have hmul : z1 * z1 = 0 := by simpa only [pow_two] using hsq
    exact mul_self_eq_zero.mp hmul
  exact ⟨by dsimp [z0] at hz0; linarith,
    by dsimp [z1] at hz1; linarith⟩

/-- Two distinct intersections of equal-radius circles centered at `o,x`
sum to the sum of the centers when the center distance is the same radius. -/
theorem opposite_intersections_sum
    {o x y d : ℝ²} {r : ℝ} (hr : 0 < r)
    (hox : dist o x = r)
    (hoy : dist o y = r)
    (hod : dist o d = r)
    (hxy : dist x y = r)
    (hxd : dist x d = r)
    (hyd : y ≠ d) :
    y + d = o + x := by
  have hoxSq : dist o x ^ 2 = r ^ 2 := by
    simpa only using congrArg (fun z : ℝ ↦ z ^ 2) hox
  have hoySq : dist o y ^ 2 = r ^ 2 := by
    simpa only using congrArg (fun z : ℝ ↦ z ^ 2) hoy
  have hodSq : dist o d ^ 2 = r ^ 2 := by
    simpa only using congrArg (fun z : ℝ ↦ z ^ 2) hod
  have hxySq : dist x y ^ 2 = r ^ 2 := by
    simpa only using congrArg (fun z : ℝ ↦ z ^ 2) hxy
  have hxdSq : dist x d ^ 2 = r ^ 2 := by
    simpa only using congrArg (fun z : ℝ ↦ z ^ 2) hxd
  rw [dist_sq_coords] at hoxSq hoySq hodSq hxySq hxdSq
  have hydCoord : y 0 ≠ d 0 ∨ y 1 ≠ d 1 := by
    by_contra h
    push_neg at h
    apply hyd
    ext i
    fin_cases i
    · exact h.1
    · exact h.2
  have hsum := opposite_intersections_sum_scalar
    (R := r ^ 2)
    (u0 := x 0 - o 0) (u1 := x 1 - o 1)
    (v0 := y 0 - o 0) (v1 := y 1 - o 1)
    (d0 := d 0 - o 0) (d1 := d 1 - o 1)
    (sq_pos_of_pos hr)
    (by
      calc
        (x 0 - o 0) ^ 2 + (x 1 - o 1) ^ 2 =
            (o 0 - x 0) ^ 2 + (o 1 - x 1) ^ 2 := by ring
        _ = r ^ 2 := hoxSq)
    (by
      calc
        (y 0 - o 0) ^ 2 + (y 1 - o 1) ^ 2 =
            (o 0 - y 0) ^ 2 + (o 1 - y 1) ^ 2 := by ring
        _ = r ^ 2 := hoySq)
    (by
      calc
        (d 0 - o 0) ^ 2 + (d 1 - o 1) ^ 2 =
            (o 0 - d 0) ^ 2 + (o 1 - d 1) ^ 2 := by ring
        _ = r ^ 2 := hodSq)
    (by
      calc
        ((y 0 - o 0) - (x 0 - o 0)) ^ 2 +
              ((y 1 - o 1) - (x 1 - o 1)) ^ 2 =
            (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by ring
        _ = r ^ 2 := hxySq)
    (by
      calc
        ((d 0 - o 0) - (x 0 - o 0)) ^ 2 +
              ((d 1 - o 1) - (x 1 - o 1)) ^ 2 =
            (x 0 - d 0) ^ 2 + (x 1 - d 1) ^ 2 := by ring
        _ = r ^ 2 := hxdSq)
    (by
      rcases hydCoord with h0 | h1
      · exact Or.inl (by intro h; apply h0; linarith)
      · exact Or.inr (by intro h; apply h1; linarith))
  ext i
  fin_cases i
  · change y 0 + d 0 = o 0 + x 0
    linarith [hsum.1]
  · change y 1 + d 1 = o 1 + x 1
    linarith [hsum.2]

/-- The metric core shared by both mixed constructors is impossible.  The
two support-only points are the opposite circle intersections adjacent to
`x` and `y`; hence their midpoint is the physical second apex, contradicting
convex independence. -/
theorem false_of_mixed_complementary_supports
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    {a b : ℝ²}
    (haX : a ∈ Q.generated.at_x.generated.support)
    (hbY : b ∈ Q.generated.at_y.generated.support)
    (haOffLive : a ∉ ({q, t1, t2, t3} : Finset ℝ²))
    (hbOffLive : b ∉ ({q, t1, t2, t3} : Finset ℝ²))
    (haNeApex : a ≠ S.oppApex2)
    (hbNeApex : b ≠ S.oppApex2)
    (hsupportPair :
      ({a, b} : Finset ℝ²) = {K.named.s, K.named.t}) : False := by
  let rows := Q.generated.toTwoContinuationRows
  let Kmiddle : SelectedFourClass D.A S.oppApex2 :=
    CommonDeletionTwoCenterPacket.secondRowSelectedFourClass
      (alignedSharedRowPacket X hcenter)
  have haRole : a = K.named.s ∨ a = K.named.t := by
    have ha : a ∈ ({K.named.s, K.named.t} : Finset ℝ²) := by
      rw [← hsupportPair]
      simp
    simpa only [Finset.mem_insert, Finset.mem_singleton] using ha
  have hbRole : b = K.named.s ∨ b = K.named.t := by
    have hb : b ∈ ({K.named.s, K.named.t} : Finset ℝ²) := by
      rw [← hsupportPair]
      simp
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hb
  have haMiddle : a ∈ (alignedSharedRowPacket X hcenter).B₂ := by
    rw [K.middle_row_eq]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    exact Or.inr (Or.inr haRole)
  have hbMiddle : b ∈ (alignedSharedRowPacket X hcenter).B₂ := by
    rw [K.middle_row_eq]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    exact Or.inr (Or.inr hbRole)
  have hxMiddle : K.named.x ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).1).1).1
  have hyMiddle : K.named.y ∈ (alignedSharedRowPacket X hcenter).B₂ :=
    (Finset.mem_inter.mp
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).1).1).1
  have haFull : a ∈ rows.row₁.support := by
    exact
      Q.generated.at_x.generated.support_subset_fullSelectedFourClass
        Q.generated.at_x.source_profile.source.q_mem_A
        Q.generated.at_x.source_profile.center_ne_source haX
  have hbFull : b ∈ rows.row₂.support := by
    exact
      Q.generated.at_y.generated.support_subset_fullSelectedFourClass
        Q.generated.at_y.source_profile.source.q_mem_A
        Q.generated.at_y.source_profile.center_ne_source hbY
  have hOa : dist S.oppApex2 a = Kmiddle.radius := by
    simpa [Kmiddle] using Kmiddle.support_eq_radius a haMiddle
  have hOb : dist S.oppApex2 b = Kmiddle.radius := by
    simpa [Kmiddle] using Kmiddle.support_eq_radius b hbMiddle
  have hOx : dist S.oppApex2 K.named.x = Kmiddle.radius := by
    simpa [Kmiddle] using Kmiddle.support_eq_radius K.named.x hxMiddle
  have hOy : dist S.oppApex2 K.named.y = Kmiddle.radius := by
    simpa [Kmiddle] using Kmiddle.support_eq_radius K.named.y hyMiddle
  have hxy : dist K.named.x K.named.y = Kmiddle.radius := by
    simpa [rows, OriginalQGeneratedPair.toTwoContinuationRows, Kmiddle] using
      hequilateral.1
  have hxa : dist K.named.x a = Kmiddle.radius := by
    have h := rows.row₁.support_eq_radius a haFull
    rw [hequilateral.2.2.2.2.2.1] at h
    simpa [rows, OriginalQGeneratedPair.toTwoContinuationRows, Kmiddle] using h
  have hyb : dist K.named.y b = Kmiddle.radius := by
    have h := rows.row₂.support_eq_radius b hbFull
    rw [hequilateral.2.2.2.2.2.2] at h
    simpa [rows, OriginalQGeneratedPair.toTwoContinuationRows, Kmiddle] using h
  have hya : K.named.y ≠ a := by
    intro h
    apply haOffLive
    rw [← h]
    exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  have hxb : K.named.x ≠ b := by
    intro h
    apply hbOffLive
    rw [← h]
    exact Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  have hsumA :
      K.named.y + a = S.oppApex2 + K.named.x :=
    opposite_intersections_sum Kmiddle.radius_pos
      hOx hOy hOa hxy hxa hya
  have hsumB :
      K.named.x + b = S.oppApex2 + K.named.y :=
    opposite_intersections_sum Kmiddle.radius_pos
      hOy hOx hOb (by simpa only [dist_comm] using hxy) hyb hxb
  have habSum : a + b = S.oppApex2 + S.oppApex2 := by
    ext i
    fin_cases i
    · change a 0 + b 0 = S.oppApex2 0 + S.oppApex2 0
      have hA := congrArg (fun z : ℝ² ↦ z 0) hsumA
      have hB := congrArg (fun z : ℝ² ↦ z 0) hsumB
      simp only [PiLp.add_apply] at hA hB
      linarith
    · change a 1 + b 1 = S.oppApex2 1 + S.oppApex2 1
      have hA := congrArg (fun z : ℝ² ↦ z 1) hsumA
      have hB := congrArg (fun z : ℝ² ↦ z 1) hsumB
      simp only [PiLp.add_apply] at hA hB
      linarith
  have harea : signedArea2 a S.oppApex2 b = 0 := by
    have h0 := congrArg (fun z : ℝ² ↦ z 0) habSum
    have h1 := congrArg (fun z : ℝ² ↦ z 1) habSum
    simp only [PiLp.add_apply] at h0 h1
    have hb0 : b 0 = 2 * S.oppApex2 0 - a 0 := by linarith
    have hb1 : b 1 = 2 * S.oppApex2 1 - a 1 := by linarith
    rw [signedArea2, hb0, hb1]
    ring
  have hab : a ≠ b := by
    intro h
    subst b
    have hcard := congrArg Finset.card hsupportPair
    simp [K.named.s_ne_t] at hcard
  have haA : a ∈ D.A := rows.row₁.support_subset_A haFull
  have hbA : b ∈ D.A := rows.row₂.support_subset_A hbFull
  exact D.convex.not_three_collinear
    haA (alignedSharedRowPacket X hcenter).center₂_mem_A hbA
    haNeApex hab hbNeApex.symm
    (collinear_of_signedArea2_eq_zero _ _ _ harea)

/-- The q-deleted-at-`x`, q-critical-at-`y` mixed constructor is impossible. -/
theorem false_of_qDeleted_qCritical_complementAtX
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (residual : QDeletedQCriticalComplementAtX Q) : False := by
  exact false_of_mixed_complementary_supports Q hequilateral
    (by
      rw [residual.at_x_eq]
      simpa [ExactGeneratedAt.support] using
        residual.deletedSupportOnly_mem)
    (by
      rw [residual.at_y_eq]
      simpa [ExactGeneratedAt.support] using
        residual.criticalSupportOnly_mem)
    residual.deletedSupportOnly_offLive
    residual.criticalSupportOnly_offLive
    residual.deletedSupportOnly_ne_secondApex
    residual.criticalSupportOnly_ne_secondApex
    residual.supportOnly_pair

/-- The symmetric q-critical-at-`x`, q-deleted-at-`y` mixed constructor is
impossible. -/
theorem false_of_qCritical_qDeleted_complementAtY
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (residual : QCriticalQDeletedComplementAtY Q) : False := by
  apply false_of_mixed_complementary_supports Q hequilateral
  · rw [residual.at_x_eq]
    simpa [ExactGeneratedAt.support] using
      residual.criticalSupportOnly_mem
  · rw [residual.at_y_eq]
    simpa [ExactGeneratedAt.support] using
      residual.deletedSupportOnly_mem
  · exact residual.criticalSupportOnly_offLive
  · exact residual.deletedSupportOnly_offLive
  · exact residual.criticalSupportOnly_ne_secondApex
  · exact residual.deletedSupportOnly_ne_secondApex
  · rw [Finset.pair_comm]
    exact residual.supportOnly_pair

/-- Source-clean constructor output after eliminating both mixed packets. -/
inductive SecondApexRerouteReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K) : Prop
  | rerouteAtX (reroute : Nonempty (NonApexOutsideMiddleRerouteAtX Q))
  | rerouteAtY (reroute : Nonempty (NonApexOutsideMiddleRerouteAtY Q))

/-- Collapse the four-constructor reduction to its two genuine reroutes. -/
theorem secondApexRerouteReduction_of_constructorReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (h : SecondApexConstructorReduction Q) :
    SecondApexRerouteReduction Q := by
  rcases h with hX | hY | hMixed | hMixed
  · exact .rerouteAtX hX
  · exact .rerouteAtY hY
  · rcases hMixed with ⟨hMixed⟩
    exact False.elim
      (false_of_qDeleted_qCritical_complementAtX
        Q hequilateral hMixed)
  · rcases hMixed with ⟨hMixed⟩
    exact False.elim
      (false_of_qCritical_qDeleted_complementAtY
        Q hequilateral hMixed)

/-- The equal-source-at-second-apex arm has only the two outside-middle
reroutes.  No mixed complementary constructor survives. -/
theorem secondApexRerouteReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K)
    (hsourceEq : Q.at_x.source = Q.at_y.source)
    (hequilateral :
      Q.generated.toTwoContinuationRows.EquilateralResidual)
    (hsourceApex : Q.at_x.source = S.oppApex2) :
    SecondApexRerouteReduction Q := by
  exact secondApexRerouteReduction_of_constructorReduction Q hequilateral
    (secondApexConstructorReduction
      Q hsourceEq hequilateral hsourceApex)

end ATailRF2MixedSecondApexEliminatorScratch
end Problem97

#print axioms Problem97.ATailRF2MixedSecondApexEliminatorScratch.opposite_intersections_sum
#print axioms Problem97.ATailRF2MixedSecondApexEliminatorScratch.false_of_mixed_complementary_supports
#print axioms Problem97.ATailRF2MixedSecondApexEliminatorScratch.false_of_qDeleted_qCritical_complementAtX
#print axioms Problem97.ATailRF2MixedSecondApexEliminatorScratch.false_of_qCritical_qDeleted_complementAtY
#print axioms Problem97.ATailRF2MixedSecondApexEliminatorScratch.secondApexRerouteReduction
