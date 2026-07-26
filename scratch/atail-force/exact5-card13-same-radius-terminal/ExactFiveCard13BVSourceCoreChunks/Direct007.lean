/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct007 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((firstRowBit b1 0 && firstRowBit b1 11)) || ((rankAtom ranks 3 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 0 && firstRowBit b1 12)) || ((rankAtom ranks 3 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 9)) || ((rankAtom ranks 14 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 10)) || ((rankAtom ranks 14 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 11)) || ((rankAtom ranks 14 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 12)) || ((rankAtom ranks 14 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 6)) || ((rankAtom ranks 24 == rankAtom ranks 43))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 9)) || ((rankAtom ranks 24 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 10)) || ((rankAtom ranks 24 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 11)) || ((rankAtom ranks 24 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 12)) || ((rankAtom ranks 24 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 9)) || ((rankAtom ranks 33 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 10)) || ((rankAtom ranks 33 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 11)) || ((rankAtom ranks 33 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 12)) || ((rankAtom ranks 33 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 9)) || ((rankAtom ranks 42 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 10)) || ((rankAtom ranks 42 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 11)) || ((rankAtom ranks 42 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 12)) || ((rankAtom ranks 42 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 9)) || ((rankAtom ranks 43 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))

@[bv_normalize]
theorem direct007_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct007 rows blockers shell q w b1 ranks = ((!((rowBit rows 2 5 2 && rowBit rows 2 5 8)) || ((rankAtom ranks 25 == rankAtom ranks 52))) &&
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
    (!((firstRowBit b1 0 && firstRowBit b1 11)) || ((rankAtom ranks 3 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 0 && firstRowBit b1 12)) || ((rankAtom ranks 3 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 9)) || ((rankAtom ranks 14 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 10)) || ((rankAtom ranks 14 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 11)) || ((rankAtom ranks 14 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 1 && firstRowBit b1 12)) || ((rankAtom ranks 14 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 6)) || ((rankAtom ranks 24 == rankAtom ranks 43))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 9)) || ((rankAtom ranks 24 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 10)) || ((rankAtom ranks 24 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 11)) || ((rankAtom ranks 24 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 2 && firstRowBit b1 12)) || ((rankAtom ranks 24 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 9)) || ((rankAtom ranks 33 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 10)) || ((rankAtom ranks 33 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 11)) || ((rankAtom ranks 33 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 3 && firstRowBit b1 12)) || ((rankAtom ranks 33 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 9)) || ((rankAtom ranks 42 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 10)) || ((rankAtom ranks 42 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 11)) || ((rankAtom ranks 42 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 5 && firstRowBit b1 12)) || ((rankAtom ranks 42 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 9)) || ((rankAtom ranks 43 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
