/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

/-!
# Literal-order transport for parsed G3 clauses

The compact checkpoint parser preserves the literal order stored in its input.
An extracted or trimmed core may represent the same clause with a different
literal order.  This module provides the certificate-generic semantic bridge:
either prove the raw and core clauses are permutations directly, or compare
them through a normalizer whose output is certified to preserve the literal
multiset.

No particular core extraction order is assumed.
-/

namespace Problem97.CheckpointedRup.ParsedClauseNormalization

open Census554.CoverCnf

/-- A signed-clause normalizer certified to preserve the literal multiset. -/
structure SignedClauseNormalizer where
  normalize : List Int → List Int
  normalize_perm (clause : List Int) : (normalize clause).Perm clause

/-- DIMACS clause evaluation is invariant under literal permutation. -/
theorem evalClauseD_eq_of_perm (σ : Nat → Bool) {source core : List Int}
    (hperm : source.Perm core) :
    evalClauseD σ source = evalClauseD σ core :=
  hperm.any_eq

/-- Equal outputs of a certified normalizer prove that two signed clauses
differ only by literal order. -/
theorem SignedClauseNormalizer.perm_of_normalize_eq
    (normalizer : SignedClauseNormalizer) {source core : List Int}
    (h : normalizer.normalize source = normalizer.normalize core) :
    source.Perm core := by
  exact (normalizer.normalize_perm source).symm.trans
    (h ▸ normalizer.normalize_perm core)

/-- Certified normalized equality transports DIMACS clause evaluation. -/
theorem SignedClauseNormalizer.evalClauseD_eq_of_normalize_eq
    (normalizer : SignedClauseNormalizer) (σ : Nat → Bool)
    {source core : List Int}
    (h : normalizer.normalize source = normalizer.normalize core) :
    evalClauseD σ source = evalClauseD σ core :=
  evalClauseD_eq_of_perm σ (normalizer.perm_of_normalize_eq h)

/-- Satisfaction of a raw source clause transports to a permuted core clause. -/
theorem evalClauseD_core_of_source (σ : Nat → Bool) {source core : List Int}
    (hperm : source.Perm core)
    (hsource : evalClauseD σ source = true) :
    evalClauseD σ core = true := by
  rw [← evalClauseD_eq_of_perm σ hperm]
  exact hsource

/-- Clausewise permutations transport satisfaction of every source clause to
every core clause. -/
theorem evalClauseD_all_core_of_source (σ : Nat → Bool)
    {source core : List (List Int)}
    (hperm : List.Forall₂ List.Perm source core)
    (hsource : ∀ clause ∈ source, evalClauseD σ clause = true) :
    ∀ clause ∈ core, evalClauseD σ clause = true := by
  induction hperm with
  | nil =>
      intro clause hclause
      simp at hclause
  | cons hhead htail ih =>
      intro clause hclause
      simp only [List.mem_cons] at hclause
      rcases hclause with rfl | hclause
      · exact evalClauseD_core_of_source σ hhead (hsource _ (by simp))
      · exact ih (fun sourceClause hmem => hsource sourceClause (by simp [hmem]))
          clause hclause

end Problem97.CheckpointedRup.ParsedClauseNormalization
