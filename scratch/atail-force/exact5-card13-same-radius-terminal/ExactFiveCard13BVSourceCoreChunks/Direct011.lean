/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct011 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))

@[bv_normalize]
theorem direct011_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct011 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 5))) &&
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
    (!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
