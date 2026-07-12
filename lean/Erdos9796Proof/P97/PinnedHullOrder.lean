/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBankGeometry
import Erdos9796Proof.P97.SurplusM44Packet
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Pinned hull-order certificates

This module isolates the ambient CCW hull-order certificate machinery for the
ten generated COMP-G labels, previously carried inline in
`RemovableVertexAxiom.Base`.  Relocating it upstream lets both the downstream
pinned-surplus producer and the upstream endpoint geometry producer construct
the `IsCcwConvexPolygon (pointOf ∘ labelOfHullFin)` fact required by the
finite bank's cross-separation checks.

The declarations are moved verbatim and keep their names and the `Problem97`
namespace so every existing reference resolves unchanged.
-/

open scoped EuclideanGeometry

namespace Problem97

open SurplusCOMPGBank

/-- A ten-label packet occurs as a strictly increasing subsequence of one
ambient CCW boundary enumeration of `A`.  This is the P1 certificate shape
needed by the erased-pin ordered scaffold: the producer still has to export the
indices, but the CCW ten-point hull follows formally from this certificate. -/
abbrev HullOrderSubsequenceCertificate (A : Finset ℝ²)
    (pointOf : SurplusCOMPGBank.Label → ℝ²) : Prop :=
  ∃ n : ℕ, ∃ φ : Fin n → ℝ², ∃ idx : Fin 10 → Fin n,
    Function.Injective φ ∧
    Finset.univ.image φ = A ∧
    EuclideanGeometry.IsCcwConvexPolygon φ ∧
    StrictMono idx ∧
    ∀ i : Fin 10, φ (idx i) =
      pointOf (_root_.Problem97.SurplusCOMPGBank.labelOfHullFin i)

/-- Consume a P1 ambient hull-order certificate to obtain the exact
`labelOfHullFin` CCW certificate expected by the finite candidate producers. -/
theorem isCcwConvexPolygon_of_hullOrderSubsequenceCertificate
    {A : Finset ℝ²} {pointOf : SurplusCOMPGBank.Label → ℝ²}
    (hcert : HullOrderSubsequenceCertificate A pointOf) :
    EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        pointOf (_root_.Problem97.SurplusCOMPGBank.labelOfHullFin i)) := by
  rcases hcert with ⟨n, φ, idx, _hφinj, _hφimage, hccw, hidx, hpoints⟩
  have hsub :
      EuclideanGeometry.IsCcwConvexPolygon (fun i : Fin 10 => φ (idx i)) :=
    _root_.Problem97.isCcwConvexPolygon_subsequence (φ := φ) (idx := idx)
      hccw hidx
  intro i j k hij hjk
  have hi :
      pointOf (_root_.Problem97.SurplusCOMPGBank.labelOfHullFin i) =
        φ (idx i) :=
    (hpoints i).symm
  have hj :
      pointOf (_root_.Problem97.SurplusCOMPGBank.labelOfHullFin j) =
        φ (idx j) :=
    (hpoints j).symm
  have hk :
      pointOf (_root_.Problem97.SurplusCOMPGBank.labelOfHullFin k) =
        φ (idx k) :=
    (hpoints k).symm
  simpa [hi, hj, hk] using hsub hij hjk

/-- Build the P1 hull-order certificate from explicit strictly increasing
ambient indices for the ten generated labels.  This isolates the finite
`Fin 10` bookkeeping from the geometric selector, whose remaining job is to
export these indices from the cap-block interval facts. -/
theorem hullOrderSubsequenceCertificate_of_explicit_indices
    {A : Finset ℝ²} {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {n : ℕ} {φ : Fin n → ℝ²}
    {iu iQ1 iQ2 iv is1 is2 is3 iw iPw iPu : Fin n}
    (hφinj : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (huQ1 : iu < iQ1) (hQ1Q2 : iQ1 < iQ2) (hQ2v : iQ2 < iv)
    (hvs1 : iv < is1) (hs1s2 : is1 < is2) (hs2s3 : is2 < is3)
    (hs3w : is3 < iw) (hwPw : iw < iPw) (hPwPu : iPw < iPu)
    (hu : φ iu = pointOf .u)
    (hQ1 : φ iQ1 = pointOf .Q1)
    (hQ2 : φ iQ2 = pointOf .Q2)
    (hv : φ iv = pointOf .v)
    (hs1 : φ is1 = pointOf .s1)
    (hs2 : φ is2 = pointOf .s2)
    (hs3 : φ is3 = pointOf .s3)
    (hw : φ iw = pointOf .w)
    (hPw : φ iPw = pointOf .Pw)
    (hPu : φ iPu = pointOf .Pu) :
    HullOrderSubsequenceCertificate A pointOf := by
  let idx : Fin 10 → Fin n
    | ⟨0, _⟩ => iu
    | ⟨1, _⟩ => iQ1
    | ⟨2, _⟩ => iQ2
    | ⟨3, _⟩ => iv
    | ⟨4, _⟩ => is1
    | ⟨5, _⟩ => is2
    | ⟨6, _⟩ => is3
    | ⟨7, _⟩ => iw
    | ⟨8, _⟩ => iPw
    | ⟨9, _⟩ => iPu
    | ⟨k + 10, hk⟩ => by omega
  refine ⟨n, φ, idx, hφinj, hφimage, hccw, ?_, ?_⟩
  · intro a b hab
    fin_cases a <;> fin_cases b <;> simp [idx] at hab ⊢ <;> omega
  · intro i
    fin_cases i <;>
      simp [idx, SurplusCOMPGBank.labelOfHullFin, hu, hQ1, hQ2, hv, hs1,
        hs2, hs3, hw, hPw, hPu]

/-- Choose the right-oriented P1 labels in ambient hull order when the
zero-cut apex order is `u < v < w`.  The theorem packages the same scaffold
fields as the split ordered producer, plus the hull-order certificate consumed
by the finite right-side packet. -/
theorem exists_rightPinnedHullOrderLabels_of_apex_order
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {T : Finset ℝ²}
    {n : ℕ} (hn : 0 < n) {φ : Fin n → ℝ²} {iv iw : Fin n}
    (hφinj : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hu : φ (⟨0, hn⟩ : Fin n) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hv : φ iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : φ iw = S.oppositeVertexByIndex S.oppIndex2)
    (h0v : (⟨0, hn⟩ : Fin n) < iv) (hvw : iv < iw)
    (hM44 : S.IsM44)
    (hxT : x ∈ T) (hTcard : T.card = 3)
    (hTsub : T ⊆ S.capInteriorByIndex S.surplusIdx) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
      p₁ ≠ p₂ ∧
      S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
      q₁ ≠ q₂ ∧
      S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
      T = ({s1, s2, s3} : Finset ℝ²) ∧
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧
      s1 ≠ s3 ∧
      s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      p₁ ∈ S.capInteriorByIndex S.oppIndex1 ∧
      p₂ ∈ S.capInteriorByIndex S.oppIndex1 ∧
      q₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      q₂ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      s1 ∈ S.capInteriorByIndex S.surplusIdx ∧
      s2 ∈ S.capInteriorByIndex S.surplusIdx ∧
      s3 ∈ S.capInteriorByIndex S.surplusIdx ∧
      HullOrderSubsequenceCertificate A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) := by
  classical
  let iu : Fin n := ⟨0, hn⟩
  have hTcardLe : T.card ≤ 3 := by omega
  rcases hM44.exists_oppInterior_pairs with
    ⟨pA, pB, qA, qB, hpAB, hpairPraw, hqAB, hpairQraw⟩
  have hpairPCap :
      S.capInteriorByIndex S.oppIndex1 = ({pA, pB} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpairPraw
  have hpairQCap :
      S.capInteriorByIndex S.oppIndex2 = ({qA, qB} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpairQraw
  have hpAI : pA ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairPCap]
    simp
  have hpBI : pB ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairPCap]
    simp
  have hqAI : qA ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairQCap]
    simp
  have hqBI : qB ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairQCap]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hTsub
      hTcardLe with
    ⟨sA, sB, sC, hTtripleRaw, hsAB, hsAC, hsBC, hsSubRaw⟩
  have hsAI : sA ∈ S.capInteriorByIndex S.surplusIdx := hsSubRaw (by simp)
  have hsBI : sB ∈ S.capInteriorByIndex S.surplusIdx := hsSubRaw (by simp)
  have hsCI : sC ∈ S.capInteriorByIndex S.surplusIdx := hsSubRaw (by simp)
  have htriSurplus_v1 :
      φ iu = (S.triangleByIndex S.surplusIdx).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx]
    exact hu
  have htriSurplus_v2 :
      φ iv = (S.triangleByIndex S.surplusIdx).v2 := by
    simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
      using hv
  have htriSurplus_v3 :
      φ iw = (S.triangleByIndex S.surplusIdx).v3 := by
    simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
      using hw
  have htriOpp1_v1 :
      φ iv = (S.triangleByIndex S.oppIndex1).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1]
    exact hv
  have htriOpp1_v2 :
      φ iw = (S.triangleByIndex S.oppIndex1).v2 := by
    simpa [S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
      using hw
  have htriOpp1_v3 :
      φ iu = (S.triangleByIndex S.oppIndex1).v3 := by
    simpa [iu,
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
      using hu
  have htriOpp2_v1 :
      φ iw = (S.triangleByIndex S.oppIndex2).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2]
    exact hw
  have htriOpp2_v2 :
      φ iu = (S.triangleByIndex S.oppIndex2).v2 := by
    simpa [iu,
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
      using hu
  have htriOpp2_v3 :
      φ iv = (S.triangleByIndex S.oppIndex2).v3 := by
    simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
      using hv
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.oppIndex2
      hccw hφinj hφimage h0v (Or.inr hvw) htriOpp2_v1 htriOpp2_v2
      htriOpp2_v3 hqAI with
    ⟨iqA, hiuqA, hqAiv, hφqA⟩
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.oppIndex2
      hccw hφinj hφimage h0v (Or.inr hvw) htriOpp2_v1 htriOpp2_v2
      htriOpp2_v3 hqBI with
    ⟨iqB, hiuqB, hqBiv, hφqB⟩
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.surplusIdx
      hccw hφinj hφimage hvw (Or.inl h0v) htriSurplus_v1
      htriSurplus_v2 htriSurplus_v3 hsAI with
    ⟨isA, hivsA, hsAiw, hφsA⟩
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.surplusIdx
      hccw hφinj hφimage hvw (Or.inl h0v) htriSurplus_v1
      htriSurplus_v2 htriSurplus_v3 hsBI with
    ⟨isB, hivsB, hsBiw, hφsB⟩
  rcases S.capInteriorByIndex_open_interval_of_global_indices S.surplusIdx
      hccw hφinj hφimage hvw (Or.inl h0v) htriSurplus_v1
      htriSurplus_v2 htriSurplus_v3 hsCI with
    ⟨isC, hivsC, hsCiw, hφsC⟩
  rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
      S.oppIndex1 hccw hφinj hφimage h0v hvw htriOpp1_v1 htriOpp1_v2
      htriOpp1_v3 hpAI with
    ⟨ipA, hpAout, hφpA⟩
  rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
      S.oppIndex1 hccw hφinj hφimage h0v hvw htriOpp1_v1 htriOpp1_v2
      htriOpp1_v3 hpBI with
    ⟨ipB, hpBout, hφpB⟩
  have hiwpA : iw < ipA :=
    open_reverse_complement_after_zero hn (lo := iw) hpAout
  have hiwpB : iw < ipB :=
    open_reverse_complement_after_zero hn (lo := iw) hpBout
  rcases exists_sorted_pair_points_between (φ := φ) (lo := iu) (hi := iv)
      hiuqA hqAiv hiuqB hqBiv hφqA hφqB hqAB with
    ⟨q₁, q₂, iQ1, iQ2, huQ1, hQ1Q2, hQ2v, hφQ1, hφQ2, hQset⟩
  rcases exists_sorted_triple_points_between (φ := φ) (lo := iv) (hi := iw)
      hivsA hsAiw hivsB hsBiw hivsC hsCiw hφsA hφsB hφsC hsAB hsAC
      hsBC with
    ⟨s1, s2, s3, is1, is2, is3, hvs1, hs1s2, hs2s3, hs3w, hφs1,
      hφs2, hφs3, hSset⟩
  rcases exists_sorted_pair_points_after (φ := φ) (lo := iw)
      hiwpA hiwpB hφpA hφpB hpAB with
    ⟨p₁, p₂, iPw, iPu, hwPw, hPwPu, hφPw, hφPu, hPset⟩
  have hpairP : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) := by
    rw [hpairPraw]
    exact hPset.symm
  have hpairQ : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) := by
    rw [hpairQraw]
    exact hQset.symm
  have hTripleRawCard : ({sA, sB, sC} : Finset ℝ²).card = 3 := by
    simp [hsAB, hsAC, hsBC]
  have hTripleRaw_le : ({sA, sB, sC} : Finset ℝ²).card ≤ T.card := by
    rw [hTripleRawCard, hTcard]
  have hTraw : T = ({sA, sB, sC} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hTtripleRaw hTripleRaw_le
  have hTeq : T = ({s1, s2, s3} : Finset ℝ²) := by
    rw [hTraw]
    exact hSset.symm
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := by
    rw [← hTeq]
    exact hxT
  have hp12 : p₁ ≠ p₂ := by
    intro hp
    have hφeq : φ iPw = φ iPu := by rw [hφPw, hφPu, hp]
    exact (ne_of_lt hPwPu) (hφinj hφeq)
  have hq12 : q₁ ≠ q₂ := by
    intro hq
    have hφeq : φ iQ1 = φ iQ2 := by rw [hφQ1, hφQ2, hq]
    exact (ne_of_lt hQ1Q2) (hφinj hφeq)
  have hs12 : s1 ≠ s2 := by
    intro hs
    have hφeq : φ is1 = φ is2 := by rw [hφs1, hφs2, hs]
    exact (ne_of_lt hs1s2) (hφinj hφeq)
  have hs13 : s1 ≠ s3 := by
    intro hs
    have hφeq : φ is1 = φ is3 := by rw [hφs1, hφs3, hs]
    exact (ne_of_lt (lt_trans hs1s2 hs2s3)) (hφinj hφeq)
  have hs23 : s2 ≠ s3 := by
    intro hs
    have hφeq : φ is2 = φ is3 := by rw [hφs2, hφs3, hs]
    exact (ne_of_lt hs2s3) (hφinj hφeq)
  have hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    rw [hSset]
    exact hsSubRaw
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hpOpp : p₁ ∈ S.oppInterior1 := by
      rw [hpairP]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hpOpp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hpOpp : p₂ ∈ S.oppInterior1 := by
      rw [hpairP]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hpOpp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hqOpp : q₁ ∈ S.oppInterior2 := by
      rw [hpairQ]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hqOpp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hqOpp : q₂ ∈ S.oppInterior2 := by
      rw [hpairQ]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hqOpp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hcert :
      HullOrderSubsequenceCertificate A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
    hullOrderSubsequenceCertificate_of_explicit_indices
      (A := A)
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (n := n) (φ := φ) (iu := iu) (iQ1 := iQ1) (iQ2 := iQ2)
      (iv := iv) (is1 := is1) (is2 := is2) (is3 := is3)
      (iw := iw) (iPw := iPw) (iPu := iPu)
      hφinj hφimage hccw huQ1 hQ1Q2 hQ2v hvs1 hs1s2 hs2s3
      hs3w hwPw hPwPu
      (by simpa [iu, rightPinnedLabelPoint] using hu)
      (by simpa [rightPinnedLabelPoint] using hφQ1)
      (by simpa [rightPinnedLabelPoint] using hφQ2)
      (by simpa [rightPinnedLabelPoint] using hv)
      (by simpa [rightPinnedLabelPoint] using hφs1)
      (by simpa [rightPinnedLabelPoint] using hφs2)
      (by simpa [rightPinnedLabelPoint] using hφs3)
      (by simpa [rightPinnedLabelPoint] using hw)
      (by simpa [rightPinnedLabelPoint] using hφPw)
      (by simpa [rightPinnedLabelPoint] using hφPu)
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hpairQ,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I, hq₁I,
      hq₂I, hs1I, hs2I, hs3I, hcert⟩

/-- Choose the left-oriented P1 labels in ambient hull order when the
zero-cut apex order is `u < w < v`.  This is the mirror of
`exists_rightPinnedHullOrderLabels_of_apex_order`, with the certificate stated
for the left finite bank convention used by the split ordered scaffold. -/
theorem exists_leftPinnedHullOrderLabels_of_apex_order
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {T : Finset ℝ²}
    {n : ℕ} (hn : 0 < n) {φ : Fin n → ℝ²} {iv iw : Fin n}
    (hφinj : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hu : φ (⟨0, hn⟩ : Fin n) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hv : φ iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : φ iw = S.oppositeVertexByIndex S.oppIndex2)
    (h0w : (⟨0, hn⟩ : Fin n) < iw) (hwv : iw < iv)
    (hM44 : S.IsM44)
    (hxT : x ∈ T) (hTcard : T.card = 3)
    (hTsub : T ⊆ S.capInteriorByIndex S.surplusIdx) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
      p₁ ≠ p₂ ∧
      S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
      q₁ ≠ q₂ ∧
      S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
      T = ({s1, s2, s3} : Finset ℝ²) ∧
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧
      s1 ≠ s3 ∧
      s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      p₁ ∈ S.capInteriorByIndex S.oppIndex1 ∧
      p₂ ∈ S.capInteriorByIndex S.oppIndex1 ∧
      q₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      q₂ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      s1 ∈ S.capInteriorByIndex S.surplusIdx ∧
      s2 ∈ S.capInteriorByIndex S.surplusIdx ∧
      s3 ∈ S.capInteriorByIndex S.surplusIdx ∧
      HullOrderSubsequenceCertificate A
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) := by
  classical
  let iu : Fin n := ⟨0, hn⟩
  have hTcardLe : T.card ≤ 3 := by omega
  rcases hM44.exists_oppInterior_pairs with
    ⟨pA, pB, qA, qB, hpAB, hpairPraw, hqAB, hpairQraw⟩
  have hpairPCap :
      S.capInteriorByIndex S.oppIndex1 = ({pA, pB} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpairPraw
  have hpairQCap :
      S.capInteriorByIndex S.oppIndex2 = ({qA, qB} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpairQraw
  have hpAI : pA ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairPCap]
    simp
  have hpBI : pB ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpairPCap]
    simp
  have hqAI : qA ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairQCap]
    simp
  have hqBI : qB ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpairQCap]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hTsub
      hTcardLe with
    ⟨sA, sB, sC, hTtripleRaw, hsAB, hsAC, hsBC, hsSubRaw⟩
  have hsAI : sA ∈ S.capInteriorByIndex S.surplusIdx := hsSubRaw (by simp)
  have hsBI : sB ∈ S.capInteriorByIndex S.surplusIdx := hsSubRaw (by simp)
  have hsCI : sC ∈ S.capInteriorByIndex S.surplusIdx := hsSubRaw (by simp)
  have htriSurplus_v1 :
      φ iu = (S.triangleByIndex S.surplusIdx).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx]
    exact hu
  have htriSurplus_v2 :
      φ iv = (S.triangleByIndex S.surplusIdx).v2 := by
    simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
      using hv
  have htriSurplus_v3 :
      φ iw = (S.triangleByIndex S.surplusIdx).v3 := by
    simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
      using hw
  have htriOpp1_v1 :
      φ iv = (S.triangleByIndex S.oppIndex1).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1]
    exact hv
  have htriOpp1_v2 :
      φ iw = (S.triangleByIndex S.oppIndex1).v2 := by
    simpa [S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
      using hw
  have htriOpp1_v3 :
      φ iu = (S.triangleByIndex S.oppIndex1).v3 := by
    simpa [iu,
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
      using hu
  have htriOpp2_v1 :
      φ iw = (S.triangleByIndex S.oppIndex2).v1 := by
    rw [S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2]
    exact hw
  have htriOpp2_v2 :
      φ iu = (S.triangleByIndex S.oppIndex2).v2 := by
    simpa [iu,
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
      using hu
  have htriOpp2_v3 :
      φ iv = (S.triangleByIndex S.oppIndex2).v3 := by
    simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
      using hv
  rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
      S.oppIndex1 hccw hφinj hφimage h0w (Or.inr hwv) htriOpp1_v1
      htriOpp1_v2 htriOpp1_v3 hpAI with
    ⟨ipA, hiupA, hpAiw, hφpA⟩
  rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
      S.oppIndex1 hccw hφinj hφimage h0w (Or.inr hwv) htriOpp1_v1
      htriOpp1_v2 htriOpp1_v3 hpBI with
    ⟨ipB, hiupB, hpBiw, hφpB⟩
  rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
      S.surplusIdx hccw hφinj hφimage hwv (Or.inl h0w)
      htriSurplus_v1 htriSurplus_v2 htriSurplus_v3 hsAI with
    ⟨isA, hiwsA, hsAiv, hφsA⟩
  rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
      S.surplusIdx hccw hφinj hφimage hwv (Or.inl h0w)
      htriSurplus_v1 htriSurplus_v2 htriSurplus_v3 hsBI with
    ⟨isB, hiwsB, hsBiv, hφsB⟩
  rcases S.capInteriorByIndex_open_reverse_interval_of_global_indices
      S.surplusIdx hccw hφinj hφimage hwv (Or.inl h0w)
      htriSurplus_v1 htriSurplus_v2 htriSurplus_v3 hsCI with
    ⟨isC, hiwsC, hsCiv, hφsC⟩
  rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
      S.oppIndex2 hccw hφinj hφimage h0w hwv htriOpp2_v1 htriOpp2_v2
      htriOpp2_v3 hqAI with
    ⟨iqA, hqAout, hφqA⟩
  rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
      S.oppIndex2 hccw hφinj hφimage h0w hwv htriOpp2_v1 htriOpp2_v2
      htriOpp2_v3 hqBI with
    ⟨iqB, hqBout, hφqB⟩
  have hivqA : iv < iqA :=
    open_reverse_complement_after_zero hn (lo := iv) hqAout
  have hivqB : iv < iqB :=
    open_reverse_complement_after_zero hn (lo := iv) hqBout
  rcases exists_sorted_pair_points_between (φ := φ) (lo := iu) (hi := iw)
      hiupA hpAiw hiupB hpBiw hφpA hφpB hpAB with
    ⟨p₁, p₂, iP1, iP2, huP1, hP1P2, hP2w, hφP1, hφP2, hPset⟩
  rcases exists_sorted_triple_points_between (φ := φ) (lo := iw) (hi := iv)
      hiwsA hsAiv hiwsB hsBiv hiwsC hsCiv hφsA hφsB hφsC hsAB hsAC
      hsBC with
    ⟨s1, s2, s3, is1, is2, is3, hws1, hs1s2, hs2s3, hs3v, hφs1,
      hφs2, hφs3, hSset⟩
  rcases exists_sorted_pair_points_after (φ := φ) (lo := iv)
      hivqA hivqB hφqA hφqB hqAB with
    ⟨q₁, q₂, iQ1, iQ2, hvQ1, hQ1Q2, hφQ1, hφQ2, hQset⟩
  have hpairP : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) := by
    rw [hpairPraw]
    exact hPset.symm
  have hpairQ : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) := by
    rw [hpairQraw]
    exact hQset.symm
  have hTripleRawCard : ({sA, sB, sC} : Finset ℝ²).card = 3 := by
    simp [hsAB, hsAC, hsBC]
  have hTripleRaw_le : ({sA, sB, sC} : Finset ℝ²).card ≤ T.card := by
    rw [hTripleRawCard, hTcard]
  have hTraw : T = ({sA, sB, sC} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hTtripleRaw hTripleRaw_le
  have hTeq : T = ({s1, s2, s3} : Finset ℝ²) := by
    rw [hTraw]
    exact hSset.symm
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := by
    rw [← hTeq]
    exact hxT
  have hp12 : p₁ ≠ p₂ := by
    intro hp
    have hφeq : φ iP1 = φ iP2 := by rw [hφP1, hφP2, hp]
    exact (ne_of_lt hP1P2) (hφinj hφeq)
  have hq12 : q₁ ≠ q₂ := by
    intro hq
    have hφeq : φ iQ1 = φ iQ2 := by rw [hφQ1, hφQ2, hq]
    exact (ne_of_lt hQ1Q2) (hφinj hφeq)
  have hs12 : s1 ≠ s2 := by
    intro hs
    have hφeq : φ is1 = φ is2 := by rw [hφs1, hφs2, hs]
    exact (ne_of_lt hs1s2) (hφinj hφeq)
  have hs13 : s1 ≠ s3 := by
    intro hs
    have hφeq : φ is1 = φ is3 := by rw [hφs1, hφs3, hs]
    exact (ne_of_lt (lt_trans hs1s2 hs2s3)) (hφinj hφeq)
  have hs23 : s2 ≠ s3 := by
    intro hs
    have hφeq : φ is2 = φ is3 := by rw [hφs2, hφs3, hs]
    exact (ne_of_lt hs2s3) (hφinj hφeq)
  have hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    rw [hSset]
    exact hsSubRaw
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hpOpp : p₁ ∈ S.oppInterior1 := by
      rw [hpairP]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hpOpp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hpOpp : p₂ ∈ S.oppInterior1 := by
      rw [hpairP]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hpOpp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hqOpp : q₁ ∈ S.oppInterior2 := by
      rw [hpairQ]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hqOpp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hqOpp : q₂ ∈ S.oppInterior2 := by
      rw [hpairQ]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hqOpp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hcert :
      HullOrderSubsequenceCertificate A
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) :=
    hullOrderSubsequenceCertificate_of_explicit_indices
      (A := A)
      (pointOf := leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3)
      (n := n) (φ := φ) (iu := iu) (iQ1 := iP1) (iQ2 := iP2)
      (iv := iw) (is1 := is1) (is2 := is2) (is3 := is3)
      (iw := iv) (iPw := iQ1) (iPu := iQ2)
      hφinj hφimage hccw huP1 hP1P2 hP2w hws1 hs1s2 hs2s3
      hs3v hvQ1 hQ1Q2
      (by simpa [iu, leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hu)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφP1)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφP2)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hw)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφs1)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφs2)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφs3)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hv)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφQ1)
      (by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel] using hφQ2)
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hpairQ,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I, hq₁I,
      hq₂I, hs1I, hs2I, hs3I, hcert⟩

end Problem97
