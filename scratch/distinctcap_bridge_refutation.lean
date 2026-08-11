import Mathlib

/-
  A finite source-level incidence model for the proposed
  `FreshThirdSharedLatePairPacket` bridge.

  Points 0,1,2,3,4,5,6,7 play the roles
    qOutside, fresh, qBetween, source, canonical, 5, 6, 7.

  We retain exactly the information supplied by the current producer:
  source/fresh rows share qOutside and qBetween, the source row contains
  canonical, and the selected survivor row avoids qOutside and canonical
  while satisfying a 2/2 cap split.  No metric facts are used here; this is
  an incidence-level implication test.
-/

namespace DistinctCapBridgeRefutation

abbrev P := Fin 8

def p (n : Nat) : P := Fin.ofNat 8 n

def sourceSupport : Finset P := {p 0, p 2, p 4, p 5}
def freshSupport : Finset P := {p 0, p 2, p 6, p 7}
def survivorSupport : Finset P := {p 1, p 3, p 5, p 7}
def survivorCap : Finset P := {p 1, p 3}

/- The only available selected rows are at fresh, qBetween, and source. -/
def active (i : P) : Prop := i = p 1 ∨ i = p 2 ∨ i = p 3

def rowSupport (i : P) : Finset P :=
  if i = p 1 then freshSupport
  else if i = p 2 then survivorSupport
  else if i = p 3 then sourceSupport
  else ∅

def CorePremises : Prop :=
  rowSupport (p 3) = sourceSupport ∧
  rowSupport (p 1) = freshSupport ∧
  rowSupport (p 2) = survivorSupport ∧
  sourceSupport.card = 4 ∧ freshSupport.card = 4 ∧ survivorSupport.card = 4 ∧
  p 3 ∉ sourceSupport ∧ p 1 ∉ freshSupport ∧ p 2 ∉ survivorSupport ∧
  p 0 ∈ sourceSupport ∧ p 2 ∈ sourceSupport ∧ p 4 ∈ sourceSupport ∧
  p 0 ∈ freshSupport ∧ p 2 ∈ freshSupport ∧
  sourceSupport ∩ freshSupport = {p 0, p 2} ∧
  p 0 ∉ survivorSupport ∧ p 4 ∉ survivorSupport ∧
  (survivorSupport ∩ survivorCap).card ≤ 2 ∧
  2 ≤ (survivorSupport \ survivorCap).card

/- Abstract version of `FreshThirdSharedLatePairPacket`: two available rows
   at ia < ib contain both later points ic < id. -/
def HasSharedLatePair : Prop :=
  ∃ ia ib ic id : P, ia < ib ∧ ib < ic ∧ ic < id ∧
    active ia ∧ active ib ∧
    ic ∈ rowSupport ia ∧ id ∈ rowSupport ia ∧
    ic ∈ rowSupport ib ∧ id ∈ rowSupport ib

example : CorePremises := by
  norm_num [CorePremises, rowSupport, sourceSupport, freshSupport,
    survivorSupport, survivorCap, p]

example : ¬ HasSharedLatePair := by
  intro h
  rcases h with ⟨ia, ib, ic, id, hab, hbc, hcd, ha, hb, hia, hid, hja, hjd⟩
  rcases ha with rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl <;>
    norm_num [rowSupport, sourceSupport, freshSupport, survivorSupport, p] at *

theorem core_premises_but_no_shared_late_pair :
    CorePremises ∧ ¬ HasSharedLatePair := by
  exact ⟨by
    norm_num [CorePremises, rowSupport, sourceSupport, freshSupport,
      survivorSupport, survivorCap, p], by
    intro h
    rcases h with ⟨ia, ib, ic, id, hab, hbc, hcd, ha, hb, hia, hid, hja, hjd⟩
    rcases ha with rfl | rfl | rfl <;>
      rcases hb with rfl | rfl | rfl <;>
      norm_num [rowSupport, sourceSupport, freshSupport, survivorSupport, p] at *⟩

end DistinctCapBridgeRefutation
