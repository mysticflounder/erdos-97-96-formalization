/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct016 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))

@[bv_normalize]
theorem direct016_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct016 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 46).ult (rankAtom ranks 14))) &&
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
    (!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
