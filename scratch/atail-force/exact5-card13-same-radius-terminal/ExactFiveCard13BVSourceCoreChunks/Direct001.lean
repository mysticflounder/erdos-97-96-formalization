/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct001 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    !((rowBit rows 2 5 8 && rowBit rows 2 5 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))

@[bv_normalize]
theorem direct001_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct001 rows blockers shell q w b1 ranks = (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12)) &&
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
    !((rowBit rows 2 5 8 && rowBit rows 2 5 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
