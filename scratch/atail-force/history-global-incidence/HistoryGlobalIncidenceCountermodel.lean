/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Finite history/global-incidence countermodel

This is a kernel-checked finite dependency model, not a Euclidean
counterexample.  It augments one current card-12 all-center row survivor with
an off-surplus pair on the first-apex row and a second-apex row avoiding both
members.  It retains the finite consequences exported by the critical-shell
interface, but no other center contains the entire history pair and its two
critical blockers are distinct with neither reciprocal cross hit.

The Python checker in this directory separately checks the row-equality
closure against the current formalized core matcher.
-/

namespace Problem97
namespace ATailHistoryGlobalIncidenceCountermodel

abbrev Label := Fin 12

def surplusCap : Finset Label := {1, 2, 3, 4, 5}
def oppositeCap1 : Finset Label := {0, 2, 6, 7, 8}
def oppositeCap2 : Finset Label := {0, 1, 9, 10, 11}

def firstApex : Label := 1
def secondApex : Label := 2
def historyLeft : Label := 6
def historyRight : Label := 7

/-- The twelve exact-row supports of current survivor shard zero. -/
def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {0, 1, 9, 10},
    {1, 4, 7, 11},
    {3, 5, 6, 10},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

/-- One source-indexed critical blocker choice.  Its support is by definition
the unique recorded global row at the chosen center. -/
def blocker : Label → Label :=
  ![1, 0, 0, 0, 0, 4, 7, 6, 5, 2, 2, 3]

def criticalSupport (source : Label) : Finset Label :=
  globalRow (blocker source)

/-- The index of each label in the saved convex boundary order
`0,9,10,11,1,3,4,5,2,6,7,8`. -/
def boundaryIndex : Label → Fin 12 :=
  ![0, 4, 8, 5, 6, 7, 9, 10, 11, 1, 2, 3]

def cyclicBetween (a b x : Label) : Prop :=
  let da := ((boundaryIndex x).val + 12 - (boundaryIndex a).val) % 12
  let db := ((boundaryIndex b).val + 12 - (boundaryIndex a).val) % 12
  0 < da ∧ da < db

instance instDecidableCyclicBetween (a b x : Label) :
    Decidable (cyclicBetween a b x) := by
  unfold cyclicBetween
  infer_instance

/-- Two disjoint radius classes cannot each use two points of a three-point
strict-cap interior.  This is the finite cardinality core behind the proposed
card-12 nontrivial-descent split: once geometric adapters put two points of
each class in the same three-point strict cell, the robust branch is empty. -/
theorem no_two_disjoint_two_point_subsets_of_three_point_set
    {α : Type*} [DecidableEq α]
    (strict first second : Finset α)
    (hstrict : strict.card = 3)
    (hfirst : 2 ≤ (first ∩ strict).card)
    (hsecond : 2 ≤ (second ∩ strict).card)
    (hdisjoint : Disjoint first second) : False := by
  have hinter : Disjoint (first ∩ strict) (second ∩ strict) := by
    rw [Finset.disjoint_left] at hdisjoint ⊢
    intro x hxfirst hxsecond
    exact hdisjoint (Finset.mem_inter.mp hxfirst).1
      (Finset.mem_inter.mp hxsecond).1
  have hsubset :
      (first ∩ strict) ∪ (second ∩ strict) ⊆ strict := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · exact (Finset.mem_inter.mp hx).2
    · exact (Finset.mem_inter.mp hx).2
  have hcard := Finset.card_le_card hsubset
  rw [Finset.card_union_of_disjoint hinter, hstrict] at hcard
  omega

/-- The cap profile and fixed boundary indexing are the intended `(5,5,5)`
card-12 frame. -/
theorem cap_and_order_profile_checked :
    surplusCap.card = 5 ∧
    oppositeCap1.card = 5 ∧
    oppositeCap2.card = 5 ∧
    surplusCap ∪ oppositeCap1 ∪ oppositeCap2 = Finset.univ ∧
    surplusCap ∩ oppositeCap1 = {2} ∧
    surplusCap ∩ oppositeCap2 = {1} ∧
    oppositeCap1 ∩ oppositeCap2 = {0} ∧
    Function.Injective boundaryIndex := by
  decide

/-- One four-row exists at every center, omits its center, and distinct-center
rows obey the two-circle intersection upper bound. -/
theorem all_center_rows_checked :
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ center : Label, center ∉ globalRow center) ∧
    (∀ x y : Label, x ≠ y →
      ((globalRow x) ∩ (globalRow y)).card ≤ 2) := by
  decide

/-- The chosen blocker system retains source membership, nonfixed blockers,
same-center support locking, and the finite deletion-critical consequence that
the recorded four-row drops to three after deleting its source. -/
theorem critical_system_checked :
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ source : Label, blocker source ≠ source) ∧
    (∀ x y : Label, blocker x = blocker y →
      criticalSupport x = criticalSupport y) ∧
    (∀ source : Label,
      ((criticalSupport source).erase source).card = 3) := by
  decide

/-- The descent-history fields hold in the finite abstraction: the pair is
distinct, off the surplus cap, co-supported at the first apex, and the chosen
second-apex K4 support survives deletion of both points. -/
theorem paired_history_and_second_apex_survival_checked :
    historyLeft ≠ historyRight ∧
    historyLeft ∉ surplusCap ∧
    historyRight ∉ surplusCap ∧
    historyLeft ∈ globalRow firstApex ∧
    historyRight ∈ globalRow firstApex ∧
    ((globalRow secondApex).erase historyLeft |>.erase historyRight).card = 4 := by
  decide

/-- The history pair itself can be selected as a genuine two-cycle of the
source-to-blocker map.  Source membership then puts each source on the row
centered at its mate, but the positive-radius row omits that mate center; it
does not make either row contain the whole pair. -/
theorem history_pair_is_mutual_blocker_cycle :
    blocker historyLeft = historyRight ∧
    blocker historyRight = historyLeft ∧
    historyLeft ∈ criticalSupport historyLeft ∧
    historyRight ∈ criticalSupport historyRight := by
  decide

/-- None of the desired direct incidence producers follows in this shadow:
there is no second recorded center through the whole pair; the pair's blocker
centers differ; and both directed cross memberships fail. -/
theorem direct_history_producers_fail :
    (¬ ∃ center : Label, center ≠ firstApex ∧
      historyLeft ∈ globalRow center ∧ historyRight ∈ globalRow center) ∧
    blocker historyLeft ≠ blocker historyRight ∧
    historyRight ∉ criticalSupport historyLeft ∧
    historyLeft ∉ criticalSupport historyRight := by
  decide

/-- For the shard-zero U1 near-match `(a,c,d,e,f)=(9,7,6,8,11)`, h4 is the
only missing equality.  The choice-invariant h4 adapter would require deletion
of source `f=11` to destroy K4 at prescribed center `d=6`.  This shadow has
the opposite finite consequence: the center-six exact row contains `c=7`,
omits `f=11`, survives that deletion with all four points, and source 11 is
assigned a different blocker. -/
theorem banked_h4_prescribed_center_deletion_survives :
    (7 : Label) ∈ globalRow 6 ∧
    (11 : Label) ∉ globalRow 6 ∧
    ((globalRow 6).erase 11).card = 4 ∧
    blocker 11 ≠ 6 := by
  decide

/-- Every directly shared pair in the saved row pattern has the cyclic
alternation required by the generic `SharedPairSeparationCore`; the row system
does not produce a nonalternating separation contradiction at this layer. -/
theorem every_direct_shared_pair_alternates :
    ∀ c₁ c₂ x y : Label,
      c₁ ≠ c₂ → x ≠ y →
      x ∈ globalRow c₁ → y ∈ globalRow c₁ →
      x ∈ globalRow c₂ → y ∈ globalRow c₂ →
      (cyclicBetween c₁ c₂ x ↔ ¬ cyclicBetween c₁ c₂ y) := by
  decide

#print axioms cap_and_order_profile_checked
#print axioms no_two_disjoint_two_point_subsets_of_three_point_set
#print axioms all_center_rows_checked
#print axioms critical_system_checked
#print axioms paired_history_and_second_apex_survival_checked
#print axioms history_pair_is_mutual_blocker_cycle
#print axioms direct_history_producers_fail
#print axioms banked_h4_prescribed_center_deletion_survives
#print axioms every_direct_shared_pair_alternates

end ATailHistoryGlobalIncidenceCountermodel
end Problem97
