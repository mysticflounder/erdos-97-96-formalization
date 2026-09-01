/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Card

/-!
# Abstract finite row systems

This module records the weak combinatorial interface shared by the P97 carrier
projection and by finite incidence obstructions.  Blocker, metric, order, and
source-faithfulness hypotheses deliberately remain separate predicates.
-/

namespace Problem97

/-- A center-indexed family of finite rows.  No geometric or blocker property
is built into the data. -/
structure AbstractRowSystem (α : Type*) where
  row : α → Finset α

namespace AbstractRowSystem

variable {α : Type*}

/-- Every row has the prescribed cardinality. -/
def RowCardEq (S : AbstractRowSystem α) (k : ℕ) : Prop :=
  ∀ c, (S.row c).card = k

/-- A center is omitted from its own row. -/
def CenterExcluded [DecidableEq α] (S : AbstractRowSystem α) : Prop :=
  ∀ c, c ∉ S.row c

/-- A chosen blocker differs from its source and its row contains the source. -/
def HasBlockerSection [DecidableEq α] (S : AbstractRowSystem α)
    (beta : α → α) : Prop :=
  ∀ q, beta q ≠ q ∧ q ∈ S.row (beta q)

/-- Distinct rows meet in at most `k` points. -/
def RowInterCardLE [DecidableEq α] (S : AbstractRowSystem α) (k : ℕ) : Prop :=
  ∀ ⦃c d⦄, c ≠ d → ((S.row c) ∩ (S.row d)).card ≤ k

/-- The number of row centers whose rows contain both named points. -/
def pairCodegree [Fintype α] [DecidableEq α] (S : AbstractRowSystem α)
    (a b : α) : ℕ :=
  (Finset.univ.filter fun c => a ∈ S.row c ∧ b ∈ S.row c).card

/-- Distinct point-pairs occur together in at most `k` rows. -/
def PairCodegreeLE [Fintype α] [DecidableEq α]
    (S : AbstractRowSystem α) (k : ℕ) : Prop :=
  ∀ ⦃a b⦄, a ≠ b → S.pairCodegree a b ≤ k

/-- Every row centered in `T` stays inside `T`. -/
def SupportClosed [DecidableEq α] (S : AbstractRowSystem α)
    (T : Finset α) : Prop :=
  ∀ ⦃c⦄, c ∈ T → S.row c ⊆ T

/-- A nonempty support-closed set contains the whole finite carrier. -/
def SupportMinimal [Fintype α] [DecidableEq α]
    (S : AbstractRowSystem α) : Prop :=
  ∀ ⦃T : Finset α⦄, T.Nonempty → S.SupportClosed T → T = Finset.univ

end AbstractRowSystem
end Problem97
