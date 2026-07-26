/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct009 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))

@[bv_normalize]
theorem direct009_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct009 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 12).ult (rankAtom ranks 1))) &&
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
    (!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
