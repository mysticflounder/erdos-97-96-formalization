/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct005 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rowBit rows 0 4 0 && rowBit rows 0 4 9)) || ((rankAtom ranks 3 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 10)) || ((rankAtom ranks 3 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 11)) || ((rankAtom ranks 3 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 12)) || ((rankAtom ranks 3 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 9)) || ((rankAtom ranks 14 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 10)) || ((rankAtom ranks 14 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 11)) || ((rankAtom ranks 14 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 12)) || ((rankAtom ranks 14 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 9)) || ((rankAtom ranks 24 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 10)) || ((rankAtom ranks 24 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 11)) || ((rankAtom ranks 24 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 12)) || ((rankAtom ranks 24 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 10)) || ((rankAtom ranks 33 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 11)) || ((rankAtom ranks 33 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 12)) || ((rankAtom ranks 33 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 9)) || ((rankAtom ranks 42 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 10)) || ((rankAtom ranks 42 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 11)) || ((rankAtom ranks 42 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 12)) || ((rankAtom ranks 42 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 9)) || ((rankAtom ranks 43 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 10)) || ((rankAtom ranks 43 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 11)) || ((rankAtom ranks 43 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 12)) || ((rankAtom ranks 43 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 9)) || ((rankAtom ranks 44 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 10)) || ((rankAtom ranks 44 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 11)) || ((rankAtom ranks 44 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 12)) || ((rankAtom ranks 44 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 9)) || ((rankAtom ranks 45 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 10)) || ((rankAtom ranks 45 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 11)) || ((rankAtom ranks 45 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 12)) || ((rankAtom ranks 45 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 10)) || ((rankAtom ranks 46 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 11)) || ((rankAtom ranks 46 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 12)) || ((rankAtom ranks 46 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 10 && rowBit rows 0 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 10 && rowBit rows 0 4 12)) || ((rankAtom ranks 47 == rankAtom ranks 49))) &&
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
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 8)) || ((rankAtom ranks 26 == rankAtom ranks 58)))

@[bv_normalize]
theorem direct005_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct005 rows blockers shell q w b1 ranks = ((!((rowBit rows 0 4 0 && rowBit rows 0 4 9)) || ((rankAtom ranks 3 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 10)) || ((rankAtom ranks 3 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 11)) || ((rankAtom ranks 3 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 0 && rowBit rows 0 4 12)) || ((rankAtom ranks 3 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 9)) || ((rankAtom ranks 14 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 10)) || ((rankAtom ranks 14 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 11)) || ((rankAtom ranks 14 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 1 && rowBit rows 0 4 12)) || ((rankAtom ranks 14 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 9)) || ((rankAtom ranks 24 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 10)) || ((rankAtom ranks 24 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 11)) || ((rankAtom ranks 24 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 2 && rowBit rows 0 4 12)) || ((rankAtom ranks 24 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 10)) || ((rankAtom ranks 33 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 11)) || ((rankAtom ranks 33 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 3 && rowBit rows 0 4 12)) || ((rankAtom ranks 33 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 9)) || ((rankAtom ranks 42 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 10)) || ((rankAtom ranks 42 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 11)) || ((rankAtom ranks 42 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 5 && rowBit rows 0 4 12)) || ((rankAtom ranks 42 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 9)) || ((rankAtom ranks 43 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 10)) || ((rankAtom ranks 43 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 11)) || ((rankAtom ranks 43 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 6 && rowBit rows 0 4 12)) || ((rankAtom ranks 43 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 9)) || ((rankAtom ranks 44 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 10)) || ((rankAtom ranks 44 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 11)) || ((rankAtom ranks 44 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 7 && rowBit rows 0 4 12)) || ((rankAtom ranks 44 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 9)) || ((rankAtom ranks 45 == rankAtom ranks 46))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 10)) || ((rankAtom ranks 45 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 11)) || ((rankAtom ranks 45 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 8 && rowBit rows 0 4 12)) || ((rankAtom ranks 45 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 10)) || ((rankAtom ranks 46 == rankAtom ranks 47))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 11)) || ((rankAtom ranks 46 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 9 && rowBit rows 0 4 12)) || ((rankAtom ranks 46 == rankAtom ranks 49))) &&
    (!((rowBit rows 0 4 10 && rowBit rows 0 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48))) &&
    (!((rowBit rows 0 4 10 && rowBit rows 0 4 12)) || ((rankAtom ranks 47 == rankAtom ranks 49))) &&
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
    (!((rowBit rows 1 6 2 && rowBit rows 1 6 8)) || ((rankAtom ranks 26 == rankAtom ranks 58)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
