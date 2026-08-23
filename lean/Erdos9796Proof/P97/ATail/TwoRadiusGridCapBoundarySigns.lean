/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-! # Source-independent signs for the two-radius cap adapter -/

open scoped EuclideanGeometry

namespace Problem97

open Census554.GeneralCarrierBridge

private theorem area_cyclic {x y z : ℝ²} :
    signedArea2 x y z = signedArea2 y z x := by
  unfold signedArea2
  ring

private theorem area_swap12 {x y z : ℝ²} :
    signedArea2 x y z = -signedArea2 y x z := by
  unfold signedArea2
  ring

private theorem area_swap23 {x y z : ℝ²} :
    signedArea2 x y z = -signedArea2 x z y := by
  unfold signedArea2
  ring

/-- The cap-order/sign kernel.  The producer obtains the weak endpoint
inequalities in `hOrient` from `ZeroCutBoundaryIndexing.exists_with_capBlocks`
and the closed-cap interval theorems.  Thus outer adjacent-cap endpoints are
retained; only the selected apex is excluded by the caller's positive-radius
distinctness facts. -/
theorem boundary_sign_packet
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {o a s sMinus L t : ℝ²}
    {io ia is im iL it : Fin B.n}
    (ho : B.boundary io = o)
    (ha : B.boundary ia = a)
    (hs : B.boundary is = s)
    (hsMinus : B.boundary im = sMinus)
    (hL : B.boundary iL = L)
    (ht : B.boundary it = t)
    (hioia : io ≠ ia)
    (hmio : im ≠ io)
    (hmia : im ≠ ia)
    (hsNe : s ≠ sMinus)
    (hsO : dist o s = dist o sMinus)
    (hsA : dist a s = dist a sMinus)
    (hOrient :
      (im < io ∧ io < it ∧ it < is ∧ it < iL) ∨
      (is < it ∧ it < io ∧ iL < it ∧
        (im < is ∨ io < im))) :
    (0 < signedArea2 o a s ∧
        0 < signedArea2 o s t ∧
        0 < signedArea2 o sMinus t ∧
        (0 < signedArea2 o L s → 0 < signedArea2 L s t)) ∨
      (signedArea2 o a s < 0 ∧
        signedArea2 o s t < 0 ∧
        signedArea2 o sMinus t < 0 ∧
        (signedArea2 o L s < 0 → signedArea2 L s t < 0)) := by
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing
      B hij hjk
  have hsep :
      SurplusCOMPGBank.btw io ia is ↔
        ¬ SurplusCOMPGBank.btw io ia im := by
    apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
    · exact hioia
    · exact hmio
    · exact hmia
    · simpa only [ho, hs, hsMinus, dist_comm] using hsO
    · simpa only [ha, hs, hsMinus, dist_comm] using hsA
    · simpa only [hs, hsMinus] using hsNe
  rcases hOrient with hDirect | hMirror
  · rcases hDirect with ⟨himio, hioti, hitis, hitLi⟩
    have haout : ia < io ∨ is < ia := by
      unfold SurplusCOMPGBank.btw at hsep
      omega
    have hoa : 0 < signedArea2 o a s := by
      rcases haout with hleft | hright
      · have h := hneg hleft (lt_trans hioti hitis)
        have h' : 0 < signedArea2 (B.boundary io)
            (B.boundary ia) (B.boundary is) := by
          rw [area_swap12]
          linarith
        simpa only [ho, ha, hs] using h'
      · have h := hneg (lt_trans hioti hitis) hright
        have h' : 0 < signedArea2 (B.boundary io)
            (B.boundary ia) (B.boundary is) := by
          rw [area_swap23]
          linarith
        simpa only [ho, ha, hs] using h'
    have host : 0 < signedArea2 o s t := by
      have h := hneg hioti hitis
      have h' : 0 < signedArea2 (B.boundary io)
          (B.boundary is) (B.boundary it) := by
        rw [area_swap23]
        linarith
      simpa only [ho, hs, ht] using h'
    have hosmt : 0 < signedArea2 o sMinus t := by
      have h := hneg himio hioti
      have h' : 0 < signedArea2 (B.boundary io)
          (B.boundary im) (B.boundary it) := by
        rw [area_swap12]
        linarith
      simpa only [ho, hsMinus, ht] using h'
    have hols : 0 < signedArea2 o L s →
        0 < signedArea2 L s t := by
      intro hAnte
      rcases lt_trichotomy iL is with hLi | rfl | hLi
      · have h := hneg (lt_trans hioti hitLi) hLi
        have h' : signedArea2 o L s < 0 := by
          simpa only [ho, hL, hs] using h
        linarith
      · have hLs : L = s := hL.symm.trans hs
        have hzero : signedArea2 o L s = 0 := by
          rw [hLs]
          unfold signedArea2
          ring
        linarith
      · have h := hneg hitis hLi
        have h' : 0 < signedArea2 (B.boundary iL)
            (B.boundary is) (B.boundary it) := by
          have h' := hneg hitis hLi
          rw [area_swap23, area_cyclic]
          linarith
        simpa only [hL, hs, ht] using h'
    exact Or.inl ⟨hoa, host, hosmt, hols⟩
  · rcases hMirror with ⟨hist, hiio, hiLit, him | hioim⟩
    · have haout : ia < is ∨ io < ia := by
        unfold SurplusCOMPGBank.btw at hsep
        omega
      have hoa : signedArea2 o a s < 0 := by
        rcases haout with hleft | hright
        · have h := hneg hleft (lt_trans hist hiio)
          have h' : signedArea2 (B.boundary io)
              (B.boundary ia) (B.boundary is) < 0 := by
            calc
              _ = signedArea2 (B.boundary ia)
                  (B.boundary is) (B.boundary io) := area_cyclic
              _ < 0 := h
          simpa only [ho, ha, hs] using h'
        · have h := hneg (lt_trans hist hiio) hright
          have h' : signedArea2 (B.boundary io)
              (B.boundary ia) (B.boundary is) < 0 := by
            calc
              _ = signedArea2 (B.boundary ia)
                  (B.boundary is) (B.boundary io) := area_cyclic
              _ = signedArea2 (B.boundary is)
                  (B.boundary io) (B.boundary ia) := area_cyclic
              _ < 0 := h
          simpa only [ho, ha, hs] using h'
      have host : signedArea2 o s t < 0 := by
        have h := hneg hist hiio
        have h' : signedArea2 (B.boundary io)
            (B.boundary is) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary is)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ < 0 := h
        simpa only [ho, hs, ht] using h'
      have hosmt : signedArea2 o sMinus t < 0 := by
        have h := hneg (lt_trans him hist) hiio
        have h' : signedArea2 (B.boundary io)
            (B.boundary im) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary im)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ < 0 := h
        simpa only [ho, hsMinus, ht] using h'
      have hols : signedArea2 o L s < 0 →
          signedArea2 L s t < 0 := by
        intro hAnte
        rcases lt_trichotomy iL is with hLi | rfl | hLi
        · have h := hneg hLi hist
          simpa only [hL, hs, ht] using h
        · have hLs : L = s := hL.symm.trans hs
          have hzero : signedArea2 o L s = 0 := by
            rw [hLs]
            unfold signedArea2
            ring
          linarith
        · have hpos : 0 < signedArea2 o L s := by
            have h' := hneg hLi (lt_trans hiLit hiio)
            have h'' : 0 < signedArea2 (B.boundary io)
                (B.boundary iL) (B.boundary is) := by
              rw [area_swap23, area_cyclic]
              linarith
            simpa only [ho, hL, hs] using h''
          linarith
      exact Or.inr ⟨hoa, host, hosmt, hols⟩
    · have haout : ia < is ∨ io < ia := by
        unfold SurplusCOMPGBank.btw at hsep
        omega
      have hoa : signedArea2 o a s < 0 := by
        rcases haout with hleft | hright
        · have h := hneg hleft (lt_trans hist hiio)
          have h' : signedArea2 (B.boundary io)
              (B.boundary ia) (B.boundary is) < 0 := by
            calc
              _ = signedArea2 (B.boundary ia)
                  (B.boundary is) (B.boundary io) := area_cyclic
              _ < 0 := h
          simpa only [ho, ha, hs] using h'
        · have h := hneg (lt_trans hist hiio) hright
          have h' : signedArea2 (B.boundary io)
              (B.boundary ia) (B.boundary is) < 0 := by
            calc
              _ = signedArea2 (B.boundary ia)
                  (B.boundary is) (B.boundary io) := area_cyclic
              _ = signedArea2 (B.boundary is)
                  (B.boundary io) (B.boundary ia) := area_cyclic
              _ < 0 := h
          simpa only [ho, ha, hs] using h'
      have host : signedArea2 o s t < 0 := by
        have h := hneg hist hiio
        have h' : signedArea2 (B.boundary io)
            (B.boundary is) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary is)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ < 0 := h
        simpa only [ho, hs, ht] using h'
      have hosmt : signedArea2 o sMinus t < 0 := by
        have h := hneg hiio hioim
        have h' : signedArea2 (B.boundary io)
            (B.boundary im) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary im)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ = signedArea2 (B.boundary it)
                (B.boundary io) (B.boundary im) := area_cyclic
            _ < 0 := h
        simpa only [ho, hsMinus, ht] using h'
      have hols : signedArea2 o L s < 0 →
          signedArea2 L s t < 0 := by
        intro hAnte
        rcases lt_trichotomy iL is with hLi | rfl | hLi
        · have h := hneg hLi hist
          simpa only [hL, hs, ht] using h
        · have hLs : L = s := hL.symm.trans hs
          have hzero : signedArea2 o L s = 0 := by
            rw [hLs]
            unfold signedArea2
            ring
          linarith
        · have hpos : 0 < signedArea2 o L s := by
            have h' := hneg hLi (lt_trans hiLit hiio)
            have h'' : 0 < signedArea2 (B.boundary io)
                (B.boundary iL) (B.boundary is) := by
              rw [area_swap23, area_cyclic]
              linarith
            simpa only [ho, hL, hs] using h''
          linarith
      exact Or.inr ⟨hoa, host, hosmt, hols⟩

/-- Escape-side signs for the two-radius adapter, independent of the blocker.
The weak endpoint inequalities are the direct/mirror output of the zero-cut
cap blocks and closed-cap interval APIs. -/
theorem boundary_escape_sign_packet
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {o s sMinus L t : ℝ²}
    {io is im iL it : Fin B.n}
    (ho : B.boundary io = o)
    (hs : B.boundary is = s)
    (hsMinus : B.boundary im = sMinus)
    (hL : B.boundary iL = L)
    (ht : B.boundary it = t)
    (hOrient :
      (im < io ∧ io < it ∧ it < is ∧ it < iL) ∨
      (is < it ∧ it < io ∧ iL < it ∧
        (im < is ∨ io < im))) :
    (0 < signedArea2 o s t ∧
        0 < signedArea2 o sMinus t ∧
        (0 < signedArea2 o L s → 0 < signedArea2 L s t)) ∨
      (signedArea2 o s t < 0 ∧
        signedArea2 o sMinus t < 0 ∧
        (signedArea2 o L s < 0 → signedArea2 L s t < 0)) := by
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing
      B hij hjk
  rcases hOrient with hDirect | hMirror
  · rcases hDirect with ⟨himio, hioti, hitis, hitLi⟩
    have host : 0 < signedArea2 o s t := by
      have h := hneg hioti hitis
      have h' : 0 < signedArea2 (B.boundary io)
          (B.boundary is) (B.boundary it) := by
        rw [area_swap23]
        linarith
      simpa only [ho, hs, ht] using h'
    have hosmt : 0 < signedArea2 o sMinus t := by
      have h := hneg himio hioti
      have h' : 0 < signedArea2 (B.boundary io)
          (B.boundary im) (B.boundary it) := by
        rw [area_swap12]
        linarith
      simpa only [ho, hsMinus, ht] using h'
    have hols : 0 < signedArea2 o L s →
        0 < signedArea2 L s t := by
      intro hAnte
      rcases lt_trichotomy iL is with hLi | rfl | hLi
      · have h := hneg (lt_trans hioti hitLi) hLi
        have h' : signedArea2 o L s < 0 := by
          simpa only [ho, hL, hs] using h
        linarith
      · have hLs : L = s := hL.symm.trans hs
        have hzero : signedArea2 o L s = 0 := by
          rw [hLs]
          unfold signedArea2
          ring
        linarith
      · have h := hneg hitis hLi
        have h' : 0 < signedArea2 (B.boundary iL)
            (B.boundary is) (B.boundary it) := by
          rw [area_swap23, area_cyclic]
          linarith
        simpa only [hL, hs, ht] using h'
    exact Or.inl ⟨host, hosmt, hols⟩
  · rcases hMirror with ⟨hist, hiio, hiLit, him | hioim⟩
    · have host : signedArea2 o s t < 0 := by
        have h := hneg hist hiio
        have h' : signedArea2 (B.boundary io)
            (B.boundary is) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary is)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ < 0 := h
        simpa only [ho, hs, ht] using h'
      have hosmt : signedArea2 o sMinus t < 0 := by
        have h := hneg (lt_trans him hist) hiio
        have h' : signedArea2 (B.boundary io)
            (B.boundary im) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary im)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ < 0 := h
        simpa only [ho, hsMinus, ht] using h'
      have hols : signedArea2 o L s < 0 →
          signedArea2 L s t < 0 := by
        intro hAnte
        rcases lt_trichotomy iL is with hLi | rfl | hLi
        · have h := hneg hLi hist
          simpa only [hL, hs, ht] using h
        · have hLs : L = s := hL.symm.trans hs
          have hzero : signedArea2 o L s = 0 := by
            rw [hLs]
            unfold signedArea2
            ring
          linarith
        · have h' := hneg hLi (lt_trans hiLit hiio)
          have hpos : 0 < signedArea2 o L s := by
            have h'' : 0 < signedArea2 (B.boundary io)
                (B.boundary iL) (B.boundary is) := by
              rw [area_swap23, area_cyclic]
              linarith
            simpa only [ho, hL, hs] using h''
          linarith
      exact Or.inr ⟨host, hosmt, hols⟩
    · have host : signedArea2 o s t < 0 := by
        have h := hneg hist hiio
        have h' : signedArea2 (B.boundary io)
            (B.boundary is) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary is)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ < 0 := h
        simpa only [ho, hs, ht] using h'
      have hosmt : signedArea2 o sMinus t < 0 := by
        have h := hneg hiio hioim
        have h' : signedArea2 (B.boundary io)
            (B.boundary im) (B.boundary it) < 0 := by
          calc
            _ = signedArea2 (B.boundary im)
                (B.boundary it) (B.boundary io) := area_cyclic
            _ = signedArea2 (B.boundary it)
                (B.boundary io) (B.boundary im) := area_cyclic
            _ < 0 := h
        simpa only [ho, hsMinus, ht] using h'
      have hols : signedArea2 o L s < 0 →
          signedArea2 L s t < 0 := by
        intro hAnte
        rcases lt_trichotomy iL is with hLi | rfl | hLi
        · have h := hneg hLi hist
          simpa only [hL, hs, ht] using h
        · have hLs : L = s := hL.symm.trans hs
          have hzero : signedArea2 o L s = 0 := by
            rw [hLs]
            unfold signedArea2
            ring
          linarith
        · have h' := hneg hLi (lt_trans hiLit hiio)
          have hpos : 0 < signedArea2 o L s := by
            have h'' : 0 < signedArea2 (B.boundary io)
                (B.boundary iL) (B.boundary is) := by
              rw [area_swap23, area_cyclic]
              linarith
            simpa only [ho, hL, hs] using h''
          linarith
      exact Or.inr ⟨host, hosmt, hols⟩

end Problem97
