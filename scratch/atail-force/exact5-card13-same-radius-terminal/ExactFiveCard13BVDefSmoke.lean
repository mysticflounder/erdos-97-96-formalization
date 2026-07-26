import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVDefSmoke

def contradictory (x : BitVec 1) : Bool :=
  x.getLsbD 0 && !x.getLsbD 0

@[bv_normalize]
theorem contradictory_eq (x : BitVec 1) :
    contradictory x = (x.getLsbD 0 && !x.getLsbD 0) := rfl

theorem contradictory_false (x : BitVec 1) :
    contradictory x = false := by
  bv_decide

private abbrev contradictoryAbbrev (x : BitVec 1) : Bool :=
  x.getLsbD 0 && !x.getLsbD 0

@[bv_normalize]
theorem contradictoryAbbrev_eq (x : BitVec 1) :
    contradictoryAbbrev x = (x.getLsbD 0 && !x.getLsbD 0) := rfl

theorem contradictoryAbbrev_false (x : BitVec 1) :
    contradictoryAbbrev x = false := by
  bv_decide

#print axioms contradictory_false
#print axioms contradictoryAbbrev_false

end Problem97.ATailExactFiveCard13BVDefSmoke
