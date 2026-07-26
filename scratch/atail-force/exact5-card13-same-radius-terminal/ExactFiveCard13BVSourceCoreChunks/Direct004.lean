/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct004 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((rowBit rows 0 2 11 && rowBit rows 0 2 12)) || ((rankAtom ranks 31 == rankAtom ranks 32)))

@[bv_normalize]
theorem direct004_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct004 rows blockers shell q w b1 ranks = ((!((rowBit rows 0 0 5 && rowBit rows 0 0 7)) || ((rankAtom ranks 4 == rankAtom ranks 6))) &&
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
    (!((rowBit rows 0 2 11 && rowBit rows 0 2 12)) || ((rankAtom ranks 31 == rankAtom ranks 32)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
