/-
Generated directly from one exact source-level cube core.  There are no
aggregate helper definitions to unfold before bit-vector preprocessing.
-/
import ExactFiveCard13BVCircuitChunks.Base
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVCubeLeaf

set_option maxRecDepth 100000
set_option linter.unusedVariables false

set_option trace.Meta.Tactic.bv true in
set_option trace.Meta.Tactic.sat true in
set_option maxHeartbeats 0 in
theorem cube6Leaf47_false (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (rowBit rows 0 4 9 &&
    !(rowBit rows 0 4 10) &&
    rowBit rows 0 4 11 &&
    rowBit rows 0 4 12 &&
    firstRowBit b1 9 &&
    firstRowBit b1 10 &&
    !(rowBit rows 0 0 0) &&
    (((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4) + (bif rowBit rows 0 0 5 then 1#4 else 0#4) + (bif rowBit rows 0 0 6 then 1#4 else 0#4) + (bif rowBit rows 0 0 7 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4)) == 4#4) &&
    !(rowBit rows 0 2 2) &&
    (((bif rowBit rows 0 2 0 then 1#4 else 0#4) + (bif rowBit rows 0 2 1 then 1#4 else 0#4) + (bif rowBit rows 0 2 2 then 1#4 else 0#4) + (bif rowBit rows 0 2 3 then 1#4 else 0#4) + (bif rowBit rows 0 2 4 then 1#4 else 0#4) + (bif rowBit rows 0 2 5 then 1#4 else 0#4) + (bif rowBit rows 0 2 6 then 1#4 else 0#4) + (bif rowBit rows 0 2 7 then 1#4 else 0#4) + (bif rowBit rows 0 2 8 then 1#4 else 0#4) + (bif rowBit rows 0 2 9 then 1#4 else 0#4) + (bif rowBit rows 0 2 10 then 1#4 else 0#4) + (bif rowBit rows 0 2 11 then 1#4 else 0#4) + (bif rowBit rows 0 2 12 then 1#4 else 0#4)) == 4#4) &&
    !(rowBit rows 0 4 4) &&
    !((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 2 3 && rowBit rows 0 2 5)) &&
    !((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 2 3 && rowBit rows 0 2 6)) &&
    !((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 2 3 && rowBit rows 0 2 7)) &&
    !((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 2 3 && rowBit rows 0 2 8)) &&
    !((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 2 5 && rowBit rows 0 2 6)) &&
    !((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 2 5 && rowBit rows 0 2 7)) &&
    !((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 2 5 && rowBit rows 0 2 8)) &&
    !((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9)) &&
    !((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 2 6 && rowBit rows 0 2 7)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 2 6 && rowBit rows 0 2 8)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 2 7 && rowBit rows 0 2 8)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 2 7 && rowBit rows 0 2 12)) &&
    (((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4))).ule 1#4 &&
    (((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4))).ule 1#4 &&
    !(rowBit rows 1 2 2) &&
    (((bif rowBit rows 1 2 0 then 1#4 else 0#4) + (bif rowBit rows 1 2 1 then 1#4 else 0#4) + (bif rowBit rows 1 2 2 then 1#4 else 0#4) + (bif rowBit rows 1 2 3 then 1#4 else 0#4) + (bif rowBit rows 1 2 4 then 1#4 else 0#4) + (bif rowBit rows 1 2 5 then 1#4 else 0#4) + (bif rowBit rows 1 2 6 then 1#4 else 0#4) + (bif rowBit rows 1 2 7 then 1#4 else 0#4) + (bif rowBit rows 1 2 8 then 1#4 else 0#4) + (bif rowBit rows 1 2 9 then 1#4 else 0#4) + (bif rowBit rows 1 2 10 then 1#4 else 0#4) + (bif rowBit rows 1 2 11 then 1#4 else 0#4) + (bif rowBit rows 1 2 12 then 1#4 else 0#4)) == 4#4) &&
    !(rowBit rows 1 6 6) &&
    (((bif rowBit rows 1 6 0 then 1#4 else 0#4) + (bif rowBit rows 1 6 1 then 1#4 else 0#4) + (bif rowBit rows 1 6 2 then 1#4 else 0#4) + (bif rowBit rows 1 6 3 then 1#4 else 0#4) + (bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4) + (bif rowBit rows 1 6 9 then 1#4 else 0#4) + (bif rowBit rows 1 6 10 then 1#4 else 0#4) + (bif rowBit rows 1 6 11 then 1#4 else 0#4) + (bif rowBit rows 1 6 12 then 1#4 else 0#4)) == 4#4) &&
    !((rowBit rows 1 2 1 && rowBit rows 1 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7)) &&
    (((bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4))).ule 2#4 &&
    !(rowBit rows 2 5 5) &&
    (((bif rowBit rows 2 5 0 then 1#4 else 0#4) + (bif rowBit rows 2 5 1 then 1#4 else 0#4) + (bif rowBit rows 2 5 2 then 1#4 else 0#4) + (bif rowBit rows 2 5 3 then 1#4 else 0#4) + (bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4) + (bif rowBit rows 2 5 9 then 1#4 else 0#4) + (bif rowBit rows 2 5 10 then 1#4 else 0#4) + (bif rowBit rows 2 5 11 then 1#4 else 0#4) + (bif rowBit rows 2 5 12 then 1#4 else 0#4)) == 4#4) &&
    (((bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4))).ule 2#4 &&
    !((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 1 6 1 && rowBit rows 1 6 5)) &&
    !((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 1 6 2 && rowBit rows 1 6 5)) &&
    !((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5)) &&
    !((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 1 6 4 && rowBit rows 1 6 5)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12)) &&
    (((bif (rowBit rows 0 2 0 && rowBit rows 1 6 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 1 6 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 1 6 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 1 6 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 1 6 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 1 6 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 1 6 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 1 6 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 1 6 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 1 6 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 1 6 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 1 6 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 1 6 12) then 1#4 else 0#4))).ule 2#4 &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 1 6 1 && rowBit rows 1 6 9)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 1 6 1 && rowBit rows 1 6 10)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 1 6 1 && rowBit rows 1 6 11)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 1 6 1 && rowBit rows 1 6 12)) &&
    !((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 1 6 8 && rowBit rows 1 6 9)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 2 5 6 && rowBit rows 2 5 10)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 2 5 6 && rowBit rows 2 5 11)) &&
    !((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11)) &&
    !((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12)) &&
    (((bif (rowBit rows 0 2 0 && rowBit rows 2 5 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 2 5 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 2 5 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 2 5 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 2 5 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 2 5 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 2 5 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 2 5 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 2 5 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 2 5 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 2 5 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 2 5 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 2 5 12) then 1#4 else 0#4))).ule 2#4 &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 2 5 1 && rowBit rows 2 5 6)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 2 5 1 && rowBit rows 2 5 7)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 2 5 1 && rowBit rows 2 5 8)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 2 5 1 && rowBit rows 2 5 10)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 2 5 1 && rowBit rows 2 5 11)) &&
    !((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 2 5 1 && rowBit rows 2 5 12)) &&
    !((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7)) &&
    !((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8)) &&
    !((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9)) &&
    !((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11)) &&
    !((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 2 5 8 && rowBit rows 2 5 9)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 2 5 8 && rowBit rows 2 5 10)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 2 5 8 && rowBit rows 2 5 11)) &&
    !((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 2 5 8 && rowBit rows 2 5 12)) &&
    !((rowBit rows 2 5 0 && rowBit rows 2 5 4 && rowBit rows 1 6 0 && rowBit rows 1 6 4)) &&
    !((rowBit rows 2 5 0 && rowBit rows 2 5 7 && rowBit rows 1 6 0 && rowBit rows 1 6 7)) &&
    !((rowBit rows 2 5 0 && rowBit rows 2 5 8 && rowBit rows 1 6 0 && rowBit rows 1 6 8)) &&
    !((rowBit rows 2 5 1 && rowBit rows 2 5 4 && rowBit rows 1 6 1 && rowBit rows 1 6 4)) &&
    !((rowBit rows 2 5 1 && rowBit rows 2 5 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7)) &&
    !((rowBit rows 2 5 1 && rowBit rows 2 5 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 4 && rowBit rows 1 6 2 && rowBit rows 1 6 4)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 7 && rowBit rows 1 6 2 && rowBit rows 1 6 7)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 8 && rowBit rows 1 6 2 && rowBit rows 1 6 8)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 11 && rowBit rows 1 6 2 && rowBit rows 1 6 11)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 12 && rowBit rows 1 6 2 && rowBit rows 1 6 12)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 4 && rowBit rows 1 6 3 && rowBit rows 1 6 4)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 7 && rowBit rows 1 6 3 && rowBit rows 1 6 7)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 8 && rowBit rows 1 6 3 && rowBit rows 1 6 8)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 9 && rowBit rows 1 6 3 && rowBit rows 1 6 9)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 10 && rowBit rows 1 6 3 && rowBit rows 1 6 10)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 11 && rowBit rows 1 6 3 && rowBit rows 1 6 11)) &&
    !((rowBit rows 2 5 3 && rowBit rows 2 5 12 && rowBit rows 1 6 3 && rowBit rows 1 6 12)) &&
    !((rowBit rows 2 5 4 && rowBit rows 2 5 7 && rowBit rows 1 6 4 && rowBit rows 1 6 7)) &&
    !((rowBit rows 2 5 4 && rowBit rows 2 5 8 && rowBit rows 1 6 4 && rowBit rows 1 6 8)) &&
    !((rowBit rows 2 5 4 && rowBit rows 2 5 9 && rowBit rows 1 6 4 && rowBit rows 1 6 9)) &&
    !((rowBit rows 2 5 4 && rowBit rows 2 5 10 && rowBit rows 1 6 4 && rowBit rows 1 6 10)) &&
    !((rowBit rows 2 5 4 && rowBit rows 2 5 11 && rowBit rows 1 6 4 && rowBit rows 1 6 11)) &&
    !((rowBit rows 2 5 4 && rowBit rows 2 5 12 && rowBit rows 1 6 4 && rowBit rows 1 6 12)) &&
    !((rowBit rows 2 5 7 && rowBit rows 2 5 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8)) &&
    !((rowBit rows 2 5 7 && rowBit rows 2 5 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9)) &&
    !((rowBit rows 2 5 7 && rowBit rows 2 5 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10)) &&
    !((rowBit rows 2 5 7 && rowBit rows 2 5 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11)) &&
    !((rowBit rows 2 5 7 && rowBit rows 2 5 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12)) &&
    !((rowBit rows 2 5 8 && rowBit rows 2 5 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10)) &&
    !((rowBit rows 2 5 8 && rowBit rows 2 5 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11)) &&
    !((rowBit rows 2 5 8 && rowBit rows 2 5 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12)) &&
    (((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 1 then 1#4 else 0#4) + (bif shellBit shell 2 then 1#4 else 0#4) + (bif shellBit shell 3 then 1#4 else 0#4) + (bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4) + (bif shellBit shell 8 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 5#4) &&
    shellBit shell 1 &&
    shellBit shell 2 &&
    shellBit shell 3 &&
    (((bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4)) == 1#4) &&
    (((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 1#4) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 0 == rowBit rows 0 2 0))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 1 == rowBit rows 0 2 1))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 3 == rowBit rows 0 2 3))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 4 == rowBit rows 0 2 4))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 6 == rowBit rows 0 2 6))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 10 == rowBit rows 0 2 10))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 11 == rowBit rows 0 2 11))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 12 == rowBit rows 0 2 12))) &&
    !(firstRowBit b1 4) &&
    !((rowBit rows 1 6 2 && rowBit rows 1 6 1)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 3)) &&
    (blockerAt blockers 1 == 2#4) &&
    rowBit rows 0 2 1 &&
    rowBit rows 0 2 3 &&
    !(rowBit rows 0 2 0) &&
    !(rowBit rows 0 2 4) &&
    (((bif (rowBit rows 0 4 0 || firstRowBit b1 0) then 1#4 else 0#4) + (bif (rowBit rows 0 4 1 || firstRowBit b1 1) then 1#4 else 0#4) + (bif (rowBit rows 0 4 2 || firstRowBit b1 2) then 1#4 else 0#4) + (bif (rowBit rows 0 4 3 || firstRowBit b1 3) then 1#4 else 0#4) + (bif (rowBit rows 0 4 4 || firstRowBit b1 4) then 1#4 else 0#4) + (bif (rowBit rows 0 4 5 || firstRowBit b1 5) then 1#4 else 0#4) + (bif (rowBit rows 0 4 6 || firstRowBit b1 6) then 1#4 else 0#4) + (bif (rowBit rows 0 4 7 || firstRowBit b1 7) then 1#4 else 0#4) + (bif (rowBit rows 0 4 8 || firstRowBit b1 8) then 1#4 else 0#4) + (bif (rowBit rows 0 4 9 || firstRowBit b1 9) then 1#4 else 0#4) + (bif (rowBit rows 0 4 10 || firstRowBit b1 10) then 1#4 else 0#4) + (bif (rowBit rows 0 4 11 || firstRowBit b1 11) then 1#4 else 0#4) + (bif (rowBit rows 0 4 12 || firstRowBit b1 12) then 1#4 else 0#4)) == 6#4) &&
    (rankAtom ranks 1).ult (78#7) &&
    (rankAtom ranks 2).ult (78#7) &&
    (rankAtom ranks 3).ult (78#7) &&
    (rankAtom ranks 4).ult (78#7) &&
    (rankAtom ranks 5).ult (78#7) &&
    (rankAtom ranks 6).ult (78#7) &&
    (rankAtom ranks 7).ult (78#7) &&
    (rankAtom ranks 8).ult (78#7) &&
    (rankAtom ranks 12).ult (78#7) &&
    (rankAtom ranks 13).ult (78#7) &&
    (rankAtom ranks 14).ult (78#7) &&
    (rankAtom ranks 15).ult (78#7) &&
    (rankAtom ranks 16).ult (78#7) &&
    (rankAtom ranks 17).ult (78#7) &&
    (rankAtom ranks 18).ult (78#7) &&
    (rankAtom ranks 19).ult (78#7) &&
    (rankAtom ranks 20).ult (78#7) &&
    (rankAtom ranks 21).ult (78#7) &&
    (rankAtom ranks 22).ult (78#7) &&
    (rankAtom ranks 23).ult (78#7) &&
    (rankAtom ranks 24).ult (78#7) &&
    (rankAtom ranks 25).ult (78#7) &&
    (rankAtom ranks 26).ult (78#7) &&
    (rankAtom ranks 27).ult (78#7) &&
    (rankAtom ranks 28).ult (78#7) &&
    (rankAtom ranks 29).ult (78#7) &&
    (rankAtom ranks 30).ult (78#7) &&
    (rankAtom ranks 31).ult (78#7) &&
    (rankAtom ranks 32).ult (78#7) &&
    (rankAtom ranks 34).ult (78#7) &&
    (rankAtom ranks 35).ult (78#7) &&
    (rankAtom ranks 36).ult (78#7) &&
    (rankAtom ranks 37).ult (78#7) &&
    (rankAtom ranks 38).ult (78#7) &&
    (rankAtom ranks 39).ult (78#7) &&
    (rankAtom ranks 40).ult (78#7) &&
    (rankAtom ranks 41).ult (78#7) &&
    (rankAtom ranks 42).ult (78#7) &&
    (rankAtom ranks 43).ult (78#7) &&
    (rankAtom ranks 44).ult (78#7) &&
    (rankAtom ranks 45).ult (78#7) &&
    (rankAtom ranks 46).ult (78#7) &&
    (rankAtom ranks 47).ult (78#7) &&
    (rankAtom ranks 48).ult (78#7) &&
    (rankAtom ranks 49).ult (78#7) &&
    (rankAtom ranks 50).ult (78#7) &&
    (rankAtom ranks 51).ult (78#7) &&
    (rankAtom ranks 52).ult (78#7) &&
    (rankAtom ranks 53).ult (78#7) &&
    (rankAtom ranks 54).ult (78#7) &&
    (rankAtom ranks 55).ult (78#7) &&
    (rankAtom ranks 56).ult (78#7) &&
    (rankAtom ranks 57).ult (78#7) &&
    (rankAtom ranks 58).ult (78#7) &&
    (rankAtom ranks 59).ult (78#7) &&
    (rankAtom ranks 60).ult (78#7) &&
    (rankAtom ranks 61).ult (78#7) &&
    (rankAtom ranks 62).ult (78#7) &&
    (rankAtom ranks 63).ult (78#7) &&
    (rankAtom ranks 64).ult (78#7) &&
    (rankAtom ranks 65).ult (78#7) &&
    (rankAtom ranks 66).ult (78#7) &&
    (rankAtom ranks 67).ult (78#7) &&
    (rankAtom ranks 69).ult (78#7) &&
    (rankAtom ranks 70).ult (78#7) &&
    (rankAtom ranks 71).ult (78#7) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 5)) || ((rankAtom ranks 0 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 6)) || ((rankAtom ranks 0 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 7)) || ((rankAtom ranks 0 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 5)) || ((rankAtom ranks 1 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 6)) || ((rankAtom ranks 1 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 7)) || ((rankAtom ranks 1 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 5)) || ((rankAtom ranks 2 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 6)) || ((rankAtom ranks 2 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 7)) || ((rankAtom ranks 2 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 8)) || ((rankAtom ranks 2 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 5)) || ((rankAtom ranks 3 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 6)) || ((rankAtom ranks 3 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 7)) || ((rankAtom ranks 3 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 8)) || ((rankAtom ranks 3 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 9)) || ((rankAtom ranks 3 == rankAtom ranks 8))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 10)) || ((rankAtom ranks 3 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 11)) || ((rankAtom ranks 3 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 12)) || ((rankAtom ranks 3 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 6)) || ((rankAtom ranks 4 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 7)) || ((rankAtom ranks 4 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 8)) || ((rankAtom ranks 4 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 9)) || ((rankAtom ranks 4 == rankAtom ranks 8))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 10)) || ((rankAtom ranks 4 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 11)) || ((rankAtom ranks 4 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 12)) || ((rankAtom ranks 4 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 6 && rowBit rows 0 0 7)) || ((rankAtom ranks 5 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 6 && rowBit rows 0 0 8)) || ((rankAtom ranks 5 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 6 && rowBit rows 0 0 9)) || ((rankAtom ranks 5 == rankAtom ranks 8))) &&
    (!((rowBit rows 0 0 6 && rowBit rows 0 0 10)) || ((rankAtom ranks 5 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 6 && rowBit rows 0 0 11)) || ((rankAtom ranks 5 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 6 && rowBit rows 0 0 12)) || ((rankAtom ranks 5 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 7 && rowBit rows 0 0 8)) || ((rankAtom ranks 6 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 7 && rowBit rows 0 0 9)) || ((rankAtom ranks 6 == rankAtom ranks 8))) &&
    (!((rowBit rows 0 0 7 && rowBit rows 0 0 10)) || ((rankAtom ranks 6 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 7 && rowBit rows 0 0 11)) || ((rankAtom ranks 6 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 7 && rowBit rows 0 0 12)) || ((rankAtom ranks 6 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 9 && rowBit rows 0 0 10)) || ((rankAtom ranks 8 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 9 && rowBit rows 0 0 11)) || ((rankAtom ranks 8 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 10 && rowBit rows 0 0 11)) || ((rankAtom ranks 9 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 10 && rowBit rows 0 0 12)) || ((rankAtom ranks 9 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 11 && rowBit rows 0 0 12)) || ((rankAtom ranks 10 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 3)) || ((rankAtom ranks 12 == rankAtom ranks 23))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 5)) || ((rankAtom ranks 12 == rankAtom ranks 25))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 6)) || ((rankAtom ranks 12 == rankAtom ranks 26))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 7)) || ((rankAtom ranks 12 == rankAtom ranks 27))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 8)) || ((rankAtom ranks 12 == rankAtom ranks 28))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 10)) || ((rankAtom ranks 12 == rankAtom ranks 30))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 11)) || ((rankAtom ranks 12 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 1 && rowBit rows 0 2 12)) || ((rankAtom ranks 12 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 6)) || ((rankAtom ranks 23 == rankAtom ranks 26))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 7)) || ((rankAtom ranks 23 == rankAtom ranks 27))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 8)) || ((rankAtom ranks 23 == rankAtom ranks 28))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 9)) || ((rankAtom ranks 23 == rankAtom ranks 29))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 10)) || ((rankAtom ranks 23 == rankAtom ranks 30))) &&
    (!((rowBit rows 0 2 3 && rowBit rows 0 2 11)) || ((rankAtom ranks 23 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 5 && rowBit rows 0 2 6)) || ((rankAtom ranks 25 == rankAtom ranks 26))) &&
    (!((rowBit rows 0 2 5 && rowBit rows 0 2 7)) || ((rankAtom ranks 25 == rankAtom ranks 27))) &&
    (!((rowBit rows 0 2 5 && rowBit rows 0 2 8)) || ((rankAtom ranks 25 == rankAtom ranks 28))) &&
    (!((rowBit rows 0 2 5 && rowBit rows 0 2 9)) || ((rankAtom ranks 25 == rankAtom ranks 29))) &&
    (!((rowBit rows 0 2 5 && rowBit rows 0 2 12)) || ((rankAtom ranks 25 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 6 && rowBit rows 0 2 7)) || ((rankAtom ranks 26 == rankAtom ranks 27))) &&
    (!((rowBit rows 0 2 6 && rowBit rows 0 2 8)) || ((rankAtom ranks 26 == rankAtom ranks 28))) &&
    (!((rowBit rows 0 2 6 && rowBit rows 0 2 9)) || ((rankAtom ranks 26 == rankAtom ranks 29))) &&
    (!((rowBit rows 0 2 6 && rowBit rows 0 2 10)) || ((rankAtom ranks 26 == rankAtom ranks 30))) &&
    (!((rowBit rows 0 2 6 && rowBit rows 0 2 11)) || ((rankAtom ranks 26 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 6 && rowBit rows 0 2 12)) || ((rankAtom ranks 26 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 7 && rowBit rows 0 2 8)) || ((rankAtom ranks 27 == rankAtom ranks 28))) &&
    (!((rowBit rows 0 2 7 && rowBit rows 0 2 9)) || ((rankAtom ranks 27 == rankAtom ranks 29))) &&
    (!((rowBit rows 0 2 7 && rowBit rows 0 2 10)) || ((rankAtom ranks 27 == rankAtom ranks 30))) &&
    (!((rowBit rows 0 2 7 && rowBit rows 0 2 11)) || ((rankAtom ranks 27 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 7 && rowBit rows 0 2 12)) || ((rankAtom ranks 27 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 8 && rowBit rows 0 2 9)) || ((rankAtom ranks 28 == rankAtom ranks 29))) &&
    (!((rowBit rows 0 2 8 && rowBit rows 0 2 10)) || ((rankAtom ranks 28 == rankAtom ranks 30))) &&
    (!((rowBit rows 0 2 8 && rowBit rows 0 2 11)) || ((rankAtom ranks 28 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 8 && rowBit rows 0 2 12)) || ((rankAtom ranks 28 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 9 && rowBit rows 0 2 10)) || ((rankAtom ranks 29 == rankAtom ranks 30))) &&
    (!((rowBit rows 0 2 9 && rowBit rows 0 2 11)) || ((rankAtom ranks 29 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 9 && rowBit rows 0 2 12)) || ((rankAtom ranks 29 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 10 && rowBit rows 0 2 11)) || ((rankAtom ranks 30 == rankAtom ranks 31))) &&
    (!((rowBit rows 0 2 10 && rowBit rows 0 2 12)) || ((rankAtom ranks 30 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 2 11 && rowBit rows 0 2 12)) || ((rankAtom ranks 31 == rankAtom ranks 32))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 9)) || ((rankAtom ranks 3 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 11)) || ((rankAtom ranks 3 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 12)) || ((rankAtom ranks 3 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 9)) || ((rankAtom ranks 14 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 11)) || ((rankAtom ranks 14 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 12)) || ((rankAtom ranks 14 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 9)) || ((rankAtom ranks 24 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 11)) || ((rankAtom ranks 24 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 12)) || ((rankAtom ranks 24 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 12)) || ((rankAtom ranks 33 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 11)) || ((rankAtom ranks 42 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 9)) || ((rankAtom ranks 43 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 11)) || ((rankAtom ranks 43 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 12)) || ((rankAtom ranks 43 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 9)) || ((rankAtom ranks 44 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 11)) || ((rankAtom ranks 44 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 12)) || ((rankAtom ranks 44 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 9)) || ((rankAtom ranks 45 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 12)) || ((rankAtom ranks 45 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 11)) || ((rankAtom ranks 46 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 12)) || ((rankAtom ranks 46 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 11 && rowBit rows 0 4 12)) || ((rankAtom ranks 48 == rankAtom ranks 49))) &&
    (!((rowBit rows 1 2 1 && rowBit rows 1 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29))) &&
    (!((rowBit rows 1 2 3 && rowBit rows 1 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 1)) || ((rankAtom ranks 5 == rankAtom ranks 16))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 2)) || ((rankAtom ranks 5 == rankAtom ranks 26))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 3)) || ((rankAtom ranks 5 == rankAtom ranks 35))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 4)) || ((rankAtom ranks 5 == rankAtom ranks 43))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 5)) || ((rankAtom ranks 5 == rankAtom ranks 50))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 7)) || ((rankAtom ranks 5 == rankAtom ranks 57))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 8)) || ((rankAtom ranks 5 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 9)) || ((rankAtom ranks 5 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 10)) || ((rankAtom ranks 5 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 11)) || ((rankAtom ranks 5 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 0 && rowBit rows 1 6 12)) || ((rankAtom ranks 5 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 3)) || ((rankAtom ranks 16 == rankAtom ranks 35))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 4)) || ((rankAtom ranks 16 == rankAtom ranks 43))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 5)) || ((rankAtom ranks 16 == rankAtom ranks 50))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 7)) || ((rankAtom ranks 16 == rankAtom ranks 57))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 8)) || ((rankAtom ranks 16 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 9)) || ((rankAtom ranks 16 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 10)) || ((rankAtom ranks 16 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 11)) || ((rankAtom ranks 16 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 1 && rowBit rows 1 6 12)) || ((rankAtom ranks 16 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 3)) || ((rankAtom ranks 26 == rankAtom ranks 35))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 4)) || ((rankAtom ranks 26 == rankAtom ranks 43))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 5)) || ((rankAtom ranks 26 == rankAtom ranks 50))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 7)) || ((rankAtom ranks 26 == rankAtom ranks 57))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 8)) || ((rankAtom ranks 26 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 9)) || ((rankAtom ranks 26 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 10)) || ((rankAtom ranks 26 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 11)) || ((rankAtom ranks 26 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 12)) || ((rankAtom ranks 26 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 4)) || ((rankAtom ranks 35 == rankAtom ranks 43))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 5)) || ((rankAtom ranks 35 == rankAtom ranks 50))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 7)) || ((rankAtom ranks 35 == rankAtom ranks 57))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 8)) || ((rankAtom ranks 35 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 9)) || ((rankAtom ranks 35 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 10)) || ((rankAtom ranks 35 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 11)) || ((rankAtom ranks 35 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 3 && rowBit rows 1 6 12)) || ((rankAtom ranks 35 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 5)) || ((rankAtom ranks 43 == rankAtom ranks 50))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 7)) || ((rankAtom ranks 43 == rankAtom ranks 57))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 8)) || ((rankAtom ranks 43 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 9)) || ((rankAtom ranks 43 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 10)) || ((rankAtom ranks 43 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 11)) || ((rankAtom ranks 43 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 4 && rowBit rows 1 6 12)) || ((rankAtom ranks 43 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 5 && rowBit rows 1 6 7)) || ((rankAtom ranks 50 == rankAtom ranks 57))) &&
    (!((rowBit rows 1 6 5 && rowBit rows 1 6 8)) || ((rankAtom ranks 50 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 5 && rowBit rows 1 6 9)) || ((rankAtom ranks 50 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 5 && rowBit rows 1 6 10)) || ((rankAtom ranks 50 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 5 && rowBit rows 1 6 11)) || ((rankAtom ranks 50 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 5 && rowBit rows 1 6 12)) || ((rankAtom ranks 50 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 7 && rowBit rows 1 6 8)) || ((rankAtom ranks 57 == rankAtom ranks 58))) &&
    (!((rowBit rows 1 6 7 && rowBit rows 1 6 9)) || ((rankAtom ranks 57 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 7 && rowBit rows 1 6 10)) || ((rankAtom ranks 57 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 7 && rowBit rows 1 6 11)) || ((rankAtom ranks 57 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 7 && rowBit rows 1 6 12)) || ((rankAtom ranks 57 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 8 && rowBit rows 1 6 9)) || ((rankAtom ranks 58 == rankAtom ranks 59))) &&
    (!((rowBit rows 1 6 8 && rowBit rows 1 6 10)) || ((rankAtom ranks 58 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 8 && rowBit rows 1 6 11)) || ((rankAtom ranks 58 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 8 && rowBit rows 1 6 12)) || ((rankAtom ranks 58 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 9 && rowBit rows 1 6 10)) || ((rankAtom ranks 59 == rankAtom ranks 60))) &&
    (!((rowBit rows 1 6 9 && rowBit rows 1 6 11)) || ((rankAtom ranks 59 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 9 && rowBit rows 1 6 12)) || ((rankAtom ranks 59 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 10 && rowBit rows 1 6 11)) || ((rankAtom ranks 60 == rankAtom ranks 61))) &&
    (!((rowBit rows 1 6 10 && rowBit rows 1 6 12)) || ((rankAtom ranks 60 == rankAtom ranks 62))) &&
    (!((rowBit rows 1 6 11 && rowBit rows 1 6 12)) || ((rankAtom ranks 61 == rankAtom ranks 62))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 1)) || ((rankAtom ranks 4 == rankAtom ranks 15))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 2)) || ((rankAtom ranks 4 == rankAtom ranks 25))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 3)) || ((rankAtom ranks 4 == rankAtom ranks 34))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 4)) || ((rankAtom ranks 4 == rankAtom ranks 42))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 6)) || ((rankAtom ranks 4 == rankAtom ranks 50))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 7)) || ((rankAtom ranks 4 == rankAtom ranks 51))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 8)) || ((rankAtom ranks 4 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 9)) || ((rankAtom ranks 4 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 10)) || ((rankAtom ranks 4 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 11)) || ((rankAtom ranks 4 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 0 && rowBit rows 2 5 12)) || ((rankAtom ranks 4 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 2)) || ((rankAtom ranks 15 == rankAtom ranks 25))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 3)) || ((rankAtom ranks 15 == rankAtom ranks 34))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 4)) || ((rankAtom ranks 15 == rankAtom ranks 42))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 6)) || ((rankAtom ranks 15 == rankAtom ranks 50))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 7)) || ((rankAtom ranks 15 == rankAtom ranks 51))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 8)) || ((rankAtom ranks 15 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 9)) || ((rankAtom ranks 15 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 10)) || ((rankAtom ranks 15 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 11)) || ((rankAtom ranks 15 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 1 && rowBit rows 2 5 12)) || ((rankAtom ranks 15 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 4)) || ((rankAtom ranks 25 == rankAtom ranks 42))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 6)) || ((rankAtom ranks 25 == rankAtom ranks 50))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 7)) || ((rankAtom ranks 25 == rankAtom ranks 51))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 8)) || ((rankAtom ranks 25 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 9)) || ((rankAtom ranks 25 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 10)) || ((rankAtom ranks 25 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 11)) || ((rankAtom ranks 25 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 2 && rowBit rows 2 5 12)) || ((rankAtom ranks 25 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 4)) || ((rankAtom ranks 34 == rankAtom ranks 42))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 6)) || ((rankAtom ranks 34 == rankAtom ranks 50))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 7)) || ((rankAtom ranks 34 == rankAtom ranks 51))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 8)) || ((rankAtom ranks 34 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 9)) || ((rankAtom ranks 34 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 10)) || ((rankAtom ranks 34 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 11)) || ((rankAtom ranks 34 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 3 && rowBit rows 2 5 12)) || ((rankAtom ranks 34 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 6)) || ((rankAtom ranks 42 == rankAtom ranks 50))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 7)) || ((rankAtom ranks 42 == rankAtom ranks 51))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 8)) || ((rankAtom ranks 42 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 9)) || ((rankAtom ranks 42 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 10)) || ((rankAtom ranks 42 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 11)) || ((rankAtom ranks 42 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 4 && rowBit rows 2 5 12)) || ((rankAtom ranks 42 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 6 && rowBit rows 2 5 7)) || ((rankAtom ranks 50 == rankAtom ranks 51))) &&
    (!((rowBit rows 2 5 6 && rowBit rows 2 5 8)) || ((rankAtom ranks 50 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 6 && rowBit rows 2 5 9)) || ((rankAtom ranks 50 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 6 && rowBit rows 2 5 10)) || ((rankAtom ranks 50 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 6 && rowBit rows 2 5 11)) || ((rankAtom ranks 50 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 6 && rowBit rows 2 5 12)) || ((rankAtom ranks 50 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 7 && rowBit rows 2 5 8)) || ((rankAtom ranks 51 == rankAtom ranks 52))) &&
    (!((rowBit rows 2 5 7 && rowBit rows 2 5 9)) || ((rankAtom ranks 51 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 7 && rowBit rows 2 5 10)) || ((rankAtom ranks 51 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 7 && rowBit rows 2 5 11)) || ((rankAtom ranks 51 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 7 && rowBit rows 2 5 12)) || ((rankAtom ranks 51 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 8 && rowBit rows 2 5 9)) || ((rankAtom ranks 52 == rankAtom ranks 53))) &&
    (!((rowBit rows 2 5 8 && rowBit rows 2 5 10)) || ((rankAtom ranks 52 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 8 && rowBit rows 2 5 11)) || ((rankAtom ranks 52 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 8 && rowBit rows 2 5 12)) || ((rankAtom ranks 52 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 9 && rowBit rows 2 5 10)) || ((rankAtom ranks 53 == rankAtom ranks 54))) &&
    (!((rowBit rows 2 5 9 && rowBit rows 2 5 11)) || ((rankAtom ranks 53 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 9 && rowBit rows 2 5 12)) || ((rankAtom ranks 53 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 10 && rowBit rows 2 5 11)) || ((rankAtom ranks 54 == rankAtom ranks 55))) &&
    (!((rowBit rows 2 5 10 && rowBit rows 2 5 12)) || ((rankAtom ranks 54 == rankAtom ranks 56))) &&
    (!((rowBit rows 2 5 11 && rowBit rows 2 5 12)) || ((rankAtom ranks 55 == rankAtom ranks 56))) &&
    (!((firstRowBit b1 0 && firstRowBit b1 9)) || ((rankAtom ranks 3 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 0 && firstRowBit b1 10)) || ((rankAtom ranks 3 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 9)) || ((rankAtom ranks 14 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 10)) || ((rankAtom ranks 14 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 9)) || ((rankAtom ranks 24 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 10)) || ((rankAtom ranks 24 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 9)) || ((rankAtom ranks 33 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 10)) || ((rankAtom ranks 42 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 9)) || ((rankAtom ranks 43 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 10)) || ((rankAtom ranks 43 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 9)) || ((rankAtom ranks 44 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 10)) || ((rankAtom ranks 44 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 9)) || ((rankAtom ranks 45 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 10)) || ((rankAtom ranks 45 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 10)) || ((rankAtom ranks 46 == rankAtom ranks 47))) &&
    (!((shellBit shell 0 && shellBit shell 1)) || ((rankAtom ranks 7 == rankAtom ranks 18))) &&
    (!((shellBit shell 0 && shellBit shell 2)) || ((rankAtom ranks 7 == rankAtom ranks 28))) &&
    (!((shellBit shell 0 && shellBit shell 3)) || ((rankAtom ranks 7 == rankAtom ranks 37))) &&
    (!((shellBit shell 0 && shellBit shell 4)) || ((rankAtom ranks 7 == rankAtom ranks 45))) &&
    (!((shellBit shell 0 && shellBit shell 5)) || ((rankAtom ranks 7 == rankAtom ranks 52))) &&
    (!((shellBit shell 0 && shellBit shell 6)) || ((rankAtom ranks 7 == rankAtom ranks 58))) &&
    (!((shellBit shell 0 && shellBit shell 7)) || ((rankAtom ranks 7 == rankAtom ranks 63))) &&
    (!((shellBit shell 1 && shellBit shell 2)) || ((rankAtom ranks 18 == rankAtom ranks 28))) &&
    (!((shellBit shell 1 && shellBit shell 3)) || ((rankAtom ranks 18 == rankAtom ranks 37))) &&
    (!((shellBit shell 1 && shellBit shell 4)) || ((rankAtom ranks 18 == rankAtom ranks 45))) &&
    (!((shellBit shell 1 && shellBit shell 5)) || ((rankAtom ranks 18 == rankAtom ranks 52))) &&
    (!((shellBit shell 1 && shellBit shell 6)) || ((rankAtom ranks 18 == rankAtom ranks 58))) &&
    (!((shellBit shell 1 && shellBit shell 7)) || ((rankAtom ranks 18 == rankAtom ranks 63))) &&
    (!((shellBit shell 1 && shellBit shell 9)) || ((rankAtom ranks 18 == rankAtom ranks 68))) &&
    (!((shellBit shell 1 && shellBit shell 10)) || ((rankAtom ranks 18 == rankAtom ranks 69))) &&
    (!((shellBit shell 1 && shellBit shell 11)) || ((rankAtom ranks 18 == rankAtom ranks 70))) &&
    (!((shellBit shell 1 && shellBit shell 12)) || ((rankAtom ranks 18 == rankAtom ranks 71))) &&
    (!((shellBit shell 2 && shellBit shell 3)) || ((rankAtom ranks 28 == rankAtom ranks 37))) &&
    (!((shellBit shell 2 && shellBit shell 4)) || ((rankAtom ranks 28 == rankAtom ranks 45))) &&
    (!((shellBit shell 2 && shellBit shell 5)) || ((rankAtom ranks 28 == rankAtom ranks 52))) &&
    (!((shellBit shell 2 && shellBit shell 6)) || ((rankAtom ranks 28 == rankAtom ranks 58))) &&
    (!((shellBit shell 2 && shellBit shell 7)) || ((rankAtom ranks 28 == rankAtom ranks 63))) &&
    (!((shellBit shell 2 && shellBit shell 9)) || ((rankAtom ranks 28 == rankAtom ranks 68))) &&
    (!((shellBit shell 2 && shellBit shell 10)) || ((rankAtom ranks 28 == rankAtom ranks 69))) &&
    (!((shellBit shell 2 && shellBit shell 11)) || ((rankAtom ranks 28 == rankAtom ranks 70))) &&
    (!((shellBit shell 2 && shellBit shell 12)) || ((rankAtom ranks 28 == rankAtom ranks 71))) &&
    (!((shellBit shell 3 && shellBit shell 4)) || ((rankAtom ranks 37 == rankAtom ranks 45))) &&
    (!((shellBit shell 3 && shellBit shell 5)) || ((rankAtom ranks 37 == rankAtom ranks 52))) &&
    (!((shellBit shell 3 && shellBit shell 6)) || ((rankAtom ranks 37 == rankAtom ranks 58))) &&
    (!((shellBit shell 3 && shellBit shell 7)) || ((rankAtom ranks 37 == rankAtom ranks 63))) &&
    (!((shellBit shell 3 && shellBit shell 9)) || ((rankAtom ranks 37 == rankAtom ranks 68))) &&
    (!((shellBit shell 3 && shellBit shell 10)) || ((rankAtom ranks 37 == rankAtom ranks 69))) &&
    (!((shellBit shell 3 && shellBit shell 11)) || ((rankAtom ranks 37 == rankAtom ranks 70))) &&
    (!((shellBit shell 3 && shellBit shell 12)) || ((rankAtom ranks 37 == rankAtom ranks 71))) &&
    (!((shellBit shell 4 && shellBit shell 9)) || ((rankAtom ranks 45 == rankAtom ranks 68))) &&
    (!((shellBit shell 4 && shellBit shell 11)) || ((rankAtom ranks 45 == rankAtom ranks 70))) &&
    (!((shellBit shell 4 && shellBit shell 12)) || ((rankAtom ranks 45 == rankAtom ranks 71))) &&
    (!((shellBit shell 5 && shellBit shell 7)) || ((rankAtom ranks 52 == rankAtom ranks 63))) &&
    (!((shellBit shell 5 && shellBit shell 9)) || ((rankAtom ranks 52 == rankAtom ranks 68))) &&
    (!((shellBit shell 5 && shellBit shell 10)) || ((rankAtom ranks 52 == rankAtom ranks 69))) &&
    (!((shellBit shell 5 && shellBit shell 11)) || ((rankAtom ranks 52 == rankAtom ranks 70))) &&
    (!((shellBit shell 5 && shellBit shell 12)) || ((rankAtom ranks 52 == rankAtom ranks 71))) &&
    (!((shellBit shell 6 && shellBit shell 7)) || ((rankAtom ranks 58 == rankAtom ranks 63))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 1))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 12).ult (rankAtom ranks 1))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 7).ult (rankAtom ranks 1))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 13).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 13).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 13).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 37).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 0).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 13).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 14).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 14).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 14).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 0).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 14).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 0).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 9)) || ((rankAtom ranks 14).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 0).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 14).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 0).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 14).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 50).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 15).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 5).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 51).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 15).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 6).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 52).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 53).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 15).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 54).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 15).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 55).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 15).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 56).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 15).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 16).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 58).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 7).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 59).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 16).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 60).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 16).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 61).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 16).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 62).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 0).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 16).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 17).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 65).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 17).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 66).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 17).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 67).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 17).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 8).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 9).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 11).ult (rankAtom ranks 22))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 4).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 23).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 5).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 23).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 6).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 37).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 1).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 2 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 23).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 2))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 1).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 1).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 24).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 24).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 1).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 7).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 1).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 24).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 1).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 1).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 24).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 1).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 24).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 50).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 25).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 51).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 1).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 25).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 52).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 53).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 1).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 25).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 54).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 1).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 25).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 55).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 1).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 25).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 56).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 1).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 25).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 1).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 26).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 6).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 58).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 59).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 1).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 26).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 60).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 1).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 26).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 61).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 1).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 26).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 62).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 1).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 26).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 1).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 27).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 65).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 27).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 66).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 27).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 67).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 27).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 8).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 9).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 10).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 11).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 33).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 33).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 33).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 6).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 33).ult (rankAtom ranks 3))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 2).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 2).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 2).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 2).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 50).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 34).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 51).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 2).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 34).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 6).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 52).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 7).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 53).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 2).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 34).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 54).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 2).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 34).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 55).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 2).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 34).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 56).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 2).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 34).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 57).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 2).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 35).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 6).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 58).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 59).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 2).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 35).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 60).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 2).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 35).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 61).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 2).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 35).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 62).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 2).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 35).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 36).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 36).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 66).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 36).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 67).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 36).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 8).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 9).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 10).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 11).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 8 == rankAtom ranks 9)) || ((rankAtom ranks 38).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 8 == rankAtom ranks 10)) || ((rankAtom ranks 38).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 39).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 39).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 40).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 51).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 3).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 42).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 3).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 7).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 3).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 8).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 3).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 42).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 3).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 3).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 4))) &&
    (!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 42).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 57).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 3).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 43).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 58).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 3).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 7).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 3).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 43).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 3).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 43).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 3).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 43).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 3).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 43).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 11).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 63).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 44).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 8).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 65).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 44).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 9).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 44).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 44).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 68).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 45).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 8).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 69).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 45).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 9).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 70).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 45).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 71).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 11).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 9).ult (rankAtom ranks 8))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 10).ult (rankAtom ranks 8))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 11).ult (rankAtom ranks 8))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 47).ult (rankAtom ranks 9))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 10).ult (rankAtom ranks 9))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 11).ult (rankAtom ranks 9))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 11).ult (rankAtom ranks 10))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 57).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 4).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 58).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 4).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 59).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 4).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 50).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 4).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 50).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 9).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 4).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 50).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 10).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 4).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 5))) &&
    (!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 50).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 4).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 5).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 57).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 34).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 15).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 35).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 16).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 36).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 17).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 23).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 38).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 39).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 40).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 41).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 46).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 12).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 47).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 12).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 48).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 12).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 49).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 50).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 16).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 12).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 51).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 17).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 52).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 25).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 18).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 12).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 53).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 12).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 54).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 12).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 55).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 12).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 12).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 57).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 17).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 58).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 12).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 26).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 18).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 12).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 59).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 12).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 60).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 12).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 61).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 12).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 63).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 12).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 27).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 18).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 64).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 65).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 66).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 67).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 68).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 12).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 69).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 12).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 20).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 70).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 12).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 21).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 71).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 12).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 22).ult (rankAtom ranks 32))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 13).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 13).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 13).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 33).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 13).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 13).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 13).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 13).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 16).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 13).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 34).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 13).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 13).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 13).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 13).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 13).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 35).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 18).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 13).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 13).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 13).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 13).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 13).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 36).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 13).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 19).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 13).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 20).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 13).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 21).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 13).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 22).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 16)) || ((rankAtom ranks 42).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 14).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 17).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 14).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 18).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 42).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 53).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 14).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 54).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 14).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 20).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 55).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 14).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 21).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 56).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 14).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 17).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 14).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 18).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 43).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 59).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 14).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 60).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 20).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 61).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 21).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 14).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 62).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 22).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 44).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 64).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 19).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 65).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 20).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 66).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 21).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 67).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 69).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 70).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 14).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 71).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 20).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 21).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 22).ult (rankAtom ranks 19))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 21).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 22).ult (rankAtom ranks 20))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 22).ult (rankAtom ranks 21))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 15).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 15)) || ((rankAtom ranks 57).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 15).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 15).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 15)) || ((rankAtom ranks 59).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 15).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 60).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 20).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 15).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 61).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 21).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 15).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 62).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 15).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 51).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 18).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 19).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 65).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 67).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 15).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 15).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 15).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 15).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 63)) || ((rankAtom ranks 16).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 18)) || ((rankAtom ranks 57).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 18).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 16)) || ((rankAtom ranks 64).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 19).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 16)) || ((rankAtom ranks 65).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 66).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 67).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 16).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 19).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 16).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 20).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 16).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 18))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 16).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 17).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 19).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 17).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 20).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 17).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 21).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 17).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 24))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 24))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 23).ult (rankAtom ranks 24))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 44)) || ((rankAtom ranks 23).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 45).ult (rankAtom ranks 24))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 23).ult (rankAtom ranks 24))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 33).ult (rankAtom ranks 24))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 46)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 47)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 48)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 24 == rankAtom ranks 49)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 34).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 26).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 51).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 23).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 34).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 53).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 34).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 54).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 55).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 56).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 34).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 57).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 23).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 35).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 59).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 35).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 60).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 35).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 61).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 35).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 62).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 35).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 23).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 64).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 36).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 65).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 36).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 66).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 36).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 67).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 36).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 30).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 31).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 32).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 38).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 38).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 38).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 39).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 39).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 40).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 24)) || ((rankAtom ranks 50).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 42).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 24).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 24).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 43).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 24).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 43).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 44).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 44).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 32).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 45).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 69).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 45).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 70).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 45).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 71).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 30).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 31).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 32).ult (rankAtom ranks 29))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 31).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 32).ult (rankAtom ranks 30))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 32).ult (rankAtom ranks 31))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 50).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 25).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 50).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 25).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 50).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 25).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 50).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 25).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 32).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 25).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 26).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 29).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 30).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 31).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 27).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 32).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 33).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 52)) || ((rankAtom ranks 33).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 54).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 33).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 61).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 62).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 44).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 64).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 38).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 65).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 39).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 66).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 40).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 67).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 41).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 71).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 39).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 40).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 41).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 40).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 41).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 41).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 34).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 34)) || ((rankAtom ranks 57).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 59)) || ((rankAtom ranks 34).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 34)) || ((rankAtom ranks 59).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 60)) || ((rankAtom ranks 34).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 61)) || ((rankAtom ranks 34).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 62)) || ((rankAtom ranks 34).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 63).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 34).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 51).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 37).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 38).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 65).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 39).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 66).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 40).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 67).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 41).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 34).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 34).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 34).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 34).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 35)) || ((rankAtom ranks 63).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 37)) || ((rankAtom ranks 57).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 37).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 35)) || ((rankAtom ranks 64).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 38).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 35)) || ((rankAtom ranks 65).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 39).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 66).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 40).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 67).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 41).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 35).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 35).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 35).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 35).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 36).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 38).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 39).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 36).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 40).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 36).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 41).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 57)) || ((rankAtom ranks 42).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 44)) || ((rankAtom ranks 50).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 58)) || ((rankAtom ranks 42).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 45)) || ((rankAtom ranks 50).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 46).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 45).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 46).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 47).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 48).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 57).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 49).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 43).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 58).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 46).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 58).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 47).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 70)) || ((rankAtom ranks 43).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 58).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 48).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 43).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 58).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 49).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 59).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 59).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 59).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 49).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 60).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 60).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 49).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 61).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 49).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 44).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 63).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 63).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 63).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 44).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 63).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 64).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 64).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 64).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 65).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 65).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 66).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 68).ult (rankAtom ranks 69))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 68).ult (rankAtom ranks 70))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 68).ult (rankAtom ranks 71))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 49).ult (rankAtom ranks 71))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 69).ult (rankAtom ranks 70))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 69).ult (rankAtom ranks 71))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 70).ult (rankAtom ranks 71))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 52)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 53)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 54)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 55)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 55).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 56)) || ((rankAtom ranks 57).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 51))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 58).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 58).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 54).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 58).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 55).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 58).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 68)) || ((rankAtom ranks 51).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 63).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 53).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 69).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 69)) || ((rankAtom ranks 51).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 63).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 70)) || ((rankAtom ranks 51).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 63).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 71)) || ((rankAtom ranks 51).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 63).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 56).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 59)) || ((rankAtom ranks 63).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 69).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 60)) || ((rankAtom ranks 63).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 61)) || ((rankAtom ranks 63).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 62)) || ((rankAtom ranks 63).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 65).ult (rankAtom ranks 69)))) = false := by
  bv_decide? (config := { maxSteps := 100000000, timeout := 600 })

end Problem97.ATailExactFiveCard13BVCubeLeaf
