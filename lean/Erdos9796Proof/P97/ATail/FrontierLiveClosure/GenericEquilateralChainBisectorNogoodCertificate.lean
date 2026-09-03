/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate
import Erdos9796Proof.P97.Census554.EquilateralChainBisectorCore

/-!
# Generic equilateral-chain bisector certificates

This module provides the source-facing checker for the eight equality paths in
`EquilateralChainBisectorCore`. Its row hypotheses are deliberately positive:
a certificate need only list the memberships used by its paths, not the
complete source rows.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace GenericRowNogoodCertificate

open Census554.EqualityCore

/-- The eight equality paths and three distinctness conditions of an
    equilateral-chain bisector core. -/
structure EquilateralChainBisectorData (α : Type*) where
  p : α
  q : α
  t₁ : α
  t₂ : α
  t₃ : α
  a : α
  pt₁_pt₃ : ClosurePathData α
  pt₁_pq : ClosurePathData α
  t₁p_t₁t₂ : ClosurePathData α
  t₁p_t₁q : ClosurePathData α
  t₂p_t₂t₁ : ClosurePathData α
  t₃p_t₃t₂ : ClosurePathData α
  t₃p_t₃a : ClosurePathData α
  ap_aq : ClosurePathData α
deriving DecidableEq

/-- Boolean validation of the named distinctness conditions and equality paths.
    The path endpoints are fixed by the target core. -/
def EquilateralChainBisectorData.check {α : Type*} [DecidableEq α]
    (choices : List (RowChoice α)) (data : EquilateralChainBisectorData α) : Bool :=
  decide (data.p ≠ data.t₁ ∧ data.q ≠ data.t₂ ∧ data.t₁ ≠ data.t₃) &&
    checkPath choices data.pt₁_pt₃ (data.p, data.t₁) (data.p, data.t₃) &&
    checkPath choices data.pt₁_pq (data.p, data.t₁) (data.p, data.q) &&
    checkPath choices data.t₁p_t₁t₂ (data.t₁, data.p) (data.t₁, data.t₂) &&
    checkPath choices data.t₁p_t₁q (data.t₁, data.p) (data.t₁, data.q) &&
    checkPath choices data.t₂p_t₂t₁ (data.t₂, data.p) (data.t₂, data.t₁) &&
    checkPath choices data.t₃p_t₃t₂ (data.t₃, data.p) (data.t₃, data.t₂) &&
    checkPath choices data.t₃p_t₃a (data.t₃, data.p) (data.t₃, data.a) &&
    checkPath choices data.ap_aq (data.a, data.p) (data.a, data.q)

/-- A positively source-matching checked certificate produces the metric core
    consumed by the equilateral-chain bisector theorem. -/
theorem nonempty_equilateralChainBisectorCore_of_positiveCheck
    {α : Type*} [DecidableEq α] {P : RowPattern α}
    {choices : List (RowChoice α)} (hrows : PositiveRowsMatch P choices)
    (data : EquilateralChainBisectorData α) (hcheck : data.check choices = true) :
    Nonempty (EquilateralChainBisectorCore P) := by
  simp only [EquilateralChainBisectorData.check, Bool.and_eq_true] at hcheck
  rcases hcheck with
    ⟨⟨⟨⟨⟨⟨⟨⟨hinequalities, hpt₁_pt₃⟩, hpt₁_pq⟩, ht₁p_t₁t₂⟩,
      ht₁p_t₁q⟩, ht₂p_t₂t₁⟩, ht₃p_t₃t₂⟩, ht₃p_t₃a⟩, hap_aq⟩
  have hne : data.p ≠ data.t₁ ∧ data.q ≠ data.t₂ ∧ data.t₁ ≠ data.t₃ :=
    of_decide_eq_true hinequalities
  exact ⟨{
    p := data.p
    q := data.q
    t₁ := data.t₁
    t₂ := data.t₂
    t₃ := data.t₃
    a := data.a
    hp_t₁ := hne.1
    hq_t₂ := hne.2.1
    ht₁_t₃ := hne.2.2
    pt₁_pt₃ := edgeClosure_of_checkPath_positive hrows data.pt₁_pt₃ hpt₁_pt₃
    pt₁_pq := edgeClosure_of_checkPath_positive hrows data.pt₁_pq hpt₁_pq
    t₁p_t₁t₂ := edgeClosure_of_checkPath_positive hrows data.t₁p_t₁t₂ ht₁p_t₁t₂
    t₁p_t₁q := edgeClosure_of_checkPath_positive hrows data.t₁p_t₁q ht₁p_t₁q
    t₂p_t₂t₁ := edgeClosure_of_checkPath_positive hrows data.t₂p_t₂t₁ ht₂p_t₂t₁
    t₃p_t₃t₂ := edgeClosure_of_checkPath_positive hrows data.t₃p_t₃t₂ ht₃p_t₃t₂
    t₃p_t₃a := edgeClosure_of_checkPath_positive hrows data.t₃p_t₃a ht₃p_t₃a
    ap_aq := edgeClosure_of_checkPath_positive hrows data.ap_aq hap_aq }⟩

end GenericRowNogoodCertificate
end ATailFrontierLiveClosure
end Problem97
