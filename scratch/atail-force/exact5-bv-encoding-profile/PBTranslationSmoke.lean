import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13PBProfile

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def adderExactlyFour (x : BitVec 13) : Bool :=
  ((bif x.getLsbD 0 then 1#4 else 0#4) + (bif x.getLsbD 1 then 1#4 else 0#4) + (bif x.getLsbD 2 then 1#4 else 0#4) + (bif x.getLsbD 3 then 1#4 else 0#4) + (bif x.getLsbD 4 then 1#4 else 0#4) + (bif x.getLsbD 5 then 1#4 else 0#4) + (bif x.getLsbD 6 then 1#4 else 0#4) + (bif x.getLsbD 7 then 1#4 else 0#4) + (bif x.getLsbD 8 then 1#4 else 0#4) + (bif x.getLsbD 9 then 1#4 else 0#4) + (bif x.getLsbD 10 then 1#4 else 0#4) + (bif x.getLsbD 11 then 1#4 else 0#4) + (bif x.getLsbD 12 then 1#4 else 0#4) == 4#4)

def unaryExactlyFour (x : BitVec 13) : Bool :=
  let ge_0_1 := false || (x.getLsbD 0 && true)
  let ge_0_2 := false || (x.getLsbD 0 && false)
  let ge_0_3 := false || (x.getLsbD 0 && false)
  let ge_0_4 := false || (x.getLsbD 0 && false)
  let ge_0_5 := false || (x.getLsbD 0 && false)
  let ge_1_1 := ge_0_1 || (x.getLsbD 1 && true)
  let ge_1_2 := ge_0_2 || (x.getLsbD 1 && ge_0_1)
  let ge_1_3 := ge_0_3 || (x.getLsbD 1 && ge_0_2)
  let ge_1_4 := ge_0_4 || (x.getLsbD 1 && ge_0_3)
  let ge_1_5 := ge_0_5 || (x.getLsbD 1 && ge_0_4)
  let ge_2_1 := ge_1_1 || (x.getLsbD 2 && true)
  let ge_2_2 := ge_1_2 || (x.getLsbD 2 && ge_1_1)
  let ge_2_3 := ge_1_3 || (x.getLsbD 2 && ge_1_2)
  let ge_2_4 := ge_1_4 || (x.getLsbD 2 && ge_1_3)
  let ge_2_5 := ge_1_5 || (x.getLsbD 2 && ge_1_4)
  let ge_3_1 := ge_2_1 || (x.getLsbD 3 && true)
  let ge_3_2 := ge_2_2 || (x.getLsbD 3 && ge_2_1)
  let ge_3_3 := ge_2_3 || (x.getLsbD 3 && ge_2_2)
  let ge_3_4 := ge_2_4 || (x.getLsbD 3 && ge_2_3)
  let ge_3_5 := ge_2_5 || (x.getLsbD 3 && ge_2_4)
  let ge_4_1 := ge_3_1 || (x.getLsbD 4 && true)
  let ge_4_2 := ge_3_2 || (x.getLsbD 4 && ge_3_1)
  let ge_4_3 := ge_3_3 || (x.getLsbD 4 && ge_3_2)
  let ge_4_4 := ge_3_4 || (x.getLsbD 4 && ge_3_3)
  let ge_4_5 := ge_3_5 || (x.getLsbD 4 && ge_3_4)
  let ge_5_1 := ge_4_1 || (x.getLsbD 5 && true)
  let ge_5_2 := ge_4_2 || (x.getLsbD 5 && ge_4_1)
  let ge_5_3 := ge_4_3 || (x.getLsbD 5 && ge_4_2)
  let ge_5_4 := ge_4_4 || (x.getLsbD 5 && ge_4_3)
  let ge_5_5 := ge_4_5 || (x.getLsbD 5 && ge_4_4)
  let ge_6_1 := ge_5_1 || (x.getLsbD 6 && true)
  let ge_6_2 := ge_5_2 || (x.getLsbD 6 && ge_5_1)
  let ge_6_3 := ge_5_3 || (x.getLsbD 6 && ge_5_2)
  let ge_6_4 := ge_5_4 || (x.getLsbD 6 && ge_5_3)
  let ge_6_5 := ge_5_5 || (x.getLsbD 6 && ge_5_4)
  let ge_7_1 := ge_6_1 || (x.getLsbD 7 && true)
  let ge_7_2 := ge_6_2 || (x.getLsbD 7 && ge_6_1)
  let ge_7_3 := ge_6_3 || (x.getLsbD 7 && ge_6_2)
  let ge_7_4 := ge_6_4 || (x.getLsbD 7 && ge_6_3)
  let ge_7_5 := ge_6_5 || (x.getLsbD 7 && ge_6_4)
  let ge_8_1 := ge_7_1 || (x.getLsbD 8 && true)
  let ge_8_2 := ge_7_2 || (x.getLsbD 8 && ge_7_1)
  let ge_8_3 := ge_7_3 || (x.getLsbD 8 && ge_7_2)
  let ge_8_4 := ge_7_4 || (x.getLsbD 8 && ge_7_3)
  let ge_8_5 := ge_7_5 || (x.getLsbD 8 && ge_7_4)
  let ge_9_1 := ge_8_1 || (x.getLsbD 9 && true)
  let ge_9_2 := ge_8_2 || (x.getLsbD 9 && ge_8_1)
  let ge_9_3 := ge_8_3 || (x.getLsbD 9 && ge_8_2)
  let ge_9_4 := ge_8_4 || (x.getLsbD 9 && ge_8_3)
  let ge_9_5 := ge_8_5 || (x.getLsbD 9 && ge_8_4)
  let ge_10_1 := ge_9_1 || (x.getLsbD 10 && true)
  let ge_10_2 := ge_9_2 || (x.getLsbD 10 && ge_9_1)
  let ge_10_3 := ge_9_3 || (x.getLsbD 10 && ge_9_2)
  let ge_10_4 := ge_9_4 || (x.getLsbD 10 && ge_9_3)
  let ge_10_5 := ge_9_5 || (x.getLsbD 10 && ge_9_4)
  let ge_11_1 := ge_10_1 || (x.getLsbD 11 && true)
  let ge_11_2 := ge_10_2 || (x.getLsbD 11 && ge_10_1)
  let ge_11_3 := ge_10_3 || (x.getLsbD 11 && ge_10_2)
  let ge_11_4 := ge_10_4 || (x.getLsbD 11 && ge_10_3)
  let ge_11_5 := ge_10_5 || (x.getLsbD 11 && ge_10_4)
  let ge_12_1 := ge_11_1 || (x.getLsbD 12 && true)
  let ge_12_2 := ge_11_2 || (x.getLsbD 12 && ge_11_1)
  let ge_12_3 := ge_11_3 || (x.getLsbD 12 && ge_11_2)
  let ge_12_4 := ge_11_4 || (x.getLsbD 12 && ge_11_3)
  let ge_12_5 := ge_11_5 || (x.getLsbD 12 && ge_11_4)
  ge_12_4 && !ge_12_5

def fixedFive (x : BitVec 13) : Bool :=
  x.getLsbD 0 && x.getLsbD 1 && x.getLsbD 2 && x.getLsbD 3 && x.getLsbD 4

theorem adder_eq_unary (x : BitVec 13) :
    adderExactlyFour x = unaryExactlyFour x := by
  unfold adderExactlyFour unaryExactlyFour
  bv_decide (config := { timeout := 60 })

theorem adder_fixedFive_false (x : BitVec 13) :
    (adderExactlyFour x && fixedFive x) = false := by
  unfold adderExactlyFour fixedFive
  bv_decide (config := { timeout := 60 })

theorem unary_fixedFive_false (x : BitVec 13) :
    (unaryExactlyFour x && fixedFive x) = false := by
  unfold unaryExactlyFour fixedFive
  bv_decide (config := { timeout := 60 })

#print axioms adder_eq_unary
#print axioms adder_fixedFive_false
#print axioms unary_fixedFive_false

end Problem97.ATailExactFiveCard13PBProfile
