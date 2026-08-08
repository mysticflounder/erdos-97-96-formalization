/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PlacementOrbits
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PhysicalCycleIngress

/-!
# Branch transport for the exact-twelve Rigid221 lane

This module proves that the three source-faithful Boolean predicates added by
the v14 common-deletion campaign survive every admissible frozen relabeling.
Together with the placement cover, these lemmas remove a genuine transport
gap.  They do not establish finite CEGAR coverage or close a live leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- Relabel each actual blocker in the five-cycle packet. -/
def reindexBlocker (relabeling : Label ≃ Label)
    (blocker : Fin 5 → Label) : Fin 5 → Label :=
  fun i => relabeling (blocker i)

/-- Admissibility fixes the named labels in the forward direction as well as
the inverse direction used by `FrozenRoleLabeling.relabel`. -/
theorem AdmissibleFrozenRelabeling.apply_eq_self
    {relabeling : Label ≃ Label} (hadmissible :
      AdmissibleFrozenRelabeling relabeling)
    {i : Label} (hi : i ∈ fixedRoleLabels) : relabeling i = i := by
  calc
    relabeling i = relabeling (relabeling.symm i) := by
      rw [hadmissible.1 i hi]
    _ = i := relabeling.apply_symm_apply i

/-- Carrier subsets commute with composition of a frozen labeling and a label
permutation. -/
theorem labelsOf_trans_map
    {A : Finset ℝ²} (e : CarrierLabel A ≃ Label)
    (relabeling : Label ≃ Label) (S : Finset ℝ²) :
    labelsOf (e.trans relabeling) S =
      (labelsOf e S).map relabeling.toEmbedding := by
  ext label
  simp [mem_labelsOf_iff]

/-- Exact row traces against geometric carrier subsets commute with frozen
relabeling. -/
theorem reindexRowPattern_inter_labelsOf_trans
    {A : Finset ℝ²} (e : CarrierLabel A ≃ Label)
    (relabeling : Label ≃ Label) (row : RowPattern Label)
    (center : Label) (S : Finset ℝ²) :
    reindexRowPattern relabeling row (relabeling center) ∩
        labelsOf (e.trans relabeling) S =
      (row center ∩ labelsOf e S).map relabeling.toEmbedding := by
  ext label
  simp [mem_labelsOf_iff]

/-- A single row fiber commutes with finite row-pattern reindexing. -/
theorem rowFiber_reindex
    (relabeling : Label ≃ Label) (row : RowPattern Label)
    (center : Label) :
    reindexRowPattern relabeling row (relabeling center) =
      (row center).map relabeling.toEmbedding := by
  ext label
  simp [mem_reindexRowPattern_iff]

/-- Transport a source-produced exact row trace through a frozen relabeling. -/
theorem rowTrace_reindex
    {A : Finset ℝ²} (e : CarrierLabel A ≃ Label)
    (relabeling : Label ≃ Label) (row : RowPattern Label)
    (center : Label) (S T : Finset ℝ²)
    (htrace : row center ∩ labelsOf e S = labelsOf e T) :
    reindexRowPattern relabeling row (relabeling center) ∩
        labelsOf (e.trans relabeling) S =
      labelsOf (e.trans relabeling) T := by
  rw [reindexRowPattern_inter_labelsOf_trans, htrace,
    labelsOf_trans_map]

/-- The six named source/deletion alternatives are invariant under every
admissible frozen relabeling. -/
theorem FrozenNamedDeletionSixArm.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (harm : FrozenNamedDeletionSixArm row blocker) :
    FrozenNamedDeletionSixArm (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  have htwoInv := hadmissible.1 2 (by decide)
  have htenInv := hadmissible.1 10 (by decide)
  have helevenInv := hadmissible.1 11 (by decide)
  have htwo := hadmissible.apply_eq_self (i := 2) (by decide)
  have hten := hadmissible.apply_eq_self (i := 10) (by decide)
  have heleven := hadmissible.apply_eq_self (i := 11) (by decide)
  have hneTwo (i : Fin 5) :
      relabeling (blocker i) ≠ 2 ↔ blocker i ≠ 2 := by
    constructor
    · intro h hEq
      exact h (hEq ▸ htwo)
    · intro h hEq
      exact h (relabeling.injective (hEq.trans htwo.symm))
  simpa [FrozenNamedDeletionSixArm, reindexBlocker, htwoInv, htenInv,
    helevenInv, htwo, hten, heleven, hneTwo]
    using harm

/-- The distinguished common-missing selector is invariant under every
admissible frozen relabeling. -/
theorem FrozenDistinguishedDCommonMissing.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (hd : FrozenDistinguishedDCommonMissing row blocker) :
    FrozenDistinguishedDCommonMissing (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  have honeInv := hadmissible.1 1 (by decide)
  have hsixInv := hadmissible.1 6 (by decide)
  have hsevenInv := hadmissible.1 7 (by decide)
  have hnineInv := hadmissible.1 9 (by decide)
  have hone := hadmissible.apply_eq_self (i := 1) (by decide)
  have hsix := hadmissible.apply_eq_self (i := 6) (by decide)
  have hseven := hadmissible.apply_eq_self (i := 7) (by decide)
  have hnine := hadmissible.apply_eq_self (i := 9) (by decide)
  rcases hd with ⟨d, hd1, hd7, hsevenRow, hnineRow, hblocker, hmissing⟩
  refine ⟨relabeling d, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro h
    exact hd1 (relabeling.injective (h.trans hone.symm))
  · intro h
    exact hd7 (relabeling.injective (h.trans hseven.symm))
  · simpa [hsevenInv, hseven] using hsevenRow
  · simpa [hnineInv, hnine] using hnineRow
  · exact relabeling.injective.ne hblocker
  · simpa [honeInv, hsixInv, hsevenInv, hone, hsix, hseven] using hmissing

/-- The strengthened selector excluding label `8` is likewise invariant. -/
theorem FrozenDistinguishedDCommonMissingAwayFromEight.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (hd : FrozenDistinguishedDCommonMissingAwayFromEight row blocker) :
    FrozenDistinguishedDCommonMissingAwayFromEight
      (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  have honeInv := hadmissible.1 1 (by decide)
  have hsixInv := hadmissible.1 6 (by decide)
  have hsevenInv := hadmissible.1 7 (by decide)
  have heightInv := hadmissible.1 8 (by decide)
  have hnineInv := hadmissible.1 9 (by decide)
  have hone := hadmissible.apply_eq_self (i := 1) (by decide)
  have hsix := hadmissible.apply_eq_self (i := 6) (by decide)
  have hseven := hadmissible.apply_eq_self (i := 7) (by decide)
  have height := hadmissible.apply_eq_self (i := 8) (by decide)
  have hnine := hadmissible.apply_eq_self (i := 9) (by decide)
  rcases hd with
    ⟨d, hd1, hd7, hd8, hsevenRow, hnineRow, hblocker, hmissing⟩
  refine ⟨relabeling d, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro h
    exact hd1 (relabeling.injective (h.trans hone.symm))
  · intro h
    exact hd7 (relabeling.injective (h.trans hseven.symm))
  · intro h
    exact hd8 (relabeling.injective (h.trans height.symm))
  · simpa [hsevenInv, hseven] using hsevenRow
  · simpa [hnineInv, hnine] using hnineRow
  · exact relabeling.injective.ne hblocker
  · simpa [honeInv, hsixInv, hsevenInv, heightInv, hone, hsix, hseven,
      height] using hmissing

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
