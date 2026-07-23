/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Max
import Mathlib.Data.Finset.Interval

/-!
# A finite interval transversal normal form

This file isolates the combinatorial core of the complement of the four-arc
shell-curvature occurrence.  After cutting a circular family at one turn:

* every arc through the cut is hit by the cut turn; and
* every other circular arc is one ordinary closed interval in the cut-open
  linear order.

If the remaining interval family has no four intervals in left-to-right
disjoint order, three greedily chosen right endpoints hit it.  Re-inserting
the cut turn gives a transversal of cardinality at most four.

The theorem is deliberately independent of carrier points, cap membership,
MEC geometry, and critical-shell provenance.  Those are separate mapping and
consumer questions.
-/

namespace Problem97
namespace ATailUniqueFourArcTransversalScratch

/-- A nonempty closed interval in `ℕ`. -/
structure NatClosedInterval where
  left : ℕ
  right : ℕ
  left_le_right : left ≤ right
  deriving DecidableEq

namespace NatClosedInterval

/-- Point membership in a closed interval. -/
def Contains (I : NatClosedInterval) (x : ℕ) : Prop :=
  I.left ≤ x ∧ x ≤ I.right

instance (I : NatClosedInterval) (x : ℕ) : Decidable (I.Contains x) := by
  unfold Contains
  infer_instance

theorem contains_right (I : NatClosedInterval) : I.Contains I.right :=
  ⟨I.left_le_right, le_rfl⟩

/-- If `I` has least right endpoint in a family, then every family interval
not hit by `I.right` begins strictly after `I.right`. -/
theorem right_lt_left_of_minimal_right
    {F : Finset NatClosedInterval} {I J : NatClosedInterval}
    (hJ : J ∈ F)
    (hmin : ∀ K ∈ F, I.right ≤ K.right)
    (hmiss : ¬ J.Contains I.right) :
    I.right < J.left := by
  have hright : I.right ≤ J.right := hmin J hJ
  by_contra hnot
  have hleft : J.left ≤ I.right := Nat.le_of_not_gt hnot
  exact hmiss ⟨hleft, hright⟩

end NatClosedInterval

/-- Four intervals occur in strictly separated left-to-right order. -/
def HasFourSeparated (F : Finset NatClosedInterval) : Prop :=
  ∃ I₁ ∈ F, ∃ I₂ ∈ F, ∃ I₃ ∈ F, ∃ I₄ ∈ F,
    I₁.right < I₂.left ∧
    I₂.right < I₃.left ∧
    I₃.right < I₄.left

/-- A finite point set meets every interval in the family. -/
def HitsEveryInterval (T : Finset ℕ) (F : Finset NatClosedInterval) : Prop :=
  ∀ I ∈ F, ∃ x ∈ T, I.Contains x

/-- Three greedy right endpoints hit every finite line-interval family with
no four separated members.

This is the exact line component needed after cutting a circular-arc family.
The proof exposes the greedy normal form rather than appealing to an external
interval-graph theorem. -/
theorem exists_three_point_transversal_of_not_hasFourSeparated
    (F : Finset NatClosedInterval)
    (hnoFour : ¬ HasFourSeparated F) :
    ∃ T : Finset ℕ, T.card ≤ 3 ∧ HitsEveryInterval T F := by
  classical
  by_cases hF : F.Nonempty
  · rcases F.exists_min_image NatClosedInterval.right hF with
      ⟨I₁, hI₁F, hI₁min⟩
    let b₁ := I₁.right
    let F₁ := F.filter fun I ↦ ¬ I.Contains b₁
    by_cases hF₁ : F₁.Nonempty
    · rcases F₁.exists_min_image NatClosedInterval.right hF₁ with
        ⟨I₂, hI₂F₁, hI₂min⟩
      let b₂ := I₂.right
      let F₂ := F₁.filter fun I ↦ ¬ I.Contains b₂
      by_cases hF₂ : F₂.Nonempty
      · rcases F₂.exists_min_image NatClosedInterval.right hF₂ with
          ⟨I₃, hI₃F₂, hI₃min⟩
        let b₃ := I₃.right
        let F₃ := F₂.filter fun I ↦ ¬ I.Contains b₃
        have hF₃empty : ¬ F₃.Nonempty := by
          intro hF₃
          rcases hF₃ with ⟨I₄, hI₄F₃⟩
          have hI₂F : I₂ ∈ F :=
            (Finset.mem_filter.mp hI₂F₁).1
          have hI₃F₁ : I₃ ∈ F₁ :=
            (Finset.mem_filter.mp hI₃F₂).1
          have hI₃F : I₃ ∈ F :=
            (Finset.mem_filter.mp hI₃F₁).1
          have hI₄F₂ : I₄ ∈ F₂ :=
            (Finset.mem_filter.mp hI₄F₃).1
          have hI₄F₁ : I₄ ∈ F₁ :=
            (Finset.mem_filter.mp hI₄F₂).1
          have hI₄F : I₄ ∈ F :=
            (Finset.mem_filter.mp hI₄F₁).1
          have hI₂miss : ¬ I₂.Contains b₁ :=
            (Finset.mem_filter.mp hI₂F₁).2
          have hI₃miss : ¬ I₃.Contains b₂ :=
            (Finset.mem_filter.mp hI₃F₂).2
          have hI₄miss : ¬ I₄.Contains b₃ :=
            (Finset.mem_filter.mp hI₄F₃).2
          have h₁₂ : I₁.right < I₂.left := by
            exact NatClosedInterval.right_lt_left_of_minimal_right
              hI₂F hI₁min (by simpa [b₁] using hI₂miss)
          have h₂₃ : I₂.right < I₃.left := by
            exact NatClosedInterval.right_lt_left_of_minimal_right
              hI₃F₁ hI₂min (by simpa [b₂] using hI₃miss)
          have h₃₄ : I₃.right < I₄.left := by
            exact NatClosedInterval.right_lt_left_of_minimal_right
              hI₄F₂ hI₃min (by simpa [b₃] using hI₄miss)
          exact hnoFour
            ⟨I₁, hI₁F, I₂, hI₂F, I₃, hI₃F,
              I₄, hI₄F, h₁₂, h₂₃, h₃₄⟩
        have hpairCard : ({b₂, b₃} : Finset ℕ).card ≤ 2 := by
          have h := Finset.card_insert_le b₂ ({b₃} : Finset ℕ)
          simpa using h
        have htripleCard : ({b₁, b₂, b₃} : Finset ℕ).card ≤ 3 := by
          have h := Finset.card_insert_le b₁ ({b₂, b₃} : Finset ℕ)
          omega
        refine ⟨{b₁, b₂, b₃}, htripleCard, ?_⟩
        intro I hIF
        by_cases hIb₁ : I.Contains b₁
        · exact ⟨b₁, by simp, hIb₁⟩
        · have hIF₁ : I ∈ F₁ := Finset.mem_filter.mpr ⟨hIF, hIb₁⟩
          by_cases hIb₂ : I.Contains b₂
          · exact ⟨b₂, by simp, hIb₂⟩
          · have hIF₂ : I ∈ F₂ := Finset.mem_filter.mpr ⟨hIF₁, hIb₂⟩
            by_cases hIb₃ : I.Contains b₃
            · exact ⟨b₃, by simp, hIb₃⟩
            · have hIF₃ : I ∈ F₃ := Finset.mem_filter.mpr ⟨hIF₂, hIb₃⟩
              exact False.elim (hF₃empty ⟨I, hIF₃⟩)
      · have hpairCard : ({b₁, b₂} : Finset ℕ).card ≤ 2 := by
          have h := Finset.card_insert_le b₁ ({b₂} : Finset ℕ)
          simpa using h
        refine ⟨{b₁, b₂}, by omega, ?_⟩
        intro I hIF
        by_cases hIb₁ : I.Contains b₁
        · exact ⟨b₁, by simp, hIb₁⟩
        · have hIF₁ : I ∈ F₁ := Finset.mem_filter.mpr ⟨hIF, hIb₁⟩
          by_cases hIb₂ : I.Contains b₂
          · exact ⟨b₂, by simp, hIb₂⟩
          · have hIF₂ : I ∈ F₂ := Finset.mem_filter.mpr ⟨hIF₁, hIb₂⟩
            exact False.elim (hF₂ ⟨I, hIF₂⟩)
    · refine ⟨{b₁}, by simp, ?_⟩
      intro I hIF
      by_cases hIb₁ : I.Contains b₁
      · exact ⟨b₁, by simp, hIb₁⟩
      · have hIF₁ : I ∈ F₁ := Finset.mem_filter.mpr ⟨hIF, hIb₁⟩
        exact False.elim (hF₁ ⟨I, hIF₁⟩)
  · refine ⟨∅, by simp, ?_⟩
    intro I hIF
    exact False.elim (hF ⟨I, hIF⟩)

/-- Cut-open circular normal form.  The distinguished cut turn handles every
arc that crosses it; the three-point line transversal handles all arcs that
avoid it. -/
theorem exists_four_point_cut_transversal
    (cut : ℕ) (away : Finset NatClosedInterval)
    (hnoFour : ¬ HasFourSeparated away) :
    ∃ T : Finset ℕ,
      T.card ≤ 4 ∧ cut ∈ T ∧ HitsEveryInterval T away := by
  classical
  rcases exists_three_point_transversal_of_not_hasFourSeparated away hnoFour with
    ⟨T, hTcard, hThits⟩
  refine ⟨insert cut T, ?_, Finset.mem_insert_self cut T, ?_⟩
  · have h := Finset.card_insert_le cut T
    omega
  · intro I hI
    rcases hThits I hI with ⟨x, hxT, hxI⟩
    exact ⟨x, Finset.mem_insert_of_mem hxT, hxI⟩

/-- The cut-open normal form of a circular arc.  An arc either crosses the
distinguished cut turn, or becomes one ordinary closed interval. -/
inductive CutArc where
  | throughCut
  | away (interval : NatClosedInterval)
  deriving DecidableEq

namespace CutArc

/-- Extract all line intervals from a finite cut-open circular family. -/
def awayIntervals (F : Finset CutArc) : Finset NatClosedInterval :=
  F.biUnion fun A ↦
    match A with
    | throughCut => ∅
    | away I => {I}

/-- A point set hits a cut-open arc. -/
def HitBy (cut : ℕ) (T : Finset ℕ) : CutArc → Prop
  | throughCut => cut ∈ T
  | away I => ∃ x ∈ T, I.Contains x

/-- Circular-interval transversal normal form: if the cut-avoiding arcs have
no four separated members, at most four turn indices hit the whole family.

The distinguished cut is one of the four.  The other at most three points
are greedy right endpoints of cut-avoiding arcs. -/
theorem exists_four_point_transversal
    (cut : ℕ) (F : Finset CutArc)
    (hnoFour : ¬ HasFourSeparated (awayIntervals F)) :
    ∃ T : Finset ℕ,
      T.card ≤ 4 ∧ ∀ A ∈ F, A.HitBy cut T := by
  classical
  rcases exists_four_point_cut_transversal cut (awayIntervals F) hnoFour with
    ⟨T, hTcard, hcutT, haway⟩
  refine ⟨T, hTcard, ?_⟩
  intro A hAF
  cases A with
  | throughCut => exact hcutT
  | away I =>
      have hIaway : I ∈ awayIntervals F := by
        simp only [awayIntervals, Finset.mem_biUnion]
        exact ⟨CutArc.away I, hAF, by simp⟩
      exact haway I hIaway

end CutArc

/-- The two outer turn arcs contributed by one selected four-point row.

The shell-curvature construction makes these two arcs disjoint.  Keeping that
fact in the structure makes the next residual statement match the geometric
application: two rows supply the broad four-arc terminal exactly when their
two unions are disjoint. -/
structure TwoOuterArcRow (α : Type*) [DecidableEq α] where
  left : Finset α
  right : Finset α
  self_disjoint : Disjoint left right

namespace TwoOuterArcRow

variable {α ι : Type*} [DecidableEq α]

/-- The union of the two outer arcs belonging to one selected row. -/
def outerUnion (R : TwoOuterArcRow α) : Finset α :=
  R.left ∪ R.right

/-- Two selected rows supply four mutually disjoint outer arcs.  Internal
disjointness is stored in each row; this predicate records the four cross-row
disjointness conditions at once. -/
def FourCrossDisjoint (R S : TwoOuterArcRow α) : Prop :=
  Disjoint R.outerUnion S.outerUnion

theorem fourCrossDisjoint_iff (R S : TwoOuterArcRow α) :
    R.FourCrossDisjoint S ↔
      Disjoint R.left S.left ∧
      Disjoint R.left S.right ∧
      Disjoint R.right S.left ∧
      Disjoint R.right S.right := by
  simp only [FourCrossDisjoint, outerUnion, Finset.disjoint_union_left,
    Finset.disjoint_union_right]
  tauto

/-- Exact normal form for the failure of the two-row broad terminal: the two
outer-arc unions meet. -/
theorem outerUnion_inter_nonempty_of_not_fourCrossDisjoint
    (R S : TwoOuterArcRow α) (h : ¬ R.FourCrossDisjoint S) :
    (R.outerUnion ∩ S.outerUnion).Nonempty := by
  rw [FourCrossDisjoint, Finset.not_disjoint_iff] at h
  rcases h with ⟨x, hxR, hxS⟩
  exact ⟨x, Finset.mem_inter.mpr ⟨hxR, hxS⟩⟩

/-- A family contains a two-row broad four-arc witness. -/
def HasTwoRowFourArcMatching (row : ι → TwoOuterArcRow α) : Prop :=
  ∃ i j, i ≠ j ∧ (row i).FourCrossDisjoint (row j)

/-- If no two selected rows supply all four disjoint outer arcs, their
two-interval unions are pairwise intersecting.

This is sharper than the generic four-point transversal statement, but it is
still only an ordinal turn-arc conclusion.  It does not identify any hit turn
with a row-support point, cap point, MEC-boundary point, or critical center. -/
theorem pairwise_outerUnion_inter_nonempty_of_no_twoRowFourArcMatching
    (row : ι → TwoOuterArcRow α)
    (hno : ¬ HasTwoRowFourArcMatching row)
    {i j : ι} (hij : i ≠ j) :
    ((row i).outerUnion ∩ (row j).outerUnion).Nonempty := by
  apply outerUnion_inter_nonempty_of_not_fourCrossDisjoint
  intro hdisj
  exact hno ⟨i, j, hij, hdisj⟩

end TwoOuterArcRow

#print axioms exists_three_point_transversal_of_not_hasFourSeparated
#print axioms exists_four_point_cut_transversal
#print axioms CutArc.exists_four_point_transversal
#print axioms TwoOuterArcRow.fourCrossDisjoint_iff
#print axioms
  TwoOuterArcRow.pairwise_outerUnion_inter_nonempty_of_no_twoRowFourArcMatching

end ATailUniqueFourArcTransversalScratch
end Problem97
