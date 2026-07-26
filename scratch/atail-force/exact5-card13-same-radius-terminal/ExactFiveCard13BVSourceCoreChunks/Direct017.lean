/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct017 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
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
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 22).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))

@[bv_normalize]
theorem direct017_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct017 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 22).ult (rankAtom ranks 32))) &&
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
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 22).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
