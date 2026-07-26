/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct010 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))

@[bv_normalize]
theorem direct010_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct010 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 11).ult (rankAtom ranks 22))) &&
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
    (!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
